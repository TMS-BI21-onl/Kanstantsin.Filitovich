CREATE PROCEDURE HumanResources.UpdateNationalIDNumber   
	@BusinessEntityID int,
	@NationalIDNumber nvarchar(15)	   
AS  
BEGIN 
UPDATE HumanResources.Employee
SET NationalIDNumber = @NationalIDNumber
WHERE BusinessEntityID = @BusinessEntityID
END 
  
 
EXEC HumanResources.uspUpNationalIDNumber '879341111', 15; 