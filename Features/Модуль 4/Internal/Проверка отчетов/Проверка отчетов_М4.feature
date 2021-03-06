#language: ru

@tree

Функционал: Тестирование отчетов

Как Тестировщик я хочу
протестировать отчеты
чтобы проверить, что у пользователя не возникает ошибок

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0801 подготовительный сценарий (тестирование отчетов)
	Когда экспорт основных данных
    Когда экспорт документов продаж
	И я выполняю код встроенного языка на сервере
	| 'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
	| 'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'  |

Сценарий: _0802 проверка отчета Продажи
* Проверка основного варианта отчета Продажи
    И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R8C3" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Продажи1" по шаблону
	И в табличном документе "Result" ячейка с адресом "R8C3" равна "3 550,00" по шаблону
* Проверка отображения Возвратов в отчете Продажи	
	И я нажимаю на кнопку 'Изменить вариант...'
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И в таблице "SettingsComposerSettings" я перехожу к строке:
		| 'Структура отчета'   |
		| '<Детальные записи>' |
	И в таблице "SettingsComposerSettings" я устанавливаю флаг с именем 'SettingsComposerSettingsUse'
	И в таблице "SettingsComposerSettings" я завершаю редактирование строки
	Тогда таблица "SettingsComposerSettings" содержит строки:
		| 'Структура отчета'             | 'Использование' |
		| '<Детальные записи>'           | 'Да'            |
	И я нажимаю на кнопку 'Завершить редактирование'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R3C2" в течение 20 секунд
	И в табличном документе 'Result' ячейка с адресом 'R15C7' равна 'Возврат товаров от покупателя 1 от 17.05.2022 20:13:25'
	Дано Табличный документ "Result" равен макету "Продажи с возвратом1.mxl" по шаблону

		
	    