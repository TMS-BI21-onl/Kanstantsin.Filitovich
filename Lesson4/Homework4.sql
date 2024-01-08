--3.
In case all rows in the table are unique.

--4.
--a)
SELECT COUNT (distinct UnitMeasureCode)
FROM [Production].[UnitMeasure]        -- 38
--WHERE UnitMeasureCode LIKE 'T%'      -- 0

INSERT INTO [Production].[UnitMeasure] 
VALUES ('TT1', 'Test 1', '2020-09-09 00:00:000'),
       ('TT2', 'Test 2', getdate())

SELECT COUNT (distinct UnitMeasureCode)
FROM [Production].[UnitMeasure]        
WHERE UnitMeasureCode LIKE 'T%'          -- 2

--b)
SELECT * 
INTO Production.UnitMeasureTest
FROM [Production].[UnitMeasure]
WHERE UnitMeasureCode = 'CAN' OR UnitMeasureCode LIKE 'T%';

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode;

--c)
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode = 'TTT'

--d)
DELETE
FROM Production.UnitMeasureTest

--e)
SELECT SalesOrderID, LineTotal,
	MAX (LineTotal) OVER (PARTITION BY SalesOrderID) AS max,
	MIN (LineTotal) OVER (PARTITION BY SalesOrderID) AS min,
	AVG (LineTotal) OVER (PARTITION BY SalesOrderID) AS avg
FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID IN (43659, 43669)

--f)
SELECT FirstName, LastName, TerritoryGroup, CONCAT (UPPER( LEFT(LastName, 3)), 'login', TerritoryGroup) AS Login 
	, DENSE_RANK() OVER (ORDER BY SalesYTD DESC) AS RankYTD
	, DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) AS RankLY
FROM Sales.vSalesPerson

SELECT TOP 1 *
FROM Sales.vSalesPerson
ORDER BY SalesLastYear DESC     --Ranjit Varkey Chudukatil

SELECT TOP 1 *
FROM Sales.vSalesPerson
ORDER BY SalesYTD DESC    --Linda Mitchell

--g) 
SELECT DATEADD(WEEKDAY,1,getdate())


--5.
count(1) = 4
count(name) = 2
count(id) = 4
count(*) = 4







