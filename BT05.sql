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
(2, 1, '2025-01-02', 800000),
(3, 2, '2025-01-03', 1200000),
(4, 2, '2025-01-04', 700000),
(5, 3, '2025-01-05', 300000),
(6, 4, '2025-01-06', 2000000),
(7, 4, '2025-01-07', 1500000),
(8, 5, '2025-01-08', 900000);
SELECT name, email
FROM customers
WHERE id = (
    SELECT customer_id
    FROM `orders`
    GROUP BY customer_id
    HAVING SUM(total_amount) = (
        SELECT MAX(total_per_customer)
        FROM (
            SELECT SUM(total_amount) AS total_per_customer
            FROM `orders`
            GROUP BY customer_id
        ) AS temp
    )
);
