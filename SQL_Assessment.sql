create database asmnt;
use asmnt;
create table Workers (WORKER_ID INT PRIMARY KEY,
	FIRST_NAME VARCHAR(70),
	LAST_NAME VARCHAR(70),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50));
    
INSERT INTO Workers values(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00', 'HR'),
	(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00', 'Admin');
    
    -- 1
   
    select * from workers order by first_name asc, department desc;
    
    -- 2
    select * from workers where first_name in ('Vipul', 'Satish');
    
    -- 3
    select * from workers where first_name like '%h' and length(first_name) = 6;
    
    -- 4
    select * from workers where salary < 100000;
    
    -- 5
    with Same_Salary_Workers
    as (select first_name, salary as Different_parameters from workers where (salary) in (select salary from workers group by salary having count(*) > 1)),
    Same_Departments_Workers
    as (select first_name, department from workers where (department) in (select department from workers group by department having count(*) > 1)),
    Same_Joining_Date
    as (select first_name, joining_date from workers where (joining_date) in (select joining_date from workers group by joining_date having count(*) > 1))
    select * from Same_Salary_Workers
	union all
    select * from Same_Departments_Workers
    union all
    select * from Same_Joining_Date;
    
    -- 5th que 2nd approach
    select w.* from workers w join (select salary, count(*) from workers group by salary having count(*) > 1) w1 on w.salary=w1.salary 
    join (select department, count(*) from workers group by department having count(*) > 1) w2 on w.department=w2.department
    join (select joining_date, count(*) from workers group by joining_date having count(*) > 1) w3 on w.joining_date=w3.joining_date;
            
    -- 6
    select * from workers limit 6;
    
    -- 7
    select department, count(department) from workers group by department having count(department) < 5;
    
    -- 8
    select department, count(department) from workers group by department;
    
    -- 9
    select First_name, salary, department from workers where (salary, department) in (select max(salary), department from workers group by department);
   
   
   
create table Students (STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME TEXT,
SEX VARCHAR(15),
PERCENTAGE int,
CLASS INT,
SEC CHAR,
STREAM VARCHAR(30),
DOB DATE);

insert into Students values(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'), 
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'STUTI MISHRA', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');
 
-- 1 
select * from Students;

-- 2
SELECT Student_name, DOB FROM students;

-- 3
SELECT * FROM students WHERE percentage >= 80;

-- 4
SELECT Student_name, Stream, Percentage from students WHERE percentage > 80;

-- 5
SELECT * FRoM students WHERE stream like 'Science' AND percentage > 75;
