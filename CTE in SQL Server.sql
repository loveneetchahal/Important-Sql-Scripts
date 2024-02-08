/*

1) A CTE is a temporary result set, that can be referenced within a 
  SELECT, INSERT, UPDATE, or DELETE statement, that immediately follows the CTE.

2) CTEs allow you to perform multi-level aggregations

3) In SQL, we will use sub-queries to join the records or filter the records from a sub-query. Whenever we refer the same data or join the same set of records using a sub-query, the code maintainability will be difficult. A CTE makes improved readability and maintenance easier.


*/

CREATE TABLE Details.Employee
(
  Id int Primary Key,
  FirstName nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)


CREATE TABLE Details.Department
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into Details.Department values (1,'IT')
Insert into Details.Department values (2,'Payroll')
Insert into Details.Department values (3,'HR')
Insert into Details.Department values (4,'Admin')


Insert into Details.Employee values (1,'John', 'Male', 3)
Insert into Details.Employee values (2,'Mike', 'Male', 2)
Insert into Details.Employee values (3,'Pam', 'Female', 1)
Insert into Details.Employee values (4,'Todd', 'Male', 4)
Insert into Details.Employee values (5,'Sara', 'Female', 1)
Insert into Details.Employee values (6,'Ben', 'Male', 3)

 ---- Syntax 
 WITH cte_name (Column1, Column2, ..)
AS
( CTE_query )


With EC(DepartmentId, TotalEmployees)
as
(
 Select DepartmentId, COUNT(*) as TotalEmployees
 from Details.Employee
 group by DepartmentId
)

Select DeptName, TotalEmployees
from Details.Department AS DD
join EC
on  DD.DeptId = EC.DepartmentId
order by TotalEmployees



------ Multiple CTEs 

With ECByDept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from Details.Employee AS DE
 join Details.Department  AS DD
 on  DE.DepartmentId = DD.DeptId
 where DeptName IN ('Payroll','IT')
 group by DeptName
),
ECByAnotherDept(DepartmentName, Total)
as
(
 Select DeptName, COUNT(Id) as TotalEmployees
 from Details.Employee AS DE
 join Details.Department  AS DD
 on DE.DepartmentId = DD.DeptId
 group by DeptName 
)
Select * from ECByDept 
UNION
Select * from ECByAnotherDept



/*

1) CTE improves the code readability.
2) CTE provides recursive programming.
3) CTE makes code maintainability easier.
4) Though it provides similar functionality as a view, it will not store the definition in metadata.


*/
