USE pizzeria;
INSERT INTO tipo_producto (nombre)
VALUES('Pizza'), ('Bebidas')

INSERT INTO productos (tipo_id,nombre, presentación, precio)
VALUES(1,'Marinera', 'Mediano', 80), 
(1,'Desgraciada', 'Pequeño', 120), 
(2,'Gasimba', 'Grande', 20),
(2,'Jugo de basura', 'Pequeño', 10),
(1,'Marranera', 'Pequeño', 200)