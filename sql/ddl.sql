DROP TABLE IF EXISTS Payment, OrderItem, "Order", Product, Customer, Category CASCADE;

-- 1. Category Table
CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

-- 2. Customer Table
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(255),
    Password VARCHAR(100) NOT NULL,
    CONSTRAINT chk_email CHECK (Email LIKE '%@%.%')
);

-- 3. Product Table
CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL DEFAULT 0 CHECK (Stock >= 0),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);

-- 4. Order Table
CREATE TABLE "Order" (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (
        Status IN ('Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled')
    ),
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

-- 5. OrderItem Table
CREATE TABLE OrderItem (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice > 0),
    FOREIGN KEY (OrderID) REFERENCES "Order" (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

-- 6. Payment Table
CREATE TABLE Payment (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    Method VARCHAR(30) NOT NULL CHECK (
        Method IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash on Delivery')
    ),
    PaymentDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (
        Status IN ('Pending', 'Completed', 'Failed', 'Refunded')
    ),
    FOREIGN KEY (OrderID) REFERENCES "Order" (OrderID)
);
