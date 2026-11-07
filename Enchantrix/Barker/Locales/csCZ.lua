--[[
	EnchantrixBarker - Localization (csCZ)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixBarkerLocalizations = EnchantrixBarkerLocalizations or {}
EnchantrixBarkerLocalizations.csCZ = {

		-- Section: Command Messages
		["BarkerEnxWindowNotOpen"]	= "Enchantrix: Není otevřené okno Enchanting. Toto okno musí být otevřené aby bylo možné použít Vyvolávače (Trade chat spam).";
		["BarkerNoEnchantsAvail"]	= "Enchantrix: Buďto nemáš žádné enchanty anebo nemáš dostatek materiálů.";

		-- Section: Commands
		["CmdBarker"]	= "vyvolavac";
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
		["ShowCount"]	= "pocet";
		["ShowEmbed"]	= "integrace";
		["ShowGuessAuctioneerHsp"]	= "urcit-nuc";
		["ShowGuessAuctioneerMed"]	= "urcit-stred";
		["ShowTerse"]	= "strucne";
		["ShowValue"]	= "ohodnotit";

		-- Section: Game Constants
		["BarkerOpening"]	= "Prodám enchanty:";
		["OneLetterGold"]	= "g";
		["OneLetterSilver"]	= "s";
		["ShortDarnassus"]	= "Dar";
		["ShortIronForge"]	= "IF";
		["ShortOrgrimmar"]	= "Org";
		["ShortStormwind"]	= "SW";
		["ShortThunderBluff"]	= "TB";
		["ShortUndercity"]	= "UC";

		-- Section: Tooltip Messages
		["FrmtBarkerPrice"]	= "Cena do chatu (%d %% zisk)";
		["FrmtPriceEach"]	= "(%s za kus)";
		["FrmtSuggestedPrice"]	= "Doporučená cena:";
		["FrmtTotal"]	= "Celkem";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer nebyl nahrán, budu používat uložené ceny]";
		["FrmtWarnNoPrices"]	= "[Ceny nejsou dostupne]";
		["FrmtWarnPriceUnavail"]	= "[Nektere ceny nedostupne]";

		-- Section: User Interface
		["BarkerOptionsHighestPriceForFactorTitle"]	= "Nejvyšší cena";
		["BarkerOptionsHighestPriceForFactorTooltip"]	= "Enchanty s cenou vyšší než tato hodnota dostanou pro Trade chat nulovou prioritu.";
		["BarkerOptionsHighestProfitTitle"]	= "Nejvyšší zisk";
		["BarkerOptionsHighestProfitTooltip"]	= "Nastaví nejvyšší možný zisk na enchantu (v penězích, ne procentech).";
		["BarkerOptionsLowestPriceTitle"]	= "Nejnižší cena";
		["BarkerOptionsLowestPriceTooltip"]	= "Nejnižší cena, která bude požadována za tento enchant v Trade chatu.";
		["BarkerOptionsPricePriorityTitle"]	= "Celková priorita ceny";
		["BarkerOptionsPricePriorityTooltip"]	= "Tohle nastavuje důležitost ceny pro celkovou prioritu enchantů v Trade chatu.";
		["BarkerOptionsPriceSweetspotTitle"]	= "Ideální cena";
		["BarkerOptionsPriceSweetspotTooltip"]	= "Tímhle se zvýší priorita enchantů, jejichž cena je blízko této hodnoty.";
		["BarkerOptionsProfitMarginTitle"]	= "Míra zisku";
		["BarkerOptionsProfitMarginTooltip"]	= "Procentní přirážka k nákladům na materiály.";
		["BarkerOptionsRandomFactorTitle"]	= "Náhodný faktor";
		["BarkerOptionsRandomFactorTooltip"]	= "Míra náhody ve výběru enchantů pro Trade chat.";
		["BarkerOptionsTab1Title"]	= "Priority zisku a cen";

}
