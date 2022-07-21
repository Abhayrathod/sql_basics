USE sql_store;

-- SELECT  *
-- SELECT 1,2
-- SELECT first_name, last_name, last_name, points * 20 + 100
-- SELECT 
-- 	first_name, 
-- 	last_name, 
-- 	last_name, 
-- 	points * 20 + 100,
--     (points + 20) * 100 AS discount_factor,
--     (points + 20) * 100 AS 'discount factor'

-- SELECT DISTINCT--  state -- DISTINCT word removes duplicates like va in this case
-- FROM customers
-- WHERE customer_id = 1
-- ORDER BY last_name

-- SELECT * 
-- FROM customers
-- where state = 'VA'
-- where state <> 'va'
-- where birth_date > '1990-01-01' AND points > 1000
-- where birth_date > '1990-01-01' or points > 1000 and state = 'va'
-- > >= < <= = != <> these are comparison operators
-- AND operator has higher precedence 'than' OR operator
-- where NOT (birth_date > '1990-01-01' or points > 1000 )

-- SELECT * 
-- FROM customers
-- WHERE state = 'va' OR state = 'ga' OR state = 'fl'
-- WHERE state = 'va' OR 'FL' OR 'GA' -- this is wrong because you cannot combine boolean value with a string
-- WHERE state NOT IN ('va', 'fl', 'ga')
-- WHERE state IN ('va', 'fl', 'ga')

-- SELECT * 
-- FROM customers
-- WHERE points BETWEEN 1000 AND 3000

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b%'
-- WHERE last_name LIKE '%d'
-- WHERE last_name LIKE '%b%'
-- WHERE last_name LIKE '_____y'

SELECT *
FROM customers
-- WHERE last_name REGEXP 'field'
-- WHERE last_name REGEXP '^field' -- this sign represent beginning of the string
-- WHERE last_name REGEXP 'field%' -- this sign represent the ending of the string
-- WHERE last_name REGEXP 'field|mac'
-- WHERE last_name REGEXP 'field|mac|rose'
-- WHERE last_name REGEXP '^field|mac|rose'
-- WHERE last_name REGEXP 'field%|mac|rose'
-- WHERE last_name REGEXP '[gim]e' --  brackets alphabets should come before "e" 
-- WHERE last_name REGEXP 'e[m]'
-- WHERE last_name REGEXP '^[a-h]e'
