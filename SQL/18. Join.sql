use partition6;


create table  courses107(
course_name varchar(50),
course_id int(10) primary key ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by key()
partitions 10; 

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'courses107';

insert into  courses107 values('machine_learning' , 999 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019); 
 ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);


create table cour109(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2019) ,
partition p1 values less than (2020) ,
partition p2 values less than (2021) ,
partition p3 values less than (2022),
PARTITION p4 VALUES LESS THAN MAXVALUE
);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'cour109' ;


insert into  cour109 values('machine_learning' , 999 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2025),
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2024),
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2022),
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',1999),
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2018);


SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = 'cour109';

-- join

create table if not exists c101 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)) ;

create table if not exists s101(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int ) ;


insert into c101 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language') ;


insert into s101 values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103) ;

select * from c101 ;
select * from s101 ;

select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from c101 c
inner join s101 s on c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id, s.student_name , s.student_course_id 
from c101 c
left join s101 s on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
left join s101 s on c.course_id = s.student_course_id where s.student_id is null;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
right join s101 s on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
right join s101 s on c.course_id = s.student_course_id where c.course_id is null;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
right join s101 s on c.course_id = s.student_course_id where s.student_course_id  is null;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
cross join s101 s on c.course_id = s.student_course_id where c.course_id is null ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from c101 c
cross  join s101 s ;



create table order_join (orderid int , customerid int, orderdate date) ;

insert into order_join values(10308,	2,	"1996-09-18"),
(10309,	37,	"1996-09-19"),
(10310,	77,	"1996-09-20"),
(10311,	57,	"1996-09-20"),
(10312,	33,	"1996-09-20") ;

rename table sql_join to order_join ;

create table customer_join (CustomerID int, CustomerName varchar(30), ContactName varchar(30), Country varchar(30)) ;

insert into customer_join values (1,	"Alfreds Futterkiste",	"Maria Anders",	"Germany"),
(2,	"Ana Trujillo  helados",	"Ana Trujillo",	"Mexico"),
(3,	"Antonio Moreno Taquería",	"Antonio Moreno",	"Mexico"),
 (4,	"Trujillo Emparedados",	"Trujillo",	"spain");
 
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate, Customers.CustomerID
FROM Order_join orders
INNER JOIN Customer_join customers ON Orders.CustomerID = Customers.CustomerID ;

SELECT Orders.Order_ID, Customers.CustomerName, Orders.OrderDate
FROM Order_join orders
left JOIN Customer_join customers ON Orders.Customer_ID = Customers.CustomerID ;

SELECT Orders.Order_ID, Customers.CustomerName, Orders.OrderDate
FROM Order_join orders
right JOIN Customer_join customers ON Orders.Customer_ID = Customers.CustomerID ;


SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM (
(Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

SELECT Order_join.Order_ID, Customer_join.CustomerName
FROM 
Order_join
INNER JOIN Customer_join ON Order_join.Customer_ID = Customer_join.CustomerID ;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


SELECT Customer_join.CustomerName, Order_join.Order_ID
FROM Customer_join
LEFT JOIN Order_join ON Customer_join.CustomerID = Order_join.Customer_ID
ORDER BY Customer_join.CustomerName desc limit 10;


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


SELECT column_name(s)
FROM table1
FULL JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;



 
 


