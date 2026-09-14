DROP TABLE IF EXISTS Payment, OrderItem, "Order", Product, Customer, Category CASCADE;


-- =====================================================
-- 2. CREATE CATEGORY TABLE
-- =====================================================

CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255)
);


-- =====================================================
-- 3. CREATE CUSTOMER TABLE
-- =====================================================

CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(255),
    Password VARCHAR(100) NOT NULL
);


-- =====================================================
-- 4. CREATE PRODUCT TABLE
-- =====================================================

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Stock INT NOT NULL CHECK (Stock >= 0),
    CategoryID INT NOT NULL,

    CONSTRAINT fk_product_category
        FOREIGN KEY (CategoryID)
        REFERENCES Category(CategoryID)
);


-- =====================================================
-- 5. CREATE ORDER TABLE
-- =====================================================

CREATE TABLE "Order" (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTime TIME NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),

    CONSTRAINT fk_order_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);


-- =====================================================
-- 6. CREATE ORDER ITEM TABLE
-- =====================================================

CREATE TABLE OrderItem (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),

    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (OrderID)
        REFERENCES "Order"(OrderID),

    CONSTRAINT fk_orderitem_product
        FOREIGN KEY (ProductID)
        REFERENCES Product(ProductID)
);


-- =====================================================
-- 7. CREATE PAYMENT TABLE
-- =====================================================

CREATE TABLE Payment (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    Method VARCHAR(50) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentTime TIME NOT NULL,
    Status VARCHAR(50) NOT NULL,

    CONSTRAINT fk_payment_order
        FOREIGN KEY (OrderID)
        REFERENCES "Order"(OrderID)
);


