-- Задача 4.1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%
UPDATE "Employees"	-- Обновляем данные в таблице Employees
SET "Salary" = "Salary" * 1.1	-- Повышаем зарплату сотрудников HR отдела на 10% (или умножить показатель Salary на 1.1)
WHERE "Department" = 'HR'	-- Указываем, какой отдел получает прибавку

-- Задача 4.2. Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'
UPDATE "Employees"
SET "Department" = 'Senior IT'
WHERE "Salary" > 70000.00

-- Задача 4.3. Удалить всех сотрудников, которые не назначены ни на один проект в таблице EmployeeProjects.
DELETE FROM "Employees" e	-- Удаляем данные из таблицы Employees (псевдоним "e")
WHERE NOT EXISTS (	-- Условие: не существует связанных записей
    SELECT 1	-- Возвращаем константу 1 (важен факт наличия, не содержимое)
    FROM "EmployeeProjects" e_p	-- Из таблицы EmployeeProjects (псевдоним "e_p")
    WHERE e_p."EmployeeID" = e."EmployeeID" -- Условие связи: ID сотрудника в проектах = ID сотрудника
);

-- Задача 4.4. Вставить новый проект и назначить на него двух существующих
-- сотрудников с определенным количеством HoursWorked в EmployeeProjects
BEGIN;	-- Начало транзакции
	INSERT INTO "Projects" ("ProjectID", "ProjectName", "Budget")	-- Добавляем данные в таблицу Projects
	VALUES (4, 'Database Optimization', 350000.00);	-- ID проекта, название и бюджет
	
	INSERT INTO "EmployeeProjects" ("EmployeeID", "ProjectID", "HoursWorked")	-- Изменяем данные в таблице EmployeeProkects
	VALUES (1, 4, 130);	-- Назначаем сотрудника с ID = 1 на новый проект
	-- Здесь тоже назначаем сотрудника, но уже с ID = 3
	INSERT INTO "EmployeeProjects" ("EmployeeID", "ProjectID", "HoursWorked")
	VALUES (3, 4, 95);
COMMIT;	-- Подтверждаем изменения в транзакции

