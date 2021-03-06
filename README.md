## Tableau Workbook
1) TableauChallenge.twbx  Tableau workbook with Story and Dashboards identifying key trends <br />
2) Link to Tableau public version of the file - https://public.tableau.com/views/TableauChallenge_16205370254260/CityBikeTrendStory?:language=en&:display_count=y&publish=yes&:origin=viz_share_link <br />
3) Tableau workbook includes:<br />
- 4-10 Total "Phenomenon" Visualizations
- 3 Dashboards - FemaleRidershipDashboard,UserTypeDashboard, and StationUsageDashboard
- 1 City Official Map - Map of Start/End Stations and StationUsageDashboard
- 1 Story - CityBike Trend Story

## Original data source
1) https://www.citibikenyc.com/system-data

## Key Files in this repository
1) TableauChallenge.twbx  Tableau workbook with Story and Dashboards identifying key trends <br />
2) CombineCsvFiles.ipynb jupyter notebook used to combine monthly files into Resources\BikeDataCombined.csv that is too big to push to GitHub<br />
3) Resources\*.csv monthly csv files and a combined dataset of all monthly files <br />
4) Resources\StationDataSet\CreateBikeDataTable.sql - create postgresSQL tables to hold station dataset for City Official map<br />
5) Resources\StationDataSet\InsertIntoStationTables.sql - Insert into BikeDataStations table to be exported into csv for review in tableau<br />
6) Resources\StationDataSet\BikeStationDataset - by station by month totals csv file for analysis in Tableau<br />


## CitiBike Phenomena Discovered- 
High Level -  Total trips overall 2019 to 2020 are down 16%.  This is expected due to Covid but trips seem to be recovering Summer/end of 2020<br /><br />
1) Subscriber levels dropped in 2020 - Summer appears to have more non subscriber usage in both years.  This could be caused by tourists and expected recreational use in summer.  We see the subscriber percentage higher in winter months (around 80% subscriber 2019 verus > 90% subscriber in 2020). In spring/summer 2020 however, we saw a more pronounced drop in subscriber usage.  Summer in 2019 we see roughly 80% some percent of trips were by subscribers.  In summer 2020 that dropped to around 50%.  This is likely due to covid19 more than true changes in user model.  We see the percentage of subscribers ticking back up closer to 2019 levels towards end of 2020 (December 2020 at 80% subscriber trips versus December 2019 at 93% subscriber trips).  See UserTypeDashboard for key visualizations. <br /><br />
2) Female ridership may be increasing - Over the period evaluated from 2019 through 2020, females took 19-24% of trips in 2019 versus a range of 21% to almost 27% of trips in 2020.  While it???s hard to tell if this is a true trend, it appears to be moving in the direction of increased female ridership.  It also appears that female proportion of trips peaks in summer months.  This may indicate they are more recreational users.  One additional trend we see in gender analysis is an increase in trips with unknown gender.  We do not know if this is a data issue where users were not able to provide the information or if more and more people are not considering themselves male or female and have no other options but to select Unknown.  Around 20% of trips in summer 2020 had gender as unknown versus roughly half that in 2019.  See FemaleRidershipDashboard for key visualizations.<br /><br />
3) Trips are less congregated at Grove St Path station in 2020 - In evaluating changes in Station usage, I focused on one of the busiest months and compared year over year, August 2019 to August 2020. In focusing on August, we see station usage is more spread out in August 2020 than in August 2019.  Most used station Grove St Path had far less of a percentage of total trips in 2020, with only 2581 trips starting there and 2836 trips ending there.  This is down from previous  year with 5463 trips starting there and 6680 trips ending there.  While we see this drop at Grove St Path, we see increases at other stations like Newport Parkway that doubled usage from around 1500 starting/ending trips in 2019 to around 3000 starting/ending trips in 2020.  Other stations that saw similar growth are Liberty Rail (around 1000 in 2019 and close to 2500 in 2020), JC Medical Center (around 900 in 2020 and around 1700 in 2020).  This trend is not limited to August, overall 2020 saw a similar trend.  Grove Street Path having 22,930 trip starts in 2020 versus 46,662 trips starts in 2019.  See StationUsageDashboard for map that can be filtered by year or month.<br /><br />
