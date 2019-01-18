use employees;

select * from employees;
select * from salaries;
select * from departments;
select * from dept_manager;	
select * from dept_emp;
select * from titles;

-- 문제 1
SELECT 
    COUNT(*)
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND b.salary > (SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            salaries.to_date = '9999-01-01'); 

-- SELECT 
--    a.dept_name, MAX(b.salary)
-- FROM
--     departments a,
--     salaries b,
--     dept_emp c,
--     employees d
-- WHERE
--     a.dept_no = c.dept_no
--         AND c.emp_no = b.emp_no
--         and d.emp_no = b.emp_no
-- GROUP BY a.dept_name;

-- SELECT 
--     a.emp_no, CONCAT(a.first_name, ' ', a.last_name)
-- FROM
--     employees a,
--     dept_emp b,
--     departments c,
--     salaries d
-- WHERE
--     a.emp_no = b.emp_no
--         AND b.dept_no = c.dept_no
--         AND d.emp_no = a.emp_no
--         AND b.to_Date = '9999-01-01'
--         AND d.to_date = '9999-01-01'
--         AND (c.dept_name , d.salary) = ANY (SELECT 
--             c.dept_name, MAX(d.salary)
--         FROM
--             departments c,
--             salaries d,
--             dept_emp b,
--             employees a
--         WHERE
--             b.dept_no = c.dept_no
--                 AND a.emp_no = b.emp_no
--                 AND d.emp_no = b.emp_no
--                 AND b.to_Date = '9999-01-01'
--                 AND d.to_date = '9999-01-01'
--         GROUP BY c.dept_name);

-- 문제 2
 SELECT 
    c.emp_no,
    CONCAT(c.first_name, ' ', c.last_name),
    a.dept_name,
    a.최대연봉
FROM
    (SELECT 
        c.dept_name, MAX(d.salary) '최대연봉'
    FROM
        departments c, salaries d, dept_emp b, employees a
    WHERE
        b.dept_no = c.dept_no
            AND a.emp_no = b.emp_no
            AND d.emp_no = b.emp_no
            AND b.to_Date = '9999-01-01'
            AND d.to_date = '9999-01-01'
    GROUP BY c.dept_name) a,
    salaries b,
    employees c
WHERE
    a.최대연봉 = b.salary
        AND b.emp_no = c.emp_no
        AND b.to_date = '9999-01-01'
ORDER BY a.최대연봉 DESC;
    
-- 문제 3
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name), e.dept_name, b.salary
FROM
    dept_emp c,
	salaries b,
	employees a,
    departments e,
    (SELECT 
        a.dept_no, ROUND(AVG(b.salary)) '평균연봉'
    FROM
        departments a, salaries b, employees c, dept_emp d
    WHERE
        a.dept_no = d.dept_no
            AND d.emp_no = c.emp_no
            AND c.emp_no = b.emp_no
            AND b.to_date = '9999-01-01'
            AND d.to_date = '9999-01-01'
    GROUP BY a.dept_no) d
WHERE
		-- b.salary = d.평균연봉;
         c.dept_no = d.dept_no
         and a.emp_no = c.emp_no
         and a.emp_no = b.emp_no
         and e.dept_no = c.dept_no
         and b.to_date = '9999-01-01'
         and c.to_date = '9999-01-01'
         and b.salary > d.평균연봉 limit 0, 400000;
         
-- 문제 4
SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name)
FROM
    employees a,
    dept_manager b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01';
        
-- 문제 5
SELECT 
    b.emp_no,
    CONCAT(b.first_name, ' ', b.last_name),
    c.title,
    a.salary
FROM
    salaries a,
    employees b,
    titles c,
    dept_emp d
WHERE
    a.emp_no = b.emp_no
        AND b.emp_no = c.emp_no
        AND b.emp_no = d.emp_no
        AND a.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND d.dept_no = (SELECT 
            부서번호
        FROM
            (SELECT 
                부서번호, MAX(평균)
            FROM
                (SELECT 
                b.dept_no '부서번호', AVG(salary) '평균'
            FROM
                salaries a, dept_emp b, departments c, employees d
            WHERE
                a.emp_no = b.emp_no
                    AND b.dept_no = c.dept_no
                    AND a.emp_no = d.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY b.dept_no
            ORDER BY 평균 DESC) a) b)
ORDER BY a.salary DESC
LIMIT 0 , 400000;
            
-- 문제 6
SELECT 
    dept_name
FROM
    (SELECT 
        부서번호
    FROM
        (SELECT 
        부서번호, MAX(평균)
    FROM
        (SELECT 
                b.dept_no '부서번호', AVG(salary) '평균'
            FROM
                salaries a, dept_emp b, departments c, employees d
            WHERE
                a.emp_no = b.emp_no
                    AND b.dept_no = c.dept_no
                    AND a.emp_no = d.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY b.dept_no
            ORDER BY 평균 DESC) a) b) c,
    departments d
WHERE
    c.부서번호 = d.dept_no;
    
-- 문제 7
SELECT 
    a.직책
FROM
    (SELECT 
        b.title '직책', AVG(a.salary) '평균연봉'
    FROM
        salaries a, titles b, employees c
    WHERE
        a.emp_no = b.emp_no
            AND b.emp_no = c.emp_no
            AND a.to_date = '9999-01-01'
            AND b.to_date = '9999-01-01'
    GROUP BY b.title order by 평균연봉 desc) a limit 0, 1;
    
-- 문제 8
SELECT 
    *
FROM
    dept_manager a,
    employees b,
    salaries c
WHERE
    a.emp_no = b.emp_no
        AND b.emp_no = c.emp_no;
        
SELECT 
    *
FROM
    dept_manager a,
    salaries b,
    dept_emp c
WHERE
    a.dept_no = c.dept_no
        AND b.emp_no = c.emp_no;

