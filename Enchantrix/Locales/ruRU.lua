--[[
	Enchantrix - Localization (ruRU)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.ruRU = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Очищает всю информацию о зачаровывании";
		["FrmtActClearFail"]	= "Невозможно найти предмет: %s";
		["FrmtActClearOk"]	= "Очищена информация о предмете: %s";
		["FrmtActDefault"]	= "Опция %s Enchantrix'а была сброшена на уст.по умолчанию";
		["FrmtActDefaultAll"]	= "Все опции Enchantrix'а были сброшены на уст.по умолчанию";
		["FrmtActDisable"]	= "Не показывать данные по вещи %s";
		["FrmtActEnable"]	= "Показывать данные по вещи %s";
		["FrmtActSet"]	= "Установите %s до '%s'";
		["FrmtActUnknown"]	= "Неизвестная команда: '%s'";
		["FrmtActUnknownLocale"]	= "Указанная локаль ('%s') неизвестна. Действительные локали:";
		["FrmtPrintin"]	= "Сообщения Encantrix'а теперь будут печататься в чате \"%s\"";
		["FrmtUsage"]	= "Использование:";
		["MesgDisable"]	= "Отключить автоматическую загрузку Enchantrix'а";
		["MesgNotloaded"]	= "Enchantrix не загружен. Напечатайте /enchantrix для большей информации.";

		-- Section: Command Options
		["CmdClearAll"]	= "все";
		["OptClear"]	= "([Item]|all)";
		["OptDefault"]	= "(<option>|all)";
		["OptFindBidauct"]	= "<silver>";
		["OptFindBuyauct"]	= "<percent>";
		["OptLocale"]	= "<locale>";
		["OptPrintin"]	= "(<frameIndex>[Number]|<frameName>[String])";

		-- Section: Commands
		["CmdClear"]	= "Очистить";
		["CmdDefault"]	= "Стандартные";
		["CmdDisable"]	= "Выключить";
		["CmdFindBidauct"]	= "bidbroker";
		["CmdFindBidauctShort"]	= "bb";
		["CmdFindBuyauct"]	= "percentless";
		["CmdFindBuyauctShort"]	= "pl";
		["CmdHelp"]	= "помощь";
		["CmdOff"]	= "выключить";
		["CmdOn"]	= "включить";
		["CmdPrintin"]	= "print-in";
		["CmdToggle"]	= "переключить";
		["ConfigUI"]	= "настройка";
		["ShowDELevels"]	= "уровни";
		["ShowDEMaterials"]	= "материалы";
		["ShowEmbed"]	= "вставлять";
		["ShowGuessAuctioneerVal"]	= "оценить-val";
		["ShowGuessBaseline"]	= "базовая оценка";
		["ShowTerse"]	= "сжатый";
		["ShowUI"]	= "показать";
		["ShowValue"]	= "Оценка стоимости";
		["StatOff"]	= "Не показывать данные зачаровывания";
		["StatOn"]	= "Показывать сконфигурированные данные по зачаровыванию";

		-- Section: Config Text
		["GuiLoad"]	= "Загрузка Enchantrix";
		["GuiLoad_Always"]	= "всегда";
		["GuiLoad_Never"]	= "никогда";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Измельчение";
		["ArgSpellname"]	= "Распыление";
		["ArgSpellProspectingName"]	= "Просеивание";
		["Enchanting"]	= "Наложение чар";
		["Inscription"]	= "Начертание";
		["Jewelcrafting"]	= "Ювелирное дело";
		["PatReagents"]	= "Реагенты: (.+)";
		["TextCombat"]	= "Бой";
		["TextGeneral"]	= "Основной";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(на  можно поделиться собранной аддоном информацией)";
		["FrmtWelcome"]	= "Enchantrix v%s загружен";
		["MesgAuctVersion"]	= "Для работы Enchantrix требуется аддон Auctioneer версии 4.0 или выше. Некоторые возможности будут недоступны, пока вы не обновите Auctioneer.";

		-- Section: Help Text
		["GuiAltChatlink"]	= "Открывать подсказки из ссылок в чате при щелчке ЛКМ и нажатом Alt";
		["GuiClearall"]	= "Очистить все данные Enchantrix";
		["GuiClearallButton"]	= "Очистить всё";
		["GuiClearallHelp"]	= "Нажмите сюда, чтобы очистить все данные Enchantrix для текущего сервера.";
		["GuiClearallNote"]	= "для текущих сервера-фракции";
		["GuiDefaultAll"]	= "Сбросить все настройки Enchantrix";
		["GuiDefaultAllButton"]	= "Сбросить всё";
		["GuiDefaultAllHelp"]	= "Нажмите сюда для возврата всех настроек Enchantrix к их первоначальным значениям. ВНИМАНИЕ: Это действие НЕЛЬЗЯ ОТМЕНИТЬ.";
		["GuiDefaultOption"]	= "Сбросить данный параметр";
		["GuiDELevels"]	= "Показать в подсказке уровень зачарования, необходимый для распыления предмета";
		["GuiDEMaterials"]	= "Показать, на какие материалы в среднем распыляется предмет";
		["GuiEmbed"]	= "Внедрить информацию в игровую подсказку";
		["GuiLocale"]	= "Сменить локаль на";
		["GuiMainEnable"]	= "Включить Enchantrix";
		["GuiMainHelp"]	= "Содержит настройки для Enchantrix, аддона, который показывает во всплывающей подсказке предмета информацию о возможных результатах его разбиения.";
		["GuiOtherHeader"]	= "Другие настройки";
		["GuiOtherHelp"]	= "Различные настройки Enchantrix";
		["GuiPrintin"]	= "Выбирает желаемое окно сообщений";
		["GuiPrintYieldsInChat"]	= "Показать добычу из вещей в чате";
		["GuiShowCraftReagents"]	= "Показать скрафченные реагенты во всплывающей подсказке предмета";
		["GuiTerse"]	= "Включить сжатый режим";
		["GuiValuateAverages"]	= "Оценивать по средним ценам Auctioneer-а";
		["GuiValuateBaseline"]	= "Оценивать по встроенным данным";
		["GuiValuateEnable"]	= "Разрешить оценку";
		["GuiValuateHeader"]	= "Оценка";
		["GuiValuateMedian"]	= "Оценивать с медианными значениями Auctioneer";
		["HelpAltChatlink"]	= "Включить подсказку над ссылкой на предмет в чате при щелчке ЛКМ над ней и нажатом ALT.";
		["HelpClear"]	= "Очистить данные для определённого предмета (\"Shift+щелчок\" для вставки предмета в команду). Вы также можете использовать специальное ключевое слово \"all\".";
		["HelpDefault"]	= "Установить опцию к значению по умолчанию. Вы также можете использовать специальное ключевое слово \"all\" для установки всех настроек Enchantrix'а к их значениям по умолчанию.";
		["HelpDisable"]	= "Не загружать enchantrix в следующий раз, когда Вы войдете в игру.";
		["HelpEmbed"]	= "Отображать текст в верхней подсказке. (Некоторые возможности будут отключены).";
		["HelpFindBidauct"]	= "Поиск аукционов, возможная стоимость которых после разбиения на заданное количество серебряных монет ниже стоимости ставки.";
		["HelpFindBuyauct"]	= "Поиск аукционов, чьи цены выкупа равны определённому проценту, меньшему, чем возможная ценность разбиения (и опционально - определённому количеству, меньшему, чем ценность разбиения).";
		["HelpGuessAuctioneer5Val"]	= "Если определение стоимости включено и Аукционер установлен, то отображаются рыночные цены на разбиение предмета.";
		["HelpGuessAuctioneerHsp"]	= "Если определение стоимости включено и Аукционер установлен, то отображается оценка цены продажи (HSP) для разбиваемого предмета.";
		["HelpGuessAuctioneerMedian"]	= "Если оценка разрешена, и вы установили Auctioneer, то отображается средняя цена разбиения предмета.";
		["HelpGuessBaseline"]	= "Если определение стоимости включено (установленный Аукционер не нужен), то отображает базовую стоимость разбиваемого предмета, основанную на встроенных ценах.";
		["HelpGuessNoauctioneer"]	= "Команды для оценки не доступны, так как у Вас не установлен Аукционер.";
		["HelpLoad"]	= "изменить настройки Enchantrix-а, загрузив их с этого профиля";
		["HelpLocale"]	= "Изменить локаль, которая используется для отображения сообщений Enchantrix'а.";
		["HelpOnoff"]	= "Включает и отключает отображение данных зачаровывания.";
		["HelpPrintin"]	= "Выбор, как окно Enchantix-а будет выводить сообщения. Вы можете настроить название рамки или индекс.";
		["HelpShowDELevels"]	= "Определяет, отображать ли в подсказке уровень скила зачаровывания, необходимый для распыления предмета.";
		["HelpShowDEMaterials"]	= "Определяет, показывать ли возможные материалы распыления во всплывающей подсказке предмета.";
		["HelpShowUI"]	= "Показать или спрятать панель настроек.";
		["HelpTerse"]	= "Включение/выключение сжатого режима, показывающего только стоимость распыления. Может быть временно отключен путём удержания клавиши \"Ctrl\".";
		["HelpValue"]	= "Выбирает отображать или нет оценённую стоимость предмета, основанную на соотношениях возможного распыления.";
		["ModTTShow_Help"]	= "Эта установка покажет экстра-тултип Enchantrix только если нажат ALT";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "Вы не установили Auctioneer. Auctioner должен быть установлен для того, чтобы сканировать аукцион.";
		["AuctionScanVersionTooOld"]	= "У Вас не установлена правильная версия Auctioneer, эта функция требует Auctioneer версии 4.0 или выше.";
		["ChatDeletedProfile"]	= "Профиль удалён:";
		["ChatDuplicatedProfile"]	= "Дублировать профиль в:";
		["ChatResetProfile"]	= "Сброшены настройки профиля";
		["ChatSavedProfile"]	= "Сохранен профиль";
		["ChatUsingProfile"]	= "Используется профиль";
		["FrmtAutoDeActive"]	= "Автоматическое распыление включено";
		["FrmtAutoDeDisabled"]	= "Автоматическое распыление отключено";
		["FrmtAutoDeDisenchantCancelled"]	= "Распыление отменено: предмет не найден";
		["FrmtAutoDeDisenchanting"]	= "Распыление %s";
		["FrmtAutoDeIgnorePermanent"]	= "%s игнорируется постоянно";
		["FrmtAutoDeIgnoreSession"]	= "%s игнорируется в течение сессии";
		["FrmtAutoDeInactive"]	= "Автоматическое распыление неактивно";
		["FrmtAutoDeMilling"]	= "Измельченно %s";
		["FrmtAutoDeMillingCancelled"]	= "Измельчение оконченно: предмет не найден";
		["FrmtAutoDeProspectCancelled"]	= "Просеивание отменено: предмет не найден.";
		["FrmtAutoDeProspecting"]	= "Просеивание %s";
		["FrmtBidbrokerCurbid"]	= "текСтавка";
		["FrmtBidbrokerDone"]	= "Ставка перебита";
		["FrmtBidbrokerHeader"]	= "Предлагает наличие %s экономии серебра в средней цене разбиения (min %%less = %d):";
		["FrmtBidbrokerLine"]	= "%s, Оценено как: %s, %s: %s, Экономия: %s, Less %s, Время: %s";
		["FrmtBidbrokerMinbid"]	= "минСтавка";
		["FrmtBidBrokerSkipped"]	= "Пропущенные %d аукционы из-за сокращения размера прибыли (%d%%)";
		["FrmtBidBrokerSkippedBids"]	= "Пропущенные %d аукционы из-за наличия ставок на них";
		["FrmtPctlessDone"]	= "Менее сделанный процент.";
		["FrmtPctlessHeader"]	= "Покупки имеющие %d%% экономии над средней ценой разбиения (min сбережения = %s):";
		["FrmtPctlessLine"]	= "%s, Оценено: %s, БО: %s, Экономия: %s, Меньше %s";
		["FrmtPctlessSkillSkipped"]	= "Пропущено %d аукцион(а\ов) из-за недостаточного уровня навыка (%s)";
		["FrmtPctlessSkipped"]	= "Пропущено %d аукцион(а\ов) из-за сокращения прибыльности (%s)";

		-- Section: Tooltip Messages
		["Click"]	= "Щелчок";
		["EnxMMTip"]	= "Enchantrix сообщает вам, какие реагенты можно получить при распылении, измельчении или просеивании. Также этот аддон интегрируется с Auctioneer, чтобы помочь в принятии решений о покупке и продаже.";
		["FrmtBarkerPrice"]	= "Barker цена (%d%% прибыль)";
		["FrmtDEItemLevels"]	= "Распылять предметы уровней от %d до %d.";
		["FrmtDisinto"]	= "Распыляется в:";
		["FrmtFound"]	= "Обнаружено, что %s распыляется в:";
		["FrmtFoundNotDisenchant"]	= "Обнаружено, что %s не распыляется";
		["FrmtInkFrom"]	= "Сделано %s";
		["FrmtMillingFound"]	= "Обнаружено, что %s измельчается в:";
		["FrmtMillingValueAuctHsp"]	= "Цена измельчения (HSP)";
		["FrmtMillingValueAuctMed"]	= "Цена измельчения (Среднее)";
		["FrmtMillingValueAuctVal"]	= "Цена измельчения (АукСовет)";
		["FrmtMillingValueMarket"]	= "Цена измельчения (Базовая стоимость)";
		["FrmtMillsInto"]	= "Измельчается в:";
		["FrmtPriceEach"]	= "(%s за шт.)";
		["FrmtProspectFound"]	= "Обнаружено, что %s просеивается в:";
		["FrmtProspectFrom"]	= "Просеивается из %s.";
		["FrmtProspectInto"]	= "Просеивается в:";
		["FrmtProspectValueAuctHsp"]	= "Цена просеивания (HSP)";
		["FrmtProspectValueAuctMed"]	= "Цена просеивания (среднее)";
		["FrmtProspectValueAuctVal"]	= "Цена просеивания (АукСовет)";
		["FrmtProspectValueMarket"]	= "Цена просеивания (база)";
		["FrmtSuggestedPrice"]	= "Рекомендуемая цена:";
		["FrmtTotal"]	= "Итого";
		["FrmtValueAuctHsp"]	= "Цена распыления (HSP)";
		["FrmtValueAuctMed"]	= "Цена распыления (среднее)";
		["FrmtValueAuctVal"]	= "Цена распыления (АукСовет)";
		["FrmtValueFixedVal"]	= "Цена распыления (Фиксир)";
		["FrmtValueMarket"]	= "Цена распыления (Основная)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer не загружен, использую полученные ранее данные]";
		["FrmtWarnNoPrices"]	= "[Цены неизвестны]";
		["FrmtWarnPriceUnavail"]	= "[Некоторые цены неизвестны]";
		["RightClick"]	= "Щелчок правой кнопки мыши";
		["ShiftClick"]	= "Shift-Щелчёк";
		["TipOpenConfig"]	= "редактировать настройки.";
		["TipOpenEnchant"]	= "для открытия окна Зачарования.";
		["TipOpenJewel"]	= "для открытия окна Ювелирного дела.";
		["TooltipMillingLevel"]	= "Для измельчения необходим уровень навыка %d";
		["TooltipProspectLevel"]	= "Для просеивания необходим уровень навыка %d";
		["TooltipShowDisenchantLevel"]	= "Для распыления необходим уровень навыка %d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "Для включения автоматического распыления предметов нужно установить аддон BeanCounter. С помощью этого аддона можно отследить, был ли куплен предмет специально для распыления, что позволит автоматизировать процедуру.";
		["ExportPriceAucAdv"]	= "Экспорт цен Enchantrix в Auctioneer Advanced";
		["GuiActivateProfile"]	= "Включить выбранный профиль";
		["GuiAutoDeBoughtForDE"]	= "Только предметы, купленные для распыления";
		["GuiAutoDeEnable"]	= "Поиск распыляемых предметов в сумках (Автораспыление - использовать с осторожностью!)";
		["GuiAutoDeEpicItems"]	= "Автораспыление превосходных предметов (\"эпиков\")";
		["GuiAutoDeOptions"]	= "Автоматизация";
		["GuiAutoDePromptLine1"]	= "Вы хотите распылить:";
		["GuiAutoDePromptLine3"]	= "Оценено: %s";
		["GuiAutoDEPurchaseReason"]	= "Куплен за %s";
		["GuiAutoDeRareItems"]	= "Автораспыление редких (\"синих\") предметов";
		["GuiAutoDESuggestion"]	= "Предложение: %s за эту вещь";
		["GuiAutoLootDE"]	= "Автоматически забирать распыленные\просеянные\измельченные в Ручную ингредиенты";
		["GuiAutoMillingPromptLine1"]	= "Вы хотите измельчить:";
		["GuiAutoProspectPromptLine1"]	= "Вы хотите просеять:";
		["GuiBBUnbiddedOnly"]	= "Ограничить (BidBroker) только на вещи без ставок";
		["GuiConfigProfiles"]	= "Создание и редактирование профилей";
		["GuiCreateReplaceProfile"]	= "Создать или заменить профиль";
		["GuiDefaultBBProfitPercent"]	= "Процент Bidbroker'а по умолчанию: %d";
		["GuiDefaultLessHSP"]	= "Процент по умолчанию HSP: %d";
		["GuiDefaultProfitMargin"]	= "Размер типовой прибыли:";
		["GuiDeleteProfileButton"]	= "Удалить";
		["GuiDuplicateProfileButton"]	= "Копировать";
		["GuiFixedSettings"]	= "Фиксированные цены на реагенты";
		["GuiFixedSettingsNote"]	= "Если галочка перед реагентом включена, то указанная стоимость будет использована вместо любых других цен (например, полученных из Auctioneer'а). На эту стоимость влияет калибровка ценности реагентов (производится в соответствующем разделе настроек). Поэтому, чтобы стоимость реагента совпадала с введенным значением, убедитесь, что в разделе калибровки напротив реагента стоит 100%.";
		["GuiGeneralOptions"]	= "Общие настройки";
		["GuiIgnore"]	= "Игнорировать";
		["GuiItemValueAuc4HSP"]	= "HSP для Аук";
		["GuiItemValueAuc4Median"]	= "Средняя для Аук";
		["GuiItemValueAuc5Appraiser"]	= "Значение оценщика (Appraiser) для АукСовет";
		["GuiItemValueAuc5Market"]	= "Рыночная цена для АукСовет";
		["GuiItemValueAverage"]	= "Среднее (по умолчанию)";
		["GuiItemValueBaseline"]	= "Базовая на рынке";
		["GuiItemValueCalc"]	= "Цена предмета рассчитывается от";
		["GuiMaxBuyout"]	= "Максимальная цена выкупа";
		["GuiMillingingValues"]	= "Показывать предполагаемые цены измельчения";
		["GuiMillingLevels"]	= "Показывать требования к уровню измельчения в подсказке";
		["GuiMillingMaterials"]	= "Показывать материалы измельчения в подсказке";
		["GuiMillingOptions"]	= "Опции измельчения";
		["GuiMinBBProfitPercent"]	= "Минимальный процент для ставки при перебивании на аукционе:";
		["GuiMinimapButtonAngle"]	= "Положение кнопки: %d";
		["GuiMinimapButtonDist"]	= "Расстояние: %d";
		["GuiMinimapOptions"]	= "Кнопка на мини-карте";
		["GuiMinimapShowButton"]	= "Отображать кнопку";
		["GuiMinLessHSP"]	= "Минимальный процент меньше HSP: %d";
		["GuiMinProfitMargin"]	= "Размер минимальной прибыли:";
		["GuiNewProfileName"]	= "Имя нового профиля";
		["GuiNo"]	= "Нет";
		["GuiPLBBOnlyBelowDESkill"]	= "Показывать только вещи, распыляемые на текущем уровне навыка";
		["GuiPLBBSettings"]	= "Проценты и Bidbroker настройки";
		["GuiProspectingLevels"]	= "Показывать требования к уровню просеивания в подсказке";
		["GuiProspectingMaterials"]	= "Показывать материалы просеивания в подсказке";
		["GuiProspectingOptions"]	= "Опции просеивания";
		["GuiProspectingValues"]	= "Показывать предполагаемые цены просеивания";
		["GuiResetProfileButton"]	= "Сбросить";
		["GuiSaveProfileButton"]	= "Сохранить";
		["GuiShowMatSources"]	= "Показать материал получаемый из вещей при распылении, просеивании и измельчении.";
		["GuiShowMilling"]	= "Показывать данные измельчения для трав";
		["GuiShowProspecting"]	= "Показывать данные просеивания для руды";
		["GuiTabAuctions"]	= "Аукционы";
		["GuiTabFixed"]	= "Фиксированная цена";
		["GuiTabGeneral"]	= "Главная";
		["GuiTabMilling"]	= "Измельчение";
		["GuiTabProfiles"]	= "Профили";
		["GuiTabProspecting"]	= "Просеивание";
		["GuiTabWeights"]	= "Вес";
		["GuiValueOptions"]	= "Настройки показа цены";
		["GuiValueShowAuc4HSP"]	= "Показывать HSP Аукционера для цены";
		["GuiValueShowAuc4Median"]	= "Показывать среднюю цену аукционера";
		["GuiValueShowAuc5Market"]	= "Показывать рыночную цену аукционера";
		["GuiValueShowBaseline"]	= "Показывать базовые цены";
		["GuiValueShowDEValues"]	= "Показывать предполагаемые цены распыления";
		["GuiValueTerse"]	= "Показывать сжатую цену распыления";
		["GuiWeighSettingsNote"]	= "Изменение веса оценки предоставленного реагента. В общем вы должны оставить их в 100%, до тех пор пока не найдете что они должны быть более или менее ценны чем вам предоставляет метод оценки, который вы используете. (The weights above change the valuation of the given reagent by the specified amount. Generally you will want to leave them at 100% unless you think they should be more or less valuable than the valuation method you are using is saying.)";
		["GuiWeightSettings"]	= "Желательный реагент при распылении";
		["GuiYes"]	= "Да";
		["ModTTShow"]	= "Показывать дополнительную подсказку только при нажатии Alt";
		["ModTTShow_alt"]	= "Когда нажат Alt";
		["ModTTShow_always"]	= "Всегда";
		["ModTTShow_ctrl"]	= "Когда нажат Ctrl";
		["ModTTShow_never"]	= "Никогда";
		["ModTTShow_noalt"]	= "Когда не нажат Alt";
		["ModTTShow_noctrl"]	= "Когда не нажат Ctrl";
		["ModTTShow_noshift"]	= "Когда не нажат Shift";
		["ModTTShow_shift"]	= "Когда нажат Shift";

}
