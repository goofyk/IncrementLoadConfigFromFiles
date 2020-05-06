#Использовать "."
#Использовать cli


///////////////////////////////////////////////////////////////////////////////

Процедура ВыполнитьПриложение()

    Приложение = Новый КонсольноеПриложение("load", "Приложение для загрузки файлов конфигурации 1С", ЭтотОбъект);
    //Приложение.Версия("v version","1.0.0");

    Приложение.ДобавитьКоманду("i inc", "Инкрементальная загрузка конфигурации", Новый ИнкрементальнаяЗагрузка);
    Приложение.ДобавитьКоманду("d diff", "Получение файла со списком файлов для инкрементальной загрузки", Новый ПолучениеФайлаРазличий);

    Приложение.Запустить(АргументыКоманднойСтроки);

КонецПроцедуры // ВыполнениеКоманды()

Процедура ОписаниеКоманды(Команда) Экспорт

	//Сообщить(ОтладкаКоманда.Значение);

    //Команда.ДобавитьПодкоманду("c command", "Генерация дополнительной вложенной команды", Новый КомандаGenerateCommand);
    //Команда.ДобавитьКоманду("", "Генерация опции для команды", Новый КомандаGeneratOption);

КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
    КомандаПриложения.ВывестиСправку();
КонецПроцедуры

///////////////////////////////////////////////////////

Попытка

    ВыполнитьПриложение();

Исключение

    Сообщить(ОписаниеОшибки());

КонецПопытки;