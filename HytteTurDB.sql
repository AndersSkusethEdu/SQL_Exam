-- Oppgave a) Create an SQL that retrieves first name, last name and email address for all registered people --
-- sorted by last name, then sorted by first name. -- 

SELECT person.firstname AS FirstName, person.lastname AS LastName, registration.Email AS Email
FROM person
JOIN registration ON registration.email = person.email
GROUP BY Email
ORDER BY LastName ASC, FirstName ASC
;


-- b) Create an SQL that retrieves all information about cabins that are unattended and that have fewer than 10 beds --

select *
from cabin
where CabinType="unattended" AND NrOfBeds >10;


-- c)	Create a query that retrieves the first name and last name of people who have an email address from gmail. 

SELECT *
FROM person
WHERE Email LIKE "%gmail.com";


-- d) Create a query that retrieves the average number of beds for the registered cabins based on
 -- cabin type (unattended, self-serviced and attended). The result should have two columns called "Cabin type" and "Average number of beds". 
 
 SELECT cabinType, AVG(NrOfBeds) AS Average_number_of_beds
 FROM cabin
 GROUP BY cabinType;
 
 -- e) Create a query that retrieves information about all hiking trips planned from the cabin 
-- "Kongensdamhytta" in the period from 1. of March to 1. of April 2023. The following columns should be included: 
-- The name of the cabin where the routes begin. v
-- The difficulty level of the routes. v
-- Number of days the trips take. - When the hiking trips start (date) v
-- How much the hiking trips cost. v

SELECT CabinName, Difficulty, StartDate, NrOfDays, Price
FROM Cabin
JOIN route on cabin.CabinNr = route.cabinNr
JOIN hikingtrip ON hikingtrip.routeNr=route.RouteNr
WHERE cabin.Cabinnr LIKE 2 AND  (hikingtrip.StartDate BETWEEN '2023-03-01' AND '2023-04-01');

-- f) Create a query that retrieves information about all those registered for hiking trips with a demanding level of difficulty. The following columns should be included: 
-- The name of the cabin where the route begins. 
-- Number of days the trip takes 
-- When the hiking trip starts (date) 
-- Last name of tour guide (if the hiking trip is set up with a tour guide) 
-- First name of registered participant 
-- Last name of registered participant / SUBSTRING
-- Email address of registered participant. 
cabinname, nrofdays, route.startdate, guide.lastname, part.firstname. part.lastname, registration.email AS ParticipantEmail;



select CabinName, route.routenr, NrOfDays, hikingtrip.StartDate,
from route
join cabin on cabin.CabinNr = route.cabinnr
join hikingtrip on route.routenr = hikingtrip.routenr
join registration on route.RouteNr = registration.routenr
join person on person.email = hikingtrip.email
;

(select Firstname, lastname, person.email
from registration
join person on registration.email = person.email
group by Email);



select *
from route
join cabin on cabin.CabinNr = route.cabinnr
join hikingtrip on route.routenr = hikingtrip.routenr
join registration on route.RouteNr = registration.routenr
join person on person.email = hikingtrip.email
;

select*
from registration
