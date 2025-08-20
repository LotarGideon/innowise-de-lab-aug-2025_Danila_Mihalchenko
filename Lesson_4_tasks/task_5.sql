-- Задание 5.1. Функция: Создать функцию PostgreSQL с именем
-- CalculateAnnualBonus, которая принимает employee_id и
-- Salary в качестве входных данных и возвращает рассчитанную
-- сумму бонуса (10 % от Salary) для этого сотрудника
CREATE OR REPLACE FUNCTION "CalculateAnnualBonus" (
	-- Входные параметры
	"EmployeeID" INTEGER,	-- ID сотрудника 		
	"Salary" NUMERIC(10, 2)	-- Зарплата сотрудника
)
RETURNS NUMERIC(10, 2)	-- Возвращаемое значение: число с двумя знаками после запятой
LANGUAGE plpgsql	-- Язык программирования
AS $$
DECLARE
	bonus_sum NUMERIC(10, 2);	-- Объявляем локальную переменную для хранения суммы бонуса
BEGIN
	-- Проверка ID сотрудника
	IF "EmployeeID" IS NULL OR "EmployeeID" <= 0 THEN 
		RAISE EXCEPTION 'ID сотрудника должен быть положительным';	-- Исключение при неправильном ID 
	END IF;
	-- Проверка зарплаты
	IF "Salary" IS NULL OR "Salary" < 0 THEN 
		RAISE EXCEPTION 'Зарплата не может быть отрицательной или NULL';	-- Исключение при некорректной зарплате
	END IF;
	bonus_sum := "Salary" * 0.10;	-- Вычисляем сумму бонуса
	RETURN bonus_sum;	-- Возвращаем этот бонус
END;
$$;

-- Задача 5.2. Использовать эту функцию в операторе SELECT, чтобы увидеть
-- потенциальный бонус для каждого сотрудника
SELECT 
	"EmployeeID",
	"FirstName",
	"LastName", 
	"Salary",
	"CalculateAnnualBonus"("EmployeeID", "Salary") AS "Bonus"
FROM "Employees";

-- Задача 5.3. Представление (View): Создать представление с именем IT_Department_View, которое показывает EmployeeID,
-- FirstName, LastName и Salary только для сотрудников из отдела 'IT'
CREATE OR REPLACE VIEW IT_Department_View AS	-- Создаём представление, которое будет включать:
SELECT 
	"EmployeeID",	-- ID сотрудника
	"FirstName",	-- Имя
	"LastName",	-- Фамилию
	"Salary"	-- Зарплату сотрудника 
FROM "Employees"	-- Таблица-источник для представления
WHERE "Department" = 'Senior IT';	-- Условие-фильтр: только работники IT отдела

-- Задача 5.4. Выбрать данные из вашего представления IT_Department_View
SELECT * FROM IT_Department_View;	