-- Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
-- меньше 100  -    Маленький заказ
-- от 100 до 300 - Средний заказ
-- больше 300  -     Большой заказ


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
	id as 'ID заказа',
    CASE 
		WHEN count_product < 100 THEN 'Маленький Заказ'
        WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний Заказ'
        WHEN count_product > 300 THEN 'Большой Заказ'
        END AS 'Тип Заказа'
 FROM sales;
 