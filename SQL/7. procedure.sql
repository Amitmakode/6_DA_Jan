use class_6 ;

create table employee_1 (ID int, fistname varchar(20), lastname varchar (20), employeeid int, salary int) ;

insert into employee_1 values(1, "john", "doe", 1, 60000 ),
(2, "alice", "smith", 2, 70000),
(3, "bob", "johnson", 3, 55000),
(4, "emma", "lee", 4, 80000) ;

select * from employee_1 ;


create table department (depa_id int, depa_name varchar (20)) ;


insert into department values(1, "marketing"),
(2, "HR"),
(3, "Finance") ;

select * from department ;

select fistname, lastname from employee_1 ;

select  fistname, lastname, salary from employee_1 where salary = 70000 ;

select  fistname, lastname, salary from employee_1 where salary in (60000, 70000, 55000);

select  fistname, lastname, salary from employee_1 order by id desc ;

select  fistname, lastname, salary from employee_1 order by salary desc limit 2 ;

select * from sales ;


SELECT  region, AVG(quantity) AS Avgquantity
FROM sales
GROUP BY region;

SELECT  country, AVG(quantity) AS Avgquantity
FROM sales
GROUP BY country;


SELECT ID, AVG(Salary) AS AvgSalary
FROM Employee_1
GROUP BY ID
HAVING AVG(Salary) > 60000;

select id, avg(salary) from employee_1 where avg(salary) > 60000 ;

SELECT ID, COUNT(*) AS EmployeeCount
FROM Employee_1
GROUP BY ID
HAVING COUNT(*) < 2;



SELECT ID, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employee_1
GROUP BY ID
HAVING AVG(Salary) > 60000 and COUNT(*) < 1;


select * from sales ;


select segment, state, market, quantity from sales where quantity > 50 ;


-- procedure

DELIMITER &&
create procedure proce_1(In a int)
BEGIN
	select segment, state, market, quantity from sales where quantity > a ;
END &&


call proce_1(1000)  ;

delimiter &&
create procedure proc_2 (in a varchar(20), in b int)
begin
select region, profit, segment, country, shipping_cost from sales where country = a and  shipping_cost = b ;
end &&

call proc_2("canada", 0);





