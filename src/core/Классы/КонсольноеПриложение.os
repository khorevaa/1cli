Перем Команда; 
Перем ВерсияПриложения;
Перем НаименованиеПриложения;
Перем ОписаниеПриложения;

Перем ДействиеВыполнения Экспорт;
Перем ДействиеПередВыполнением Экспорт;
Перем ДействиеПослеВыполнения Экспорт;

Перем ФлагВерсия;

Перем ТипОпцииКоманды;

Процедура ПриСозданииОбъекта(Знач Наименование, Знач Описание)

	НаименованиеПриложения = Наименование;
	ОписаниеПриложения = Описание;
	Команда = Новый КомандаПриложения(Наименование, Описание, ЭтотОбъект);

	ТипОпцииКоманды = Новый Структура;
	ТипОпцииКоманды.Вставить("Опция", "Опция");
	ТипОпцииКоманды.Вставить("Аргумент", "Аргумент");

КонецПроцедуры

Процедура Версия(Наименование, СтрокаВерсии) Экспорт
	ВерсияПриложения = СтрокаВерсии;
	ФлагВерсия = Команда.Опция(Наименование, Ложь, "показать версию и выйти");
	
КонецПроцедуры

Процедура Запустить(АргументыКоманднойСтрокиВходящие = Неопределено) Экспорт

	Аргументы = АргументыКоманднойСтроки;

	Если Не АргументыКоманднойСтрокиВходящие = Неопределено Тогда
		Аргументы = АргументыКоманднойСтрокиВходящие;
	КонецЕсли;

	Команда.НачалоЗапуска();
	Команда.Запуск(Аргументы);
	
КонецПроцедуры

Функция ДобавитьПодкоманду(ИмяПодкоманды, ОписаниеПодкоманды, КлассРеализацииПодкоманды) Экспорт
	
	Возврат Команда.ДобавитьПодкоманду(ИмяПодкоманды, ОписаниеПодкоманды, КлассРеализацииПодкоманды);
	
КонецФункции

Процедура УстановитьОсновноеДействие(КлассРеализации, ИмяПроцедуры = "ВыполнитьКоманду") Экспорт
	
	Команда.УстановитьОсновноеДействие(КлассРеализации, ИмяПроцедуры);

КонецПроцедуры

Функция Опция(Имя, Значение = "", Описание = "") Экспорт
	
	НоваяОпция = Новый ОпцияКоманды(Имя, Значение, Описание);
	
	Команда.ДобавитьОпцию(НоваяОпция);
	
	Возврат НоваяОпция;

КонецФункции

Функция Аргумент(Имя, Значение = "", Описание = "") Экспорт
	
	НовыйАргумент = Новый АргументКоманды(Имя, Значение, Описание);
	Команда.ДобавитьАргумент(НовыйАргумент);

	Возврат НовыйАргумент;

КонецФункции


Функция ВыполнитьКоманду() Экспорт
	
	Если ФлагВерсия.Значение Тогда

		ВывестиВерсию();
	
	Иначе

		Команда.ВывестиСправку();

	КонецЕсли;
	
	ЗавершитьРаботу(0);
КонецФункции


Процедура ВывестиВерсию()
	
	Сообщить(ВерсияПриложения);

КонецПроцедуры
