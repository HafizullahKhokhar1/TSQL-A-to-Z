-- Topic: Sample tables
-- Goal: Create a reusable practice schema for the lessons.
-- Prerequisite: Run 00_create_database.sql first.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) CONSTRAINT PK_Customers PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(120) NOT NULL,
    City NVARCHAR(60) NOT NULL,
    StateCode CHAR(2) NOT NULL
);

CREATE TABLE dbo.Products
(
    ProductID INT IDENTITY(1,1) CONSTRAINT PK_Products PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL CONSTRAINT CK_Products_UnitPrice CHECK (UnitPrice > 0)
);

CREATE TABLE dbo.Orders
(
    OrderID INT IDENTITY(1,1) CONSTRAINT PK_Orders PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID)
);

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT IDENTITY(1,1) CONSTRAINT PK_OrderItems PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CONSTRAINT CK_OrderItems_Quantity CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO

INSERT INTO dbo.Customers (FullName, Email, City, StateCode)
VALUES
('Ayesha Khan', 'ayesha@example.com', 'Lahore', 'PB'),
('Bilal Ahmed', 'bilal@example.com', 'Karachi', 'SD'),
('Hina Malik', 'hina@example.com', 'Islamabad', 'IS'),
('Usman Shah', 'usman@example.com', 'Faisalabad', 'PB');

INSERT INTO dbo.Products (ProductName, Category, UnitPrice)
VALUES
('SQL Fundamentals Book', 'Books', 24.99),
('Practice Workbook', 'Books', 14.99),
('Monitor 24-inch', 'Hardware', 149.50),
('Keyboard Mechanical', 'Hardware', 79.00),
('Database Stickers Pack', 'Accessories', 9.99);

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-01-05', 'Shipped'),
(1, '2026-01-18', 'Open'),
(2, '2026-01-12', 'Shipped'),
(3, '2026-01-20', 'Cancelled'),
(4, '2026-01-22', 'Open');

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 24.99),
(1, 5, 2, 9.99),
(2, 3, 1, 149.50),
(3, 2, 3, 14.99),
(3, 4, 1, 79.00),
(4, 1, 1, 24.99),
(5, 5, 5, 9.99);
GO

SELECT 'Customers' AS TableName, COUNT(*) AS RowCount FROM dbo.Customers
UNION ALL
SELECT 'Products', COUNT(*) FROM dbo.Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM dbo.Orders
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM dbo.OrderItems;
GO

-- Exercises
-- 1. Add one more customer from a city not already listed.
-- 2. Add a new product in a different category.
-- 3. Insert one new order and two order items.
