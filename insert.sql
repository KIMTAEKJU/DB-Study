show databases;
use webdb;

desc employee;
select * from employee;s

insert into employee values (null, 'test', null);
insert into employee(name, no, department_no) values ('test2', null, null);
insert into employee(name) values ('test3');


