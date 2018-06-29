SELECT flight_num, origin_city_name, dest_city_name, 
COUNT (late_aircraft_delay) 
FROM airline_on_time_west_coast
WHERE late_aircraft_delay>0
GROUP BY flight_num, origin_city_name, dest_city_name 
ORDER BY COUNT (late_aircraft_delay) DESC LIMIT 5; 
COMMIT; 