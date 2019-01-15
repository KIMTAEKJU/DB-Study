
select curdate(), current_date; -- 현재 날짜

select curtime(), current_time; -- 현재 시간

select now(), sysdate(); -- 현재 날짜 + 현재 시간

select emp_no, now() from employees; -- 처음 시작할때의 시간과 다 똑같음

select emp_no, sysdate() from employees limit 0, 300000; -- 그때그때 호출할때마다 다름

-- 포맷팅  화면에 나올수있도록 가져감 sns는 데이터를 주고 클라이언트가 처리 그외는 포맷팅해서 전달이지만 유두리있게 

select first_name, date_format(hire_date, '%Y-%m-%d %h:%i:%s') from employees;

-- 각 직원들에 대해 직원의 이름과 근무개월수
select first_name, concat(
					cast(
						period_diff(
							date_format(curdate(), '%Y%m'), 
							date_format(hire_date, '%Y%m')
									)
				as char), '개월'
                        ) 
                        from employees;
                        
-- 각 사원들 입사 후 6개월 뒤에 정규직으로 발령이 된다.
select from_date from salaries;
select date_format(from_date + 600, '%Y%m%d') from salaries;
select period_diff(date_format(from_date, '%Y%m%d'), date_format(from_date + 600, '%Y%m%d')) from salaries;
-- 발령날은 언제?

select first_name, hire_date, date_add(hire_date, interval 6 month) from employees;

SELECT 
    DATE_ADD(
    cast('1994-05-30' as DATE),
        INTERVAL 8996 DAY);
        
SELECT emp_no, avg(salary), sum(salary) from salaries where emp_no = 10060;
SELECT avg(salary), sum(salary) from salaries group by emp_no;

select salary, from_date from salaries where emp_no = 10060;
select * from(select max(salary) 'max_salary', min(salary) 'min_salary' from salaries where emp_no = 10060) a;

SELECT 
    emp_no, count(*)
FROM
    titles
group by
	emp_no;
    
select emp_no, avg(salary) from salaries group by emp_no having avg(salary) > 10000;