﻿#language: ru

@IgnoreOnCIMainBuild
@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Переменные:
ЗаголовокФормыСпискаПоступление ='{!Metadata.Documents.PurchaseInvoice.ListPresentation}'
ЗаголовокПодсистемаЗакупок = '{!Metadata.Subsystems.PurchaseAP.Synonym}'

*ПроверяемыеЗначения		
	| 'Имя'                       | 'Представление'               | 'Значение' |
	| 'СуммаДокументаПоступления' | 'Сумма документа поступления' | '900,00'   |

ИтоговаяСуммаОтчетаЗакупки ='R16C3'

СообщениеШтрихКодНеНайден ='{!R().S_019}'

Сценарий: <описание сценария>
