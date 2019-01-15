-- Basic Query 연습

-- load data
load data local infile 'c:\\pet.txt' into table pet;

select * from pet;

-- sql select 
select c1, c2 from t where 어쩌구;
select * from pet;
select * from pet where name = 'Bowser';
select * from pet where birth > '1998-01-01';
select * from pet where species = 'dog' and gender = 'f';
select * from pet where species = 'snake' or species = 'bird';
select name, birth from pet;
select name, gender, birth from pet order by gender asc, birth desc;

-- null 다루기
select * from pet where gender is not null;

-- LIKE 검색
select * from pet where name like 'b____';
select * from pet where name like '%fy';
select * from pet where name like '%w%';
select * from pet where length(name) = 5;

select count(*) "총 애완동물 수" from pet; -- 집계함수 옆에 다른 속성은 와선안된다 group by 외에는
-- 집계를하는데 뭐뭐(직원, 업무) 별로 집계 group by 

select owner, count(*) from pet where death in (not null, '0000-00-00') group by owner HAVING count(*) > 1; -- group by의 속성도 올수있다
-- 속성에다 쓴 count(*)은 단순한 이름일뿐이다 계산같은것은 하지않는다 
-- select 속성에 집계함수가 있다면 참여할수있는 속성이 제한된다

