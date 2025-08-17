-- Задача 2.1. Создание таблицы Departments
CREATE TABLE "Departments" (
"DepartmentID" SERIAL PRIMARY KEY,	-- Уникальный ID отдела, автоматически увеличивается
"DepartmentName" VARCHAR(50) UNIQUE NOT NULL,	-- Название отдела: уникальное, обязательное
"Location" VARCHAR(50)	-- Местоположение отдела
);

-- Задача 2.2. Добавление в таблицу Employees столбца с именем Email
ALTER TABLE "Employees"	-- Изменем таблицу Employees
ADD COLUMN "Email" VARCHAR(100)	-- Добавляем столбец Email

-- Задача 2.3. Добавление ограничения UNIQUE к столбцу email
UPDATE "Employees"	-- Обновляем таблицу 
SET "Email" = LOWER("FirstName") || '.' || LOWER("LastName") || '@company.com'	-- Устанавливаем названия электронных почт сотрудников как имя + фамилия + домен
WHERE "Email" IS NULL;	-- Только там, где данные неизвестны
ALTER TABLE "Employees"	-- Изменяем таблицу 
ADD CONSTRAINT UQ_email	-- Добавляем название для ограничения
UNIQUE ("Email");	-- Показываем, к какой колонке присваивается ограничение

-- Задача 2.4. Переименовать столбец Location в OfficeLocation
ALTER TABLE "Departments" 
RENAME COLUMN "Location" TO "OfficeLocation";