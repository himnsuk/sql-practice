-- Question 12
-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

-- +---------+------------------+------------------+
-- | Id(INT) | RecordDate(DATE) | Temperature(INT) |
-- +---------+------------------+------------------+
-- |       1 |       2015-01-01 |               10 |
-- |       2 |       2015-01-02 |               25 |
-- |       3 |       2015-01-03 |               20 |
-- |       4 |       2015-01-04 |               30 |
-- +---------+------------------+------------------+
-- For example, return the following Ids for the above Weather table:

-- +----+
-- | Id |
-- +----+
-- |  2 |
-- |  4 |
-- +----+

USE experiment;
CREATE TABLE Weather(id int, RecocrdDate Date, Temperature int);

INSERT INTO Weather(id, RecocrdDate, Temperature)
VALUES(1 ,"2015-01-01" ,10),
(2 ,"2015-01-02" ,25),
(3 ,"2015-01-03" ,20),
(4 ,"2015-01-04" ,30);



-- SELECT a.id,a.RecocrdDate, a.Temperature, b.RecocrdDate, b.Temperature
-- SELECT a.id, a.Temperature, b.Temperature
SELECT *
FROM Weather a, Weather b
WHERE a.Temperature > b.Temperature AND DATEDIFF(a.RecocrdDate, b.RecocrdDate) = 1;

SELECT *
FROM Weather a, Weather;
SELECT a.id, b.id
FROM Weather a, Weather b;






























-- Solution
select a.id, a.RecocrdDate, b.RecocrdDate, a.Temperature, b.Temperature
from Weather a, Weather b
where a.Temperature>b.Temperature and  datediff(a.RecocrdDate,b.RecocrdDate)=1