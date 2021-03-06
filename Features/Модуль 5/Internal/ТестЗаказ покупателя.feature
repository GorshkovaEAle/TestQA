Функционал: заказ покупателя

Как Тестировщик я хочу
прописать условие по заполнению поля Организация ищ соглашения
В случае, если Организация не заполнилась из соглашения,то заполняем ее с помощью шагов

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий:_0601 подготовительный сценарий (заказ покупателя)
	Когда экспорт основных данных

Сценарий:_0604 проверка заполнения поля Соглашения (Заказ покупателя)
	* Заполнение поля Соглашение в заказе покупателя
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку 'Создать'	
		И я нажимаю кнопку выбора у поля "Соглашение"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'                                                    |
			| 'Соглашение с клиентами (расчет по документам + кредитный лимит)' |
		И в таблице "List" я выбираю текущую строку
		И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
		И элемент формы с именем "Status" стал равен 'Согласовано'
		И элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'
	* Условие по заполнению поля Организации из соглашения, если поле не заполнилось (в примере поле заполнилось)
		Если поле "Организация" заполнено Тогда
			И я перехожу к следующему реквизиту
		Если элемент формы "Организация" имеет значение "" тогда
			И я нажимаю кнопку выбора у поля "Организация"
			Тогда открылось окно 'Организации'
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'           |
				| '1'   | 'Собственная компания 1' |
			И в таблице "List" я выбираю текущую строку
	* Условие по заполнению поля Организации из соглашения, если поле не заполнилось (в примере поле не заполнилось)
		//Очистка поля Организации
		И я нажимаю кнопку очистить у поля "Организация"
		Если поле "Организация" заполнено Тогда
			И я перехожу к следующему реквизиту
		Если элемент формы "Организация" имеет значение "" тогда
			И я нажимаю кнопку выбора у поля "Организация"
			Тогда открылось окно 'Организации'
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'           |
				| '1'   | 'Собственная компания 1' |
			И в таблице "List" я выбираю текущую строку		
			И элемент формы с именем "Company" стал равен 'Собственная компания 1'
	
	