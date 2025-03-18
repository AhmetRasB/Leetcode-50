/* Write your T-SQL query statement below */
Select unique_id, name from Employees  LEFT JOIN EmployeeUNI on Employees.id = EmployeeUNI.id;