 
-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

-- creating a Customers table
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15)
);

-- creating a Orders table
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount INT NOT NULL CHECK (TotalAmount>=0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert records into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '9876543210'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '8765432109'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '7654321098'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '6543210987'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '5432109876');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
(6, 'Alice', 'Brown', 'alice.brown@example.com', '4321098765'),
(7, 'Bob', 'Taylor', 'bob.taylor@example.com', '3210987654');

-- Insert records into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2026-03-01', 250),
(102, 2, '2026-03-05', 150),
(103, 3, '2026-03-07', 300),
(104, 4, '2026-03-10', 200),
(105, 5, '2026-03-12', 180);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(106, 1, '2026-03-15', 100),
(107, 3, '2026-03-16', 50);

SELECT * FROM Customers;
SELECT * FROM Orders;

-- Find all orders along with customer names where the order was placed in March 2026
SELECT 
	CONCAT(c.FirstName," ",c.LastName) as emp_name 
    FROM Customers c INNER JOIN Orders O 
	USING(CustomerID) 
    WHERE YEAR(o.OrderDate)=2026;
    
-- Show all customers and the total amount they have spent; for customers with no orders, show total as 0.
SELECT 
	c.FirstName as cust_name,
    COALESCE(SUM(o.TotalAmount),0) as TotalAmount 
    FROM Customers c LEFT JOIN Orders o 
    USING(CustomerID) 
    GROUP BY c.CustomerID,c.FirstName,c.LastName
    ORDER BY TotalAmount ASC;

-- Identify customers who have never placed an order.
SELECT 
	CONCAT(c.FirstName," ",c.LastName) as cust_name 
    FROM Customers c LEFT JOIN Orders o 
    USING(CustomerID) 
	WHERE o.CustomerID is NULL;
    
-- Identify customers who have placed more than one order and display their order count.
SELECT 
	c.CustomerID,
	CONCAT(c.FirstName," ",c.LastName) as cust_name , 
    COUNT(*) AS order_count 
    FROM Customers c INNER JOIN Orders o 
    USING(CustomerID) 
    GROUP BY c.CustomerID HAVING COUNT(*)>1;

-- Retrive the order detail of the customer who don't have customer details
SELECT 
	o.OrderID,o.OrderDate 
    FROM Customers c RIGHT JOIN Orders o 
    USING(CustomerID) 
    WHERE c.CustomerID is NULL;
