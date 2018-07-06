--Class7.3.18

---Code Along Unions and Union All 
SELECT website, "2017-02-01" 
FROM da_popular_web.fast_food
UNION
SELECT website, CAST ("2017-02-01" AS bigint)
FROM da_popular_web.social


SELECT website
FROM da_popular_web.social
UNION ALL
SELECT website
FROM da_popular_web.top_sites 

--Unions Activity
SELECT company 
FROM da_auto.auto_2015
WHERE rank <= 10
UNION
SELECT company 
FROM da_auto.auto_2016
WHERE rank <= 10 

--Unions with More than Two Tables Activity
SELECT company 
FROM da_auto.auto_2015
WHERE rank <= 20
UNION
SELECT company 
FROM da_auto.auto_2016
WHERE rank <= 20
UNION
SELECT company 
FROM da_auto.auto_2014
WHERE rank <= 20
UNION 
SELECT company
FROM da_auto.auto_2013
WHERE rank <= 20
UNION
SELECT company 
FROM da_auto.auto_2012
WHERE rank <= 20


-- Unions Activity 3 
SELECT *, '2012' AS "year" 
FROM da_auto.auto_2012
UNION
SELECT *, '2013' AS "year" 
FROM da_auto.auto_2013
UNION
SELECT  *, '2014' AS "year" 
FROM da_auto.auto_2014
UNION 
SELECT *, NULL AS CARS, NULL AS LCV, NULL AS HCV, NULL AS BUSES, '2015' AS "year"
FROM da_auto.auto_2015
UNION
SELECT *, NULL AS CARS, NULL AS LCV, NULL AS HCV, NULL AS BUSES, '2016' AS "year"
FROM da_auto.auto_2016
ORDER BY "year"