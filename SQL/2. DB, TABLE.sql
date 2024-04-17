show databases ;
create database if not exists class_6 ;
SHOW CREATE DATABASE class_6 ;   
SHOW DATABASES ;    
USE class_6 ; 
SHOW DATABASES LIKE "%schema";  
SHOW DATABASES LIKE "%6"; 
SELECT schema_name FROM information_schema.schemata;  
SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 's%';
DROP DATABASE IF EXISTS class_6 ;   
DROP SCHEMA IF EXISTS class_6 ;
SHOW TABLES;
CREATE TABLE IF NOT EXISTS test1 
( ID int, `name` varchar(20),  ADDRESS decimal(10,2));  
insert into test1 values (25, 6, "amit", 898989898 ,4400.12, "B.tech", 10000, 60 ) ;
select * from test1 ;
CREATE TABLE employee_table
( id int NOT NULL AUTO_INCREMENT,      
`name` varchar(45) NOT NULL,  
occupation varchar(35) NOT NULL,  
age int NOT NULL,
PRIMARY KEY (id) ) ; 
insert into employee_table values ( 'ishant', 'working', 21) ;
insert into employee_table (`name`, occupation, age)
values ( 'ishant', 'working', 21) ;
insert into employee_table (`name`, occupation)
values ( 'ishant', 'working') ;
select * from employee_table ;
DESCRIBE employee_table ;
DESCRIBE test1 ;  
#ALTER TABLE test1  ADD contact bigint  [ FIRST | AFTER column_name ];
ALTER TABLE test1 
ADD contact bigint AFTER `name` ;
ALTER TABLE test1 
ADD age int first ;
ALTER TABLE test1 
ADD Education varchar(40) NOT NULL default "12th";  
select * from test1 ;
ALTER TABLE test1 
ADD salary int NOT NULL,  
ADD weight float ;








   

  
