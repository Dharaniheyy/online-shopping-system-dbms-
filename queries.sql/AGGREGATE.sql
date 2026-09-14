-- Total number of products
SELECT COUNT(*) AS TotalProducts FROM Product;

-- Total revenue (from completed payments)
SELECT SUM(Amount) AS TotalRevenue 
FROM Payment 
WHERE Status = 'Completed';

-- Average order value
SELECT ROUND(AVG(TotalAmount), 2) AS AvgOrderValue 
FROM "Order";

-- Highest and lowest product price
SELECT 
    MAX(Price) AS HighestPrice,
    MIN(Price) AS LowestPrice
FROM Product;

-- Products per category
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Category c
LEFT JOIN Product p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY ProductCount DESC;

-- Total quantity sold per product
SELECT 
    p.Name AS ProductName,
    SUM(oi.Quantity) AS TotalSold
FROM Product p
JOIN OrderItem oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalSold DESC;

-- Revenue by payment method
SELECT 
    Method,
    COUNT(*) AS Transactions,
    SUM(Amount) AS TotalAmount
FROM Payment
WHERE Status = 'Completed'
GROUP BY Method
ORDER BY TotalAmount DESC;

-- Monthly order summary
SELECT 
    TO_CHAR(OrderDate, 'YYYY-MM') AS Month,
    COUNT(*) AS TotalOrders,
    SUM(TotalAmount) AS MonthlyRevenue
FROM "Order"
GROUP BY TO_CHAR(OrderDate, 'YYYY-MM')
ORDER BY Month;
