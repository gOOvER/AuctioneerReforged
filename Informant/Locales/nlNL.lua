--[[
	Informant - Localization (nlNL)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

InformantLocalizations = InformantLocalizations or {}
InformantLocalizations.nlNL = {

		-- Section: Help
		["INF_Help_ChatProfileDeleted"]	= "Verwijderd profiel:";
		["INF_Help_ChatProfileReset"]	= "Reset profiel:";
		["INF_Help_ChatProfileSaved"]	= "Opgeslagen profiel:";
		["INF_Help_ChatProfileUsing"]	= "Huidige profiel:";
		["INF_Help_CmdClearAll"]	= "alle";
		["INF_Help_CmdDefault"]	= "standaard";
		["INF_Help_CmdDefaultAll"]	= "Alle Informant opties zijn gereset naar standaard instelling";
		["INF_Help_CmdDefaultSingle"]	= "Informant's %s optie is gereset naar zijn standaard instelling";
		["INF_Help_CmdDisable"]	= "uitschakelen";
		["INF_Help_CmdEmbed"]	= "voeg in";
		["INF_Help_CmdHeader"]	= "De commando's van Informant:";
		["INF_Help_CmdHelp"]	= "help";
		["INF_Help_CmdHelpDisable"]	= "Weerhoud Informant ervan automatisch te laden de volgende keer dat je inlogt";
		["INF_Help_CmdInformant"]	= "Informant";
		["INF_Help_CmdLoadMsg"]	= "Informant is niet geladen. Type /informant voor meer informatie.";
		["INF_Help_CmdLocale"]	= "lokale";
		["INF_Help_CmdMerchant"]	= "laat verkoper zien";
		["INF_Help_CmdQuest"]	= "laat quest zien";
		["INF_Help_CmdSetLocale"]	= "zet %s naar '%s'.";
		["INF_Help_CmdShowILevel"]	= "laat ilevel zien";
		["INF_Help_CmdShowLink"]	= "laat link zien";
		["INF_Help_CmdShowStack"]	= "laat stapel zien";
		["INF_Help_CmdShowUsage"]	= "laat gebruik zien";
		["INF_Help_CmdShowVendor"]	= "laat verkoper zien";
		["INF_Help_CmdShowVendorBuy"]	= "laat verkoper kopen zien";
		["INF_Help_CmdShowVendorSell"]	= "laat verkoper verkopen zien";
		["INF_Help_CmdShowZeroMerchant"]	= "laat nul verkopers zien";
		["INF_Help_CmdUnknown"]	= "Onbekend ingevoerd woord: '%s'";
		["INF_Help_FirstUse"]	= "|c40ff50ffWelkom bij Informant|r¶\n¶\nAangezien dit je eerste keer is dat je Informant gebruikt, laat dit bericht je weten dat je een knop moet aanstellen om dit scherm te laten zien vanuit |cffffffffKeybindings|r sectie van |cffffffffGame Menu|r.¶\n¶\nVanaf dan, om geavanceerde informatie over items in je inventory te zien, beweeg je je muis simpelweg over het item waar je meer informatie over wilt zien en druk je op de knop die je hebt ingesteld, waardoor dit scherm zal verschijnen met informatie over het bepaalde item.¶\n¶\nOp dat punt, druk je opnieuw op de knop, of klik je op het sluit knopje op dit frame.¶\n¶\nKlik op sluiten om door te gaan.";
		["INF_Help_HowInfoWin"]	= "Hoe gebruik ik het Informatie Scherm?";
		["INF_Help_HowInfoWinAnswer"]	= "Je kan een knop binden om het Informant Informatie Scherm informatie over items te laten zien. Om dit te doen, open je het Game Menu, selecteer je \"Key Bindings\" en zoek je naar Informant: Toggle Information Window.";
		["INF_Help_InfOff"]	= "Geeft geen item informatie weer.";
		["INF_Help_InfOn"]	= "Weergeven geconfigureerde item informatie.";
		["INF_Help_Locale"]	= "Verandert de taal die gebruikt word om Informant berichten te laten zien. Let op: dit beïnvloedt de lokale instelling voor alle Auctioneer addons.";
		["INF_Help_LocaleUnknown"]	= "De taal die je gespecificeerd heb ('%s') is onbekend. Goede talen zijn:";
		["INF_Help_Off"]	= "Uit";
		["INF_Help_On"]	= "Aan";
		["INF_Help_OptLocale"]	= "<lokale>";
		["INF_Help_Toggle"]	= "Schakel";
		["INF_Help_Welcome"]	= "Informant v%s geladen.";
		["INF_Help_WhatIs"]	= "Wat is Informant?";
		["INF_Help_WhatIsAnswer"]	= "Informant levert extra informatie over items in de tooltip, een informatie scherm en aan andere addons.";

		-- Section: HelpTooltip
		["INF_HelpTooltip_ActivateProfile"]	= "Selecteer het profiel dat je wilt gebruiken voor dit karakter.";
		["INF_HelpTooltip_AutoUpdate"]	= "Sta Informant toe om je tassen en verkopersvoorraad te scannen voor updates";
		["INF_Helptooltip_DefaultProfile"]	= "Reset alle instelling voor het huidige profiel.";
		["INF_HelpTooltip_DeleteProfile"]	= "Verwijdert het huidige geselecteerde profiel";
		["INF_HelpTooltip_Embed"]	= "Embed het meeste van de informatie in de originele game-tooltip (let op: de item's link kan niet worden ge-embed)";
		["INF_HelpTooltip_EnableInformant"]	= "Schakelt Informant's data weergave aan en uit";
		["INF_HelpTooltip_ModTTShow"]	= "Dit zal de weergave van Informant's extra tooltip tegenhouden behalve als Alt ingedrukt is.";
		["INF_HelpTooltip_ProfileName"]	= "Geef de naam van het profiel dat je wilt maken";
		["INF_HelpTooltip_ProfileSave"]	= "Klik op deze knop om een gespecificeerd profiel naam te maken of te overschrijven";
		["INF_HelpTooltip_ShowCrafted"]	= "Dit aanzeeten zorgt ervoor dat Informant het gemaakte item toont en de Appraiser, Disenchant en Verkoperswaarden (indien van toepassing) in de tooltip van een recept, plan, schema, patroon of ontwerptooltips.";
		["INF_HelpTooltip_ShowIlevel"]	= "Schakelt de weergave van een item's level(dit is verschillend van het minimale level om te gebruiken)";
		["INF_HelpTooltip_ShowLink"]	= "Schakelt de weergave van een item's link(link kan niet worden ge-embed)";
		["INF_HelpTooltip_ShowMerchant"]	= "Laat het aantal verkopers zien die een item verkopen in de tooltip en hun naam en locatie in het Informant Informatie Scherm";
		["INF_HelpTooltip_ShowQuest"]	= "Schakelt de weergave van gedetailleerd quest informatie voor een item in het Informatie Scherm";
		["INF_HelpTooltip_ShowStack"]	= "Weergeeft het aantal van een item's stack grootte";
		["INF_HelpTooltip_ShowUsage"]	= "Weergeeft een item's sub-type of in welke beroepen ze gebruikt worden";
		["INF_HelpTooltip_ShowVendorBuy"]	= "Schakelt de weergave van een item's koop prijs van een vendor";
		["INF_HelpTooltip_ShowVendorSell"]	= "Schakelt de weergave van een item's verkoop prijs van een vendor";
		["INF_HelpTooltip_ShowZeroMerchants"]	= "Schakelt de weergave van een tooltip bericht van nul verkopers die een item verkopen";
		["INF_HelpTooltip_SkillBlacksmithing"]	= "smeedkunst";
		["INF_HelpTooltip_SkillCooking"]	= "koken";
		["INF_HelpTooltip_VendorToggle"]	= "Schakelt de weergave van een item's verkoper koop/verkoop prijs";

		-- Section: Interface
		["INF_Interface_ActivateProfile"]	= "Activeert een huidig profiel";
		["INF_Interface_AutoUpdate"]	= "Werk item informatie automatisch bij bij verkopers";
		["INF_Interface_BindingHeader"]	= "Informant";
		["INF_Interface_BindingTitle"]	= "Schakel informatie venster";
		["INF_Interface_CreateProfile"]	= "Maak of vervang een profiel";
		["INF_Interface_DefaultProfile"]	= "Standaard";
		["INF_Interface_Delete"]	= "Verwijder";
		["INF_Interface_Embed"]	= "Voeg informatie toe aan de in-game tooltip";
		["INF_Interface_EnableInformant"]	= "Activeer Informant";
		["INF_Interface_General"]	= "Algemeen";
		["INF_Interface_GeneralOptions"]	= "Algemene Instellingen";
		["INF_Interface_InfWinInfoHeader"]	= "Informatie voor |cff%s%s|r";
		["INF_Interface_InfWinNoItem"]	= "Je moet met je muis over een item gaan en dan de activeringstoets indrukken";
		["INF_Interface_InfWinPlayerMade"]	= "Gemaakt door level %d %s";
		["INF_Interface_InfWinQuest"]	= "Quest item voor %d quests";
		["INF_Interface_InfWinQuestLine"]	= "Quest: %s";
		["INF_Interface_InfWinQuestMultiLine"]	= "%d benodigd: %s";
		["INF_Interface_InfWinQuestRequires"]	= "Aanvraag voor %d quests:";
		["INF_Interface_InfWinQuestReward"]	= "beloning van %d quests:";
		["INF_Interface_InfWinQuestSource"]	= "Gegevens ontvangen bij quest";
		["INF_Interface_InfWinQuestStart"]	= "start een quest:";
		["INF_Interface_InfWinQuestUnknown"]	= "onbekende quest: ID #%d";
		["INF_Interface_InfWinTitle"]	= "Informant item informatie";
		["INF_Interface_InfWinVendorCount"]	= "beschikbaar van %d kooplui:";
		["INF_Interface_InfWinVendorName"]	= "%s";
		["INF_Interface_ModTTShow"]	= "geef alleen tooltips weer als ALT is ingedrukt";
		["INF_Interface_ProfileName"]	= "Nieuwe profiel naam";
		["INF_Interface_SaveProfile"]	= "bewaren";
		["INF_Interface_SetupProfiles"]	= "Setup, Configuratie en Bewerk Profiel";
		["INF_Interface_ShowCrafted"]	= "geef gevonde item weer en waarde";
		["INF_Interface_ShowIlevel"]	= "geef item level weer";
		["INF_Interface_ShowLink"]	= "laat item link zien";
		["INF_Interface_ShowQuest"]	= "laat quest zien in informatie venster";
		["INF_Interface_ShowStack"]	= "laat item stack groote zien";
		["INF_Interface_ShowVendorBuy"]	= "laat vendor koop prijs zien";
		["INF_Interface_ShowVendorSell"]	= "laat vendor verkoop prijs zien";
		["INF_Interface_ShowZeroMerchants"]	= "laat bericht zien wanneer kooplui onbekend is";
		["INF_Interface_VendorToggle"]	= "laat Vendor koop en verkoop prijs zien";

		-- Section: Tooltip
		["INF_Tooltip_AdditAlchemy"]	= "alchemie";
		["INF_Tooltip_AdditAmmoPouch"]	= "Ammunitie Zak";
		["INF_Tooltip_AdditAmulet"]	= "Amulet";

}
