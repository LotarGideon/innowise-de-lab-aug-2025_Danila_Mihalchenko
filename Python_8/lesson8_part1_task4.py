# Упражнение 4: List comprehension и словари
words = ["hello", "world", "python", "code"]
# 1. Создать список длин слов, используя списковое включение
lengths = [len(word) for word in words]
print(f"Длины слов из списка words: {lengths}")

# 2. Создать список слов длиннее 4 символов
another_words = [word for word in words if len(word) > 4]
print(f"Слова длиннее 4 символов: {another_words}")

# 3. Создать словарь: {слово: длина} для всех слов
lengths_dict = {word: len(word) for word in words}
print(f"Словарь: {lengths_dict}")