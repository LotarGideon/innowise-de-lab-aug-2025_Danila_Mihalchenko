# Упражнение 2: Методы строк и форматинг
# 1. Очистить и отформатировать до вида: "user@domain.com"
print(" Очистка и форматирование: ")
email = " USER@DOMAIN.COM "
email = email.strip() # Удаляем пробелы в начале и конце
email = email.lower() # Приводим строку к нижнему регистру
print(email)

# 2. Разделить на имя пользователя и домен
print(" Разделение: ")
user_name = email.split("@")[0] # Разделяем строку и сохраняем имя пользователя в переменную user_name
domain = email.split("@")[1] # Разделяем строку и сохраняем домен в соответствующую переменную
print(f"Имя пользователя: {user_name}")
print(f"Домен: {domain}")

# 3. Используя f-строку, создать: "Username: user, Domain: domain.com"
print(" Используем f-строку: ")
print(f"Username: {user_name}, Domain: {domain}")