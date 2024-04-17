USE CLASS_6 ;

SHOW TABLES ;


DELIMITER $$
create function FUN1(A INT) 
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE B int ;
	set B = A + 10 ;
	return B ;
end $$


SELECT SUM(BALANCE) FROM BANK_FULL ;

SELECT AGE, FUN1(AGE) FROM BANK_FULL ;


DELIMITER $$
create function FUN2(p int, d int )
returns int
Deterministic
Begin 
Declare FP int ;
set FP = p - d ;
return FP;
end $$

SELECT PROFIT, DISCOUNT, FUN2(PROFIT, DISCOUNT) FROM SALES ;


DELIMITER $$
create function FUN3(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns decimal
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - sales * discount;
return final_profit;
end $$


SELECT * FROM EMPLOYEE_1 ;

DELIMITER $$
create function FUN4(F VARCHAR(20), L VARCHAR(20) )
returns int
Deterministic
Begin 
Declare FN int ;
set FN = concat(F, L);
return FN;
end $$

SELECT FISTNAME, LASTNAME, FUN4(FISTNAME, LASTNAME) FROM EMPLOYEE_1 ;

SELECT avg(age) FROM BANK_FULL;


DELIMITER $$
create function FUN4(SALES )
returns int
Deterministic
Begin 
Declare FN int ;
set FN = concat(F, L);
return FN;
end $$


-- condition with function 

1  - 100 - super affordable product 
100 -300 - affordable 
300 - 600 - moderate price 
600 + - expensive 

1- 5 - toddler 
5 - 10 - kids
10 - 18 - tenagers
18 - 30 - young
30 - 60 - man
60 -70 - senior citizen 
70 + - super senior



DELIMITER &&
create function mark_sales(a int) 
returns varchar(30)
DETERMINISTIC
begin 
declare b varchar(30); 
if a  <= 100  then 
	set b = "super affordable product" ;
elseif a > 100 and a < 300 then 
	set b = "affordable" ;
elseif a >300 and a < 600 then 
	set b = "moderate price" ;
else 
	set b = "expensive" ;
end if ;
return b;
end &&


select sales, mark_sales(sales) from sales ;



delimiter &&
create function age_cat(a int)
returns varchar(20)
Deterministic
Begin
declare b varchar(20);
if a <=5 then
	set b = "toddler";
elseif a > 5 and a < 10 then
	set b = "child";
elseif a >= 10 and a < 18 then
	set b = "teenager";
elseif a >=18 and a < 30 then
	set b = "youngers";
elseif a >= 30 and a < 60 then
	set b = "man";
elseif a >= 60 then 
set b = "senior citizen" ;   
else
	set b = "super senior citizen";
end if;
return b;
END &&



select age, age_cat(age) from bank_full ;



CREATE FUNCTION MULTIVALUED()  
RETURNS @Employee TABLE (id INT, emp_name VARCHAR(50), salary INT) AS  
BEGIN  
    INSERT INTO @Employee  
    SELECT E.id, E.emp_name, E.salary FROM Employee E;  
    UPDATE @Employee SET emp_name = 'Graeme Smith' WHERE id = 3;  
    RETURN  
END 


 


select * from student