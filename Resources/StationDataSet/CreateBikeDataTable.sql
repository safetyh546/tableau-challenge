
drop table if exists BikeData_stage;
drop table if exists BikeDataStations;
drop table if exists BikeDataStationss;
drop table if exists BikeDataStationse;



CREATE TABLE BikeData_stage (
	TripID int
   ,  tripduration int
   , starttime timestamp	
   , stoptime timestamp 
   , StartStationID int
   , StartStationName  VARCHAR(1000)  
   , StartStationLatitude numeric
   , StartStationLongitude numeric
  , EndStationID int
   , EndStationName  VARCHAR(1000)  
   , EndStationLatitude numeric
   , EndStationLongitude numeric
   , bikeid int
   , usertype varchar(500)
   , birthyear int
   , gender int
 );
 

CREATE TABLE BikeDataStations (
     StationID int
   , StationName varchar(1000)
   , StationLatitude numeric
   , StationLongitude numeric
   , YYYY varchar(4)
   , MM varchar(2)
   , YYYYMM varchar(7)
   , CountOfTripsStartingHere int
   , CountOfTripsEndingHere int
 );
 
 
CREATE TABLE BikeDataStationsS (
     StationID int
   , StationName varchar(1000)
   , StationLatitude numeric
   , StationLongitude numeric
   , YYYY varchar(4)
   , MM varchar(2)
   , YYYYMM varchar(7)
   , CountOfTripsStartingHere int
   , CountOfTripsEndingHere int
 );
 
 
CREATE TABLE BikeDataStationsE (
     StationID int
   , StationName varchar(1000)
   , StationLatitude numeric
   , StationLongitude numeric
   , YYYY varchar(4)
   , MM varchar(2)
   , YYYYMM varchar(7)
   , CountOfTripsStartingHere int
   , CountOfTripsEndingHere int
 ); 