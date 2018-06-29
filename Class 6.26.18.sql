--Inner Join activity

SELECT custid, quantity, date, cu.name
FROM da_sales.purchases pu 
JOIN da_sales.customers cu ON pu.custid = cu.id;


--JOINS with A WHERE 

SELECT cit.name, cit.population, cou.name, cou.continent 
FROM da_world.city AS cit
JOIN da_world.country as cou ON cit.countrycode = cou.code 
WHERE cou.continent = 'Africa' and cit.population > 250000; 

--JOIN with Multiple joins 

CREATE SCHEMA da_readychef;

SELECT campaign_id, COUNT (vis.userid)
FROM da_readychef.visits AS vis
JOIN da_readychef.users AS us ON vis.userid = us.userid
JOIN da_readychef.events AS ev ON vis.userid =ev.userid
GROUP BY campaign_id