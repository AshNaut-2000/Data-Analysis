-- SQLite script: create SalesData and populate it with 10,000 synthetic rows.
-- Run with: sqlite3 Data-Analysis.db < sales_data.sql

DROP TABLE IF EXISTS SalesData;

CREATE TABLE SalesData (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Age INTEGER NOT NULL CHECK (Age BETWEEN 18 AND 80),
    City TEXT NOT NULL,
    PurchaseAmount REAL NOT NULL CHECK (PurchaseAmount >= 0),
    PurchaseDate TEXT NOT NULL
);

WITH RECURSIVE seq(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 10000
)
INSERT INTO SalesData (CustomerID, Name, Age, City, PurchaseAmount, PurchaseDate)
SELECT
    100000 + n,
    CASE (random() & 2147483647) % 12
        WHEN 0 THEN 'Ava Johnson'
        WHEN 1 THEN 'Liam Smith'
        WHEN 2 THEN 'Noah Williams'
        WHEN 3 THEN 'Emma Brown'
        WHEN 4 THEN 'Olivia Jones'
        WHEN 5 THEN 'Ethan Garcia'
        WHEN 6 THEN 'Sophia Miller'
        WHEN 7 THEN 'Mason Davis'
        WHEN 8 THEN 'Isabella Rodriguez'
        WHEN 9 THEN 'Lucas Martinez'
        WHEN 10 THEN 'Mia Wilson'
        ELSE 'James Anderson'
    END,
    18 + ((random() & 2147483647) % 63),
    CASE (random() & 2147483647) % 10
        WHEN 0 THEN 'New York'
        WHEN 1 THEN 'Los Angeles'
        WHEN 2 THEN 'Chicago'
        WHEN 3 THEN 'Houston'
        WHEN 4 THEN 'Phoenix'
        WHEN 5 THEN 'Philadelphia'
        WHEN 6 THEN 'San Antonio'
        WHEN 7 THEN 'San Diego'
        WHEN 8 THEN 'Dallas'
        ELSE 'San Jose'
    END,
    (((random() & 2147483647) % 249501) + 500) / 100.0,
    date('2020-01-01', '+' || ((random() & 2147483647) % 2192) || ' days')
FROM seq;
