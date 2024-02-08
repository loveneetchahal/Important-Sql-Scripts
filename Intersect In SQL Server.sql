CREATE TABLE Details.MainProductDetails
(
	Id INT, 
	ProductName NVARCHAR(100)
)
CREATE TABLE Details.MainSalesDetails
(
	Id INT, 
	ProductName NVARCHAR(100)
)

INSERT INTO Details.MainProductDetails VALUES (1,'TV')
INSERT INTO Details.MainProductDetails VALUES (2,'Mobile')
INSERT INTO Details.MainProductDetails VALUES (3,'Fridge')

INSERT INTO Details.MainSalesDetails VALUES (1,'TV')
INSERT INTO Details.MainSalesDetails VALUES (2,'Mobile')
INSERT INTO Details.MainSalesDetails VALUES (3,'Fridge')


---- SELECTING THE RECORDS 

SELECT * FROM Details.MainProductDetails 

SELECT * FROM Details.MainSalesDetails

---- Intersect Operator 

SELECT Id,ProductName FROM Details.MainProductDetails 
INTERSECT
SELECT Id,ProductName FROM Details.MainSalesDetails

----- Using Inner Join We can achieve the same 

SELECT MPD.Id,MPD.ProductName FROM Details.MainProductDetails  AS MPD
INNER JOIN Details.MainSalesDetails AS MSD ON MSD.Id=MPD.Id

/*

INTERSECT Vs INNER JOIN
	1. INTERSECT filters duplicates and returns only DISTINCT rows that are common between the LEFT and Right Query, where as INNER JOIN does not filter the duplicates.
	
*/


--- Inserting a new Record

INSERT INTO Details.MainProductDetails VALUES (3,'Fridge')

---- Intersect
SELECT Id,ProductName FROM Details.MainProductDetails 
INTERSECT
SELECT Id,ProductName FROM Details.MainSalesDetails

---- But in Joins 
SELECT  MPD.Id,MPD.ProductName FROM Details.MainProductDetails  AS MPD
INNER JOIN Details.MainSalesDetails AS MSD ON MSD.Id=MPD.Id

--- To get Distinct in Joins

SELECT DISTINCT MPD.Id,MPD.ProductName FROM Details.MainProductDetails  AS MPD
INNER JOIN Details.MainSalesDetails AS MSD ON MSD.Id=MPD.Id


/*
Intersect Vs Inner Join 
	2. INNER JOIN treats two NULLS as two different values. So if you are joining two tables based on a nullable column and if both tables have NULLs in that joining column then, INNER JOIN will not include those rows in the result-set, where as INTERSECT treats two NULLs as a same value and it returns all matching rows.
	   
*/

---- Inserting NULL Values 
INSERT INTO Details.MainProductDetails VALUES (NULL,'Monitor')
INSERT INTO Details.MainSalesDetails VALUES (NULL,'Monitor')

----- Intersect 

SELECT Id,ProductName FROM Details.MainProductDetails 
INTERSECT 
SELECT Id,ProductName FROM Details.MainSalesDetails

---- But in Joins 
SELECT DISTINCT MPD.Id,MPD.ProductName FROM Details.MainProductDetails  AS MPD
INNER JOIN Details.MainSalesDetails AS MSD ON MSD.Id=MPD.Id




---- EXCEPT  Operators 

SELECT Id,ProductName FROM Details.MainProductDetails 
EXCEPT
SELECT Id,ProductName FROM Details.MainSalesDetails

---- EXCEPT Operator 
/*
		1. Except filters duplicates and returns only DISTINCT rows from the left query that aren’t in the right query’s results
*/


INSERT INTO Details.MainProductDetails VALUES (6,'Heater')


SELECT * FROM Details.MainProductDetails
SELECT * FROM Details.MainSalesDetails

SELECT * FROM Details.MainProductDetails AS MPD
WHERE MPD.Id NOT IN(SELECT MSD.Id FROM Details.MainSalesDetails AS MSD)


SELECT * FROM Details.MainProductDetails AS MPD
WHERE NOT EXISTS(SELECT MSD.Id FROM Details.MainSalesDetails AS MSD)

