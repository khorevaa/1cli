#Использовать logos

Перем ТекущийИндекс;

Перем Длина;
Перем ДлинаМассива;

Перем СтрокаЧтения;
Перем МассивСимволов;

Перем Лог;

Перем ПервоеЧтение;

Процедура ПриСозданииОбъекта(Знач ВходящаяСтрокаЧтения)

	СтрокаЧтения = ВходящаяСтрокаЧтения;

	Длина =  СтрДлина(СтрокаЧтения);

	МассивСимволов = Новый Массив;

	Прочитать();

	ПервоеЧтение = Истина;

	ТекущийИндекс = ?(МассивСимволов.Количество() > 0, 0 , -1);

	Если ТекущийИндекс = -1 Тогда
		ПервоеЧтение = Ложь;
	КонецЕсли;

КонецПроцедуры

// Функция выполняет чтение/разделение строки на символы строки
//
//  Возвращаемое значение:
//   Объект.ЧтениеСтроки - ссылка на текущий класс ЧтениеСтроки
//
Функция Прочитать() Экспорт

	МассивСимволов.Очистить();

	Для ИИ = 1 По Длина Цикл

		МассивСимволов.Добавить(Сред(СтрокаЧтения, ИИ, 1));

	КонецЦикла;

	ДлинаМассива = МассивСимволов.ВГраница();

	Лог.Отладка("Количество символов в строке %1", ДлинаМассива);

	Возврат ЭтотОБъект;

КонецФункции

// Преобразовывает строку в массив символов между индексами
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   Массив - массив символов строки
//
Функция ВМассив(Знач НачальныйИндекс = Неопределено, Знач КонечныйИндекс = Неопределено) Экспорт

	МассивВозврата = Новый Массив;

	Если НачальныйИндекс = Неопределено
		И КонечныйИндекс = Неопределено Тогда
		Возврат МассивВозврата.Добавить(СтрокаЧтения);
	КонецЕсли;

	Если (ТипЗнч(КонечныйИндекс) = Тип("Число")
		И КонечныйИндекс > ДлинаМассива)
		Или КонечныйИндекс = Неопределено Тогда

		КонечныйИндекс = ДлинаМассива;

	КонецЕсли;

	Если НачальныйИндекс = Неопределено Тогда
		НачальныйИндекс = 0;
	КонецЕсли;

	Для ИндексСимвола = НачальныйИндекс По КонечныйИндекс Цикл

		МассивВозврата.Добавить(МассивСимволов[ИндексСимвола]);

	КонецЦикла;

	Возврат МассивВозврата;

КонецФункции

// Преобразовывает строку в массив символов с начального индекса
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//
//  Возвращаемое значение:
//   Массив - массив символов строки
//
Функция ВМассивС(Знач НачальныйИндекс) Экспорт
	Возврат ВМассив(НачальныйИндекс);
КонецФункции

// Преобразовывает строку в массив символов до конечного индекса
//
// Параметры:
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   Массив - массив символов строки
//
Функция ВМассивПо(Знач КонечныйИндекс) Экспорт
	Возврат ВМассив(, КонечныйИндекс);
КонецФункции

// Преобразовывает строку в класс "ЧтениеСтроки" символов между индексами
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   ЧтениеСтроки - класс ЧтениеСтроки
//
Функция ВЧтениеСтроки(НачальныйИндекс = Неопределено, КонечныйИндекс = Неопределено) Экспорт

	Возврат Новый ЧтениеСтроки(ВСтроку(НачальныйИндекс, КонечныйИндекс));

КонецФункции

// Преобразовывает строку в класс "ЧтениеСтроки" символов с начального индекса
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//
//  Возвращаемое значение:
//   ЧтениеСтроки - класс ЧтениеСтроки
//
Функция ВЧтениеСтрокиС(НачальныйИндекс) Экспорт

	Возврат Новый ЧтениеСтроки(ВСтрокуС(НачальныйИндекс));

КонецФункции

// Преобразовывает строку в класс "ЧтениеСтроки" символов до конечного индекса
//
// Параметры:
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   ЧтениеСтроки - класс ЧтениеСтроки
//
Функция ВЧтениеСтрокиПо(КонечныйИндекс) Экспорт

	Возврат Новый ЧтениеСтроки(ВСтрокуПо(КонечныйИндекс));

КонецФункции

// Преобразовывает строку массив символов между индексами
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   строка -  строка между индексами
//
Функция ВСтроку(Знач НачальныйИндекс = Неопределено, Знач КонечныйИндекс = Неопределено) Экспорт

	Если НачальныйИндекс = Неопределено
		И КонечныйИндекс = Неопределено Тогда
		Возврат СтрокаЧтения;
	КонецЕсли;

	Если (ТипЗнч(КонечныйИндекс) = Тип("Число")
		И КонечныйИндекс > ДлинаМассива)
		Или КонечныйИндекс = Неопределено Тогда

		КонечныйИндекс = ДлинаМассива;

	КонецЕсли;

	Возврат СтрСоединить(ВМассив(НачальныйИндекс, КонечныйИндекс));

КонецФункции

// Преобразовывает строку массив символов с начального индекса
//
// Параметры:
//   НачальныйИндекс - Число - начальный индекс символа строки
//
//  Возвращаемое значение:
//   строка -  строка с начального индекса
//
Функция ВСтрокуС(НачальныйИндекс) Экспорт
	Возврат ВСтроку(НачальныйИндекс);
КонецФункции

// Преобразовывает строку массив символов до конечного индекса
//
// Параметры:
//   КонечныйИндекс - Число - конечный индекс символа строки
//
//  Возвращаемое значение:
//   строка -  строка до конечного индекса
//
Функция ВСтрокуПо(КонечныйИндекс) Экспорт
	Возврат ВСтроку(, КонечныйИндекс);
КонецФункции

// Последовательное чтение строки по индексам
//
// Параметры:
//   Прибавка - Число - прибавка к индексу для чтения (по умолчанию 1)
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция Читать(Знач Прибавка = 1) Экспорт

	Если ПервоеЧтение Тогда
		ПервоеЧтение = Ложь;
		Возврат Истина;
	КонецЕсли;

	Если КонецСтроки() Тогда
		Возврат Ложь;
	КонецЕсли;

	Лог.Отладка("Выполняю чтение");

	ТекущийИндекс = ТекущийИндекс + Прибавка;

	Возврат Истина;

КонецФункции

// Последовательное чтение строки по индексам с условием
//
// Параметры:
//   ПроверкаПродолженияЧтения - булево - признак приостановки чтения строки
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция ЧитатьПока(Знач ПроверкаПродолженияЧтения) Экспорт

	Если НЕ ПроверкаПродолженияЧтения Тогда
		Назад();
		Возврат Ложь;
	КонецЕсли;

	Возврат Читать();

КонецФункции

// Последовательное чтение строки по индексам с ограничением
//
// Параметры:
//   ОграничениеЧтения - строка - ограничение чтения строки по условию
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция ЧитатьДо(Знач ОграничениеЧтения = Неопределено) Экспорт

	НачальныйИндекс = ТекущийИндекс;
	УспешноПрочитали = Ложь;

	Лог.Отладка("ЧитатьДо: ОграничениеЧтения: %1", ОграничениеЧтения);

	Если ТипЗнч(ОграничениеЧтения) = Тип("Строка") Тогда
		ПродолжитьЧтение = Ложь;

		Пока Читать() Цикл

			ПродолжитьЧтение = Истина;

			Выполнить(ОграничениеЧтения);

			Если Не ПродолжитьЧтение Тогда
				УспешноПрочитали = Истина;
				Прервать;
			КонецЕсли;

		КонецЦикла;

		Если УспешноПрочитали Тогда
			Назад();
		КонецЕсли;

		Если ПродолжитьЧтение
			И КонецСтроки() Тогда
			УспешноПрочитали = Истина;
		КонецЕсли;

	ИначеЕсли ТипЗнч(ОграничениеЧтения) = Тип("Число") Тогда
		УспешноПрочитали = ЧитатьДоИндекса(ОграничениеЧтения);
	КонецЕсли;

	Если НЕ УспешноПрочитали Тогда
		ТекущийИндекс = НачальныйИндекс;
	КонецЕсли;

	Возврат УспешноПрочитали;

КонецФункции

// Последовательное чтение строки по индексам с ограничением по индексу
//
// Параметры:
//   ТребуемыйИндекс - Число - нужный индекс чтения
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция ЧитатьДоИндекса(Знач ТребуемыйИндекс) Экспорт

	Если МассивСимволов.ВГраница() < ТребуемыйИндекс Тогда
		Возврат Ложь;
	КонецЕсли;

	ТекущийИндекс = ТребуемыйИндекс - 1;

	Возврат Истина;

КонецФункции

// Последовательное чтение строки по индексам с условию по символу
//
// Параметры:
//   ВходящийСимвол - Символ - нужный символ строки
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция ЧитатьДоСимвола(Знач ВходящийСимвол) Экспорт

	Возврат ЧитатьДо(СтрШаблон("ПродолжитьЧтение = НЕ ЭтоСимвол(""%1"")", ВходящийСимвол));

КонецФункции

// Функция перемещает индекс чтения строки назад на 1 символ
//
//  Возвращаемое значение:
//   Объект.ЧтениеСтроки - ссылка на текущий класс ЧтениеСтроки
//
Функция Назад() Экспорт

	ТекущийИндекс = ТекущийИндекс - 1;

	Возврат ЭтотОБъект;

КонецФункции

// Функция сбрасывает индекс чтения строки на 0
//
//  Возвращаемое значение:
//   Объект.ЧтениеСтроки - ссылка на текущий класс ЧтениеСтроки
//
Функция СброситьЧтение() Экспорт

	ТекущийИндекс = 0;

	Возврат ЭтотОБъект;

КонецФункции

// Последовательное чтение строки по индексам на Н символов
//
// Параметры:
//   Прибавка - Число - прибавка к индексу для чтения (по умолчанию 1)
//
//  Возвращаемое значение:
//   булево - результат чтения 
//            * Истина - при успешном чтении
//
Функция ЧитатьНа(Знач Прибавка = 1) Экспорт

	Возврат Читать(Прибавка);

КонецФункции

// Получает и возвращает символ по текущему индексу
//
//  Возвращаемое значение:
//   строка - текущий символ по индексу
//
Функция ПолучитьСимвол() Экспорт

	Возврат МассивСимволов[ТекущийИндекс];

КонецФункции

// Выполняем проверку текущего символа на "[a-zA-Zа-яА-Я]"
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке по регулярному выражению
//
Функция ЭтоБуква() Экспорт

	Значение = ПолучитьСимвол();

	РегуляркаДляПочты =  Новый РегулярноеВыражение("[a-zA-Zа-яА-Я]");
	КоллекцияСовпадений = РегуляркаДляПочты.НайтиСовпадения(Значение);

	Возврат КоллекцияСовпадений.Количество() = 1;

КонецФункции

// Выполняем проверку текущего символа на "[A-ZА-Я]"
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке по регулярному выражению
//
Функция ЭтоБольшаяБуква() Экспорт

	Значение = ПолучитьСимвол();

	РегуляркаДляПочты =  Новый РегулярноеВыражение ("[A-ZА-Я]");
	КоллекцияСовпадений = РегуляркаДляПочты.НайтиСовпадения(Значение);

	Возврат КоллекцияСовпадений.Количество() = 1;

КонецФункции

// Выполняем проверку текущего символа на "[a-zа-я]"
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке по регулярному выражению
//
Функция ЭтоМаленькаяБуква() Экспорт

	Значение = ПолучитьСимвол();

	РегуляркаДляПочты =  Новый РегулярноеВыражение ("[a-zа-я]");
	КоллекцияСовпадений = РегуляркаДляПочты.НайтиСовпадения(Значение);

	Возврат КоллекцияСовпадений.Количество() = 1;

КонецФункции

// Выполняем проверку текущего символа на "\d"
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке по регулярному выражению
//
Функция ЭтоЧисло() Экспорт

	Значение = ПолучитьСимвол();

	РегуляркаДляПочты =  Новый РегулярноеВыражение ("\d");
    КоллекцияСовпадений = РегуляркаДляПочты.НайтиСовпадения(Значение);

    Возврат КоллекцияСовпадений.Количество() = 1;

КонецФункции

// Выполняем проверку текущего символа на переданный символ
//
// Параметры:
//   СимволПроверки - Строка, Символ - символ проверки
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке на равенство символу
//
Функция ЭтоСимвол(Знач СимволПроверки) Экспорт

	Возврат ПолучитьСимвол() = СимволПроверки;

КонецФункции

// Получает и возвращает символ по текущему индексу
//
//  Возвращаемое значение:
//   строка - текущий символ по индексу
//
Функция ТекущийСимвол() Экспорт

	Возврат ПолучитьСимвол();

КонецФункции

// Получает и возвращает символ по следующему индексу без чтения
//
//  Возвращаемое значение:
//   строка - текущий символ по индексу
//
Функция СледующийСимвол() Экспорт

	ЗапределамиМассива = ТекущийИндекс + 1 > МассивСимволов.ВГраница();
	Если ЗапределамиМассива Тогда
		Возврат "";
	КонецЕсли;

	Возврат МассивСимволов[ТекущийИндекс + 1];

КонецФункции

// Выполняем проверку следующего символа на переданный символ без чтения строки
//
// Параметры:
//   СимволПроверки - Строка, Символ - символ проверки
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - при успешном проверке на равенство символу
//
Функция СледующийСимволЭто(Знач СимволПроверки) Экспорт

	Значение = СледующийСимвол();

	Возврат Значение = СимволПроверки;

КонецФункции

// Получает и возвращает текущий индекс
//
//  Возвращаемое значение:
//   число - текущий индекс
//
Функция ТекущийИндекс() Экспорт
	Возврат ТекущийИндекс;
КонецФункции

// Выполняет проверку на конец строки при чтении
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - если чтение строки закончилось
//
Функция КонецСтроки() Экспорт

	Если ДлинаМассива = -1 Тогда
		Возврат Истина;
	КонецЕсли;

	Возврат ТекущийИндекс = МассивСимволов.ВГраница();

КонецФункции

// Выполняет проверку на текущий индекс строки при чтении находится за пределами массива
//
//  Возвращаемое значение:
//   булево - результат проверки 
//            * Истина - если текущий индекс за пределами массива чтения
//
Функция ИндексЗаПределомМассива() Экспорт

	Возврат ТекущийИндекс > МассивСимволов.ВГраница();

КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.string_read");