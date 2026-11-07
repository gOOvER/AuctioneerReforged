--[[
	BeanCounter - Localization (koKR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.koKR = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "콩순이 설정";
		["C_BeanCounterDatabaseMaintenance"]	= "콩순이 데이터베이스 관리";
		["C_BeanCounterOptions"]	= "콩순이 옵션";
		["C_DataMaintenance"]	= "데이터 관리";
		["C_DateString"]	= "사용할 날짜 형식:";
		["C_DateStringExample"]	= "날짜 예제:";
		["C_ExtenalSearch"]	= "외부 애드온이 콩순이 검색을 사용하도록 허락합니까?";
		["C_MailInvoiceTimeout"]	= "우편 송장 타임아웃 = %d 초";
		["C_MailRecolor"]	= "우편에 다시 색입히는 방법";
		["C_ModTTShow"]	= "Alt키를 눌렀을 때만 별도의 툴팁을 보여줍니다.";
		["C_OpacityLevel"]	= "투명화 정도";
		["C_Resortascendingtime"]	= "시간순으로 모든 항목 재정렬";
		["C_ResortDatabase"]	= "데이터베이스 재정렬";
		["C_ScanDatabase"]	= "데이터베이스에서 오류를 검사합니다 : 콩순이 검색시 오류가 발생하면 사용하십시오. \n 사용하기 전에 콩순이의 SavedVariables을 백업해두십시오.";
		["C_SearchConfiguration"]	= "검색 설정";
		["C_ShowBeginnerTooltips"]	= "마우스를 가져다 대면 초보자를 위한 툴팁을 표시합니다.";
		["C_ShowReasonPurchase"]	= "게임 툴팁에 구매사유를 보여줍니다.";
		["C_ValidateDatabase"]	= "데이터베이스 검증";

		-- Section: Generic Strings
		["NoRe-Color"]	= "다시 색을 입히지 않음";
		["off"]	= "끄기";
		["Ok"]	= "확인";
		["on"]	= "켜기";
		["Re-ColorIcons"]	= "아이콘에 다시 색입히기";
		["Re-ColorIconsandText"]	= "아이콘과 글자에 다시 색입히기";
		["Re-ColorText"]	= "글씨에 다시 색입히기";
		["TooltipFailed"]	= "툴팁 정보를 가져올수 없습니다";
		["UiNeutralCheckBox"]	= "중립 경매장 결과도 보기";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "SearchUI의 아이템 구입사유를 저장하고 툴팁에 보여줍니다.";
		["A_DateString"]	= "콩순이의 GUI창에 보이는 날짜의 형식을 결정합니다.\n명령어 앞에 %를 붙여야 하고, 복수의 명령어와 글씨가 혼합될 수 있습니다.\n예를 들어 %a == %X라고 하면 수요일 == 21:34:21로 표시됩니다.";
		["A_DateStringCommands"]	= "명령어 : \n %a = 요일 약자, \n %A = 요일, \n %b = 월 약자, \n %B = 월,\n %c = 날짜와 시간, \n %d = 일(01-31일),\n %H = 시간 (24시간제), \n %I = 시간(12시간제),\n %M = 분, \n %m = 월(숫자),\n %p = a";
		["A_ExtenalSearch"]	= "다른 애드온이 콩순이를 이용해 아이템을 검색하여 콩순이 GUI에 보이도록 할 수 있습니다. 예를 들면 Appraiser에서 보고있는 아이템이 무엇인지 콩순이가 보여주도록 합니다.";
		["A_MailInvoiceTimeout"]	= "송장 요청에 서버가 반응하기를 기다리는 시간입니다. 송장이란 경매장에서 온 우편의 누구, 무엇, 어떻게 부분입니다.";
		["A_MailRecolor"]	= "콩순이는 경매장에서 온 모든 우편을 읽습니다. 이 옵션은 우편을 안 읽은 것처럼 다시 색을 입힐지를 결정합니다.";
		["HelpGuiItemBox"]	= "아이템을 검색창에 떨굽니다.";
		["Q_BeanCountersTooltip"]	= "콩순이 툴팁이란?";
		["Q_DateString"]	= "사용할 날짜 형식이란?";
		["Q_DateStringCommands"]	= "알맞는 날짜 명령어란?";
		["Q_ExtenalSearch"]	= "외부 애드온의 콩순이 사용이란?";
		["Q_MailInvoiceTimeout"]	= "우편 송장 타임아웃이란?";
		["Q_MailRecolor"]	= "우편에 다시 색입히기 방법이란?";

		-- Section: HelpTooltip
		["TTDataExpireEnabled"]	= "선택된 시간보다 오래된 데이터가 삭제됩니다";
		["TT_neutralCheck"]	= "중립 경매장 결과도 보기";
		["TT_sendtosearch"]	= "콩순이의 검색창에 입력된 내용을 [검색]탭의 검색창에도 동시에 입력합니다.";

		-- Section: Interface
		["Cancelled"]	= "취소됨";
		["UiAucCancelled"]	= "경매 취소됨";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "얼라이언스 경매장";
		["MailHordeAuctionHouse"]	= "호드 경매장";
		["MailNeutralAuctionHouse"]	= "중립 경매장";

		-- Section: Tooltip Messages
		["TTDateString"]	= "날짜 부분에 보일 형식을 넣습니다. 기본값은 %c입니다.";
		["TTDateStringExample"]	= "설정된 날짜 형식의 예제를 보여줍니다.";
		["TTExtenalSearch"]	= "다른 애드온에서 검색을 하면, 콩순이도 그 아이템에 대한 검색결과를 보여줍니다.";
		["TTMailInvoiceTimeout"]	= "서버로부터 우편 송장을 얻기 위해 몇번이나 시도할지를 정합니다. 값을 낮추면 빠르지만 데이터가 빠져있을 확률이 있고, 값을 높이면 느리지만 우편 서버가 극히 바쁠경우 데이터를 가져올 확률을 높입니다.";
		["TTMailRecolor"]	= "콩순이가 우편함을 검색한 다음에 우편이 어떻게 보일지를 결정합니다.";
		["TTModTTShow"]	= "이 옵션은 Alt키를 눌렀을때 별도의 툴팁을 보여줍니다.";
		["TTOpenconfig"]	= "콩순이 설정 창을 엽니다.";
		["TTResort Database"]	= "콩순이의 데이터를 검색하여 모든 항목을 시간순서대로 정렬합니다. 데이터베이스 압축기능이 빨라집니다.";
		["TTShowBeginnerTooltips"]	= "초보자를 위한 툴팁을 켭니다.(마우스를 가져다 대면 나옵니다.)";
		["TTShowReasonPurchase"]	= "SearchUI를 켭니다. 툴팁에 아이템구입 내용이 표시됩니다.";
		["TTValidateDatabase"]	= "콩순이의 데이터를 검색하여 발견된 오류를 바로잡습니다. 검색시 오류가 발생하는 경우 사용하십시오.";
		["TT_AuctionCheck"]	= "경매장에서 팔린 아이템 보기.";
		["TT_AuctionFailedCheck"]	= "구매에 실패한 아이템 보기.";
		["TT_BeanCounterSelectBox"]	= "서버나 플레이어, 혹은 진영별로 검색결과를 분류합니다.";
		["TT_BidCheck"]	= "경매장에서 구매한 아이템 보기.";
		["TT_BidFailedCheck"]	= "상회입찰한 아이템 보기.";
		["TT_ClassicCheck"]	= "콩순이 구버전 DB에서 가져온 결과를 표시합니다.";
		["TT_ExactCheck"]	= "정확히 일치하는 문장만 검색";
		["TT_ItemIconBox"]	= "아이템을 이곳에 가져다 놓으면 해당 아이템에 대한 검색을 시작합니다.\n가능한 경우 현재 검색중인 아이템의 아이콘을 표시합니다.";
		["TT_ScrollHeader"]	= "\n마우스 오른버튼을 누르고 끌면 크기 변경\nCTRL+마우스 오른버튼을 누르면 초기화";
		["TT_SearchBox"]	= "검색쿼리를 이곳에 입력하세요(전부검색시 공백)";

		-- Section: User Interface
		["UiAddonTitle"]	= "콩순이: 경매결과 데이터베이스";
		["UiAucExpired"]	= "경매 만료";
		["UiAucSuccessful"]	= "경매 완료";
		["UiAuctions"]	= "경매품";
		["UiAuctionTransaction"]	= "경매";
		["UiBids"]	= "입찰품";
		["UiBidTransaction"]	= "입찰";
		["UiBuyerSellerHeader"]	= "구매자/판매자";
		["UiBuyTransaction"]	= "구입";
		["UiClassicCheckBox"]	= "불타는 성전의 옛 데이터 표시";
		["UiData"]	= "데이터";
		["UiDateHeader"]	= "날짜";
		["UiDepositTransaction"]	= "보증금";
		["UiDone"]	= "완료";
		["UiExactNameSearch"]	= "정확한 이름 찾기";
		["UiFailedAuctions"]	= "실패한 경매";
		["UiFee"]	= "수수료";
		["UiMailFrameRecording"]	= "콩순이가 메일을 기록합니다.";
		["UiMailFrameWait1"]	= "메일함을 닫지 마세요.";
		["UiMailFrameWait2"]	= "경매 아이템은 저장되지 않습니다.";
		["UiNameHeader"]	= "아이템";
		["UiNetHeader"]	= "항목";
		["UiNetPerHeader"]	= "항목내용";
		["UiOutbid"]	= "상회 입찰";
		["UiOutbids"]	= "상회 입찰";
		["UiPriceHeader"]	= "가격";
		["UiPriceper"]	= "개당 가격";
		["UiPricePerHeader"]	= "가격 항목";
		["UiPurchases"]	= "구입";
		["UiQuantityHeader"]	= "수량";
		["UiReason"]	= "이유";
		["UiSales"]	= "판매";
		["UiSearch"]	= "검색";
		["UiSearchForLabel"]	= "검색:";
		["UiSellTransaction"]	= "판매";
		["UiServer"]	= "서버";
		["UiTransactions"]	= "거래";
		["UiTransactionsLabel"]	= "거래:";
		["UiTransactionTypeHeader"]	= "형식";
		["UiWealth"]	= "재산";
		["UiWononBid"]	= "구입";
		["UiWononBuyout"]	= "즉시 구입";

}
