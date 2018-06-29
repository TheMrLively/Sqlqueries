BEGIN;
CREATE TABLE IF NOT EXISTS airline_on_time_west_coast(day_of_month text,day_of_week text,flight_date date,unique_carrier varchar(4),carrier varchar(4),flight_num int,
Origin varchar(80),Origin_city_name varchar(60),dest_city_name varchar(60),arrival_time char(4), arrival_delay float,carrier_delay float,weather_delay float,
nas_delay float, security_delay float, late_aircraft_delay float);  
COPY airline_on_time_west_coast FROM 'C:/users/blindsey/downloads/airline_on_time_west_coast.csv'
WITH DELIMITER ',' CSV HEADER;
COMMIT;