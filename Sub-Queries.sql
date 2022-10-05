 --SUB QUERIES

  Select * from EMPLOYEES
  Select * from Company_and_Courses

  --How to find the employees who's salary is more then the average salary earned by all 
  --employees

  Select AVG(Salary)  --45208
  from EMPLOYEES

  Select *
  from EMPLOYEES		-- 1001, 1002,1005,1008,1012,1010(All Details)
  where SALARY > 45208

  Select *
  from EMPLOYEES		
  where SALARY > (Select AVG(Salary)  
  from EMPLOYEES)

  --SUB-QUERIES TYPES (Scalar, Multiple and Correlated Subquery) 

  --SCALAR SUBQUERY: it always return 1 column and 1 row.

  select * 
  from EMPLOYEES e
  join (select avg(salary) q1_sal from EMPLOYEES) avg_sal
  on e.SALARY > avg_sal.q1_sal

  --MULTIPLE SUBQUERY:  
  -- subquery which returns multiple column and multiple rows
  -- subquery which returns only 1 column and mutliple rows

  select jobtitle, 
  MAX(Salary) as max_sal
  from EMPLOYEES
  group by JOBTITLE

  
  select * 
  from EMPLOYEES
  where (JOBTITLE ,SALARY) in (  select JOBTITLE, 
								  MAX(Salary)
								  from EMPLOYEES
								  group by JOBTITLE);
  
  -- Find job title who do not have any employee

  select * from 
  Company_and_Courses

  select * from 
  Employees

  select distinct jobtitle
  from Employees

  select * from
  employees
  where jobtitle not in (  select distinct jobtitle
  from Employees)


  --CORRELATED SUBQUERY: subquery which is related to the outer query
  update EMPLOYEES 
  SET JOBTITLE = 'WEB DEVELOPER'
  where E_ID = 1010
  
  select * from 
  Employees

  select * 
  from EMPLOYEES e1
  where SALARY > (select avg(SALARY)
  from EMPLOYEES e2
  where e2.JOBTITLE = e1.JOBTITLE )


  Select * 
  from EMPLOYEES e
  where not exists 
  (select 1 from EMPLOYEES es where es.JOBTITLE = e.JOBTITLE);
  
  select * 
  from EMPLOYEES;

  -- Find the employees who's salary where better then the average salary across all jobtitles
--1. find the total sales for each store
--2. find the avg sales for all the stores
--3. compare 1 & 2
  
Select avg(Sum_salary)
from(
	select SUM(Salary) as Sum_salary, JOBTITLE
	from EMPLOYEES
	group by JOBTITLE ) f


select E_ID, 'hello' as comment
from EMPLOYEES