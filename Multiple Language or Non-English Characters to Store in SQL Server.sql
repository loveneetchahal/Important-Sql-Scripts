--- Table Creation 
CREATE TABLE StoreNonEnglish (ID INT PRIMARY KEY, VARCHARColumn VARCHAR(MAX), NVARCHARColumn NVARCHAR(MAX), Languages VARCHAR(MAX))

-- Insert values into the table 
INSERT INTO StoreNonEnglish 
(
	ID,
	VARCHARColumn, 
	NVARCHARColumn,
	Languages
)
VALUES
(
	1,
	'Welcome', 
	N'Welcome', 
	'English'
),
(
	2,
	'நல்வரவு', 
	N'நல்வரவு', 
	'Tamil'
),
(
	3,
	'स्वागत हे',
	N'स्वागत हे',
	'Hindi'
),
(
	4,
	'സ്വാഗതം',
	N'സ്വാഗതം',
	'Malayalam'
)

-- Select the values 
SELECT * FROM StoreNonEnglish