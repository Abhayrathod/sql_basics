-- SELECT  * from sql_store.customers
-- SELECT 1,2 from customers
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
-- WHERE points BETWEEN 2000 AND 3000

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b%'
-- WHERE last_name LIKE '%d'
-- WHERE last_name LIKE '%b%'
-- WHERE last_name LIKE '_____y'

-- SELECT *
-- FROM customers
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

-- Inner Joins --used to joins tables from the same databases
-- select order_id, o.customer_id, first_name, last_name from sql_store.orders o
-- join customers c on o.customer_id = c.customer_id

-- select * from sql_store.order_items oi
-- join products p on oi.product_id = p.product_id

-- outer joins -- join tables from two databases
-- select * from order_items oi
-- join sql_inventory.products si_p on oi.product_id =  si_p.product_id

-- self joins -- joining columns from same table \
-- use sql_hr;
-- select e.employee_id, e.first_name, m.first_name as manager from employees e 
-- join employees m on e.reports_to = m.employee_id

-- joining multiple tables 
-- use sql_store;
-- select o.order_id, o.order_date, c.first_name, c.last_name, os.name as status from orders o
-- join customers c on o.customer_id = c.customer_id
-- join order_statuses os on o.status = os.order_status_id

-- use sql_invoicing;
-- select p.date, p.invoice_id, p.amount, c.name, pm.name from payments p 
-- join payment_methods pm on p.payment_method = pm.payment_method_id
-- join clients c on p.client_id = c.client_id 

-- compound join 
-- use sql_store;
-- select * from order_items oi
-- join order_item_notes oin 
-- 	on oi.order_id = oin.order_id
--      and oi.product_id = oin.product_id

-- implicit join -- basically it is using where clause instead of join syntax
-- use sql_store;
-- select * from orders o
-- join customers c on o.customer_id = c.customer_id

--  now writing above statement but using where clause, this is IMPLICIT JOIN CONDITIONS
-- use sql_store;
-- select * from orders o , customers c
-- where o.customer_id = c.customer_id

-- Outer join -- it have two sub joins -- left join and right join
-- join use krne par vahi rows aati hai jo match hoti hai join ki "on" conditions se , islie right ya lft join use 
-- karte hai kyuki use left ya right ka data pura show karta hai 

-- use sql_store;
-- select c.customer_id, c.first_name, o.order_id
-- from orders o
-- left join customers c 
-- on c.customer_id = o.customer_id
-- order by c.customer_id 

-- use sql_store;
-- select c.customer_id, c.first_name, o.order_id
-- from orders o
-- right join customers c 
-- on c.customer_id = o.customer_id
-- order by c.customer_id 

-- use sql_store;
-- select p.product_id, p.name, oi.quantity
-- from products p 
-- left join order_items oi
-- on p.product_id = oi.product_id

-- outer joins between multiple tables
-- select c.customer_id, c.first_name, o.order_id, sh.name as shipper_name
-- from customers c
-- left join  orders o
-- 	on c.customer_id = o.customer_id
-- left join shippers sh
-- 	on o.shipper_id = sh.shipper_id
-- order by c.customer_id 


-- outer joins between multiple tables 
-- use sql_store;
-- select 
-- 	o.order_id,
-- 	o.order_date,
--     c.first_name as customer,
--     sh.name as shipper,
--     os.name as status
-- from orders o 
-- join customers c
-- 	on o.customer_id = c.customer_id
-- left join shippers sh
-- 	on o.shipper_id= sh.shipper_id
-- join order_statuses os
-- 	on o.status = os.order_status_id

-- self joins
-- use sql_hr;
-- select 
-- 	e.employee_id,
--     e.first_name,
--     m.first_name as manager
-- from employees e
-- left join employees m
-- 	on e.reports_to = m.employee_id

-- using clause in sql
-- use sql_store;
-- select
-- o.order_id,
--     c.first_name,
--     sh.name as shippers
-- from orders o
-- join customers c 
-- 	-- on o.customer_id = c.customer_id
--     using (customer_id)
-- left join shippers sh
-- 	using(shipper_id)

-- using clause to join two tables - i am talking about that tables which has two primary key
-- use sql_store;
-- select *
-- from order_items oi
-- join order_item_notes oin
-- 	on oi.order_id = oin.order_id and
-- 		oi.product_id = oin.product_id
-- 	using (order_id,product_id)

-- use sql_invoicing;
-- select 
-- 	p.date,
--     c.name as client,
--     p.amount,
--     pm.name as payment_method
-- from payments p
-- join clients c using (client_id)
-- join payment_methods pm
-- 	on p.payment_method = pm.payment_method_id

-- natural joins
-- use sql_store;
-- select
-- 	o.order_id,
--     c.first_name
-- from orders o
-- natural join customers c

-- cross joins --every record of customer table will be joined with products table
-- explicit syntax of cross join
-- use sql_store;
-- select 
-- 	c.first_name as customer,
--     p.name as product
-- from customers c
-- cross join products p
-- order by c.first_name

-- implicit syntax of cross join
-- use sql_store;
-- select 
-- 	c.first_name as customer
-- from customers c, orders o

-- use sql_store;
-- select
-- 	sh.name as shipper,
--     p.name as product
-- from shippers sh, products p
-- order by sh.name

-- use sql_store;
-- select
-- 	sh.name as shipper,
--     p.name as product
-- from shippers sh
-- cross join products p
-- order by sh.name