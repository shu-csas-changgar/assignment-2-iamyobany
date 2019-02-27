/* Jeremy Suero
	CSAS 4115
    2/26/19 
*/
    
/* Question 1 */
alter table customer
add Total_Spent float;

update customer
set customer.Total_Spent = (select sum(payment.amount)
from payment
where payment.customer_id = customer.customer_id)
where customer_id > 0;

select customer_id, last_name, first_name, Total_Spent
from customer
order by last_name;

/* Question 2 */
select distinct district, city
from address
join city on city.city_id = address.city_id
and postal_code = "";

/* Question 3 */
select distinct title
from film
where title like "%FIRE%"
or title like "%DOCTOR%";

/* Question 4 */
alter table actor
add Number_Of_Movies int;

update actor
set actor.Number_of_Movies = (select count(film_actor.actor_id)
from film_actor
where film_actor.actor_id = actor.actor_id)
where actor_id > 0;

select distinct last_name, first_name, actor_id, Number_Of_Movies
from actor
order by last_name;

/* Question 5 */
alter table film_category
add Average_Time float;

update film_category
set film_category.Average_Time = (select avg(film.length)
from film
join film_category on film.film_id = film_category.film_id
where film.category_id = film_category.category_id)
where category_id >= 0;

select *
from film_category
order by Average_Time;

/* Question 6 */
alter table store
add Total_Profit float;

update store
set store.Total_Profit = (select sum(payment.amount)
from payment
join staff on staff.staff_id = payment.staff_id
where payment.staff_id = staff.staff_id)
where store_id >= 0;

select *
from store
order by Total_Profit;

/* Question 7 */
select first_name, last_name, email, Total_Spent
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on country.country_id = city.city_id
where country.country = "Canada"
order by last_name;

/* Question 8 */
select customer_id
from customer
where first_name = "MATHEW"
and last_name = "BOLIN";

select film_id
from film
where title = "HUNGER ROOF";

select inventory_id
from inventory
where film_id = 440;

select staff_id
from staff
where first_name = "JON"
and last_name = "STEPHENS";

insert into rental(rental_date, inventory_id, customer_id, staff_id)
values(now(), 2026, 539, 2);

select rental_id
from rental
where customer_id = 539
and staff_id = 2
and inventory_id = 2026;

insert into payment(customer_id, staff_id, rental_id, amount, payment_date, last_update)
values(539, 2, 16050, 2.99, now(), now());

/* Question 9 */
select customer_id 
from customer
where first_name = "TRACY"
and last_name = "COLE";

select film_id
from film
where title = "ALI FOREVER";

select inventory_id
from inventory
where film_id = 13;

select rental_id
from rental
where inventory_id  = 70
and customer_id = 108;

update rental
set return_date = now(),
	last_update = now()
where rental_id = 15294;

/* Question 10 */
select language_id
from language
where language.name = "Japanese";

update film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
set film.original_language_id = 3
where category.name = "Animation";