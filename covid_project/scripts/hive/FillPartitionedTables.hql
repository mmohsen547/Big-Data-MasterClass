set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=1000;
set mapreduce.map.memory.mb=3072;
set mapreduce.reduce.memory.mb=3072;

USE covid_db;

FROM
covid_db.covid_staging
INSERT OVERWRITE TABLE covid_db.covid_ds_partitioned PARTITION(COUNTRY_NAME)
SELECT *, Country WHERE Country is not null;

FROM
covid_db.covid_ds_partitioned
INSERT INTO TABLE covid_db.covid_final_output PARTITION(COUNTRY_NAME)
SELECT Deaths, Tests, Country;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/covid_project/output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
SELECT * FROM covid_db.covid_final_output;


