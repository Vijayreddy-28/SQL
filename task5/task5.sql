-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

SELECT * FROM Employee;

-- Retrieve employees whose salary is greater than the average salary of all employees (non correlated)
SELECT 
	   CONCAT(first_name," ",last_name) as emp_name 
    FROM Employee 
    WHERE salary > (
    SELECT 
    AVG(salary) 
    FROM Employee);

-- Find employees who earn the second highest salary in the company (non correlated)
SELECT 
	   MAX(salary) as second_highest_salary 
   	from Employee 
    WHERE salary < (
    SELECT MAX(salary) 
    from Employee) LIMIT 1;
    
-- Retrieve employees whose salary is greater than the average salary of their department (correlated)
SELECT 
	   CONCAT(first_name," ",last_name) as emp_name 
    FROM Employee e
    WHERE salary > (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE department = e.department);

-- Retrieve employees whose salary is the highest in their department  (correlated)
SELECT *
    FROM Employee e
	   WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department = e.department
);

-- Retrieve each employee’s name, department, and salary along with the average salary of their respective department  (correlated with subquery in select)
SELECT 
    first_name,
    department,
    salary,
    (SELECT AVG(salary) 
    FROM Employee e2 
    WHERE e2.department = e1.department) AS dept_avg_salary
FROM Employee e1; 
