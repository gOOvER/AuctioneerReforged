--[[
	Enchantrix - Localization (csCZ)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.csCZ = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Mažu všechna data o enchantech";
		["FrmtActClearFail"]	= "Nelze najít předmět: %s";
		["FrmtActClearOk"]	= "Smazána data k předmětu: %s";
		["FrmtActDefault"]	= "Nastavení Enchantrixu '%s' bylo vráceno na základní hodnotu.";
		["FrmtActDefaultAll"]	= "Všechna nastavení Enchantrixu byla vrácena na základní hodnoty.";
		["FrmtActDisable"]	= "Vypnuto zobrazování dat předmětů o: %s";
		["FrmtActEnable"]	= "Zapnuto zobrazování dat předmetů o: %s";
		["FrmtActSet"]	= "Nastavit %s na '%s'";
		["FrmtActUnknown"]	= "Neznámý příkaz: '%s'";
		["FrmtActUnknownLocale"]	= "Zvoleny jazyk ('%s') neni dostupny. Dostupne jsou:";
		["FrmtPrintin"]	= "Enchantrix bude zpravy zobrazovat v okne: \"%s\"";
		["FrmtUsage"]	= "Pouzivani:";
		["MesgDisable"]	= "Vypinam automaticke spusteni Enchantrix";
		["MesgNotloaded"]	= "Enchantrix neni spusten. Napis /enchantrix a dozvis se vic.";

		-- Section: Command Options
		["CmdClearAll"]	= "vse";
		["OptClear"]	= "([Objekt]|vse)";
		["OptDefault"]	= "(<nastaveni>|vse)";
		["OptFindBidauct"]	= "<stribro>";
		["OptFindBuyauct"]	= "<procent>";
		["OptLocale"]	= "<jazyk>";
		["OptPrintin"]	= "(<frameIndex>[Number]|<frameName>[String])";

		-- Section: Commands
		["CmdClear"]	= "smazat";
		["CmdDefault"]	= "vychozi";
		["CmdDisable"]	= "vypnout";
		["CmdFindBidauct"]	= "bidbroker";
		["CmdFindBidauctShort"]	= "bb";
		["CmdFindBuyauct"]	= "procent-mene";
		["CmdFindBuyauctShort"]	= "pm";
		["CmdHelp"]	= "pomoc";
		["CmdLocale"]	= "jazyk";
		["CmdOff"]	= "vyp";
		["CmdOn"]	= "zap";
		["CmdPrintin"]	= "zobraz-v";
		["CmdToggle"]	= "prepnout";
		["ConfigUI"]	= "nastaveni";
		["ShowDELevels"]	= "urovne";
		["ShowDEMaterials"]	= "materialy";
		["ShowEmbed"]	= "integrace";
		["ShowGuessAuctioneerHsp"]	= "urcit-nuc";
		["ShowGuessAuctioneerMed"]	= "urcit-stred";
		["ShowGuessBaseline"]	= "urcit-zaklad";
		["ShowTerse"]	= "strucne";
		["ShowUI"]	= "zobrazit";
		["ShowValue"]	= "ohodnotit";
		["StatOff"]	= "Nejsou zobrazována žádná Enchant data";
		["StatOn"]	= "Jsou zobrazována vybraná Enchant data";

		-- Section: Config Text
		["GuiLoad"]	= "Spustit Enchantrix";
		["GuiLoad_Always"]	= "vzdy";
		["GuiLoad_Never"]	= "nikdy";

		-- Section: Game Constants
		["ArgSpellname"]	= "Disenchant";
		["PatReagents"]	= "Materiály: (.+)";
		["TextCombat"]	= "Boj";
		["TextGeneral"]	= "Obecne";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(navštiv  a poděl se o svá data)";
		["FrmtWelcome"]	= "Enchantrix v%s spuštěna";
		["MesgAuctVersion"]	= "Enchantrix potřebuje Auctioneer od verze 3.4. Dokud neprovedeš update své instalace Auctioneer, tvá Enchantrix nebude umět některé věci.";

		-- Section: Help Text
		["GuiClearall"]	= "Smazat všechna data Enchantrix";
		["GuiClearallButton"]	= "Smazat vše";
		["GuiClearallHelp"]	= "Klikni zde a smažou se všechny záznamy Enchantrix pro tento server";
		["GuiClearallNote"]	= "pro tento server a stranu";
		["GuiDefaultAll"]	= "Obnov všechna nastavení Enchantrix na základní hodnoty";
		["GuiDefaultAllButton"]	= "Obnovit vše";
		["GuiDefaultAllHelp"]	= "Klikni zde pro obnoveni vsech nastavení Enchantrix na základní hodnoty. POZOR: Všechny změny nastavení budou ztraceny";
		["GuiDefaultOption"]	= "Obnov toto nastavení";
		["GuiEmbed"]	= "Vkládat informace do nápovědy";
		["GuiLocale"]	= "Nastav jazyk na";
		["GuiMainEnable"]	= "Aktivovat Enchantrix";
		["GuiMainHelp"]	= "Obsahuje nastaveni Enchantrixu, AddOnu zobrazujího v nápovědách informace o zisku při provedení \"Disenchant\" na daný předmět.";
		["GuiOtherHeader"]	= "Dalsi moznosti";
		["GuiOtherHelp"]	= "Ruzne Enchantrix moznosti";
		["GuiPrintin"]	= "Vyber si textove okno";
		["GuiTerse"]	= "Nastavit stručné zobrazení";
		["GuiValuateAverages"]	= "Ohodnocovat podle průměrných hodnot od Auctioneer-a";
		["GuiValuateBaseline"]	= "Ohodnocovat podle vlastních dat";
		["GuiValuateEnable"]	= "Zapnout ohodnocování";
		["GuiValuateHeader"]	= "Ohodnocování";
		["GuiValuateMedian"]	= "Ohodnocovat podle mediánů od Auctioneer-a";
		["HelpClear"]	= "Smazat data k urcenemu objektu (shift - klikem ho vlozite do prikazu, nebo pouzijte urceni \"vse\" nebo \"all\")";
		["HelpDefault"]	= "Vrati urcene Enchantrix nastaveni na vychozi. Take lze pouzit urceni \"vse\" nebo \"all\" pro navrat vsech nastaveni na vychozi.";
		["HelpDisable"]	= "Deaktivuje automaticke zapinani Enchantrixu pri vstupu do hry";
		["HelpEmbed"]	= "Vkládat informace do nápověd(pozor: nektere funkce nejsou v tomto rezimu dostupne)";
		["HelpFindBidauct"]	= "Najde aukce u nichz je odhadovany zisk z \"Disenchant\" o urcenou sumu stribra vyssi nez momentalni naBIDka";
		["HelpFindBuyauct"]	= "Najde aukce u nichz je odhadovany zisk z \"Disenchant\" o urcenou sumu stribra vyssi nez Vykupni cena";
		["HelpGuessAuctioneerHsp"]	= "Je-li Ohodnocovani zapnuto a je-li instalovan Auctioneer - zobrazi Ohodnoceni podle Nejvyssi Uspesne Ceny (NUC) odhadovaného zisku z \"Disenchant\".";
		["HelpGuessAuctioneerMedian"]	= "Je-li Ohodnocovani zapnuto a je-li instalovan Auctioneer - zobrazi Ohodnoceni podle mediánu odhadovaného zisku z \"Disenchant\".";
		["HelpGuessBaseline"]	= "Je-li Ohodnocovani zapnuto (a Auctioneer neni zapotrebi) - zobrazi jednoduche Ohodnoceni podle vlastních tabulek odhadovaného zisku z \"Disenchant\".";
		["HelpGuessNoauctioneer"]	= "Ohodnocování NUC nebo mediánem nejsou k dispozici protoze nemas instalovany Auctioneer.";
		["HelpLoad"]	= "Nastavi spousteni Enchantrix pro tuto postavu";
		["HelpLocale"]	= "Nastavi jazyk Enchantrix zprav";
		["HelpOnoff"]	= "Nastavi zda se maji zobrazovat informace o ocarovani predmetu";
		["HelpPrintin"]	= "Nastavi v kterem okne ma Enchantrix zobrazovat zpravy. Muzete zvolit nazev okna nebo jeho index.";
		["HelpTerse"]	= "Přepínač stručného zobrazení, kdy se ukazuje pouze hodnota \"Disenchant\". Dá se obejít podržením \"Control\".";
		["HelpValue"]	= "Nastavi zda se ma zobrazovat odhadovaný zisk z \"Disenchant\" daného předmětu";

		-- Section: Report Messages
		["FrmtBidbrokerCurbid"]	= "soucBid";
		["FrmtBidbrokerDone"]	= "Prihazovani dokonceno";
		["FrmtBidbrokerHeader"]	= "Nabidky usetri %s stribra na prumerne hodnote odcarovani:";
		["FrmtBidbrokerLine"]	= "%s, Hodnota na: %s, %s: %s, Usetrit: %s, Mene %s, Cas: %s";
		["FrmtBidbrokerMinbid"]	= "minBid";
		["FrmtBidBrokerSkipped"]	= "Celkem %d aukcí vynecháno pro nedostatečný percentuální zisk (%d%%)";
		["FrmtPctlessDone"]	= "Procentuelni snizeni hotovo.";
		["FrmtPctlessHeader"]	= "Vykupy usetri %d%% oproti prumerne hodnote odcarovani:";
		["FrmtPctlessLine"]	= "%s, Hodnota na: %s, Vykup: %s, Usetrit: %s, Mene %s";
		["FrmtPctlessSkipped"]	= "Celkem %d aukcí vynecháno pro nedostatečný peněžní zisk (%s)";

		-- Section: Tooltip Messages
		["FrmtBarkerPrice"]	= "Cena do chatu (%d %% zisk)";
		["FrmtDisinto"]	= "Disenchant získá:";
		["FrmtFound"]	= "Zaznamenáno, že disenchant na %s získá:";
		["FrmtPriceEach"]	= "(%s za kus)";
		["FrmtSuggestedPrice"]	= "Doporučená cena:";
		["FrmtTotal"]	= "Celkem";
		["FrmtValueAuctHsp"]	= "Prodejní cena získaná Disenchantem (NUC)";
		["FrmtValueAuctMed"]	= "Střední cena získaná Disenchantem (StredniCena)";
		["FrmtValueMarket"]	= "Základní cena získaná Disenchantem (ZakladniCena)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer nebyl nahrán, budu používat uložené ceny]";
		["FrmtWarnNoPrices"]	= "[Ceny nejsou dostupne]";
		["FrmtWarnPriceUnavail"]	= "[Nektere ceny nedostupne]";

		-- Section: User Interface
		["GuiActivateProfile"]	= "Aktivovat stávající profil";
		["GuiAutoDEPurchaseReason"]	= "Koupit za %s";
		["GuiCreateReplaceProfile"]	= "Vytvořit nebo nahradit profil";
		["GuiDeleteProfileButton"]	= "Smazat";
		["GuiDuplicateProfileButton"]	= "Kopírovat profil";
		["GuiIgnore"]	= "Ignorovat¶";

}
