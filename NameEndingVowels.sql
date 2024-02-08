SELECT [StudentId]
      ,[FirstName]
      ,[LastName]
      ,[RegistrationNumber]
      ,[Degree]
      ,[CreatedDate]
      ,[CreatedBy]
  FROM [PracticalWorks].[Details].[StudentDetails]  
 WHERE FirstName Like '%[aeiou]'