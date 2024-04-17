use class_6 ;


create table if not exists company 
(id int not null AUTO_INCREMENT,  
`name` varchar (30) not null default "unknown",
age int not null,
`designation` enum ("admin", "account", "sales", "production", "operation"),
`address` varchar (30),
Contact bigint,
join_date date,
salary float check (salary >=10000),
primary key (id))  ;


select * from company ;

insert into company values (3, "john", 22, "account", "nagpur", 682638967, "2024-01-01", 12000) ;

alter table company add education varchar (20)  after `name` ;

alter table company modify education varchar (30) default "graduate" ;

alter table company add education varchar (30) not null default "graduate" after `name` ;

alter table company drop column education ;

update company set `address` = "pune" where `address` = "nagpur" ;

update company set `address` = "nagpur" where id = 3;

delete from  company where id = 2 ;

truncate company ;

UPDATE company
SET salary = NULL; /-- or any default value you want to set

UPDATE company
SET salary = 9000;

alter table company modify salary float not null check (salary >= 10000) ;

alter table company add salary float not null check (salary >= 10000) default 10000 ;

alter table company drop column salary ;

alter table company add email varchar(20) unique after `address` ;

select * from sales ;

SELECT * 
FROM sales
WHERE segment = 'consumer';

SELECT segment, category AS total_sales
FROM sales
GROUP BY segment ;

SELECT segment, SUM(profit) AS total_sales
FROM sales
GROUP BY segment;

SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category;

select category, profit FROM sales ORDER BY profit DESC;

select category, profit FROM sales ORDER BY profit asc limit 50;

select category, profit FROM sales where country = "canada" ORDER BY profit asc limit 50;

SELECT category, SUM(profit) AS total_profit 
FROM sales 
WHERE country = 'canada' 
GROUP BY category 
ORDER BY total_profit ASC 
LIMIT 50;


SELECT category, SUM(profit) AS total_profit 
FROM sales 
GROUP BY category 
HAVING SUM(CASE WHEN country = 'canada' THEN 1 ELSE 0 END) > 0
ORDER BY total_profit ASC 
LIMIT 50;


