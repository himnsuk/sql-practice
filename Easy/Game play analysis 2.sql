-- Question 9 
-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some game.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 

-- Write a SQL query that reports the device that is first logged in for each player.

-- The query result format is in the following example:

-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+

-- use experiment;
-- create table activity(player_id int, device_id int, event_date Date, games_played int);
-- insert into activity(player_id , device_id , event_date , games_played) 
--  values(1, 2, "2016-03-01" , 5),
-- (1, 2, "2016-05-02" , 6),
-- (2, 3, "2017-06-25" , 1),
-- (3, 1, "2016-03-02" , 0),
-- (3, 4, "2018-07-03" , 5);

-- Result table:
-- +-----------+-----------+
-- | player_id | device_id |
-- +-----------+-----------+
-- | 1         | 2         |
-- | 2         | 3         |
-- | 3         | 1         |
-- +-----------+-----------+

-- First Wrong Solution
-- WITH activityCTE(player_id, device_id, first_date) AS
-- (
--    SELECT player_id, device_id, MIN(event_date)
--    FROM Activity
--    GROUP BY player_id, device_id
-- )

-- SELECT player_id, device_id
-- FROM activityCTE

-- Correct Solution
WITH activityCTE(player_id, device_id, rk) AS
(
   SELECT player_id, device_id,
   Rank() OVER(PARTITION BY player_id ORDER BY event_date) as rk
   FROM activity
   GROUP BY player_id, device_id
)
SELECT player_id, device_id 
FROM activityCTE
WHERE rk = 1































-- Solution
With table1 as
(
   Select player_id, device_id,
   Rank() OVER(partition by player_id
               order by event_date) as rk
   From Activity
)
Select t.player_id, t.device_id
from table1 as t
where t.rk=1