use amit ;

select * from sdf ;

alter table sdf
drop column col1 ;

ALTER TABLE sdf
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

alter table sdf
add column col1 int after id ;

-- Step 2: Update the existing records to populate the ID column

SET @col1 := 0;
UPDATE sdf
SET col1 = (@col1 := @col1 + 1);


-- loop

create table loop_table (valuess int);

select * from loop_table ;


Delimiter $$
create procedure insert_data()
Begin
set @var  = 10 ;
generate_data : loop
insert into loop_table values (@var);
set @var = @var + 1  ;
if @var  = 100 then 
	leave generate_data;
end if ;
end loop generate_data;
End $$

call insert_data();

select * from loop_table;


-- windows aggregate function

use class_6; 

show tables ;

create table inst_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50));


select * from inst_students ;


select * from inst_students limit 5 ;


insert into inst_students values(101 ,'FSDA' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'FSDA' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'FSDA' , 'shyam','cs',82,'shyam@gmail.com'),
(104 ,'FSDA' , 'santanu','cs',82,'sanket@gmail.com'),
(105 ,'FSDA' , 'AMIT','ME',67,'shyam@gmail.com'),
(106 ,'FSDS' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'FSDS' , 'anil','ME',78,'ajay@gmail.com'),
(107 ,'FSDS' , 'snehal','CI',89,'snehal@gmail.com'),
(108 ,'FSDS' , 'manisha','CI',34,'manisha@gmail.com'),
(109 ,'FSDS' , 'rakesh','CI',45,'rakesh@gmail.com'),
(110 ,'SALEsFORCE' , 'anuj','CI',43,'anuj@gmail.com'),
(111 ,'SALEsFORCE' , 'mohit','EE',67,'mohit@gmail.com'),
(112 ,'SALEsFORCE' , 'vivek','EE',23,'vivek@gmail.com'),
(113 ,'SALEsFORCE' , 'gaurav','EE',48,'gaurav@gmail.com'),
(114 ,'SALEsFORCE' , 'prateek','EE',88,'prateek@gmail.com'),
(115 ,'SALEsFORCE' , 'mithun','ECE',27,'mithun@gmail.com'),
(116 ,'Devops' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(117 ,'Devops' , 'pranay','ECE',45,'pranay@gmail.com'),
(118 ,'Devops' , 'sandeep','ECE',65,'sandeep@gmail.com'),
(119 ,'Devops' , 'sanjay','ECE',68,'sandeep@gmail.com');


select student_batch , sum(students_marks) from inst_students group by student_batch;

select student_batch ,min(students_marks) from inst_students group by student_batch;

select student_batch ,max(students_marks) from inst_students group by student_batch;

select student_batch ,avg(students_marks) from inst_students group by student_batch;

select count(student_batch) from inst_students;

select count(distinct student_batch) from inst_students;

select count(distinct students_marks) from inst_students;

select student_batch , count(*) from inst_students group by student_batch;

select student_batch, max(students_marks) from inst_students group by student_batch;

select student_batch, max(students_marks) from inst_students group by student_batch limit 3;

select max(students_marks) from inst_students where student_batch='fsda';

select student_name, student_batch, max(students_marks) from inst_students ;

select student_name, student_batch from inst_students ;

select student_name, student_batch, max(students_marks) from inst_students group by student_batch ;

select student_name, max(students_marks) from inst_students where student_batch='FSDA';

SELECT s.student_name, s.student_batch, m.max_marks
FROM inst_students s
JOIN (
    SELECT student_batch, MAX(students_marks) AS max_marks
    FROM inst_students
    GROUP BY student_batch)
    m ON s.student_batch = m.student_batch AND s.students_marks = m.max_marks;
    
select student_name, students_marks  from inst_students where students_marks in 
(select max(students_marks) from inst_students where student_batch="fsda");


select student_name from inst_students where student_batch='fsda' order by students_marks DESC limit 4;

select * from inst_students where student_batch = 'fsda' order by students_marks ;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,2;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 1,3;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 2,2;

select * from inst_students where student_batch = 'fsda' order by students_marks desc limit 3,2;



















