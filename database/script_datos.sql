-- ========================================================
-- FASE II: SCRIPT DE DATOS (CONTENIDO)
-- ========================================================

-- === 1. EJECUCIÓN: Insertar productos ===
-- Primero insertamos las categorías
INSERT INTO categorias (nombre) VALUES ('Componentes Electrónicos'), ('Microcontroladores'), ('Sensores');

-- Luego insertamos los productos
INSERT INTO productos (nombre, marca, modelo, precio_venta, id_categoria, url_imagen) 
VALUES 
('Arduino Uno', 'Arduino', 'R3', 250.00, 2, 'https://ejemplo.com/arduino.jpg'),
('Resistencia 10k', 'Generic', '1/4W', 1.50, 1, 'https://ejemplo.com/resistencia.jpg'),
('Sensor Ultrasonico', 'HC-SR04', 'V1', 45.00, 3, 'https://ejemplo.com/sensor.jpg');
-- ... aquí debes continuar con el resto de tus 30 productos siguiendo este mismo formato ...

-- === 2. ROLLBACK: Limpiar datos ===
-- Borramos los registros sin destruir la estructura de las tablas
DELETE FROM productos;
DELETE FROM categorias;