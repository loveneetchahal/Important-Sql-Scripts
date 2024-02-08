--- 1) Select Statement 

SELECT *
FROM [Details].[StudentDetails] 

--- Better Way 

SELECT 
	FirstName, 
	LastName,
	RegistrationNumber,
	Degree
From [Details].[StudentDetails]
WHERE FirstName LIKE 'SUNDARAM'


--- 2) Use INNER JOIN instead of WHERE to JOIN Tables 

--- CROSS JOIN or Cartesian Join

SELECT SPD.* 
FROM 
[Details].[StudentPersonalDetails] AS SPD, [Details].[StudentDetails] AS SD
WHERE SPD.StudentId=SD.StudentId


--- Better Way 

SELECT 
	SPD.StudentId,
	SD.FirstName,
	SD.RegistrationNumber,
	SPD.Gender,
	SPD.AddressLine1,
	SPD.MobileNumber 
FROM 
[Details].[StudentPersonalDetails] AS SPD JOIN [Details].[StudentDetails] AS SD 
ON SPD.StudentId=SD.StudentId

--- 3) Use WHERE instead of HAVING for primary filters

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
GROUP BY FirstName,	LastName,RegistrationNumber, Degree, CreatedDate
HAVING RegistrationNumber BETWEEN 789456123 AND 789456127

--- Better Way 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE RegistrationNumber BETWEEN 789456123 AND 789456127
ORDER BY FirstName,LastName

--- 4) Use EXIST 

IF (SELECT COUNT(1) FROM  [Details].[StudentDetails])>0
BEGIN 
	 SELECT 
		FirstName,
		LastName,
		RegistrationNumber,
		Degree
	 FROM [Details].[StudentDetails]
END

--- Better Way 

IF EXISTS(SELECT FirstName FROM  [Details].[StudentDetails])
BEGIN 
	 SELECT 
		FirstName,
		LastName,
		RegistrationNumber,
		Degree
	 FROM [Details].[StudentDetails]
END

--- 5) Use Wildcard Characters Wisely 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE FirstName LIKE '%ra%'

--- Better Way 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE FirstName LIKE 'ra%'

--- 6) Avoid Functions in Predicators / WHERE Condition

 SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails] 
WHERE MONTH(CreatedDate)=12

--- Better Way 

 SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails] 
WHERE CreatedDate BETWEEN '2020/12/01' AND '2020/12/31'


--- 7) Use BETWEEN instead IN 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails] 
WHERE RegistrationNumber IN (789456123,789456124,789456125,789456126)

--- Better Way 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails] 
WHERE RegistrationNumber BETWEEN 789456123 AND 789456126

--- 8) Always fetch limited data and target accurate results

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]

--- Better way 

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE RegistrationNumber='789456123'  -- Add some more predicates to get accurate results


--- 9) Avoid Correlated Queries 

SELECT 
	FirstName,
	LastName,
	(	SELECT 
			SPD.AddressLine1 
		FROM Details.StudentPersonalDetails AS SPD
		WHERE SPD.StudentId=SD.StudentId
	) AS Address1
FROM [Details].[StudentDetails] AS SD


--- Better way

SELECT 
	SD.FirstName,
	SD.LastName,
	SPD.AddressLine1
FROM [Details].[StudentDetails] AS SD 
JOIN [Details].[StudentPersonalDetails] AS SPD 
ON SPD.StudentId=SD.StudentId




--- 10) Don't directly load data into Table from External Source 

--- 11) Use Indexes
SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE FirstName='Sundaram'

--- Better Way  
SELECT 
	FirstName
FROM [Details].[StudentDetails]
WHERE FirstName='Sundaram'

SELECT 
	FirstName,
	LastName,
	RegistrationNumber,
	Degree
FROM [Details].[StudentDetails]
WHERE FirstName='Sundaram'

CREATE NONCLUSTERED INDEX IX_StudentDetails_FirstName
ON [Details].[StudentDetails] (FirstName)


CREATE NONCLUSTERED INDEX IX_StudentDetails_FirstName
ON [Details].[StudentDetails] (FirstName)
INCLUDE(LastName)

--DROP INDEX IX_StudentDetails_FirstName 
--ON [Details].[StudentDetails]


--- 12) Reduce the joins

--- 13) Never Use Indexes


-- To Identify Slow running queries 
SET STATISTICS TIME ON 
SET STATISTICS IO ON

