USE homework_04;


-- 1.Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA

SELECT mark, color, COUNT(color) AS 'Количество'
FROM auto
WHERE mark = 'BMW' OR mark = 'LADA'
GROUP BY mark, color
ORDER BY mark, 'количество';


/* 2.Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
*/

SELECT mark, COUNT(mark) 'Количество', (SELECT COUNT(mark) from auto) - COUNT(mark) 'Кол-во других машин'
FROM auto
GROUP BY mark;

-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT * 
FROM test_a 
	LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;