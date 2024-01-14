--6.
CREATE TABLE Patients
	( 
	ID  INT IDENTITY (1,1) PRIMARY KEY,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	SSN NVARCHAR(10) UNIQUE,
	Email AS CONCAT(UPPER(LEFT(FirstName,1)), LOWER(LEFT(LastName,3)),'@mail.com'),
	Temp NUMERIC(3,1),
	CreatedDate AS GETDATE()
	);

--7.
INSERT INTO Patients (FirstName, LastName, SSN, Temp)
VALUES ('Sarah', 'Thompson', '0000000001', 36.9),
       ('David', 'Lee', '0000000002', 38.1),
       ('Olivia', 'Wilson', '0000000003', 37.5);

--8.
ALTER TABLE Patients
ADD TempType AS
	CASE 
	WHEN [Temp] <= 37 THEN '<= 37°C'
	ELSE '> 37°C'
	END

--9.
CREATE VIEW  Patients_V 
AS   
SELECT FirstName, LastName, SSN, Temp, CreatedDate, (Temp * 9 / 5 + 32) as TempF
FROM Patients 

--10.
CREATE FUNCTION ConvertTempF(@Temp NUMERIC(3,1))
RETURNS NUMERIC(3,1)
AS
BEGIN
	RETURN @Temp * 9 / 5 + 32;
END;

--11.



--12.
SELECT e.First_name, 
	CASE 
	WHEN  jh.END_DATE IS NULL THEN 'Currently Working '
	ELSE CONCAT('Left the company at ', END_DATE)
	END  AS status
FROM Employee e 
LEFT JOIN  Job_history  jh ON  e.Employee_ID=jh.Employee_ID

