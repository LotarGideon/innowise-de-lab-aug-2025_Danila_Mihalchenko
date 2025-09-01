]--Часть 2. Задача 2. Список доставок со статусом и именем клиента
SELECT	
	status,	-- Колонка со статусом товара "доставлено/не доставлено"
	first_name,	-- Имя клиента
	last_name	-- Фамилия клиента
FROM shippings	-- Таблица-источник (доставки)
LEFT JOIN customers	-- Таблица для объединени "покупатели"; 
	-- способ объединения - все данные из таблицы shippings плюс совпадения из customers,
	-- если не будет соответствий из shippings в таблице customers, то в полях first_name и last_name будут NULL
ON shippings.customer = customers.customer_id	-- Поле связывания
ORDER BY customer;	-- Сортировка по ID покупателей по возрастанию
