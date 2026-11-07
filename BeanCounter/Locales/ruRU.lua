--[[
	BeanCounter - Localization (ruRU)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.ruRU = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "Настройки BeanCounter";
		["C_BeanCounterDatabaseMaintenance"]	= "Обслуживание базы данных";
		["C_BeanCounterOptions"]	= "Настройки BeanCounter";
		["C_ColorizeSearch"]	= "Добавить градиент цвета для каждого результата в окне поиска";
		["C_DatabaseLength"]	= "Определить, как долго BeanCounter должен хранить данные о торговых операциях.";
		["C_DataMaintenance"]	= "Обработка данных";
		["C_DateString"]	= "Используемый формат даты:";
		["C_DateStringExample"]	= "Пример даты:";
		["C_ExtenalSearch"]	= "Позволить сторонним аддонам использовать поиск BeanCounter'а?";
		["C_MailInvoiceTimeout"]	= "Таймаут получения почты = %d секунд";
		["C_MailRecolor"]	= "Способ окрашивания почты";
		["C_ModTTShow"]	= "Отображать доп. подсказку только если нажат ALT";
		["C_MonthsToKeep"]	= "Сколько месяцев сохранять данные?";
		["C_OpacityLevel"]	= "Уровень прозрачности";
		["C_Resortascendingtime"]	= "Сортировать записи по возрастанию времени";
		["C_ResortDatabase"]	= "Сортировать базу данных";
		["C_ScanDatabase"]	= "Проверка базы данных: воспользуйтесь, если при поиске возникают ошибки. \n Создайте резервную копию данных перед использованием.";
		["C_SearchConfiguration"]	= "Поиск Конфигурации";
		["C_SendToSearch"]	= "Добавить предметы, найденные BeanCounter, в главное окно?";
		["C_ShowBeginnerTooltips"]	= "Показывать всплывающие подсказки при наведении мыши.";
		["C_ShowReasonPurchase"]	= "Показывать цель покупки во всплывающей подсказке.";
		["C_ValidateDatabase"]	= "Проверка базы данных.";

		-- Section: Generic Strings
		["NoRe-Color"]	= "Не изменять цвет";
		["off"]	= "выкл";
		["Ok"]	= "Ok";
		["on"]	= "вкл";
		["Re-ColorIcons"]	= "Изменить цвет иконок";
		["Re-ColorIconsandText"]	= "Изменить цвет иконок и текста";
		["Re-ColorText"]	= "Изменить цвет текста";
		["TooltipFailed"]	= "Не удалось получить информацию для всплывающей подсказки";
		["UiNeutralCheckBox"]	= "Нейтральные аукционы АО";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter сохраняет причины покупки предметов и отображает их в подсказке.";
		["A_DateString"]	= "Эта опция определяет, как будет отображаться дата в окне BeanCounter'а. Каждая команда должна начинаться со знака % (несколько команд и текст могут быть объединены). Например, при значении %a == %X дата будет отображаться так: Mon == 21:34:21";
		["A_DateStringCommands"]	= "Комманды: \n %a = аббр. дня недели,  \n %A = полное название дня недели, \n %b = аббр. месяца, \n %B = month name - название месяца, \n %c = дата и время, \n %d = день месяца, \n %H = часы (24), \n %I = часы (12),\n %M = минуты,\n %m = месяц (12),\n  %p = am/pm, \n %S = секунды,\n %U = номер недели в году,\n %w = день недели (0-6),\n %x = дата, \n %X = время,\n %Y = год (2008), \n %y = год из двух цифр (07)";
		["A_ExtenalSearch"]	= "Другие аддоны могут использовать поиск BeanCounter'а. Например, это позволит BeanCounter'у показывать свои данные в окне Appraiser'а";
		["A_MailInvoiceTimeout"]	= "Время ожидания ответа от сервера при посылке запросов почте аукциона. Запросы могут быть - \"кто\", \"что\" и \"как\".";
		["A_MailRecolor"]	= "BeanCounter просматривает всю почту, поступающую от аукционного дома. Этот параметр указывает BeanCounter'у как необходимо окрашивать сообщения, чтобы они выглядели непрочитанными.";
		["HelpGuiItemBox"]	= "Поместите предмет в ячейку для поиска.";
		["Q_BeanCountersTooltip"]	= "Что такое подсказка BeanCounter'а";
		["Q_DateString"]	= "Используемый формат даты?";
		["Q_DateStringCommands"]	= "Приемлемые команды даты?";
		["Q_ExtenalSearch"]	= "Позволить сторонним аддонам использовать BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "Что такое таймаут получения почты?";
		["Q_MailRecolor"]	= "Что такое метод окрашивания почты?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Макс. кол-во отображаемых результатов поиска (для каждой базы данных)";
		["TTDataExpireEnabled"]	= "Данные, созданные ранее указонного периода будут УДАЛЕНЫ";
		["TT_ColorizeSearch"]	= "Эта настройка изменяет цвета отображения предметов в окне поиска BeanCounter.";
		["TT_MaxDisplayedResults"]	= "Это управляет общим числом результатов, отображаемых в окне прокрутки.";
		["TT_neutralCheck"]	= "Показать данные нейтральных аукционов домов АО";
		["TT_OpacityLevel"]	= "Управляет уровнем прозрачности цветных линеек в окне поиска BeanCounter (если они разрешены)";
		["TT_sendtosearch"]	= "Данные, введенные в окне поиска BeanCounter добавляются в окно просмотра Аукциона.";

		-- Section: Interface
		["Cancelled"]	= "Отменен";
		["UiAucCancelled"]	= "Аукцион отменен";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Аукционный дом Альянса";
		["MailHordeAuctionHouse"]	= "Аукционный дом Орды";
		["MailNeutralAuctionHouse"]	= "Аукцион Черной Воды";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Введите формат, в котором Вы хотели бы видеть отображаемую дату. По умолчанию %c";
		["TTDateStringExample"]	= "Пример даты, отформатированной в соответствии с текущими параметрами.";
		["TTExtenalSearch"]	= "Когда производится поиск в другом аддоне, BeanCounter будет также отображать поиск для этого предмета.";
		["TTMailInvoiceTimeout"]	= "Выбор того, как долго BeanCounter будет пытаться получить входящую почту с сервера до прекращения попыток. Меньшее значение == быстрее, но велик риск потерять часть данных, большее значение == медленнее, но увеличивает шансы получить данные, даже если почтовый сервер слишком занят.";
		["TTMailRecolor"]	= "Выберите, как именно будет отображаться почта, после того, как BeanCounter просканирует почтовый ящик.";
		["TTModTTShow"]	= "Эта настройка отображает доп. подсказки BeanCounter только если нажат ALT";
		["TTOpenconfig"]	= "Открывает окно настроек BeanCounter";
		["TTResort Database"]	= "Пересортировка данных BeanCounter'а по возрастанию времени. Это ускорит функции сжатия базы.";
		["TTShowBeginnerTooltips"]	= "Включает всплывающие подсказки, отображаемые при наведении мыши.";
		["TTShowReasonPurchase"]	= "Включает отображение причины покупки в подсказке.";
		["TTValidateDatabase"]	= "Просканировать данные BeanCounter'а и попытаться исправить ошибки. Воспользуйтесь данной функцией, если вы получаете ошибки при поиске.";
		["TT_AuctionCheck"]	= "Отображать предметы, проданные на аукционе";
		["TT_AuctionFailedCheck"]	= "Отображать предметы, которые не удалось продать.";
		["TT_BeanCounterAHTab"]	= "Кликните правой клавишей для показа BeanCounter в отдельном окне.";
		["TT_BeanCounterSelectBox"]	= "Фильтровать результаты поиска по серверу, персонажу или фракции.";
		["TT_BidCheck"]	= "Отображать предметы, купленные на аукционе.";
		["TT_BidFailedCheck"]	= "Отображать предметы, на которые вы сделали ставку.";
		["TT_ClassicCheck"]	= "Отображать результаты из базы данных BeanCounter Classic.";
		["TT_ExactCheck"]	= "Искать только те предметы, название которых в точности совпадает с текстом в строке поиска.";
		["TT_ItemIconBox"]	= "Перетащите предмет, чтобы начать его поиск.\n Отобразить иконку искомого (если возможно)";
		["TT_ScrollHeader"]	= "\nПКМ - изменение размера\nCTRL+ПКМ - сброс";
		["TT_SearchBox"]	= "Введите поисковый запрос здесь или оставьте пустым, чтобы найти всё";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Аукционная база данных";
		["UiAucExpired"]	= "Просроченный аукцион";
		["UiAucSuccessful"]	= "Успешный аукцион";
		["UiAuctions"]	= "Аукционы";
		["UiAuctionTransaction"]	= "Аукцион";
		["UiBids"]	= "Ставки";
		["UiBidTransaction"]	= "Ставка";
		["UiBuyerSellerHeader"]	= "Покупатель/Продавец";
		["UiBuyTransaction"]	= "Цена выкупа";
		["UiClassicCheckBox"]	= "Показать данные BC Classic";
		["UiData"]	= "Данные";
		["UiDateHeader"]	= "Дата";
		["UiDepositTransaction"]	= "Депозит";
		["UiDone"]	= "Завершить";
		["UiExactNameSearch"]	= "Поиск точного совпадения";
		["UiFailedAuctions"]	= "Не состоявшиеся аукционы";
		["UiFee"]	= "Оплата";
		["UiMailFrameRecording"]	= "BeanCounter сканирует вашу почту";
		["UiMailFrameWait1"]	= "Пожалуйста, не закрывайте почтовое окно, иначе";
		["UiMailFrameWait2"]	= "данные не будут корректно обработаны";
		["UiNameHeader"]	= "Предмет";
		["UiNetHeader"]	= "Нетто";
		["UiNetPerHeader"]	= "Нетто за";
		["UiOutbid"]	= "Ставка перебита";
		["UiOutbids"]	= "Перебитые ставки";
		["UiPriceHeader"]	= "Цена";
		["UiPriceper"]	= "Цена за шт.";
		["UiPricePerHeader"]	= "Заголовок Цены";
		["UiPurchases"]	= "Покупки";
		["UiQuantityHeader"]	= "Кол-во";
		["UiReason"]	= "Причина";
		["UiSales"]	= "Продажи";
		["UiSearch"]	= "Поиск";
		["UiSearchForLabel"]	= "Поиск:";
		["UiSellTransaction"]	= "Продажа";
		["UiServer"]	= "Сервер";
		["UiTransactions"]	= "Операции";
		["UiTransactionsLabel"]	= "Операции:";
		["UiTransactionTypeHeader"]	= "Тип";
		["UiWealth"]	= "Состояние";
		["UiWononBid"]	= "Выиграно по ставке";
		["UiWononBuyout"]	= "Выиграно по выкупу";

}
