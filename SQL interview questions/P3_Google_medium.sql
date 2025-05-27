You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans. There is only one user named Karl and one named Hans in the dataset.

The output should contain 'user_id' and 'user_name' columns.

🔗 Understanding how to join tables in SQL is essential for effective data analysis; mastering this concept allows you to combine related data seamlessly. Give it a try! 👇

𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:
CREATE TABLE users(user_id INT, user_name varchar(30));
INSERT INTO users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'), (8, 'Lucas'), (9, 'Anna'), (10, 'John');

CREATE TABLE friends(user_id INT, friend_id INT);
INSERT INTO friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9);


To increase test cases, add these allows

INSERT INTO users VALUES 
(11, 'Zara'),   -- New user with no friends
(12, 'Max'),    -- Friend of Karl only
(13, 'Nina'),   -- Friend of Hans only
(14, 'Sam'),    -- Friend of both Karl and Hans
(15, 'Zoe'),    -- Friend of Hans, but not Karl
(16, 'Leo');    -- Friend of both, but through other users

-- Mutual friend with both Karl (1) and Hans (2)
INSERT INTO friends VALUES (1,14), (2,14);

-- Friend of Karl only
INSERT INTO friends VALUES (1,12);

-- Friend of Hans only
INSERT INTO friends VALUES (2,13), (2,15);

-- Leo is not directly listed under Karl or Hans but connected to their mutual friend (indirect test)
INSERT INTO friends VALUES (14,16);








-- Try and if not please seek here


-- Write an SQL query to find all mutual friends between the users Karl and Hans.

WITH CTE AS
(select a.user_id, b.user_name, c.user_name friend, a.friend_id    
from friends a 
left join users b USING(user_id)
left join users c on c.user_id = a.friend_id)

select friend_id, friend
from CTE
where user_name = 'Karl'
and friend_id in (SELECT friend_id from CTE where user_name = 'Hans') 