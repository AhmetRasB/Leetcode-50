/* Write your T-SQL query statement below */
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogin AS (
    SELECT a.player_id
    FROM Activity a
    JOIN FirstLogin f ON a.player_id = f.player_id
    WHERE a.event_date = DATEADD(DAY, 1, f.first_login_date)
)
SELECT 
    ROUND(COUNT(DISTINCT cl.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM ConsecutiveLogin cl;
