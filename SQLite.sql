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


