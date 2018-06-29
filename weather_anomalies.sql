BEGIN; 
CREATE SCHEMA IF NOT EXISTS da_weather
CREATE TABLE IF NOT EXISTS da_weather.us_weather_anomalies(date_YMD DATE,degrees_from_mean FLOAT,station_ID VARCHAR(12),longitude FLOAT,latitude FLOAT,max_temp FLOAT,min_temp FLOAT,station_name VARCHAR(30),type VARCHAR(16),serial_ID INT); 
DELETE FROM da_weather.us_weather_anomalies;
COPY da_weather.us_weather_anomalies FROM 'C:/users/blindsey/downloads/weather_anomalies_2004-2013.csv'
WITH DELIMITER '|' CSV HEADER; 
SELECT * FROM da_weather.us_weather_anomalies
LIMIT 1000;
COMMIT; 
