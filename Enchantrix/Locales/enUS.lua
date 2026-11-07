--[[
	Enchantrix - Localization (enUS)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.enUS = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Clearing all enchant data";
		["FrmtActClearFail"]	= "Unable to find item: %s";
		["FrmtActClearOk"]	= "Cleared data for item: %s";
		["FrmtActDefault"]	= "Enchantrix's %s option has been reset to its default setting";
		["FrmtActDefaultAll"]	= "All Enchantrix options have been reset to default settings.";
		["FrmtActDisable"]	= "Not displaying item's %s data";
		["FrmtActEnable"]	= "Displaying item's %s data";
		["FrmtActSet"]	= "Set %s to '%s'";
		["FrmtActUnknown"]	= "Unknown command keyword: '%s'";
		["FrmtActUnknownLocale"]	= "The locale you specified ('%s') is unknown. Valid locales are:";
		["FrmtPrintin"]	= "Enchantrix's messages will now print on the \"%s\" chat frame";
		["FrmtUsage"]	= "Usage:";
		["MesgDisable"]	= "Disabling automatic loading of Enchantrix";
		["MesgNotloaded"]	= "Enchantrix is not loaded. Type /enchantrix for more info.";

		-- Section: Command Options
		["CmdClearAll"]	= "all";
		["OptClear"]	= "([Item]|all)";
		["OptDefault"]	= "(<option>|all)";
		["OptFindBidauct"]	= "<silver>";
		["OptFindBuyauct"]	= "<percent>";
		["OptLocale"]	= "<locale>";
		["OptPrintin"]	= "(<frameIndex>[Number]|<frameName>[String])";

		-- Section: Commands
		["CmdClear"]	= "clear";
		["CmdDefault"]	= "default";
		["CmdDisable"]	= "disable";
		["CmdFindBidauct"]	= "bidbroker";
		["CmdFindBidauctShort"]	= "bb";
		["CmdFindBuyauct"]	= "percentless";
		["CmdFindBuyauctShort"]	= "pl";
		["CmdHelp"]	= "help";
		["CmdLocale"]	= "locale";
		["CmdOff"]	= "off";
		["CmdOn"]	= "on";
		["CmdPrintin"]	= "print-in";
		["CmdToggle"]	= "toggle";
		["ConfigUI"]	= "config";
		["ShowDELevels"]	= "levels";
		["ShowDEMaterials"]	= "materials";
		["ShowEmbed"]	= "embed";
		["ShowGuessAuctioneerHsp"]	= "valuate-hsp";
		["ShowGuessAuctioneerMed"]	= "valuate-median";
		["ShowGuessAuctioneerVal"]	= "valuate-val";
		["ShowGuessBaseline"]	= "valuate-baseline";
		["ShowTerse"]	= "terse";
		["ShowUI"]	= "show";
		["ShowValue"]	= "valuate";
		["StatOff"]	= "Not displaying any enchant data";
		["StatOn"]	= "Displaying configured enchant data";

		-- Section: Config Text
		["GuiLoad"]	= "Load Enchantrix";
		["GuiLoad_Always"]	= "always";
		["GuiLoad_Never"]	= "never";

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
		["FrmtCredit"]	= "(go to  to share your data)";
		["FrmtWelcome"]	= "Enchantrix v%s loaded";
		["MesgAuctVersion"]	= "Enchantrix requires Auctioneer version 4.0 or higher. Some features will be unavailable until you update your Auctioneer installation.";

		-- Section: Help Text
		["GuiAltChatlink"]	= "Open tooltips from chat links with Alt left-clicks";
		["GuiClearall"]	= "Clear All Enchantrix Data";
		["GuiClearallButton"]	= "Clear All";
		["GuiClearallHelp"]	= "Click here to clear all of Enchantrix data for the current server-realm.";
		["GuiClearallNote"]	= "for the current server-faction";
		["GuiDefaultAll"]	= "Reset All Enchantrix Options";
		["GuiDefaultAllButton"]	= "Reset All";
		["GuiDefaultAllHelp"]	= "Click here to set all Enchantrix options to their default values.\nWARNING: This action is NOT undoable.";
		["GuiDefaultOption"]	= "Reset this setting";
		["GuiDELevels"]	= "Show disenchant level requirements in the tooltip";
		["GuiDEMaterials"]	= "Show disenchant material info in the tooltip";
		["GuiEmbed"]	= "Embed info in in-game tooltip";
		["GuiLocale"]	= "Set locale to";
		["GuiMainEnable"]	= "Enable Enchantrix";
		["GuiMainHelp"]	= "Contains settings for Enchantrix \nan AddOn that displays information in item tooltips pertaining to the results of disenchanting said item.";
		["GuiOtherHeader"]	= "Other Options";
		["GuiOtherHelp"]	= "Miscellaneous Enchantrix Options";
		["GuiPrintin"]	= "Select the desired message frame";
		["GuiPrintYieldsInChat"]	= "Show item yields in chat";
		["GuiShowCraftReagents"]	= "Show crafting reagents in tooltips";
		["GuiTerse"]	= "Enable terse mode";
		["GuiValuateAverages"]	= "Valuate with Auctioneer averages";
		["GuiValuateBaseline"]	= "Valuate with Built-in Data";
		["GuiValuateEnable"]	= "Enable Valuation";
		["GuiValuateHeader"]	= "Valuation";
		["GuiValuateMedian"]	= "Valuate with Auctioneer medians";
		["HelpAltChatlink"]	= "Enables opening a tooltip by left-clicking on an item link in chat while the Alt key is pressed.";
		["HelpClear"]	= "Clear the specified item's data (you must shift click insert the item(s) into the command) You may also specify the special keyword \"all\"";
		["HelpDefault"]	= "Set an Enchantrix option to it's default value. You may also specify the special keyword \"all\" to set all Enchantrix options to their default values.";
		["HelpDisable"]	= "Stops enchantrix from automatically loading next time you log in";
		["HelpEmbed"]	= "Embed the text in the original game tooltip (note: certain features are disabled when this is selected)";
		["HelpFindBidauct"]	= "Find auctions whose possible disenchant value is a certain silver amount less than the bid price";
		["HelpFindBuyauct"]	= "Find auctions whose buyout price is a certain percent less than the possible disenchant value (and, optionally, a certain amount less than the disenchant value)";
		["HelpGuessAuctioneer5Val"]	= "If valuation is enabled, and you have Auctioneer installed, display the market value of disenchanting the item.";
		["HelpGuessAuctioneerHsp"]	= "If valuation is enabled, and you have Auctioneer installed, display the sellable price (HSP) valuation of disenchanting the item.";
		["HelpGuessAuctioneerMedian"]	= "If valuation is enabled, and you have Auctioneer installed, display the median based valuation of disenchanting the item.";
		["HelpGuessBaseline"]	= "If valuation is enabled, (Auctioneer not needed) display the baseline valuation of disenchanting the item, based upon the inbuilt prices.";
		["HelpGuessNoauctioneer"]	= "The valuate-hsp and valuate-median commands are not available because you do not have auctioneer installed";
		["HelpLoad"]	= "Change Enchantrix's load settings for this toon";
		["HelpLocale"]	= "Change the locale that is used to display Enchantrix messages";
		["HelpOnoff"]	= "Turns the enchant data display on and off";
		["HelpPrintin"]	= "Select which frame Enchantix will print out it's messages. You can either specify the frame's name or the frame's index.";
		["HelpShowDELevels"]	= "Select whether to show the enchanting skill needed to disenchant the item in the tooltip.";
		["HelpShowDEMaterials"]	= "Select whether to show the possible materials given by disenchanting the item in the tooltip.";
		["HelpShowUI"]	= "Show or hide the settings panel.";
		["HelpTerse"]	= "Enable/disable terse mode, showing only disenchant value. Can be overridden by holding down the control key.";
		["HelpValue"]	= "Select whether to show item's estimated values based on the proportions of possible disenchants";
		["ModTTShow_Help"]	= "Determines Tooltip behavior. \nAlways: Show Enchantrix's Tooltip every time. \nWhen <mod> is pressed: Only show Enchantrix's tooltip if the specified modifier is pressed. \nWhen <mod> is not pressed: Only show Enchantrix's tooltip if the specified modifier is not pressed.\nNever: Never show Enchantrix's tooltip.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "You do not have Auctioneer installed. Auctioneer must be installed to perform an auction scan.";
		["AuctionScanVersionTooOld"]	= "You do not have the correct version of Auctioneer installed, this feature requires Auctioneer v4.0 or later.";
		["ChatDeletedProfile"]	= "Deleted profile:";
		["ChatDuplicatedProfile"]	= "Duplicated profile to:";
		["ChatResetProfile"]	= "Reset all settings for:";
		["ChatSavedProfile"]	= "Saved profile:";
		["ChatUsingProfile"]	= "Now using profile:";
		["FrmtAutoDeActive"]	= "AutoDisenchant active";
		["FrmtAutoDeDisabled"]	= "AutoDisenchant disabled";
		["FrmtAutoDeDisenchantCancelled"]	= "Disenchant cancelled: item not found";
		["FrmtAutoDeDisenchanting"]	= "Disenchanting %s";
		["FrmtAutoDeIgnorePermanent"]	= "Ignoring %s permanently";
		["FrmtAutoDeIgnoreSession"]	= "Ignoring %s this session";
		["FrmtAutoDeInactive"]	= "AutoDisenchant inactive";
		["FrmtAutoDeMilling"]	= "Milling %s";
		["FrmtAutoDeMillingCancelled"]	= "Milling cancelled: item not found";
		["FrmtAutoDeProspectCancelled"]	= "Prospect cancelled: item not found";
		["FrmtAutoDeProspecting"]	= "Prospecting %s";
		["FrmtBidbrokerCurbid"]	= "curBid";
		["FrmtBidbrokerDone"]	= "Bid brokering done";
		["FrmtBidbrokerHeader"]	= "Bids having %s silver savings on average disenchant value (min %%less = %d):";
		["FrmtBidbrokerLine"]	= "%s, Valued at: %s, %s: %s, Save: %s, Less %s, Time: %s";
		["FrmtBidbrokerMinbid"]	= "minBid";
		["FrmtBidBrokerSkipped"]	= "Skipped %d auctions due to profit margin cutoff (%d%%)";
		["FrmtBidBrokerSkippedBids"]	= "Skipped %d auctions due to existing bids";
		["FrmtPctlessDone"]	= "Percent less done.";
		["FrmtPctlessHeader"]	= "Buyouts having %d%% savings over average item disenchant value (min savings = %s):";
		["FrmtPctlessLine"]	= "%s, Valued at: %s, BO: %s, Save: %s, Less %s";
		["FrmtPctlessSkillSkipped"]	= "Skipped %d auctions due to skill level cutoff (%s)";
		["FrmtPctlessSkipped"]	= "Skipped %d auctions due to profitability cutoff (%s)";

		-- Section: Tooltip Messages
		["Click"]	= "Click";
		["EnxMMTip"]	= "Enchantrix shows you what reagents an item will disenchant, prospect, or mill into. It also provides integration into Auctioneer to allow pricing and purchasing decisions to be made.";
		["FrmtBarkerPrice"]	= "Barker Price (%d%% margin)";
		["FrmtDEItemLevels"]	= "Disenchantable from item levels %d to %d.";
		["FrmtDisinto"]	= "Disenchants into:";
		["FrmtFound"]	= "Found that %s disenchants into:";
		["FrmtFoundNotDisenchant"]	= "Found that %s is not disenchantable";
		["FrmtInkFrom"]	= "Made from %s";
		["FrmtMillingFound"]	= "Found that %s mills into:";
		["FrmtMillingValueAuctHsp"]	= "Milling value (HSP)";
		["FrmtMillingValueAuctMed"]	= "Milling value (Median)";
		["FrmtMillingValueAuctVal"]	= "Milling value (AucAdv)";
		["FrmtMillingValueMarket"]	= "Milling value (Baseline)";
		["FrmtMillsInto"]	= "Mills into:";
		["FrmtPriceEach"]	= "(%s ea)";
		["FrmtProspectFound"]	= "Found that %s prospects into:";
		["FrmtProspectFrom"]	= "Prospectable from %s.";
		["FrmtProspectInto"]	= "Prospects into:";
		["FrmtProspectValueAuctHsp"]	= "Prospect value (HSP)";
		["FrmtProspectValueAuctMed"]	= "Prospect value (Median)";
		["FrmtProspectValueAuctVal"]	= "Prospect value (AucAdv)";
		["FrmtProspectValueMarket"]	= "Prospect value (Baseline)";
		["FrmtSuggestedPrice"]	= "Suggested price:";
		["FrmtTotal"]	= "Total";
		["FrmtValueAuctHsp"]	= "Disenchant value (HSP)";
		["FrmtValueAuctMed"]	= "Disenchant value (Median)";
		["FrmtValueAuctVal"]	= "Disenchant value (AucAdv)";
		["FrmtValueFixedVal"]	= "Disenchant value (Fixed)";
		["FrmtValueMarket"]	= "Disenchant value (Baseline)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer not loaded, using cached prices]";
		["FrmtWarnNoPrices"]	= "[No prices available]";
		["FrmtWarnPriceUnavail"]	= "[Some prices unavailable]";
		["RightClick"]	= "Right-Click";
		["ShiftClick"]	= "Shift-Click";
		["TipOpenConfig"]	= "to edit the configuration.";
		["TipOpenEnchant"]	= "to open the Enchanting window.";
		["TipOpenJewel"]	= "to open the Jewel Crafting window.";
		["TooltipMillingLevel"]	= "Milling requires skill %d";
		["TooltipProspectLevel"]	= "Prospecting requires skill %d";
		["TooltipShowDisenchantLevel"]	= "Disenchanting requires skill %d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "BeanCounter is required to determine purchase reason. Disabling AutoDE limit until BeanCounter is installed.";
		["ExportPriceAucAdv"]	= "Export Enchantrix prices to Auctioneer Advanced";
		["GuiActivateProfile"]	= "Activate a current profile";
		["GuiAutoDeBoughtForDE"]	= "Only items purchased for disenchanting";
		["GuiAutoDeEnable"]	= "Watch bags for disenchantable items - USE WITH CARE";
		["GuiAutoDeEpicItems"]	= "Auto Disenchant epic (purple) items";
		["GuiAutoDeOptions"]	= "Automation";
		["GuiAutoDePromptLine1"]	= "Do you want to disenchant:";
		["GuiAutoDePromptLine3"]	= "Valued at %s";
		["GuiAutoDEPurchaseReason"]	= "Bought for %s";
		["GuiAutoDeRareItems"]	= "Auto Disenchant rare (blue) items";
		["GuiAutoDESuggestion"]	= "Suggestion: %s this item";
		["GuiAutoLootDE"]	= "Automatically loot manually disenchanted, prospected, or milled items.";
		["GuiAutoMillingPromptLine1"]	= "Do you want to mill:";
		["GuiAutoProspectPromptLine1"]	= "Do you want to prospect:";
		["GuiBBUnbiddedOnly"]	= "Restrict BidBroker to unbidded items only";
		["GuiConfigProfiles"]	= "Setup, configure and edit profiles";
		["GuiCreateReplaceProfile"]	= "Create or replace a profile";
		["GuiDefaultBBProfitPercent"]	= "Default bidbroker profit percentage: %d";
		["GuiDefaultLessHSP"]	= "Default percentage less than HSP: %d";
		["GuiDefaultProfitMargin"]	= "Default Profit Margin:";
		["GuiDeleteProfileButton"]	= "Delete";
		["GuiDuplicateProfileButton"]	= "Copy Profile";
		["GuiFixedSettings"]	= "Fixed reagent prices";
		["GuiFixedSettingsNote"]	= "Note: These values will be used instead of Auctioneer or any other valuation methods if the checkbox is checked.\nThe following values are still affected by the reagent weights in the previous section, so if you want to make sure that the reagent is valued at exactly the specified amount below, then also make sure that it's weight is set to 100% in the weights section.";
		["GuiGeneralOptions"]	= "General Enchantrix options";
		["GuiIgnore"]	= "Ignore";
		["GuiItemValueAuc4HSP"]	= "Auc4 HSP";
		["GuiItemValueAuc4Median"]	= "Auc4 Median";
		["GuiItemValueAuc5Appraiser"]	= "AucAdv Appraiser Value";
		["GuiItemValueAuc5Market"]	= "AucAdv Market Value";
		["GuiItemValueAverage"]	= "Average (default)";
		["GuiItemValueBaseline"]	= "Market Baseline";
		["GuiItemValueCalc"]	= "Item value calculated from";
		["GuiMaxBuyout"]	= "Maximum Buyout price:";
		["GuiMillingingValues"]	= "Show estimated milling values";
		["GuiMillingLevels"]	= "Show milling level requirements in the tooltip";
		["GuiMillingMaterials"]	= "Show milling material info in the tooltip";
		["GuiMillingOptions"]	= "Milling Options";
		["GuiMinBBProfitPercent"]	= "Minimum bidbroker profit Percentage: %d";
		["GuiMinimapButtonAngle"]	= "Button angle: %d";
		["GuiMinimapButtonDist"]	= "Distance: %d";
		["GuiMinimapOptions"]	= "Minimap display options";
		["GuiMinimapShowButton"]	= "Display Minimap button";
		["GuiMinLessHSP"]	= "Minimum Percentage less than HSP: %d";
		["GuiMinProfitMargin"]	= "Minimum Profit Margin:";
		["GuiNewProfileName"]	= "New profile name:";
		["GuiNo"]	= "No";
		["GuiPLBBOnlyBelowDESkill"]	= "Only show items disenchantable at current skill";
		["GuiPLBBSettings"]	= "Percentless and Bidbroker settings";
		["GuiProspectingLevels"]	= "Show prospecting level requirements in the tooltip";
		["GuiProspectingMaterials"]	= "Show prospecting material info in the tooltip";
		["GuiProspectingOptions"]	= "Prospecting Options";
		["GuiProspectingValues"]	= "Show estimated prospecting values";
		["GuiResetProfileButton"]	= "Reset";
		["GuiSaveProfileButton"]	= "Save";
		["GuiShowMatSources"]	= "Show source material for items obtained by disenchanting, prospecting and milling.";
		["GuiShowMilling"]	= "Show Milling data for herbs";
		["GuiShowProspecting"]	= "Show Prospecting data for ores";
		["GuiTabAuctions"]	= "Auctions";
		["GuiTabFixed"]	= "Fixed Value";
		["GuiTabGeneral"]	= "General";
		["GuiTabMilling"]	= "Milling";
		["GuiTabProfiles"]	= "Profiles";
		["GuiTabProspecting"]	= "Prospecting";
		["GuiTabWeights"]	= "Weights";
		["GuiValueOptions"]	= "Value Display Options";
		["GuiValueShowAuc4HSP"]	= "Show Auctioneer HSP values";
		["GuiValueShowAuc4Median"]	= "Show Auctioneer median values";
		["GuiValueShowAuc5Market"]	= "Show Auctioneer market value";
		["GuiValueShowBaseline"]	= "Show built-in baseline values";
		["GuiValueShowDEValues"]	= "Show estimated disenchant values";
		["GuiValueTerse"]	= "Show terse disenchant value";
		["GuiWeighSettingsNote"]	= "The weights above change the valuation of the given reagent by the specified amount. Generally you will want to leave them at 100% unless you think they should be more or less valuable than the valuation method you are using is saying.";
		["GuiWeightSettings"]	= "Disenchant reagent desirability";
		["GuiYes"]	= "Yes";
		["ModTTShow"]	= "Show Tooltip:";
		["ModTTShow_alt"]	= "When Alt is pressed";
		["ModTTShow_always"]	= "Always";
		["ModTTShow_ctrl"]	= "When Ctrl is pressed";
		["ModTTShow_never"]	= "Never";
		["ModTTShow_noalt"]	= "When Alt is not pressed";
		["ModTTShow_noctrl"]	= "When Ctrl is not pressed";
		["ModTTShow_noshift"]	= "When Shift is not pressed";
		["ModTTShow_shift"]	= "When Shift is pressed";

}
