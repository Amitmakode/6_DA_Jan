-- regular expression
use class_6 ;

show tables ;
select * from bank_full ;
select * from dress ;

SELECT job FROM bank_full WHERE job REGEXP '^[abu]' ;  

SELECT job FROM bank_full WHERE job REGEXP '[rd]$' ;  

SELECT job FROM bank_full WHERE job REGEXP '^a' ;

SELECT job FROM bank_full WHERE job REGEXP 'in.$';   

SELECT job FROM bank_full WHERE job REGEXP 'n.$'; 
  
SELECT job FROM bank_full WHERE job REGEXP 'e..$';  

SELECT * FROM bank_full WHERE job REGEXP '^r'; 

SELECT * FROM bank_full WHERE job REGEXP '^.{9}$';

SELECT * FROM bank_full WHERE job REGEXP '^{9}$'; 

SELECT * FROM bank_full WHERE job REGEXP '.{5}$'; 

SELECT job FROM bank_full WHERE job REGEXP '-' ;  

SELECT job FROM bank_full WHERE job REGEXP 'u' ; 

SELECT job FROM bank_full WHERE job REGEXP 'min' ;  

SELECT balance FROM bank_full WHERE balance REGEXP 43 ; 

SELECT ('a' NOT REGEXP '[a-z]') AS not_match ; 

SELECT REGEXP_INSTR('a b c d e f', 'b', 1, 1, 0) AS start_index_;  

SELECT REGEXP_REPLACE ('expression', 'character', 'replace_character'); 

SELECT REGEXP_REPLACE ('character', 'expression',  'replace_character'); 

SELECT job, education, balance 
FROM bank_full  
WHERE education RLIKE 's$|y$'; 

SELECT job, education, balance 
FROM bank_full   
WHERE job RLIKE 't$|d$'; 

SELECT job, education, balance 
FROM bank_full   
WHERE job RLIKE 't$|d$'; 
  
SELECT job, education, balance 
FROM bank_full   
WHERE job RLIKE '^u|d$';

SELECT   
'Javatpoint' RLIKE '^C | e$' AS 'RLIKE',  
'Javatpoint' NOT RLIKE '^C | e$' AS 'NOT RLIKE';

SELECT job from bank_full where job RLIKE '^b|t$' ;
 
SELECT job, balance
FROM bank_full   
WHERE job RLIKE 'ad.in.'; 

SELECT job, balance
FROM bank_full   
WHERE job RLIKE 'a..in.'; 

SELECT job, balance,marital FROM bank_full   
WHERE marital RLIKE 'sin.gle';

SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match';   


SELECT  job from bank_full where job LIKE 'ent%';

SELECT * FROM bank_full WHERE job LIKE 'e%';  

SELECT * FROM bank_full WHERE job LIKE '%t';

SELECT * FROM bank_full WHERE job LIKE 'a%.';


rename table bank_full to bank ;

SELECT * FROM bank WHERE job LIKE 'admin_';

SELECT * FROM bank WHERE job LIKE 'a__in.';

SELECT job, marital FROM bank WHERE job LIKE "%t" and marital like "s%" ;

SELECT job, marital FROM bank WHERE job regexp "^[b]" and  marital regexp "^u" ;

SELECT job, marital FROM bank WHERE job like "%"; 


