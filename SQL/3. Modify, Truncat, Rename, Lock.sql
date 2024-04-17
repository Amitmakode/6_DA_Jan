use class_6 ;
select * from employee_table ;
select * from test1 ;
ALTER TABLE test1 
MODIFY `address` int ;
ALTER TABLE test1 
MODIFY age int default "18" ; 
insert into test1 (id, `name`, salary) values (111, "abc", 10001) ;
ALTER TABLE test1 
DROP COLUMN weight ; 
ALTER TABLE test1 
CHANGE COLUMN contact mobile bigint ;
ALTER TABLE test1 
RENAME TO basic ;
SHOW FULL TABLES;
show tables ;
SHOW TABLES IN class_6;
SHOW TABLES IN class_7;
SHOW TABLES FROM class_6 LIKE "emp%";
SHOW TABLES FROM class_6 LIKE "%c";
SELECT table_name FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
AND table_schema = 'class_6';
-- SHOW TABLES In class_6 WHERE class_6.table = "employees_table";
RENAME TABLE employee_table TO employee,  basic TO basic1 ;
LOCK TABLE basic1 WRITE;  
alter table basic1 
drop column age ;
RENAME TABLE basic1 TO basic ;
LOCK TABLE old_tab_name1 READ;
UNLOCK TABLES;
RENAME TABLE current_db.tablel_name TO other_db.tablel_name;

CREATE TEMPORARY TABLE Students
( `name` VARCHAR(40) NOT NULL, 
total_marks DECIMAL(12,2) NOT NULL DEFAULT 0.00, 
total_subjects INT UNSIGNED NOT NULL DEFAULT 0);
INSERT INTO Students(`name`, total_marks, total_subjects) VALUES ('Joseph', 150.75, 2), ('Peter', 180.75, 2);
select * from students ;
TRUNCATE table students ; 

CREATE TABLE customer (    
    Id int PRIMARY KEY NOT NULL,     
    `Name` varchar(45) NOT NULL,     
    Product varchar(45) DEFAULT NULL,     
    Country varchar(25) DEFAULT NULL,     
    `Year` int NOT NULL    
);  

INSERT INTO customer ( Id, `Name`, Product, Country, `Year`)     
VALUES (1, 'Stephen', 'Computer', 'USA', 2015),     
(2, 'Joseph', 'Laptop', 'India', 2016),     
(3, 'John', 'TV', 'USA', 2016),    
(4, 'Donald', 'Laptop', 'England', 2015),    
(5, 'Joseph', 'Mobile', 'India', 2015),    
(6, 'Peter', 'Mouse', 'England', 2016);

TRUNCATE TABLE customer; 

select * from customer ;

select `country` ,`name`  from customer ;
select `country` ,`name` from customer where `country` = 'India' ;
select *  from customer 
where `country` = 'India' and product = "laptop" and `year` = 2016;
select *  from customer 
where `country` = 'India' or  product = "laptop" ;













