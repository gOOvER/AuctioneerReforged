--[[
	Enchantrix - Localization (daDK)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.daDK = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Nulstiller al Enchant data";
		["FrmtActClearFail"]	= "Kan ikke finde item: %s";
		["FrmtActClearOk"]	= "Data nulstillet for item: %s";
		["FrmtActDefault"]	= "Enchantrix's %s indstilling er blevet nulstillet";
		["FrmtActDefaultAll"]	= "Alle Enchantrix indstillinger er blevet gensat til normal";
		["FrmtActDisable"]	= "Viser ikke item's %s data";
		["FrmtActEnable"]	= "Viser item's %s data";
		["FrmtActSet"]	= "Sæt %s til '%s'";
		["FrmtActUnknown"]	= "Ukendt kommando nøgleord: '%s'";
		["FrmtActUnknownLocale"]	= "Sproget du har valgt ('%s') er ukendt. Tilladte sprog er:";
		["FrmtPrintin"]	= "Encantrix's beskeder vil nu vises i \"%s\" chat rammen";
		["FrmtUsage"]	= "Brug:";
		["MesgDisable"]	= "Slår automatisk loading af Enchantrix fra";
		["MesgNotloaded"]	= "Enchantrix er ikke indlæst. Skriv /enchantrix for mere information";

		-- Section: Command Options
		["CmdClearAll"]	= "alt";
		["OptClear"]	= "([Item]alt)";
		["OptDefault"]	= "(<option>|alt)";
		["OptFindBidauct"]	= "<sølv>";
		["OptFindBuyauct"]	= "<procent>";
		["OptLocale"]	= "<sprog>";
		["OptPrintin"]	= "(<index>[Nummer]<rammenavn>[Streng])";

		-- Section: Commands
		["CmdClear"]	= "slet";
		["CmdDefault"]	= "standard";
		["CmdDisable"]	= "deaktiver";
		["CmdFindBidauct"]	= "bidbroker";
		["CmdFindBidauctShort"]	= "bb";
		["CmdFindBuyauct"]	= "procentunder";
		["CmdFindBuyauctShort"]	= "pu";
		["CmdHelp"]	= "hjælp";
		["CmdLocale"]	= "sprog";
		["CmdOff"]	= "fra";
		["CmdOn"]	= "til";
		["CmdPrintin"]	= "skriv-i";
		["CmdToggle"]	= "skift";
		["ConfigUI"]	= "Konfigurer";
		["ShowDELevels"]	= "niveauer";
		["ShowDEMaterials"]	= "materialer";
		["ShowEmbed"]	= "integreret";
		["ShowGuessAuctioneerHsp"]	= "evaluer-hsp";
		["ShowGuessAuctioneerMed"]	= "evaluer-middel";
		["ShowGuessAuctioneerVal"]	= "evaluer-val";
		["ShowGuessBaseline"]	= "evaluer-baseværdi";
		["ShowTerse"]	= "terse";
		["ShowUI"]	= "vis";
		["ShowValue"]	= "Evaluer";
		["StatOff"]	= "Viser ingen enchant data";
		["StatOn"]	= "Viser konfigureret enchant data";

		-- Section: Config Text
		["GuiLoad"]	= "Load Auctioneer";
		["GuiLoad_Always"]	= "altid";
		["GuiLoad_Never"]	= "aldrig";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Milling";
		["ArgSpellname"]	= "Disenchant";
		["ArgSpellProspectingName"]	= "Prospecting";
		["Enchanting"]	= "Enchanting";
		["Inscription"]	= "Inscription";
		["Jewelcrafting"]	= "Smykkesmed";
		["PatReagents"]	= "Ingredienser: (.+)";
		["TextCombat"]	= "Kamp";
		["TextGeneral"]	= "Generelt";

		-- Section: Generic Messages
		["FrmtCredit"]	= "Gå til  for at dele dine data";
		["FrmtWelcome"]	= "Enchantrix v%s læst ind";
		["MesgAuctVersion"]	= "Enchantix kræver Auctioneer version 3.4 eller højere. Nogle muligheder vil være utilgængelige indtil du opdatere din Auctioneer installation.";

		-- Section: Help Text
		["GuiClearall"]	= "Slet alle Enchantrix data";
		["GuiClearallButton"]	= "Slet alt";
		["GuiClearallHelp"]	= "Klik her for at slette alle Enchantrix data for den aktuelle server.";
		["GuiClearallNote"]	= "for den aktuelle server/faktion";
		["GuiDefaultAll"]	= "Nulstil alle Enchantrix valg";
		["GuiDefaultAllButton"]	= "Nulstil alt";
		["GuiDefaultAllHelp"]	= "Klik her for at sætte alle Enchantrix options til deres standard værdi. ADVARSEL. Dette kan IKKE fortrydes.";
		["GuiDefaultOption"]	= "Nulstil denne værdi";
		["GuiDELevels"]	= "Vis disenchant niveau krævet i tooltip";
		["GuiDEMaterials"]	= "Vis disenchant materiale info i tooltip";
		["GuiEmbed"]	= "Vis indlejrede information i spillets tooltip";
		["GuiLocale"]	= "Sæt sprog til";
		["GuiMainEnable"]	= "Aktiver Enchantrix";
		["GuiMainHelp"]	= "Indeholder værdier for Enchantrix et Add-On som viser information om hvad en ting bliver til ved disenchant.";
		["GuiOtherHeader"]	= "Andre valg";
		["GuiOtherHelp"]	= "Diverse Enchantrix valg";
		["GuiPrintin"]	= "Vælg den ønskede meddelelses frame";
		["GuiPrintYieldsInChat"]	= "Vis item yields i chatten";
		["GuiShowCraftReagents"]	= "Vis crafting reagents i tooltips";
		["GuiTerse"]	= "Aktiver kortfattet indstilling";
		["GuiValuateAverages"]	= "Evaluer mod Auctioneer gennemsnit";
		["GuiValuateBaseline"]	= "Evaluer mod standard data";
		["GuiValuateEnable"]	= "Aktiver Evaluering";
		["GuiValuateHeader"]	= "Evaluering";
		["GuiValuateMedian"]	= "Evaluer mod Auctioneer middel";
		["HelpClear"]	= "Slet det valgte item data (du skal shift-klikke item ind i kommandoen). Du kan ogsÃ¥ angive all for at slette alt.";
		["HelpDefault"]	= "Sæt et Enchantrix valg til dets standard vÃ¦rdi. Du kan også angive all for at sætte alle valg til deres standard værdi.";
		["HelpDisable"]	= "Undlader at loade Enchantrix automatisk næste gang du logger ind.";
		["HelpEmbed"]	= "Indlejrer teksten i spillets egne tooltip (BemÃ¦rk: Visse valg kan ikke bruges sammen med dette)";
		["HelpFindBidauct"]	= "Find auktioner hvis potentielle disenchant værdi er et vist sølvbeløb mindre end bud prisen.";
		["HelpFindBuyauct"]	= "Find auktioner hvis potentielle disenchant værdi er vis procent værdi mindre end bud prisen.";
		["HelpGuessAuctioneer5Val"]	= "Hvis valuationen er aktiveret, og du har Auctioneer installeret, vis market prisen af disenchant af et item";
		["HelpGuessAuctioneerHsp"]	= "Hvis Evaluer er slået til og du har Auctioneer installeret, vis salgspris (HSP) vurderingen af at disenchante tingen.";
		["HelpGuessAuctioneerMedian"]	= "Hvis Evaluer er slået til og du har Auctioneer installeret, vis middel værdien af at disenchante tingen.";
		["HelpGuessBaseline"]	= "Hvis Evaluer er slået til (Auctioneer er ikke nødvendig) vis base værdien af at disenchante ting. Baseret på de indbyggede priser.";
		["HelpGuessNoauctioneer"]	= "Kommandoerne evaluer-hsp og evaluer-middel er ikke tilgængelige fordi du ikke har Auctioneer installeret.";
		["HelpLoad"]	= "Ændre Enchantrix load indstillinger for denne karakter";
		["HelpLocale"]	= "Ændrer sproget som bruges til at vises Enchantrix meddelelser";
		["HelpOnoff"]	= "Skifter mellem om enchant data vises eller ej.";
		["HelpPrintin"]	= "Vælg hvilken ramme Enchantrix viser sine meddelelser i.\nDu kan enten angive navnet eller nummeret.";
		["HelpShowDELevels"]	= "Vælg om det skal vises i tooltip hvilket skill der kræves for at disenchante tingen.";
		["HelpShowDEMaterials"]	= "Vælg om det skal vises i tooltip hvilke materialer man kan få ved at disenchante tingen.";
		["HelpShowUI"]	= "Vis eller gem redigerings panelet.";
		["HelpTerse"]	= "Aktiver/deaktiver kortfattet indstilling. Viser kun disenchant værdi. Kan tilsidesættes ved at holde control-tasten nede.";
		["HelpValue"]	= "Vælg om tingens værdi baseret pÃ udfaldet af mulige disenchants skal vises.";
		["ModTTShow_Help"]	= "Denne indstilling vil kun vise Enchantrix's ekstra tooltip hvis ALT er trykket ned.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "Du har ikke installeret Auctioneer. Auctioneer skal være installeret for at udføre en auktions skan.";
		["AuctionScanVersionTooOld"]	= "Du har ikke den korrekte version af Auctioneer installeret. Denne funktion kræver Auctioneer 4.0 eller nyere.";
		["ChatDeletedProfile"]	= "Slettet profil:";
		["ChatDuplicatedProfile"]	= "Kopieret profil til:";
		["ChatResetProfile"]	= "Nulstil alle indstillinger for:";
		["ChatSavedProfile"]	= "Gemt profil:";
		["ChatUsingProfile"]	= "Aktuel profil:";
		["FrmtAutoDeActive"]	= "AutoDisenchant aktiveret";
		["FrmtAutoDeDisabled"]	= "AutoDisenchant inaktiveret";
		["FrmtAutoDeDisenchantCancelled"]	= "Disenchant afbrudt: item ikke fundet";
		["FrmtAutoDeDisenchanting"]	= "Disenchanter %s";
		["FrmtAutoDeIgnorePermanent"]	= "Ignorerer %s permanent";
		["FrmtAutoDeIgnoreSession"]	= "Ignorere %s i denne session";
		["FrmtAutoDeInactive"]	= "AutoDisenchant inaktiv";
		["FrmtAutoDeMilling"]	= "Miller %s";
		["FrmtAutoDeMillingCancelled"]	= "Milling afbrudt: item ikke fundet";
		["FrmtAutoDeProspectCancelled"]	= "Prospect afbrudt: item ikke fundet";
		["FrmtAutoDeProspecting"]	= "Prospecter %s";
		["FrmtBidbrokerCurbid"]	= "BudNu";
		["FrmtBidbrokerDone"]	= "Gennemløb for lave priser udført.";
		["FrmtBidbrokerHeader"]	= "Auktioner som har %s sølv besparelse baseret på gennemsnitlig disenchant værdi. (min %%mindre = %d):";
		["FrmtBidbrokerLine"]	= "%s, Vurderet til: %s, %s: %s. Besparelse: %s, Under %s, Tid: %s";
		["FrmtBidbrokerMinbid"]	= "BudMin";
		["FrmtBidBrokerSkipped"]	= "Sprang %d auktioner over, pga. for lille profit margin. (%d%%)";
		["FrmtBidBrokerSkippedBids"]	= "Sprang %d auktioner over pga. eksisterende bud";
		["FrmtPctlessDone"]	= "Procent mindre udført.";
		["FrmtPctlessHeader"]	= "Buyouts som har %d%% besparelse i forhold til gennemsnitlige disenchant værdi:";
		["FrmtPctlessLine"]	= "%s, vurderet til: %s, BO: %s, spar: %d, %s under.";
		["FrmtPctlessSkillSkipped"]	= "Sprang %d auktioner over pga. for lav skill level (%s)";
		["FrmtPctlessSkipped"]	= "Sprang %d auktioner over, pga. for lille profit mulighed. (%s)";

		-- Section: Tooltip Messages
		["Click"]	= "Klik";
		["EnxMMTip"]	= "Enchantrix viser hvilke 'reagents' en ting vil disenchantes, eller milles til. Den integrere også med Auctioneer for at bestemme pricer for køb/salg.";
		["FrmtBarkerPrice"]	= "Udråbspris (%d%% margen)";
		["FrmtDEItemLevels"]	= "Kan disenchantes fra item level %d til %d";
		["FrmtDisinto"]	= "Disenchantes til:";
		["FrmtFound"]	= "Fandt at %s disenchantes til:";
		["FrmtFoundNotDisenchant"]	= "Registrerede at %s ikke kan disenchantes";
		["FrmtInkFrom"]	= "Lavet fra %s";
		["FrmtMillingFound"]	= "Registrerede at %s milles til:";
		["FrmtMillingValueAuctHsp"]	= "Milling værdi (HSP)";
		["FrmtMillingValueAuctMed"]	= "Milling værdi (Median)";
		["FrmtMillingValueAuctVal"]	= "Milling værdi (AucAdv)";
		["FrmtMillingValueMarket"]	= "Milling værdi (Base)";
		["FrmtMillsInto"]	= "Milles til:";
		["FrmtPriceEach"]	= "(%s/stk.)";
		["FrmtProspectFound"]	= "Registrerede at %s prospectes til:";
		["FrmtProspectFrom"]	= "Prospectes fra %s.";
		["FrmtProspectInto"]	= "Prospectes til:";
		["FrmtProspectValueAuctHsp"]	= "Prospect værdi (HSP)";
		["FrmtProspectValueAuctMed"]	= "Prospect værdi (Median)";
		["FrmtProspectValueAuctVal"]	= "Prospect værdi (AucAdv)";
		["FrmtProspectValueMarket"]	= "Prospect værdi (Base)";
		["FrmtSuggestedPrice"]	= "Anbefalet pris:";
		["FrmtTotal"]	= "I alt";
		["FrmtValueAuctHsp"]	= "Disenchant værdi (HSP)";
		["FrmtValueAuctMed"]	= "Disenchant værdi (Median)";
		["FrmtValueAuctVal"]	= "Disenchant værdi (AucAdv)";
		["FrmtValueFixedVal"]	= "Disenchant værdi (Fast sat)";
		["FrmtValueMarket"]	= "Disenchant værdi (Base)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer ikke indlæst, bruger priser fra cachen]";
		["FrmtWarnNoPrices"]	= "[Ingen priser er tilgængelige]";
		["FrmtWarnPriceUnavail"]	= "[Nogle af priserne er ikke tilgængelige]";
		["RightClick"]	= "Højre-Klik";
		["ShiftClick"]	= "Shift-Klik";
		["TipOpenConfig"]	= "For at ændre indstillingerne.";
		["TipOpenEnchant"]	= "for at åbne Enchanting vinduet.";
		["TipOpenJewel"]	= "for at åbne Jewel Crafting vinduet.";
		["TooltipMillingLevel"]	= "Milling kræver skill %d";
		["TooltipProspectLevel"]	= "Prospecting kræver skill %d";
		["TooltipShowDisenchantLevel"]	= "Disenchanting kræver skill %d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "BeanCounter er krævet for at bestemme købs grund. Deaktivere AutoDE begrænsning indtil BeanCounter er installeret.";
		["ExportPriceAucAdv"]	= "Eksporter Enchantrix priser til Auctioneer Advanced";
		["GuiActivateProfile"]	= "Aktiver en aktuel profil";
		["GuiAutoDeBoughtForDE"]	= "Kun købte ting skal disenchantes";
		["GuiAutoDeEnable"]	= "Kig i inventory for 'disenchantable' ting - PAS PÅ¶";
		["GuiAutoDeEpicItems"]	= "Auto Disenchant epic (lilla) ting";
		["GuiAutoDeOptions"]	= "Automatisering";
		["GuiAutoDePromptLine1"]	= "Vil du disenchante:";
		["GuiAutoDePromptLine3"]	= "Vurderet til %s";
		["GuiAutoDEPurchaseReason"]	= "Købt for %s";
		["GuiAutoDeRareItems"]	= "Auto Disenchant rare (blå) ting";
		["GuiAutoMillingPromptLine1"]	= "Ønsker du at mille:";
		["GuiAutoProspectPromptLine1"]	= "Ønsker du at prospecte:";
		["GuiBBUnbiddedOnly"]	= "Begræns BidBroker til ting der ikke er budt på";
		["GuiCreateReplaceProfile"]	= "Opret eller erstat en profil";
		["GuiDeleteProfileButton"]	= "Slet";
		["GuiDuplicateProfileButton"]	= "Kopier profil";
		["GuiFixedSettings"]	= "Faste ingrediens priser";
		["GuiGeneralOptions"]	= "Generelle Enchantrix indstillinger";
		["GuiIgnore"]	= "Ignorer";
		["GuiItemValueAverage"]	= "Gennemsnit (standard)";
		["GuiMaxBuyout"]	= "Maksimal udkøbspris:";
		["GuiMillingOptions"]	= "Milling indstillinger";
		["GuiMinimapButtonDist"]	= "Distance: %d";
		["GuiMinimapOptions"]	= "Minimap visnings indstillinger";
		["GuiMinimapShowButton"]	= "Vis minimap knap";
		["GuiNewProfileName"]	= "Nyt profil navn:";
		["GuiNo"]	= "Nej";
		["GuiPLBBOnlyBelowDESkill"]	= "Vis kun ting der kan disenchantes på nuværende skill";
		["GuiPLBBSettings"]	= "Percentless og Bidbroker indstillinger";
		["GuiProspectingLevels"]	= "Vis krav til prospecting level i tooltip";
		["GuiProspectingOptions"]	= "Prospecting indstillinger";
		["GuiResetProfileButton"]	= "Nulstil";
		["GuiSaveProfileButton"]	= "Gem";
		["GuiTabAuctions"]	= "Auktioner";
		["GuiTabFixed"]	= "Fast pris";
		["GuiTabGeneral"]	= "Generelt";
		["GuiTabMilling"]	= "Milling";
		["GuiTabProfiles"]	= "Profiler";
		["GuiTabProspecting"]	= "Prospecting";
		["GuiYes"]	= "Ja";
		["ModTTShow"]	= "Vis kun ekstra tooltip hvis Alt er trykket ned";

}
