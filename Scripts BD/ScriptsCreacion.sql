CREATE TABLE customers (
    ID_Client INT PRIMARY KEY,
    fullName VARCHAR(100)
    
);


CREATE TABLE products (
    ID_Product INT primary key,
    Name_Product VARCHAR(100),
    price DECIMAL(10, 2)
);


CREATE TABLE category_products (
    ID_Category INT,
    ID_Product INT,
    NameDescription varchar(100),
    PRIMARY KEY (ID_Category, ID_Product),
    FOREIGN KEY (ID_Product) REFERENCES Products(ID_Product)
);

CREATE TABLE orders (
    ID_Order INT primary key,
    ID_Client INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    NStatus VARCHAR(50),
    FOREIGN KEY (ID_Client) REFERENCES customers(ID_Client)
);


CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    ID_Order INT,
    ID_Product INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (ID_Order) REFERENCES orders(ID_Order),
    FOREIGN KEY (ID_Product) REFERENCES products(ID_Product)
);






-- Crear un índice sobre la columna `customer_id` para mejorar las consultas por cliente
CREATE INDEX idx_customer_id ON orders(ID_Client);

-- Crear un índice sobre la columna `order_date` para mejorar las consultas por fecha
CREATE INDEX idx_order_date ON orders(order_date);


