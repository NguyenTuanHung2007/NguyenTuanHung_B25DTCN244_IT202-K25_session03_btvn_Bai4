CREATE TABLE OrderList (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATETIME,
    total_price DECIMAL(18, 2),
    delivery_status VARCHAR(20),
    is_deleted BIT DEFAULT 0
);

INSERT INTO OrderList (customer_name, order_date, total_price, delivery_status) 
VALUES
    ('Nguyễn Văn A', '2023-01-10', 500000, 'Completed'),
    ('Khách hàng vãng lai', '2023-02-15', 1200000, 'Canceled'),
    ('Trần Thị B', '2023-05-20', 300000, 'Canceled'),
    ('Lê Văn C', '2024-01-05', 850000, 'Completed');

CREATE TABLE OrderHistory (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME,
    total_price DECIMAL(18, 2),
    delivery_status VARCHAR(20)
);

INSERT INTO OrderHistory (id, customer_name, order_date, total_price, delivery_status)
SELECT id, customer_name, order_date, total_price, delivery_status
FROM OrderList
WHERE delivery_status = 'Canceled';

DELETE FROM OrderList 
WHERE delivery_status = 'Canceled';

SELECT * FROM OrderList;
SELECT * FROM OrderHistory;