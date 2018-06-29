BEGIN
SELECT carrier, AVG (carrier_delay)
FROM airline_on_time_west_coast
WHERE flight_date >= '1/1/2014' OR flight_date <= '3/31/2014' 
GROUP BY carrier; 


--GROUP BY origin_city_name, carrier
--ORDER BY origin_city_name, AVG (carrier_delay)

COMMIT; 