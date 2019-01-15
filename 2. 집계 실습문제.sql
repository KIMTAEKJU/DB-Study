use employees;

select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;	
select * from dept_emp;
select * from titles;

-- 문제 1
select max(salary) - min(salary) "최고임금 - 최저임금" from salaries;

-- 문제 2
select date_format(max(hire_date), '%Y년 %m월 %d일') from employees;

-- 문제 3
select min(hire_date) from salaries, employees where salaries.emp_no = employees.emp_no and to_date = '9999-01-01';
select min(hire_date) from employees;

-- 문제 4
select avg(salary) from salaries where to_date = '9999-01-01';

-- 문제 5
select min(salary) 최저연봉, max(salary) 최고연봉 from salaries where to_date = '9999-01-01';

-- 문제 6
select date_format(current_date, '%Y') - date_format(max(birth_Date), '%Y'), (date_format(current_date, '%Y') - date_format(min(birth_Date), '%Y')) from employees;