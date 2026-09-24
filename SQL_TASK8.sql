USE SAFANA3;
CREATE TABLE customerss (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customerss (customer_id, customer_name, email, city)
VALUES
(101, 'kamran', 'kamran@gmail.com', 'mangalore'),
(102, 'romil', 'romil@gmail.com', 'bangalore'),
(103, 'baby', 'baby@gmail.com', 'vittal'),
(104, 'coco', 'coco@gmail.com', 'kerala'),
(105, 'asura', 'asura@gmail.com', 'mysore');

SELECT * FROM customerss;

CREATE TABLE transactionsss(
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);

INSERT INTO transactionsss
(transaction_id, customer_id, amount, transaction_date)
VALUES
(1, 101, 3000, '2026-04-01'),
(2, 102, 4000, '2026-04-01'),
(3, 101, 5000, '2026-04-01'),
(4, 103, 3500, '2026-04-01'),
(5, 104, 9800, '2026-04-01'),
(6, 102, 7000, '2026-04-01'),
(7, 103, 9000, '2026-04-01'),
(8, 104, 4000, '2026-04-01'),
(9, 105, 4000, '2026-04-01'),
(10,105, 5000, '2026-04-01'),
(11,101, 1300, '2026-04-01'),
(12,102, 6000, '2026-04-01');

SELECT * FROM transactionsss;


CREATE TABLE invoicess (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount DECIMAL(10,2),
    invoice_date DATE,
    due_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);

INSERT INTO invoicess
(invoice_id, customer_id, invoice_amount, invoice_date, due_date, payment_status)
VALUES
(301, 101, 4000, '2026-01-10', '2026-07-01', 'Unpaid'),
(302, 102, 3560, '2026-01-10', '2026-07-01', 'Unpaid'),
(303, 103, 1600, '2026-01-10', '2026-07-01', 'Unpaid'),
(304, 104, 7850, '2026-01-10', '2026-07-01', 'Paid'),
(305, 105, 6580, '2026-01-10', '2026-07-01', 'Paid');

SELECT * FROM invoicess;

select customer_name from customerss where customer_id IN(
select customer_id from invoicess where payment_status="Unpaid");

select customer_name from customerss where customer_id IN(
select customer_id from transactionsss where amount>4500);

select customer_name from customerss where customer_id IN(
select customer_id from transactionsss where amount =(
select max(amount) from transactionsss));

select customer_id from transactionsss where amount>(
select avg(amount) from transactionsss);

select customer_name from customerss 
where city='mangalore' and customer_id IN(
select customer_id from transactionsss);

SELECT c.customer_id, c.customer_name
FROM Customers c
WHERE  EXISTS (
    SELECT 1
    FROM invoicess i
    WHERE c.customer_id = i.customer_id
    AND i.payment_status = 'Paid'
);

SELECT c.customer_id, c.customer_name
FROM Customers c
WHERE  EXISTS (
    SELECT 1
    FROM transactionsss t
    WHERE c.customer_id = t.customer_id
    AND t.amount > 4500
);

SELECT t1.transaction_id, t1.customer_id, t1.amount
FROM transactionsss t1
WHERE t1.amount > (
    SELECT AVG(t2.amount)
    FROM transactionsss t2
    WHERE t2.customer_id = t1.customer_id
);

SELECT c.customer_id, c.customer_name
FROM Customers c
WHERE  EXISTS (
    SELECT 1
    FROM transactionsss t
    WHERE c.customer_id = t.customer_id
    AND c.city = 'mangalore'
);
