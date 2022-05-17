#language: ru

@tree

Функционал: Номенклатура

Как Тестировщик я хочу
создать несколько элементов справочника Номенклатур с помощью цикла
чтобы протестировать полученные знания на уроке Цикл

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание большого объема данных (справочник Номенклатура)
	Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	//И Я запоминаю значение выражения 'ВыражениеВстроенногоЯзыка' в переменную "ИмяПеременной"
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 3 раз
		//И Я запоминаю значение выражения 'ВыражениеВстроенногоЯзыка' в переменную "ИмяПеременной"
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар с характеристиками" + $Шаг$' в переменную "Номенклатура"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | ''       | ''            | '$Номенклатура$' | ''                 | ''               | ''               |          |          |          |          |         |
	И я делаю 3 раз
		//И Я запоминаю значение выражения 'ВыражениеВстроенногоЯзыка' в переменную "ИмяПеременной"
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар без характеристик" + $Шаг$' в переменную "Номенклатура"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | ''       | ''            | '$Номенклатура$' | ''                 | ''               | ''               |          |          |          |          |         |
	И я делаю 4 раз
		//И Я запоминаю значение выражения 'ВыражениеВстроенногоЯзыка' в переменную "ИмяПеременной"
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар со спецификацией" + $Шаг$' в переменную "Номенклатура"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | ''       | ''       | ''            | '$Номенклатура$' | ''                 | ''               | ''               |          |          |          |          |         |


		
