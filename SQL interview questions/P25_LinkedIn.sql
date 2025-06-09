Consider all LinkedIn users who, at some point, worked 
at Microsoft. For how many of them was Google their next employer 
right after Microsoft (no employers in between)?

CREATE TABLE linkedin_users (user_id INT,employer VARCHAR(255),position VARCHAR(255),start_date timestamp,end_date timestamp);

INSERT INTO linkedin_users (user_id, employer, position, start_date, end_date) VALUES(1, 'Microsoft', 'developer', '2020-04-13', '2021-11-01'),(1, 'Google', 'developer', '2021-11-01', NULL),(2, 'Google', 'manager', '2021-01-01', '2021-01-11'),(2, 'Microsoft', 'manager', '2021-01-11', NULL),(3, 'Microsoft', 'analyst', '2019-03-15', '2020-07-24'),(3, 'Amazon', 'analyst', '2020-08-01', '2020-11-01'),(3, 'Google', 'senior analyst', '2020-11-01', '2021-03-04'),(4, 'Google', 'junior developer', '2018-06-01', '2021-11-01'),(4, 'Google', 'senior developer', '2021-11-01', NULL),(5, 'Microsoft', 'manager', '2017-09-26', NULL),(6, 'Google', 'CEO', '2015-10-02', NULL);

select a.user_id
from linkedin_users a 
left join linkedin_users b on a.user_id = b.user_id and a.end_date = b.start_date
where a.employer = 'Microsoft' and b.employer = 'Google'