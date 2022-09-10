use covid_db;

CREATE TABLE IF NOT EXISTS covid_db.covid_staging 
(
 Country STRING,
 Total_Cases DOUBLE,
 New_Cases DOUBLE,
 Total_Deaths DOUBLE,
 New_Deaths DOUBLE,
 Total_Recovered DOUBLE,
 Active_Cases DOUBLE,
 Serious DOUBLE,
 Tot_Cases DOUBLE,
 Deaths DOUBLE,
 Total_Tests DOUBLE,
 Tests DOUBLE,
 CASES_per_Test DOUBLE,
 Death_in_Closed_Cases STRING,
 Rank_by_Testing_rate DOUBLE,
 Rank_by_Death_rate DOUBLE,
 Rank_by_Cases_rate DOUBLE,
 Rank_by_Death_of_Closed_Cases DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED by '\t'
STORED as TEXTFILE
tblproperties ("skip.header.line.count"="1");

LOAD DATA INPATH '/user/cloudera/data/COVID_HDFS_LZ/covid-19.csv'
INTO TABLE covid_db.covid_staging;
