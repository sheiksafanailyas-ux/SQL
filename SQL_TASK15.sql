use safana3;
CREATE DATABASE finance_db;
USE finance_db;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
amount DECIMAL(12,2),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE monthly_financess (
    id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    month_name VARCHAR(20),
    sales DECIMAL(10,2),
    expenses DECIMAL(10,2),
    tax_rate DECIMAL(5,2)
);
INSERT INTO monthly_financess
VALUES
(1, 'Rahul', 'January', 50000, 30000, 10),
(2, 'Priya', 'February', 60000, 35000, 10),
(3, 'Aman', 'March', 45000, 25000, 8),
(4, 'Sneha', 'April', 70000, 40000, 12),
(5, 'Rahul', 'May', 55000, 32000, 10);
SELECT
    customer_name,
    month_name,
    sales,
    expenses,
    sales - expenses AS profit
FROM monthly_financess;
SELECT
    customer_name,
    sales,
    tax_rate,
    sales * tax_rate / 100 AS tax_amount
FROM monthly_financess;
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(expenses) AS total_expenses
FROM monthly_financess
GROUP BY customer_name;
SELECT
    customer_name,
    SUM(sales - expenses) AS total_profit
FROM monthly_financess
GROUP BY customer_name;
SELECT
    c.customer_name,
    a.account_id,
    a.balance
FROM Customers c
LEFT JOIN Accounts a
ON c.customer_id = a.customer_id;
CREATE VIEW financial_summary AS
SELECT
    customer_name,
    month_name,
    sales,
    expenses,
    sales - expenses AS profit
FROM monthly_financess;
SELECT * FROM financial_summary;

SELECT *
FROM monthly_financess
WHERE sales > (
    SELECT AVG(sales)
    FROM monthly_financess
);
WITH profit_data AS (
    SELECT
        customer_name,
        month_name,
        sales - expenses AS profit
    FROM monthly_financess
)
SELECT *
FROM profit_data
WHERE profit > 20000;
SELECT
    customer_name,
    month_name,
    sales,
    RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM monthly_financess;
SELECT
    customer_name,
    month_name,
    sales,
    SUM(sales) OVER (
        ORDER BY id
    ) AS running_sales
FROM monthly_financess;
SELECT
    customer_name,
    sales,
    PERCENT_RANK() OVER (
        ORDER BY sales
    ) AS sales_percent_rank
FROM monthly_financess;
DELIMITER //

CREATE PROCEDURE calculate_Tax(
    IN sales DECIMAL(10,2),
    IN tax_rate DECIMAL(10,2)
)
BEGIN
    SELECT
        sales * tax_rate / 100 AS Tax_Amount;
END //

DELIMITER ;
CALL calculate_Tax(50000, 10);
DELIMITER //

CREATE PROCEDURE YearEndProfit(IN input_year INT)
BEGIN
    SELECT
        SUM(sales) AS Total_Sales,
        SUM(expenses) AS Total_Expenses,
        SUM(sales - expenses) AS Total_Profit
    FROM monthly_financess;
END //

DELIMITER ;
CALL YearEndProfit(2026);
CREATE TABLE transaction_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit
    (transaction_id, action_type)
    VALUES
    (NEW.transaction_id, 'INSERT');
END //

DELIMITER ;

SELECT
    customer_name,
    sales,
    CASE
        WHEN sales >= 60000 THEN 'High Sales'
        WHEN sales >= 50000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM monthly_financess;
SELECT
    customer_name,
    COALESCE(sales, 0) AS sales,
    COALESCE(expenses, 0) AS expenses
FROM monthly_financess;
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(expenses) AS total_expenses,
    SUM(sales - expenses) AS total_profit,
    SUM(sales * tax_rate / 100) AS total_tax
FROM monthly_financess
GROUP BY customer_name;














