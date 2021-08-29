-- Question 15
-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- Solution HK

CREATE TABLE Employee(Id int, Name VARCHAR(10), Salary INT, ManagerId INT);


-- INSERT INTO Employee(Id , Name , Salary , ManagerId)
-- VALUES ( 1, "Joe", 70000, 3),
-- ( 2, "Henry", 80000, 4),
-- ( 3, "Sam", 60000, NULL),
-- ( 4, "Max", 90000, NULL);


SELECT *
FROM employee e1 JOIN employee e2
ON e1.ManagerId = e2.Id
AND e1.Salary > e2.Salary;





























-- Solution
select a.Name as Employee
from employee a, employee b
where a.salary>b.salary and a.managerid=b.id