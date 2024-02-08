--Create a target table
CREATE TABLE Details.Products
(
   ProductId INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate MONEY
) 
GO

--Insert records into target table
INSERT INTO Details.Products
VALUES
   (1, 'TV', 10.00),
   (2, 'Monitor', 20.00),
   (3, 'Mouse', 30.00),
   (4, 'Keyboard', 40.00)
GO


--Create source table
CREATE TABLE Details.SalesProducts
(
   ProductId INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate MONEY
) 
GO

--- SELECT * FROM Details.Products
--- SELECT * FROM Details.SalesProducts

---  Merge Statement Begins 

MERGE Details.SalesProducts AS T --- Target 
	USING Details.Products AS S --- Source 
	ON(T.ProductId=S.ProductId)
	WHEN MATCHED AND 
			T.ProductName<>S.ProductName OR 
			T.Rate<>S.Rate
	THEN UPDATE SET 
			T.ProductName=S.ProductName, 
			T.Rate=S.Rate
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT 
	(
		ProductId,
		ProductName,
		Rate
	)
	VALUES
	(
		S.ProductId,
		S.ProductName,
		S.Rate
	)
	WHEN NOT MATCHED BY SOURCE 
	THEN DELETE;


----- Merge Ends 



