/*creating a database*/
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

-- added various constraints like AUTO_INCREMENT,CHAR,DECIMAL,DEFAULT,NOT NULL 
CREATE TABLE Employee1 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,            
    last_name VARCHAR(30) NOT NULL,
    age INT CHECK (age >= 18),                  
    gender CHAR(1) DEFAULT 'M',                
    salary DECIMAL(10,2) DEFAULT 0.00,          
    department VARCHAR(100) DEFAULT 'General', 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);

/* Insert data into Employee Table */
INSERT INTO Employee1 (first_name, last_name, age, gender, salary, department)
VALUES
('Vijay', 'Reddy', 25, 'M', 50000.00, 'IT'),
('Anjali', 'Sharma', 28, 'F', 62000.50, 'HR'),
('Rahul', 'Verma', 32, 'M', 58000.75, 'Finance'),
('Sneha', 'Patel', 27, 'F', 61000.00, 'Marketing'),
('Arjun', 'Kumar', 35, 'M', 72000.25, 'Operations');

/*retrieve that data*/
SELECT * from Employee1;

	
