-- INSERT
-- Insert new Category
INSERT INTO Category (CategoryName, Description)
VALUES ('Beauty', 'Skincare, makeup and personal care products');

-- Insert new Customer
INSERT INTO Customer (Name, Email, Phone, Address, Password)
VALUES ('Kavya Nair', 'kavya.nair@gmail.com', '9876543216', 'Kochi, Kerala', 'kavya@111');

-- Insert new Product
INSERT INTO Product (Name, Description, Price, Stock, CategoryID)
VALUES ('Smart Watch Pro', 'Fitness tracking smartwatch', 8999.00, 50, 1);

-- Insert new Order 
INSERT INTO "Order" (CustomerID, OrderDate, OrderTime, Status, TotalAmount)
VALUES (2, '2025-09-12', '12:00:00', 'Pending', 8999.00);

-- Insert Order Items
INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice)
VALUES (8, 13, 1, 8999.00);

-- Insert Payment
INSERT INTO Payment (OrderID, Amount, Method, PaymentDate, PaymentTime, Status)
VALUES (8, 8999.00, 'UPI', '2025-09-12', '12:05:00', 'Pending');
-- ===============================================================================================================
-- SELECT
-- All customers
SELECT * FROM Customer;

-- Products with price > 5000
SELECT ProductID, Name, Price, Stock 
FROM Product 
WHERE Price > 5000
ORDER BY Price DESC;

-- Orders of a specific customer
SELECT * FROM "Order" 
WHERE CustomerID = 1;

-- Pending payments
SELECT * FROM Payment 
WHERE Status = 'Pending';
-- ====================================================================================================================
-- UPDATE
-- Update product stock after sale
UPDATE Product 
SET Stock = Stock - 1 
WHERE ProductID = 1;

-- Update order status
UPDATE "Order" 
SET Status = 'Delivered' 
WHERE OrderID = 5;

-- Update customer address
UPDATE Customer 
SET Address = 'Hyderabad, Telangana - 500032' 
WHERE CustomerID = 1;

-- Update payment status
UPDATE Payment 
SET Status = 'Completed' 
WHERE PaymentID = 5;
-- ===================================================================================================================
-- DELETE
-- 1. Delete a specific Order Item
DELETE FROM OrderItem 
WHERE OrderItemID = 11;

-- 2. Delete a Product (first remove its OrderItems)
DELETE FROM OrderItem WHERE ProductID = 13;
DELETE FROM Product WHERE ProductID = 13;

-- 3. Delete an entire Order (with its related data)
DELETE FROM OrderItem WHERE OrderID = 7;
DELETE FROM Payment WHERE OrderID = 7;
DELETE FROM "Order" WHERE OrderID = 7;
