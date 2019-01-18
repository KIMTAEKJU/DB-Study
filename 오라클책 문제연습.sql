desc book;

select bookname, price from book;
select * from book;
select distinct publisher from book;
select * from book where price <= 20000;
select * from book where price >= 10000 and price <= 20000;
select * from book where publisher in ("굿스포츠", "대한미디어");
select publisher from book where bookname like "축구의 역사";
select publisher from book where bookname like '%축구%';
select * from book where bookname like '_구%';
select * from book where bookname like ('축구%') and price >= 20000;
select * from book where publisher in ('굿스포츠', '대한미디어');
select * from book order by bookname;
select * from book order by price, bookname;
select * from book order by price desc, publisher asc;
select sum(saleprice) as "총 매출" from orders;
select * from orders;
select sum(saleprice) from orders where custid = 2; 
select sum(saleprice) aa, avg(saleprice) bb, min(saleprice), max(saleprice) from orders;
select count(*) from orders;
select custid, count(*), sum(saleprice) from orders group by custid;
select custid, count(*) from orders where saleprice >= 8000 group by custid having count(*) >= 2;
select * from customer, orders where orders.custid = customer.custid order by customer.custid;
select * from orders;
select * from customer;

SELECT 
    name, saleprice
FROM
    customer,
    orders
WHERE
    orders.custid = customer.custid;
    
SELECT 
    name, SUM(saleprice)
FROM
    customer,
    orders
WHERE
    customer.custid = orders.custid
GROUP BY name;

SELECT 
    name, bookname
FROM
    orders,
    customer,
    book
WHERE
    customer.custid = orders.custid
        AND book.bookid = orders.bookid;
        
select name, bookname from customer, book, orders where customer.custid = orders.custid and orders.bookid = book.bookid and price = 20000;