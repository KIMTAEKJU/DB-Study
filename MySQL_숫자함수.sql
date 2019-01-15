
select abs(10), abs(-10);

select mod(234, 10), 254 % 10;

select floor(1.23), floor(-1.23);

select ceil(3.14), ceiling(3.14), ceil(-3.14), ceiling(-3.14);

select round(-1.23), round(-1.58), round(1.58), round(1.23); --

select round(1.298, 1), round(1.298, 0); -- 반올림 자릿수

select pow(2, 2), power(2, -2); -- 제곱 마이너스제곱

select sign(-10), sign(0), sign(100); -- 	음수 -1  0은 0 양수 1

select greatest(5, 4, 3, 2, 1), greatest(3.14, 4.26, 5.8), greatest("ABCD", "ABCF", "AZ"); -- 가장 큰값

select least(5, 4, 3, 2, 1), greatest(3.14, 4.26, 5.8), greatest("ABCD", "ABCF", "AZ"); -- 가장 큰값