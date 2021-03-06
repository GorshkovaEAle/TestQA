#language: ru

@tree

Функционал: проверка добавления картинки в справочник Товары

Как Тестировщик я хочу
добавить картинку к товару
чтобы можно было посмотреть как выглядит товар 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: подготовительный сценарий загрузка основных данных
	Когда экспорт основных данных для финального задания

Сценарий: 2000_Проверка добавления картинки в справочник Товары
* Добавление картинки в справочник товары
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca1000d8843cd1b11dc8ea92d97a749"
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
	И я нажимаю на кнопку 'Создать'
	Тогда открылось окно 'Файл (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'Колбаса'
	И я выбираю файл "C:\Users\ап\Documents\TestQA\TestQA\Features\Финальное задание\Files\itempicture1.png"
	И я нажимаю на кнопку 'Выбрать файл с диска и записать'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Колбаса (Файл)' в течение 20 секунд
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Колбаса'     |
	И в таблице "Список" я выбираю текущую строку
	Тогда элемент формы с именем "ФайлКартинки" стал равен 'Колбаса'
	И я нажимаю на кнопку 'Обновить картинку'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Колбаса тест (Товар)' в течение 20 секунд
		
* Проверка наличия файла картинки Колбаса	
 	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.ХранимыеФайлы"
	Тогда таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Колбаса'      |
	И я закрываю все окна клиентского приложения

* Сохранение картинки из справочника товары в файл
    
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca1000d8843cd1b11dc8ea92d97a749"
	И я запоминаю строку "C:\Users\ап\Documents\TestQA\TestQA\Features\Финальное задание\Files\Колбаса.zip" в переменную "ИмяФайла_Колбаса"
	Если файл "$ИмяФайла_Колбаса$" существует Тогда
		Тогда я удаляю файл "$ИмяФайла_Колбаса$"
	
	И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
	И я буду выбирать внешний файл "$ИмяФайла_Колбаса$"
	И я нажимаю на кнопку 'Скачать архивом'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'OK'
	И пауза 2
	И файл "$ИмяФайла_Колбаса$" существует
