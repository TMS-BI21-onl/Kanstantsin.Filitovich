SELECT CONCAT(p.FirstName,' ',p.LastName) AS Name, CONCAT(pp.FirstName,' ',pp.LastName) AS FatherName
FROM People p
JOIN People pp ON p.ID_Father = pp.ID
WHERE p.FirstName = 'Дмитрий'

