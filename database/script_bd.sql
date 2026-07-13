
CREATE DATABASE IF NOT EXISTS techstore_db;
USE techstore_db;


CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    precio_venta DECIMAL(10, 2),
    id_categoria INT,
    url_imagen VARCHAR(500),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;