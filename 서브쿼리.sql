-- subquery

SELECT 
    a.emp_no, b.dept_no
FROM
    employees a,
    dept_emp b
WHERE
    a.emp_no = b.emp_no
        AND CONCAT(a.first_name, ' ', a.last_name) = 'Fai Bale'
        AND b.to_date = '9999-01-01';
        
SELECT 
    a.emp_no, a.first_name
FROM
    employees a,
    dept_emp b
WHERE
    a.emp_no = b.emp_no
        AND b.dept_no = (SELECT 
            b.dept_no
        FROM
            employees a,
            dept_emp b
        WHERE
            a.emp_no = b.emp_no
                AND CONCAT(a.first_name, ' ', a.last_name) = 'Fai Bale'
                AND b.to_date = '9999-01-01');
                
                
-- ex1
SELECT 
    a.first_name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_Date = '9999-01-01'
        AND salary < (
        SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            to_Date = '9999-01-01')
ORDER BY b.salary DESC;

-- ex2

SELECT 
    title, AVG(salary) '평균연봉'
FROM
    salaries,
    titles,
    employees
WHERE
    salaries.emp_no = titles.emp_no
        AND employees.emp_no = salaries.emp_no
        AND salaries.to_date = '9999-01-01'
        AND titles.to_date = '9999-01-01'
GROUP BY title
ORDER BY 평균연봉 ASC
LIMIT 0 , 1;
    
    
SELECT 
    AVG(salary) '평균연봉'
FROM
    salaries,
    titles
WHERE
    salaries.emp_no = titles.emp_no
        AND salaries.to_date = '9999-01-01'
        AND titles.to_date = '9999-01-01'
GROUP BY title
HAVING round(AVG(salary)) = (SELECT 
        round(MIN(평균연봉))
    FROM
        (SELECT 
            AVG(salary) '평균연봉'
        FROM
            salaries, titles
        WHERE
            salaries.emp_no = titles.emp_no
                AND salaries.to_date = '9999-01-01'
                AND titles.to_date = '9999-01-01'
        GROUP BY title) a);
        
        
-- 다중행
-- any    = any(어쩌구) 어쩌구 중에 하나라도맞으면 ok   = any  ==  in
-- > any, < any, <>any
-- all
-- =all(요건 에러가많이남), >all, <all, <>all, <=all, >=all
-- =all은 단일행일때만 성립

-- ex)
SELECT 
    CONCAT(first_name, ' ', last_name), b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND (a.emp_no , b.salary) in (SELECT 
            emp_no, salary
        FROM
            salaries
        WHERE
            to_date = '9999-01-01'
                AND salary > 50000);

SELECT 
    CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM
    employees a,
    (SELECT 
        emp_no, salary
    FROM
        salaries b
    WHERE
        to_date = '9999-01-01'
            AND salary > 50000) b
WHERE
    a.emp_no = b.emp_no;
    
-- 조인은 시간이 많이걸림
-- 서브쿼리로 할수있는건 where절에두고 해야함 안되면 from절에 
-- rdb목적은 데이터무결성, 데이터 설계 같은것에 초점