/* Write your T-SQL query statement below */
WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users FROM Users
)
SELECT 
    r.contest_id, 
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / t.total_users, 2) AS percentage
FROM Register r
JOIN TotalUsers t ON 1 = 1  -- Cross join the TotalUsers CTE with the Register table
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
