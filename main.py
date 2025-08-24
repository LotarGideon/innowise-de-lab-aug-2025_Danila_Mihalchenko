# Задание 1. Приветствие
# Описание: Напишите программу, которая сначала спрашивает у
# пользователя его имя, а затем выводит персональное приветствие,
# используя это имя.
name = input("Как тебя зовут?\n ")
print(f"Привет, {name}! Приятно познакомиться.")


# Задание 2. Площадь прямоугольника
# Описание:Напишите программу, которая запрашивает у
# пользователя длину и ширину прямоугольника. После получения данных
# программа должна вычислить и вывести на экран площадь этого
# прямоугольника
length = input("Введите длину прямоугольника: ")
width = input("Введите ширину прямоугольника: ")
length = float(length)
width = float(width)
area = length * width
print(f"Площадь прямоугольника: {area}")


# Задание 3. Конвертер температур
# Описание: Напишите программу, которая запрашивает у
# пользователя температуру в градусах Цельсия, переводит её в градусы
# Фаренгейта и выводит результат на экран.
temperature_C = float(input("Введите температуру в градусах Цельсия: "))
temperature_F = temperature_C * 9 / 5 + 32
print(f"{temperature_C}°C это {temperature_F}°F")


# Задание 4. Игра «Угадай число»
# Описание: Напишите программу, которая «загадывает»
# случайное целое число в диапазоне от 1 до 5. Пользователь пытается его
# отгадать. Программа должна сравнить число пользователя с загаданным
#и вывести одно из трех сообщений:
#● «Ты угадал!», если числа совпали.
#● «Слишком много!», если число пользователя больше загаданного.
#● «Слишком мало!», если число пользователя меньше загаданного
import random
hidden_number = random.randint(1,5)
print("Я загадал число от 1 до 5. Попробуй угадать!")
estimated_number = int(input("Введи число: "))
if estimated_number > hidden_number:
    print("Слишком много!")
elif estimated_number < hidden_number:
    print("Слишком мало!")
elif estimated_number == hidden_number:
    print("Ты угадал!")


# Задание 5. Проверка числа на чётность
# Описание: Напишите программу, которая запрашивает у
# пользователя целое число и определяет, является ли оно чётным или
# нечётным.
number = int(input("Введите целое число: "))
if number % 2 == 0:
    print(f"Число {number} - чётное.")
else:
    print(f"Число {number} - нечётное")


# Задание 6. Калькулятор
# Описание: Напишите программу, которая работает как простой
# калькулятор. Программа должна запросить у пользователя два числа и
# символ операции (+, -, *, /), а затем выполнить расчёт и вывести результат.
# В этом калькуляторе добавлена операция возведения первого числа в степень второго.
# Для удобства пользователя знак возведения в степень заменён с ** на ^ в выводе на экран.
# Также применены циклы для потенциально бесконечного взаимодействия пользователя с калькулятором.
print("---- Калькулятор ----")
print("Для завершения работы введите 'выход'")

while True:
    while True:
        try:
            first_number = input("\nВведите первое число: ")
            if first_number == "выход":
                print("Благодарим за использование нашей программы!")
                exit()
            first_number = float(first_number)
            break
        except ValueError:
            print("Ошибка: введите число")

    while True:
        try:
            second_number = input("\nВведите второе число: ")
            if second_number == "выход":
                print("Благодарим за использование нашей программы!")
                exit()
            second_number = float(second_number)
            break
        except ValueError:
            print("Ошибка: введите число")

    while True:
        operator = input("Выберите оператор (+, -, *, /, ^): ")
        if operator in ["+", "-", "*", "/", "^"]:
            break
        else:
            print("Ошибка: выберите один из операторов: +, -, *, /, ^")

    if operator == "+":
        result = first_number + second_number
        print(f"Результат: {first_number} + {second_number} = {result:.4f}")
    elif operator == "-":
        result = first_number - second_number
        print(f"Результат: {first_number} - {second_number} = {result:.4f}")
    elif operator == "*":
        result = first_number * second_number
        print(f"Результат: {first_number} * {second_number} = {result:.4f}")
    elif operator == "/":
        if second_number == 0:
            print("Ошибка: деление на нуль невозможно.")
        else:
            result = first_number / second_number
            print(f"Результат: {first_number} / {second_number} = {result:.4f}")
    elif operator == "^":
        result = first_number ** second_number
        print(f"Результат: {first_number} ^ {second_number} = {result:.4f}")
    print("-" * 30)




