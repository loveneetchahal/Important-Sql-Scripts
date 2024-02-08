/*
	Rank Functions in SQL Server
		1) ROW_NUMBER()
		2) RANK()
		3) DENSE_RANK()
		4) NTILE()
*/

SELECT * FROM [Details].[Products]


ALTER TABLE [Details].[Products]
ADD City NVARCHAR(10)

/*   Over and Parition by 
=======================================
	1) The Over clause allows the use of aggregate functions without using a group by clause.
	2) OVER() clause to define a set of rows in the result set. 
	3) SQL PARTITION BY - To divide the result set into partitions and perform computation on each subset of partitioned data.
*/


SELECT  ProductName, Rate,
RANK() OVER(ORDER BY Rate DESC)[Rank]
FROM [Details].[Products]

SELECT  ProductName, Rate,
DENSE_RANK() OVER(ORDER BY Rate DESC)[Rank]
FROM [Details].[Products]

SELECT  ProductName, Rate,
ROW_NUMBER() OVER(ORDER BY Rate DESC)[Row Number]
FROM [Details].[Products]

SELECT  ProductName, Rate, City,
ROW_NUMBER() OVER(PARTITION BY City ORDER BY Rate DESC)[Row Number]
FROM [Details].[Products]

-- percentile - Comparision source

SELECT  ProductName, Rate,
NTILE(5) OVER(ORDER BY Rate DESC)[Rank]
FROM [Details].[Products]
