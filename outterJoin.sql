desc employee;
desc department;

insert into department values (null, '총무팀');

insert into department values (null, '개발팀');

insert into department values (null, '인사팀');

insert into department values (null, '영업팀');

select * from department;

desc employee;

insert into employee values (null, '둘리', 1);

insert into employee values (null, '마이콜', 2);

insert into employee values (null, '또치', 3);

insert into employee values (null, '길동', 4);

insert into employee values (null, '고길동', null);

delete from employee where name like '길동%';
select * from employee;


select * from employee, department;

select * from employee a, department b where a.department_no = b.no;


-- outter join
SELECT 
    *
FROM
    employee a
	JOIN
    department b on a.department_no = b.no;
    

-- left outer join
SELECT 
    a.name, ifnull(b.name, '없음')
FROM
    employee a
       left outer JOIN
    department b on a.department_no = b.no; -- 왼쪽기준이니까 왼쪽꺼가 다나옴
    
-- right outer join
SELECT 
    *
FROM
    employee a
       right outer JOIN
    department b on a.department_no = b.no; -- 오른쪽기준이니까 오른쪽꺼가 다나옴
    
-- full outer join	mysql 지원안함
SELECT 
    *
FROM
    employee a
		full outer JOIN
    department b on a.department_no = b.no; -- 왼쪽기준이니까 왼쪽꺼가 다나옴
    
    
    