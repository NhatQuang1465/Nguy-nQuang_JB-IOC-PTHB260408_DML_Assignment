CREATE TABLE lession5.employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    position VARCHAR(50),
    salary BIGINT,
    bonus BIGINT,
    join_year INT
);

INSERT INTO lession5.employees (full_name, department, position, salary, bonus, join_year) VALUES
('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
('Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
('Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
('Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
('Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
('Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

DELETE FROM lession5.employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM lession5.employees
    GROUP BY full_name, department, position
);

-- Tăng 10% lương cho IT có lương < 18 triệu
UPDATE lession5.employees
SET salary = salary * 1.1
WHERE department = 'IT' AND salary < 18000000;

-- Set bonus = 500000 nếu NULL
UPDATE lession5.employees
SET bonus = 500000
WHERE bonus IS NULL;

-- Truy vấn phức hợp
SELECT *,
       (salary + bonus) AS total_income
FROM lession5.employees
WHERE department IN ('IT', 'HR')
  AND join_year > 2020
  AND (salary + bonus) > 15000000
ORDER BY total_income DESC
LIMIT 3;

-- Tìm tên bắt đầu "Nguyễn" hoặc kết thúc "Hân"
SELECT *
FROM lession5.employees
WHERE full_name LIKE 'Nguyễn%'
   OR full_name LIKE '%Hân';

-- Phòng ban có ít nhất 1 người có bonus
SELECT DISTINCT department
FROM lession5.employees
WHERE bonus IS NOT NULL;

-- Nhân viên gia nhập từ 2019 đến 2022
SELECT *
FROM lession5.employees
WHERE join_year BETWEEN 2019 AND 2022;