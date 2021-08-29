-- Question 24
-- Table my_numbers contains many numbers in column num including duplicated ones.
-- Can you write a SQL query to find the biggest number, which only appears once.

-- +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 
-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note:
-- If there is no such number, just output null.

-- Solution HK

CREATE TABLE my_numbers(num INT);

INSERT INTO my_numbers(num)
VALUES
( 8 ),
( 8 ),
( 3 ),
( 3 ),
( 1 ),
( 4 ),
( 5 ),
( 6 );

SELECT MAX(num)
FROM
(SELECT num, COUNT(*) AS rep
FROM my_numbers
GROUP BY num
HAVING COUNT(*) = 1) AS A




























-- Solution
Select max(a.num) as num
from 
( 
    select num, count(*)
    from my_numbers
    group by num
    having count(*)=1
) a