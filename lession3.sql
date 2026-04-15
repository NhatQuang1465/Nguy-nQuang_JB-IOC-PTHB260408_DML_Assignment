CREATE TABLE lession3.students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    birth_year INT,
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);

INSERT INTO lession3.students (full_name, gender, birth_year, major, gpa) VALUES
('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
('Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
('Lưu Đức Tài', NULL, 2004, 'Cơ khí', NULL),
('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

INSERT INTO lession3.students (full_name, gender, birth_year, major, gpa)
VALUES ('Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

--Cập nhật GPA
UPDATE lession3.students
SET gpa = 3.4
WHERE full_name = 'Lê Quốc Cường';

-- Xóa sinh viên có GPA NULL
DELETE FROM lession3.students
WHERE gpa IS NULL;

-- Hiển thị sinh viên CNTT có GPA >= 3.0 (lấy 3 dòng đầu)
SELECT *
FROM lession3.students
WHERE major = 'CNTT' AND gpa >= 3.0
LIMIT 3;

-- Danh sách ngành học duy nhất
SELECT DISTINCT major
FROM lession3.students;

--Sắp xếp: CNTT, GPA giảm dần, tên tăng dần
SELECT *
FROM lession3.students
WHERE major = 'CNTT'
ORDER BY gpa DESC, full_name ASC;
--Tìm tên bắt đầu bằng "Nguyễn"
SELECT *
FROM lession3.students
WHERE full_name LIKE 'Nguyễn%';

-- không phân biệt hoa thường
SELECT *
FROM lession3.students
WHERE full_name ILIKE 'nguyễn%';

-- Sinh viên có năm sinh từ 2001 đến 2003
SELECT *
FROM lession3.students
WHERE birth_year BETWEEN 2001 AND 2003;