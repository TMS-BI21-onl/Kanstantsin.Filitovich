--2.
--a)
SELECT  Name,
	CASE WHEN StandardCost = 0 OR StandardCost IS NULL THEN 'Not for sale'
	     WHEN StandardCost > 0 AND StandardCost < 100 THEN '<$100'
	     WHEN StandardCost >= 100 AND StandardCost < 500 THEN ' <$500'
	ELSE '>= $500'
	END as PriceRange
FROM [Production].[Product];

--b)
SELECT pv.ProductID, pv.BusinessEntityID, v.Name
FROM [Purchasing].[ProductVendor] pv
JOIN [Purchasing].[Vendor] v ON pv.BusinessEntityID = v.BusinessEntityID
WHERE pv.StandardPrice > 10
AND (v.Name LIKE '%X%' OR v.Name LIKE 'N%'); 

--c)
SELECT v.Name
FROM [Purchasing].[Vendor] v
LEFT JOIN [Purchasing].[ProductVendor] pv ON pv.BusinessEntityID = v.BusinessEntityID
WHERE pv.BusinessEntityID IS NULL 

--3.
--a)
SELECT p.Name, p.ListPrice
FROM [Production].[Product] p
JOIN [Production].[ProductModel] pm ON p.ProductModelID = pm.ProductModelID
WHERE pm.Name LIKE 'LL%'

--b)
SELECT x1.NAME 
FROM 
	(
	SELECT NAME FROM [Purchasing].[Vendor]
	UNION
	SELECT NAME FROM [Sales].[Store]
	) x1
ORDER BY x1.NAME

--c)
SELECT p.Name, count(so.SpecialOfferID) AS NumberOfOffers
FROM [Sales].[SpecialOffer] so
JOIN [Sales].[SpecialOfferProduct] sop ON so.SpecialOfferID = sop.SpecialOfferID
JOIN [Production].[Product] p ON p.ProductID = sop.ProductID
GROUP BY p.Name
HAVING count(so.SpecialOfferID) > 1

