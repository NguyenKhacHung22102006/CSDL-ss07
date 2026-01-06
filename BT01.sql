DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO `orders` (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 500000),
(2, 1, '2025-01-02', 800000),
(3, 2, '2025-01-03', 1200000),
(4, 2, '2025-01-04', 700000),
(5, 3, '2025-01-05', 300000),
(6, 4, '2025-01-06', 2000000),
(7, 5, '2025-01-07', 900000);

SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM `orders`
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_per_customer)
    FROM (
        SELECT SUM(total_amount) AS total_per_customer
        FROM `orders`
        GROUP BY customer_id
    ) AS temp
);
