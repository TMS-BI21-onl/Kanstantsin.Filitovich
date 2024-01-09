--1.1)
SELECT *
FROM Voditeli
WHERE Staj NOT IN (3, 5, 6, 10)
AND MestoPropiski = 'eee'

--1.2)
SELECT v.№Paspota
FROM Voditeli v
LEFT JOIN Dispetcherskaya d ON v.KodVoditelya = d.KodVoditelya
WHERE d.Putevki <1

--1.3)
SELECT a.Pegistracionnii№Avto, d.VremyaPribitiya, d.VremyaOtbitiya, m.PunktNaznacheniya
FROM Dispetcherskaya d
JOIN Avtomobili a ON a.KodAvto = d.KodAvto
JOIN Marshrut m ON m.KodMarshruta = d.Putevka
WHERE a.GodVipuskaAvto = 2015

--2.1)
SELECT COUNT
FROM (SELECT LEFT(First_name, 1)
FROM Employees) as x1
ORDER BY 

SELECT LEFT(First_name, 1) as letter, COUNT(Employee_ID) as count
FROM Employees
GROUP by letter
HAVING count >1
ORDER BY count

--2.2)
SELECT count (Employee_ID) as num
FROM Employees e
JOIN Departments d ON e.Department_ID = d.Department_ID
WHERE 

--2.3)
SELECT *
FROM Employees 
WHERE Manager_ID is NULL

--2.3)
SELECT LENGTH(FIRST_NAME)
FROM Employees 