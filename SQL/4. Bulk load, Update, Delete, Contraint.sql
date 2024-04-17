use class_6 ;

-- pip install csvkit

-- csvsql --dialect mysql --snifflimit 1000000 sales.csv > out_sales.sql

CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL);

drop table sales ;

select * from sales;


SET SESSION sql_mode = '';

load data infile 
'F:/sales_data_final.csv'
into table sales
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;  


select str_to_date(order_date,'%m/%d/%y') from sales;  

alter table sales
add column order_date_real date after order_date ;

update sales
set order_date_real = str_to_date(order_date,'%m/%d/%Y');

select * from sales; 

#MySQL Queries
#1) MySQL Create Database
create database db1;   
#2) MySQL Select/Use Database
use db1;   
#3) MySQL Create Query
CREATE TABLE customers1    
(id int(10),    
 name varchar(50),    
 city varchar(50),  
 PRIMARY KEY (id )    
);   

#4) MySQL Alter Query
ALTER TABLE customers   
ADD age varchar(50); 

#5) MySQL Insert Query
insert into customers1 values(103,'rahul1','delhi'); 

#6) MySQL Update Query
update customers1 
set `name`='bob', city='london' where id=101;

update customers1 
set city ='mumbai' where id=102;

update customers1 
set `name` ='amit' where city = 'delhi';

#7) MySQL Delete Query
delete from customers1 where id=101;


#8) MySQL Select Query
SELECT * from customers;

#9) MySQL Truncate Table Query
truncate table customers;

#10) MySQL Drop Query
drop table customers;

#MySQL Constraints

#Constraints used in MySQL

NOT NULL
CHECK
DEFAULT
PRIMARY KEY
AUTO_INCREMENT  -- it will not use without key column
UNIQUE
INDEX
ENUM
FOREIGN KEY

#NOT NULL Constraint
CREATE TABLE Student(Id INTEGER, LastName TEXT NOT NULL, FirstName TEXT NOT NULL, City VARCHAR(35));

INSERT INTO Student VALUES(1, 'Hanks', 'Peter', 'New York');  
INSERT INTO Student VALUES(2, NULL, 'Amanda', 'Florida');
INSERT INTO Student VALUES(3, "lee", 'Amanda', null);

#UNIQUE Constraint
CREATE TABLE ShirtBrands(Id INTEGER, BrandName VARCHAR(40) UNIQUE, Size VARCHAR(30));
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40);  
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Raymond', 38), (2, 'Cantabil', 40); 

#CHECK Constraint
#CHECK (expression)  
CREATE TABLE Persons (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  

INSERT INTO Persons(Id, Name, Age)   
VALUES (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40);  

INSERT INTO Persons(Id, `Name`, Age) VALUES (1,'Robert', 15);  

#DEFAULT Constraint

CREATE TABLE Persons (  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'New York'  
);  

INSERT INTO Persons(Id, Name, Age, City)   
VALUES (1,'Robert', 15, 'Florida'),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');  

INSERT INTO Persons(Id, Name, Age) VALUES (1,'Brayan', 15);  
SELECT * FROM Persons; 


#AUTO_INCREMENT Constraint

CREATE TABLE Animals(  
id int NOT NULL AUTO_INCREMENT,   
name CHAR(30) NOT NULL,   
PRIMARY KEY (id));  

INSERT INTO Animals (name) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich'); 

SELECT * FROM Animals;

#ENUM Constraint

CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    `name` VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')  );  
    
CREATE TABLE Shirts1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(35),
    size ENUM('small', 'medium', 'large', 'x-large')  DEFAULT 'small'
);    

INSERT INTO Shirts1(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'),
(4, 'formal-shirt', "XXL"); 

INSERT INTO Shirts1(`name`)     
VALUES ('t-shirt') ;

select * from shirts1 ;
select * from customers1 ;



  