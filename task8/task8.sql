-- creating a database
CREATE DATABASE SQL_Tasks;
use SQL_Tasks;

-- Employees earning above department average (Non Recursive)
WITH DeptAvg AS(
	   SELECT department,
    AVG(salary) as avg_sal
    FROM Employee 
    GROUP BY department)
SELECT 
	   CONCAT(e.first_name," ",e.last_name) as emp_name,
    e.department,e.salary,d.avg_sal
    FROM Employee e JOIN DeptAvg d 
    USING(department) 
    WHERE e.salary>d.avg_sal;
    
-- Find total salary and employees count per department
WITH DeptSummary AS(
	  SELECT 
	  department,
	  SUM(salary) as total_salary,
	  COUNT(*) as count_per_dept
	  FROM Employee
	  GROUP BY department)
SELECT * FROM DeptSummary;

-- Display the numbers from 1 to 10 without using inbuilt function (Recursive)
WITH RECURSIVE cte_name AS(
	 SELECT 1 as n
	 UNION ALL
	 SELECT n+1 FROM cte_name WHERE n<10)
 SELECT n as numbers FROM cte_name;

-- Even Numbers 2 to 20
WITH RECURSIVE EvenNumbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 2
    FROM EvenNumbers
    WHERE num < 20
)
SELECT * FROM EvenNumbers; 
