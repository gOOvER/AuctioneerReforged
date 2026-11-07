--[[
	Enchantrix - Localization (zhCN)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.zhCN = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "清除全部附魔数据";
		["FrmtActClearFail"]	= "无法找到物品：%s";
		["FrmtActClearOk"]	= "清除物品数据：%s";
		["FrmtActDefault"]	= "附魔助手的%s选项已重置为默认值。";
		["FrmtActDefaultAll"]	= "所有附魔助手选项已重置为默认值。";
		["FrmtActDisable"]	= "不显示物品的%s数据";
		["FrmtActEnable"]	= "显示物品的%s数据";
		["FrmtActSet"]	= "设置 %s 为 '%s'";
		["FrmtActUnknown"]	= "未知命令关键字：'%s'";
		["FrmtActUnknownLocale"]	= "找不到您选择的语言('%s')。可用的语言有：";
		["FrmtPrintin"]	= "附魔助手信息现在将显示在\"%s\"对话框";
		["FrmtUsage"]	= "用途：";
		["MesgDisable"]	= "禁用附魔助手的自动载入功能";
		["MesgNotloaded"]	= "附魔助手没有加载。键入/enchantrix 取得更多信息";

		-- Section: Command Options
		["CmdClearAll"]	= "all全部";
		["OptClear"]	= "([物品]|all全部)";
		["OptDefault"]	= "(<选项>|all全部)";
		["OptFindBidauct"]	= "<银币>";
		["OptFindBuyauct"]	= "<比率>";
		["OptLocale"]	= "<地域代码>";
		["OptPrintin"]	= "(<窗口标签>[数字]|<窗口名称>[字符串])";

		-- Section: Commands
		["CmdClear"]	= "clear清除";
		["CmdDefault"]	= "default默认";
		["CmdDisable"]	= "disable禁用";
		["CmdFindBidauct"]	= "bidbroker出价代理";
		["CmdFindBidauctShort"]	= "bb(出价代理的缩写)";
		["CmdFindBuyauct"]	= "percentless比率差额";
		["CmdFindBuyauctShort"]	= "pl(比率差额的缩写)";
		["CmdHelp"]	= "help帮助";
		["CmdLocale"]	= "locale地域代码";
		["CmdOff"]	= "off关";
		["CmdOn"]	= "on开";
		["CmdPrintin"]	= "print-in输出于";
		["CmdToggle"]	= "toggle开关转换";
		["ConfigUI"]	= "config设置";
		["ShowDELevels"]	= "levels等级";
		["ShowDEMaterials"]	= "materials材料";
		["ShowEmbed"]	= "embed嵌入";
		["ShowGuessAuctioneerHsp"]	= "valuate-hsp估价-最高";
		["ShowGuessAuctioneerMed"]	= "valuate-median估价-中值";
		["ShowGuessAuctioneerVal"]	= "valuate-val";
		["ShowGuessBaseline"]	= "valuate-baseline估价-基准";
		["ShowTerse"]	= "terse简洁";
		["ShowUI"]	= "show显示";
		["ShowValue"]	= "valuate估价";
		["StatOff"]	= "不显示任何附魔数据";
		["StatOn"]	= "显示设置好的附魔数据";

		-- Section: Config Text
		["GuiLoad"]	= "加载附魔助手";
		["GuiLoad_Always"]	= "always";
		["GuiLoad_Never"]	= "never";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "研磨";
		["ArgSpellname"]	= "分解";
		["ArgSpellProspectingName"]	= "选矿";
		["Enchanting"]	= "附魔";
		["Inscription"]	= "铭文";
		["Jewelcrafting"]	= "珠宝加工";
		["PatReagents"]	= "材料：(.+)";
		["TextCombat"]	= "战斗记录";
		["TextGeneral"]	= "综合";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(去";
		["FrmtWelcome"]	= "附魔助手(Enchantrix) v%s 已加载！";
		["MesgAuctVersion"]	= "Enchantrix 需要Auctioneer v4.0 或更新的版本。部份功能在您未更新您的Auctioneer前无法使用。";

		-- Section: Help Text
		["GuiAltChatlink"]	= "使用Alt左键点击聊天链接打开工具提示";
		["GuiClearall"]	= "清除全部附魔助手数据。";
		["GuiClearallButton"]	= "全部清除";
		["GuiClearallHelp"]	= "点此清除对于当前服务器-阵营的全部附魔助手数据。";
		["GuiClearallNote"]	= "对于当前服务器-阵营";
		["GuiDefaultAll"]	= "重置所有Enchantrix选项";
		["GuiDefaultAllButton"]	= "全部重置";
		["GuiDefaultAllHelp"]	= "点此重置全部附魔助手选项为默认值。\n警告：此操作无法还原。";
		["GuiDefaultOption"]	= "重置该设置";
		["GuiDELevels"]	= "在提示中显示分解需要的等级";
		["GuiDEMaterials"]	= "在提示中显示分解材料信息";
		["GuiEmbed"]	= "信息显示在游戏默认提示中";
		["GuiLocale"]	= "设定语言为";
		["GuiMainEnable"]	= "启用附魔助手";
		["GuiMainHelp"]	= "包含插件 - 附魔助手的设置。它用于显示物品分解产物信息。";
		["GuiOtherHeader"]	= "其他选项";
		["GuiOtherHelp"]	= "附魔助手 杂项设定";
		["GuiPrintin"]	= "选择期望的信息框架";
		["GuiPrintYieldsInChat"]	= "在聊天视窗显示物品产出的结果";
		["GuiShowCraftReagents"]	= "在提示资讯中显示制作物品所需材料";
		["GuiTerse"]	= "开启简洁模式";
		["GuiValuateAverages"]	= "以拍卖助手平均价进行估价";
		["GuiValuateBaseline"]	= "以内置数据估价";
		["GuiValuateEnable"]	= "启用估价";
		["GuiValuateHeader"]	= "估价";
		["GuiValuateMedian"]	= "以拍卖助手中位数进行估价。";
		["HelpAltChatlink"]	= "允许在聊天时用Alt+左键点击一个链接打开提示。";
		["HelpClear"]	= "清除指定物品的数据(必须Shift+点击将物品插入命令)。你也可以指定特定关键字\"all\"。";
		["HelpDefault"]	= "设置某个附魔助手选项为默认值。你也可以输入特定关键字\"all\" 来设置所有附魔助手选项为默认值。";
		["HelpDisable"]	= "阻止附魔助手下一次登录时自动加载。";
		["HelpEmbed"]	= "嵌入文字到原游戏提示资讯中(提示：部分功能在该模式下无法使用)";
		["HelpFindBidauct"]	= "找到分解价值可能低于竞标价一定银币额的拍卖品";
		["HelpFindBuyauct"]	= "找到分解价值可能低于直接购买价一定比率的拍卖品";
		["HelpGuessAuctioneer5Val"]	= "开启估价功能并且有安装拍卖助手，就显示物品分解的市场价值";
		["HelpGuessAuctioneerHsp"]	= "如果启用估价，并且安装了拍卖行助手(Auctioneer)，显示对于物品分解的曾售价格(最高价)。";
		["HelpGuessAuctioneerMedian"]	= "如果启用估价，并且安装了拍卖助手(Auctioneer)，显示基于物品分解估价的中位数。";
		["HelpGuessBaseline"]	= "如果启用估价，显示对于物品分解的基准估价，基于系统内置价格(不需要拍卖助手Auctioneer)。";
		["HelpGuessNoauctioneer"]	= "价格评估上限与价格评估中位数命令不能使用是因为没有安装拍卖助手。";
		["HelpLoad"]	= "改变附魔助手的加载设置。";
		["HelpLocale"]	= "改变用来显示Enchantrix讯息的语言";
		["HelpOnoff"]	= "开/关附魔数据显示";
		["HelpPrintin"]	= "选择附魔助手使用哪个窗口来显示输出讯息。你可以指定窗口名称或索引。";
		["HelpShowDELevels"]	= "在提示资讯中选择是否显示分解物品需要的附魔技能";
		["HelpShowDEMaterials"]	= "在提示资讯咨询中选择否是显示分解物品产生的材料资讯";
		["HelpShowUI"]	= "显示或隐藏设置面板";
		["HelpTerse"]	= "开启/关闭简略模式，只显示分解价值。按住Ctrl键将无视此设定。";
		["HelpValue"]	= "选择是否显示物品基于可能分解几率的预计价值。";
		["ModTTShow_Help"]	= "启用本选项将会使附魔助手的额外提示窗只在ALT按下时才显示。";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "你没有安装拍卖助手。拍卖助手必须安装并执行一次扫描。";
		["AuctionScanVersionTooOld"]	= "你没有正确安装拍卖助手。此特性需要拍卖助手4.0以上。";
		["ChatDeletedProfile"]	= "删除配置：";
		["ChatDuplicatedProfile"]	= "复制配置到：";
		["ChatResetProfile"]	= "重置所有设置：";
		["ChatSavedProfile"]	= "保存配置：";
		["ChatUsingProfile"]	= "现在使用配置：";
		["FrmtAutoDeActive"]	= "自动分解-激活";
		["FrmtAutoDeDisabled"]	= "自动分解-关闭";
		["FrmtAutoDeDisenchantCancelled"]	= "分解已取消：物品没找到";
		["FrmtAutoDeDisenchanting"]	= "分解 %s";
		["FrmtAutoDeIgnorePermanent"]	= "忽视 %s 永久";
		["FrmtAutoDeIgnoreSession"]	= "忽视 %s 本次连接";
		["FrmtAutoDeInactive"]	= "自动分解-无效";
		["FrmtAutoDeMilling"]	= "%s 研磨中";
		["FrmtAutoDeMillingCancelled"]	= "研磨已取消：找不到物品";
		["FrmtAutoDeProspectCancelled"]	= "预估已取消:物品未发现";
		["FrmtAutoDeProspecting"]	= "预估%s";
		["FrmtBidbrokerCurbid"]	= "目前的拍卖价";
		["FrmtBidbrokerDone"]	= "交易价代理完成";
		["FrmtBidbrokerHeader"]	= "比平均分解价值节省%s出价(最少%%差额= %d)：";
		["FrmtBidbrokerLine"]	= "%s，估价：%s，%s：%s，节省：%s，差额%s，次数：%s";
		["FrmtBidbrokerMinbid"]	= "最低拍卖价";
		["FrmtBidBrokerSkipped"]	= "所需利润率不足(%d%%),跳过%d拍卖";
		["FrmtBidBrokerSkippedBids"]	= "所需出价不足,跳过%d拍卖";
		["FrmtPctlessDone"]	= "比率差额完成。";
		["FrmtPctlessHeader"]	= "节省超过平均物品分解价值%d%%一口价(最少节省 = %s):";
		["FrmtPctlessLine"]	= "%s，估价：%s，一口价：%s，节省：%s，差额%s";
		["FrmtPctlessSkillSkipped"]	= "所需技能等级不够(%s),跳过%d拍卖";
		["FrmtPctlessSkipped"]	= "所需收益率不足(%s),跳过%d拍卖";

		-- Section: Tooltip Messages
		["Click"]	= "单击";
		["EnxMMTip"]	= "附魔助手(Enchantrix)显示物品分解，选矿，研磨后得到的产物。";
		["FrmtBarkerPrice"]	= "Barker价格(%d%% 最低利润)";
		["FrmtDEItemLevels"]	= "可自物品等级 %d 到 %d 中的物品分解后获得。";
		["FrmtDisinto"]	= "可分解为:";
		["FrmtFound"]	= "发现%s可分解为：";
		["FrmtFoundNotDisenchant"]	= "发现%s不可分解";
		["FrmtInkFrom"]	= "从 %s 制成";
		["FrmtMillingFound"]	= "%s 可研磨成：";
		["FrmtMillingValueAuctHsp"]	= "研磨价值(HSP)";
		["FrmtMillingValueAuctMed"]	= "研磨价值(中位数)";
		["FrmtMillingValueAuctVal"]	= "研磨价值(AucAdv)";
		["FrmtMillingValueMarket"]	= "研磨价值(基准)";
		["FrmtMillsInto"]	= "研磨为:";
		["FrmtPriceEach"]	= "(每件%s)";
		["FrmtProspectFound"]	= "发现%s可选矿为:";
		["FrmtProspectFrom"]	= "可自 %s 探勘后取得。";
		["FrmtProspectInto"]	= "选矿为:";
		["FrmtProspectValueAuctHsp"]	= "选矿价值(HSP)";
		["FrmtProspectValueAuctMed"]	= "选矿价值(中位数)";
		["FrmtProspectValueAuctVal"]	= "选矿价值(AucAdv)";
		["FrmtProspectValueMarket"]	= "选矿价值(基准)";
		["FrmtSuggestedPrice"]	= "建议价格：";
		["FrmtTotal"]	= "合计";
		["FrmtValueAuctHsp"]	= "分解价值(最高)";
		["FrmtValueAuctMed"]	= "分解价值(中位数)";
		["FrmtValueAuctVal"]	= "分解价值(AucAdv)";
		["FrmtValueFixedVal"]	= "分解价值(Fixed)";
		["FrmtValueMarket"]	= "分解价值(基准)";
		["FrmtWarnAuctNotLoaded"]	= "[拍卖助手未加载，使用缓存中的价格]";
		["FrmtWarnNoPrices"]	= "[无价格信息]";
		["FrmtWarnPriceUnavail"]	= "[某些价格信息不可用]";
		["RightClick"]	= "右击";
		["ShiftClick"]	= "Shift+单击";
		["TipOpenConfig"]	= "编辑配置文件";
		["TipOpenEnchant"]	= "打开附魔窗口";
		["TipOpenJewel"]	= "打开珠宝制作窗口";
		["TooltipMillingLevel"]	= "研磨必要技能%d";
		["TooltipProspectLevel"]	= "选矿必要技能%d";
		["TooltipShowDisenchantLevel"]	= "分解必要技能%d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "必须安装 BeanCounter 才能决定收益因子。 关闭 AutoDE 限制直到安装了 BeanCounter。";
		["ExportPriceAucAdv"]	= "将Enchantrix的价格信息导出到AuctioneerAdvanced";
		["GuiActivateProfile"]	= "激活当前配置";
		["GuiAutoDeBoughtForDE"]	= "只为了分解而购买的物品";
		["GuiAutoDeEnable"]	= "监视背包的可分解物品-小心使用";
		["GuiAutoDeEpicItems"]	= "自动分解史诗(紫)物品";
		["GuiAutoDeOptions"]	= "自动";
		["GuiAutoDePromptLine1"]	= "确认要分解：";
		["GuiAutoDePromptLine3"]	= "贵重的%s";
		["GuiAutoDEPurchaseReason"]	= "%s 已购入";
		["GuiAutoDeRareItems"]	= "自动分解稀有(蓝)物品";
		["GuiAutoDESuggestion"]	= "建议：%s 此物品";
		["GuiAutoLootDE"]	= "自动拾取,手动分解,选矿，研磨物品.";
		["GuiAutoMillingPromptLine1"]	= "您正要研磨：";
		["GuiAutoProspectPromptLine1"]	= "确认要选矿:";
		["GuiBBUnbiddedOnly"]	= "仅代理无人出价的物品";
		["GuiConfigProfiles"]	= "设置或编辑配置";
		["GuiCreateReplaceProfile"]	= "创建或替换配置";
		["GuiDefaultBBProfitPercent"]	= "默认代理收益率：%d";
		["GuiDefaultLessHSP"]	= "默认最高售价差额率:%d";
		["GuiDefaultProfitMargin"]	= "默认利润率：";
		["GuiDeleteProfileButton"]	= "删除";
		["GuiDuplicateProfileButton"]	= "复制配置";
		["GuiFixedSettings"]	= "修复药剂价格";
		["GuiFixedSettingsNote"]	= "注意:如果选中复选框,如下价格将用来替代Auctioneer或其他估价方法.\n下列价格仍然会被之前的反应物比重所影响,所以如果你想确保反应物被精确标价,确保在比重区将比重设为100%.";
		["GuiGeneralOptions"]	= "常规附魔助手选项";
		["GuiIgnore"]	= "忽略";
		["GuiItemValueAuc4HSP"]	= "Auc最高售价";
		["GuiItemValueAuc4Median"]	= "Auc中位数";
		["GuiItemValueAuc5Appraiser"]	= "AucAdv评估价";
		["GuiItemValueAuc5Market"]	= "AucAdv市场价";
		["GuiItemValueAverage"]	= "均价(默认)";
		["GuiItemValueBaseline"]	= "市场基准";
		["GuiItemValueCalc"]	= "计算物品价格";
		["GuiMaxBuyout"]	= "最大一口价：";
		["GuiMillingingValues"]	= "显示预估研磨价格";
		["GuiMillingLevels"]	= "于提示中显示研磨技能需求";
		["GuiMillingMaterials"]	= "于提示中显示研磨所需材料信息";
		["GuiMillingOptions"]	= "研磨选项";
		["GuiMinBBProfitPercent"]	= "最低代理收益率：%d";
		["GuiMinimapButtonAngle"]	= "按钮位置：%d";
		["GuiMinimapButtonDist"]	= "间隔:%d";
		["GuiMinimapOptions"]	= "小地图显示选项";
		["GuiMinimapShowButton"]	= "显示小地图按钮";
		["GuiMinLessHSP"]	= "最低最高售价差额率:%d";
		["GuiMinProfitMargin"]	= "最低利润率：";
		["GuiNewProfileName"]	= "新配置文件名：";
		["GuiNo"]	= "否";
		["GuiPLBBOnlyBelowDESkill"]	= "仅显示当前技能可分解物品";
		["GuiPLBBSettings"]	= "差额率与代理设置";
		["GuiProspectingLevels"]	= "于提示中显示选矿技能需求";
		["GuiProspectingMaterials"]	= "于提示中显示选矿材料信息";
		["GuiProspectingOptions"]	= "选矿选项";
		["GuiProspectingValues"]	= "显示预估选矿价值";
		["GuiResetProfileButton"]	= "重置";
		["GuiSaveProfileButton"]	= "保存";
		["GuiShowMatSources"]	= "显示自分解、探勘及研磨物品时取得的各原始物料信息。";
		["GuiShowMilling"]	= "显示草药的研磨信息";
		["GuiShowProspecting"]	= "显示矿石的选矿信息";
		["GuiTabAuctions"]	= "拍卖";
		["GuiTabFixed"]	= "自定义价格";
		["GuiTabGeneral"]	= "常规";
		["GuiTabMilling"]	= "研磨";
		["GuiTabProfiles"]	= "配置文件";
		["GuiTabProspecting"]	= "选矿";
		["GuiTabWeights"]	= "比重";
		["GuiValueOptions"]	= "价值显示选项";
		["GuiValueShowAuc4HSP"]	= "显示拍卖助手最高可售价格";
		["GuiValueShowAuc4Median"]	= "显示拍卖助手中位数";
		["GuiValueShowAuc5Market"]	= "显示拍卖助手市场价";
		["GuiValueShowBaseline"]	= "显示内置基准值";
		["GuiValueShowDEValues"]	= "显示估计分解价";
		["GuiValueTerse"]	= "简洁显示分解价";
		["GuiWeighSettingsNote"]	= "上述比重值根据特定的数量改变该原材料数量。 您通常将想要留下他们在100%，除非您认为他们比您使用应该或多或少是贵重物品的估价方法认为。";
		["GuiWeightSettings"]	= "分解材料需求度";
		["GuiYes"]	= "是";
		["ModTTShow"]	= "显示提示信息:";
		["ModTTShow_alt"]	= "当Alt被按下";
		["ModTTShow_always"]	= "总是";
		["ModTTShow_ctrl"]	= "当Ctrl被按下";
		["ModTTShow_never"]	= "从不";
		["ModTTShow_noalt"]	= "当Alt没被按下";
		["ModTTShow_noctrl"]	= "当Ctrl没被按下";
		["ModTTShow_noshift"]	= "当Shift没被按下";
		["ModTTShow_shift"]	= "当Shift被按下";

}
