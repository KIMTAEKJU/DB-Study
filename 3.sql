use employees;

select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;	
select * from dept_emp;
select * from titles;

-- 문제 1
SELECT 
    employees.emp_no 사번,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) 이름,
    salary
FROM
    salaries,
    dept_emp,
    employees
WHERE
    salaries.emp_no = dept_emp.emp_no
        AND employees.emp_no = dept_emp.emp_no
        AND salaries.to_date = '9999-01-01'
ORDER BY salary DESC;

-- 문제 2
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.title
FROM
    employees a,
    titles b
WHERE
    a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
ORDER BY CONCAT(a.first_name, ' ', a.last_name);

-- 문제 3
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name), c.dept_name
FROM
    employees a,
    departments c,
    dept_emp b
WHERE
    a.emp_no = b.emp_no
        AND c.dept_no = b.dept_no
        and b.to_date = '9999-01-01'
ORDER BY CONCAT(a.first_name, ' ', a.last_name);

-- 문제 4
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name),
    b.salary,
    c.title,
    e.dept_name
FROM
    employees a,
    salaries b,
    titles c,
    dept_emp d,
    departments e
WHERE
    a.emp_no = b.emp_no
        AND b.emp_no = c.emp_no
        AND a.emp_no = d.emp_no
        AND d.dept_no = e.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
ORDER BY CONCAT(a.first_name, ' ', a.last_name) ASC; 

-- 문제 5
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name)
FROM
    employees a,
    titles b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date NOT IN ('9999-01-01')
        AND b.title = 'Technique Leader';
        
-- 문제 6
SELECT 
    CONCAT(a.first_name, ' ', a.last_name), c.dept_name, d.title
FROM
    employees a,
    dept_emp b,
    departments c,
    titles d
WHERE
    a.emp_no = b.emp_no
        AND b.dept_no = c.dept_no
        and a.emp_no = d.emp_no
        and b.to_date = '9999-01-01'
        and a.last_name like 'S%'; 
        
-- 문제 7
SELECT 
    *
FROM
   -- employees a,
    salaries b,
    titles c
WHERE
   -- a.emp_no = b.emp_no
		b.emp_no = c.emp_no
        AND b.to_Date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND c.title = 'Engineer'
        AND b.salary >= 40000
ORDER BY b.salary DESC;

-- 문제 8
SELECT 
    b.title, a.salary
FROM
    salaries a,
    titles b
WHERE
    a.emp_no = b.emp_no
        AND a.to_date = '9999-01-01'
        AND b.to_date = '9999-01-01'
        AND a.salary > 50000
        -- group by b.title
ORDER BY a.salary DESC;

-- 문제 9
SELECT 
    b.dept_name, AVG(c.salary)
FROM
    dept_emp a,
    departments b,
    salaries c
WHERE
    b.dept_no = a.dept_no
        AND a.emp_no = c.emp_no
GROUP BY b.dept_name
ORDER BY AVG(c.salary) desc;

-- 문제 10
SELECT 
    b.title, AVG(a.salary)
FROM
    salaries a,
    titles b
WHERE
    a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY AVG(a.salary) DESC;


-- 예제 5
SELECT 
    a.title, AVG(b.salary), COUNT(*)
FROM
    titles a,
    salaries b
WHERE
    a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
GROUP BY a.title
HAVING COUNT(*) > 100;

-- 정답
SELECT 
    c.title, AVG(b.salary), COUNT(*)
FROM
    employees a,
    salaries b,
    titles c
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_Date = '9999-01-01'
GROUP BY c.title
HAVING COUNT(*) > 100;

-- 예제 6
SELECT 
    c.title, avg(d.salary)
FROM
    departments a,
    dept_emp b,
    titles c,
    salaries d
WHERE
    a.dept_no = b.dept_no
        AND b.emp_no = c.emp_no
        and c.emp_no = d.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND c.title = 'Engineer'
GROUP BY a.dept_name;

-- 정답
SELECT 
    a.dept_name, c.title, AVG(d.salary)
FROM
    departments a,
    dept_emp b,
    titles c,
    salaries d
WHERE
    a.dept_no = b.dept_no
        AND b.emp_no = c.emp_no
        AND c.emp_no = d.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        and d.to_Date = '9999-01-01'
        AND c.title = 'Engineer'
GROUP BY a.dept_name;


-- 예제 7
SELECT 
    a.title, sum(b.salary)
FROM
    titles a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND a.title <> ('Engineer')
GROUP BY a.title
having sum(b.salary) > 2000000000
order by sum(b.salary) desc;

-- 정답
SELECT 
    a.title, SUM(b.salary)
FROM
    titles a,
    salaries b,
    employees c
WHERE
    a.emp_no = b.emp_no
        AND b.emp_no = c.emp_no
        AND a.to_Date = '9999-01-01'
        AND b.to_date = '9999-01-01'
        AND a.title <> ('Engineer')
GROUP BY a.title
HAVING SUM(b.salary) > 2000000000
ORDER BY SUM(b.salary) DESC;