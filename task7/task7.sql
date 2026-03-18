-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

select * from Employee;

-- Find the second highest Salary for each department
SELECT 
	department,salary 
    FROM (
    SELECT department,salary,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rnk 
    from Employee) t 
    where rnk=2; 
    
-- Find the top 3 highest-paid employees in the company
SELECT 
	T.employee_name, T.salary
	FROM (
    SELECT CONCAT(first_name, ' ', last_name) AS employee_name,
    salary,
	RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee) T
    WHERE rnk <= 3;
    
-- Show each employee’s salary and the total salary of their department.
SELECT 
	first_name,salary,
    SUM(salary) OVER(PARTITION BY department) as total_salary_dept 
    from Employee 
    ORDER BY total_salary_dept DESC;

-- Identify employees whose salary is greater than the previous employee’s salary.
SELECT 
	T.emp_id,T.emp_name,T.salary
    FROM (
    SELECT CONCAT(first_name," ",last_name) as emp_name,
    emp_id,salary,
    LAG(salary) OVER(ORDER BY emp_id) as prev_salary 
    FROM Employee) T 
    WHERE salary>prev_salary;
    
-- Department-wise LEAD
SELECT 
    department,
    emp_id,
    salary,
    COALESCE(LEAD(salary) OVER (PARTITION BY department ORDER BY emp_id) ,0)AS next_salary
    FROM Employee; 
