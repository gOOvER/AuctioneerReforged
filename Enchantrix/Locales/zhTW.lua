--[[
	Enchantrix - Localization (zhTW)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.zhTW = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "清除所有附數據";
		["FrmtActClearFail"]	= "無法找到物品：%s";
		["FrmtActClearOk"]	= "清除物品數據：%s";
		["FrmtActDefault"]	= "附魔助手的%s選項已重設為預設值";
		["FrmtActDefaultAll"]	= "所有附魔助手的%s選項已重設為預設值";
		["FrmtActDisable"]	= "不顯示物品的 %s 數據";
		["FrmtActEnable"]	= "顯示物品的 %s 數據";
		["FrmtActSet"]	= "設定 %s 為 '%s'";
		["FrmtActUnknown"]	= "未知的命令關鍵字：'%s'";
		["FrmtActUnknownLocale"]	= "找不到您選擇的語言('%s')。可用的語言有：";
		["FrmtPrintin"]	= "附魔助手的訊息將會顯示在\"%s\"聊天框";
		["FrmtUsage"]	= "用途：";
		["MesgDisable"]	= "關閉附魔助手的自動載入功能";
		["MesgNotloaded"]	= "附魔助手尚未載入，輸入/enchantrix 取得更多資訊.";

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
		["CmdHelp"]	= "幫助";
		["CmdLocale"]	= "locale";
		["CmdOff"]	= "off";
		["CmdOn"]	= "on";
		["CmdPrintin"]	= "print-in";
		["CmdToggle"]	= "toggle";
		["ConfigUI"]	= "設置";
		["ShowDELevels"]	= "等級";
		["ShowDEMaterials"]	= "材料";
		["ShowEmbed"]	= "embed";
		["ShowGuessAuctioneerHsp"]	= "valuate-hsp";
		["ShowGuessAuctioneerMed"]	= "valuate-median";
		["ShowGuessAuctioneerVal"]	= "valuate-val";
		["ShowGuessBaseline"]	= "valuate-baseline";
		["ShowTerse"]	= "簡潔的";
		["ShowUI"]	= "顯示";
		["ShowValue"]	= "valuate";
		["StatOff"]	= "不顯示任何附魔數據";
		["StatOn"]	= "顯示已設置好的附魔資料中";

		-- Section: Config Text
		["GuiLoad"]	= "載入附魔助手";
		["GuiLoad_Always"]	= "總是";
		["GuiLoad_Never"]	= "從不";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "研磨";
		["ArgSpellname"]	= "分解";
		["ArgSpellProspectingName"]	= "勘探";
		["Enchanting"]	= "附魔";
		["Inscription"]	= "銘文學";
		["Jewelcrafting"]	= "珠寶設計";
		["PatReagents"]	= "材料: (.+)";
		["TextCombat"]	= "戰鬥記錄";
		["TextGeneral"]	= "綜合";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(請至  以分享您的數據)";
		["FrmtWelcome"]	= "附魔助手 v%s 已載入";
		["MesgAuctVersion"]	= "附魔助手 需要 拍賣助手 v4.0 或更新的版本。部份功能在您未更新您的Auctioneer前無法使用。";

		-- Section: Help Text
		["GuiAltChatlink"]	= "使用 ALT+滑鼠左鍵 自聊天連結開啟提示窗";
		["GuiClearall"]	= "清除所有附魔數據";
		["GuiClearallButton"]	= "清除全部";
		["GuiClearallHelp"]	= "點擊此處，清除目前伺服器之所有附魔數據";
		["GuiClearallNote"]	= "目前的伺服器";
		["GuiDefaultAll"]	= "重置所有附魔助手選項";
		["GuiDefaultAllButton"]	= "重設所有設定";
		["GuiDefaultAllHelp"]	= "點擊這裡以重設所有附魔助手的選項回預設值。警告：這個操作是無法還原的。";
		["GuiDefaultOption"]	= "重設這個設定";
		["GuiDELevels"]	= "在提示資訊中顯示分解需要的等級";
		["GuiDEMaterials"]	= "在提示資訊中顯示分解材料數據";
		["GuiEmbed"]	= "將信息嵌入遊戲提示資訊中";
		["GuiLocale"]	= "設定語言為";
		["GuiMainEnable"]	= "啟動 附魔助手";
		["GuiMainHelp"]	= "包含插件 - 附魔助手的設置。它用於顯示物品分解產物信息";
		["GuiOtherHeader"]	= "其他選項";
		["GuiOtherHelp"]	= "附魔助手 雜項設定";
		["GuiPrintin"]	= "選擇期望的信息框架";
		["GuiPrintYieldsInChat"]	= "在聊天視窗顯示物品產出的結果";
		["GuiShowCraftReagents"]	= "在提示資訊中顯示製作物品所需材料";
		["GuiTerse"]	= "啟用精簡模式";
		["GuiValuateAverages"]	= "以拍賣助手平均價進行估價";
		["GuiValuateBaseline"]	= "以內置資料估價";
		["GuiValuateEnable"]	= "啟用估價";
		["GuiValuateHeader"]	= "估價";
		["GuiValuateMedian"]	= "以拍賣助手中位數進行估價";
		["HelpAltChatlink"]	= "啟用對聊天視窗中的物品連結按下 ALT 與 滑鼠左鍵 來顯示一個提示窗的功能";
		["HelpClear"]	= "清除指定物品的資料(必須 Shift+點擊 將物品插入到此命令)。你也可以指定特定關鍵字 \"all\" 。";
		["HelpDefault"]	= "設置某個附魔助手選項為預設值。你也可以輸入特定關鍵字 \"all\" 來重置所有附魔助手的選項到其預設值。";
		["HelpDisable"]	= "停止附魔助手並在下一次登錄遊戲時自動載入。";
		["HelpEmbed"]	= "嵌入文字到原遊戲提示資訊中(提示：部分功能在該模式下無法使用)";
		["HelpFindBidauct"]	= "找到分解價值可能低於競拍價一定銀幣額的拍賣品。";
		["HelpFindBuyauct"]	= "找到分解價值可能低於直接購買價一定比率的拍賣品";
		["HelpGuessAuctioneer5Val"]	= "開啟估價功能並且有安裝拍賣助手，就顯示物品分解的市場價。";
		["HelpGuessAuctioneerHsp"]	= "如果啟用估價功能，並且安裝了拍賣助手(Auctioneer)，顯示對於物品分解的可售價格(最高價)。";
		["HelpGuessAuctioneerMedian"]	= "如果啟用估價功能，並且安裝了拍賣助手(Auctioneer)，顯示基於物品分解估價的中位數。";
		["HelpGuessBaseline"]	= "如果啟用估價功能，顯示對於物品分解的基準估價，基於系統內置價格(不需要拍賣助手Auctioneer)。";
		["HelpGuessNoauctioneer"]	= "價格評估上限與價格評估中位數命令不能使用是由於沒有安裝拍賣助手 Auctioneer。";
		["HelpLoad"]	= "改變附魔助手的載入設置。";
		["HelpLocale"]	= "改變用來顯示Enchantrix訊息的語言";
		["HelpOnoff"]	= "開/關附魔數據顯示";
		["HelpPrintin"]	= "選擇Enchantrix訊息顯示的框架。你可以輸入框架名字或者是框架索引值。";
		["HelpShowDELevels"]	= "在提示資訊中選擇是否顯示分解物品需要的附魔技能";
		["HelpShowDEMaterials"]	= "在提示中選擇否是顯示分解物品產生材料資訊。";
		["HelpShowUI"]	= "顯示或隱藏設置面板";
		["HelpTerse"]	= "開啟/關閉 簡略模式，只顯示分解價值。按住Ctrl鍵將無視此設定。";
		["HelpValue"]	= "選擇是否顯示物品基於可能分解機率的預估價值。";
		["ModTTShow_Help"]	= "決定你要的提示窗運作模式。\n總是： 每次都顯示附魔助手的提示窗。\n當Modifier key被按下：只在此按鍵被按下時才會顯示附魔助手提示窗。\n當Modifier key沒被按下：只在此按鍵沒被按下時才會顯示附魔助手提示窗。\n從不：永遠不顯示附魔助手的提示窗。\n啟用本選項將會使附魔助手的額外提示窗只在ALT按下時才顯示。";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "你沒有安裝拍賣助手(Auctioneer)。拍賣助手必須安裝並執行一次掃描。";
		["AuctionScanVersionTooOld"]	= "你沒有正確安裝拍賣助手(Auctioneer)。此功能需要拍賣助手4.0(Auctioneer v4.0)版以上。";
		["ChatDeletedProfile"]	= "刪除使用者設定檔：";
		["ChatDuplicatedProfile"]	= "複製使用者設定檔到：";
		["ChatResetProfile"]	= "重置所有設定值：";
		["ChatSavedProfile"]	= "儲存使用者設定檔：";
		["ChatUsingProfile"]	= "正在使用者設定檔：";
		["FrmtAutoDeActive"]	= "啟用自動分解(AutoDisenchant)功能";
		["FrmtAutoDeDisabled"]	= "停用自動分解(AutoDisenchant)功能";
		["FrmtAutoDeDisenchantCancelled"]	= "分解動作已取消：找不到物品";
		["FrmtAutoDeDisenchanting"]	= "%s 分解中";
		["FrmtAutoDeIgnorePermanent"]	= "永久忽略 %s";
		["FrmtAutoDeIgnoreSession"]	= "這一次忽略 %s";
		["FrmtAutoDeInactive"]	= "暫停自動分解(AutoDisenchant)功能";
		["FrmtAutoDeMilling"]	= "%s 研磨中";
		["FrmtAutoDeMillingCancelled"]	= "研磨動作已取消：找不到物品";
		["FrmtAutoDeProspectCancelled"]	= "探勘動作已取消：找不到物品";
		["FrmtAutoDeProspecting"]	= "%s 探勘中";
		["FrmtBidbrokerCurbid"]	= "目前的拍賣價";
		["FrmtBidbrokerDone"]	= "交易價代理完成";
		["FrmtBidbrokerHeader"]	= "%s 個拍賣物的價值比預估平均分解價值 (min %%less = %d)還低的拍賣：";
		["FrmtBidbrokerLine"]	= "%s，估價：%s，%s：%s，節省：%s，差額 %s，次數：%s";
		["FrmtBidbrokerMinbid"]	= "最低拍賣價";
		["FrmtBidBrokerSkipped"]	= "所需利潤率不足(%d%%)，跳過%d個拍賣物";
		["FrmtBidBrokerSkippedBids"]	= "所需出價不足，跳過%d個拍賣物";
		["FrmtPctlessDone"]	= "比率差額完成";
		["FrmtPctlessHeader"]	= "%s 個拍賣物的直接購買價格比預估平均分解價值 (min %%less = %d) 還低的拍賣：";
		["FrmtPctlessLine"]	= "%s，估價：%s，直接購買價：%s，節省：%s，差額 %s";
		["FrmtPctlessSkillSkipped"]	= "所需技能等級不夠(%s)，跳過%d個拍賣物";
		["FrmtPctlessSkipped"]	= "所需收益率不足(%s),跳過%d個拍賣物";

		-- Section: Tooltip Messages
		["Click"]	= "左鍵點擊";
		["EnxMMTip"]	= "Enchantrix 將會顯示一個物品是否可分解、探勘和研磨後的資訊。這也會提供將這些資訊整合到拍賣助手中以做為進行拍賣物販售或購買時的依據。";
		["FrmtBarkerPrice"]	= "Barker 價格 (%d%% 保證金)";
		["FrmtDEItemLevels"]	= "可自物品等級 %d 到 %d 中的物品分解後獲得。";
		["FrmtDisinto"]	= "分解成：";
		["FrmtFound"]	= "%s 可分解成：";
		["FrmtFoundNotDisenchant"]	= "%s 不可分解";
		["FrmtInkFrom"]	= "從 %s 製成";
		["FrmtMillingFound"]	= "%s 可研磨成：";
		["FrmtMillingValueAuctHsp"]	= "研磨價值(HSP)";
		["FrmtMillingValueAuctMed"]	= "研磨價值(Median)";
		["FrmtMillingValueAuctVal"]	= "研磨價值(AucAdv)";
		["FrmtMillingValueMarket"]	= "研磨價值(Baseline)";
		["FrmtMillsInto"]	= "研磨出:";
		["FrmtPriceEach"]	= "(%s 每個)";
		["FrmtProspectFound"]	= "%s 已勘探出:";
		["FrmtProspectFrom"]	= "可自 %s 探勘後取得。";
		["FrmtProspectInto"]	= "勘探出:";
		["FrmtProspectValueAuctHsp"]	= "勘探價值(HSP)";
		["FrmtProspectValueAuctMed"]	= "勘探價值(Median)";
		["FrmtProspectValueAuctVal"]	= "勘探價值(AucAdv)";
		["FrmtProspectValueMarket"]	= "勘探價值(Baseline)";
		["FrmtSuggestedPrice"]	= "建議價格：";
		["FrmtTotal"]	= "總共";
		["FrmtValueAuctHsp"]	= "分解價值(HSP)";
		["FrmtValueAuctMed"]	= "分解價值(Median)";
		["FrmtValueAuctVal"]	= "分解價值(AucAdv)";
		["FrmtValueFixedVal"]	= "分解價格(固定)";
		["FrmtValueMarket"]	= "分解價值(Baseline)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer未載入，使用快取區的價格資料]";
		["FrmtWarnNoPrices"]	= "[無有效價格]";
		["FrmtWarnPriceUnavail"]	= "[部分價格無效]";
		["RightClick"]	= "右鍵點擊";
		["ShiftClick"]	= "Shift+左鍵點擊";
		["TipOpenConfig"]	= "編輯配置。";
		["TipOpenEnchant"]	= "打開附魔視窗。";
		["TipOpenJewel"]	= "打開珠寶設計視窗。";
		["TooltipMillingLevel"]	= "研磨需要技能 %d";
		["TooltipProspectLevel"]	= "勘探需要技能 %d";
		["TooltipShowDisenchantLevel"]	= "分解需要技能 %d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "必須安裝 BeanCounter 才能決定收益因子。 關閉 AutoDE 限制直到安裝了 BeanCounter。";
		["ExportPriceAucAdv"]	= "匯出 Enchantrix 價格資訊到 Auctioneer Advanced";
		["GuiActivateProfile"]	= "啟用目前記錄檔";
		["GuiAutoDeBoughtForDE"]	= "只分解購買的物品";
		["GuiAutoDeEnable"]	= "監看背包中可分解的物品 - 小心使用";
		["GuiAutoDeEpicItems"]	= "自動分解史詩(紫)物品";
		["GuiAutoDeOptions"]	= "自動化";
		["GuiAutoDePromptLine1"]	= "您正要分解:";
		["GuiAutoDePromptLine3"]	= "%s 的價格";
		["GuiAutoDEPurchaseReason"]	= "%s 已購入";
		["GuiAutoDeRareItems"]	= "自動分解稀有(藍)物品";
		["GuiAutoDESuggestion"]	= "建議：%s 此物品";
		["GuiAutoLootDE"]	= "手動自動搶劫幻想，展望，或碾磨項目。";
		["GuiAutoMillingPromptLine1"]	= "您正要研磨：";
		["GuiAutoProspectPromptLine1"]	= "你正要勘探:";
		["GuiBBUnbiddedOnly"]	= "僅代理無人出價的物品";
		["GuiConfigProfiles"]	= "設定或編輯記錄檔";
		["GuiCreateReplaceProfile"]	= "新建或替換記錄檔";
		["GuiDefaultBBProfitPercent"]	= "預設代理收益率：%d";
		["GuiDefaultLessHSP"]	= "預設最高售價差額率:%d";
		["GuiDefaultProfitMargin"]	= "預設利潤率：";
		["GuiDeleteProfileButton"]	= "刪除";
		["GuiDuplicateProfileButton"]	= "複製設定檔";
		["GuiFixedSettings"]	= "固定材料價格";
		["GuiFixedSettingsNote"]	= "注意:如果選中核取方塊,以下價格將用來替代Auctioneer或其他估價方法.\n下列價格仍然會被之前設定的附魔材料比重值所影響,所以如果你想確保附魔材料被精確標價,確保在比重值設定區將比重值設為100%.";
		["GuiGeneralOptions"]	= "一般附魔助手選項";
		["GuiIgnore"]	= "忽略";
		["GuiItemValueAuc4HSP"]	= "Auc最高售價";
		["GuiItemValueAuc4Median"]	= "Auc中位數";
		["GuiItemValueAuc5Appraiser"]	= "AucAdv 估價助手價值";
		["GuiItemValueAuc5Market"]	= "AucAdv 市場價";
		["GuiItemValueAverage"]	= "均價(預設)";
		["GuiItemValueBaseline"]	= "市場基準";
		["GuiItemValueCalc"]	= "計算物品價格";
		["GuiMaxBuyout"]	= "最大直購價：";
		["GuiMillingingValues"]	= "顯示估計的研磨價值";
		["GuiMillingLevels"]	= "在提示訊息中顯示研磨等級需求";
		["GuiMillingMaterials"]	= "在提示訊息中顯示研磨結果資訊";
		["GuiMillingOptions"]	= "研磨選項";
		["GuiMinBBProfitPercent"]	= "最低代理收益率：%d";
		["GuiMinimapButtonAngle"]	= "按鈕位置：%d";
		["GuiMinimapButtonDist"]	= "間隔:%d";
		["GuiMinimapOptions"]	= "小地圖顯示選項";
		["GuiMinimapShowButton"]	= "顯示小地圖按鈕";
		["GuiMinLessHSP"]	= "最低最高售價差額率:%d";
		["GuiMinProfitMargin"]	= "最低利潤率：";
		["GuiNewProfileName"]	= "新使用者設定檔名稱：";
		["GuiNo"]	= "否";
		["GuiPLBBOnlyBelowDESkill"]	= "僅顯示目前技能等級可分解的物品";
		["GuiPLBBSettings"]	= "差額率與代理設定";
		["GuiProspectingLevels"]	= "在提示訊息中顯示勘探等級需求";
		["GuiProspectingMaterials"]	= "在提示訊息中顯示勘探結果資訊";
		["GuiProspectingOptions"]	= "勘探選項";
		["GuiProspectingValues"]	= "顯示估計的勘探價值";
		["GuiResetProfileButton"]	= "重置";
		["GuiSaveProfileButton"]	= "儲存";
		["GuiShowMatSources"]	= "顯示自分解、探勘及研磨物品時取得的各原始物料資訊。";
		["GuiShowMilling"]	= "顯示草藥研磨資料";
		["GuiShowProspecting"]	= "顯示礦物勘探資料";
		["GuiTabAuctions"]	= "拍賣";
		["GuiTabFixed"]	= "固定價值";
		["GuiTabGeneral"]	= "一般";
		["GuiTabMilling"]	= "研磨";
		["GuiTabProfiles"]	= "使用者設定檔";
		["GuiTabProspecting"]	= "勘探";
		["GuiTabWeights"]	= "比重";
		["GuiValueOptions"]	= "價值顯示選項";
		["GuiValueShowAuc4HSP"]	= "顯示拍賣助手最高可售價格";
		["GuiValueShowAuc4Median"]	= "顯示拍賣助手中位數";
		["GuiValueShowAuc5Market"]	= "顯示拍賣助手市場價";
		["GuiValueShowBaseline"]	= "顯示內置基準值";
		["GuiValueShowDEValues"]	= "顯示估計分解價";
		["GuiValueTerse"]	= "簡潔顯示分解價";
		["GuiWeighSettingsNote"]	= "此比重值設定將改變各附魔材料物的估計比重。通常您會想要保持在100%，除非您認為它們應該比您目前使用的估價價值來得更多或更少。";
		["GuiWeightSettings"]	= "分解材料需求度";
		["GuiYes"]	= "確定";
		["ModTTShow"]	= "只在按下ALT時顯示額外的提示窗。";
		["ModTTShow_alt"]	= "當Alt鍵被按下";
		["ModTTShow_always"]	= "總是";
		["ModTTShow_ctrl"]	= "當Ctrl被按下";
		["ModTTShow_never"]	= "從不";
		["ModTTShow_noalt"]	= "當Alt鍵沒有被按下";
		["ModTTShow_noctrl"]	= "當Ctrl沒有被按下";
		["ModTTShow_noshift"]	= "當Shift沒有被按下";
		["ModTTShow_shift"]	= "當Shift被按下";

}
