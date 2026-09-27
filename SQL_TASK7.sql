create  database finance_db1;
use finance_db1;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number bigint
);
CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount int,
    due_date date,
    FOREIGN KEY (customer_id) references customer(customer_id));

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_amount DECIMAL(10,2),
	FOREIGN KEY (invoice_id) references Invoices(invoice_id));
    
INSERT INTO Customer (customer_id, customer_name, phone_number)
VALUES
(1, 'Rahul', 9876543210),
(2, 'Anu', 9876543211),
(3, 'Kiran', 9876543212);

INSERT INTO Invoices (invoice_id, customer_id, invoice_amount, due_date)
VALUES
(101, 1, 5000, '2026-09-20'),
(102, 2, 7500, '2026-09-22'),
(103, 3, 3000, '2026-09-25');

INSERT INTO Payments (payment_id, invoice_id, payment_amount)
VALUES
(1001, 101, 5000.00),
(1002, 102, 4000.00),
(1003, 103, 3000.00);

SELECT * FROM Customer;
SELECT * FROM Invoices;
SELECT * FROM Payments;

create view customer_balances as 
select c.customer_name,
	   i.invoice_amount,
       p.payment_amount,
       i.invoice_amount - p.payment_amount as balance 
from Customer c
join Invoices i on c.customer_id=i.customer_id
join Payments p on i.invoice_id = p.invoice_id;

select * from customer_balances;


create view customer_overdue as 
select c.customer_name,
       i.invoice_amount - p.payment_amount as overdue 
from Customer c
join Invoices i on c.customer_id=i.customer_id
join Payments p on i.invoice_id = p.invoice_id
where invoice_amount> payment_amount;

select * from customer_overdue;

create view customer_overdue_balance as 
select c.customer_name,
	   i.invoice_amount,
       p.payment_amount,
       i.invoice_amount - p.payment_amount as balance ,
       DATEDIFF(CURDATE(),i.due_date) as days_overdue
from Customer c
join Invoices i on c.customer_id=i.customer_id
join Payments p on i.invoice_id = p.invoice_id;
select * from customer_overdue_balance;

CREATE VIEW customer_restrict AS
SELECT c.customer_name,
       i.invoice_amount,
       p.payment_amount,
       i.invoice_amount - p.payment_amount AS balance
FROM Customer c
JOIN Invoices i ON c.customer_id = i.customer_id
JOIN Payments p ON i.invoice_id = p.invoice_id
WHERE i.invoice_amount - p.payment_amount > 0;

SELECT * FROM customer_restrict;




