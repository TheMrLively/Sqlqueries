BEGIN; 
CREATE SCHEMA IF NOT EXISTS da_pronto_bike_share;
CREATE TABLE IF NOT EXISTS da_pronto_bike_share.trips
(trip_id text, starttime timestamp, stoptime timestamp, bikeid text, 
tripduration float, from_station_name text, to_station_name text, from_station_id text,
to_station_id text, usertype text, gender text, birthyear integer);


COPY da_pronto_bike_share.trips FROM 'C:/users/blindsey/downloads/2015_trip_data.csv' 
HEADER CSV; 
SELECT COUNT (*) FROM da_pronto_bike_share.trips;
SELECT from_station_name FROM da_pronto_bike_share.trips
ORDER BY (to_station_id) DESC; 
SELECT tripduration, gender FROM da_pronto_bike_share.trips
ORDER BY tripduration ASC LIMIT 500; 
SELECT to_station_name, COUNT (*) FROM da_pronto_bike_share.trips
GROUP BY to_station_name ORDER BY COUNT (*) DESC LIMIT 100;
COMMIT; 
