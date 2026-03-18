-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

-- Creating Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                 
    CustomerID INT,                  
    OrderDate DATE,                  
    DeliveryDate DATE,                        
    TotalAmount INT NOT NULL CHECK (TotalAmount >= 0), 
    ShippingAddress VARCHAR(255),             
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, DeliveryDate, TotalAmount, ShippingAddress)
VALUES
(201, 1, '2026-01-10', '2026-01-15', 250, 'Bangalore'),
(202, 2, '2026-01-25', '2026-01-30', 180, 'Hyderabad'),
(203, 3, '2026-02-05', '2026-02-09', 320, 'Chennai'),
(204, 4, '2026-02-18', '2026-02-25', 150, 'Mumbai'),
(205, 5, '2026-03-02', '2026-03-06', 275, 'Delhi'),
(206, 1, '2026-03-20', '2026-03-22', 90, 'Pune'),
(207, 2, '2026-04-01', '2026-04-05', 400, 'Kolkata'),
(208, 3, '2026-04-15', '2026-04-20', 210, 'Ahmedabad'),
(209, 4, '2026-05-07', '2026-05-12', 330, 'Jaipur'),
(210, 5, '2026-05-22', '2026-05-28', 120, 'Lucknow');

SELECT * FROM orders;

-- Find the total number of orders placed this month
SELECT 
	   * FROM Orders 
    WHERE DATE_FORMAT(OrderDate, '%M')=DATE_FORMAT(NOW(), '%M');

-- Extract month-wise orders
SELECT 
	   DATE_FORMAT(OrderDate, '%M') as Months,
    SUM(TotalAmount) as TotalAmount 
	   FROM Orders 
    GROUP BY DATE_FORMAT(OrderDate, '%M');

-- Find all orders where the delivery took more than 5 days
SELECT 
	   OrderID,
    datediff(DeliveryDate,OrderDate) as days 
    FROM Orders 
    Where datediff(DeliveryDate,OrderDate) > 5;

-- retrieves orders from last 7 days
SELECT *
	   FROM Orders
   	WHERE OrderDate 
    BETWEEN CURRENT_DATE() - INTERVAL 7 DAY AND CURRENT_DATE();
 
 -- Orders in last 30 days
SELECT *
	   FROM Orders
	   WHERE OrderDate >= DATE_ADD(CURRENT_DATE(), INTERVAL -30 DAY);

-- Converting total amount from int to decimal 
SELECT 
    OrderID,
    CONVERT(TotalAmount, DECIMAL(10,2)) AS Amount
    FROM Orders; 
