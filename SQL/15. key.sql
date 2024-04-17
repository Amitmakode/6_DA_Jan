#keys in sql



#Primary Key:
-- Uniqueness: Every value in the primary key column(s) must be unique.
-- Not Null: Primary key columns cannot contain NULL values.
-- Unchanging: Primary key values should ideally remain constant over time. Changing primary key values can lead to data integrity issues and complications in maintaining referential integrity.
-- Indexing: Primary keys are often indexed for faster data retrieval and to enforce uniqueness.


#Foreign Key:
-- Referential Integrity: Foreign keys establish relationships between tables by referencing the primary key (or a unique key) of another table. It ensures that every value in the foreign key column(s) exists as a primary key value in the referenced table.
-- Cascading Actions: Foreign keys may have cascading actions associated with them, such as ON DELETE CASCADE or ON UPDATE CASCADE, which dictate what should happen to dependent rows in child tables when referenced rows in parent tables are deleted or updated.
-- Data Type Compatibility: The data type of a foreign key column should match the data type of the referenced primary key column.



#Composite Key:
-- Uniqueness: The combination of columns in a composite key must be unique.
-- Minimality: A composite key should include the minimum number of columns necessary to ensure uniqueness. Including unnecessary columns can lead to redundancy and decreased performance.
-- Order: The order of columns in a composite key is significant. Different orders may result in different keys and affect query performance.
-- Indexing: Composite keys are often indexed for efficient data retrieval and to enforce uniqueness.



#SN	Primary Key	Unique Key
-- 1.	It is a single or combination of the field, which is used to identify each record in a table uniquely.	
        -- It also determines each row of the table uniquely in the   absence of a primary key.
-- 2.	It does not allow to store a NULL value into the primary key column.	It can accept only one NULL value into the unique key column.
-- 3.	A table can have only one primary key.	A table can have more than one unique key.
-- 4.	It creates a clustered index.	It creates a non-clustered index.



use class_6 ;

create table neuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into neuron values(03 , 'FSDS','active',110) ;

select * from neuron ;


create table student_neuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references neuron(course_id)) ;

insert into student_neuron values(101 , 'fsda','test@gmail.com','active', null) ;

select * from student_neuron ;


create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references neuron(course_id)) ;

insert into payment values ('fsda',3,'not-active','7th aug') ;

select * from payment ;


create table class(
course_id int ,
class_name varchar(60),
class_topic varchar(60),
class_duration int ,
contact int,
primary key (contact),
foreign key(course_id) references neuron(course_id )) ;

drop table class ;

alter table neuron drop primary key ;

alter table class drop foreign key  ;

ALTER TABLE class DROP CONSTRAINT foreign key ; 


alter table class drop column course_id ;

alter table class drop primary key ;

select * from class ;

alter table neuron add constraint test_prim primary key(course_id, course_name) ;

drop table neuron ;

drop table class ;

create table test_key(
id int not null , 
`name` varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50)) ;

alter table test_key add primary key(id) ;

alter table test_key drop primary key ;

alter table test_key add constraint test_prim primary key(id , email_id) ;


create table parent(
id int not null ,
primary key(id)) ;


create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id)) ;

insert into parent values(3) ;
select * from parent ;
insert into child values(2,1) ;
select * from child ;
insert into child values(2,2) ;


delete from parent where id =1 ;

delete from child where id =2 ;

set sql_safe_updates = 0 ;

drop table child ;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on delete cascade ) ;

alter table parent drop primary key ;

insert into child values(1,1),(2,1), (2,2), (2,3), (3,3) ;


delete from parent where id =1 ;

delete from child where id =2 ;

update parent set id = 1 where id = 2 ;

drop table child ;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade ) ;


insert into child values(1,2),(2,3), (3,3) ;

update parent set id = 1 where id = 2 ;






