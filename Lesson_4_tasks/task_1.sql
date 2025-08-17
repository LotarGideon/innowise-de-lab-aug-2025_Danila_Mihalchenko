-- Задание 1.1. Добавляем двух новых сотрудников
INSERT INTO "Employees" (
    "FirstName",     -- Имя сотрудника
    "LastName",      -- Фамилия сотрудника  
    "Department",     -- Отдел
    "Salary"          -- Зарплата
)
VALUES 
    ('Jake', 'Sullivan', 'IT', '99000'),      -- Jake Sullivan, IT отдел, зарплата 99,000
    ('Kail', 'Reez', 'Finance', '88000');    -- Kail Reez, Finance отдел, зарплата 88,000

-- Задание 1.2
SELECT * FROM "Employees"; -- Выбираем всех сотрудников 

-- Задание 1.3. Выбираем сотрудников из отдела IT
SELECT 
	"FirstName",	-- Имя сотрудника
	"Last_name"	-- Фамилия сотрудника
FROM "Employees"	-- Таблица-источник
WHERE "Department" = 'IT';	-- Фильтр: только сотрудники отдела IT

-- Задание 1.4. Обновляем показатель Salary у сотрудника Alice Smith 
UPDATE "Employees"	-- Указываем, в какой таблице происходит обновление
SET "Salary" = 65000.00	-- Устанавливаем новое значение
WHERE "EmployeeID" = 1;	-- Только для сотрудника с ID = 1 (Alice Smith)

-- Задание 1.5. Удаление сотрудника с фамилией Prince
DELETE FROM "Employees"	-- Здесь при создании таблицы EmployeeProjects была добавлена опция ON DELETE CASCADE, 
		-- который позволяет автоматически удалить записи об "уволенном" сотруднике из данных по проектам 
WHERE "LastName" = 'Prince';

-- Задание 1.6. Проверка результатов
SELECT * FROM "Employees"; 


