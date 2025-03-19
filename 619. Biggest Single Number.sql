/* Write your T-SQL query statement below */
SELECT MAX(num) AS num FROM (SELECT num FROMMyNumbers GROUP BY num HAVING COUNT(num) = 1) AS SingleNumbers;