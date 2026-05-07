-- AIRLINE ANALYTICS PROJECT
-- CORE ANALYSIS QUERIES


1) -- Average Delay By Airport 

SELECT TOP 10 origin,
AVG(dep_delay) AS avg_delay
FROM flight
GROUP BY origin
ORDER BY avg_delay DESC;

-- Insight:
-- Identifies airport with the highest average departure delays 

2) -- Delay by Time of Day

SELECT dep_hour,
AVG(dep_delay) AS avg_delay
FROM flight
GROUP BY dep_hour
ORDER By dep_hour;

-- Insight:
-- Highlights peak hours with highest delays

3) -- Delay Cause Breakdown

SELECT
	SUM(carrier_delay) AS carrier,
	SUM(weather_delay) AS weather,
	SUM(nas_delay) AS nas,
	SUM(security_delay) AS security,
	SUM(late_aircraft_delay) AS late_aircraft
FROM flight;

-- Insight:
-- Determines primary contributors to flight delays

4) -- Most Delayed Routes

SELECT TOP 10 origin, dest,
	AVG(dep_delay) AS avg_delay
FROM flight
GROUP BY origin, dest
ORDER BY avg_delay DESC;

-- Insight:
-- Identifies underperforming routes

5) -- On -Time Performance KPI

SELECT COUNT(*) AS total_flight,
SUM(CASE WHEN dep_delay <= 0 THEN 1 ELSE 0 END) AS on_time_flight,
SUM(CASE WHEN dep_delay <= 0 THEN 1 ELSE 0 END) * 100.0/COUNT(*) AS on_time_percentage
FROM flight;

-- Insight:
-- Measure operational efficiency

-- ==============================================================================================
-- CUSTOMER ANALYSIS
-- ==============================================================================================

6) -- Satisfication Distribution

SELECT satisfaction, COUNT(*) AS total
FROM satisfaction
GROUP BY satisfaction;

-- Insight:
-- Shows overall customer satisfaction levels


7) -- Delay Impact on Satisfaction

SELECT satisfaction,
AVG(Departure_Delay_in_Minutes) AS avg_delay
FROM satisfaction
GROUP BY satisfaction;

-- Insight:
-- Higher delays correlate with lower satisfaction


8) -- Class vs Satisfaction

SELECT class, satisfaction, COUNT(*) AS total
FROM satisfaction
GROUP BY class, satisfaction
ORDER BY class;

-- Insight:
-- Compares satisfaction across travel classes


9) -- Distance vs Delay

SELECT
CASE
WHEN flight_distance < 1000 THEN 'Short'
WHEN flight_distance BETWEEN 1000 AND 3000 THEN 'Medium'
ELSE 'Long'
END AS flight_distance,
AVG(Departure_Delay_in_Minutes) AS avg_delay
FROM satisfaction
GROUP BY Flight_Distance;

-- Insight:
-- Evaluates delay trends by flight distance

