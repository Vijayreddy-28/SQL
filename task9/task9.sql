-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;


-- number of orders and total amount between the given dates
DELIMITER $$
CREATE PROCEDURE Order_summary(IN StartDate DATE,IN EndDate DATE)
BEGIN
	SELECT 
		COUNT(*) AS number_of_days,
        SUM(TotalAmount) as Total_Amount
        FROM Orders
        WHERE OrderDate BETWEEN StartDate AND EndDate;
END $$
DELIMITER ;
CALL Order_summary("2026-01-10","2026-03-02");


-- Create a procedure that accepts a CustomerID and returns the total number of orders for that customer.
DELIMITER $$
CREATE PROCEDURE GetCustTotalOrders(IN p_CustomerID INT)
BEGIN 
	SELECT
    COUNT(*) AS total_orders
    FROM Orders o
    WHERE o.CustomerID=p_CustomerID
    GROUP BY CustomerID ;
END $$
DELIMITER ;
CALL GetCustTotalOrders(1);


-- count the total number of employees in a given department
DELIMITER $$
CREATE PROCEDURE CountEmployeesByDept(IN p_Department VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS total_employees
    FROM Employee
    WHERE department = p_Department;
END $$
DELIMITER ;
CALL CountEmployeesByDept("IT");


-- Create a function that takes FirstName and LastName and returns the full name
DELIMITER $$
CREATE FUNCTION GetFullName(FirstName VARCHAR(50), LastName VARCHAR(50))
	RETURNS VARCHAR(100)
	DETERMINISTIC
	BEGIN
		RETURN CONCAT(FirstName, ' ', LastName);
	END $$
DELIMITER ;
SELECT 
	GetFullName(first_name, last_name) AS FullName 
	FROM Employee;


-- create a scalar User-Defined Function (UDF) in MySQL to check eligibility based on age
DELIMITER $$
CREATE FUNCTION CheckEligibility(p_Age INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN p_Age >= 18;
END $$
DELIMITER ;
SELECT 
	GetFullName(first_name, last_name) AS EmpName,age,
 	CheckEligibility(age) AS Eligible
	FROM Employee;
 
