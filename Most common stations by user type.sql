SELECT usertype, from_station_name, to_station_name, COUNT (*)
FROM da_pronto_bike_share.trips
GROUP BY usertype, from_station_name, to_station_name
ORDER BY COUNT (*) DESC LIMIT 10;
COMMIT;