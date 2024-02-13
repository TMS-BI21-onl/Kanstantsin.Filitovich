--1) 
INSERT INTO manufacturer (name, country_id)
VALUES (HP, 4)

--2)
UPDATE user
SET age = age/3
WHERE name = 'Андрей'

--3)
SELECT name
FROM product
WHERE price = (SELECT MAX(price) FROM product)

SELECT TOP 1 name
FROM product
ORDER BY price DESC

SELECT name
FROM (SELECT name
     	,RANK() OVER (ORDER BY price DESC) AS rank
      	FROM product) p
WHERE rank = 1

SELECT name
FROM (SELECT name
  	,ROW_NUMBER() OVER (ORDER BY price DESC) AS rn
  	FROM product) p
WHERE rn = 1

SELECT name
FROM product p
JOIN (SELECT MAX(price) AS maxPrice
  	FROM product) p1
ON p.price = p1.maxPrice;

--4)
SELECT 
	u.name
	,ph.phone
	,u.age
FROM user u
JOIN phohe ph ON u.id = ph.user_id
WHERE ph.phone LIKE ('+3%4') OR u.age > 35

--5)
SELECT TOP 5 u.name
	,COUNT(o.user_id) AS topBuyers
FROM user u
JOIN order o ON u.id = o.user_id
GROUP BY u.name
ORDER BY topBuyers DESC

















