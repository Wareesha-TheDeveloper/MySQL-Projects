CREATE DATABASE Cars;
Use Cars;

SELECT * FROM information;

-- QUESTION # 2 --
SELECT COUNT(name) FROM information;

-- QUESTION # 3 --
SELECT year, COUNT(name)
FROM information
WHERE Year=2023
GROUP BY Year;

-- QUESTION # 4 --
SELECT year, COUNT(name)
FROM information
WHERE Year>2019
GROUP BY Year;

-- QUESTION # 5 --
SELECT Year, Count(name)
FROM Information
GROUP BY Year;

-- QUESTION # 6 --
SELECT Fuel, COUNT(Name)
FROM Information
WHERE Year=2020
GROUP BY Fuel;

-- QUESTION # 7 --
SELECT Fuel, COUNT(Name)
FROM Information
WHERE Year=2023
GROUP BY Fuel
HAVING Fuel="Petrol";

-- QUESTION # 8 --
SELECT Year, COUNT(name)
FROM Information
WHERE Fuel="Petrol"
GROUP BY Year;

SELECT Year, COUNT(Name)
FROM Information
WHERE Fuel="Diesel"
GROUP BY Year;

SELECT Year, COUNT(Name)
FROM Information
WHERE Fuel="CNG"
GROUP BY Year;

-- QUESTION # 9 --
SELECT Year, COUNT(Name)
FROM Information
GROUP BY Year
HAVING COUNT(name)>=100;

-- QUESTION # 10 --
SELECT Year, COUNT(Name)
FROM Information
WHERE Year BETWEEN 2015 AND 2023
GROUP BY year;

-- QUESTION # 11 --
SELECT * FROM Information
WHERE Year BETWEEN 2015 AND 2023;