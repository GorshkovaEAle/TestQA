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

Сценарий: 2030_Расход товара на основании документа заказ покупателя
	* Открытие документа заказ покупателя
		Дано Я открываю навигационную ссылку "e1cib/data/Документ.Заказ?ref=9474f46d042c176811ecf3c350bb767c"
	* Создание докупента Продажа
		И я нажимаю на кнопку 'Продажа: создать на основании'
	* Проверка автоматически заполненных элементов формы Продажа товара
		И элемент формы с именем "Организация" стал равен 'ООО \"Товары тест\"'
		И элемент формы с именем "Склад" стал равен 'Склад №2'
		И элемент формы с именем "Покупатель" стал равен 'Иванов Б.В. ИЧП '
		И элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
		И элемент формы с именем "Валюта" стал равен 'Рубли'
		И таблица "Товары" содержит строки:
			| 'N' | 'Товар'         | 'Цена'   | 'Количество' | 'Сумма'    |
			| '1' | 'Торт тест '    | '250,00' | '5,00'       | '1 250,00' |
			| '2' | 'Хлеб тест'     | '25,00'  | '10,00'      | '250,00'   |
			| '3' | 'Доставка тест' | '250,00' | '2,00'       | '500,00'   |
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '17'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '2 000'
		И элемент формы с именем "ОбоснованиеОтгрузки" стал равен ''
	* Запись документа
		И я нажимаю на кнопку 'Записать'
	* Номер и дата
		И я запоминаю значение поля "Номер" как "НомерДокумента"
		И я запоминаю значение поля "Дата" как "ДатаДокумента"
	* Проведение документа
		И я нажимаю на кнопку 'Провести'
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Продажа * от *' в течение 20 секунд
		И я закрываю все окна клиентского приложения
	* Провека создания документа
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И таблица "Список" содержит строки:
			| 'Номер'            |
			| '$НомерДокумента$' |
		И я закрываю все окна клиентского приложения
