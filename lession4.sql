CREATE TABLE lession4.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price BIGINT,
    stock INT,
    manufacturer VARCHAR(50)
);

INSERT INTO lession4.products (name, category, price, stock, manufacturer) VALUES
('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

INSERT INTO lession4.products (name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

-- Tăng giá sản phẩm Apple thêm 10%
UPDATE lession4.products
SET price = price * 1.1
WHERE manufacturer = 'Apple';

-- Xóa sản phẩm có stock = 0
DELETE FROM lession4.products
WHERE stock = 0;

-- Lọc sản phẩm có giá từ 1tr đến 30tr
SELECT *
FROM lession4.products
WHERE price BETWEEN 1000000 AND 30000000;

-- Sản phẩm có stock NULL
SELECT *
FROM lession4.products
WHERE stock IS NULL;

-- Danh sách hãng sản xuất duy nhất
SELECT DISTINCT manufacturer
FROM lession4.products;

-- Sắp xếp: giá giảm dần, tên tăng dần
SELECT *
FROM lession4.products
ORDER BY price DESC, name ASC;

-- Tìm sản phẩm chứa "laptop" (không phân biệt hoa thường)
SELECT *
FROM lession4.products
WHERE name ILIKE '%laptop%';

-- Lấy 2 sản phẩm đắt nhất
SELECT *
FROM lession4.products
ORDER BY price DESC
LIMIT 2;