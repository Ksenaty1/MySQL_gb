-- Пункт 1.Создайте таблицу с мобильными телефонами (mobile_phones), используя графический интерфейс. 
-- Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ 

CREATE TABLE `homework_01`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `product_count` INT NULL,
  `price` INT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `homework_01`.`mobile_phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Iphone X', 'Apple', '3', '76000');
INSERT INTO `homework_01`.`mobile_phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Iphone 8', 'Apple', '2', '51000');
INSERT INTO `homework_01`.`mobile_phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `homework_01`.`mobile_phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `homework_01`.`mobile_phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('P20 Pro', 'Huawei', '5', '36000');


SELECT *
FROM homework_01.mobile_phones;

-- Пункт 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT 
    product_name, manufacturer, price
FROM
    homework_01.mobile_phones
WHERE 
	mobile_phones.product_count >= 2

-- Пункт 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT 
    *
FROM
    homework_01.mobile_phones
WHERE
    manufacturer = 'Samsung';
