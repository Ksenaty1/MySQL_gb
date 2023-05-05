-- Создайте таблицу “orders”, заполните ее значениями

USE homework_02;

DROP TABLE orders;

CREATE TABLE orders
(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id char(10) NOT NULL,
amount DECIMAL(5,2) NOT NULL,
order_status varchar(255) NOT NULL);

INSERT INTO orders
VALUES
(1, 'e03', 15.00, 'OPEN'),
(2, 'e01', 25.50, 'OPEN'),
(3, 'e05', 100.70, 'ClOSED'),
(4, 'e02', 22.18, 'OPEN'),
(5, 'e04', 9.50, 'CANCELLED');


SELECT 
	id, 
	employee_id, 
	amount,
    CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'
 FROM orders;
