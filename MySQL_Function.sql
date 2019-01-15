-- MySQL 문자열 함수
select ucase('Seoul'), upper('seoul');
select lcase('Seoul'), lower('SEOUL');

select substring('Happy Day',3, 2) from dual; -- 1부터 시작

select first_name, gender, hire_date from employees where substring(hire_date, 1, 4) = '1989';

select LPAD('hi', 10, '*') from dual;
select RPAD('hi', 10, '*') from dual;

select emp_no, LPAD(cast(salary as char), 10, '*') from salaries;

select concat('---', ltrim('   hello    ')),  concat('---', rtrim('  hello   ')), concat('---', trim('  hello    ')) from dual;

select trim(both 'x' from 'xxxhixxx'), trim(leading 'x' from 'xxxhixxx'), trim(trailing 'x' from 'xxxhixxx') from dual; 