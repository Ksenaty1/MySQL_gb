DROP DATABASE IF EXISTS homework_06;
 
CREATE DATABASE homework_06;
 
USE homework_06;
 
/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/

DROP FUNCTION IF EXISTS format_full_date;
DELIMITER // 
CREATE FUNCTION format_full_date(num INT)
RETURNS VARCHAR(255) DETERMINISTIC 
BEGIN
DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE format_date_text VARCHAR(255) DEFAULT '';
		
    SET format_date_text = "";     
    
    If num > 0 THEN
		SET days = FLOOR(num / (24 * 60 * 60));
        SET num = num - days * 24 * 60 * 60;
	END IF;
    
    If num > 0 THEN
		SET hours = FLOOR(num / (60 * 60));
        SET num = num - hours * 60 * 60;
    END IF;    
    
    If num > 0 THEN
		SET minutes = FLOOR(num / 60);
        SET num = num - minutes * 60;
	END IF;
     
	If num > 0 THEN 
		SET seconds = num;
	END IF;
    
    IF days > 0 THEN
		SET format_date_text = concat(format_date_text, concat(days, " days"), " ");
	END IF;
    
    IF hours > 0 THEN
		SET format_date_text = concat(format_date_text, concat(hours, " hours"), " ");
	END IF;
    
    IF minutes > 0 THEN
		SET format_date_text = concat(format_date_text, concat(minutes, " minutes"), " ");
	END IF;
    
    IF seconds > 0 THEN
		SET format_date_text = concat(format_date_text, concat(seconds, " seconds"), " ");
	END IF;
    RETURN format_date_text;
END//

SELECT format_full_date(123456);

-- 2. Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DROP FUNCTION IF EXISTS get_nums;
DELIMITER //
CREATE FUNCTION get_nums()
RETURNS VARCHAR(50) DETERMINISTIC 
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE start_value INT DEFAULT 2;
	DECLARE stop_value INT DEFAULT 10;
    DECLARE n INT DEFAULT 0;
	SET n = IF(start_value % 2 = 0, start_value, start_value + 1);
	IF n <= stop_value THEN 
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, ",");
            END IF;
			SET result = CONCAT(result, n);
			SET n = n + 2;
			UNTIL n > stop_value
		END REPEAT;
	END IF;
	RETURN result;
END//

SELECT get_nums();