# Упражнение 2: Функции с параметрами
def add_vat(price, nds): # Создаём функцию
    return price + price * nds

prices = [1000, 3499, 250]
nds = 0.20
for price in prices: # В цикле проходим по списку с ценами и
    price_with_nds = add_vat(price, nds) # вызываем функцию для расчёта цены с НДС
    print(price_with_nds)