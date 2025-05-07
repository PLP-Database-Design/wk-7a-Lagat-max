USE lagatdb;

-- Create the ProductDetail table --
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

-- my sample data --
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES 
    (101, 'John Doe', 'Laptop, Mouse'),
    (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
    (103, 'Emily Clark', 'Phone');



-- Question 1 answer --
SELECT 
    OrderID,
    CustomerName,
    'Laptop' AS Product
FROM ProductDetail
WHERE Products LIKE '%Laptop%'
UNION ALL
SELECT 
    OrderID,
    CustomerName,
    'Mouse'
FROM ProductDetail
WHERE Products LIKE '%Mouse%'
UNION ALL
SELECT 
    OrderID,
    CustomerName,
    'Tablet'
FROM ProductDetail
WHERE Products LIKE '%Tablet%'
UNION ALL
SELECT 
    OrderID,
    CustomerName,
    'Keyboard'
FROM ProductDetail
WHERE Products LIKE '%Keyboard%'
UNION ALL
SELECT 
    OrderID,
    CustomerName,
    'Phone'
FROM ProductDetail
WHERE Products LIKE '%Phone%';

-- Question 2 answer creating orderDetails --

CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

-- my sample data --
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES 
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);



-- My Orders table --
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- My Order_Products table --
CREATE Order_Products (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Filling my Orders table --
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Filling my Order_Products table --
INSERT INTO Order_Products (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;