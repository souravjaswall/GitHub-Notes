/* =========================================================
   MYSQL PRACTICAL FILE
   DATABASE: bankdb
   TABLE: employees
   ========================================================= */


/* =========================================================
   1. SHOW DATABASES
   ========================================================= */
SHOW DATABASES;


/* =========================================================
   2. SELECT DATABASE
   ========================================================= */
USE bankdb;


/* =========================================================
   3. SHOW TABLES
   ========================================================= */
SHOW TABLES;


/* =========================================================
   4. DESCRIBE TABLE STRUCTURE
   ========================================================= */
DESC employees;


/* =========================================================
   5. DISPLAY ALL RECORDS
   ========================================================= */
SELECT * FROM employees;


/* =========================================================
   6. STRING FUNCTIONS
   ========================================================= */

-- Reverse full name
SELECT emp_id,
       REVERSE(CONCAT(first_name, ' ', last_name)) AS reversed_name
FROM employees;

-- Convert email to uppercase
SELECT emp_id, UPPER(email) AS email_upper
FROM employees;

-- Convert department to lowercase
SELECT emp_id, LOWER(dept) AS dept_lower
FROM employees;

-- Length of first name
SELECT first_name,
       CHAR_LENGTH(first_name) AS name_length
FROM employees;

-- Email length greater than 15
SELECT *
FROM employees
WHERE CHAR_LENGTH(email) > 15;


/* =========================================================
   7. REPEAT FUNCTION
   ========================================================= */
SELECT REPEAT(first_name, 2)
FROM employees
WHERE emp_id = 1;


/* =========================================================
   8. CONCAT & CONCAT_WS
   ========================================================= */

-- Concatenate all fields using :
SELECT CONCAT_WS(':', emp_id, first_name, last_name, desig, dept, email)
FROM employees;

-- Concatenate full name properly
SELECT CONCAT_WS(':',
       emp_id,
       CONCAT(first_name, ' ', last_name),
       desig,
       dept)
FROM employees;

-- First letter of designation + emp_id
SELECT CONCAT(LEFT(desig, 1), emp_id) AS code,
       first_name
FROM employees;


/* =========================================================
   9. INSERT MULTIPLE RECORDS
   ========================================================= */
INSERT INTO employees (first_name, last_name, desig, dept, email)
VALUES
('Rahul', 'Sharma', 'Sales', 'Sales', 'rahul.sharma@gmail.com'),
('Priya', 'Verma', 'Developer', 'IT', 'priya.verma@gmail.com'),
('Amit', 'Kumar', 'Accounts', 'Finance', 'amit.kumar@gmail.com'),
('Neha', 'Singh', 'HR', 'HR', 'neha.singh@gmail.com'),
('Rohan', 'Mehta', 'Marketing', 'Marketing', 'rohan.mehta@gmail.com'),
('Sneha', 'Patel', 'IT', 'IT', 'sneha.patel@gmail.com'),
('Arjun', 'Reddy', 'Operations', 'Operations', 'arjun.reddy@gmail.com');


/* =========================================================
   10. UPDATE EMPLOYEE IDs
   ========================================================= */
UPDATE employees SET emp_id = 4 WHERE emp_id = 19;
UPDATE employees SET emp_id = 5 WHERE emp_id = 20;
UPDATE employees SET emp_id = 6 WHERE emp_id = 21;
UPDATE employees SET emp_id = 7 WHERE emp_id = 22;
UPDATE employees SET emp_id = 8 WHERE emp_id = 23;
UPDATE employees SET emp_id = 9 WHERE emp_id = 24;
UPDATE employees SET emp_id = 10 WHERE emp_id = 25;


/* =========================================================
   11. UPDATE DEPARTMENT
   ========================================================= */
UPDATE employees
SET dept = 'IT'
WHERE emp_id = 3;


/* =========================================================
   12. DISTINCT & ORDER BY
   ========================================================= */

-- Distinct departments
SELECT DISTINCT dept FROM employees;

-- Order by first name (ASC)
SELECT * FROM employees ORDER BY first_name;

-- Order by first name (DESC)
SELECT * FROM employees ORDER BY first_name DESC;


/* =========================================================
   13. LIKE OPERATOR
   ========================================================= */

-- Designation containing 'Ma'
SELECT * FROM employees
WHERE desig LIKE '%Ma%';

-- First name with exactly 5 characters
SELECT * FROM employees
WHERE first_name LIKE '_____';

-- First name starting with S
SELECT * FROM employees
WHERE first_name LIKE 'S_____';


/* =========================================================
   14. ALTER TABLE – ADD SALARY COLUMN
   ========================================================= */
ALTER TABLE employees
ADD COLUMN salary INT NOT NULL DEFAULT 50000;


/* =========================================================
   15. UPDATE SALARY VALUES
   ========================================================= */
UPDATE employees SET salary = 52000 WHERE emp_id = 1;
UPDATE employees SET salary = 75000 WHERE emp_id = 3;
UPDATE employees SET salary = 65000 WHERE emp_id = 5;
UPDATE employees SET salary = 58000 WHERE emp_id = 6;
UPDATE employees SET salary = 55000 WHERE emp_id = 7;
UPDATE employees SET salary = 62000 WHERE emp_id = 8;
UPDATE employees SET salary = 68000 WHERE emp_id = 9;
UPDATE employees SET salary = 72000 WHERE emp_id = 10;


/* =========================================================
   16. ORDER BY SALARY
   ========================================================= */

-- Highest salary first
SELECT * FROM employees
ORDER BY salary DESC;

-- Employee with highest salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;


/* =========================================================
   17. LIMIT CLAUSE
   ========================================================= */

-- First 3 records
SELECT * FROM employees LIMIT 3;

-- Records from position 2 (4 rows)
SELECT * FROM employees LIMIT 1, 4;


/* =========================================================
   18. AGGREGATE FUNCTIONS
   ========================================================= */

-- Total employees
SELECT COUNT(emp_id) FROM employees;

-- Count distinct departments
SELECT COUNT(DISTINCT dept) FROM employees;

-- Count managers
SELECT COUNT(emp_id)
FROM employees
WHERE desig = 'Manager';

-- Maximum salary
SELECT MAX(salary) FROM employees;

-- Employee with max salary
SELECT emp_id, first_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Min & Max first name
SELECT MIN(first_name) FROM employees;
SELECT MAX(first_name) FROM employees;


/* =========================================================
   19. GROUP BY
   ========================================================= */
SELECT dept, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY dept;


/* =========================================================
   20. SUBQUERY WITH IN
   ========================================================= */
SELECT emp_id, first_name
FROM employees
WHERE dept IN (
    SELECT dept
    FROM employees
    WHERE first_name LIKE '_____'
);
