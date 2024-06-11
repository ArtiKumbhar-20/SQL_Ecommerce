use ecommerce_platform;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(15)
);

DESC customers;
-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(15),
    price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

-- Create cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products table
INSERT INTO products (product_id, name, description, price, stockQuantity)
VALUES
    (1, 'Laptop', 'High-performance laptop', 1600.00, 5),
    (2, 'Smartphone', 'Latest smartphone', 800.00, 10),
    (3, 'Tablet', 'Portable tablet', 600.00, 15),
    (4, 'Headphones', 'Noise-canceling', 300.00, 20),
    (5, 'TV', '4K Smart TV', 150.00, 30),
    (6, 'Coffee Maker', 'Automatic coffee maker', 900.00, 5),
    (7, 'Refrigerator', 'Energy-efficient', 800.00, 10),
    (8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
    (9, 'Blender', 'High-speed blender', 70.00, 20),
    (10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

-- ADD address column in customer table
ALTER TABLE customers 
ADD COLUMN address VARCHAR(255);

-- Insert data into customers table
INSERT INTO customers (customer_id, name, email, password, address)
VALUES
    (1, 'John Doe', 'johndoe@example.com', 'password1', '123 Main St, City'),
    (2, 'Jane Smith', 'janesmith@example.com', 'password2', '456 Elm St, Town'),
    (3, 'Robert Johnson', 'robert@example.com', 'password3', '789 Oak St, Village'),
    (4, 'Sarah Brown', 'sarah@example.com', 'password4', '101 Pine St, Suburb'),
    (5, 'David Lee', 'david@example.com', 'password5', '234 Cedar St, District'),
    (6, 'Laura Hall', 'laura@example.com', 'password6', '567 Birch St, County'),
    (7, 'Michael Davis', 'michael@example.com', 'password7', '890 Maple St, State'),
    (8, 'Emma Wilson', 'emma@example.com', 'password8', '321 Redwood St, Country'),
    (9, 'William Taylor', 'william@example.com', 'password9', '432 Spruce St, Province'),
    (10, 'Olivia Adams', 'olivia@example.com', 'password10', '765 Fir St, Territory');


-- Inserting data into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_price)
VALUES
    (1, 1, '2023-01-05', 1200.00),
    (2, 2, '2023-02-10', 900.00),
    (3, 3, '2023-03-15', 300.00),
    (4, 4, '2023-04-20', 150.00),
    (5, 5, '2023-05-25', 1800.00),
    (6, 6, '2023-06-30', 400.00),
    (7, 7, '2023-07-05', 700.00),
    (8, 8, '2023-08-10', 160.00),
    (9, 9, '2023-09-15', 140.00),
    (10, 10, '2023-10-20', 1400.00);

ALTER TABLE order_items DROP COLUMN item_amount;

ALTER TABLE order_items
ADD COLUMN itemAmount DECIMAL(10, 2);

-- Inserting data into the Order Items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, itemAmount)
VALUES
    (1, 1, 1, 2, 1600.00),
    (2, 1, 3, 1, 300.00),
    (3, 2, 2, 3, 1800.00),
    (4, 3, 5, 2, 1800.00),
    (5, 4, 4, 4, 600.00),
    (6, 4, 6, 1, 50.00),
    (7, 5, 1, 1, 800.00),
    (8, 5, 2, 2, 1200.00),
    (9, 6, 10, 2, 240.00),
    (10, 6, 9, 3, 210.00);

-- Insert data into cart table
INSERT INTO cart (cart_id, customer_id, product_id, quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 3, 1),
    (3, 2, 2, 3),
    (4, 3, 4, 4),
    (5, 3, 5, 2),
    (6, 4, 6, 1),
    (7, 5, 1, 1),
    (8, 6, 10, 2),
    (9, 6, 9, 3),
    (10, 7, 7, 2);

ALTER TABLE customers
ADD COLUMN firstName VARCHAR(255),
ADD COLUMN lastName VARCHAR(255);

ALTER TABLE customers DROP COLUMN name;

-- Update firstName and lastName based on provided data
UPDATE customers SET firstName = 'John', lastName = 'Doe' WHERE customer_id = 1;
UPDATE customers SET firstName = 'Jane', lastName = 'Smith' WHERE customer_id = 2;
UPDATE customers SET firstName = 'Robert', lastName = 'Johnson' WHERE customer_id = 3;
UPDATE customers SET firstName = 'Sarah', lastName = 'Brown' WHERE customer_id = 4;
UPDATE customers SET firstName = 'David', lastName = 'Lee' WHERE customer_id = 5;
UPDATE customers SET firstName = 'Laura', lastName = 'Hall' WHERE customer_id = 6;
UPDATE customers SET firstName = 'Michael', lastName = 'Davis' WHERE customer_id = 7;
UPDATE customers SET firstName = 'Emma', lastName = 'Wilson' WHERE customer_id = 8;
UPDATE customers SET firstName = 'William', lastName = 'Taylor' WHERE customer_id = 9;
UPDATE customers SET firstName = 'Olivia', lastName = 'Adams' WHERE customer_id = 10;

-- Queries -------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Update refrigerator product price to 800.
UPDATE products 
SET price = 800.00 
WHERE product_id = 7;

-- 2. Remove all cart items for a specific customer. 
DELETE FROM cart
WHERE customer_id = 10;

-- 3. Retrieve Products Priced Below $100. 
SELECT *
FROM products
WHERE price < 100.00;

-- 4. Find Products with Stock Quantity Greater Than 5. 
SELECT *
FROM products
WHERE stockQuantity > 5;

-- 5. Retrieve Orders with Total Amount Between $500 and $1000. 
SELECT *
FROM orders
WHERE total_price BETWEEN 500.00 AND 1000.00;

-- 6. Find Products which name end with letter ‘r’. 
SELECT *
FROM products
WHERE name LIKE '%r';

-- 7. Retrieve Cart Items for Customer 5. 
SELECT *
FROM cart
WHERE customer_id = 5;

-- 8. Find Customers Who Placed Orders in 2023. 
SELECT DISTINCT c.customer_id,c.name, o.order_date 
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(order_date) = 2023;

-- 9. Determine the Minimum Stock Quantity for Each Product Category. 
SELECT product_id, name, MIN(stockQuantity) AS min_stock
FROM products
GROUP BY product_id;


-- 10. Calculate the Total Amount Spent by Each Customer. 
SELECT c.customer_id, c.name , SUM(o.total_price) AS total_amount_spent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 11. Find the Average Order Amount for Each Customer. 
SELECT c.customer_id, c.name , AVG(o.total_price) AS total_amount_spent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 12. Count the Number of Orders Placed by Each Customer.
SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id;
 
-- 13. Find the Maximum Order Amount for Each Customer. 
SELECT customer_id, MAX(total_price) AS max_order_amount
FROM orders
GROUP BY customer_id;


-- 14. Get Customers Who Placed Orders Totaling Over $1000. 
SELECT DISTINCT c.customer_id, c.name, total_price
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_price > 1000.00;

-- 15. Subquery to Find Products Not in the Cart. 
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM cart
);

-- 16. Subquery to Find Customers Who Haven't Placed Orders. 
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM orders
);

-- 17. Subquery to Calculate the Percentage of Total Revenue for a Product. 
SELECT oi.product_id,
       (SUM(oi.quantity * p.price) / (SELECT SUM(total_price) FROM orders)) * 100 AS revenue_percentage
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id;

-- 18. Subquery to Find Products with Low Stock. 
SELECT *
FROM products
WHERE stockQuantity < 10;

-- 19. Subquery to Find Customers Who Placed High-Value Orders. 
SELECT DISTINCT customer_id, name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_price > 1000.00);

DESC products;
DESC orders;
DESC cart;