-- =========================
-- 1️⃣ Create Database
-- =========================
CREATE DATABASE bankdb;
USE bankdb;

-- =========================
-- 2️⃣ Create Table
-- =========================
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    dept VARCHAR(50),
    salary INT
);

-- =========================
-- 3️⃣ Insert Data
-- =========================
INSERT INTO employees (first_name, last_name, dept, salary) VALUES
('Sourav', 'Kumar', 'Loan', 50000),
('Amit', 'Sharma', 'Loan', 60000),
('Priya', 'Singh', 'HR', 45000),
('Rahul', 'Verma', 'IT', 70000),
('Neha', 'Patel', 'IT', 65000),
('Rohit', 'Das', 'HR', 48000);

-- =========================
-- 4️⃣ Select All Data
-- =========================
SELECT * FROM employees;

-- =========================
-- 5️⃣ Maximum Salary in Loan Dept
-- =========================
SELECT MAX(salary) AS max_salary
FROM employees
WHERE dept = 'Loan';

-- =========================
-- 6️⃣ Employee with Highest Salary in Loan Dept
-- =========================
SELECT *
FROM employees
WHERE dept = 'Loan'
AND salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE dept = 'Loan'
);

-- =========================
-- 7️⃣ Highest Salary Department (Using GROUP BY + HAVING)
-- =========================
SELECT dept, MAX(salary) AS highest_salary
FROM employees
GROUP BY dept
ORDER BY highest_salary DESC
LIMIT 1;

-- =========================
-- 8️⃣ Average Salary Per Department
-- =========================
SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept;

-- =========================
-- 9️⃣ Departments Having Average Salary > 50000
-- =========================
SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
HAVING AVG(salary) > 50000;

-- =========================
-- 🔟 Total Salary Per Department (HAVING with SUM)
-- =========================
SELECT dept, SUM(salary) AS total_salary
FROM employees
GROUP BY dept
HAVING SUM(salary) > 100000;
