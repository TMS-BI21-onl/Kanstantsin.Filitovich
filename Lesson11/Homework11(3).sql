Create table dbo.HW11 (Function_name nvarchar(50) ,Function_count INT) 

--- 

MERGE dbo.HW11 AS t
USING 
	(SELECT Alex AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;		
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Carlos AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Charles AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Daniel AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Esteban AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Fred AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT George AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Lando AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;
GO
MERGE dbo.HW11 AS t
USING 
	(SELECT Lewis AS Function_name , count(Alex) AS cnt
	FROM dbo.data_for_merge 
	WHERE Alex IS NOT NULL
	GROUP BY Alex) AS s
ON  s.Function_name=t.Function_name
WHEN MATCHED THEN UPDATE SET t.Function_count = t.Function_count + s.cnt
WHEN NOT MATCHED THEN INSERT VALUES (s.Function_name, s.cnt)
;



