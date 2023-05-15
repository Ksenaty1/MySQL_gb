USE homework_05;
    
-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
DROP VIEW IF EXISTS cars_view;
   
CREATE VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 25000
);

SELECT *
FROM cars_view;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT *
FROM cars_view;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
DROP VIEW IF EXISTS cars_view2;

CREATE VIEW cars_view2 AS
(
	SELECT *
    FROM cars
    WHERE name = 'Shoda' OR name = 'Audi'
);

SELECT *
FROM cars_view2;
