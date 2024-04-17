create database partition6 ;

use partition6 ;

-- partition by range

create table  class101(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)(
partition part0 values less than (2020),
partition part1 values less than (2021),
partition part2 values less than (2022),
partition part3 values less than (2023),
partition part4 values less than (2024));


insert into class101 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019)  ;

insert into class101 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023);


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class101';


select * from  class101 where course_launch_year = 2021;


-- partition by hash

create table  class102(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;

insert into class102 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class102';


-- parttion by list

create table  class103(
course_name varchar(50),
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in(2019,2020),
partition p1 values in(2022,2021),
partition p2 values in(2023,2024, 2025)
);


insert into class103 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2020) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('DM' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2021),
('mm' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('sd' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('fico' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025),
('hr' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025);


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class103';


-- partition by range columns


create table class104(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range columns(course_name, course_id, course_launch_year )
(
partition p0 values less than ('aiops',105,2020),
partition p1 values less than ('fsds' ,110,2021),
partition p2 values less than ('MERN',116,2022)
);



insert ignore into  class104 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2020) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('DM' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2021),
('mm' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('sd' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('fico' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025),
('hr' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class104';

insert into course105 values(null, null, 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2022) ;

insert into course105 (course_launch_year) values(2022) ;


select ('ml',112,2020) < ('fsds' ,110,2021);

select ('aiops',105,2019) > ('MERN',116,2022) ;

select 'a' > 'b';
select 'a' < 'b';
select 'a' < 'z';


-- parttion by list cloumn

create table class105(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list columns(course_name)(
partition p0 values  in('aiops','data analytics','Dl','RL'),
partition p1 values  in('fsds' ,'big data','blockchain'),
partition p2 values  in('MERN','java','interview prep','fsda')
);



select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class105';


insert into class105 (course_name) value ('AI') ;


create table class106 (
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list columns (course_name, course_id)(
partition p0 values  in('aiops','data analytics',2021, 2019),
partition p1 values  in('fsds' ,'big data', 2022, 2020),
partition p2 values  in('MERN','java', 2023, 2024)
);

select * from course107 ;


CREATE TABLE class106 (
    course_name varchar(50),
    course_id int(10),
    course_title varchar(60),
    course_desc varchar(80),
    launch_date date,
    course_fee int,
    course_mentor varchar(60),
    course_launch_year int
)
PARTITION BY LIST COLUMNS (course_name, course_id)(
    PARTITION p0 VALUES IN (('aiops', 2019), ('data analytics', 2021)),
    PARTITION p1 VALUES IN (('fsds', 2020), ('big data', 2022)),
    PARTITION p2 VALUES IN (('MERN', 2024), ('java', 2023))
);


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class106';


insert into class106 (course_name, course_id) value ('fsds', 2022) ;






