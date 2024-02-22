--1) 
SELECT [ProductSubcategoryID]
		,[Weight]
FROM [Production].[Product]
WHERE [Weight] >150

--2)
SELECT [Name],[StandardCost]
FROM [Production].[Product]
WHERE [StandardCost] = (SELECT MAX([StandardCost]) FROM [Production].[Product])

SELECT TOP 1 WITH TIES [Name],[StandardCost]
FROM [Production].[Product]
ORDER BY [StandardCost] DESC

SELECT [Name]
FROM (SELECT [Name]
     	,RANK() OVER (ORDER BY [StandardCost] DESC) AS rank
      	FROM [Production].[Product]) p
WHERE rank = 1

SELECT [Name]
FROM (SELECT [Name]
  	,ROW_NUMBER() OVER (ORDER BY [StandardCost] DESC) AS rn
  	FROM [Production].[Product]) p
WHERE rn = 1

SELECT [Name]
FROM [Production].[Product] p
JOIN (SELECT MAX([StandardCost]) AS maxPrice
  	FROM [Production].[Product]) p1
ON p.[StandardCost] = p1.maxPrice

--3)
SELECT ClientID, FirstName, Lastname
FROM Client
EXCEPT
SELECT c.ClientID, c.FirstName, c.Lastname
FROM Client c
JOIN Order o ON c.ClientID = o.ClientID
WHERE DATEDIFF(day, o.OrderDate, GETDATE()) > 365 
OR o.OrderDate IS NULL

--4)
SELECT v.VendorID, v.Name, COUNT(o.OrderID) AS order_count
FROM Vendor v
JOIN Order o ON v.VendorID = o.VendorID
WHERE DATEDIFF(day, o.OrderDate, GETDATE()) <= 1825 
GROUP BY v.VendorID, v.Name

--5)
SELECT DISTINCT n.category
FROM Notifications n
JOIN Users u ON n.user_id = u.id
WHERE u.email = 'alex@gmail.com'
AND n.is_read = false
GROUP BY n.category
HAVING COUNT(*) > 50



















