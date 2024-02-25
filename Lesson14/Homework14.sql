--1
CREATE VIEW v_top50Emp
AS
SELECT DISTINCT TOP 50 [EMPSID]
			,[FIRSTNAME] 
			,[LASTNAME]
			,[DEPARTMENT] 
			,sum(points) AS Score
FROM (
	SELECT 	e.[FIRSTNAME] 
			,e.[LASTNAME]
			,e.[DEPARTMENT]
			,e.[EMPSID]
			,CAST(r.[REQDATE] as date) as o_Date
			,COUNT(r.[REQSID]) as cnt,
			CASE WHEN COUNT(r.[REQSID]) >= 10 THEN 3
			WHEN COUNT(r.[REQSID]) BETWEEN 5 AND 9 THEN 2
			ELSE 1
			END AS points
	FROM [dbo].[REQUESTS] r JOIN [dbo].[EMPLOYEE] e ON e.[EMPSID]=r.[EMPSID]
	GROUP BY  e.[FIRSTNAME], e.[LASTNAME], e.[DEPARTMENT], e.[EMPSID], CAST(r.[REQDATE] as date)
) x1
GROUP BY [EMPSID], [FIRSTNAME], [LASTNAME], [DEPARTMENT]
ORDER BY Score DESC

--2
a.
Убрать заливку фона и самой диаграммы.
Столбцы одним цветом и убрать тени.
Убрать легенду.
Убрать подписи осей.

b.
Искажение данных.
Сделать 2D, сплошная заливка.
По вертикальной оси значения начинать с 0.
Нет названия графика.

Либо можно заменить на круговую диаграмму

c.
Изменить название.
График сделать линейным.
Сократить подписи и развернуть их.
Подписать точки на линейном графике с точными значениями.



