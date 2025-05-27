-- You are given a table named famous with the following schema:

CREATE TABLE famous (
  user_id INT,       -- the person being followed
  follower_id INT    -- the person who follows
);

-- Each row in this table represents a relationship where follower_id follows user_id. All IDs (both user_id and follower_id) represent active users on the platform (like Meta/Facebook).
-- 🎯 Objective:

-- For each unique user_id, calculate their Famous Percentage, defined as:

-- Famous Percentage = (Number of followers a user has / Total number of unique users) * 100

-- 📥 Sample Data:

INSERT INTO famous VALUES
(1, 2), (1, 3),
(2, 4),
(5, 1), (5, 3),
(11, 7),
(12, 8),
(13, 5), (13, 10),
(14, 12), (14, 3),
(15, 14), (15, 13);




-- Below is the answer / Try and if failed seek the answers --


WITH CTE AS 
(select DISTINCT user_id from famous
union
select DISTINCT follower_id from famous)

select user_id, followers, ROUND(((followers::numeric/(SELECT COUNT(user_id) from CTE))*100),2) as famous
from 
(select a.user_id, COUNT(b.follower_id) followers
from CTE a
left join famous b on a.user_id = b.user_id 
GROUP BY 1
order by 1) a