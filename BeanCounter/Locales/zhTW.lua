--[[
	BeanCounter - Localization (zhTW)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.zhTW = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "拍賣記錄器設定";
		["C_BeanCounterDatabaseMaintenance"]	= "拍賣記錄器資料庫維護";
		["C_BeanCounterOptions"]	= "拍賣記錄器選項";
		["C_ColorizeSearch"]	= "增加漸變色彩到搜尋視窗中的每一個結果";
		["C_DatabaseLength"]	= "設定多久之後 BeanCounter 將儲存拍賣場的資料。";
		["C_DataMaintenance"]	= "資料庫維護";
		["C_DateString"]	= "日期的格式";
		["C_DateStringExample"]	= "例如日期：";
		["C_ExtenalSearch"]	= "允許其他插件使用拍賣記錄器的搜尋？";
		["C_MailInvoiceTimeout"]	= "郵件到期通知 = %d 秒";
		["C_MailRecolor"]	= "信件重新上色方法";
		["C_ModTTShow"]	= "當按下Alt的時候顯示額外提示";
		["C_MonthsToKeep"]	= "要保留多少個月份的資料？";
		["C_OpacityLevel"]	= "不透明度";
		["C_Resortascendingtime"]	= "將所有資料依增序排列";
		["C_ResortDatabase"]	= "資料庫重新排序";
		["C_ScanDatabase"]	= "掃描數據庫的錯誤: 如果您在搜索BeanCounter時發生錯誤,請使用這選項.  \n 使用前請先備份BeanCounter的saved variables.";
		["C_SearchConfiguration"]	= "搜尋設置";
		["C_SendToSearch"]	= "是否要將 BeanCounter 搜尋過的物件加入到主拍賣場視窗？";
		["C_ShowBeginnerTooltips"]	= "當鼠標停留時顯示beginner提示框.";
		["C_ShowReasonPurchase"]	= "在提示框內顯示購買的原因.";
		["C_ValidateDatabase"]	= "驗證數據庫";

		-- Section: Generic Strings
		["NoRe-Color"]	= "不重新上色";
		["off"]	= "關閉";
		["Ok"]	= "確定";
		["on"]	= "開啟";
		["Re-ColorIcons"]	= "圖標重新上色";
		["Re-ColorIconsandText"]	= "圖標和文字重新上色";
		["Re-ColorText"]	= "文字重新上色";
		["TooltipFailed"]	= "無法取得訊息窗資訊";
		["UiNeutralCheckBox"]	= "顯示中立拍賣場的資料";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter將儲存物品被購買的搜索界面原因並於提示中顯示它.";
		["A_DateString"]	= "控制BeanCounter的GUI如何顯示日期.命令以%作為前綴,並且可以混用多個命令與文字.例如%a==%X將顯示Wed==21:34:21";
		["A_DateStringCommands"]	= "命令:\n %a = 縮寫的日期名,\n %A = 日期名, \n %b = 縮寫的月名, \n %B = 月名,\n %c = 日期和時間, \n %d = 日 (01-31),\n %H = 小時 (24), \n %I = 小時 (12),\n %M = 分, \n %m = 月,\n %p = 每";
		["A_ExtenalSearch"]	= "其他插件可以請求於BeanCounter的GUI內顯示一件物品的搜索結果. 例如 此允許BeanCounter顯示你在Appraiser查找的物品.";
		["A_MailInvoiceTimeout"]	= "BeanCounter將等待的服務器的通知請求的時間.通知是一個記載了誰,什麼,多少錢的拍賣行郵件.";
		["A_MailRecolor"]	= "BeanCounter讀取來自拍賣行的所有郵件,此選項告訴BeanCounter如何將未讀郵件上色以便用戶閱讀.";
		["HelpGuiItemBox"]	= "拖入物品以開始搜索";
		["Q_BeanCountersTooltip"]	= "什麼是BeanCounter提示";
		["Q_DateString"]	= "使用日期格式?";
		["Q_DateStringCommands"]	= "可接受日期命令?";
		["Q_ExtenalSearch"]	= "允許外部插件使用BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "什麼是郵件通知逾時？";
		["Q_MailRecolor"]	= "什麼是重新上色？";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "最大搜尋結果顯示量(從每個資料庫)";
		["TTDataExpireEnabled"]	= "老於這個選擇過的時間區間的資料將會被[刪除]";
		["TT_ColorizeSearch"]	= "這個選項將會改變 BeanCounter 搜尋視窗中的物件欄位色彩。";
		["TT_MaxDisplayedResults"]	= "這將控制有多少數量的結果會顯示在卷軸框架上。";
		["TT_neutralCheck"]	= "顯示中立的黑水灣拍賣場的結果";
		["TT_OpacityLevel"]	= "這將控制 BeanCounter 搜尋窗中的色彩條的不透明度程度(如果已啟用的話)";
		["TT_sendtosearch"]	= "當於 BeanCounter 中輸入一個搜尋字串名稱時這也會將該字串名稱加入拍賣場瀏覽頁面上。";

		-- Section: Interface
		["Cancelled"]	= "已取消";
		["UiAucCancelled"]	= "拍賣已取消";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "聯盟拍賣場";
		["MailHordeAuctionHouse"]	= "部落拍賣場";
		["MailNeutralAuctionHouse"]	= "中立拍賣場";
		["MailSenderAuctionHouse"]	= "拍賣場";

		-- Section: Tooltip Messages
		["TTDateString"]	= "键入你期望的日期显示格式.默认为%c";
		["TTDateStringExample"]	= "顯示一個示例的日期";
		["TTExtenalSearch"]	= "當在其他插件中鍵入一個搜索,BeanCounter也將顯示一個搜索結果";
		["TTMailInvoiceTimeout"]	= "選擇BeanCounter將嘗試從服務器獲取一個郵件通知的時間.低==更快但較高幾率丟失數據,高==更慢但可提高獲取數據的幾率(如果郵件服務器非常忙).";
		["TTMailRecolor"]	= "選擇BeanCounter掃瞄郵箱後郵件的顯示方式.";
		["TTModTTShow"]	= "Alt被按下時將顯示選項BeanCounter的額外提示。";
		["TTOpenconfig"]	= "打開BeanCounter配置窗口";
		["TTResort Database"]	= "這將把BeanCounter數據按照增序排序.可提高數據庫壓縮速度.";
		["TTShowBeginnerTooltips"]	= "開啟鼠標經過時的新手提示";
		["TTShowReasonPurchase"]	= "開啟物品購買原因";
		["TTValidateDatabase"]	= "這將搜索BeanCounter數據並且嘗試糾正任何錯誤.當搜索遇到錯誤時使用.";
		["TT_AuctionCheck"]	= "顯示在拍賣行已售出物品。";
		["TT_AuctionFailedCheck"]	= "顯示你未能售出的物品。";
		["TT_BeanCounterAHTab"]	= "右鍵點選來將 BeanCounter 顯示在一個額外視窗。";
		["TT_BeanCounterSelectBox"]	= "根據服務器、角色、陣營過濾搜索結果。";
		["TT_BidCheck"]	= "顯示在拍賣行拍到的物品。";
		["TT_BidFailedCheck"]	= "顯示你出價最高的物品。";
		["TT_ClassicCheck"]	= "顯示BeanCounter經典數據庫返回的結果。";
		["TT_ExactCheck"]	= "精確匹配搜索框中的文本。";
		["TT_ItemIconBox"]	= "拖入一件物品並搜索該物品。可能\n顯示 當前搜索物品圖標。";
		["TT_ScrollHeader"]	= "\n右擊拖動 改變尺寸 \nCTRL+右擊 重置";
		["TT_SearchBox"]	= "在這裡輸入搜索條件或者留空則顯示所有記錄";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter：拍賣交易歷史資料庫";
		["UiAucExpired"]	= "拍賣逾時";
		["UiAucSuccessful"]	= "拍賣成功！";
		["UiAuctions"]	= "拍賣場";
		["UiAuctionTransaction"]	= "拍賣";
		["UiBids"]	= "出價";
		["UiBidTransaction"]	= "出價";
		["UiBuyerSellerHeader"]	= "買方/賣方";
		["UiBuyTransaction"]	= "買";
		["UiClassicCheckBox"]	= "顯示拍賣交易的傳統資料";
		["UiData"]	= "資料";
		["UiDateHeader"]	= "日期";
		["UiDepositTransaction"]	= "保管費";
		["UiDone"]	= "完成";
		["UiExactNameSearch"]	= "完整名稱比對";
		["UiFailedAuctions"]	= "失敗的拍賣";
		["UiFee"]	= "費用";
		["UiMailFrameRecording"]	= "BeanCounter 正在紀錄您的信件";
		["UiMailFrameWait1"]	= "請勿關閉信箱視窗或";
		["UiMailFrameWait2"]	= "拍賣物品將不會被記錄";
		["UiNameHeader"]	= "物品";
		["UiNetHeader"]	= "淨利";
		["UiNetPerHeader"]	= "單件淨利";
		["UiOutbid"]	= "超過出價";
		["UiOutbids"]	= "超過出價";
		["UiPriceHeader"]	= "價格";
		["UiPriceper"]	= "單一價格";
		["UiPricePerHeader"]	= "價格標題";
		["UiPurchases"]	= "購買";
		["UiQuantityHeader"]	= "數量";
		["UiReason"]	= "原因";
		["UiSales"]	= "銷售";
		["UiSearch"]	= "搜尋";
		["UiSearchForLabel"]	= "搜尋";
		["UiSellTransaction"]	= "出售";
		["UiServer"]	= "伺服器";
		["UiTransactions"]	= "交易";
		["UiTransactionsLabel"]	= "交易";
		["UiTransactionTypeHeader"]	= "類別";
		["UiWealth"]	= "財產";
		["UiWononBid"]	= "成功出價";
		["UiWononBuyout"]	= "成功直購";

}
