-- =====================================================
-- 1. INNER JOIN
-- Returns only matching rows from both tables
-- =====================================================

-- Orders with Customer details
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    c.Email,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.Status,
    o.TotalAmount
FROM "Order" o
INNER JOIN Customer c 
    ON o.CustomerID = c.CustomerID;


-- Order Items with Product name
SELECT 
    oi.OrderItemID,
    o.OrderID,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS LineTotal
FROM OrderItem oi
INNER JOIN "Order" o 
    ON oi.OrderID = o.OrderID
INNER JOIN Product p 
    ON oi.ProductID = p.ProductID;


-- =====================================================
-- 2. LEFT JOIN
-- Returns all rows from left table + matching from right
-- =====================================================

-- All Customers and their Orders
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.TotalAmount,
    o.Status
FROM Customer c
LEFT JOIN "Order" o 
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;


-- All Products with Category
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Price,
    c.CategoryName
FROM Product p
LEFT JOIN Category c 
    ON p.CategoryID = c.CategoryID;


-- =====================================================
-- 3. RIGHT JOIN
-- Returns all rows from right table + matching from left
-- =====================================================

-- All Orders and their Customer details
SELECT 
    c.Name AS CustomerName,
    o.OrderID,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.Status,
    o.TotalAmount
FROM Customer c
RIGHT JOIN "Order" o 
    ON c.CustomerID = o.CustomerID;


-- All Categories and Products under them
SELECT 
    p.Name AS ProductName,
    p.Price,
    c.CategoryName
FROM Product p
RIGHT JOIN Category c 
    ON p.CategoryID = c.CategoryID;


-- =====================================================
-- 4. NATURAL JOIN
-- Automatically joins on columns with same name
-- =====================================================

-- Natural Join between Order and Payment
-- Both have OrderID
SELECT *
FROM "Order"
NATURAL JOIN Payment;


-- Natural Join between Product and OrderItem
-- Both have ProductID
SELECT *
FROM Product
NATURAL JOIN OrderItem;


-- =====================================================
-- 5. FULL OUTER JOIN
-- Returns all rows from both tables
-- =====================================================

-- All Customers and all Orders
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    TO_CHAR(o.OrderDate, 'DD-MM-YYYY') AS OrderDate,
    o.TotalAmount,
    o.Status
FROM Customer c
FULL OUTER JOIN "Order" o 
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;


-- All Products and OrderItems
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    oi.OrderItemID,
    oi.Quantity
FROM Product p
FULL OUTER JOIN OrderItem oi 
    ON p.ProductID = oi.ProductID;
