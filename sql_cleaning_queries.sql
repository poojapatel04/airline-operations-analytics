
-- Airline Analytics Project
-- Data Cleaning Step

-- Remove NULL values
DELETE FROM flight
WHERE dep_delay IS NULL;

DELETE FROM satisfaction
WHERE Departure_Delay_in_Minutes IS NULL;

---- Fix Negative delays
UPDATE flight
SET dep_delay = 0
WHERE dep_delay < 0;

-- Trim airport codes
UPDATE flight 
SET origin = TRIM(origin),
dest = TRIM(dest);

-- create hour column
ALTER TABLE flight ADD dep_hour INT;

UPDATE flight
SET dep_hour = FLOOR(dep_time/100); 