-- JOIN 연습문제
-- sakila 데이터베이스에서 조회하세요.
USE sakila;

-- 문제 1: 고객(customer)의 이름과 그들이 대여(rental)한 영화(film)의 제목을 조회하세요.
SELECT c.first_name, c.last_name, f.title
from customer c
join rental r on c.customer_id = r.customer_id
JOIN inventory i on r.inventory_id = i.inventory_id
JOIN film f on i.film_id = f.film_id;

-- using 사용하기
SELECT c.first_name, c.last_name, f.title
from customer c
join rental r using(customer_id)
JOIN inventory i using(inventory_id)
JOIN film f using(film_id);

-- 문제 2: 각 영화(film)의 제목과 해당 영화가 속한 카테고리(category)의 이름을 조회하세요.
SELECT f.title, c.name
from film f
JOIN film_category fc on f.film_id = fc.film_id
JOIN category c on fc.category_id = c.category_id;

-- 문제 3: 각 영화(film)에 대해 몇 명의 배우(actor)가 출연했는지, 영화 제목과 함께 조회하세요.
-- using 키워드 사용가능 
SELECT f.title as "영화 제목", count(a.actor_id) as "배우 수"
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on a.actor_id = fa.actor_id
GROUP BY f.film_id;		-- 중복된 값이 있을 수 있으므로 그룹화의 기준은 고유키로 하는 것이 안전함 

-- 문제 4: 모든 대여(rental) 정보에 대해, 해당 대여가 이루어진 스토어(store)의 ID와 직원(staff)의 이름을 조회하세요.
select r.*, s.store_id, sf.first_name, sf.last_name
from rental r
join staff sf on sf.staff_id = r.staff_id
join store s on s.store_id = sf.store_id;

-- 문제 5: 가장 많이 대여된 영화 5개의 제목과 대여 횟수를 조회하세요.
select f.title "영화 제목", count(r.rental_id) as "대여 횟수"
from film f
join inventory i on f.film_id = i.film_id
JOIN rental r on i.inventory_id = r.inventory_id
GROUP BY f.film_id		-- 같은 영화 제목에 대한 예방
ORDER BY count(r.rental_id) desc
LIMIT 5;

-- 문제 6: 각 고객(customer)별로 그들이 지불한 총 금액(payment)을 조회하세요.
select c.first_name, c.last_name, sum(p.amount)
from customer c
join payment p on c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- 문제 7: 각 카테고리(category)별로 대여된 영화의 총 수를 조회하세요.
select c.name, count(r.rental_id)
from category c
join film_category fc on c.category_id = fc.category_id
join inventory i on fc.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
GROUP BY c.name;

-- 문제 8: 2005년 7월에 대여된 모든 영화의 제목과 대여 날짜를 조회하세요.
select f.title, r.rental_date
from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
HAVING r.rental_date BETWEEN "2005-07-01" and "2005-07-31";

-- 문제 9: 'Comedy' 카테고리에 속하는 영화들의 평균 대여 기간(rental_duration)을 조회하세요.
select f.title, avg(f.rental_duration)
from film f
join film_category fc on f.film_id = fc.film_id
JOIN category c on c.category_id = fc.category_id
WHERE c.name = "Comedy"
GROUP BY f.title;

-- 문제 10: 모든 배우(actor)의 이름과 그들이 출연한 영화(film)의 수를 조회하세요. (LEFT JOIN 사용)
select a.first_name, a.last_name, count(f.film_id)
from film f
left join film_actor fa on f.film_id = fa.film_id
left JOIN actor a on a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name;