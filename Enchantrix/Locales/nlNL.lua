--[[
	Enchantrix - Localization (nlNL)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.nlNL = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Wissen van alle enchant gegevens";
		["FrmtActClearFail"]	= "Kan item niet vinden: %s";
		["FrmtActClearOk"]	= "Data gewist voor item: %s";
		["FrmtActDefault"]	= "Enchantrix' %s optie is teruggezet naar standaard instelling";
		["FrmtActDefaultAll"]	= "Alle Enchantrix opties zijn teruggezet naar standaard instelling.";
		["FrmtActDisable"]	= "Item's %s gegevens worden niet weergegeven";
		["FrmtActEnable"]	= "Item's %s gegevens worden weergegeven";
		["FrmtActSet"]	= "Stel %s naar '%s' in";
		["FrmtActUnknown"]	= "Onbekende opdracht: '%s'";
		["FrmtActUnknownLocale"]	= "De opgegeven taal ('%s') is onbekend. Geldige talen zijn:";
		["FrmtPrintin"]	= "Berichten van Enchantrix worden nu weergegeven op de \"%s\" chat frame";
		["FrmtUsage"]	= "Gebruik:";
		["MesgDisable"]	= "Uitschakelen automatisch laden van Enchantrix";
		["MesgNotloaded"]	= "Enchantrix is niet geladen. Type /enchantrix voor meer info.";

		-- Section: Command Options
		["OptFindBidauct"]	= "<zilver>";
		["OptFindBuyauct"]	= "<procent>";
		["OptLocale"]	= "<taal>";
		["OptPrintin"]	= "(<frameIndex>[Nummer]|<frameNaam>[Tekst])";

		-- Section: Commands
		["ConfigUI"]	= "config";
		["ShowDELevels"]	= "levels";
		["ShowDEMaterials"]	= "materialen";
		["ShowGuessAuctioneerVal"]	= "waardeer-waarde";
		["ShowTerse"]	= "Beknopt";
		["ShowUI"]	= "toon";
		["StatOff"]	= "Enchant gegevens worden niet getoond";
		["StatOn"]	= "De geconfigureerde enchant gegevens worden getoond";

		-- Section: Config Text
		["GuiLoad"]	= "Laden van Enchantrix";
		["GuiLoad_Always"]	= "altijd";
		["GuiLoad_Never"]	= "nooit";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Milling";
		["ArgSpellname"]	= "Disenchant";
		["ArgSpellProspectingName"]	= "Prospecting";
		["Enchanting"]	= "Enchanting";
		["Inscription"]	= "Inscription";
		["Jewelcrafting"]	= "Jewelcrafting";
		["PatReagents"]	= "Reagents: (.+)";
		["TextCombat"]	= "Combat";
		["TextGeneral"]	= "General";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(ga naar  om uw data te delen)";
		["FrmtWelcome"]	= "Enchantrix v%s geladen";
		["MesgAuctVersion"]	= "Enchantrix heeft Auctioneer versie 3.4 of hoger nodig. Sommige functionaliteiten zijn niet beschikbaar totdat Auctioneer is geupgrade.";

		-- Section: Help Text
		["GuiClearall"]	= "Alle Enchantrix Data opschonen";
		["GuiClearallButton"]	= "Alles opschonen";
		["GuiClearallHelp"]	= "Klik hier om alle enchantrix data van de huidige Server/Realm op te schonen.";
		["GuiClearallNote"]	= "voor de huidige Server-factie";
		["GuiDefaultAll"]	= "Herstel alle Enchantrix Opties";
		["GuiDefaultAllButton"]	= "Herstel Alles";
		["GuiDefaultAllHelp"]	= "Klik hier om alle standaard waardes van de Enchantrix opties te laden. LET OP: Deze actie kan NIET ongedaan worde n gemaakt.";
		["GuiDefaultOption"]	= "Herstel deze instelling";
		["GuiDELevels"]	= "Toon benodigde disenchant level in de tooltip";
		["GuiDEMaterials"]	= "Toon disenchant materiaalinformatie in de tooltip";
		["GuiEmbed"]	= "Voeg informatie toe aan in-game tooltip";
		["GuiLocale"]	= "Verander taal naar";
		["GuiMainEnable"]	= "Enchantrix activeren";
		["GuiMainHelp"]	= "Bevat instellingen voor Enchantrix, een AddOn die mogelijke uitkomsten bij het disenchanten van een item weergeeft in een tooltip.";
		["GuiOtherHeader"]	= "Andere opties";
		["GuiOtherHelp"]	= "Verschillende Enchantrix opties";
		["GuiPrintin"]	= "Selecteer het gewenste berichtenscherm";
		["GuiPrintYieldsInChat"]	= "Toon itemopbrengsten in chat venster";
		["GuiShowCraftReagents"]	= "Toon maak-benodigdheden in tooltips";
		["GuiTerse"]	= "Activeer Beknopte Mode";
		["GuiValuateAverages"]	= "Taxatie met Auctioneer gemiddelden";
		["GuiValuateBaseline"]	= "Taxatie met Standaard Data";
		["GuiValuateEnable"]	= "Activeer Taxatie";
		["GuiValuateHeader"]	= "Taxatie";
		["GuiValuateMedian"]	= "Taxeer met Auctioneer gemiddelden";
		["HelpClear"]	= "Verwijder de gegevens van het geselecteerde item (je moet met shift-click de items in je commando invoeren) Je kunt ook het speciale keyword \"all\" opgeven";

		-- Section: Report Messages
		["FrmtBidbrokerCurbid"]	= "HuidigBod";
		["FrmtBidbrokerDone"]	= "Een regelend bod gedaan";
		["FrmtBidbrokerHeader"]	= "Een bod bespaart %s zilver op de gemiddelde disenchant waarde:";
		["FrmtBidbrokerLine"]	= "%s, Waarde van %s, %s: %s, Bespaard: %s, Minder %s, Tijd: %s";
		["FrmtBidbrokerMinbid"]	= "MinimaleBod";
		["FrmtPctlessDone"]	= "Percentage minder gedaan.";
		["FrmtPctlessHeader"]	= "Opkoop waarde bespaard %d%% op de gemiddelde disenchant waarde:";
		["FrmtPctlessLine"]	= "%s, Geschat op %s, BO: %s, Bespaar: %s, Minder %s";

		-- Section: Tooltip Messages
		["FrmtBarkerPrice"]	= "Omroep Prijs (%d%% marge)";
		["FrmtDisinto"]	= "Gedisenchant in:";
		["FrmtFound"]	= "Gevonden dat %s wordt gedisenchant in:";
		["FrmtPriceEach"]	= "Prijs per item";
		["FrmtSuggestedPrice"]	= "Voorstel Prijs:";
		["FrmtTotal"]	= "Totaal";
		["FrmtValueAuctHsp"]	= "Disenchant Waarde";
		["FrmtValueAuctMed"]	= "Disenchant Waarde (Gemiddeld)";
		["FrmtValueMarket"]	= "Disenchant Waarde";
		["FrmtWarnAuctNotLoaded"]	= "Auctioneer niet geladen. Opgeslagen waardes worden gebruikt.";
		["FrmtWarnNoPrices"]	= "Geen prijs beschikbaar";
		["FrmtWarnPriceUnavail"]	= "Sommige prijzen niet beschikbaar";

}
