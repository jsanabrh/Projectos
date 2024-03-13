/* Crear la tabla de categorías */
CREATE TABLE categorias (
    ID_categoria INT PRIMARY KEY,
    Nombre_categoria VARCHAR(50)
);

/* Insertar algunas categorías */
INSERT INTO categorias (ID_categoria, Nombre_categoria)
VALUES
    (1, 'Aseo'),
    (2, 'Lácteos'),
    (3, 'Enlatados');

/* Crear la tabla productos */
CREATE TABLE productos (
    ID_producto INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    Categoria VARCHAR(50),
    ID_categoria INT,
    FOREIGN KEY (ID_categoria) REFERENCES categorias(ID_categoria)
);

/* Insertar datos en la tabla productos */
INSERT INTO productos (ID_producto, Nombre, Precio, Categoria, ID_categoria)
VALUES
    (1, 'Detergente', 1000.99, 'Aseo', 1),
    (2, 'Leche', 200.49, 'Lácteos', 2),
    (3, 'Atún enlatado', 100.79, 'Enlatados', 3),
    (10, 'Papel higiénico', 100.99, 'Aseo', 1);

/* Crear la tabla clientes */
CREATE TABLE clientes (
    ID_cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    Direccion VARCHAR(255)
);

/* Insertar datos en la tabla clientes */
INSERT INTO clientes (ID_cliente, Nombre, Telefono, Direccion)
VALUES
    (101, 'Juan Pérez', '123-456-7890', 'Calle Principal 123'),
    (102, 'María Rodríguez', '987-654-3210', 'Avenida Central 456'),
    (110, 'Pedro Gómez', '555-123-4567', 'Plaza Mayor 789');

/* Crear la tabla pedidos */
CREATE TABLE pedidos (
    ID_pedido INT PRIMARY KEY,
    Fecha DATE,
    ID_cliente INT,
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente)
);

/* Insertar datos en la tabla pedidos */
INSERT INTO pedidos (ID_pedido, Fecha, ID_cliente)
VALUES
    (1001, '2024-03-05', 101),
    (1002, '2024-03-06', 102),
    (1010, '2024-03-10', 110);

/* Crear la tabla productos_pedidos */
CREATE TABLE productos_Pedidos (
    ID_producto INT,
    ID_pedido INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    PRIMARY KEY (ID_producto, ID_pedido),
    FOREIGN KEY (ID_producto) REFERENCES productos(ID_producto),
    FOREIGN KEY (ID_pedido) REFERENCES pedidos(ID_pedido)
);

/* Insertar datos en la tabla productos_pedidos */
INSERT INTO productos_Pedidos (ID_producto, ID_pedido, cantidad, precio)
VALUES
    (1, 1001, 2, 5.99),
    (2, 1001, 1, 2.49),
    (3, 1002, 3, 1.79);

/* Verificar los datos de las tablas */
SELECT * FROM productos_Pedidos;
SELECT * FROM productos;
SELECT * FROM pedidos;
SELECT * FROM clientes;
SELECT * FROM categorias; 