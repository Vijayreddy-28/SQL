/*creating a database*/
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

/*creting a table*/
CREATE TABLE Employee(
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT,
    gender VARCHAR(30),
    salary INT,
    department VARCHAR(100)
    
);

/* Insert data into Employee Table */
INSERT INTO Employee(emp_id,first_name,last_name,age,gender,salary,department) VALUES
	(1, 'Rahul', 'Sharma', 25, 'Male', 40000, 'IT'),
	(2, 'Priya', 'Reddy', 28, 'Female', 50000, 'HR'),
	(3, 'Amit', 'Verma', 30, 'Male', 60000, 'Finance'),
	(4, 'Sneha', 'Iyer', 27, 'Female', 45000, 'Marketing'),
	(5, 'Karan', 'Mehta', 35, 'Male', 70000, 'IT'),
	(6, 'Anjali', 'Nair', 26, 'Female', 42000, 'Sales'),
	(7, 'Vikram', 'Singh', 32, 'Male', 65000, 'Sales'),
	(8, 'Pooja', 'Patel', 29, 'Female', 48000, 'HR');

/* Aggregate Functions */
SELECT 
	COUNT(emp_id) as num_of_emp,
	MAX(salary) as high_salary,
 	MIN(salary) as low_salary, 
 	AVG(age) as avg_age,
 	SUM(salary) as sum_salary from Employee;
    
/*Find departments where the average salary is greater than 50,000*/
SELECT 
	department 
	FROM Employee 
	GROUP BY department 
	HAVING AVG(salary) > 50000;

/*Retrieve the highest-paid employee in each department*/
SELECT 
	department, first_name, salary
	FROM Employee
	WHERE (department, salary) IN (
    SELECT department, MAX(salary)
    FROM Employee
    GROUP BY department
);

/*Get the top 3 departments with the highest average salary*/
SELECT 
	department,
  	ROUND(AVG(salary),0) as salary 
  	FROM Employee 
  	GROUP BY department 
  	ORDER BY AVG(salary) DESC LIMIT 3;

/*Count the number of employees in each department whose age is above 30*/
SELECT 
  	department,
  	COUNT(*) as num_emp 
  	FROM Employee 
  	WHERE age>30 
  	GROUP BY department;  
