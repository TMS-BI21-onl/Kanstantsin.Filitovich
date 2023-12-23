1.
a)
SELECT * 
FROM Sales.SalesTerritory

b)
SELECT TerritoryID, Name  
FROM Sales.SalesTerritory

c)
SELECT *  
FROM Person.Person 
WHERE LastName = 'Norman'

d)
SELECT *  
FROM Person.Person 
WHERE EmailPromotion != 2

3.
APPROX_COUNT_DISTINCT
CHECKSUM_AGG
COUNT_BIG
GROUPING
GROUPING_ID
STDEV
STDEVP
STRING_AGG
VAR
VARP

4.
a)
SELECT count(DISTINCT PersonType)
FROM Person.Person 
WHERE PersonType = 'M%'
OR EmailPromotion != 1

b)
SELECT TOP 3 *
FROM Sales.SpecialOffer 
WHERE ModifiedDate BETWEEN '2013-01-01' AND '2014-01-01'
ORDER BY DiscountPct DESC

c)
SELECT MIN(Weight) as MinWeight, MAX(Size) as MaxSize
FROM Production.Product 

d)
SELECT DISTINCT ProductSubcategoryID, MIN(Weight) as MinWeight, MAX(Size) as MaxSize
FROM Production.Product 
GROUP BY ProductSubcategoryID

e)
SELECT DISTINCT ProductSubcategoryID, MIN(Weight) as MinWeight, MAX(Size) as MaxSize
FROM Production.Product 
WHERE Color IS NOT NULL
GROUP BY ProductSubcategoryID




