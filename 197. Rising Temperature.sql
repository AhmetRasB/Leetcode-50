/* Write your T-SQL query statement below */
SELECT W.id AS Id FROM Weather AS W
INNER JOIN Weather AS W2 ON W.recordDate = DATEADD(day, 1, W2.recordDate)
WHERE W2.temperature < W.temperature