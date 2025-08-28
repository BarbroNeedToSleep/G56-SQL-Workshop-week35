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

-- TODO you where here
-- 5: Get the biggest population found in any of the cities


-- 6: Get the smallest population found in any of the cities


-- 7: Sum the population of all cities with a population below 10000


-- 8: Count the cities with the country codes MOZ and VNM


-- 9: Get individual count of cities for the country codes MOZ and VNM


-- 10: Get average population of cities in MOZ and VNM


-- 11: Get the country codes with more than 200 cities


-- 12: Get the country codes with more than 200 cities ordered by city count


-- 13: What language(s) is spoken in the city with a population between 400 and 500?


-- 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them


-- 15: What names of the cities are in the same country as the city with a population of 122199 (including that city itself)


-- 16: What names of the cities are in the same country as the city with a population of 122199 (excluding that city itself)


-- 17: What are the city names in the country where Luanda is the capital?


-- 18: What are the names of the capital cities in countries in the same region as the city named Yaren


-- 19: What unique languages are spoken in the countries in the same region as the city named Riga


-- 20: Get the name of the most populous city


