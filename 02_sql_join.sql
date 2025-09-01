/* 
SQL Join query exercise

World database layout:
To use this database from a default MySQL install, type: use world;

Table: City
Columns: Id, Name, CountryCode, District, Population

Table: Country
Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital

Table: CountryLanguage
Columns: CountryCode, Language, IsOfficial, Percentage
*/

USE world;

-- 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first

SELECT Name AS 'City name', Population FROM City WHERE Name LIKE 'ping%' ORDER BY Population ASC;


-- 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first

SELECT Name AS 'City name', Population FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC;


-- 3: Count all cities

SELECT COUNT(*) AS 'Number of Citys' FROM City;

-- 4: Get the average population of all cities

SELECT AVG(Population) FROM City;

-- 5: Get the biggest population found in any of the cities

-- SELECT MAX(Population) FROM city;
SELECT * FROM city WHERE Population = (SELECT MAX(Population) FROM City);


-- 6: Get the smallest population found in any of the cities

-- SELECT MIN(Population) FROM city;
SELECT * FROM city WHERE Population = (SELECT MIN(Population) FROM City);


-- 7: Sum the population of all cities with a population below 10000

SELECT SUM(Population) AS 'Total population' FROM City WHERE Population <10000;

-- 8: Count the cities with the country codes MOZ and VNM

SELECT COUNT(*) AS 'Number of citys' FROM City WHERE CountryCode IN ('MOZ', 'VNM');

-- 9: Get individual count of cities for the country codes MOZ and VNM

SELECT CountryCode, COUNT(*) AS 'Number of citys' FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;

-- 10: Get average population of cities in MOZ and VNM

SELECT AVG(Population) FROM City WHERE CountryCode IN ('MOZ', 'VNM');

-- 11: Get the country codes with more than 200 cities

SELECT CountryCode, COUNT(*) AS 'Number of citys' FROM City GROUP BY CountryCode HAVING COUNT(*) >200;

-- 12: Get the country codes with more than 200 cities ordered by city count

SELECT CountryCode, COUNT(*) AS 'Number of citys' FROM City GROUP BY CountryCode HAVING COUNT(*) >200 ORDER BY COUNT(*) ASC;

-- 13: What language(s) is spoken in the city with a population between 400 and 500?

SELECT cl.Language FROM Countrylanguage cl INNER JOIN City c ON cl.CountryCode = c.CountryCode
 WHERE c.Population BETWEEN 400 AND 500;
 
-- 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them

SELECT c.Name AS 'City Names',cl.Language  FROM City c INNER JOIN Countrylanguage cl ON cl.CountryCode = c.CountryCode
WHERE c.Population BETWEEN 500 AND 600;

-- 15: What names of the cities are in the same country as the city with a population of 122199 (including that city itself)

SELECT Name AS 'City Names' FROM city WHERE CountryCode = (SELECT CountryCode FROM city WHERE Population = 122199);

-- 16: What names of the cities are in the same country as the city with a population of 122199 (excluding that city itself)

SELECT Name AS 'City Names' FROM city WHERE CountryCode = (SELECT CountryCode FROM city WHERE Population = 122199) AND Population <> 122199;

-- 17: What are the city names in the country where Luanda is the capital?

SELECT c2.Name AS 'City Names' FROM country co INNER JOIN city c1 ON co.Capital = c1.ID INNER JOIN city c2 ON c2.CountryCode = co.Code 
WHERE c1.Name = 'Luanda';

-- 18: What are the names of the capital cities in countries in the same region as the city named Yaren

SELECT oci.Name 'Capital name' FROM City yci, Country yco, Country oco, City oci
WHERE yci.Name = "Yaren"
  AND yci.Id = yco.Capital AND yco.Region = oco.Region AND oco.Capital = oci.Id;

-- 19: What unique languages are spoken in the countries in the same region as the city named Riga

SELECT DISTINCT cl.Language FROM City 
INNER JOIN Country co ON City.CountryCode = co.code
INNER JOIN Country cr ON co.Region = cr.Region
INNER JOIN CountryLanguage cl ON cr.code = cl.countryCode
WHERE City.name ='Riga';


-- 20: Get the name of the most populous city

SELECT Name, Population FROM City ORDER BY Population DESC LIMIT 1;



