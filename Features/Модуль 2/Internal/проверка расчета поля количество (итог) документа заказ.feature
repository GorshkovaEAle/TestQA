#language: ru

@tree


Функционал: проверка расчета поля (итог) документа заказ

Как Менеджер по продажам я хочу
создать документ Заказ на Продукты
Чтобы проверить расчета поля (итог) документа заказ

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка расчета поля (итог) документа заказ

И 00102 проверка создания заказа от покупателя

И 00103 проверка заполнения поля Валюта взаиморасчетов при заполнении Организации

И 00104 проверка связки Покупатель - Вид цен

И 00105 проверка заполнения поля Склад

* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000029' | 'Хлеб'         |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Провека заполнения табличной части документа
	Тогда открылось окно 'Заказ * от *'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Хлеб'  | '20,00'  | '1'          | '20,00'  |
		| 'Торт ' | '200,00' | '1'          | '200,00' |
* Проверка расчета поля количество (итог)
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Провека создания документа
	 И таблица "Список" содержит строки:
		 | 'Номер' |
		 | '$Номер$'|	
И я подключаю профиль TestClient "Менеджер по закупкам"
И я подключаю TestClient "Менеджер по продажам" логин "Менеджер по продажам" пароль ""
И я закрываю сеанс текущего клиента тестирования
