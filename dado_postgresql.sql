-- =====================================================================
-- DADO STREETWEAR - BASE DE DATOS POSTGRESQL (PostgreSQL 14 / 15 / 16)
-- Incluye tabla PROVEEDORES y relacion con PRODUCTOS
-- =====================================================================

-- 1. CREACION DE LA BASE DE DATOS (Opcional si se ejecuta desde consola)
-- CREATE DATABASE dado_db;
-- \c dado_db;

-- Limpieza previa en orden para respetar claves foraneas
DROP TABLE IF EXISTS detalle_pedido CASCADE;
DROP TABLE IF EXISTS pagos CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS carrito_detalle CASCADE;
DROP TABLE IF EXISTS carrito CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS proveedores CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

-- 2. TABLA: PROVEEDORES (Solicitada por el docente)
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(30),
    email VARCHAR(100),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    nit VARCHAR(50) UNIQUE,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO proveedores (id_proveedor, nombre_empresa, contacto, telefono, email, direccion, ciudad, nit, activo) VALUES
(1, 'Textiles Urbanos Colombia S.A.S.', 'Carlos Mendoza', '+57 3105551234', 'ventas@textilesurbanos.co', 'Zona Industrial Puente Aranda #45-12', 'Bogotá', '901.234.567-1', TRUE),
(2, 'Confecciones Streetwear Medellín', 'Mariana Ospina', '+57 3204449876', 'contacto@streetmedellin.com', 'Calle 10 #43E-20, El Poblado', 'Medellín', '900.876.543-2', TRUE),
(3, 'Importadora & Bordados Caps Pro', 'Felipe Arango', '+57 3012223344', 'pedidos@capspro.com.co', 'Carrera 15 #85-30', 'Bogotá', '800.123.456-3', TRUE);

SELECT setval('proveedores_id_proveedor_seq', (SELECT MAX(id_proveedor) FROM proveedores));

-- 3. TABLA: CATEGORIAS
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

INSERT INTO categorias (id_categoria, nombre, descripcion) VALUES
(1, 'Camisetas', 'Camisetas urbanas de algodón premium'),
(2, 'Chaquetas', 'Chaquetas y abrigos streetwear'),
(3, 'Pantalones', 'Jeans, joggers y cargos'),
(4, 'Accesorios', 'Gorras, bolsos y complementos');

SELECT setval('categorias_id_categoria_seq', (SELECT MAX(id_categoria) FROM categorias));

-- 4. TABLA: PRODUCTOS (Con clave foranea a categorias y proveedores)
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    imagen VARCHAR(255),
    id_categoria INTEGER REFERENCES categorias(id_categoria) ON DELETE SET NULL,
    id_proveedor INTEGER REFERENCES proveedores(id_proveedor) ON DELETE SET NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO productos (id_producto, nombre, descripcion, precio, stock, imagen, id_categoria, id_proveedor, activo) VALUES
(1, 'Camiseta Oversize Negra', 'Camiseta oversize 100% algodón, corte urbano.', 69900.00, 40, 'https://picsum.photos/seed/box1/600/700', 1, 1, TRUE),
(2, 'Camiseta Grafiti Blanca', 'Estampado exclusivo inspirado en arte urbano.', 79900.00, 25, 'https://picsum.photos/seed/box2/600/700', 1, 1, TRUE),
(3, 'Chaqueta Bomber Verde', 'Chaqueta bomber acolchada, resistente al viento.', 199900.00, 15, 'https://picsum.photos/seed/box3/600/700', 2, 2, TRUE),
(4, 'Jean Cargo Gris', 'Jean cargo con bolsillos laterales, fit relajado.', 159900.00, 30, 'https://picsum.photos/seed/box4/600/700', 3, 2, TRUE),
(5, 'Gorra Snapback Coral', 'Gorra ajustable con bordado 3D.', 59900.00, 48, 'https://picsum.photos/seed/box5/600/700', 4, 3, TRUE);

SELECT setval('productos_id_producto_seq', (SELECT MAX(id_producto) FROM productos));

-- 5. TABLA: USUARIOS
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    rol VARCHAR(20) NOT NULL DEFAULT 'cliente',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (id_usuario, nombre, email, password, telefono, direccion, rol, fecha_registro) VALUES
(1, 'Administrador DADO', 'admin@boxesya.com', 'admin123', '3001234567', 'Calle 100 #15-20, Bogotá', 'admin', '2026-07-02 22:32:10');

SELECT setval('usuarios_id_usuario_seq', (SELECT MAX(id_usuario) FROM usuarios));

-- 6. TABLA: PEDIDOS
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'Pendiente',
    total NUMERIC(10,2) NOT NULL
);

INSERT INTO pedidos (id_pedido, id_usuario, fecha_pedido, estado, total) VALUES
(1, 1, '2026-07-02 22:52:02', 'Pendiente', 119800.00);

SELECT setval('pedidos_id_pedido_seq', (SELECT MAX(id_pedido) FROM pedidos));

-- 7. TABLA: DETALLE_PEDIDO
CREATE TABLE detalle_pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_producto INTEGER REFERENCES productos(id_producto),
    cantidad INTEGER NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL
);

INSERT INTO detalle_pedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 5, 2, 59900.00);

SELECT setval('detalle_pedido_id_detalle_seq', (SELECT MAX(id_detalle) FROM detalle_pedido));

-- 8. TABLA: PAGOS
CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    metodo VARCHAR(30) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Pendiente',
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pagos (id_pago, id_pedido, metodo, estado, fecha_pago) VALUES
(1, 1, 'Tarjeta', 'Aprobado', '2026-07-02 22:52:02');

SELECT setval('pagos_id_pago_seq', (SELECT MAX(id_pago) FROM pagos));
