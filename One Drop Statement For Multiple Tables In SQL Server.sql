--------  Multiple tables drop in one drop statement 
/* 
	 Syntax
	 =======

	1) DROP TABLE table_name1,table_name2,.... table_nameN
	2) DROP TABLE IF EXISTS  table_name1,table_name2,.... table_nameN
*/

--- Example 1
DROP TABLE DemoIndex ,DemoIndexFirstName ,DemoNonIndex

----- Example 2 - If we are not sure if the table exists or not, we can also check that with IF EXISTS keywords
DROP TABLE IF EXISTS  DemoIndex ,DemoIndexFirstName ,DemoNonIndex