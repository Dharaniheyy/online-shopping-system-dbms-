
-- =====================================================
-- 1. Order Summary View
-- =====================================================

CREATE VIEW vw_OrderSummary AS

SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    c.Email,
    c.Phone,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    TO_CHAR(o.OrderTime, 'HH24:MI:SS') AS OrderTime,
    o.Status AS OrderStatus,
    o.TotalAmount,
    pay.Method AS PaymentMethod,
    pay.Status AS PaymentStatus

FROM "Order" o
JOIN Customer c
    ON o.CustomerID = c.CustomerID
LEFT JOIN Payment pay
    ON o.OrderID = pay.OrderID;


-- =====================================================
-- 2. Product Catalog View
-- =====================================================

CREATE VIEW vw_ProductCatalog AS

SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Description,
    p.Price,
    p.Stock,
    c.CategoryName,

    CASE 
        WHEN p.Stock = 0 THEN 'Out of Stock'
        WHEN p.Stock < 20 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS StockStatus

FROM Product p
JOIN Category c
    ON p.CategoryID = c.CategoryID;


-- =====================================================
-- 3. Customer Order History View
-- =====================================================

CREATE VIEW vw_CustomerOrderHistory AS

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.Status,
    o.TotalAmount,
    COUNT(oi.OrderItemID) AS ItemsCount

FROM Customer c
JOIN "Order" o
    ON c.CustomerID = o.CustomerID
JOIN OrderItem oi
    ON o.OrderID = oi.OrderID

GROUP BY 
    c.CustomerID,
    c.Name,
    o.OrderID,
    o.OrderDate,
    o.Status,
    o.TotalAmount;


-- =====================================================
-- 4. Sales by Category View
-- =====================================================

CREATE VIEW vw_SalesByCategory AS

SELECT 
    c.CategoryName,
    COUNT(DISTINCT oi.OrderID) AS OrdersCount,
    SUM(oi.Quantity) AS UnitsSold,
    SUM(oi.Quantity * oi.UnitPrice) AS Revenue

FROM Category c
JOIN Product p
    ON c.CategoryID = p.CategoryID
JOIN OrderItem oi
    ON p.ProductID = oi.ProductID

GROUP BY 
    c.CategoryID,
    c.CategoryName;


-- =====================================================
-- 5. Pending Orders View
-- =====================================================

CREATE VIEW vw_PendingOrders AS

SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    c.Phone,
    c.Email,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.TotalAmount,
    o.Status

FROM "Order" o
JOIN Customer c
    ON o.CustomerID = c.CustomerID

WHERE o.Status IN ('Pending', 'Confirmed');


-- =====================================================
-- USE THE VIEWS
-- =====================================================


-- 1. All Order Summaries
SELECT * 
FROM vw_OrderSummary;


-- 2. Delivered Orders
SELECT * 
FROM vw_OrderSummary
WHERE OrderStatus = 'Delivered';


-- 3. Low Stock Products
SELECT * 
FROM vw_ProductCatalog
WHERE StockStatus = 'Low Stock';


-- 4. Rahul Sharma's Order History
SELECT * 
FROM vw_CustomerOrderHistory
WHERE CustomerName = 'Rahul Sharma';


-- 5. Sales by Category
SELECT * 
FROM vw_SalesByCategory
ORDER BY Revenue DESC;


-- 6. Pending / Confirmed Orders
SELECT * 
FROM vw_PendingOrders;
