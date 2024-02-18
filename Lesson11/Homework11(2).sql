--1
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Гости WHERE пол = 'M') AS PersentOfMan
FROM Гости g
JOIN Бронь b ON g.id = b.id_гостя
JOIN Номера n ON b.id_номера = n.id
WHERE g.пол = 'M' 
AND n.количество_мест = 1 
AND DATEDIFF(YEAR(b.дата_отбытия), 1) = YEAR(GETDATE()) - 1

--2
SELECT n.тип_комфортности,
       YEAR(b.дата_прибытия) AS год,
       SUM(n.стоимость_за_сутки) / COUNT(DISTINCT b.id_номера) AS средняя_выручка
FROM Номера n
JOIN Бронь b ON n.id = b.id_номера
GROUP BY n.тип_комфортности, YEAR(b.дата_прибытия)
PIVOT
(AVG(средняя_выручка)
  FOR год IN ([2021], [2022], [2023])) AS PivotTable
