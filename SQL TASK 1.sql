CREATE database FinanciaIDB;
USE FinanciaIDB;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);
SELECT * FROM customers; 
INSERT INTO Customers (customer_id, customer_name, email, phone)
VALUES 
(1, 'Priya', 'priya@gmail.com', '9876543210'),
(2, 'Rahul', 'rahul@gmail.com', '9876543211');
SELECT * FROM customers; 
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SELECT * FROM Accounts; 
INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES 
(101, 1, 'Savings', 8000.00),
(102, 2, 'Current', 12000.00);
SELECT * FROM Accounts; 
CREATE TABLE Ledgers (
    ledger_id INT PRIMARY KEY,
    account_id INT,
    ledger_name VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
SELECT * FROM Ledgers;
INSERT INTO Ledgers (ledger_id, account_id, ledger_name)
VALUES
(201, 101, 'Savings Ledger'),
(202, 102, 'Current Ledger');
SELECT * FROM Ledgers;
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
SELECT * FROM Transactions;
INSERT INTO Transactions(transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES 
(301, 101, 'Credit', 5000.00, '2026-08-09'),
(302, 102, 'Debit', 2000.00, '2026-08-09');
SELECT * FROM Transactions;
CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SELECT * FROM Invoices;
INSERT INTO Invoices(invoice_id, customer_id, invoice_date, amount)
VALUES 
(401, 1, '2026-08-09', 3000.00),
(402, 2, '2026-08-09', 4500.00);
SELECT * FROM Invoices;
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    payment_date DATE,
    amount DECIMAL(10 , 2 ),
    FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id)
);
SELECT * FROM Payments;
INSERT INTO Payments
(payment_id, customer_id, payment_date, amount)
VALUES 
(501, 1, '2026-08-09', 3000.00),
(502, 2, '2026-08-09', 4500.00);
SELECT * FROM Payments;

