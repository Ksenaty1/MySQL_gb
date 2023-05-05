-- Используя операторы языка SQL, 
-- создайте таблицу “sales”. Заполните ее данными.
CREATE DATABASE homework_02;

USE homework_02;

DROP TABLE sales;

CREATE TABLE sales
(id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_date DATE NOT NULL,
count_product INT NOT NULL);

INSERT INTO sales
VALUES
(1, '2022-01-01', 156),
(2, '2022-01-02', 180),
(3, '2022-01-03', 21),
(4, '2022-01-04', 124),
(5, '2022-01-05', 341);

SELECT 
    *
FROM
    sales;