--[[
	BeanCounter - Localization (zhCN)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.zhCN = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "拍卖记录器(BeanCounter)设置";
		["C_BeanCounterDatabaseMaintenance"]	= "拍卖记录器数据库维护";
		["C_BeanCounterOptions"]	= "拍卖记录器选项";
		["C_ColorizeSearch"]	= "增加渐变色彩到搜索结果的每个窗口";
		["C_DatabaseLength"]	= "设定多长时间拍卖记录器将保存拍卖行交易数据";
		["C_DataMaintenance"]	= "数据维护";
		["C_DateString"]	= "使用的日期格式:";
		["C_DateStringExample"]	= "示例日期:";
		["C_ExtenalSearch"]	= "允许其他插件使用BeanCounter的搜索?";
		["C_MailInvoiceTimeout"]	= "邮件到达通知延迟=%d秒";
		["C_MailRecolor"]	= "邮件重新着色方式";
		["C_ModTTShow"]	= "仅当按下Alt时显示提示";
		["C_MonthsToKeep"]	= "数据保存几个月？";
		["C_OpacityLevel"]	= "不透明度";
		["C_Resortascendingtime"]	= "将所有数据按照增序排序";
		["C_ResortDatabase"]	= "重排序数据库";
		["C_ScanDatabase"]	= "搜索数据库错误:当你在搜索BeanCounter时出错使用.\n 使用前备份BeanCounter的配置文件.";
		["C_SearchConfiguration"]	= "搜索设置";
		["C_SendToSearch"]	= "是否要将BeanCounter搜索过的物品加入到拍卖行主窗口？";
		["C_ShowBeginnerTooltips"]	= "当鼠标经过时显示新手提示";
		["C_ShowReasonPurchase"]	= "于游戏提示中显示购买原因";
		["C_ValidateDatabase"]	= "验证数据库";

		-- Section: Generic Strings
		["NoRe-Color"]	= "无上色";
		["off"]	= "关闭";
		["Ok"]	= "确定";
		["on"]	= "开启";
		["Re-ColorIcons"]	= "为图标上色";
		["Re-ColorIconsandText"]	= "为图标和文字上色";
		["Re-ColorText"]	= "为文字上色";
		["TooltipFailed"]	= "无法获得提示信息";
		["UiNeutralCheckBox"]	= "显示中立拍卖行数据";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter将储存物品被购买的搜索界面原因并于提示中显示它.";
		["A_DateString"]	= "控制BeanCounter的GUI如何显示日期.命令以%作为前缀,并且可以混用多个命令与文字.例如%a==%X将显示Wed==21:34:21";
		["A_DateStringCommands"]	= "命令:\n %a = 缩写的日期名,\n %A = 日期名, \n %b = 缩写的月名, \n %B = 月名,\n %c = 日期和时间, \n %d = 日 (01-31),\n %H = 小时 (24), \n %I = 小时 (12),\n %M = 分, \n %m = 月,\n %p = 每";
		["A_ExtenalSearch"]	= "其他插件可以请求于BeanCounter的GUI内显示一件物品的搜索结果. 例如 此允许BeanCounter显示你在Appraiser查找的物品.";
		["A_MailInvoiceTimeout"]	= "BeanCounter将等待的服务器的通知请求的时间.通知是一个记载了谁,什么,多少钱的拍卖行邮件.";
		["A_MailRecolor"]	= "BeanCounter读取来自拍卖行的所有邮件,此选项告诉BeanCounter如何将未读邮件上色以便用户阅读.";
		["HelpGuiItemBox"]	= "拖入物品以开始搜索";
		["Q_BeanCountersTooltip"]	= "什么是BeanCounter提示";
		["Q_DateString"]	= "使用日期格式?";
		["Q_DateStringCommands"]	= "可接受日期命令?";
		["Q_ExtenalSearch"]	= "允许外部插件使用BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "什么是邮件通知延迟?";
		["Q_MailRecolor"]	= "什么是上色?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "搜索结果显示的最大数目（从每个数据库）";
		["TTDataExpireEnabled"]	= "比选定时间范围旧的数据将被删除";
		["TT_ColorizeSearch"]	= "这个选项改变BeanCounter搜索窗口物品队列的颜色.";
		["TT_MaxDisplayedResults"]	= "控制滚动面板上显示的结果数量.";
		["TT_neutralCheck"]	= "显示中立黑水拍卖行的结果";
		["TT_OpacityLevel"]	= "控制BeanCounter搜索窗口色彩条的不透明度(如果启用的话)";
		["TT_sendtosearch"]	= "当在BeanCounter中输入一个搜索条目时也将他显示在AH的浏览页面上.";

		-- Section: Interface
		["Cancelled"]	= "已取消";
		["UiAucCancelled"]	= "拍卖已取消";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "联盟拍卖行";
		["MailHordeAuctionHouse"]	= "部落拍卖行";
		["MailNeutralAuctionHouse"]	= "黑水拍卖行";
		["MailSenderAuctionHouse"]	= "拍卖行";

		-- Section: Tooltip Messages
		["TTDateString"]	= "键入你期望的日期显示格式.默认为%c";
		["TTDateStringExample"]	= "显示一个示例的日期";
		["TTExtenalSearch"]	= "当在其他插件中键入一个搜索,BeanCounter也将显示一个搜索结果";
		["TTMailInvoiceTimeout"]	= "选择BeanCounter将尝试从服务器获取一个邮件通知的频率.高==更快但较高几率丢失数据.低==更慢但可提高获取数据的几率(如果邮件服务器非常忙).";
		["TTMailRecolor"]	= "选择BeanCounter扫描邮箱后邮件的显示方式.";
		["TTModTTShow"]	= "Alt被按下时显示BeanCounter选项的提示。";
		["TTOpenconfig"]	= "打开BeanCounter配置窗口";
		["TTResort Database"]	= "这将把BeanCounter数据按照增序排序.可提高数据库压缩速度.";
		["TTShowBeginnerTooltips"]	= "开启鼠标经过时的新手提示";
		["TTShowReasonPurchase"]	= "开启物品购买原因";
		["TTValidateDatabase"]	= "这将搜索BeanCounter数据并且尝试纠正任何错误.当搜索遇到错误时使用.";
		["TT_AuctionCheck"]	= "显示在拍卖行已售出物品。";
		["TT_AuctionFailedCheck"]	= "显示你未能售出的物品。";
		["TT_BeanCounterAHTab"]	= "右击以外部窗口显示BeanCounter";
		["TT_BeanCounterSelectBox"]	= "根据服务器、角色、阵营过滤搜索结果。";
		["TT_BidCheck"]	= "显示在拍卖行拍到的物品。";
		["TT_BidFailedCheck"]	= "显示你出价最高的物品。";
		["TT_ClassicCheck"]	= "显示BeanCounter经典数据库返回的结果。";
		["TT_ExactCheck"]	= "精确匹配搜索框中的文本。";
		["TT_ItemIconBox"]	= "拖入一件物品并搜索该物品。可能\n显示 当前搜索物品图标。";
		["TT_ScrollHeader"]	= "\n右击拖动 改变尺寸 \nCTRL+右击 重置";
		["TT_SearchBox"]	= "在这里输入搜索条件或者留空则显示所有记录";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: 拍卖历史数据库";
		["UiAucExpired"]	= "拍卖过期";
		["UiAucSuccessful"]	= "拍卖成功";
		["UiAuctions"]	= "拍卖";
		["UiAuctionTransaction"]	= "拍卖";
		["UiBids"]	= "出价";
		["UiBidTransaction"]	= "竞标";
		["UiBuyerSellerHeader"]	= "买主/卖主";
		["UiBuyTransaction"]	= "购买";
		["UiClassicCheckBox"]	= "显示BC传统数据";
		["UiData"]	= "数据";
		["UiDateHeader"]	= "日期";
		["UiDepositTransaction"]	= "保管费";
		["UiDone"]	= "完成";
		["UiExactNameSearch"]	= "确切名称搜索";
		["UiFailedAuctions"]	= "已失败的拍卖";
		["UiFee"]	= "费用";
		["UiMailFrameRecording"]	= "BeanCounter正在记录你的邮箱";
		["UiMailFrameWait1"]	= "请不要关闭邮箱界面或者";
		["UiMailFrameWait2"]	= "拍卖物品将不会被记录";
		["UiNameHeader"]	= "物品";
		["UiNetHeader"]	= "净利";
		["UiNetPerHeader"]	= "单件净利";
		["UiOutbid"]	= "最高出价";
		["UiOutbids"]	= "最高出价";
		["UiPriceHeader"]	= "价格";
		["UiPriceper"]	= "价格/单件";
		["UiPricePerHeader"]	= "单件价格";
		["UiPurchases"]	= "购买";
		["UiQuantityHeader"]	= "数量";
		["UiReason"]	= "原因";
		["UiSales"]	= "销售";
		["UiSearch"]	= "搜索";
		["UiSearchForLabel"]	= "搜索";
		["UiSellTransaction"]	= "出售";
		["UiServer"]	= "服务器";
		["UiTransactions"]	= "交易";
		["UiTransactionsLabel"]	= "交易";
		["UiTransactionTypeHeader"]	= "类型";
		["UiWealth"]	= "大量";
		["UiWononBid"]	= "竞拍获胜";
		["UiWononBuyout"]	= "一口价获胜";

}
