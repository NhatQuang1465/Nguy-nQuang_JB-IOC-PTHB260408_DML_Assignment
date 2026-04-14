CREATE TABLE customers(
customer_id SERIAL PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100) UNIQUE,
phone VARCHAR(12),
city VARCHAR(100),
join_date DATE
);

CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(100),
price NUMERIC(10,2),
stock_quantity INT
);


CREATE TABLE orders(
order_id SERIAL PRIMARY KEY,
customer_id INT REFERENCES customers(customer_id),
order_date DATE,
total_amount NUMERIC(10,2),
status VARCHAR(20)
);

INSERT INTO customers (full_name, email, phone, city, join_date) VALUES
('Nguyen Van A', 'a@gmail.com', '0123456789', 'Ha Noi', '2024-01-01'),
('Tran Thi B', 'b@gmail.com', NULL, 'Hai Phong', '2024-02-01'),
('Le Van C', 'c@gmail.com', '0987654321', 'Da Nang', '2024-03-01'),
('Pham Thi D', 'd@gmail.com', NULL, 'Ha Noi', '2024-01-15'),
('Hoang Van E', 'e@gmail.com', '0911222333', 'Hue', '2024-04-01'),
('Nguyen Van F', 'f@gmail.com', '0933444555', 'Ha Noi', '2024-05-01'),
('Tran Van G', 'g@gmail.com', NULL, 'HCM', '2024-06-01'),
('Le Thi H', 'h@gmail.com', '0900111222', 'Da Nang', '2024-02-20'),
('Pham Van I', 'i@gmail.com', NULL, 'Hue', '2024-03-10'),
('Hoang Thi K', 'k@gmail.com', '0988999888', 'Ha Noi', '2024-01-25');
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('iPhone 15', 'Electronics', 2000, 10),
('Samsung TV', 'Electronics', 1500, 5),
('Laptop Dell', 'Electronics', 1200, 0),
('T-shirt', 'Clothing', 20, 100),
('Jeans', 'Clothing', 40, 50),
('Jacket', 'Clothing', 80, 0),
('Rice', 'Food', 10, 200),
('Milk', 'Food', 5, 150),
('Bread', 'Food', 2, 0),
('Headphone', 'Electronics', 200, 20),
('Keyboard', 'Electronics', 100, 15),
('Shoes', 'Clothing', 60, 30),
('Hat', 'Clothing', 15, 25),
('Coffee', 'Food', 8, 60),
('Tea', 'Food', 6, 70);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-05-01', 2000, 'PENDING'),
(2, '2024-05-02', 1500, 'CONFIRMED'),
(3, '2024-05-03', 1200, 'PENDING'),
(1, '2024-05-04', 100, 'SHIPPED'),
(4, '2024-05-05', 300, 'PENDING'),
(5, '2024-05-06', 50, 'CANCELLED'),
(6, '2024-05-07', 700, 'PENDING'),
(7, '2024-05-08', 900, 'CONFIRMED');
INSERT INTO orders(order_date, total_amount, status) VALUES
('2024-05-08', 100, 'CONFIRMED');


UPDATE products SET price = price * (1 + 0.1)
WHERE category = 'Electronics';

UPDATE customers SET phone = '0133456897' 
WHERE email = 'b@gmail.com'

UPDATE orders SET status = 'CONFIRMED'
WHERE status = 'PENDING';

DELETE FROM products
WHERE stock_quantity = 0;

DELETE FROM customers c
WHERE NOT EXISTS( 
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
);
-- Tìm khách hàng theo tên
SELECT * FROM customers WHERE full_name ILIKE '%A';
-- Lọc sản phẩm theo khoảng giá
SELECT * FROM products WHERE price BETWEEN 0 AND 100;
-- Tìm khách hàng chưa có số điện thoại
SELECT * FROM customers WHERE phone IS NULL;
--Top 5 sản phẩm có giá cao nhất
SELECT * FROM products ORDER BY price DESC LIMIT 5;
--Phân trang danh sách đơn hàng 
SELECT * FROM orders LIMIT 4 OFFSET 4;
--Đếm số khách hàng theo thành phố
SELECT DISTINCT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
--Tìm đơn hàng trong khoảng thời gian
SELECT * FROM orders WHERE order_date BETWEEN '2024-05-01' AND '2024-05-05';






