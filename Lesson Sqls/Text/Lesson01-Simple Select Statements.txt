--------------------------------------------
--Selecting All Columns
--------------------------------------------

SELECT * FROM customer;

--------------------------------------------
--Selecting Specific Columns
--------------------------------------------

SELECT customer_id, first_name, last_name
FROM customer;

SELECT title, release_year, length
FROM film;

--------------------------------------------
--Arithmetic Expressions
--------------------------------------------
SELECT 8 * 5 + 4,
      120 / 4, 
      current_date - 2;

SELECT title, 
    length / 60,
    2021 - release_year
FROM film;

--------------------------------------------
--Concatenation Operator 
--------------------------------------------

SELECT country_id || ': ' || country 
FROM country;

SELECT customer_id || ': ' || first_name || ' ' || last_name
FROM customer;

--------------------------------------------
--Escape Character - E
--------------------------------------------

SELECT 'Computer Engineer';

SELECT 'I''m a Computer Engineer';

SELECT E'I\'m a computer engineer';

SELECT customer_id || E'\'s: ' 
  || first_name || ' ' 
  || last_name
FROM customer;

--------------------------------------------
--Escape Character - $$
--------------------------------------------

SELECT $$'I'm a Computer Engineer'$$;

SELECT $msg$'I'm a string constant that contains a backslash \'$msg$;

--------------------------------------------
--Column Aliases
--------------------------------------------

SELECT first_name || ' ' || last_name as full_name
FROM customer;

SELECT title, 
    length as length_minute,
    round(length::decimal / 60, 2) as length_hour,
    (2021 - release_year) pass_year
FROM film;

--------------------------------------------
--Order By – Single Column
--------------------------------------------

SELECT * FROM film
ORDER BY title

SELECT district, address, city_id
FROM address
ORDER BY district

SELECT first_name, last_name, email, address_id 
FROM customer
ORDER BY first_name DESC

--------------------------------------------
--Order By – Multiple Column
--------------------------------------------

SELECT rating, length, title, rental_rate
FROM film
ORDER BY rating, length DESC;

SELECT first_name, last_name, 
       email, address_id 
FROM customer
ORDER BY first_name, last_name

--------------------------------------------
--Order By – Column Order
--------------------------------------------

SELECT * 
FROM customer
ORDER BY 6

SELECT first_name, last_name, 
       email, hire_date, 
       job_id, salary 
FROM employees
ORDER BY 5, 6 DESC

--------------------------------------------
--Order By – Nulls First, Last
--------------------------------------------

SELECT * FROM employees
ORDER BY phone_number NULLS LAST

SELECT * FROM employees
ORDER BY phone_number NULLS FIRST

--------------------------------------------
--Duplicate Rows - DISTINCT
--------------------------------------------

SELECT DISTINCT special_features
FROM film

--------------------------------------------
--Duplicate Rows – DISTINCT ON
--------------------------------------------

SELECT DISTINCT bcolor, fcolor
FROM distinct_demo
ORDER BY bcolor, fcolor;

SELECT DISTINCT ON (bcolor) bcolor,	 fcolor
FROM distinct_demo
ORDER BY bcolor, fcolor;

SELECT DISTINCT ON (film_id) film_id, store_id 
FROM inventory
ORDER BY film_id, store_id;

-----------------------------------------------------
--EXERCISE ANSWERS
-----------------------------------------------------

--------------------------------------------
--Simple Query
--------------------------------------------

SELECT first_name ||'.'|| last_name ||'@dbhunter.com',
    salary * 1.35
FROM employees;

--------------------------------------------
--DISTINCT
--------------------------------------------

SELECT DISTINCT rating
FROM film
ORDER BY 1 DESC
