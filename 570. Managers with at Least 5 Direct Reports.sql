/* Write your T-SQL query statement below */
SELECT name FROM Employee  JOIN (
    SELECT managerId 
    FROM Employee 
    WHERE managerId IS NOT NULL 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5
) m ON id = m.managerId;
