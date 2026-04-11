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

	
----- TASK 2 -----

/*Retrieve employees whose salary is between 40,000 and 60,000 without using 
between keyword*/
SELECT distinct emp_id  FROM Employee1 WHERE salary>=40000 AND salary<=60000;

/*Get employees full name whose age is between 25 and 35 AND department is IT*/
SELECT DISTINCT emp_id,
    CONCAT(first_name," ",last_name) as Employee_name 
    FROM Employee1 
    WHERE age BETWEEN 25 AND 35 AND department = "IT";


----- TASK 9 -----

/*repeat full name multiple times using SQL functions*/

DELIMITER $$

CREATE FUNCTION GetFullNameLoop(
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    times INT
)
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(500) DEFAULT '';
    DECLARE i INT DEFAULT 1;

    WHILE i <= times DO
        SET result = CONCAT(result, FirstName, ' ', LastName, ' | ');
        SET i = i + 1;
    END WHILE;

    RETURN result;
END $$

DELIMITER ;

SELECT GetFullNameLoop('Vijay', 'Reddy', 3);


