-- SELECT all records from the actor table
SELECT * 
FROM actor;

-- Query for firs_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE CLAUSE
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for all first_name data that starts with a N using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a j using the LIKE and Where clauses
-- and the wildcard %
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that sgtarts with a K and has 2 letters following
-- LIKE and WHERE
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard and underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparing operators:
-- Greater than <
-- Less than >
-- Greater or equal <=
-- Less or equal >=
-- Not Equal <>

-- Explore Data with SELECT * QUERY
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount GREATER than $5
SELECT customer_id, amount
FROM payment
WHERE amount > 5.00;

-- Query for data that shows customer's who paid an amount 
-- less than $7
SELECT customer_id, amount
FROM payment
WHERE amount < 7.00;

-- Query for data that shows customer's who paid an amount 
-- less than or equal to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customer's who paid an amount 
-- greater than or equal to $7.99
-- ORDER in ascending order asc for ascending dsc for desending
SELECT customer_id, amount
FROM payment
WHERE amount >= 7.99
ORDER BY amount ASC; 

-- Query for data that shows customer's who paid an amount 
-- between $2 and 7.99
-- using BETWEEN with the AND clause
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customer's who paid an amount 
-- NOT EQUAL to 0.00
-- order in descending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations --> SUM(), AVG(), COUNT(), MIN(), MAX()
-- Query to dispaly sum of amounts paid that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to dispaly avg of amounts paid that are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to dispaly count of amounts paid that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

--DISTINCT -- returns uniqu values
-- Query to display the count of DISTINCT amounts paid greater than 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the min amount greater than $7.99
-- MIN(amount) will come back as min_num_payments- we can assign our own name  
SELECT MIN(amount) AS min_num_payment
FROM payment
WHERE amount > 7.99;

-- Query to display the max amount greater than $7.99
SELECT MAX(amount) AS max_num_payment
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts
SELECT amount 
FROM payment
WHERE amount = 7.99; 

-- Query to display different amounts grouped together & count those amounts 
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount 
ORDER BY amount ASC;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
ORDER BY customer_id DESC; 

SELECT customer_id, amount 
FROM payment 
WHERE customer_id = 5.99;

-- Query to display customer_ids with the summed amouts for eachcustomer_id 
-- Separate example and a different way to use GROUP BY 
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC; 

-- Query to explore the data inside for the customer table
SELECT * 
FROM customer; 

-- Query to display customer_id that show up more than 0 times and WHERE the email starts with a j and ends with a %
-- GROUP by email 
SELECT COUNT(customer_id), email
FROM customer 
WHERE email LIKE 'j____.w%'
GROUP BY email 
HAVING COUNT(customer_id) > 0;

-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(customer_id)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)\
SELECT MAX(DISTINCT title)
FROM film;


-- 4. How many customers have the last name 'William'
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'Williams';

-- 5. What store employee (get the id) sold the most rentals?
SELECT MAX(staff_id)
FROM rental;

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id AS film, COUNT(film_actor)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name) store_id
FROM customer
WHERE last_name LIKE '%es' and store_id <> 2
GROUP BY store_id;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(customer_id), amount
FROM payment
WHERE customer_id > 380 and customer_id < 430
GROUP BY amount, customer_id
HAVING COUNT(customer_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT COUNT(DISTINCT rating) AS number_of_ratings, MAX(rating) AS rating_with_max
FROM film