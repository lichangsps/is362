 -- 1. How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
SELECT COUNT(*) AS 'TOTAL' FROM planes WHERE speed != 'null';
SELECT MAX(speed) FROM planes WHERE speed > 0;
SELECT MIN(speed) FROM planes WHERE speed > 0;

 -- 2. What is the total distance flown by all of the planes in January 2013? What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT sum(distance) FROM flights WHERE year = 2013 AND month = 1;
SELECT sum(distance) FROM flights WHERE year = 2013 AND month = 1 AND tailnum = "null";

 -- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
Select p.manufacturer, SUM(distance) 
from flights f LEFT JOIN planes p 
on f.tailnum = p.tailnum 
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5 
group by p.manufacturer;

Select p.manufacturer, SUM(distance) 
from flights f INNER JOIN planes p 
on f.tailnum = p.tailnum 
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5 
group by p.manufacturer;
 -- Left Join contains all records from flights table including with Null values. 
 -- inner join only contains records matching both flights and planes table 

 -- 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
  -- list arrival airlines counts in different destination airports on July 5, 2013. 
 Select ar.name AS 'AIRPORTS', count(*), al.name AS 'AIRLINES' 
 from flights f 
 inner JOIN airports ar on f.dest = ar.faa 
 inner join airlines al on f.carrier = al.carrier 
 Where f.year = 2013 AND f.month = 7 AND f.day = 5 
 group by al.name, ar.name;

 