
--make sure all tables are empty
truncate table bikedatastations;
truncate table bikedatastationss;
truncate table bikedatastationse;

--get list of starting stations and their count of trips starting at this station
insert into bikedatastationss(stationid, yyyy,mm,yyyymm,countoftripsstartinghere, countoftripsendinghere)
select 
startstationid as StationID
, to_char(starttime, 'YYYY') as YYYY
, to_char(starttime, 'MM') as MM
, to_char(starttime,'YYYY-mm')  as YYYYMM
, count(TripID) as CountTripsStartingHere
, 0 as CountTripsEndingHere 
from BikeData_stage
group by 
startstationid
, to_char(starttime, 'YYYY') 
, to_char(starttime, 'MM')
, to_char(starttime,'YYYY-mm')  

--get list of ending stations and their count of trips ending at this station	 
insert into bikedatastationse(stationid, yyyy,mm,yyyymm,countoftripsstartinghere, countoftripsendinghere)
select 
endstationid as StationID
, to_char(starttime, 'YYYY') as YYYY
, to_char(starttime, 'MM') as MM
, to_char(starttime,'YYYY-mm')  as YYYYMM
, 0 as CountTripsStartingHere
, count(TripID) as CountTripsEndingHere 

from BikeData_stage
group by 
endstationid
, to_char(starttime, 'YYYY') 
, to_char(starttime, 'MM') 
, to_char(starttime,'YYYY-mm')  

/*
--check that there is one row per stationid,yyyymm

select stationid,yyyymm
from bikedatastationss
group by stationid,yyyymm
having count(*)> 1;

select stationid,yyyymm
from bikedatastationse
group by stationid,yyyymm
having count(*)> 1;
*/

--get 1 stationname/lat/long for each stationid for each month in the dataset
--join to the starting station table and ending station table to get the count of trips for start/end
insert into bikedatastations(stationid, StationLatitude,StationLongitude,stationname,yyyy,mm,yyyymm,CountOfTripsStartingHere, CountOfTripsEndingHere)
select m.Stationid, m.StationLatitude,m.StationLongitude,m.StationName,m.yyyy,m.mm,m.yyyymm,coalesce(st.CountOfTripsStartingHere,0),coalesce(se.CountOfTripsEndingHere,0)
from
(
	select *
	from 
	(
	select startstationid as StationID
	, min(startstationlatitude) as StationLatitude
	, min(startstationlongitude) as StationLongitude
	, min(startstationname) as StationName	
	from bikedata_stage as s
	group by startstationid
	union
	select endstationid as StationID
	, min(endstationlatitude) as StationLatitude
	, min(endstationlongitude) as StationLongitude
	, min(endstationname) as StationName	
	from bikedata_stage as s
	group by endstationid ) as stations,

	(
	select 
	to_char(starttime, 'YYYY') as YYYY
	, to_char(starttime, 'MM') as MM
	, to_char(starttime,'YYYY-mm')  as YYYYMM
	from bikedata_stage
	group by 
		to_char(starttime, 'YYYY') 
	, to_char(starttime, 'MM')
	, to_char(starttime,'YYYY-mm') 
	) as Dates
) as M
left join bikedatastationss as st on m.stationid = st.stationid and m.yyyy = st.yyyy and m.mm = st.mm and m.yyyymm = st.yyyymm
left join bikedatastationse as se on m.stationid = se.stationid and m.yyyy = se.yyyy and m.mm = se.mm and m.yyyymm = se.yyyymm

--delete station/month combos where there was no trip starting/ending at the station
delete
from bikedatastations 
where CountOfTripsStartingHere = 0 and CountOfTripsEndingHere = 0


