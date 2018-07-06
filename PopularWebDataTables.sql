-- NOTE: Before running this script you need to download the csv files in the COPY statements
-- on your machine AND you need to point the script to its 
-- location by filling in [your filepath] at the end of this script!

BEGIN;

CREATE SCHEMA IF NOT EXISTS da_popular_web;

CREATE TABLE IF NOT EXISTS da_popular_web.fast_food(website TEXT, "2016-11-01" BIGINT
	, "2016-12-01" BIGINT, "2017-01-01" BIGINT, "2017-02-01" BIGINT, "2017-03-01" BIGINT, "2017-04-01" BIGINT);
CREATE TABLE IF NOT EXISTS da_popular_web.news(website TEXT, "2016-11-01" BIGINT
	, "2016-12-01" BIGINT, "2017-01-01" BIGINT, "2017-02-01" BIGINT, "2017-03-01" BIGINT, "2017-04-01" BIGINT);
CREATE TABLE IF NOT EXISTS da_popular_web.search(website TEXT, "2016-11-01" BIGINT
	, "2016-12-01" BIGINT, "2017-01-01" BIGINT, "2017-02-01" BIGINT, "2017-03-01" BIGINT, "2017-04-01" BIGINT);
CREATE TABLE IF NOT EXISTS da_popular_web.social(website TEXT, "2016-11-01" BIGINT
	, "2016-12-01" BIGINT, "2017-01-01" BIGINT, "2017-02-01" TEXT, "2017-03-01" BIGINT, "2017-04-01" BIGINT);
CREATE TABLE IF NOT EXISTS da_popular_web.top_sites(website TEXT, "2016-11-01" BIGINT
	, "2016-12-01" BIGINT, "2017-01-01" BIGINT, "2017-02-01" BIGINT, "2017-03-01" BIGINT, "2017-04-01" BIGINT);

DELETE FROM da_popular_web.fast_food;
DELETE FROM da_popular_web.news;
DELETE FROM da_popular_web.search;
DELETE FROM da_popular_web.social;
DELETE FROM da_popular_web.top_sites;

COPY da_popular_web.fast_food(website, "2016-11-01", "2016-12-01", "2017-01-01", "2017-02-01", "2017-03-01", "2017-04-01")
FROM 'C:/users/blindsey/downloads/Fast-Food.csv'  
DELIMITER ','
CSV HEADER;

COPY da_popular_web.news(website, "2016-11-01", "2016-12-01", "2017-01-01", "2017-02-01", "2017-03-01", "2017-04-01")
FROM 'C:/users/blindsey/downloads/News.csv'  
DELIMITER ','
CSV HEADER;

COPY da_popular_web.search(website, "2016-11-01", "2016-12-01", "2017-01-01", "2017-02-01", "2017-03-01", "2017-04-01")
FROM 'C:/users/blindsey/downloads/search.csv'  
DELIMITER ','
CSV HEADER;

COPY da_popular_web.social(website, "2016-11-01", "2016-12-01", "2017-01-01", "2017-02-01", "2017-03-01", "2017-04-01")
FROM 'C:/users/blindsey/downloads/social.csv'  
DELIMITER ','
CSV HEADER;

COPY da_popular_web.top_sites(website, "2016-11-01", "2016-12-01", "2017-01-01", "2017-02-01", "2017-03-01", "2017-04-01")
FROM 'C:/users/blindsey/downloads/top_sites.csv'  
DELIMITER ','
CSV HEADER;

COMMIT;