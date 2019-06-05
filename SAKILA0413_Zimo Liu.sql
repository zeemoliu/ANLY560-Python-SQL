
# Basic select all columns
SELECT * FROM customer;

# basic select for some columns
SELECT first_name, last_name, email 
FROM customer;

# sorting
SELECT first_name, last_name, email FROM customer ORDER BY last_name, first_name;

# select with filter
SELECT first_name, last_name, email FROM customer WHERE first_name = 'FRED';
SELECT first_name, last_name, email FROM customer WHERE email > 'w';
SELECT first_name, last_name, email FROM customer WHERE email < 'w';
SELECT first_name, last_name, email FROM customer WHERE email > 'w'ORDER BY email;

# selecting with filter in and not
SELECT * FROM film;
SELECT * FROM film WHERE rating IN ('G', 'NC-17');
SELECT * FROM film WHERE NOT rating IN ('G', 'NC-17');
SELECT * FROM film WHERE release_year = '2006';
SELECT title, rating FROM film WHERE rating = 'PG';
#
SELECT title FROM film;
SELECT lower(title), title FROM film;

# Aggregation
SELECT rental_rate, replacement_cost FROM film;
SELECT count(title) FROM film;
SELECT count(*) FROM film;
SELECT AVG(rental_rate) FROM film;
SELECT AVG(replacement_cost) FROM film;
SELECT AVG(rental_rate), AVG(replacement_cost) FROM film;
SELECT (replacement_cost - rental_rate) AS difference FROM film;
SELECT AVG(replacement_cost - rental_rate) AS avg_difference FROM film;

# grouping
SELECT rating FROM film;
SELECT rating, title FROM film;
SELECT DISTINCT rating FROM film;
SELECT DISTINCT rating FROM film ORDER BY rating;
SELECT rating, COUNT(*) FROM film GROUP BY rating;
#filter prior to grouping
SELECT rating, COUNT(*) 
from film where rating in ('G','PG','PG-13')
group by rating;

# filter after grouping
select rating, count(*)
from film
group by rating
having count(*) > 200;
#
select customer.last_name as customer_lastName, staff.last_name as manager_lastName, store.store_id
from customer, store, staff
where customer.store_id = store.store_id
and store.manager_staff_id = staff.staff_id
and customer.active and staff.active
order by customer.last_name;

# shorthand
select c.last_name, st.last_name, s.store_id
from customer c, store s, staff st
where c.store_id = s.store_id
and s.manager_staff_id = st.staff_id
and c.active and st.active
order by c.last_name;