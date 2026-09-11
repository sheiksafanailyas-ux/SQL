use safana_06;
CREATE TABLE Customerss (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orderss (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customerss(Customer_ID)
);

CREATE TABLE Invoicess (
    Invoice_ID INT PRIMARY KEY,
    Order_ID INT,
    Invoice_Date DATE,
    Invoice_Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Paymentss(
    Payment_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Payment_Date DATE,
    Payment_Amount DECIMAL(10,2),
    FOREIGN KEY (Invoice_ID) REFERENCES Invoices(Invoice_ID)
);

CREATE TABLE Ledgers (
    Ledger_ID INT PRIMARY KEY,
    Customer_ID INT,
    Transaction_Date DATE,
    Debit DECIMAL(10,2),
    Credit DECIMAL(10,2),
    Description VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customerss(Customer_ID)
);

INSERT INTO Customerss VALUES
(1, 'Aarav', 'Mumbai'),
(2, 'Diya', 'Delhi'),
(3, 'Rahul', 'Chennai'),
(4, 'Sneha', 'Pune'),
(5, 'Kabir', 'Hyderabad');

INSERT INTO Orderss VALUES
(101, 1, '2026-01-05', 45000),
(102, 2, '2026-02-10', 72000),
(103, 1, '2026-03-15', 35000),
(104, 3, '2026-04-20', 58000),
(105, 4, '2026-05-25', 29000);

INSERT INTO Invoicess VALUES
(1001, 101, '2026-01-10', 45000),
(1002, 102, '2026-02-15', 72000),
(1003, 104, '2026-04-25', 58000),
(1004, 102, '2026-03-01', 30000),
(1005, 103, '2026-03-20', 35000);

INSERT INTO Paymentss VALUES
(201, 1001, '2026-01-20', 20000),
(202, 1002, '2026-02-25', 30000),
(203, 1001, '2026-02-05', 15000),
(204, 1004, '2026-03-15', 10000),
(205, 1005, '2026-04-01', 25000);

INSERT INTO Ledgers VALUES
(1, 1, '2026-01-12', 5000, 0, 'Purchase'),
(2, 2, '2026-02-12', 0, 8000, 'Payment'),
(3, 3, '2026-03-12', 3500, 0, 'Rent'),
(4, 4, '2026-04-12', 0, 6000, 'Credit'),
(5, 1, '2026-05-12', 7000, 0, 'Sales');

SELECT * FROM Customerss;

SELECT * FROM Orderss;

SELECT * FROM Invoicess;

SELECT * FROM Paymentss;

SELECT * FROM Ledgers;

SELECT 
   c.Customer_ID,
   c.Customer_Name,
   o.Order_ID,
   o.Order_Amount
FROM Customerss c
INNER JOIN Orderss o
ON c.Customer_ID=o.Customer_ID;

SELECT
   c.Customer_ID,
   c.Customer_name,
   o.Order_Amount
FROM Customerss c
LEFT JOIN Orders o
ON c.Customer_ID=o.Customer_ID;

SELECT
   c.Customer_ID,
   c.Customer_name,
   o.Order_Amount
FROM Customerss c
RIGHT JOIN Orders o
ON c.Customer_ID=o.Customer_ID;



SELECT 
     c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Amount,
    i.Invoice_ID,
    i.Invoice_Amount,
    p.Payment_ID,
    p.Payment_Amount,
    l.Ledger_ID,
    l.Debit,
    l.Credit
from Customerss c
LEFT JOIN Orders o
ON c.Customer_ID=o.Customer_ID
LEFT JOIN Invoices i
ON o.Order_ID=i.Order_ID
LEFT JOIN Payments p
ON i.Invoice_ID=p.Invoice_ID
LEFT JOIN Ledger l
ON c.Customer_ID=l.Customer_ID;
