Find the dates with paid and non paid customers downloads where include only when a day has downloads
more by non paid customers than paid customers 


CREATE TABLE ms_user_dimension (user_id INT PRIMARY KEY,acc_id INT);
INSERT INTO ms_user_dimension (user_id, acc_id) VALUES (1, 101),(2, 102),(3, 103),(4, 104),(5, 105);

CREATE TABLE ms_acc_dimension (acc_id INT PRIMARY KEY,paying_customer VARCHAR(10));
INSERT INTO ms_acc_dimension (acc_id, paying_customer) VALUES (101, 'Yes'),(102, 'No'),(103, 'Yes'),(104, 'No'),(105, 'No');

CREATE TABLE ms_download_facts (date timestamp,user_id INT,downloads INT);
INSERT INTO ms_download_facts (date, user_id, downloads) VALUES ('2024-10-01', 1, 10),('2024-10-01', 2, 15),('2024-10-02', 1, 8),('2024-10-02', 3, 12),('2024-10-02', 4, 20),('2024-10-03', 2, 25),('2024-10-03', 5, 18);

WITH CTE as
(select *
from ms_user_dimension a 
left join ms_acc_dimension b on a.acc_id = b.acc_id
left join ms_download_facts c on a.user_id = c.user_id)

SELECT
  date,
  COALESCE(SUM(CASE WHEN paying_customer = 'No' THEN downloads END), 0) AS non_paying_cust_downloads,
  COALESCE(SUM(CASE WHEN paying_customer = 'Yes' THEN downloads END), 0) AS paying_cust_downloads
FROM CTE
GROUP BY date
HAVING
  COALESCE(SUM(CASE WHEN paying_customer = 'No' THEN downloads END), 0) >
  COALESCE(SUM(CASE WHEN paying_customer = 'Yes' THEN downloads END), 0)


