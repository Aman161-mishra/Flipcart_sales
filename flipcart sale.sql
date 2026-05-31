CREATE DATABASE flipkart_sales;
USE flipkart_sales;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
CREATE TABLE order_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
INSERT INTO customers
(customer_name, city, email)
VALUES
('Aman', 'Delhi', 'aman@gmail.com'),
('Rahul', 'Mumbai', 'rahul@gmail.com'),
('Priya', 'Patna', 'priya@gmail.com');
INSERT INTO products
(product_name, category, price)
VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 25000),
('Shoes', 'Fashion', 3000),
('Watch', 'Accessories', 5000);
INSERT INTO orders
(customer_id, order_date)
VALUES
(1, '2025-05-20'),
(2, '2025-05-20'),
(3, '2025-05-21');
INSERT INTO order_details
(order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 3);
SELECT customers.customer_name,
       products.product_name,
       products.category,
       products.price,
       order_details.quantity,
       (products.price * order_details.quantity) AS total_amount
FROM order_details

JOIN orders
ON order_details.order_id = orders.order_id

JOIN customers
ON orders.customer_id = customers.customer_id

JOIN products
ON order_details.product_id = products.product_id;
SELECT SUM(products.price * order_details.quantity) AS total_sales
FROM order_details
JOIN products
ON order_details.product_id = products.product_id;
SELECT products.product_name,
       SUM(order_details.quantity) AS total_quantity
FROM order_details

JOIN products
ON order_details.product_id = products.product_id

GROUP BY products.product_name

ORDER BY total_quantity DESC;	
SELECT products.category,
       SUM(products.price * order_details.quantity) AS total_sales
FROM order_details

JOIN products
ON order_details.product_id = products.product_id

GROUP BY products.category;
SELECT customers.customer_name,
       SUM(products.price * order_details.quantity) AS total_purchase
FROM order_details

JOIN orders
ON order_details.order_id = orders.order_id

JOIN customers
ON orders.customer_id = customers.customer_id

JOIN products
ON order_details.product_id = products.product_id

GROUP BY customers.customer_name;
SELECT * FROM products
ORDER BY price DESC
LIMIT 1;

SELECT customers.customer_name,
       products.product_name,
       products.price,
       order_details.quantity
FROM order_details

JOIN orders
ON order_details.order_id = orders.order_id

JOIN customers
ON orders.customer_id = customers.customer_id

JOIN products
ON order_details.product_id = products.product_id;
SELECT * FROM products;

COMMIT;
SHOW TABLES;
SELECT DATABASE();
SELECT * FROM table_name;