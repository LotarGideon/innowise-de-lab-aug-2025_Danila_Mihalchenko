# Упражнение 3
# ● Создайте функцию calculate_average_score(), которая будет вычислять
# средний балл.
# ● Функция должна принимать список оценок scores как обязательный аргумент.
# ● Добавьте опциональный булевый параметр ignore_lowest со значением по
# умолчанию False.
# ● Если ignore_lowest равен True, функция должна отбросить наименьшую оценку
# перед вычислением среднего. Если в списке всего одна оценка, отбрасывать её не
# нужно.
# ● Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз
# учитывая все оценки, а второй раз отбросив худшие оценки
def calculate_average_score(scores, ignore_lowest = False): # Создаём функцию с двумя параметрами
    if ignore_lowest and len(scores) > 1: # Проверяем условие игнорирования худшей оценки и количества оценок в списке
        copied_scores = scores.copy() # Чтобы не изменять исходный список делаем его копию под названием copied_scores
        copied_scores.remove(min(copied_scores)) # Удаляем из копии минимальную оценку
        return sum(copied_scores) / len(copied_scores) # Используем скопированный список для вычисления среднего балла
    else: # Если условие выше не выполняется, работаем с исходным списком
        return sum(scores) / len(scores)

student_data = [
    {'name': 'Алексей', 'scores': [85, 92, 78, 95]},
    {'name': 'Марина', 'scores': [65, 70, 58, 82]},
    {'name': 'Светлана', 'scores': [98, 95, 100]}
]
print("С учётом всех оценок: ")
for student in student_data: # Первый цикл для прохода по списку с оценками
    average_score = calculate_average_score(student['scores'], False) # В функцию передаём два аргумента с игнорированием False
    print(f"{student['name']}: {average_score:.2f}") # Выводим имя студента и его средний балл с форматированием: две цифры после запятой

print("Отбрасываем худшие: ")
for student in student_data: # Второй цикл, где худшие оценки отбрасываются
    average_score = calculate_average_score(student['scores'], True) # Это достигается путем передачи аргумента для ignore_lowest как True
    print(f"{student['name']}: {average_score:.2f}")