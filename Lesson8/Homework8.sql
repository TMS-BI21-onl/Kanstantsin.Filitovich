WITH cte_FN AS 	(SELECT DISTINCT FirstName
		FROM [Person].[Person]),		
cte_LN AS (SELECT DISTINCT LastName
		FROM [Person].[Person])
SELECT TOP 1000000 *
FROM cte_FN
CROSS JOIN cte_LN

