-- ========================================================
-- FASE II: SCRIPT DE BASE DE DATOS (ESTRUCTURA)
-- ========================================================

-- === 1. EJECUCIÓN: Crear estructura ===
CREATE DATABASE IF NOT EXISTS techstore_db;
USE techstore_db;

-- Tabla de Categorías
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de Productos
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

-- === 2. ROLLBACK: Deshacer cambios (Eliminar estructura) ===
-- Se eliminan en orden inverso para respetar las llaves foráneas
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;