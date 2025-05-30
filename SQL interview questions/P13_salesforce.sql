What is the total sales revenue of Samantha and Lisa?

🔊 Just wanted to point out that even major companies like Amazon ask questions this basic— so it's worth giving it a try! and share the output!



CREATE TABLE sales_performance (salesperson VARCHAR(50),widget_sales INT,sales_revenue INT,id INT PRIMARY KEY);

INSERT INTO sales_performance (salesperson, widget_sales, sales_revenue, id) VALUES('Jim', 810, 40500, 1),('Bobby', 661, 33050, 2),('Samantha', 1006, 50300, 3),('Taylor', 984, 49200, 4),('Tom', 403, 20150, 5),('Pat', 715, 35750, 6),('Lisa', 1247, 62350, 7);

select SUM(sales_revenue) sales_revenue
from sales_performance
where salesperson in ('Samantha', 'Lisa')
