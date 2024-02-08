/*

1) Autocommit Transaction mode is the default transaction for the SQL Server. In this mode, each T-SQL statement is evaluated as a transaction and they are committed or rolled back according to their results. The successful statements are committed and the failed statements are rolled back immediately
2) Implicit Transaction mode enables to SQL Server to start an implicit transaction for every DML statement but we need to use the commit or rolled back commands explicitly at the end of the statements
3) Explicit Transaction mode provides to define a transaction exactly with the starting and ending points of the transaction

Implicit - SET IMPLICIT_TRANSACTIONS ON 
*/


BEGIN TRY
	BEGIN TRANSACTION 

		INSERT INTO [Details].[Products] VALUES
		(
			9,
			'Chair',
			60
		)
	COMMIT TRANSACTION 
END TRY 
BEGIN CATCH 
	ROLLBACK TRANSACTION 
	print 'Something went wrong roll back'
END CATCH 


/*
Commit
============
1) COMMIT permanently saves the changes made by current transaction.
2) Transaction can not undo changes after COMMIT execution.
3) When transaction is successful, COMMIT is applied.

Rollback
=============

1) ROLLBACK undo the changes made by current transaction.
2) Transaction reaches its previous state after ROLLBACK.
3) When transaction is aborted, ROLLBACK occurs

*/
