--[[
	BeanCounter - Localization (enUS)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.enUS = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "BeanCounter Config";
		["C_BeanCounterDatabaseMaintenance"]	= "BeanCounter Database Maintenance";
		["C_BeanCounterOptions"]	= "BeanCounter Options";
		["C_ColorizeSearch"]	= "Add a gradient color to each result in the search window";
		["C_DatabaseLength"]	= "Determines how long BeanCounter will save Auction House Transactions.";
		["C_DataMaintenance"]	= "Data Maintenance";
		["C_DateString"]	= "Date format to use:";
		["C_DateStringExample"]	= "Example Date:";
		["C_ExtenalSearch"]	= "Allow External Addons to use BeanCounter's Search";
		["C_MailInvoiceTimeout"]	= "Mail Invoice Timeout = %d seconds";
		["C_MailRecolor"]	= "Mail Re-Color Method";
		["C_ModTTShow"]	= "Display the extra tooltip only if Alt is pressed.";
		["C_MonthsToKeep"]	= "How many months of data to keep?";
		["C_OpacityLevel"]	= "Opacity level";
		["C_Resortascendingtime"]	= "Resort all entries by ascending time";
		["C_ResortDatabase"]	= "Resort Database";
		["C_ScanDatabase"]	= "Scan Database for errors: Use if you have errors when searching BeanCounter.\nBackup BeanCounter's saved variables before using.";
		["C_SearchConfiguration"]	= "Search Configuration";
		["C_SendToSearch"]	= "Add BeanCounter's searched item to the Main Auction House Window?";
		["C_ShowBeginnerTooltips"]	= "Show beginner tooltips on mouse over";
		["C_ShowReasonPurchase"]	= "Show reason for purchase in the tooltip";
		["C_ValidateDatabase"]	= "Validate Database";

		-- Section: Generic Strings
		["NoRe-Color"]	= "No Re-Color";
		["off"]	= "off";
		["Ok"]	= "Ok";
		["on"]	= "on";
		["Re-ColorIcons"]	= "Re-Color Icons";
		["Re-ColorIconsandText"]	= "Re-Color Icons and Text";
		["Re-ColorText"]	= "Re-Color Text";
		["TooltipFailed"]	= "Unable to get Tooltip Info";
		["UiNeutralCheckBox"]	= "Show Neutral AH data";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter will store the SearchUI reason an item was purchased and display it in the tooltip.";
		["A_DateString"]	= "This controls how the Date field of BeanCounter's GUI is shown. Commands are prefaced by % and multiple commands and text can be mixed. For example %a == %X would display Wed == 21:34:21";
		["A_DateStringCommands"]	= "Commands: \n %a = abr. weekday name, \n %A = weekday name, \n %b = abr. month name, \n %B = month name,\n %c = date and time, \n %d = day of the month (01-31),\n %H = hour (24), \n %I = hour (12),\n %M = minute, \n %m = month,\n %p = am/pm, \n %S = second,\n %U = week number of the year ,\n %w = numerical weekday (0-6),\n %x = date, \n %X = time,\n %Y = full year (2007), \n %y = two-digit year (07)";
		["A_ExtenalSearch"]	= "Other addons can have BeanCounter search for an item to be displayed in BeanCounter's GUI. For example this allows BeanCounter to show what items you are looking at in Appraiser";
		["A_MailInvoiceTimeout"]	= "The length of time BeanCounter will wait on the server to respond to an invoice request. An invoice is the \"who\", \"what\", and \"how\" of an Auction House mail.";
		["A_MailRecolor"]	= "BeanCounter reads all mail from the Auction House. This option tells BeanCounter how the user wants to re-color the messages to make them look unread.";
		["HelpGuiItemBox"]	= "Drop item into box to search.";
		["Q_BeanCountersTooltip"]	= "What is BeanCounter's Tooltip";
		["Q_DateString"]	= "Date Format to use?";
		["Q_DateStringCommands"]	= "Acceptable Date Commands?";
		["Q_ExtenalSearch"]	= "Allow External Addons to use BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "What is Mail Invoice Timeout?";
		["Q_MailRecolor"]	= "What is Mail Re-color Method?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Max displayed search results (from each database)";
		["TTDataExpireEnabled"]	= "Data older than the selected time range will be DELETED";
		["TT_ColorizeSearch"]	= "This option changes the color of the items lines in the BeanCounter search window.";
		["TT_MaxDisplayedResults"]	= "This controls the total number of results displayed in the scroll frame.";
		["TT_neutralCheck"]	= "Display results from the Neutral Blackwater Auction house";
		["TT_OpacityLevel"]	= "This controls the level of opacity for the colored bars in the BeanCounter search window (if enabled)";
		["TT_sendtosearch"]	= "When entering a search in BeanCounter it will also add the string to the AH browse frame.";

		-- Section: Interface
		["Cancelled"]	= "Cancelled";
		["UiAucCancelled"]	= "Auc Cancelled";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Alliance Auction House";
		["MailHordeAuctionHouse"]	= "Horde Auction House";
		["MailNeutralAuctionHouse"]	= "Blackwater Auction House";
		["MailSenderAuctionHouse"]	= "Auction House";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Enter the format that you would like your date field to show. Default is %c.";
		["TTDateStringExample"]	= "Displays an example of what your formatted date will look like.";
		["TTExtenalSearch"]	= "When entering a search in another addon, BeanCounter will also display a search for that item.";
		["TTMailInvoiceTimeout"]	= "Chooses how long BeanCounter will attempt to get a mail invoice from the server before giving up. Lower == quicker but more chance of missing data. Higher == slower, but improves chances of getting data if the Mail server is extremely busy.";
		["TTMailRecolor"]	= "Choose how mail will appear after BeanCounter has scanned the Mail Box.";
		["TTModTTShow"]	= "This option will display BeanCounter's extra tooltip only if Alt is pressed.";
		["TTOpenconfig"]	= "Opens the BeanCounter configuration window";
		["TTResort Database"]	= "This will scan Beancounter's Data sort all entries in ascending time order. This helps speed up the database compression functions.";
		["TTShowBeginnerTooltips"]	= "Display the beginner tooltips on mouse over.";
		["TTShowReasonPurchase"]	= "Turns on the SearchUI reason an item was purchased for in the tooltip.";
		["TTValidateDatabase"]	= "This will scan Beancounter's Data and attempt to correct any errors it may find. Use if you are getting errors on search.";
		["TT_AuctionCheck"]	= "Display items sold at the Auction House.";
		["TT_AuctionFailedCheck"]	= "Display items you failed to sell.";
		["TT_BeanCounterAHTab"]	= "Right click to display BeanCounter in a external window.";
		["TT_BeanCounterSelectBox"]	= "Filter search results by server, player or faction.";
		["TT_BidCheck"]	= "Display items bought from the Auction House.";
		["TT_BidFailedCheck"]	= "Display items you were outbid on";
		["TT_ClassicCheck"]	= "Display results from BeanCounter Classic Database.";
		["TT_ExactCheck"]	= "Only match the exact text in the search box";
		["TT_ItemIconBox"]	= "Drop an item here to start a search for it.\nDisplays current search's icon if possible.";
		["TT_ScrollHeader"]	= "\nRightClick+Drag to Move\nALT+RightClick to resize\nCTRL+RightClick to reset";
		["TT_SearchBox"]	= "Enter search queries here or leave blank to search all";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Auction History Database";
		["UiAucExpired"]	= "Auc Expired";
		["UiAucSuccessful"]	= "Auc Successful";
		["UiAuctions"]	= "Auctions";
		["UiAuctionTransaction"]	= "Auction";
		["UiBids"]	= "Bids";
		["UiBidTransaction"]	= "Bid";
		["UiBuyerSellerHeader"]	= "Buyer/Seller";
		["UiBuyTransaction"]	= "Buy";
		["UiClassicCheckBox"]	= "Show BC Classic data.";
		["UiData"]	= "Data";
		["UiDateHeader"]	= "Date";
		["UiDepositTransaction"]	= "Deposit";
		["UiDone"]	= "Done";
		["UiExactNameSearch"]	= "Exact name search";
		["UiFailedAuctions"]	= "Failed Auctions";
		["UiFee"]	= "Fee";
		["UiMailFrameRecording"]	= "BeanCounter is recording your mail";
		["UiMailFrameWait1"]	= "Please do not close the mail frame or";
		["UiMailFrameWait2"]	= "Auction Items will not be recorded";
		["UiNameHeader"]	= "Item";
		["UiNetHeader"]	= "Net";
		["UiNetPerHeader"]	= "Net Per";
		["UiOutbid"]	= "Outbid";
		["UiOutbids"]	= "Outbids";
		["UiPriceHeader"]	= "Price";
		["UiPriceper"]	= "Price/Per";
		["UiPricePerHeader"]	= "Price Header";
		["UiPurchases"]	= "Purchases";
		["UiQuantityHeader"]	= "Qty";
		["UiReason"]	= "Reason";
		["UiSales"]	= "Sales";
		["UiSearch"]	= "Search";
		["UiSearchForLabel"]	= "Search for:";
		["UiSellTransaction"]	= "Sell";
		["UiServer"]	= "Server";
		["UiTransactions"]	= "Transactions";
		["UiTransactionsLabel"]	= "Transactions:";
		["UiTransactionTypeHeader"]	= "Type";
		["UiUseDateFilter"]	= "Use Date Filter";
		["UiDateFilterHelp"]	= "Month / Day / Year";
		["UiConfigure"]	= "Configure";
		["UiItemsCount"]	= "Items: ";
		["UiEntriesCount"]	= "Entries: ";
		["UiProfit"]	= "Profit";
		["Profit"]	= "Profit";
		["Click and drag to resize window"]	= "Click and drag to resize window";
		["Do you want to delete this item from the database?"]	= "Do you want to delete this item from the database?";
		["Yes"]	= "Yes";
		["No"]	= "No";
		["TT_useDateCheck"]	= "Filter search results by the specified date range.";
		["UiWealth"]	= "Wealth";
		["UiWononBid"]	= "Won on Bid";
		["UiWononBuyout"]	= "Won on Buyout";
		["UiAucSuccessful"]	= "Successful Auctions";

}
