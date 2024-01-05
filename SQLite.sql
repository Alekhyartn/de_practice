create table department(DepartmentId integer, DepartmentName varchar(20))
Insert into department(DepartmentId, DepartmentName) 
VALUES
(1, 'IT'),
(2, 'Sales');
select * from department;

Create table employee(id integer, name varchar(20), salary integer, departmentId integer)
Insert into employee(id, name, salary, DepartmentId) 
VALUES 
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);
select * from employee;

with cte as (
SELECT e.name AS 	Employee, e.salary, d.DepartmentName AS Department,
RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rn
  FROM Employee e
    JOIN Department d ON e.DepartmentId = d.DepartmentId)
SELECT Department, Employee, salary 
FROM cte WHERE rn = 1;

-- CTE selets information from two tables. Employee as e and Department as d.
-- It retrieves the employee name, salary department name and use the rank() window function to assign a rank to each 
         ---employee within their department based on their salary in descending order
-- PARTITION BY e.departmentid, this clause of the RANK() function partitions the result set by the departmentId, 
          ----meaning that the ranking is done seperately for each department.
-- So ORDER BY e.salary DESC is ranking based on the salary in descending order.
-- And the main query Select statement retirieves those columns from CTE, and Where clause filters the results to include only those 
       ---rows where the rank rn is equal to 1.
-- So, the final result of this query is a list of employees with highest salary in each department.
