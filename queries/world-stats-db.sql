CREATE DATABASE dbWorldStats;
USE dbWorldStats;

CREATE TABLE tblContinents ( ContinentID INT PRIMARY KEY NOT NULL IDENTITY (100,1), ContinentName VARCHAR(255), ContinentGDP VARCHAR(255), ); 

CREATE TABLE tblCountries ( CountryID INT PRIMARY KEY NOT NULL IDENTITY (100,1), CountryName VARCHAR(255), CountryGDP VARCHAR(255), Country_Continents INT NOT NULL CONSTRAINT fk_ContinentID FOREIGN KEY REFERENCES tblContinents(ContinentID) ON UPDATE CASCADE ON DELETE CASCADE, );

/* Data Source - wikipedia.org/ */ 

INSERT INTO tblContinents (ContinentName, ContinentGDP) 
VALUES ('North America', '29,529 Billion USD'),
('South America', '3,619 Billion USD'),
('Asia', '41,635 Billion USD'),
('Europe', '24,021 Billion USD'),
('Africa', '2,965 Billion USD'),
('Oceania', '2,045 Billion USD') ;

INSERT INTO tblCountries (CountryName, CountryGDP, Country_Continents) 
VALUES ('United States', '25,035 Billion USD', 100),
('China', '18,321 Billion USD', 102), 
('Japan', '4,300 Billion USD', 102), 
('Germany', '4,031 Billion USD', 103), 
('India', '3,468 Billion USD', 102), 
('United Kingdom', '3,198 Billion USD', 103); 

SELECT tblCountries.CountryName AS 'Country' ,
tblCountries.CountryGDP AS 'Country GDP(Nominal)', 
tblContinents.ContinentName AS 'Continent', 
tblContinents.ContinentGDP AS 'Continent GDP(Nominal)' 
FROM tblContinents INNER JOIN tblCountries ON tblContinents.ContinentID = tblCountries.Country_Continents;

