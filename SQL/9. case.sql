USE CLASS_6 ;

select * from bank_full ;
-- view ---------------------------------------------------

create view temporaty_table as select housing, balance, education, marital from bank_full;

drop view temporaty_table ;


select housing, balance, education, marital from bank_full;

select * from test ;


delimiter &&
create procedure view_pro (in a int)
begin
select housing, balance from test where balance > a ;
end &&

call view_pro(400) ;


-- case ------------------------------------------------------------


select * from shirts ;


select * ,
case 
    when `name` = 't-shirt' then sysdate()
    else "this is not your name"
end as statement 
from shirts;

select * from bank_full ;

select *,
case
	when `month` = "may" then "this is may nonth only"
end as stat
from bank_full;

select *,
case
	when `month` = "may" then "this is may month only"
    when `month` = "feb" then "this is feb month only"
    when `month` = 'jul' then system_user()
end as stat
from bank_full;

select *,
case
	when `month` = "may" then "this is may month only"
    when `month` = "feb" then "this is feb month only"
    when `month` = 'jul' then system_user()
    else "no"
end as stat
from bank_full;

select * from employee_1 ;

select * ,
case 
    when length(fistname) = 4  then "len 4"
    when length(fistname) = 3  then "len 2"
    else "other lenght"
end as statement 
from employee_1 ;


update employee_1 set fistname = case 
when fistname = 'john' then 'JD'
when fistname = 'bob' then 'BJ'
end; 


set sql_safe_updates = 0 ;

update employee_1
set fistname = "amit" where fistname = "jd" ;

SELECT Roll_No, Stu_Name, Stu_Subject, Stu_marks,  
CASE  
WHEN Stu_Marks >= 90 THEN 'Outstanding'  
WHEN Stu_Marks >= 80 AND Stu_Marks < 90 THEN 'Excellent'  
WHEN Stu_Marks >= 70 AND Stu_Marks < 80 THEN 'Good'  
WHEN Stu_Marks >= 60 AND Stu_Marks < 70 THEN 'Average'  
WHEN Stu_Marks >= 50 AND Stu_Marks < 60 THEN 'Bad'  
WHEN Stu_Marks < 50 THEN 'Failed'  
END AS Stu_Remarks  
FROM Student_Details; 




SELECT Emp_Id, Emp_Name, Emp_Dept, sum(Emp_Salary) as Total_Salary,  
CASE  
WHEN SUM(Emp_Salary) >= 10000 THEN 'Increment'  
ELSE 'Constant'  
END AS Emp_Remarks  
FROM Employee_Details  
GROUP BY Emp_id, Emp_Name; 


SELECT * FROM Employee_Details  
ORDER BY CASE WHEN Emp_Dept = 'Coding' THEN 0  
ELSE 1 END, Emp_Name; 


CREATE VIEW Employee_View AS
SELECT * FROM Employee_Details  
ORDER BY CASE WHEN Emp_Dept = 'Coding' THEN 0  
ELSE 1 END, Emp_Name;




















