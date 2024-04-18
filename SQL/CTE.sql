use class_6 ;
#CTE common table expression

select * from course101 ;

select * from course4 ;

select * from course101 where course_id in (101,102,106);

with sample_students as 
(select * from course101 where course_id in (101,102,106, 108))
select * from sample_students where course_name = 'aiops';


select * from course101 where course_id in (101,102, 104, 109) and course_name in ("aiops", "fsds") ;

select c.course_id , c.course_name , c.course_desc ,s.course_id, s.course_desc, s.course_tag from course101 c
cross  join course4 s;


with outcoume_cross as 
(select c.course_id , c.course_name , c.course_desc , s.course_id, s.course_desc, s.course_tag 
from course101 c cross  join course4 s ) 
select course_id , course_name  from outcoume_cross where cours_tag = "ds" ;

use class10 ;

select * from course ;

select * from student_join ;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student_join s;

with outcoume_corss as (select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id
from course c join student_join s ON c.course_id = s.student_course_id) 
select course_id , course_name , course_desc, student_id from outcoume_corss where student_id = 301;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
join student_join s ON c.course_id = s.student_course_id;


SELECT c.course_id, c.course_name, c.course_desc, s.student_id
FROM course c JOIN student_join s ON c.course_id = s.student_course_id
WHERE s.student_id = 301;

select 1 as col1, 2 as col2; 

select 1 as col1, 2 as col2 
union all
select 5, 4;

with ctetest as (select 1 as col1, 2 as col2 
union all
select 3, 4)
select col1 from ctetest;

with recursive cte(n) as (select 1 union all select n+1 from cte where n<5)
select * from cte; 

select 1 as col1 
union all
select 5 ;


select 1 as n, 2 as p ;

with recursive cte as (select 1 as n, 2 as p 
union all 
select n+1, p+2 from cte where n<50)
select * from cte;


with recursive cte as (select 1 as n, 2 as p 
union all 
select n+1, p+2 from cte where n<20 and p<10)
select * from cte;

with recursive age_cte as (select 1 as id from bank 
union all 
select id +1 from age_cte where id<20)
select * from age_cte ;

WITH RECURSIVE age_cte AS (
    SELECT 1 AS id
    FROM dual -- Assuming 'dual' is a table available in your database, otherwise, replace it with any other suitable table
    UNION ALL
    SELECT id + 1
    FROM age_cte
    WHERE id < 13824 -- Adjust this condition as per your requirement
)
SELECT * FROM age_cte;

SET @@cte_max_recursion_depth = 20000; -- Set the maximum recursion depth to 2000 or any other suitable value

select * from bank ;

WITH RECURSIVE age_cte AS (
    SELECT 1 AS id
    FROM dual -- Assuming 'dual' is a table available in your database, otherwise, replace it with any other suitable table
    UNION ALL
    SELECT id + 1
    FROM age_cte
    WHERE id < 13824 -- Adjust this condition as per your requirement
)
UPDATE bank b
JOIN age_cte a ON b.id = a.id
SET b.ID = a.id; -- Replace 'new_column' with the name of the column you want to add the sequence to


use class10 ;

