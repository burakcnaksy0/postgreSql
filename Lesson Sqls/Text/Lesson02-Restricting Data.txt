--------------------------------------------
--Comparison Operators
--------------------------------------------

SELECT * FROM actor
WHERE first_name = 'Penelope';

SELECT * FROM customer
WHERE store_id = 1;

SELECT * FROM payment
WHERE staff_id <> 2;

SELECT * FROM film
WHERE length >= 100;

--------------------------------------------
--Logical Operators
--------------------------------------------

SELECT * FROM film
WHERE length > 100
      AND rental_duration < 5; 

SELECT * FROM address
WHERE district = 'Adana'
       AND city_id = 5;

SELECT * FROM payment
WHERE staff_id = 2
      OR amount > 5;

SELECT * FROM employees
WHERE department_id = 1
      OR salary < 3000

SELECT * FROM employees
WHERE job_id = 9
       AND salary > 5000;

--------------------------------------------
--BETWEEN Operator
--------------------------------------------

SELECT * FROM film
WHERE length BETWEEN 100 AND 120;

SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

SELECT * FROM employees
WHERE hire_date BETWEEN '2017-01-01' and '2017-12-31'
ORDER BY hire_date;

SELECT * FROM employees
WHERE first_name BETWEEN 'A' and 'E'
ORDER BY first_name;

--------------------------------------------
--IN Operator
--------------------------------------------

SELECT first_name, last_name
FROM customer
WHERE first_name IN ('Leslie', 'Kelly', 'Tracy');

SELECT *
FROM film
WHERE rating IN ('R', 'G')

SELECT * 
FROM address
WHERE district IN ('Texas', 'Nantou', 'Moskova');

SELECT * FROM customer
WHERE address_id IN (10, 20, 30);

SELECT * FROM customer
WHERE address_id = 10
	OR address_id = 20
	OR address_id = 30

--------------------------------------------
--LIKE Operator
--------------------------------------------

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'Ann%';

SELECT *
FROM customer
WHERE first_name LIKE 'B%';

SELECT * FROM film
WHERE title LIKE '%r';

SELECT * FROM film
WHERE title LIKE '%u_';

SELECT * FROM film
WHERE title LIKE '%s%';

SELECT * FROM film
WHERE title LIKE '%a%v%';

--------------------------------------------
--ILIKE Operator
--------------------------------------------

SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'CAR%';

--------------------------------------------
--NOT Operator
--------------------------------------------

SELECT * FROM employees
WHERE manager_id NOT IN (100, 108, 114)

SELECT * FROM employees
WHERE first_name NOT LIKE 'A%'

--------------------------------------------
--IS NULL Operator
--------------------------------------------

SELECT * FROM employees
WHERE phone_number IS NULL;

SELECT * FROM employees
WHERE phone_number IS NOT NULL;

--------------------------------------------
--LIMIT Clause
--------------------------------------------

SELECT * FROM actor
ORDER BY first_name, last_name
LIMIT 5;

SELECT film_id, title
FROM film
ORDER BY film_id
LIMIT 8 OFFSET 4;

--------------------------------------------
--FETCH Clause
--------------------------------------------

SELECT film_id, title
FROM film
ORDER BY title 
FETCH FIRST ROW ONLY;

SELECT film_id, title
FROM film
ORDER BY title 
FETCH FIRST 1 ROW ONLY;

SELECT film_id, title
FROM film
ORDER BY title
OFFSET 5 ROWS
FETCH FIRST 6 ROW ONLY;

SELECT film_id, title
FROM film
ORDER BY title
LIMIT 6 OFFSET 5;

-----------------------------------------------------
--EXERCISE ANSWERS
-----------------------------------------------------

--------------------------------------------
--Between Operator
--------------------------------------------

SELECT * FROM staff 
WHERE '2022-05-01' BETWEEN hire_date AND departure_date

--------------------------------------------
--LIKE Operator
--------------------------------------------

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%';

--------------------------------------------
--NOT Operator
--------------------------------------------

SELECT first_name, last_name, salary, job_id 
FROM employees
WHERE
    NOT salary BETWEEN 4000 and 7000 
    AND NOT job_id = 16

