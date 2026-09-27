-- 1. Tạo cơ sở dữ liệu autoride_db
CREATE DATABASE autoride_db;
USE autoride_db;

-- 2. Tạo bảng Khách hàng (users)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

-- 3. Tạo bảng Xe (vehicles)
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(50) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    status VARCHAR(20) DEFAULT 'available'
);

-- 4. Tạo bảng Thuê xe (rentals) chứa cột damage_fee bắt buộc
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    rental_date DATETIME NOT NULL,
    return_date DATETIME,
    damage_fee DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- 5. Chèn dữ liệu mô phỏng (DML)
INSERT INTO users (fullname, email, phone) VALUES 
('Nguyen Van A', 'anguyen@email.com', '0912345678'),
('Tran Thi B', 'btran@email.com', '0987654321');

INSERT INTO vehicles (model, license_plate) VALUES 
('Toyota Vios', '30A-12345'),
('Honda City', '30K-67890');

-- Mô phỏng 1 chuyến không có phí hư hại và 1 chuyến có phí hư hại
INSERT INTO rentals (user_id, vehicle_id, rental_date, return_date, damage_fee) VALUES 
(1, 1, '2026-09-20 08:00:00', '2026-09-21 17:00:00', 0.00),
(2, 2, '2026-09-22 09:00:00', '2026-09-23 10:00:00', 500000.00);
