-- Question 31
-- Table: Submissions

-- +---------------+----------+
-- | Column Name   | Type     |
-- +---------------+----------+
-- | sub_id        | int      |
-- | parent_id     | int      |
-- +---------------+----------+
-- There is no primary key for this table, it may have duplicate rows.
-- Each row can be a post or comment on the post.
-- parent_id is null for posts.
-- parent_id for comments is sub_id for another post in the table.
 

-- Write an SQL query to find number of comments per each post.

-- Result table should contain post_id and its corresponding number_of_comments, 
-- and must be sorted by post_id in ascending order.

-- Submissions may contain duplicate comments. You should count the number of unique comments per post.

-- Submissions may contain duplicate posts. You should treat them as one post.

-- The query result format is in the following example:

-- Submissions table:
-- +---------+------------+
-- | sub_id  | parent_id  |
-- +---------+------------+
-- | 1       | Null       |
-- | 2       | Null       |
-- | 1       | Null       |
-- | 12      | Null       |
-- | 3       | 1          |
-- | 5       | 2          |
-- | 3       | 1          |
-- | 4       | 1          |
-- | 9       | 1          |
-- | 10      | 2          |
-- | 6       | 7          |
-- +---------+------------+

-- Result table:
-- +---------+--------------------+
-- | post_id | number_of_comments |
-- +---------+--------------------+
-- | 1       | 3                  |
-- | 2       | 2                  |
-- | 12      | 0                  |
-- +---------+--------------------+

-- The post with id 1 has three comments in the table with id 3, 4 and 9. The comment with id 3 is 
-- repeated in the table, we counted it only once.
-- The post with id 2 has two comments in the table with id 5 and 10.
-- The post with id 12 has no comments in the table.
-- The comment with id 6 is a comment on a deleted post with id 7 so we ignored it.

-- Solution HK

WITH ctePost AS (
	SELECT post_id
	FROM Submission
	WHERE parent_id IS NULL
	GROUP BY post_id
), cteNonDup AS(
	SELECT post_id, parent_id
	FROM Submission
	WHERE parent_id IS NOT NULL
	GROUP BY post_id, parent_id
)
-- SELECT * FROM ctePost;
SELECT P1.post_id, COALESCE(COUNT(P2.parent_id), 0) AS number_of_comments
FROM ctePost P1 LEFT JOIN cteNonDup P2
ON P1.post_id = P2.parent_id
GROUP BY P1.post_id;
SELECT * FROM submission;

CREATE TABLE Submission(post_id INT, parent_id INT);


INSERT INTO Submission VALUES
( 1, Null),
( 2, Null),
( 1, Null),
( 12, Null),
( 3, 1),
( 5, 2),
( 3, 1),
( 4, 1),
( 9, 1),
( 10, 2),
( 6, 7);




























-- Solution
Select a.sub_id as post_id, coalesce(b.number_of_comments,0) as number_of_comments
from(
select distinct sub_id from submissions where parent_id is null) a
left join(
select parent_id, count(distinct(sub_id)) as number_of_comments
from submissions
group by parent_id
having parent_id = any(select sub_id from submissions where parent_id is null)) b
on a.sub_id = b.parent_id
order by post_id