--[[
	BeanCounter - Localization (deDE)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.deDE = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "BeanCounter Konfiguration";
		["C_BeanCounterDatabaseMaintenance"]	= "BeanCounter Datenbankwartung";
		["C_BeanCounterOptions"]	= "BeanCounter Optionen";
		["C_ColorizeSearch"]	= "Fügt eine Wertungsfarbe jedem Resultat im Suchfenster hinzu";
		["C_DatabaseLength"]	= "Bestimmt die Dauer, wie lange BeanCounter Auktionshaustransaktionen speichert.";
		["C_DataMaintenance"]	= "Datenwartung";
		["C_DateString"]	= "Zu verwendendes Datumsformat:";
		["C_DateStringExample"]	= "Beispieldatum:";
		["C_ExtenalSearch"]	= "Externen AddOns die BeanCounter Suche erlauben";
		["C_MailInvoiceTimeout"]	= "Mail-Zeitüberschreitung = %d Sekunden";
		["C_MailRecolor"]	= "Mail einfärben";
		["C_ModTTShow"]	= "Zeigt den extra Tooltip nur an, wenn ALT gedrückt wird.";
		["C_MonthsToKeep"]	= "Wieviele Monate sollen die Daten aufbewahrt werden ?";
		["C_OpacityLevel"]	= "Transparenzstufe";
		["C_Resortascendingtime"]	= "Eintragungen nach aufsteigender Zeit sortieren";
		["C_ResortDatabase"]	= "Daten sortieren";
		["C_ScanDatabase"]	= "Daten auf Fehler überprüfen: Benutze dies, wenn Fehler bei der Suche in BeanCounter auftreten. \nErstelle vor der Anwendung eine Sicherung von BeanCounters gespeicherten Variablen.";
		["C_SearchConfiguration"]	= "Suchkonfiguration";
		["C_SendToSearch"]	= "Zeige in BeanCounter gesuchte Items auch im Auktionshausfenster ?";
		["C_ShowBeginnerTooltips"]	= "Zeige Anfängertooltips beim Überfahren mit der Maus.";
		["C_ShowReasonPurchase"]	= "Zeige Kaufgrund in den Spieletooltips.";
		["C_ValidateDatabase"]	= "Daten überprüfen";

		-- Section: Generic Strings
		["NoRe-Color"]	= "Nicht einfärben";
		["off"]	= "aus";
		["Ok"]	= "Ok";
		["on"]	= "ein";
		["Re-ColorIcons"]	= "Icons einfärben";
		["Re-ColorIconsandText"]	= "Icons und Text einfärben";
		["Re-ColorText"]	= "Text einfärben";
		["TooltipFailed"]	= "Tooltipinfo nicht vorhanden";
		["UiNeutralCheckBox"]	= "Zeige neutrale AH-Daten";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter speichert den Suchgrund, zu dem ein Gegenstand gekauft wurde und zeigt ihn im Tooltip an.";
		["A_DateString"]	= "Dies bestimmt, wie das Datum von BeanCounter angezeigt wird. Befehle werden durch % eingeleitet und mehrfache Befehle und Text können gemischt werden. Z.B. würde %a == %X Mi == 21:34:21 anzeigen";
		["A_DateStringCommands"]	= "Kommandos: \n %a = gek. Wochentagsname, \n %A = voller Wochentagsname, \n %b = gek. Monatsname, \n %B = voller Monatsname,\n %c = Datum und Zeit, \n %d = Monatstag (01-31),\n %H = Stunde (24), \n %I = Stunde (12),\n %M = Minute, \n %m = Monat,\n %p = am/pm, \n %S = Sekunde,\n %U = Jahreswochennummer ,\n %w = Nummerischer Wochentag (0-6),\n %x = Datum, \n %X = Zeit,\n %Y = Jahr lang (2007), \n %y = Jahr kurz (07)";
		["A_ExtenalSearch"]	= "Andere Addons können BeanCounters Suche nutzen, damit ein Gegenstand von BeanCounter angezeigt werden kann. Dies läßt BeanCounter z.B. zeigen, welche Gegenstände in Appraiser betrachtet wurden";
		["A_MailInvoiceTimeout"]	= "Die Zeitspanne, die BeanCounter auf eine Antwort des Servers wartet, um auf eine Mailabfrage zu reagieren. Eine Abfrage ist das \"wer\", \"was\" und \"wie\" einer Auktionshaus-Mail.";
		["A_MailRecolor"]	= "BeanCounter liest alle Mails vom Auktionshaus. Diese Option bestimmt, wie BeanCounter die Anzeige der Mails einfärben soll, um sie als ungelesen darzustellen.";
		["HelpGuiItemBox"]	= "Ziehe einen Gegenstand in die Box um danach zu Suchen";
		["Q_BeanCountersTooltip"]	= "Was ist BeanCounters Tooltip";
		["Q_DateString"]	= "Anzuwendendes Datumsformat?";
		["Q_DateStringCommands"]	= "Gültige Datumsbefehle?";
		["Q_ExtenalSearch"]	= "Erlaube externen AddOns die Benutzung von BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "Was ist eine Mail-Zeitüberschreitung?";
		["Q_MailRecolor"]	= "Was ist Mail einfärben ?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Maximal anzuzeigende Suchtreffer (von jeder Datenbank)";
		["TTDataExpireEnabled"]	= "Datensätze älter wie der gewählte Zeitraum werden GELÖSCHT";
		["TT_ColorizeSearch"]	= "Diese Option ändert die Farben der Itemlinien im BeanCounter Suchfenster";
		["TT_MaxDisplayedResults"]	= "Dies kontrolliert die Anzahl der im Fenster angezeigten Suchtreffer.";
		["TT_neutralCheck"]	= "Ergebnisanzeige für neutrales Schwarzmeer Auktionshaus";
		["TT_OpacityLevel"]	= "Dies steuert das Niveau der Opazität für die farbigen Balken im BeanCounter Suchfenster (wenn aktiviert)";
		["TT_sendtosearch"]	= "Wenn eine Suche in BeanCounter eingetragen wird übernimmt das AH Browserfenster die Abfrage ebenfalls.";

		-- Section: Interface
		["Cancelled"]	= "Abgebrochen";
		["UiAucCancelled"]	= "Auktion abgebrochen";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Auktionshaus der Allianz";
		["MailHordeAuctionHouse"]	= "Auktionshaus der Horde";
		["MailNeutralAuctionHouse"]	= "Auktionshaus der Schwarzmeerräuber";
		["MailSenderAuctionHouse"]	= "Auktionshaus";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Trage das Format ein, wie das Datum dargestellt werden soll. Standard ist %c";
		["TTDateStringExample"]	= "Zeigt ein Beispiel an, wie die Datumsausgabe aussehen wird";
		["TTExtenalSearch"]	= "Wenn eine Suche in ein anderes AddOn eingetragen wird, zeigt BeanCounter auch eine Suche nach diesem Item an.";
		["TTMailInvoiceTimeout"]	= "Bestimmt wie lange BeanCounter versucht, eine Mail vom Server zu erhalten, bevor er aufgibt. Tiefer == schneller, aber grössere Wahrscheinlichkeit auf fehlende Daten; Höher == langsamer, verbessert aber die Wahrscheinlichkeit alle Daten zu erhalten, wenn der Mailserver extrem beschäftigt ist.";
		["TTMailRecolor"]	= "Wähle, wie die Mailanzeige erscheint, nachdem BeanCounter den Briefkasten durchsucht hat.";
		["TTModTTShow"]	= "Zeige BeanCounter erweiterten Tooltip nur, wenn ALT gedrückt wird.";
		["TTOpenconfig"]	= "Öffnet das Konfigurationsfenster von BeanCounter";
		["TTResort Database"]	= "Dies durchsucht die Daten von BeanCounter und sortiert die Eintragungen nach aufsteigender Zeit. Dies hilft, die Datenbank zu beschleunigen.";
		["TTShowBeginnerTooltips"]	= "Aktiviert die Anzeige von Anfängertooltips beim überfahren mit der Maus.";
		["TTShowReasonPurchase"]	= "Aktiviert die Anzeige des Suchgrundes, zu dem ein Item gekauft wurde und zeigt ihn im Tooltip an.";
		["TTValidateDatabase"]	= "Dies durchsucht die Daten von BeanCounter und versucht alle gefundenen Fehler zu beheben. Benutze dies, wenn Fehler bei der Suche auftreten.";
		["TT_AuctionCheck"]	= "Zeige im Auktionshaus verkaufte Gegenstände";
		["TT_AuctionFailedCheck"]	= "Zeige Gegenstände, die nicht verkauft wurden.";
		["TT_BeanCounterAHTab"]	= "Rechtsklicke um BeanCounter in einem eigenen Fenster anzuzeigen.";
		["TT_BeanCounterSelectBox"]	= "Filtere Suchresultate per Server, Spieler oder Fraktion";
		["TT_BidCheck"]	= "Zeige Gegenstände, die im Auktionshaus gekauft wurden.";
		["TT_BidFailedCheck"]	= "Zeige Gegenstände bei denen Du überboten wurdest";
		["TT_ClassicCheck"]	= "Zeige Resultate aus der klassischen BeanCounter Datenbank";
		["TT_ExactCheck"]	= "Genaue Textsuche";
		["TT_ItemIconBox"]	= "Ziehe für eine Suche einen Gegenstand hierher.\nZeigt wenn möglich das aktuelle Suchicon.";
		["TT_ScrollHeader"]	= "\nRechtsklick+Ziehen zur Größenänderung\nSTRG+Rechtsklick zum Zurücksetzen";
		["TT_SearchBox"]	= "Suchanfragen hier eingeben. Freilassen zur Suche nach allem";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Auktionsverlaufdatenbank";
		["UiAucExpired"]	= "Auktion abgelaufen";
		["UiAucSuccessful"]	= "Auktion erfolgreich";
		["UiAuctions"]	= "Auktionen";
		["UiAuctionTransaction"]	= "Auktion";
		["UiBids"]	= "Gebote";
		["UiBidTransaction"]	= "Gebot";
		["UiBuyerSellerHeader"]	= "Käufer/Verkäufer";
		["UiBuyTransaction"]	= "Kaufen";
		["UiClassicCheckBox"]	= "Zeige klassische BC-Daten";
		["UiData"]	= "Daten";
		["UiDateHeader"]	= "Datum";
		["UiDepositTransaction"]	= "Anzahlung";
		["UiDone"]	= "Fertig";
		["UiExactNameSearch"]	= "Genaue Namenssuche";
		["UiFailedAuctions"]	= "Fehlgeschlagene Auktion";
		["UiFee"]	= "Gebühr";
		["UiMailFrameRecording"]	= "BeanCounter liest die Mails ein";
		["UiMailFrameWait1"]	= "Bitte das Mailfenster nicht schließen oder";
		["UiMailFrameWait2"]	= "Auktionen der Gegenstände werden nicht aufgezeichnet";
		["UiNameHeader"]	= "Gegenstand";
		["UiNetHeader"]	= "Netto";
		["UiNetPerHeader"]	= "Netto pro";
		["UiOutbid"]	= "Überboten";
		["UiOutbids"]	= "Überbotene";
		["UiPriceHeader"]	= "Preis";
		["UiPriceper"]	= "Einzelpreis";
		["UiPricePerHeader"]	= "Stückpreis";
		["UiPurchases"]	= "Einkäufe";
		["UiQuantityHeader"]	= "Anz.";
		["UiReason"]	= "Grund";
		["UiSales"]	= "Verkäufe";
		["UiSearch"]	= "Suche";
		["UiSearchForLabel"]	= "Suche nach:";
		["UiSellTransaction"]	= "Verkaufen";
		["UiServer"]	= "Server";
		["UiTransactions"]	= "Transaktionen";
		["UiTransactionsLabel"]	= "Transaktionen:";
		["UiTransactionTypeHeader"]	= "Typ";
		["UiUseDateFilter"]	= "Datumsfilter verwenden";
		["UiDateFilterHelp"]	= "Monat / Tag / Jahr";
		["UiConfigure"]	= "Konfigurieren";
		["UiItemsCount"]	= "Gegenstände: ";
		["UiEntriesCount"]	= "Einträge: ";
		["UiProfit"]	= "Gewinn";
		["Profit"]	= "Gewinn";
		["Click and drag to resize window"]	= "Klicken und ziehen, um die Fenstergröße zu ändern";
		["Do you want to delete this item from the database?"]	= "Möchtest du diesen Gegenstand aus der Datenbank löschen?";
		["Yes"]	= "Ja";
		["No"]	= "Nein";
		["TT_useDateCheck"]	= "Filtert Suchergebnisse nach dem eingegebenen Zeitraum.";
		["UiWealth"]	= "Vermögen";
		["UiWononBid"]	= "Gebotskauf";
		["UiWononBuyout"]	= "Sofortkauf";
		["UiAucSuccessful"]	= "Erfolgreiche Auktionen";

}
