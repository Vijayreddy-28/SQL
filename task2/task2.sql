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

/*retrieve that data*/
SELECT * from Employee;

/*Retrieve employees whose salary is between 40,000 and 60,000*/
SELECT * 
  FROM Employee 
  WHERE salary 
  BETWEEN 40000 AND 60000;

/*Get employees full name whose age is between 25 and 35 AND department is IT*/
SELECT 
  CONCAT(first_name," ",last_name) as Employee_name 
  FROM Employee 
  WHERE age 
  BETWEEN 25 AND 35 AND department = "IT";

/*Display employees sorted by salary in descending order and age in ascending order*/
SELECT 
  first_name,salary,age 
  FROM Employee 
  ORDER BY salary DESC, age ASC;

/*Retrieve employees whose salary is not between 40,000 and 50,000*/
SELECT 
  emp_id FROM 
  Employee 
  WHERE salary 
  NOT BETWEEN 40000 AND 50000;

/*Display employees whose salary is less than 50,000 OR department is HR*/
SELECT 
  emp_id,salary 
  FROM Employee 
  WHERE salary < 50000 OR department = "HR" 
  ORDER BY salary DESC;






	
