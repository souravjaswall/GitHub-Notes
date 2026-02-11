
1. Login to MySQL
Use MySQL monitor to connect to the server. Commands end with ; or \g.
2. Show Databases
SHOW DATABASES; — Displays all existing databases.
3. Create Database
CREATE DATABASE bankdb; — Creates a new database.
4. Select Database
USE bankdb; — Selects the database to work on.
5. Create Table
CREATE TABLE employees ( emp_id INT PRIMARY KEY AUTO_INCREMENT, name
VARCHAR(15) NOT NULL, desig VARCHAR(15) DEFAULT 'Probation', dept VARCHAR(15) );
6. Insert Records
INSERT INTO employees (name, desig, dept) VALUES ('Sourav', DEFAULT, 'CSE'), ('Nitish',
'Intern', 'CSE');
7. View Table Structure
DESC employees; — Shows columns, data types, keys, and constraints.
8. Fetch Records
SELECT * FROM employees; — Displays all records.
9. Conditional Select
SELECT * FROM employees WHERE dept = 'CSE';
10. Update Records
UPDATE employees SET dept = 'B.E.C.S.E' WHERE emp_id = 2;
11. Alter Table (Add Column)
ALTER TABLE employees ADD email VARCHAR(50);
12. Add UNIQUE Constraint
ALTER TABLE employees ADD UNIQUE (email);
13. Update Email Values
UPDATE employees SET email='sourav@gmail.com' WHERE emp_id=1; UPDATE employees
SET email='nitish@gmail.com' WHERE emp_id=2;
Important Exam Points
• AUTO_INCREMENT automatically generates unique numbers.
• PRIMARY KEY uniquely identifies a record.
• NOT NULL does not allow empty values.
• DEFAULT assigns a value if none is provided.
• UNIQUE prevents duplicate values.
• Always USE database before creating tables






-- Show all databases
SHOW DATABASES;

-- Select database
USE bankdb;

-- Show tables
SHOW TABLES;

-- Describe table structure
DESC employees;

-- View all records
SELECT * FROM employees;

-- Update department of emp_id 4
UPDATE employees 
SET dept = "I.T" 
WHERE emp_id = 4;

-- Delete employee with emp_id 4
DELETE FROM employees 
WHERE emp_id = 4;

-- Add new column last_name after name
ALTER TABLE employees 
ADD last_name VARCHAR(50) 
AFTER name;

-- Update last names
UPDATE employees SET last_name = "Jaswal" WHERE emp_id = 1;
UPDATE employees SET last_name = "Sharma" WHERE emp_id = 2;
UPDATE employees SET last_name = "Sukhija" WHERE emp_id = 3;

-- Rename column name to FIRST_NAME
ALTER TABLE employees 
RENAME COLUMN name TO FIRST_NAME;

-- Rename FIRST_NAME to first_name
ALTER TABLE employees 
RENAME COLUMN FIRST_NAME TO first_name;

-- View updated table
SELECT * FROM employees;

-- Concatenate first and last name
SELECT emp_id,
       CONCAT(first_name, last_name) AS Full_Name
FROM employees;

-- Concatenate with space
SELECT emp_id,
       CONCAT(first_name, " ", last_name) AS Full_Name
FROM employees;

-- Concatenate all columns using CONCAT
SELECT CONCAT("-", emp_id, first_name, last_name, desig, dept, email)
FROM employees;

-- Concatenate using CONCAT_WS (cleaner way)
SELECT CONCAT_WS("-", emp_id, first_name, last_name, desig, dept, email)
FROM employees;

-- Extract part of email
SELECT SUBSTRING(email, 1, 7) AS Email FROM employees;
SELECT SUBSTRING(email, 1, 10) AS Email FROM employees;
SELECT SUBSTRING(email, 1, 12) AS Email FROM employees;

-- Replace example (not meaningful for integers but shown)
SELECT REPLACE(emp_id, 1, 01) FROM employees;
