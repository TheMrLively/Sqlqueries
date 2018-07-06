
-- NOTE: Before running this script you need to update have weather_anomalies_2004-2013.csv
-- on your machine AND you need to point the script to its 
-- location by filling in [your filepath] at the end of this script!

-- The original source of the data is enigma.io
BEGIN;

CREATE SCHEMA IF NOT EXISTS da_auto;

CREATE TABLE IF NOT EXISTS da_auto.auto_2016(rank INT, company TEXT, country TEXT, vehicles DECIMAL);
CREATE TABLE IF NOT EXISTS da_auto.auto_2015(rank INT, company TEXT, country TEXT, vehicles DECIMAL);
CREATE TABLE IF NOT EXISTS da_auto.auto_2014(rank INT, company TEXT, country TEXT, Total DECIMAL
    , Cars DECIMAL, LCV DECIMAL, HCV DECIMAL, Buses DECIMAL);
CREATE TABLE IF NOT EXISTS da_auto.auto_2013(rank INT, company TEXT, country TEXT, Total DECIMAL
    , Cars DECIMAL, LCV DECIMAL, HCV DECIMAL, Buses DECIMAL);
CREATE TABLE IF NOT EXISTS da_auto.auto_2012(rank INT, company TEXT, country TEXT, Total DECIMAL
    , Cars DECIMAL, LCV DECIMAL, HCV DECIMAL, Buses DECIMAL);

DELETE FROM da_auto.auto_2016;
DELETE FROM da_auto.auto_2015;
DELETE FROM da_auto.auto_2014;
DELETE FROM da_auto.auto_2013;
DELETE FROM da_auto.auto_2012;

COPY da_auto.auto_2016(rank, company, country, vehicles)
FROM 'C:/Users/blindsey/downloads/2016_auto.csv'  
DELIMITER ','
CSV HEADER;                   

COPY da_auto.auto_2015(rank, company, country, vehicles)
FROM 'C:/Users/blindsey/downloads/2015_auto.csv'  
DELIMITER ','
CSV HEADER;

COPY da_auto.auto_2014(rank, company, country, Total
    , Cars , LCV, HCV, Buses)
FROM 'C:/Users/blindsey/downloads/2014_auto.csv'  
DELIMITER ','
CSV HEADER;

COPY da_auto.auto_2013(rank, company, country, Total
    , Cars , LCV, HCV, Buses)
FROM 'C:/Users/blindsey/downloads/2013_auto.csv'  
DELIMITER ','
CSV HEADER;


COPY da_auto.auto_2012(rank, company, country, Total
    , Cars , LCV, HCV, Buses)
FROM 'C:/Users/blindsey/downloads/2012_auto.csv'  
DELIMITER ','
CSV HEADER;

COMMIT;

SELECT * From da_auto.auto_2012;

create_and_load_auto_brand_rank.sql
Displaying create_and_load_auto_brand_rank.sql.