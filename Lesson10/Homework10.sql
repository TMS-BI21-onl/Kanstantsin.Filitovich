SELECT Year
	,[December]
	,[January]
	,[February]
FROM (SELECT DATEPART(YEAR, w.StartDate) AS Year
	,DATENAME(MONTH, w.StartDate) AS Month
	,SUM(w.OrderQty) AS Qty
	FROM [Production].[WorkOrder] w
	WHERE DATENAME(MONTH, w.StartDate) IN ('December','January','February')
	GROUP BY DATEPART(YEAR, w.StartDate), DATENAME(MONTH, w.StartDate)) AS Table1
PIVOT
	(SUM(Qty)
	FOR Month IN ([December],[January],[February])) AS PivotTable
ORDER BY Year

