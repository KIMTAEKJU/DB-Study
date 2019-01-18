use webdb;
desc employee;

update employee set name = '도우넛', department_no = 1 where no = 5; 
select * from employee;

delete from employee where name = 'test2';

