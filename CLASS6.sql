use AID3
Select * from EmployeeSales;

--Create the table
CREATE TABLE EmployeeSales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10,2),
    Status VARCHAR(20)
);

-- Insert sample data
INSERT INTO EmployeeSales (EmployeeName, Department, City, SaleDate, SaleAmount, Status)
VALUES
('John Smith', 'Electronics', 'New York', '2025-01-05', 1250.50, 'Completed'),
('Alice Johnson', 'Clothing', 'Los Angeles', '2025-01-08', 980.00, 'Pending'),
('Michael Brown', 'Furniture', 'Chicago', '2025-01-12', 1740.25, 'Completed'),
('Sarah Davis', 'Electronics', 'Houston', '2025-01-14', 2120.00, 'Completed'),
('David Wilson', 'Grocery', 'Phoenix', '2025-01-15', 325.75, 'Cancelled'),
('Emily Taylor', 'Clothing', 'Philadelphia', '2025-01-20', 765.40, 'Completed'),
('James Anderson', 'Furniture', 'San Antonio', '2025-01-23', 1880.90, 'Pending'),
('Linda Thomas', 'Grocery', 'San Diego', '2025-01-25', 245.30, 'Completed'),
('Robert Jackson', 'Electronics', 'Dallas', '2025-01-28', 3025.60, 'Completed'),
('Patricia White', 'Clothing', 'San Jose', '2025-02-01', 1080.00, 'Pending'),
('Charles Harris', 'Furniture', 'Austin', '2025-02-03', 1595.00, 'Completed'),
('Jennifer Martin', 'Grocery', 'Jacksonville', '2025-02-05', 445.20, 'Completed'),
('Joseph Thompson', 'Electronics', 'Fort Worth', '2025-02-08', 2680.50, 'Completed'),
('Mary Garcia', 'Clothing', 'Columbus', '2025-02-10', 875.40, 'Cancelled'),
('Christopher Martinez', 'Furniture', 'Charlotte', '2025-02-12', 2200.10, 'Pending'),
('Elizabeth Robinson', 'Grocery', 'San Francisco', '2025-02-14', 370.00, 'Completed'),
('Daniel Clark', 'Electronics', 'Indianapolis', '2025-02-17', 1920.00, 'Completed'),
('Susan Rodriguez', 'Clothing', 'Seattle', '2025-02-19', 1090.70, 'Pending'),
('Matthew Lewis', 'Furniture', 'Denver', '2025-02-21', 2050.60, 'Completed'),
('Karen Lee', 'Grocery', 'Washington', '2025-02-23', 560.00, 'Completed'),
('Steven Walker', 'Electronics', 'Boston', '2025-02-26', 2890.00, 'Completed'),
('Nancy Hall', 'Clothing', 'Nashville', '2025-03-01', 960.00, 'Pending'),
('Paul Allen', 'Furniture', 'El Paso', '2025-03-03', 1785.25, 'Completed'),
('Donna Young', 'Grocery', 'Detroit', '2025-03-05', 325.00, 'Cancelled'),
('Mark Hernandez', 'Electronics', 'Memphis', '2025-03-07', 2330.75, 'Completed'),
('Laura King', 'Clothing', 'Portland', '2025-03-09', 1020.90, 'Completed'),
('George Wright', 'Furniture', 'Oklahoma City', '2025-03-11', 1925.10, 'Completed'),
('Sarah Lopez', 'Grocery', 'Las Vegas', '2025-03-13', 415.50, 'Pending'),
('Edward Hill', 'Electronics', 'Louisville', '2025-03-15', 3075.80, 'Completed'),
('Barbara Scott', 'Clothing', 'Baltimore', '2025-03-17', 890.00, 'Completed'),
('Brian Green', 'Furniture', 'Milwaukee', '2025-03-19', 2100.30, 'Completed'),
('Jessica Adams', 'Grocery', 'Albuquerque', '2025-03-21', 355.90, 'Completed'),
('Kevin Baker', 'Electronics', 'Tucson', '2025-03-23', 2765.00, 'Pending'),
('Amy Nelson', 'Clothing', 'Fresno', '2025-03-25', 1045.20, 'Completed'),
('Andrew Carter', 'Furniture', 'Mesa', '2025-03-27', 1980.60, 'Completed'),
('Deborah Mitchell', 'Grocery', 'Sacramento', '2025-03-29', 495.40, 'Completed'),
('Joshua Perez', 'Electronics', 'Atlanta', '2025-03-31', 3180.00, 'Completed'),
('Sharon Roberts', 'Clothing', 'Kansas City', '2025-04-02', 970.10, 'Cancelled'),
('Ryan Turner', 'Furniture', 'Colorado Springs', '2025-04-04', 2075.80, 'Completed'),
('Carol Phillips', 'Grocery', 'Raleigh', '2025-04-06', 505.25, 'Completed'),
('Benjamin Campbell', 'Electronics', 'Omaha', '2025-04-08', 2950.90, 'Completed'),
('Ashley Parker', 'Clothing', 'Miami', '2025-04-10', 1110.50, 'Pending');

-- Verify
SELECT * FROM EmployeeSales;

insert into EmployeeSales(EmployeeName)
VALUES 
('SMITH'),
('ALIESTER');

--ISNULL()

SELECT EMPLOYEENAME,
ISNULL(CITY,'NO CITY'),
ISNULL(SALEDATE,'2025-04-10') AS SALESDATES,
ISNULL(Department,'UNKNOWN')
AS PRACTICEDEP
FROM EMPLOYEESALES;

SELECT EMPLOYEENAME,
COALESCE(CITY,'no CITY') AS 'NON-NULL-VALUE'
FROM EMPLOYEESALES;

SELECT DISTINCT EMPLOYEENAME FROM EmployeeSales;
--FILTERING
--WHERE
SELECT * 
FROM EmployeeSales
WHERE CITY = 'Chicago';

--LIKE/CONTAINS/
SELECT * 
FROM EmployeeSales
WHERE CONTAINS(EmployeeName,'Sar');

--FREETEXT
SELECT * 
FROM EmployeeSales
WHERE FREETEXT(Department,'ELCTRONICS');

--IN
SELECT * 
FROM EmployeeSales
WHERE CITY IN('Miami','Raleigh','Louisville');

--NOT IN
SELECT * 
FROM EmployeeSales
WHERE CITY not IN('Miami','Raleigh','Louisville');

--TOP
SELECT TOP 5 * 
FROM EmployeeSales



--COMBINED QUERY
SELECT DISTINCT TOP 10 CITY
FROM EmployeeSales
WHERE 
	Department IN ('Electronics','Clothing')
	AND STATUS IS NOT NULL
	AND SaleAmount >500 ORDER BY CITY;


--One to One relationship

CREATE TABLE STUDENTS(
STUDENTID INT IDENTITY PRIMARY KEY,
FIRSTNAME VARCHAR(50),
CITY VARCHAR(50)
);

INSERT INTO STUDENTS(FIRSTNAME, CITY)
VALUES ('WALI', 'ISLAMABAD')


CREATE TABLE STUDENTDETAILS(
DETAILID INT IDENTITY PRIMARY KEY,
PHONE VARCHAR(20),
ADDRESS VARCHAR(100),
STUDENTID INT UNIQUE
);

INSERT INTO STUDENTDETAILS(PHONE, ADDRESS, STUDENTID)
VALUES('+921265566', 'DEFENCE 5 , ISLAMABAD', 2)


--RELATION MAKING WITH FK
ALTER TABLE STUDENTDETAILS
ADD CONSTRAINT FK_STUDENT_DETAIL
FOREIGN KEY(STUDENTID) REFERENCES STUDENTS(STUDENTID);

SELECT * FROM STUDENTS;
SELECT * FROM STUDENTDETAILS;

SELECT 
S.FIRSTNAME,
S.CITY, 
D.PHONE, 
D.ADDRESS 
FROM STUDENTS S JOIN STUDENTDETAILS D
ON S.STUDENTID = D.STUDENTID

SELECT * FROM STUDENTDETAILS, STUDENTS

--Many to Many

Create table stud(
StudentID int identity primary key,
Name Varchar(50)
);
INSERT INTO Stud (Name) VALUES
('Ali Raza'),
('Ayesha Khan'),
('Bilal Ahmed'),
('Fatima Tariq');

--courses Table
create table courses(
CID int identity primary key,
CName Varchar(50)
);
INSERT INTO Courses (CName) VALUES
('CS'),      -- Computer Science
('SE');      -- Software Engineering

Create Table Enrollment(
EnrollID int identity primary key,
StudentID int,
CID INT,
);

Insert into Enrollment(StudentID,CID)
Values
(1,1),
(1,2),
(2,2),
(3,1),
(3,2)

Select * from stud,courses,Enrollment

--FK1
Alter table Enrollment
ADD Foreign key (StudentID)
 References Stud(StudentID);
 --FK2
Alter table Enrollment
ADD foreign Key (CID)
references Courses(CID);

Select * from Enrollment;

--INNER jOINS
SELECT E.ENROLLID, S.NAME, C.CNAME
FROM Enrollment E
INNER JOIN Stud S ON E.STUDENTID = S.STUDENTID
INNER JOIN courses C ON E.CID = C.CID;

--LEFT JOIN
SELECT S.NAME, C.CNAME
FROM Enrollment E
lEFT JOIN Stud S ON E.STUDENTID = S.STUDENTID
LEFT JOIN courses C ON E.CID = C.CID;

--RIGHT JOIN
SELECT E.ENROLLID, S.NAME, C.CNAME
FROM Enrollment E
RIGHT JOIN Stud S ON E.STUDENTID = S.STUDENTID
RIGHT JOIN courses C ON E.CID = C.CID;


--FULL OUTER
SELECT E.ENROLLID, S.NAME, C.CNAME
FROM Enrollment E
FULL OUTER JOIN Stud S ON E.STUDENTID = S.STUDENTID
FULL OUTER JOIN courses C ON E.CID = C.CID;

--CROSS JOIN
SELECT S.NAME, C.CNAME
FROM STUD S
CROSS JOIN COURSES C;

--SELF JOIN
SELECT S1.NAME AS STUDENT, S2.NAME AS BUDDY
FROM STUD S1
JOIN STUD S2 ON S1.StudentID = S2.StudentID;


