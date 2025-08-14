--Часть 7
-- CTE: Получение уникальных клиентов с доставленными заказами
WITH delivered_customers AS (
    SELECT DISTINCT customer  -- Выбор уникальных customer_id 
    FROM shippings	-- Таблица-источник
    WHERE status = 'Delivered'  -- Только успешно доставленные заказы
)
SELECT 
    c.first_name || ' ' || c.last_name AS full_name,  -- Объединение полей "имя" и "фамилия" в общее поле "полное имя" 
    c.country,	-- Страна клиента
    COUNT(o.order_id) AS total_orders,  -- Общее количество заказов клиента
    SUM(o.amount) AS total_amount       -- Общая сумма всех заказов клиента
FROM customers c	-- Таблица-источник
JOIN orders o ON c.customer_id = o.customer_id  -- Соединяем клиентов с их заказами
-- Фильтрация: только клиенты с доставленными заказами
WHERE c.customer_id IN (
    SELECT customer 
    FROM delivered_customers  -- Используем CTE для фильтрации
)
-- Группировка по клиентам, добавляем все неагрегированные столбцы
GROUP BY c.customer_id, c.first_name, c.last_name, c.country 
-- Фильтр групп: только клиенты с 2+ заказами
HAVING COUNT(o.order_id) >= 2;