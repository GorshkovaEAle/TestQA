#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Подготовительный сценарий

Как Тестировщик я хочу
загрузить основные данные
для последующего выполнения тестирования

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: экспорт основных данных для финального задания

* Загрузка констант
	И загружаю константы

* Загрузка валюты
	И загружаю валюты
	
* Загрузка вида цен
	И загружаю вид цен
	
* Загрузка складов
	И загружаю склады
	
* Загрузка регионов
	И загружаю регионы
		
* Загрузка организаций
	И загружаю организации

* Загрузка  поставщиков
	И загружаю поставщиков
	
* Загрузка номенклатуры
	И загружаю товары
	
* Загрузка покупателей
	И загружаю покупателей

* Загрузка расчетных счетов
	И загружаю расчетные счета
	
