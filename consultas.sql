USE pizzeria;
-- Registrar un nuevo cliente
INSERT INTO clientes (nombre, telefono, direccion) 
VALUES('David Fernando Gamboa Castellanos',321638543, 'Calle 3#15-63')

-- Agregar un nuevo producto (pizza) al menú:

INSERT INTO productos (tipo_id,nombre, presentación, precio)
VALUES(1,'Marinera', 'Mediano', 80)

-- Registrar una bebida en el menú:
INSERT INTO productos (tipo_id,nombre, presentación, precio)
VALUES(2,'Chimbosi Jugo', 'Grande', 300)

-- Agregar un ingrediente a la base de datos:
INSERT INTO ingredientes (nombre, precio)
VALUES('Honguitos', 4) 

-- Crear un pedido para un cliente:

INSERT INTO pedido (cliente_id, hora_recogida)
VALUES(1, '2025-06-10 12:34:12')

INSERT INTO detalle_pedido (pedido_id, producto_id, ingrediente_id, cantidad, precio_unitario)
VALUES(1, 1, 1, 2, 350)

--Añadir productos a un pedido específico:
UPDATE detalle_pedido SET producto_id = 2 WHERE pedido_id = 1
-- No estaba seguro pero creo que las 2 maneras son validas
INSERT INTO detalle_pedido (pedido_id, producto_id, ingrediente_id, cantidad, precio_unitario)
VALUES(1, 2, 1, 2, 350)


-- Añadir ingredientes adicionales a una pizza en un pedido:**
INSERT INTO detalle_pedido (pedido_id, producto_id, ingrediente_id, cantidad, precio_unitario)
VALUES(1, 2, 1, 2, 350)



