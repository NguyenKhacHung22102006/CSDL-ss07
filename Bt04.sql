DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE `orders` (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
INSERT INTO customers (id, name, email) VALUES
(1, 'Nguyen Van A', 'a@gmail.com'),
(2, 'Tran Thi B', 'b@gmail.com'),
(3, 'Le Van C', 'c@gmail.com'),
(4, 'Pham Thi D', 'd@gmail.com'),
(5, 'Hoang Van E', 'e@gmail.com');

INSERT INTO `orders` (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 500000),
(2, 1, '2025-01-03', 800000),
(3, 2, '2025-01-04', 1200000),
(4, 3, '2025-01-05', 300000),
(5, 3, '2025-01-06', 600000),
(6, 5, '2025-01-07', 1500000);

SELECT 
    name AS customer_name,
    (
        SELECT COUNT(*)
        FROM `orders`
        WHERE `orders`.customer_id = customers.id
    ) AS order_count
FROM customers;
