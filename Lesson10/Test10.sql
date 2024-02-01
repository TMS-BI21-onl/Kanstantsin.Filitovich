--1)
SELECT 
	pp.[FirstName]
	,pp.[LastName]
	,ph.[PhoneNumber]
	,SUBSTRING(ph.[PhoneNumber], 1, 3) as CityID
FROM [Person].[Person] pp
JOIN [Person].[PersonPhone] ph ON pp.[BusinessEntityID] = ph.[BusinessEntityID]
WHERE SUBSTRING(ph.[PhoneNumber], 1, 3) LIKE '4_5'



--2)
SELECT 
	pp.[FirstName]
	,pp.[LastName]
	,DATEDIFF(year, [BirthDate], GETDATE()) AS Age
	,CASE 
		WHEN DATEDIFF(year, [BirthDate], GETDATE()) BETWEEN 17 AND 20 THEN 'Adolescence'
		WHEN DATEDIFF(year, [BirthDate], GETDATE()) BETWEEN 21 AND 59 THEN 'Adults'
		WHEN DATEDIFF(year, [BirthDate], GETDATE()) BETWEEN 60 AND 75 THEN 'Elderly'
		WHEN DATEDIFF(year, [BirthDate], GETDATE()) BETWEEN 76 AND 90 THEN 'Senile'
		END AS AgeGroup
FROM [Person].[Person] pp
JOIN [HumanResources].[Employee] em ON pp.[BusinessEntityID] = em.[BusinessEntityID]

--3)
SELECT 
    [Name] 
    ,[Color] 
    ,[StandardCost]
FROM [Production].[Product] c
WHERE [StandardCost] = (
        SELECT MAX([StandardCost])
        FROM [Production].[Product] x
        WHERE c.color = x.color)

SELECT 
    c.[Name]
    ,c.[Color]
    ,c.[StandardCost]
FROM  [Production].[Product] c
INNER JOIN (SELECT [Color],MAX([StandardCost]) AS maxCost
	FROM  [Production].[Product]
	GROUP BY [Color]) x ON x.Color = c.Color and x.maxCost = c.StandardCost

SELECT 
    c.[Name]
    ,c.[Color]
    ,c.[StandardCost]
FROM  [Production].[Product] c
WHERE c.[Name] = (SELECT TOP 1 x.[Name] 
	FROM  [Production].[Product] x
	WHERE x.Color = c.Color
	ORDER BY x.[StandardCost] DESC)

