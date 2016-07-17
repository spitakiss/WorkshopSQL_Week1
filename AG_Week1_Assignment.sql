-- 1. Find max distance and destination in flights tbl

SELECT dest, MAX(distance) from flights
GROUP BY dest
ORDER BY distance DESC
LIMIT 1
;

-- 2. Planes, Engines, Max seats

# Find distinct number of engines in table
SELECT DISTINCT engines from planes;

# For each engine number, find maximum number of seats and associated airplane models
SELECT DISTINCT a.engines, model, seats FROM planes AS a
JOIN (SELECT engines, MAX(seats) as max_seats FROM planes GROUP BY engines) AS b
WHERE a.engines = b.engines
AND a.seats = b.max_seats 
ORDER BY engines, model
;

-- 3. Find number of flights.  Asuming each record in flights table represents one flight.
SELECT COUNT(*) FROM flights;


-- 4. Select total number of flights by carrier 
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier;


-- 5. Select all airlines, ordered by number of flights in descending order
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

-- 6.  Sames as problem 5, but limited to TOP 5 results
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 7. Same as problem 6, whith additional criterion distance >=1000
SELECT carrier, COUNT(*) FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 8  Make up your own question pertaining to the flights db.  The question must require aggregration to answer.  

# Question:   Use the weather table to calculate the average wind speed by month.  Also, include a count of the number of observations
#			  comprising each month's avg wind speed claculation.  For consistency, limit the wind speed measurements
#			  to those taken at 5pm and at the the 'EWR' location.  Sort the months in descending order by average wind speed. 
#			  Limit the output to the top 3 results.      


SELECT month, AVG(wind_speed), COUNT(*) FROM weather
WHERE origin = 'EWR' 
AND year = 2013
AND hour = 17
GROUP BY month
ORDER BY AVG(wind_speed) DESC
LIMIT 3;



 
 