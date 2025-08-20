-- Задача 3.1. Создание нового пользователя 
CREATE USER hr_user 
WITH PASSWORD '1234';

--Задача 3.2. Предоставить hr_user право SELECT на таблицу Employees
GRANT SELECT	-- Предоставляем право на чтение данных
ON "Employees"	-- Из таблицы Employees
TO hr_user	-- Для пользователя hr_user

-- Задача 3.5. Предоставление hr_user прав INSERT и UPDATE на таблицу Employees
GRANT INSERT, UPDATE ON "Employees" TO hr_user