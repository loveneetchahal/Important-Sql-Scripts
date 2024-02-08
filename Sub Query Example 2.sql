Create Table Details.ShopProducts
(
	 [Id] int identity primary key,
	 [Name] nvarchar(50),
	 [Description] nvarchar(250)
)

Create Table Details.ProductSales
(
	 Id int primary key identity,
	 ProductId int foreign key references Details.ShopProducts(Id),
	 UnitPrice int,
	 QuantitySold int
)

Insert into Details.ShopProducts values ('TV', '52 inch black color LCD TV')
Insert into Details.ShopProducts values ('Laptop', 'Very thin black color acer laptop')
Insert into Details.ShopProducts values ('Desktop', 'HP high performance desktop')

Insert into Details.ProductSales values(3, 450, 5)
Insert into Details.ProductSales values(2, 250, 7)
Insert into Details.ProductSales values(3, 450, 4)
Insert into Details.ProductSales values(3, 450, 9)


SELECT * FROM Details.ShopProducts
SELECT * FROM Details.ProductSales

---- Write a query to retrieve products that are not at all sold? 

SELECT	
		[Id], 
		[Name], 
		[Description]
FROM Details.ShopProducts
where Id NOT IN (
					SELECT DISTINCT ProductId 
					FROM Details.ProductSales
				)

----- The same can be Done by Join

SELECT 
		SP.[Id], 
		[Name], 
		[Description]
FROM Details.ShopProducts SP
LEFT JOIN Details.ProductSales PS
ON SP.Id = PS.ProductId
WHERE PS.ProductId IS NULL


----- query to retrieve the NAME and TOTALQUANTITY sold

SELECT
	[Name],
	(SELECT 
		SUM(QuantitySold) 
	 FROM Details.ProductSales 
	 WHERE ProductId = ShopProducts.Id) AS TotalQuantity
FROM Details.ShopProducts
ORDER BY [Name]


--- Query with an equivalent join 

SELECT 
	[Name],
	SUM(QuantitySold) AS TotalQuantity
FROM Details.ShopProducts SP
LEFT JOIN Details.ProductSales PS
ON SP.Id = PS.ProductId
GROUP BY [Name]
ORDER BY [Name]



------ SubQuery in Insert Statement 
INSERT INTO [Details].[SalesProducts]
(
	ProductId,
	ProductName,
	Rate
)
SELECT 
	ProductId,
	ProductName,
	Rate
FROM [Details].[Products]
WHERE ProductId=1
