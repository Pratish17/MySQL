-- To Create and Use Database
CREATE DATABASE BANK_DATA;
USE BANK_DATA;

-- To create table
CREATE TABLE EMP_DATA(
  Id INT PRIMARY KEY,
  Emp_name VARCHAR(20),
  Department VARCHAR(20),
  Salary INT,
  Gender VARCHAR(20),
  Age INT,
  City VARCHAR(20)
);

-- Inset data into table
INSERT INTO EMP_DATA
(Id, Emp_name, Department, Salary, Gender, Age, City)
VALUES
(1001, 'John Doe', 'IT', 35000, 'Male', 24, 'Mumbai'),
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London'),
(1003, 'Jems Brown', 'Finance', 50000, 'Male', 30, 'London'),
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'Pune'),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London'),
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 24, 'Mumbai'),
(1007, 'Pratish Bhoir', 'IT', 25000, 'Male', 26, 'Mumbai');

CREATE TABLE job_history (
  Id decimal(6,0) NOT NULL,
  START_DATE date NOT NULL,
  END_DATE date NOT NULL,
  JOB_ID varchar(10) NOT NULL,
  DEPARTMENT_ID decimal(4,0) DEFAULT NULL
  );

INSERT INTO job_history
(Id, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
VALUES
(1002,'1993-01-13','1998-07-24','IT_PROG',60),
(1001,'1989-09-21','1993-10-27','AC_ACCOUNT',110),
(1001,'1993-10-28','1997-03-15','AC_MGR',110),
(2001,'1996-02-17','1999-12-19','MK_REP',20),
(1104,'1998-03-24','1999-12-31','ST_CLERK',50),
(1202,'1999-01-01','1999-12-31','ST_CLERK',50),
(1007,'1987-09-17','1993-06-17','AD_ASST',90),
(1006,'1998-03-24','1998-12-31','SA_REP',80),
(1005,'1999-01-01','1999-12-31','SA_MAN',80),
(2000,'1994-07-01','1998-12-31','AC_ACCOUNT',90);

-- To show databases and tables 
SHOW DATABASES;
SHOW TABLES;
DESC EMP_DATA;

-- Select Statement
SELECT * FROM job_history;
SELECT*FROM EMP_DATA;
SELECT DISTINCT Department FROM EMP_DATA;

-- Where clause
SELECT Salary FROM EMP_DATA
WHERE Salary > 40000;

-- Limit clause
SELECT * FROM EMP_DATA LIMIT 5 OFFSET 3;

-- Order By clause
SELECT * FROM EMP_DATA ORDER BY Department DESC;

-- Aggregate functions
SELECT COUNT(Department) FROM EMP_DATA;
SELECT MAX(Salary) FROM EMP_DATA;
SELECT MIN(Salary) FROM EMP_DATA;
SELECT AVG(Salary) FROM EMP_DATA;
SELECT SUM(Salary) FROM EMP_DATA;

-- Group By and Having Clause
SELECT Id, Age, Salary
FROM EMP_DATA
WHERE Age>25
GROUP BY Id 
HAVING Salary>=50000
ORDER BY Salary DESC;

-- Update Statement
UPDATE EMP_DATA
SET Salary = Salary * 1.10
WHERE Salary<40000;

-- Delete Statement
DELETE FROM EMP_DATA
WHERE EMP_Name = 'Pratish Bhoir';

-- Alter Commands
ALTER TABLE EMP_DATA ADD Email varchar(40);
ALTER TABLE EMP_DATA MODIFY Email varchar(20);
ALTER TABLE EMP_DATA DROP COLUMN Email;
ALTER TABLE EMPY_DATA RENAME TO EMP_DATA;
ALTER TABLE EMP_DATA CHANGE Emp_name Namee varchar(30);

-- String functions
SELECT CONCAT(Namee, '-', City) AS full_name FROM EMP_DATA;
SELECT UPPER(Namee) FROM EMP_DATA;
SELECT SUBSTRING(Namee, 1, 4) FROM EMP_DATA;
SELECT length(Namee) FROM EMP_DATA;
SELECT TRIM(Namee) FROM EMP_DATA;
SELECT REPLACE(Namee, 'John Doe', 'Pratish Bhoir') FROM EMP_DATA;

-- Numeric functions
SELECT ABS(-100);
SELECT ROUND(8.49);
SELECT CEILING(98.23);
SELECT FLOOR(2.99);
SELECT POWER(2, 3);
SELECT MOD(10, 3);

-- Date and Time functions
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT DATEDIFF('2024-04-20', '1997-11-30');

-- Conditional functions
-- Using IF 
SELECT Salary,
if (Salary>=50000, 'Good', 'Moderate') AS Skill_Rating
FROM EMP_DATA;

-- Using CASE
SELECT City,
CASE
WHEN City='London' THEN 'Good'
ELSE 'Not_Good'
END AS CITY_DESC
FROM EMP_DATA;

SELECT NULLIF(120, 10);

-- Using Coalesce
SELECT City,
COALESCE(City, 'NO CITY NAME PROVIDED') AS CITY_INFO
FROM EMP_DATA;

-- Conversion functions
-- Handling different data types and formating a data as needed
-- CAST, CONVERT, TO_CHAR, TO_NUMBER, TO_DATE, PARSE

-- To create view - its allows to save complex queries as virtual tables
CREATE VIEW Salary_Emp AS
SELECT Id, Namee, Salary
FROM EMP_DATA
WHERE Id=1001;

DROP VIEW Salary_Emp;
SELECT * FROM Salary_Emp;

-- To create an Index- its improves the speed of data retrieval operations
CREATE INDEX idx_salary ON EMP_DATA (Salary);

-- Set Operators- this is used to perform operations on the result sets of two or more SELECT queries
-- The most common set operators are UNION, UNION ALL, INTERSECT, EXCEPT OR MINUS
SELECT Namee FROM Emp_data
UNION
SELECT JOB_ID FROM job_history;

-- Joins in SQL- to combine rows from two or more tables, based on a related column between them.
SELECT * 
FROM Emp_data
INNER JOIN job_history
ON Emp_data.Id = job_history.ID;

SELECT * 
FROM Emp_data
LEFT JOIN job_history
ON Emp_data.Id = job_history.ID
UNION
SELECT * 
FROM Emp_data
RIGHT JOIN job_history
ON Emp_data.Id = job_history.ID;

SELECT * 
FROM Emp_data
LEFT JOIN job_history
ON Emp_data.Id = job_history.ID
WHERE job_history.ID IS NULL;