#language: ru

@tree

Функционал: Расход товара

Как Менеджер по продажам я хочу
оформить документ расход товара 
чтобы проверить новый функционал по продаже товара

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	
Сценарий: подготовительный сценарий расход товара
	Когда экспорт основных данных для финального задания
    Когда экспорт документов поступления товаров с проведением
	Когда экспорт документов заказ покупателя с проведением документов
	Когда экспорт документа продажа с проведением документа

Сценарий: 2050_продажа товара содание нового документа на товар
	* Открытие журнала продажи товара 
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	* Создание документа продажи товара
		И я нажимаю на кнопку 'Создать'
	* Заполнение шапки документа
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары тест"'
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование'     |
			| '000000007' | 'Иванов Б.В. ИЧП ' |
		И в таблице "Список" я выбираю текущую строку
		И из выпадающего списка "Валюта взиморасчетов" я выбираю точное значение 'Рубли'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад №3'
	* Условие по заполнению поля вид цены при выборе склада, если поле не заполнилось 
		Если поле "Вид цен" заполнено Тогда
			И я перехожу к следующему реквизиту
		Если элемент формы с именем "ВидЦен" стал равен '' тогда
			И из выпадающего списка "Вид цен" я выбираю точное значение 'Мелкооптовая'
			Тогда элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
	* Проверка доступности выбора поля вида цены, если поле заполнилось при выборе склада
		И из выпадающего списка "Вид цен" я выбираю точное значение 'Розничная'
		Тогда элемент формы с именем "ВидЦен" стал равен 'Розничная'	
	* Заполнение вкладки прочее документа продажа товара
		И в поле 'Обоснование отгрузки' я ввожу текст 'тест'
	* Заполнение табличной части документа продажа товара по кнопке Подбор
		И в таблице "Товары" я нажимаю на кнопку 'Подбор'
		И я выбираю пункт контекстного меню с именем 'СписокТоваровКонтекстноеМенюНайти' на элементе формы с именем "СписокТоваров"
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Наименование'
		И в поле с именем 'Pattern' я ввожу текст 'Колбаса тест'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице "СписокТоваров" я выбираю текущую строку		
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000030' | 'Колбаса тест' |
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '8,00'
		И я нажимаю на кнопку с именем 'ОК'
		И таблица "Товары" содержит строки:
			| 'Товар'        | 'Цена'   | 'Количество' | 'Сумма'    |
			| 'Колбаса тест' | '400,00' | '8,00'       | '3 200,00' |
	* Заполнение табличной части документа продажа товара по кнопке Добавить
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| 'Артикул'  | 'Код'       | 'Наименование' |
			| 'ПРД-0002' | '000000021' | 'Масло тест'   |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Товары" в поле 'Количество' я ввожу текст '8,00'
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| 'Артикул' | 'Код'       | 'Наименование' |
			| 'Mol34'   | '000000026' | 'Молоко тест'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Товары" в поле 'Количество' я ввожу текст '10,00'
		Тогда таблица "Товары" содержит строки:
			| 'Товар'        | 'Цена'   | 'Количество' | 'Сумма'    |
			| 'Колбаса тест' | '400,00' | '8,00'       | '3 200,00' |
			| 'Масло тест'   | '55,00'  | '8,00'       | '440,00'   |
			| 'Молоко тест'  | '45,00'  | '10,00'      | '450,00'   |
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '26'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '4 090'
	* Изменение поля количества в табличной части документа продажа товара 
		И в таблице "Товары" я перехожу к строке:
			| 'N' | 'Товар'        | 'Цена'   | 'Количество' | 'Сумма'    |
			| '3' | 'Молоко тест'  | '45,00'  | '10,00'      | '450,00'   |
		И в таблице "Товары" в поле 'Количество' я ввожу текст '8,00'
		И я завершаю редактирование строки
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '24'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '4 000'
	* Изменение цены в табличной части документа продажа товара вручную
		И в таблице "Товары" я перехожу к строке:
			| 'N' | 'Товар'        | 'Цена'   | 'Количество' | 'Сумма'    |
			| '3' | 'Молоко тест'  | '45,00'  | '8,00'      | '360,00'   |
		И в таблице "Товары" в поле 'цена' я ввожу текст '50,00'
		И я завершаю редактирование строки
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '24'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '4 040'
	* Изменение цены в поле Вид цены
		И из выпадающего списка "Вид цен" я выбираю точное значение 'Мелкооптовая'
		И элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
		И я нажимаю на кнопку с именем 'Пересчитать'
		И таблица "Товары" стала равной:
			| 'N' | 'Товар'        | 'Цена'   | 'Количество' | 'Сумма'    |
			| '1' | 'Колбаса тест' | '330,00' | '8,00'       | '2 640,00' |
			| '2' | 'Масло тест'   | '45,00'  | '8,00'       | '360,00'   |
			| '3' | 'Молоко тест'  | '43,00'  | '8,00'       | '344,00'   |
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '24'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '3 344'
	* Запись документа продажа товара
		И я нажимаю на кнопку 'Записать'
	* Номер и дата
		И я запоминаю значение поля "Номер" как "НомерДокументаПродажаСоздание"
		И я запоминаю значение поля "Дата" как "ДатаДокументаПродажаСоздание"
	* Проведение документа и движения
		И я нажимаю на кнопку 'Провести'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
	* Провека создания документа
		И таблица "Список" содержит строки:
			| 'Номер' |
			| '$НомерДокументаПродажаСоздание$'|	
					
					
				
				
				
