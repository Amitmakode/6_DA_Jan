use class_6 ;

CREATE TABLE customer_key (  
  ID INT NOT NULL AUTO_INCREMENT,  
  `Name` varchar(50) NOT NULL,  
  City varchar(50) NOT NULL,  
  PRIMARY KEY (ID)  
);  



CREATE TABLE contact_key (  
  ID INT,  
  Customer_Id INT,  
  Customer_Info varchar(50) NOT NULL,  
  `Type` varchar(50) NOT NULL,  
  INDEX par_ind (Customer_Id),  
  CONSTRAINT fk_custom FOREIGN KEY (Customer_Id)  
  REFERENCES customer_key(ID)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
); 

insert into customer_key values(1, "abc", "xyz"), (2, "abc", "xyz"),(3, "abc", "xyz") ;


insert into contact_key values(1, 2, "invailid", "unknown"), (2, 1, "invailid", "unknown"),(3, 3, "invailid", "unknown") ;


select * from customer_key ;
select * from contact_key ;

delete from customer_key where id = 1 ;

update customer_key set id = 1 where id = 3 ;


show index from contact_key ;

describe contact_key;

describe customer_key ;





CREATE TABLE customer1 (  
  ID INT NOT NULL AUTO_INCREMENT,  
  `Name` varchar(50) NOT NULL,  
  City varchar(50) NOT NULL,  
  PRIMARY KEY (ID)  
); 



CREATE TABLE Contact1 (  
  ID INT,  
  Person_Id INT,  
  Info varchar(50) NOT NULL,  
  `Type` varchar(50) NOT NULL,  
  INDEX par_ind (Person_Id),  
  CONSTRAINT fk_person FOREIGN KEY (Person_Id)  
  REFERENCES customer1(ID)  
  ON DELETE SET NULL  
  ON UPDATE SET NULL  
); 

insert into customer1 values(1, "abc", "xyz"), (2, "abc", "xyz"),(3, "abc", "xyz") ;

insert into contact1 values(1, 1, "invailid", "unknown"), (2, 2, "invailid", "unknown"),(3, 3, "invailid", "unknown") ;

select * from customer1 ;
select * from contact1 ;

delete from customer1 where id = 1 ;
update customer1 set id= 1 where id = 3 ;

ALTER TABLE Contact ADD INDEX par_ind ( Person_Id );  

ALTER TABLE Contact ADD CONSTRAINT fk_person  
FOREIGN KEY ( Person_Id ) REFERENCES Person ( ID ) ON DELETE CASCADE ON UPDATE RESTRICT;  

SET foreign_key_checks = 0; 

-- ----------------------------------------------------------------------------

-- composit key

CREATE TABLE Product (  
    Prod_ID int,   
    `Name` varchar(45),   
    Manufacturer varchar(45),  
    PRIMARY KEY(`Name`, Manufacturer)  
);


DESCRIBE Product;  


INSERT INTO Product (Prod_ID, `Name`, Manufacturer)  
VALUES (101, 'Soap', 'Hamam'),  
(102, 'Shampoo', 'Teresme'),  
(103, 'Oil', 'Daber Almond'); 


INSERT INTO Product (Prod_ID, `Name`, Manufacturer)  
VALUES (104, 'Soap', 'Hamam');  
  
INSERT INTO Product (Prod_ID, Name, Manufacturer)  
VALUES (101, 'Soap', 'LUX'); 




CREATE TABLE Student(  
  stud_id int NOT NULL,  
  stud_code varchar(15),  
  stud_name varchar(35),  
  `subject` varchar(25	),     
  marks int  
);  


ALTER TABLE Student add primary key(stud_id, `subject`); 


create table ck (c1 int, 
c2 varchar(20), 
c3 float,
primary key (c1, c2)) ;


create table ck1 (
c11 int, 
c12 varchar (20),
FOREIGN KEY (c11) REFERENCES ck (c1));


create table ck3 (
c21 int, 
c22 varchar (20),
FOREIGN KEY (c22) REFERENCES ck (c2)
);


describe ck1;


ALTER TABLE ck2 ADD INDEX idx_c1 (c22);

alter table ck2 add constraint foreign key (c22) REFERENCES ck ( c2 ) ;


-- -----------------------------------

#union

select course_id , course_name from course;

insert into course (course_id , course_name) values(101,"MTECH"), (102, "MS") ;

truncate table course ;

select student_id, course_name from student_neuron; 

insert into student_neuron (student_id, course_name ) values(111,"BE"), (112, "BA") ;

delete from student_neuron where student_id = 101 ;


select course_id , course_name from course 
union 
select student_id, course_name from student_neuron;

set sql_safe_updates = 0 ;

select course_id , course_name from course 
union all 
select student_id, course_name from student_neuron;

select course_id , course_name from course 
union all 
select course_name ,student_id from student_neuron ;

select course_id , course_name from course 
union all 
select course_name   from student_neuron ;


