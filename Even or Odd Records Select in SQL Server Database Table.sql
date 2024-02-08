--- SELECT EVENT RECORDS  

SELECT [StudentId]
      ,[FirstName]
      ,[LastName]
      ,[RegistrationNumber]
      ,[Degree]
      ,[CreatedDate]
      ,[CreatedBy]
  FROM [Details].[StudentDetails] WHERE StudentId % 2=0;



-----  SELECT ODD RECORDS 


SELECT [StudentId]
      ,[FirstName]
      ,[LastName]
      ,[RegistrationNumber]
      ,[Degree]
      ,[CreatedDate]
      ,[CreatedBy]
  FROM [Details].[StudentDetails] WHERE StudentId % 2!=0;

