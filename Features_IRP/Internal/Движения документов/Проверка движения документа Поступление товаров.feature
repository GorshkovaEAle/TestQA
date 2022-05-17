﻿#language: ru

@tree
@движенияДокументов

Функционал: проверка движения документа Поступление товаров

Как Тестировщик я хочу
проверить движения документа Поступления товаров
чтобы убедитьтся что документ делает движения по нужным регистрам

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0501 подгогтовительный сценарий (вижение длкумента Поступление товаров)
	Когда экспорт основных данных
	Когда загрузка документа поступление товаров и услуг
	И я выполняю код встроенного языка на сервере
	|'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
Сценарий:_0502 проверка движений документа Поступление товаров по регистру R1001 Закупки
	И я закрываю все окна клиентского приложения
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
  	И в таблице "List" я перехожу к строке:
		| 'Номер' |
    	| '1 001' |
  	И я нажимаю на кнопку 'Движения документа'
  	Тогда открылось окно 'Движения документа'
	И из выпадающего списка "Регистр" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку 'Сформировать'
	Тогда табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Да'                |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Да'                |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
	И я закрываю все окна клиентского приложения

Сценарий:_0503 проверка движений документа Поступление товаров по регистру	R1021 Взаиморасчеты с поставщиками
	И я закрываю все окна клиентского приложения
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
  	И в таблице "List" я перехожу к строке:
		| 'Номер' |
    	| '1 001' |
  	И я нажимаю на кнопку 'Движения документа'
  	Тогда открылось окно 'Движения документа'
	И из выпадающего списка "Регистр" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку 'Сформировать'
	Тогда табличный документ "ResultTable" содержит строки по шаблону:
		| 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Да'                |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Услуга'                  | 'cfc5da60-8414-4dfc-85b4-2699164bb1d6' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Да'                |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
		| ''                                                         | '16.05.2022 16:27:30' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 16.05.2022 16:27:30' | 'Товар без характеристик' | '2a73f01a-0703-485b-9da7-93b0ae582356' | 'Нет'               |
	И я закрываю все окна клиентского приложения
			
		
	

