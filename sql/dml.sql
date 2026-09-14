-- =====================================================
-- 8. INSERT CATEGORY DATA
-- =====================================================

INSERT INTO Category
(CategoryName, Description)
VALUES
('Electronics',
 'Mobile phones, laptops, gadgets and accessories'),

('Clothing',
 'Men and Women apparel, footwear and fashion'),

('Books',
 'Fiction, Non-fiction, Academic and Competitive books'),

('Home Appliances',
 'Kitchen appliances and home essentials'),

('Sports',
 'Sports equipment and fitness accessories');


-- =====================================================
-- 9. INSERT CUSTOMER DATA
-- =====================================================

INSERT INTO Customer
(Name, Email, Phone, Address, Password)
VALUES
('Rahul Sharma',
 'rahul.sharma@gmail.com',
 '9876543210',
 'Hyderabad, Telangana',
 'rahul@123'),

('Priya Patel',
 'priya.patel@gmail.com',
 '9876543211',
 'Bangalore, Karnataka',
 'priya@456'),

('Amit Kumar',
 'amit.kumar@gmail.com',
 '9876543212',
 'Chennai, Tamil Nadu',
 'amit@789'),

('Sneha Reddy',
 'sneha.reddy@gmail.com',
 '9876543213',
 'Mumbai, Maharashtra',
 'sneha@321'),

('Vikram Singh',
 'vikram.singh@gmail.com',
 '9876543214',
 'Delhi',
 'vikram@654'),

('Ananya Gupta',
 'ananya.gupta@gmail.com',
 '9876543215',
 'Pune, Maharashtra',
 'ananya@987');


-- =====================================================
-- 10. INSERT PRODUCT DATA
-- =====================================================

INSERT INTO Product
(Name, Description, Price, Stock, CategoryID)
VALUES
('iPhone 15',
 'Latest Apple smartphone with A16 chip',
 79999.00, 25, 1),

('Samsung Galaxy S24',
 'Flagship Android phone with AI features',
 74999.00, 30, 1),

('Sony WH-1000XM5',
 'Noise cancelling wireless headphones',
 29990.00, 40, 1),

('Men Formal Shirt',
 'Premium cotton formal shirt',
 1299.00, 100, 2),

('Women Summer Dress',
 'Light and comfortable summer dress',
 1899.00, 80, 2),

('Python Programming',
 'Complete guide to Python programming',
 599.00, 50, 3),

('Atomic Habits',
 'Book by James Clear on building habits',
 450.00, 60, 3),

('Air Fryer 4L',
 'Healthy oil-free cooking appliance',
 4999.00, 35, 4),

('Mixer Grinder',
 '750W powerful mixer grinder',
 3499.00, 45, 4),

('Yoga Mat',
 'Anti-slip yoga mat for fitness',
 899.00, 70, 5),

('Dumbbell Set 10kg',
 'Adjustable dumbbell set',
 2499.00, 25, 5),

('Wireless Earbuds',
 'Bluetooth earbuds with long battery',
 2999.00, 90, 1);


-- =====================================================
-- 11. INSERT ORDER DATA
-- =====================================================

INSERT INTO "Order"
(CustomerID, OrderDate, OrderTime, Status, TotalAmount)
VALUES

(1, '2025-08-15', '10:30:00',
 'Delivered', 82998.00),

(2, '2025-08-20', '14:15:00',
 'Delivered', 1299.00),

(3, '2025-08-25', '09:00:00',
 'Shipped', 5598.00),

(1, '2025-09-01', '16:45:00',
 'Confirmed', 2999.00),

(4, '2025-09-05', '11:20:00',
 'Pending', 4999.00),

(5, '2025-09-08', '13:10:00',
 'Confirmed', 3398.00),

(6, '2025-09-10', '17:30:00',
 'Pending', 1899.00);


-- =====================================================
-- 12. INSERT ORDER ITEM DATA
-- =====================================================

INSERT INTO OrderItem
(OrderID, ProductID, Quantity, UnitPrice)
VALUES

(1, 1, 1, 79999.00),
(1, 12, 1, 2999.00),

(2, 4, 1, 1299.00),

(3, 8, 1, 4999.00),
(3, 6, 1, 599.00),

(4, 12, 1, 2999.00),

(5, 8, 1, 4999.00),

(6, 4, 1, 1299.00),
(6, 10, 1, 899.00),
(6, 7, 1, 450.00),

(7, 5, 1, 1899.00);


-- =====================================================
-- 13. INSERT PAYMENT DATA
-- =====================================================

INSERT INTO Payment
(OrderID, Amount, Method, PaymentDate, PaymentTime, Status)
VALUES

(1, 82998.00, 'UPI',
 '2025-08-15', '10:35:00', 'Completed'),

(2, 1299.00, 'Credit Card',
 '2025-08-20', '14:20:00', 'Completed'),

(3, 5598.00, 'Net Banking',
 '2025-08-25', '09:15:00', 'Completed'),

(4, 2999.00, 'UPI',
 '2025-09-01', '16:50:00', 'Completed'),

(5, 4999.00, 'Debit Card',
 '2025-09-05', '11:25:00', 'Pending'),

(6, 3398.00, 'UPI',
 '2025-09-08', '13:15:00', 'Completed'),

(7, 1899.00, 'Cash on Delivery',
 '2025-09-10', '17:35:00', 'Pending');


-- =====================================================
-- 14. DISPLAY CATEGORY TABLE
-- =====================================================

SELECT * FROM Category;


-- =====================================================
-- 15. DISPLAY CUSTOMER TABLE
-- =====================================================

SELECT * FROM Customer;


-- =====================================================
-- 16. DISPLAY PRODUCT TABLE
-- =====================================================

SELECT * FROM Product;


-- =====================================================
-- 17. DISPLAY ORDER TABLE
-- DATE FORMAT: DD-MM-YYYY
-- TIME FORMAT: HH:MM:SS
-- =====================================================

SELECT
    OrderID,
    CustomerID,
    TO_CHAR(OrderDate, 'DD-MM-YYYY') AS OrderDate,
    TO_CHAR(OrderTime, 'HH24:MI:SS') AS OrderTime,
    Status,
    TotalAmount
FROM "Order";


-- =====================================================
-- 18. DISPLAY ORDER ITEM TABLE
-- =====================================================

SELECT * FROM OrderItem;


-- =====================================================
-- 19. DISPLAY PAYMENT TABLE
-- DATE FORMAT: DD-MM-YYYY
-- TIME FORMAT: HH:MM:SS
-- =====================================================

SELECT
    PaymentID,
    OrderID,
    Amount,
    Method,
    TO_CHAR(PaymentDate, 'DD-MM-YYYY') AS PaymentDate,
    TO_CHAR(PaymentTime, 'HH24:MI:SS') AS PaymentTime,
    Status
FROM Payment;
