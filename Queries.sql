--------------------------------------------------------------------------------------------------------
-------------------------------------Task D.1-----------------------------------------------------
--List the total number of vaccines administered in each observation date recorded in the dataset 
--in in each of all countries. Each row in the result set must have the following structure.
--------------------------------------------------------------------------------------------------------

SELECT l.Countries AS [Country Name (CN)],
       vv.Date AS [Administrated Vaccine on OD (VOD)],
       vv.Total_Vaccinations AS [Total Administrated Vaccines]
  FROM Vaccinations_by_manufacturers vv
       INNER JOIN
       Locations_list l ON l.ISO_Code = vv.ISO_Code
       INNER JOIN
       Vaccine_list v ON v.Vaccine_ID = vv.Vaccine_ID;


--------------------------------------------------------------------------------------------------------
-------------------------------------Task D.2-----------------------------------------------------
--Find the countries with the cumulative numbers of COVID-19 doses administered by each country. 
--Produces a result set containing the name of each country and the cumulative number of doses administered in that country. 
--Each row in the result set must have the following structure.
--------------------------------------------------------------------------------------------------------

SELECT l.Countries AS [Country Name],
       SUM(v.TotalVaccinations) AS [Cumulative Doses]
  FROM Vaccinations v
       INNER JOIN
       Locations_list l ON l.ISO_Code = v.ISO_Code
 GROUP BY l.Countries;


--------------------------------------------------------------------------------------------------------
-------------------------------------Task D.3-----------------------------------------------------
--Produce a list of all countries with the type of vaccines (e.g., Oxford/AstraZeneca, Pfizer/BioNTech) administered in each country. 
--For a country that has administered several types of vaccine, the result set is required to show several tuples
-- reporting each type of vaccine in a separate tuple. Each row in the result set must have the following structure.
--------------------------------------------------------------------------------------------------------

SELECT l.Countries AS [Country],
       v.Vaccine_Name AS [Vaccine Type]
  FROM Locations_list l, Vaccine_list v
       INNER JOIN
       Locations a ON l.ISO_Code = a.ISO_Code AND
       v.Vaccine_ID = a.Vaccine_ID;
       

--------------------------------------------------------------------------------------------------------
-------------------------------------Task D.4-----------------------------------------------------
--There are different data sources used to produce the dataset. Produce a report showing the total number of vaccines 
--administered according to each data source (i.e., each unique URL). Order the result set by source name (URL). 
--Each row in the result set must have the following structure.
--------------------------------------------------------------------------------------------------------


SELECT DISTINCT l.Source_Website AS [Source Name (URL)],
                COUNT(l.Vaccine_ID) AS [Total Administrated Vaccine]
  FROM Locations l
 GROUP BY l.Source_Website;



--------------------------------------------------------------------------------------------------------
-------------------------------------Task D.5-----------------------------------------------------
--How does various countries compare in the speed of their vaccine administration? 
--Produce a report that lists all the observation dates in 2022 and, for each date, 
--list the total number of people fully vaccinated in each one of the 4 countries used in this assignment.
--------------------------------------------------------------------------------------------------------


    SELECT DISTINCT v.Date AS Date,
                    a.People_fully_vaccinated AS Australia,
                    u.People_fully_vaccinated AS [United States],
                    g.People_fully_vaccinated AS Germany,
                    i.People_fully_vaccinated AS Italy
      FROM Vaccinations v
           JOIN
           Vaccinations a ON a.Date = v.Date
           JOIN
           Vaccinations u ON u.Date = v.Date
           JOIN
           Vaccinations g ON g.Date = v.Date
           JOIN
           Vaccinations i ON i.Date = v.Date
     WHERE a.ISO_Code == 'AUS' AND 
           u.ISO_Code == 'USA' AND 
           g.ISO_Code == 'DEU' AND 
           i.ISO_Code == 'ITA' AND 
           v.Date BETWEEN '2022-01-01' AND '2022-12-30';


