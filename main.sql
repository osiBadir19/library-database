CREATE DATABASE IF NOT EXISTS library;

USE library;

CREATE TABLE Books (
	Book_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL, 
    genre VARCHAR(100),
    ISBN VARCHAR(100) UNIQUE, -- ensure ISBN is unqiue
    price DECIMAL (10,2) NOT NULL,
    quantity_in_stock INT UNSIGNED NOT NULL
);
    
CREATE TABLE Authors (
	author_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    Biography VARCHAR(200)
);

CREATE TABLE Customers(
	customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50), 
    phone VARCHAR(50) NOT NULL, 
    address VARCHAR(100) NOT NULL
);

CREATE TABLE Orders(
	order_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    -- foreign key customer id
    customer_id SMALLINT UNSIGNED NOT NULL, 
    order_date DATE,
    total_amount DECIMAL(10,2) UNSIGNED NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE OrderDetails(
	quantity INT UNSIGNED NOT NULL,
    price_at_purchase DECIMAL(10,2) NOT NULL,
    -- foriegn keys
    order_id SMALLINT UNSIGNED NOT NULL,
    book_id SMALLINT UNSIGNED NOT NULL,
    -- we create a composite primary key from both order_id and book_id
    PRIMARY KEY(order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(Book_id)
);
    





