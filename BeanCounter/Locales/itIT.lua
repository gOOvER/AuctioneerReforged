--[[
	BeanCounter - Localization (itIT)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.itIT = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "Configurazione di BeanCounter";
		["C_BeanCounterDatabaseMaintenance"]	= "Gestione del database di BeanCounter";
		["C_BeanCounterOptions"]	= "Opzioni di BeanCounter";
		["C_ColorizeSearch"]	= "Aggiungi un gradiente di colore a ogni risultato nella finestra di ricerca.";
		["C_DatabaseLength"]	= "Determina per quanto tempo BeanCounter terrà traccia delle transazione alla casa d'aste.";
		["C_DataMaintenance"]	= "Gestione dei dati";
		["C_DateString"]	= "Formato data da usare:";
		["C_DateStringExample"]	= "Esempio della data:";
		["C_ExtenalSearch"]	= "Permetti ad Addon di terze parti di usare i dati di BeanCounter";
		["C_MailInvoiceTimeout"]	= "Timeout di scansione della posta = %d secondi";
		["C_MailRecolor"]	= "Metodo di ri-colorazione della posta";
		["C_ModTTShow"]	= "Mostra il tooltip aggiuntivo solo quando il tasto Alt è premuto";
		["C_MonthsToKeep"]	= "Quanti mesi di dati vuoi tenere in memoria?";
		["C_OpacityLevel"]	= "Livello di opacità";
		["C_Resortascendingtime"]	= "Riordina tutti i dati in base a data crescente";
		["C_ResortDatabase"]	= "Riorganizza il Database";
		["C_ScanDatabase"]	= "Scansiona il database per eventuali errori: da usare solo in caso ci siano errori durante la ricerca con BeanCounter.\nFai un backup dei dati di BeanCounter prima di procedere.";
		["C_SearchConfiguration"]	= "Configurazione della ricerca";
		["C_SendToSearch"]	= "Aggiungere gli oggetti cercati in BeanCounter nella finestra di ricerca principale della casa d'aste?";
		["C_ShowBeginnerTooltips"]	= "Mostra il tooltip iniziale quando passi il mouse";
		["C_ShowReasonPurchase"]	= "Mostra il motivo dell'acquisto nel tooltip";
		["C_ValidateDatabase"]	= "Valida il Databse";

		-- Section: Generic Strings
		["NoRe-Color"]	= "Non ricolorare";
		["off"]	= "Spento";
		["Ok"]	= "Ok";
		["on"]	= "Acceso";
		["Re-ColorIcons"]	= "Ricolora le icone";
		["Re-ColorIconsandText"]	= "Ricolora le icone ed il testo";
		["Re-ColorText"]	= "Ricolora il testo";
		["TooltipFailed"]	= "Impossibile ricevere le informazioni del messaggio a a comparsa.";
		["UiNeutralCheckBox"]	= "Visualizza dati delle case d'asta neutrali.";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter memorizzerà i motivi degli acquisti fatti e li mostrerà nel tooltip dell'oggetto";
		["A_DateString"]	= "Questo controlla come il campo \"Data\" di BeanCounter viene mostrato nella GUI. I comandi sono preceduti da %, comandi multipli di testo possono essere concatenati. Per esempio %a == %x mostrerà Mer == 21:34:21";
		["A_DateStringCommands"]	= "Comandi: \n %a = nome del giorno abbreviato, \n %A = nome del giorno, \n %b = nome del mese abbreviato, \n %B = nome del mese, \n %c = data e ora, \n %d = giorno del mese (01-31),\n %H = ore (24), \n %I = ore (12),\n %M = minuti, \n %m = mese, \n %p = am/pm, \n %S = secondi, \n %U = numero della settimana ,\n %w = giorno della settimana in numero (0-6),\n %x = data, \n %X = tempo,\n %Y = anno completo (2012), \n %y = anno abbreviato(12)";
		["A_ExtenalSearch"]	= "Permetti a BeanCounter di usare le ricerche che fai in altre addon. Per esempio permetti a BeanCounter di mostrare l'oggetto che stai guardando in Appraiser.";
		["A_MailInvoiceTimeout"]	= "Il tempo che BeanCounter aspetterà prima di richiedere le informazioni al server in caso di mancata risposta. La richiesta consiste nell'oggetto della lettera, nome del mittente e oggetti allegati.";
		["A_MailRecolor"]	= "BeanCounter legge tutte le lettere provenienti dalla Casa d'Aste. Questa opzione dice a BeanCounter come si vuole che vengano marcate le lettere non lette.";
		["HelpGuiItemBox"]	= "Trascina un oggetto nel box per visualizzarne lo storico";
		["Q_BeanCountersTooltip"]	= "Cos'è il tooltip di BeanCounter";
		["Q_DateString"]	= "Che formato si vuole usare per la data?";
		["Q_DateStringCommands"]	= "Comandi per la data accettabili?";
		["Q_ExtenalSearch"]	= "Permettere ad Addon di terze parti di usare BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "Cos'è il timeout di controllo della posta?";
		["Q_MailRecolor"]	= "Cos'è il controllo di ri-colorazione delle lettere?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Numero massimo di risultati da mostrare durante una ricerca (da ogni database)";
		["TTDataExpireEnabled"]	= "Dati più vecchi del tempo scelto verranno CANCELLATI";
		["TT_ColorizeSearch"]	= "Questa opzione cambia il colore delle linee degli oggetti nella finestra di ricerca di BeanCounter";
		["TT_MaxDisplayedResults"]	= "Questa opzione controlla il numero massimo di risultati da mostrare nella finestra di scroll.";
		["TT_neutralCheck"]	= "Mostra i risultati dalla casa d'aste neutrale di Blackwater";
		["TT_OpacityLevel"]	= "Questa opzione controlla l'opacità delle barre colorate nella finestra di ricerca di BeacnCounter (se abilitato)";
		["TT_sendtosearch"]	= "Quando viene fatta una ricerca in BeanCounter, questa verrà aggiunta anche alla tab di ricerca principale della Casa d'Aste.";

		-- Section: Interface
		["Cancelled"]	= "Cancellato";
		["UiAucCancelled"]	= "Asta Cancellata";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Casa d'Aste dell'Alleanza";
		["MailHordeAuctionHouse"]	= "Casa d'Aste dell'Orda";
		["MailNeutralAuctionHouse"]	= "Casa d'Aste di Blackwater";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Entra il formato desiderato per mostrate la data. L'opzione predefinita è %c";
		["TTDateStringExample"]	= "Mostra un esempio della data formattata";
		["TTExtenalSearch"]	= "Se fate una ricerca in un altro addon, BeanCounter vi mostrerà la stessa ricerca";
		["TTMailInvoiceTimeout"]	= "Sceglie quanto tempo BeanCounter cecherà di recuperare le mail dal server prima di lasciar perdere. Più basso == più veloce ma con più possibilità di mancare una mail. Più alto == più lento, ma migliori risultati se il server di posta è estremamente occupato.";
		["TTMailRecolor"]	= "Scegli come appariranno le mail dopo che BeanCounter scansiona  la mailbox.";
		["TTModTTShow"]	= "Questa opzione mostrerà il tooltip aggiuntivo di BeanCounter solo se il tasto Alt è premuto.";
		["TTOpenconfig"]	= "Apre la finestra di configurazione di BeancCounter";
		["TTResort Database"]	= "Questa opzione riorganizzerà il database ordinandolo per data crescente. Ciò migliora la compattazione del database.";
		["TTShowBeginnerTooltips"]	= "Mostra il tooltip d'inzio quando si passa il mouse.";
		["TTShowReasonPurchase"]	= "Mostra il motivo per cui è stato fatto l'acquisto nel tooltip.";
		["TTValidateDatabase"]	= "Questa opzione scansiona i dati di BeanCounter per cercare di correggere eventuali errori presenti. Usalo solo se riscontri malfunzionamenti.";
		["TT_AuctionCheck"]	= "Mostra gli oggetti venduti alla Casa d'Aste.";
		["TT_AuctionFailedCheck"]	= "Mostra gli oggetti la cui vendita non è andata a buon fine";
		["TT_BeanCounterAHTab"]	= "Click destro per mostrare BeanCounter in una finestra esterna.";
		["TT_BeanCounterSelectBox"]	= "Filtra i risultati in base al server, giocatore o fazione.";
		["TT_BidCheck"]	= "Mostra gli oggetti acquistati alla Casa d'Aste.";
		["TT_BidFailedCheck"]	= "Mostra gli oggetti su cui hai fatto un'offerta.";
		["TT_ClassicCheck"]	= "Mostra i risultati dal databse classico di BeanCounter.";
		["TT_ExactCheck"]	= "Ricerca solo testo esatto.";
		["TT_ItemIconBox"]	= "Trascina un oggetto sul box per cercarlo.\nVerrà mostrata l'icona dell'oggetto se possibile.";
		["TT_ScrollHeader"]	= "\nRightClick+Drag per Spostare\nALT+RightClick per Ridimensionare\nCTRL+RightClick per Resettare";
		["TT_SearchBox"]	= "Scrivi quì le query di ricerca, lascia il campo vuoto per visualizzare tutto.";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Database storico delle aste";
		["UiAucExpired"]	= "Asta Scaduta";
		["UiAucSuccessful"]	= "Asta Riuscita";
		["UiAuctions"]	= "Aste";
		["UiAuctionTransaction"]	= "Asta";
		["UiBids"]	= "Offerte";
		["UiBidTransaction"]	= "Offerta";
		["UiBuyerSellerHeader"]	= "Compratore/Venditore";
		["UiBuyTransaction"]	= "Compra";
		["UiClassicCheckBox"]	= "Mostra i dati classici di BeanCounter";
		["UiData"]	= "Dati";
		["UiDateHeader"]	= "Data";
		["UiDepositTransaction"]	= "Deposito";
		["UiDone"]	= "Fatto";
		["UiExactNameSearch"]	= "Ricerca nome esatto";
		["UiFailedAuctions"]	= "Asta fallita";
		["UiFee"]	= "Tassa";
		["UiMailFrameRecording"]	= "BeanCounter sta registrando la tua posta";
		["UiMailFrameWait1"]	= "Per favore non chiudere la posta";
		["UiMailFrameWait2"]	= "L'oggetto messo all'asta non verrà registrato";
		["UiNameHeader"]	= "Oggetto";
		["UiNetHeader"]	= "Netto";
		["UiNetPerHeader"]	= "Netto per";
		["UiOutbid"]	= "Offerta superata";
		["UiOutbids"]	= "Offerte superate";
		["UiPriceHeader"]	= "Prezzo";
		["UiPriceper"]	= "Prezzo per";
		["UiPricePerHeader"]	= "Indicatore di prezzo";
		["UiPurchases"]	= "Compere";
		["UiQuantityHeader"]	= "Q.tà";
		["UiReason"]	= "Ragione";
		["UiSales"]	= "Vendite";
		["UiSearch"]	= "Ricerca";
		["UiSearchForLabel"]	= "Cerca per:";
		["UiSellTransaction"]	= "Vendi";
		["UiServer"]	= "Server";
		["UiTransactions"]	= "Transazioni";
		["UiTransactionsLabel"]	= "Transazioni:";
		["UiTransactionTypeHeader"]	= "Tipo";
		["UiWealth"]	= "Ricchezza";
		["UiWononBid"]	= "Vinto con offerta";
		["UiWononBuyout"]	= "Vinto all'acquisto diretto";

}
