-- ==========================================
-- E-Commerce Order Management System
-- Database Creation
-- ==========================================

CREATE DATABASE ecommerce;
USE ecommerce;

-- ==========================================
-- CUSTOMER TABLE
-- ==========================================

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL
);

-- ==========================================
-- SUPPLIER TABLE
-- ==========================================

CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    City VARCHAR(50) NOT NULL
);

-- ==========================================
-- PRODUCT TABLE
-- ==========================================

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL CHECK (Stock >= 0),
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID)
        REFERENCES Supplier(Supplier_ID)
);

-- ==========================================
-- ORDERS TABLE
-- ==========================================

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE NOT NULL,
    Order_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

-- ==========================================
-- ORDER DETAILS TABLE
-- ==========================================

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Unit_Price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

-- ==========================================
-- PAYMENT TABLE
-- ==========================================

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Method VARCHAR(30) NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);

-- ==========================================
-- SHIPMENT TABLE
-- ==========================================

CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Courier_Name VARCHAR(50) NOT NULL,
    Tracking_Number VARCHAR(50) UNIQUE,
    Shipment_Date DATE,
    Delivery_Date DATE,
    Shipment_Status VARCHAR(20) NOT NULL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);

-- ==========================================
-- SHOW TABLES
-- ==========================================

SHOW TABLES;

-- ==========================================
-- DESCRIBE TABLES
-- ==========================================

DESC Customer;
DESC Supplier;
DESC Product;
DESC Orders;
DESC Order_Details;
DESC Payment;
DESC Shipment;
