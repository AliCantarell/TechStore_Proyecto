
INSERT INTO categorias (nombre) VALUES ('Componentes Electrónicos'), ('Microcontroladores'), ('Sensores');


INSERT INTO productos (nombre, marca, modelo, precio_venta, id_categoria, url_imagen) 
VALUES 
('Arduino Uno', 'Arduino', 'R3', 250.00, 2, 'https://ejemplo.com/arduino.jpg'),
('Resistencia 10k', 'Generic', '1/4W', 1.50, 1, 'https://ejemplo.com/resistencia.jpg'),
('Sensor Ultrasonico', 'HC-SR04', 'V1', 45.00, 3, 'https://ejemplo.com/sensor.jpg');



-
DELETE FROM productos;
DELETE FROM categorias;