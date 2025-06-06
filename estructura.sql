CREATE DATABASE pizzeria;
DROP DATABASE IF EXISTS pizzeria;

USE pizzeria;

CREATE TABLE `clientes`(
    `cliente_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `telefono` INT NOT NULL,
    `direccion` VARCHAR(255) NOT NULL
);

ALTER TABLE `clientes` MODIFY COLUMN `telefono` BIGINT(10) NOT NULL

CREATE TABLE `productos`(
    `producto_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo_id` INT(11) NOT NULL,
    `nombre` VARCHAR(255) NOT NULL,
    `presentación` VARCHAR(255) NOT NULL,
    `precio` BIGINT NOT NULL
);

ALTER TABLE `productos` MODIFY COLUMN `presentación` ENUM('Pequeño', 'Mediano', 'Grande') NOT NULL

CREATE TABLE `combos`(
    `combo_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` BIGINT NOT NULL
);
CREATE TABLE `pedido`(
    `pedido_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` INT(11) NOT NULL,
    `hora_recogida` DATETIME NOT NULL,
    `estado` ENUM('') NOT NULL
);

ALTER TABLE `pedido` MODIFY COLUMN `estado` ENUM('Pendiente','Procesando','Enviado','Entregado','Cancelado') NOT NULL DEFAULT 'Pendiente'

CREATE TABLE `detalle_pedido`(
    `detalle_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pedido_id` INT(11) NOT NULL,
    `producto_id` INT(11) NOT NULL,
    `ingrediente_id` INT(11) NOT NULL,
    `cantidad` BIGINT NOT NULL,
    `precio_unitario` BIGINT NOT NULL
);

ALTER TABLE detalle_pedido MODIFY COLUMN ingrediente_id INT(11) DEFAULT NULL

CREATE TABLE `tipo_producto`(
    `tipo_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL
);
CREATE TABLE `ingredientes`(
    `ingrediente_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `precio` BIGINT NOT NULL
);
CREATE TABLE `detalle_combo`(
    `detalle_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `producto_id` INT(11) NOT NULL,
    `combo_id` INT(11) NOT NULL
);
CREATE TABLE `pago`(
    `pago_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pedido_id` INT(11) NOT NULL
);
ALTER TABLE
    `detalle_pedido` ADD INDEX `detalle_pedido_pedido_id_index`(`pedido_id`);
ALTER TABLE
    `detalle_pedido` ADD INDEX `detalle_pedido_producto_id_index`(`producto_id`);

ALTER TABLE productos ADD CONSTRAINT productos_tipo_id_foreign FOREIGN KEY(tipo_id) REFERENCES tipo_producto(tipo_id);
ALTER TABLE `detalle_combo` ADD CONSTRAINT `detalle_combo_combo_id_foreign` FOREIGN KEY(`combo_id`) REFERENCES `combos`(`combo_id`);
ALTER TABLE
    `pago` ADD CONSTRAINT `pago_pedido_id_foreign` FOREIGN KEY(`pedido_id`) REFERENCES `pedido`(`pedido_id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `clientes`(`cliente_id`);
ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_ingrediente_id_foreign` FOREIGN KEY(`ingrediente_id`) REFERENCES `ingredientes`(`ingrediente_id`);
ALTER TABLE
    `detalle_combo` ADD CONSTRAINT `detalle_combo_producto_id_foreign` FOREIGN KEY(`producto_id`) REFERENCES `productos`(`producto_id`);
ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_pedido_id_foreign` FOREIGN KEY(`pedido_id`) REFERENCES `pedido`(`pedido_id`);
ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_producto_id_foreign` FOREIGN KEY(`producto_id`) REFERENCES `productos`(`producto_id`);