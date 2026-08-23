use financiaidb;
create table customer(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(100) NOT NULL,
Email VARCHAR(50) UNIQUE,
Phone INT
);
INSERT INTO customer VALUES 
(1, 'Prathi', 'pr@gmail.com', 1234567890),
(2, 'Teja', 'ab@gmail.com', 0987654321);
SELECT * FROM customer;

create table accounts(
Account_ID INT PRIMARY KEY,
Customer_ID INT,
Account_type varchar(50)NOT NULL,
Balance decimal(10,2),
constraint accounts_bal check (balance>=0),
FOREIGN KEY (Customer_ID) references customers (Customer_ID)
);
INSERT INTO customer values (101,1,"savings", 1000.00),(102,"fixed",2000.00);
select*from accounts;

create table transactions(
Transaction_id INT PRIMARY KEY,
Account_ID INT,
Transaction_date date,
Transaction_type VARCHAR(10),
Amount decimal(15,2),
constraint transactions_t CHECK (Transaction_type IN ('Credit','Debit')),
constraint transaction_ac check(amount>=0),
FOREIGN KEY (Amount_ID) references accounts (Account_ID)
);
INSERT INTO customers values(1,'2026-08-07','Credit',9000.00),(2,'2026-08-02','Debit',4500.00);
SELECT*from transactions;
alter table customers
add address varchar(80);
alter table transactions
add phone int;
drop table amount;
