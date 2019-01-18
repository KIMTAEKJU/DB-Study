drop table member;

CREATE TABLE user (
    no INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(64) NOT NULL,
    name VARCHAR(20),
    juminbunho CHAR(13) NOT NULL,
    join_date DATETIME NOT NULL,
    dept_no int unsigned,
    
    PRIMARY KEY (no),
    -- foreign key (dept_no) references dept(no) on delete restrict -- 에러발생  or set null, cascade
    -- foreign key (dept_no) references dept(no) on delete set null
    foreign key (dept_no) references dept(no) on delete cascade
);

desc user;

-- 컬럼 추가

alter table member add column juminbunho 
	char(13) not null;
    
alter table member drop column juminbunho;

alter table member add column juminbunho char(13) not null first;

alter table member drop column juminbunho;

alter table member add column juminbunho char(13) not null after name;

alter table member add column join_date datetime not null;

alter table member change no no int unsigned not null auto_increment; -- 이름만 바꿔도 외의 속성도 다바꿔야함

alter table member change department_name dept_name varchar(20) not null default 'none';


alter table member rename user;
desc user;

-- foreign key constraint(제약 조건 :  데이터의 생성, 삭제, 수정에 제약을 준다)\
CREATE TABLE dept (
    no INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (no)
);

desc dept;

drop table user;

insert into dept(name) values('개발팀');
select * from dept;

insert into user values(null, 'a@a.com', password('1234'), '둘리', '', now(), 4);

select * from user;

delete from user where no = 1;
delete from dept where no = 3; -- restrict 참조키를 지우려할때 안에내용이있으면 에러발생