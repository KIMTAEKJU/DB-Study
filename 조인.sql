use employees;

select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;	
select * from dept_emp;
select * from titles;

-- equijoin (inner join)

-- 현재 근무중인 직원의 이름과 직책을 출력하세요.
SELECT 
    a.emp_no, a.first_name, b.title
FROM
    employees a,
    titles b
WHERE
    a.emp_no = b.emp_no -- join 조건
        AND b.to_Date = '9999-01-01';
        
-- 현재 근무중인 직책이 Senior Engineer인 여자 직원의 이름을 출력하세요.
SELECT 
    a.emp_no, a.first_name
FROM
    employees a,
    titles b
WHERE
    a.emp_no = b.emp_no
        AND b.title = 'Senior Engineer'
        AND a.gender = 'f';
        
        
-- ANSI/SIO SQL의 JOIN

-- 1. natural join
SELECT 
    a.emp_no, a.first_name, b.title
FROM
    employees a
        NATURAL JOIN
    titles b
WHERE
    b.to_Date = '9999-01-01';
        
-- 2. join ~ using
SELECT 
    a.emp_no, a.first_name, b.title
FROM
    employees a
        JOIN
    titles b USING (emp_no)
WHERE
    b.to_Date = '9999-01-01';
    
-- 3. join ~ on
SELECT 
    a.emp_no, a.first_name, b.title
FROM
    employees a
        JOIN
    titles b on a.emp_no = b.emp_no
WHERE
    b.to_Date = '9999-01-01';
    
SELECT 
    employees.emp_no, CONCAT(first_name, ' ', last_name), salary
FROM
    salaries,
    employees
WHERE
    employees.emp_no = salaries.emp_no
        AND to_date = '9999-01-01'
ORDER BY CONCAT(first_name, ' ', last_name) ASC;

SELECT 
    employees.emp_no,
    CONCAT(first_name, ' ', last_name),
    departments.dept_name
FROM
    employees,
    dept_emp,
    departments
WHERE
    employees.emp_no = dept_emp.emp_no
        AND dept_emp.dept_no = departments.dept_no
        AND dept_emp.to_Date = '9999-01-01'; 


