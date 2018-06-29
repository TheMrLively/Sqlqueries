--CLASS 6.23.18
BEGIN; 

--WHERE with MULTIPLES
SELECT carrier, dest_city_name, 
AVG (carrier_delay), MIN (carrier_delay), MAX (carrier_delay)
FROM airline_on_time_west_coast
WHERE origin IN ('DEN', 'SFO', 'SEA', 'PHX') AND 
dest_city_name LIKE ('%CA') OR dest_city_name LIKE ('%NY')
GROUP BY carrier, dest_city_name
ORDER BY carrier; 

--WHERE with dates 
SELECT CAST (starttime AS DATE), SUM (tripduration)
FROM da_pronto_bike_share.trips
WHERE starttime BETWEEN '2014-01-01' AND '2014-12-31'
AND to_station_name LIKE ('%Museum%')
GROUP BY starttime, tripduration
ORDER BY starttime ASC;

--HAVING after aggregations
SELECT station_id, CAST (date_ymd AS text), 9/5 * (MIN (min_temp)) +32 AS degrees_F
FROM da_weather.us_weather_anomalies 
WHERE CAST (date_ymd AS text) LIKE ('2013%') AND latitude >36
GROUP BY station_id, date_ymd
HAVING 9/5*(MIN (min_temp)) +32 <= 0;

--9/5 (MIN (min_temp)) +32 

--CASE WHEN queries
SELECT CAST (starttime AS DATE), from_station_name, to_station_name, SUM(tripduration),

CASE
WHEN from_station_name = to_station_name THEN 1
WHEN from_station_name <> to_station_name THEN 0
END "station_name"

FROM da_pronto_bike_share.trips
WHERE CAST (starttime AS DATE) = '2015-05-05'
GROUP BY starttime, from_station_name, to_station_name




--WHEN WHEN 2

SELECT flight_date, carrier, arrival_delay, CASE 
WHEN origin_city_name LIKE '%WA' THEN 'True' 
WHEN origin_city_name LIKE '%NY' THEN 'True' 
WHEN origin_city_name LIKE '%CA' THEN 'True' 
WHEN origin_city_name LIKE '%CO' THEN 'True'
WHEN origin_city_name LIKE '%AZ' THEN 'True'  
ELSE 'False'
END "Boolean"
FROM airline_on_time_west_coast
WHERE flight_date BETWEEN '12/1/14' AND '12/31/14'
LIMIT 100

---INGREDIENTS TABLE

CREATE SCHEMA IF NOT EXISTS da_ingredients

CREATE TABLE IF NOT EXISTS da_ingredients.ingredients
(
	id text, 
	asins text NULL, 
	brand text, 	
	categories text, 	
	dateAdded timestamp, 
	dateUpdated timestamp,	
	ean text, 	
	features_key text, 	
	features_value text, 	
	manufacturer text, 
	manufacturerNumber text, 	
	name text, 	
	sizes text,	
	upc text, 	
	weight text
);

--DROP TABLE da_ingredients.ingredients; 

--DELETE FROM da_ingredients.ingredients; 

COPY da_ingredients.ingredients FROM 'C:\Users\blindsey\Downloads\ingredients.csv'
WITH DELIMITER E'\t' CSV HEADER;

SELECT id, categories, features_value, 
	CASE 
	WHEN categories LIKE '%Grocery%' THEN 1
	END "Grocery",

	CASE 
	WHEN categories LIKE '%Gourmet Food%' THEN 'Gourment Food'
	END "Gourment Food", 

	CASE 
	WHEN features_value LIKE '%Corn Syrup%' THEN 'TRUE' 
	END "Corn Syrup"
	 
FROM da_ingredients.ingredients; 

--JOINS Code Along 
SELECT *
FROM da_sales.purchases
	INNER JOIN da_sales.customers ON purchases.custid = customers.id


COMMIT;
