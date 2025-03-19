/* Write your T-SQL query statement below */
WITH ConfirmationCounts AS (
    SELECT 
        user_id,
        COUNT(*) AS total_requests,
        SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_requests
    FROM Confirmations
    GROUP BY user_id
)

SELECT 
    s.user_id,
    COALESCE(ROUND(CAST(cc.confirmed_requests AS FLOAT) / NULLIF(cc.total_requests, 0), 2), 0.00) AS confirmation_rate
FROM Signups s
LEFT JOIN ConfirmationCounts cc ON s.user_id = cc.user_id
ORDER BY s.user_id;
