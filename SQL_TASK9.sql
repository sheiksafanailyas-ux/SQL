USE SAFANA3;

CREATE TABLE transactionsses (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    department VARCHAR(50),
    transaction_type VARCHAR(40),
    amount DECIMAL(10,2)
);

INSERT INTO transactionsses
(transaction_id, transaction_date, department, transaction_type, amount)
VALUES
(1, '2023-01-01', 'Sales', 'Income', 10000.00),
(2, '2024-09-02', 'HR', 'Expenses', 6000.00),
(3, '2025-05-05', 'Sales', 'Income', 56000.00),
(4, '2023-10-06', 'IT', 'Expenses', 30000.00),
(5, '2024-05-07', 'Sales', 'Income', 40000.00),
(6, '2025-03-10', 'HR', 'Expenses', 33000.00),
(7, '2023-01-11', 'IT', 'Income', 60000.00),
(8, '2024-10-12', 'IT', 'Income', 84000.00),
(9, '2025-12-13', 'HR', 'Expenses', 40000.00),
(10, '2023-10-14', 'HR', 'Income', 11000.00),
(11, '2024-07-15', 'Sales', 'Expenses', 63000.00),
(12, '2025-02-02', 'Sales', 'Income', 90000.00);

SELECT * FROM transactionsses;

SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(amount) AS total_amount
FROM transactionsses
GROUP BY YEAR(transaction_date), MONTH(transaction_date);

WITH monthly_summary AS (
    SELECT 
        YEAR(transaction_date) AS year,
        MONTH(transaction_date) AS month,
        SUM(amount) AS total_amount
    FROM transactionsses
    GROUP BY YEAR(transaction_date), MONTH(transaction_date)
)
SELECT * FROM monthly_summary;

SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(amount) AS total_income
FROM transactionsses
WHERE transaction_type = 'Income'
GROUP BY YEAR(transaction_date), MONTH(transaction_date);

SELECT 
    YEAR(transaction_date) AS year,
    SUM(amount) AS total_income
FROM transactionsses
WHERE transaction_type = 'Income'
GROUP BY YEAR(transaction_date);

SELECT 
    department,
    SUM(amount) AS total_expenses
FROM transactionsses
WHERE transaction_type = 'Expenses'
GROUP BY department;

SELECT 
    YEAR(transaction_date) AS year,
    department,
    SUM(amount) AS total_expenses
FROM transactionsses
WHERE transaction_type = 'Expenses'
GROUP BY YEAR(transaction_date), department;

