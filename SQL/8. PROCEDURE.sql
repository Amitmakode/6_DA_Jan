USE CLASS_6;

create table if not exists bank(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int ,
housing varchar(30),
loan varchar(30) ,
contact varchar(30),
`day` int,
`month` varchar(30) ,
duration int ,
campaign int,
pdays int ,
previous int ,
poutcome varchar(30) ,
y varchar(30));

SELECT * FROM bank_full ;

DELIMITER &&
create procedure `ALL`()
BEGIN
	select * from bank_full;
END &&

call `all`();

DELIMITER &&
create procedure p1(IN a varchar(20), IN b varchar(10))
BEGIN
	select age, marital, loan from bank_full where marital = a or loan = b;
END &&

drop procedure p1 ;

call p1("single", "yes") ;

DESCRIBE BANK_FULL ;

DELIMITER &&
CREATE PROCEDURE P2 (IN A INT, IN c int, IN B VARCHAR(20),IN D VARCHAR(20))
BEGIN
SELECT AGE, JOB, BALANCE FROM BANK_FULL WHERE AGE >= A AND BALANCE <= C AND (JOB = B OR JOB = D) ;
END &&


CALL P2(45, "BLUE-COLLAR", 100) ;

SELECT JOB FROM BANK_FULL WHERE JOB IN ("ADMIN.", "BLUE-COLLAR") ;

SELECT AGE FROM BANK_FULL WHERE AGE BETWEEN 20 AND 40;

DELIMITER &&
CREATE PROCEDURE P3 (IN A INT, IN B VARCHAR(20), IN D VARCHAR(10), IN c int)
BEGIN
SELECT AGE, JOB, BALANCE FROM BANK_FULL WHERE AGE >= A AND JOB = B AND JOB = D AND BALANCE <= C ;
END &&

CALL P3(30, "ADMIN.", "UNEMPLOYED", 200) ;








