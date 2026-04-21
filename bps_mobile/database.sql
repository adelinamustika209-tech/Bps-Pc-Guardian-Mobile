CREATE DATABASE IF NOT EXISTS bps_db;
USE bps_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

INSERT INTO users (email, password, role) VALUES
('admin@bps.go.id', 'password123', 'Admin'),
('pimpinan@bps.go.id', 'password123', 'Pimpinan'),
('teknisi@bps.go.id', 'password123', 'Teknisi'),
('barang@bps.go.id', 'password123', 'Pengelola Barang'),
('ruangan@bps.go.id', 'password123', 'Pengelola Ruangan'),
('user@bps.go.id', 'password123', 'User');
