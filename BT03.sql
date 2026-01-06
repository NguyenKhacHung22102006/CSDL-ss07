DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO `orders` (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 500000),
(2, 2, '2025-01-02', 1200000),
(3, 3, '2025-01-03', 800000),
(4, 4, '2025-01-04', 2000000),
(5, 5, '2025-01-05', 1500000),
(6, 2, '2025-01-06', 300000);

SELECT *
FROM `orders`
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM `orders`
);
