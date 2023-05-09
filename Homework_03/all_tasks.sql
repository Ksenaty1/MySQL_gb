CREATE DATABASE IF NOT EXISTS homework_03;

USE homework_03;


DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS salespeople;
DROP TABLE IF EXISTS staff;

CREATE TABLE salespeople(
	snum INT PRIMARY KEY NOT NULL,
	sname VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    comm DOUBLE NOT NULL);
    
    
INSERT INTO salespeople(snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', .12),
(1002, 'Serres', 'San Jose', .13),
(1004, 'Motika', 'London', .11),
(1007, 'Rifkin', 'Barcelona', .15),
(1003, 'Axelrod', 'New York', .10);


CREATE TABLE customers(
	cnum INT NOT NULL PRIMARY KEY,
    cname VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL,
    FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
	(2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'SanJose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);


CREATE TABLE orders(
	onum INT NOT NULL PRIMARY KEY,
    amt DOUBLE(6, 2) NOT NULL,
    odate DATE NOT NULL,
    cnum INT NOT NULL,
    snum INT NOT NULL,
    FOREIGN KEY (cnum) REFERENCES customers(cnum),
    FOREIGN KEY (snum) REFERENCES salespeople(snum)
    );
    

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, '1990-10-03', 2008, 1007), 
    (3003, 767.19, '1990-10-03', 2001, 1001), 
    (3002, 1900.10, '1990-10-03', 2007, 1004), 
    (3005, 5160.45, '1990-10-03', 2003, 1002), 
    (3006, 1098.16, '1990-10-03', 2008, 1007), 
    (3009, 1713.23, '1990-10-04', 2002, 1003), 
    (3007, 75.75, '1990-10-04', 2004, 1002), 
    (3008, 4723.00, '1990-10-05', 2006, 1001), 
    (3010, 1309.95, '1990-10-06', 2004, 1002), 
    (3011, 9891.88, '1990-10-06', 2006, 1001);
    
    
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(255),
	lastname VARCHAR(255),
	post VARCHAR(255), 
	seniority INT,
	salary INT, 
	age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age) 
VALUES
	('Вася', 'Петров', 'Начальник', '40', 100000, 60),
	('Петр', 'Власов', 'Начальник', '8', 70000, 30),
	('Катя', 'Катина', 'Инженер', '2', 70000, 25),
	('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
	('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
	('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
	('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
	('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT 
	city, sname, snum, comm
FROM 
	salespeople;
    
-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT 
	rating, cname, city
FROM
	customers
WHERE
	city = 'SanJose';
    
-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT 
	DISTINCT snum AS 'Продавцы'
FROM
	orders;
    
-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) 

SELECT 
	*
FROM 
	customers
WHERE cname LIKE 'G%';

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000

SELECT
	*
FROM 
	orders
WHERE 
	amt >= 1000.00;
    
-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT 
	MIN(amt)
FROM 
	orders;

-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT
	*
FROM
	customers
WHERE rating > 100 AND city ='Rome';

-- Отсортируйте поле “зарплата” в порядке убывания и возрастания

-- по возростанию 
SELECT 
	*
FROM 
	staff
ORDER BY
	salary ASC; 


-- по убыванию
SELECT 
	*
FROM 
	staff
ORDER BY
	salary DESC; 
    
    
-- ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT 
	DISTINCT salary
FROM 
	staff
ORDER BY
	salary DESC
LIMIT 5; 


-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT 
	post,
    COUNT(post) 'Количество'
FROM
	staff
GROUP BY 
	post
HAVING
	SUM(salary) > 100000;