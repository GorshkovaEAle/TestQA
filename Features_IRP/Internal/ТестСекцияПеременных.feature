#language: ru

@IgnoreOnCIMainBuild
@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Переменные:

импорт "Переменные.feature"

МногострочнаяСтрока =
	"""
	ЧастьСтроки1
	ЧастьСтроки2
	"""

//Сценарий: открытие формы списка Поступлений товаров и услуг
//	//И В командном интерфейсе я выбираю "ИмяКомандыПанелиРазделов" "ИмяКомандыПанелиФункций"
//	И В командном интерфейсе я выбираю "ЗаголовокПодсистемаЗакупок" "ЗаголовокФормыСпискаПоступление"
	
//Сценарий: проверка суммы Документа поступления
//	И у элемента формы с именем "ItemListTotalTotalAmount" текст редактирования стал равен 'ПроверяемыеЗначения.СуммаДокументаПоступления.Значение'

//Сценарий: проверка итоговой суммы отчета по закупкам
//	И в табличном документе 'Result' я перехожу к ячейке "ИтоговаяСуммаОтчетаЗакупки"

Сценарий: проверка сообщения
	И Я запоминаю значение выражения 'StrTemplate($СообщениеШтрихКодНеНайден$, "123")' в переменную "ИмяПеременной2"
	Дано В последнем сообщении TestClient есть строка "$ИмяПеременной2$"
	

		