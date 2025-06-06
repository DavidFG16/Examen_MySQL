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


-- Añadir ingredientes adicionales a una pizza en un pedido:** -- La verdad no sé
INSERT INTO detalle_pedido (pedido_id, producto_id, ingrediente_id, cantidad, precio_unitario)
VALUES(1, 2, 1, 3, 350)


-- Consultar el detalle de un pedido (productos y sus ingredientes):
SELECT dp.pedido_id, pro.nombre AS Producto, ing.nombre AS Ingrediente
FROM detalle_pedido AS dp
JOIN productos AS pro ON dp.producto_id = pro.producto_id
JOIN ingredientes AS ing ON dp.ingrediente_id = ing.ingrediente_id


-- Actualizar el precio de una pizza en el menú:
UPDATE productos SET precio = 500 WHERE producto_id = 3 AND tipo_id = 1


-- Actualizar la dirección de un cliente:*
UPDATE clientes SET direccion = 'Ruitoque Alto basuritas' WHERE cliente_id = 1;

-- Eliminar un producto del menú (bebida):
DELETE FROM productos WHERE tipo_id = 2

-- Eliminar un ingrediente de la base de datos:

DELETE FROM ingredientes WHERE ingrediente_id = 1

-- Consultar todos los pedidos de un cliente:

SELECT p.pedido_id, c.nombre
FROM pedido AS p
JOIN clientes AS c ON p.cliente_id = c.cliente_id;


-- Listar todos los productos disponibles en el menú (pizzas y bebidas):

SELECT * FROM productos

-- Listar todos los ingredientes disponibles para personalizar una pizza:
SELECT * FROM ingredientes


