CREATE DATABASE Permissions;
use Permissions;
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(90),
    Email VARCHAR(80)
);

CREATE TABLE Transactions(
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    TransactionDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Salaries(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(90),
    Salary DECIMAL(10,2)
);

CREATE USER 'manager'@'localhost'
IDENTIFIED BY 'Manager@234';

CREATE USER 'accountant'@'localhost'
IDENTIFIED BY 'Accountant@234';

CREATE USER 'clerk'@'localhost'
IDENTIFIED BY 'Clerk@234';

GRANT SELECT
ON permission.*
TO 'manager'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON permission.Transactions
TO 'accountant'@'localhost';

GRANT SELECT
ON permission.Customers
TO 'accountant'@'localhost';

GRANT SELECT
ON permission.Customers
TO 'clerk'@'localhost';

REVOKE DELETE
ON permission.Transactions
FROM 'accountant'@'localhost';

SHOW GRANTS FOR 'manager'@'localhost';
SHOW GRANTS FOR 'accountant'@'localhost';
SHOW GRANTS FOR 'clerk'@'localhost';