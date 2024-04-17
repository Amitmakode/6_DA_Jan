use class_6 ;

-- trigger 

create table trigger1 (
c1 varchar(50),
c2 date,
c3 int);

create table trigger2 (
c11 varchar(50),
c12 date,
c13 int);

insert into trigger1 value ("java", "2000-12-12", 500) ;
insert into trigger2 value ("java1", "2000-12-12", 501) ;

select * from trigger1
select * from trigger2



delimiter //
create trigger t1_to_t2
after insert on trigger1 for each row 
begin
	insert into trigger2(c11,c12,c13) values ("xyz", sysdate(), 120);
end; //

insert into trigger1 value ("java", "2000-12-12", 500) ;


create table T1(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);

create table T2(
course_metor_update varchar(50), 
course_price_update int ,
course_discount_update int );

insert into t1 ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(101, "FSDA", "sudhanshu", 4000, 100);


select * from t1 ;

delimiter //
create trigger t1_before_insert
before insert on t1 for each row
begin
	set new.create_date = sysdate();
end; // 


SELECT CURRENT_TIME();

create table T3(
course_metor_update varchar(50), 
course_price_update int ,
course_current_time time );

delimiter //
create trigger t1_to_t3
after insert on t1 for each row 
begin
	insert into t3(course_current_time) values ( CURRENT_TIME());
end; //

select * from t3 ;


delimiter //
create trigger to_delete_others1
before delete on t1 for each row 
begin
	insert into t2 (course_metor_update,course_price_update,course_discount_update) 
    values (old.course_desc, old.course_price,old.course_discount);
end; //


select * from t4 ;

delete from t1 where course_id = 102 ;



create table T4(
c21 varchar(50), 
c22 int ,
c23 time );


delimiter //
create trigger to_update1
before update on t1 for each row 
begin
	insert into t4 (c21, c22,c23) 
    values ("amirt", 6567, current_time());
end; //


update t1 set course_id = 111 where course_id = 101 ;



delimiter //
create trigger to_update_others
before insert on demo for each row 
begin
	insert into  demo2 values("xyz",sysdate(),23354);
	insert into  demo1 values("xyz",sysdate(),23354);
end; //


drop trigger to_update1 ;


delimiter //
CREATE TRIGGER trigger_name    
    (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
         ON table_name FOR EACH ROW    
         BEGIN    
        --variable declarations    
        --trigger code    
END; 




