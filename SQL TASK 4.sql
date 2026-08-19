use safana_ab;
CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    invoice_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    region VARCHAR(30)
);
SELECT * FROM  financial_transactions;
INSERT INTO financial_transactions
(transaction_id, customer_name, invoice_amount, payment_status, payment_date, region)
VALUES
(1, 'Anil Kumar', 12500, 'Paid', '2026-01-05', 'South'),
(2, 'Priya Nair', 18500, 'Pending', '2026-01-08', 'South'),
(3, 'Rahul Sharma', 22000, 'Paid', '2026-01-10', 'North'),
(4, 'Sneha Thomas', 9500, 'Paid', '2026-01-12', 'South'),
(5, 'Arjun Mehta', 32000, 'Pending', '2026-01-15', 'West'),
(6, 'Kavya Menon', 15000, 'Overdue', '2026-01-18', 'South'),
(7, 'Rohit Verma', 27500, 'Paid', '2026-01-20', 'North'),
(8, 'Neha Kapoor', 11000, 'Pending', '2026-01-22', 'North'),
(9, 'Amit Patel', 45000, 'Paid', '2026-01-25', 'West'),
(10, 'Divya Rao', 17500, 'Paid', '2026-01-28', 'South'),
(11, 'Sanjay Gupta', 25000, 'Overdue', '2026-02-02', 'North'),
(12, 'Meera Iyer', 13500, 'Paid', '2026-02-05', 'South'),
(13, 'Vikram Singh', 38000, 'Pending', '2026-02-08', 'North'),
(14, 'Pooja Shah', 21000, 'Paid', '2026-02-10', 'West'),
(15, 'Kiran Das', 8500, 'Pending', '2026-02-12', 'East'),
(16, 'Ramesh Kumar', 29500, 'Paid', '2026-02-15', 'South'),
(17, 'Asha Nair', 16000, 'Overdue', '2026-02-18', 'South'),
(18, 'Manish Joshi', 52000, 'Paid', '2026-02-20', 'West'),
(19, 'Lakshmi Rao', 19500, 'Pending', '2026-02-22', 'East'),
(20, 'Deepak Sharma', 27500, 'Paid', '2026-02-25', 'North'),
(21, 'Swathi Menon', 12000, 'Paid', '2026-02-28', 'South'),
(22, 'Naveen Patel', 34000, 'Overdue', '2026-03-03', 'West'),
(23, 'Reshma Thomas', 14500, 'Pending', '2026-03-05', 'South'),
(24, 'Ajay Verma', 41000, 'Paid', '2026-03-08', 'North'),
(25, 'Geetha Iyer', 23000, 'Pending', '2026-03-10', 'East');
SELECT * FROM  financial_transactions;
SELECT * FROM  financial_transactions WHERE region="South" OR region="North";
SELECT * FROM  financial_transactions WHERE payment_status="Paid";
SELECT * FROM  financial_transactions WHERE invoice_amount>29500;
SELECT * FROM  financial_transactions WHERE transaction_id=22;
SELECT * FROM  financial_transactions WHERE payment_status="Pending";
SELECT * FROM  financial_transactions WHERE payment_date BETWEEN "2026-01-10" AND "2026-02-02";
SELECT * FROM  financial_transactions WHERE invoice_amount BETWEEN "1500" AND "9500";
SELECT * FROM  financial_transactions WHERE invoice_amount BETWEEN "10000" AND "25000";
SELECT * FROM  financial_transactions WHERE payment_date BETWEEN "2026-01-05" AND "2026-03-10";
SELECT * FROM  financial_transactions WHERE payment_status BETWEEN "20000" AND "50000";
SELECT * FROM  financial_transactions WHERE region in ("West","East");
SELECT * FROM  financial_transactions WHERE payment_status in ("Pending","Paid");
SELECT * FROM  financial_transactions WHERE invoice_amount in ("32000","45000");
SELECT * FROM  financial_transactions WHERE region in ("West","South");
SELECT * FROM  financial_transactions WHERE region in ("North","South");
select * from financial_transactions where customer_name like "%a%";
select * from financial_transactions where customer_name like "_a%";
select * from financial_transactions where customer_name like "%_a";
select * from financial_transactions where customer_name like "_s%";
select distinct region from  financial_transactions;
select distinct invoice_amount from  financial_transactions;
select distinct payment_date  from  financial_transactions;
select distinct payment_status from  financial_transactions;
select distinct customer_name  from  financial_transactions;
select count(distinct payment_status) as total_payment_status from financial_transactions;
select count(distinct region) as total_region from financial_transactions;
select count(distinct payment_date) as total_payment_date from financial_transactions;
select count(distinct customer_name) as total_customer_name from financial_transactions;
select count(distinct invoice_amount) as total_invoice_ammount from financial_transactions;
select * from financial_transactions order by invoice_amount desc;
select * from financial_transactions order by payment_date desc;
select * from financial_transactions order by invoice_amount ;
select * from financial_transactions order by payment_date ;
select * from financial_transactions order by invoice_amount desc;