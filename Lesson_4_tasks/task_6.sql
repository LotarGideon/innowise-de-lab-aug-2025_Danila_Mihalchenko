-- Задача 6.1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов
SELECT p."ProjectName"	-- Выбираем название проекта 
FROM "Projects" p	-- Таблица-источник
WHERE p."ProjectID" IN (	-- Фильтр по ID проектов
	-- Подзапрос для выбора проектов сотрудника
	SELECT ep."ProjectID"	-- Выбираем ID проектов из связи сотрудник-проект
	FROM "EmployeeProjects" ep	-- Таблица связи сотрудников и проектов
	WHERE ep."HoursWorked" > 150	-- Условие: более 150 часов работы
	AND ep."EmployeeID" = (	-- Сравнение с ID сотрудника
		-- Подзапрос для поиска ID сотрудника
		SELECT e."EmployeeID"	
		FROM "Employees" e
		WHERE e."FirstName" = 'Bob' AND e."LastName" = 'Johnson'	-- Условие поиска сотрудников: только Bob Johnson
	)
)

-- Задача 6.2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
UPDATE "Projects" p	-- Обновляем данные в таблице, p - псевдоним для удобства
SET "Budget" = "Budget" * 1.1	-- Увеличение бюджета на 10%
WHERE EXISTS (	-- Условие: обновить бюджет только для проектов, имеющих определённые связи с сотрудниками
	-- Подзапрос возвращает true если найдена хотя бы одна запись
	SELECT 1	-- Проверяем существование этой записи
	FROM "EmployeeProjects" ep	-- Таблица связи сотрудников и проектов
	JOIN "Employees" e ON ep."EmployeeID" = e."EmployeeID"	-- Соединение с таблицей сотрудников
	WHERE e."Department" = 'Senior IT'	-- Фильтр по названию отдела
		AND ep."ProjectID" = p."ProjectID"	-- Связь с внешним запросом: текущий проект
);

-- Запрос для проверки задания 6.2
SELECT 
    p."ProjectID",
    p."ProjectName",
    p."Budget" AS "CurrentBudget",
    (SELECT COUNT(*) 
     FROM "EmployeeProjects" ep
     JOIN "Employees" e ON ep."EmployeeID" = e."EmployeeID"
     WHERE ep."ProjectID" = p."ProjectID"
       AND e."Department" = 'Senior IT') AS "SeniorIT_EmployeeCount"
FROM "Projects" p
ORDER BY p."ProjectID";

-- Задача 6.3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установить EndDate на один год
UPDATE "Projects"	-- Обновляем данные в таблице Projects
SET "EndDate" = "StartDate" + INTERVAL '1 year'	-- Устанавливаем значение на год позже для колонки EndDate с помощью INTERVAL
WHERE "EndDate" IS NULL;	-- Условие: только те проекты, у которых EndDate имеет значение NULL

-- Проверка задания 6.3
SELECT 
    "ProjectID",
    "ProjectName",
    "StartDate",
    "EndDate" AS "NewEndDate",	-- Текущая дата завершения
    ("StartDate" + INTERVAL '1 year') AS "ExpectedEndDate"	-- Ожидаемая дата завершения 
FROM "Projects"
WHERE "ProjectID" = 4; 

-- Задача 6.4. Вставить нового сотрудника и немедленно назначить его на проект 'Website Redesign' с 80 отработанными часами, все в рамках одной транзакции 
BEGIN;	-- Начало транзакции
WITH NewEmployee AS (	-- CTE для вставки сотрудника
	INSERT INTO "Employees" ("FirstName", "LastName", "Department", "Salary")	-- Указываем, в какую таблицу вставляются данные
	VALUES ('Jacob', 'Taylor', 'Finance', 82000.00)	-- Сами данные
	RETURNING "EmployeeID"	-- Возвращается созданный ID
)
INSERT INTO "EmployeeProjects" ("EmployeeID", "ProjectID", "HoursWorked")	-- Вставка данных в таблицу связи сотрудников и проектов
SELECT
	ne."EmployeeID",	-- Используется ID из CTE
	(SELECT "ProjectID" FROM "Projects" WHERE "ProjectName" = 'Website Redesign'),	-- Подзапрос для поиска ID проекта
	80	-- Устанавливаем отработанные часы
FROM NewEmployee ne	-- Источник данных - CTE
RETURNING "EmployeeID";	-- Возвращается новый ID для проверки
COMMIT;	-- Фиксация изменений

-- Проверка задания 6.4
SELECT
	"EmployeeID",
	"FirstName",
	"LastName",
	"Department",
	"Salary"
FROM "Employees"
WHERE "EmployeeID" = 11
