DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
) ENGINE=InnoDB;

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

INSERT INTO products (id, name, price) VALUES
(1, 'Laptop Gaming', 25000000),
(2, 'Chuột không dây', 150000),
(3, 'Bàn phím cơ', 800000),
(4, 'Màn hình 24 inch', 3500000),
(5, 'Tai nghe Bluetooth', 500000),
(6, 'Lót chuột', 50000),
(7, 'USB 32GB', 120000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 1, 1),
(104, 4, 2),
(105, 5, 1),
(106, 2, 1);

SELECT id, name, price
FROM products
WHERE id IN (
    SELECT product_id
    FROM order_items
);
