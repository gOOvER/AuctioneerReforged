--[[
	Enchantrix - Localization (koKR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.koKR = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "모든 마법부여 데이터를 삭제합니다.";
		["FrmtActClearFail"]	= "아이템을 찾을 수 없음: %s";
		["FrmtActClearOk"]	= "아이템 데이터 삭제: %s";
		["FrmtActDefault"]	= "Enchantrix의 %s 설정이 초기화 되었습니다.";
		["FrmtActDefaultAll"]	= "모든 Enchantrix 설정이 초기화 되었습니다.";
		["FrmtActDisable"]	= "아이템의 %s 데이터를 표시하지 않습니다.";
		["FrmtActEnable"]	= "아이템의 %s 데이터를 표시합니다.";
		["FrmtActSet"]	= "%s를 '%s'|1으로;로; 설정합니다.";
		["FrmtActUnknown"]	= "알 수 없는 명령어: '%s'";
		["FrmtActUnknownLocale"]	= "('%s|1')은;')는; 알 수 없는 지역입니다. 올바른 지역 설정은 다음과 같습니다:";
		["FrmtPrintin"]	= "Enchantrix의 메세지는 이제 \"%s\" 채팅창에 출력됩니다.";
		["FrmtUsage"]	= "사용법:";
		["MesgDisable"]	= "Enchantrix를 자동 로딩하지 않습니다.";
		["MesgNotloaded"]	= "Enchantrix가 로드되지 않았습니다. 더 많은 정보는 /enchantrix 를 입력하세요.";

		-- Section: Command Options
		["CmdClearAll"]	= "모두";
		["OptClear"]	= "([아이템]|모두)";
		["OptDefault"]	= "(<설정>|모두)";
		["OptFindBidauct"]	= "<실버>";
		["OptFindBuyauct"]	= "<퍼센트>";
		["OptLocale"]	= "<지역>";
		["OptPrintin"]	= "(<창번호>[번호]|<창이름>[문자열])";

		-- Section: Commands
		["CmdClear"]	= "삭제";
		["CmdDefault"]	= "기본값";
		["CmdDisable"]	= "비활성화";
		["CmdFindBidauct"]	= "입찰중개인";
		["CmdFindBidauctShort"]	= "bb";
		["CmdFindBuyauct"]	= "이하확률";
		["CmdFindBuyauctShort"]	= "pl";
		["CmdHelp"]	= "도움말";
		["CmdLocale"]	= "지역";
		["CmdOff"]	= "끔";
		["CmdOn"]	= "켬";
		["CmdPrintin"]	= "출력하는곳";
		["CmdToggle"]	= "전환";
		["ConfigUI"]	= "설정";
		["ShowDELevels"]	= "레벨";
		["ShowDEMaterials"]	= "재료";
		["ShowEmbed"]	= "내장";
		["ShowGuessAuctioneerHsp"]	= "평가된 HSP";
		["ShowGuessAuctioneerMed"]	= "평가된 중앙값";
		["ShowGuessAuctioneerVal"]	= "평가된 값";
		["ShowGuessBaseline"]	= "평가된 기본값";
		["ShowTerse"]	= "간결";
		["ShowUI"]	= "표시";
		["ShowValue"]	= "평가";
		["StatOff"]	= "어떤 마법부여자료도 표시하지 않음";
		["StatOn"]	= "설정된 마법부여자료 표시";

		-- Section: Config Text
		["GuiLoad"]	= "Enchantrix 로드";
		["GuiLoad_Always"]	= "항상";
		["GuiLoad_Never"]	= "사용 안 함";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "제분";
		["ArgSpellname"]	= "마력 추출";
		["ArgSpellProspectingName"]	= "보석 추출";
		["Enchanting"]	= "마법부여";
		["Inscription"]	= "주문각인";
		["Jewelcrafting"]	= "보석세공";
		["PatReagents"]	= "재료: (.+)";
		["TextCombat"]	= "전투";
		["TextGeneral"]	= "일반";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(당신의 데이터를 공유하려면  에 방문하십시오.)";
		["FrmtWelcome"]	= "Enchantrix v%s 로딩 완료";
		["MesgAuctVersion"]	= "Enchantrix는 Auctioneer 4.0 버전 이상이 필요합니다. 업데이트 전까지 몇몇 기능을 사용할 수 없습니다.";

		-- Section: Help Text
		["GuiClearall"]	= "모든 Enchantrix 데이터 삭제";
		["GuiClearallButton"]	= "모두 삭제";
		["GuiClearallHelp"]	= "클릭하면 현재 서버의 Enchantrix 자료가 모두 삭제됩니다.";
		["GuiClearallNote"]	= "현재 서버-진영";
		["GuiDefaultAll"]	= "모든 Enchantrix 옵션 초기화";
		["GuiDefaultAllButton"]	= "모두 초기화";
		["GuiDefaultAllHelp"]	= "클릭하면 Enchantrix의 설정을 기본값으로 돌립니다. 경고: 이 작업은 되돌릴 수 없습니다.";
		["GuiDefaultOption"]	= "이 설정 초기화";
		["GuiDELevels"]	= "툴팁에 마력 추출에 필요한 레벨을 보여줍니다.";
		["GuiDEMaterials"]	= "툴팁에 마력 추출 재료 정보를 보여줍니다.";
		["GuiEmbed"]	= "정보를 기본 툴팁에 포함";
		["GuiLocale"]	= "지역 설정";
		["GuiMainEnable"]	= "Enchantrix 활성화";
		["GuiMainHelp"]	= "아이템에 대한 마력추출의 결과와 관련된 정보를 툴팁에 표시해주는 애드온인 Enchantrix에 관한 설정을 포함합니다.";
		["GuiOtherHeader"]	= "기타 설정";
		["GuiOtherHelp"]	= "기타 Enchantrix 설정";
		["GuiPrintin"]	= "원하는 메시지 창 선택";
		["GuiPrintYieldsInChat"]	= "이득을 채팅창에 표시";
		["GuiShowCraftReagents"]	= "툴팁에 제작될 재료 보이기";
		["GuiTerse"]	= "간결 모드 사용";
		["GuiValuateAverages"]	= "Auctioneer 평균으로 평가";
		["GuiValuateBaseline"]	= "내장된 자료를 이용해 평가";
		["GuiValuateEnable"]	= "평가 활성화";
		["GuiValuateHeader"]	= "평가";
		["GuiValuateMedian"]	= "Autctioneer 중앙값으로 평가";
		["HelpClear"]	= "지정된 아이템의 데이타를 삭제합니다.(이때 아이템지정은 Shift-click 으로 명령어창에 넣어야합니다.) 모든 아이템데이타를 삭제하기 위해 \"모두\" 를 사용할 수 있습니다.";
		["HelpDefault"]	= "Enchantrix의 옵션을 기본값으로 설정합니다. 모든 Enchantrix 설정을 기본값으로 하시려면 \"모두\" 를 사용할 수 있습니다.";
		["HelpDisable"]	= "다음 로그인시 자동으로 Enchantrix를 로드하지 않음";
		["HelpEmbed"]	= "내용을 기본 게임 툴팁에 포함(이 설정이 선택되면, 일부 기능을 사용할수 없습니다.)";
		["HelpFindBidauct"]	= "가능한 마력추출 가격이 입찰가 보다 낮은 경매품 찾기";
		["HelpFindBuyauct"]	= "가능한 마력추출 가격이 즉시 구입가보다 낮은 경매품 찾기";
		["HelpGuessAuctioneer5Val"]	= "만약 평가가 활성화 되어있고 Auctioneer가 설치되어 있다면 아이템 마력추출의 시장가격을 보여줍니다.";
		["HelpGuessAuctioneerHsp"]	= "만약 평가가 활성화 되어있고 Auctioneer가 설치되어 있다면, 아이템을 마력추출시 가치의 최고판매가능가격(HSP)이 표시됩니다.";
		["HelpGuessAuctioneerMedian"]	= "만약 평가가 활성화 되었으면, 그리고 Auctioneer가 설치되어 있으면, 아이템을 마력추출시 가치의 중앙값이 표시됩니다.";
		["HelpGuessBaseline"]	= "만약 평가가 활성화 되었으면, (Autctionner는 필요하지 않습니다) 아이템을 마력추출시 가치의 기본값이 표시됩니다.";
		["HelpGuessNoauctioneer"]	= "Auctioneer가 설치되어 있지 않아서 평가된 HSP, 평가된 중앙값 명령어를 사용할 수 없습니다.";
		["HelpLoad"]	= "이 케릭터의 Enchantrix 로드 설정 변경";
		["HelpLocale"]	= "Enchantrix가 메시지를 표시하기위해 사용하는 언어 변경";
		["HelpOnoff"]	= "Enchantrix자료 표시 켬/끔";
		["HelpPrintin"]	= "Enchantrix가 메시지를 출력할 프레임 선택. 프레임의 이름이나, 번호를 사용할 수 있습니다.";
		["HelpShowDELevels"]	= "아이템을 마력추출하는데 필요한 마법부여 숙련을 툴팁에 표시할지를 선택합니다.";
		["HelpShowDEMaterials"]	= "아이템을 마력추출해서 받을 수 있는 마법재료를 툴팁에 표시할지를 선택합니다.";
		["HelpShowUI"]	= "설정창을 보이거나 숨깁니다.";
		["HelpTerse"]	= "마력추출 가격만 보이도록하는 간결 모드 사용/사용안함. 컨트롤 키를 눌러서 겹쳐쓸 수 있음.";
		["HelpValue"]	= "가능한 마력추출 비율에 근거한 아이템의 평가값 보기 여부 선택";
		["ModTTShow_Help"]	= "이 옵션은 Alt키를 눌렀을 때만 Enchantrix의 별도 툴팁을 보여줍니다.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "Auctioneer가 설치되어 있지 않습니다. 경매 검색을 수행하려면 Auctioneer가 설치되어 있어야 합니다.";
		["AuctionScanVersionTooOld"]	= "설치된 Auctioneer의 버젼이 맞지 않습니다. 이 기능을 이용하려면 Auctioneer 4.0 이상이 필요합니다.";
		["ChatDeletedProfile"]	= "프로필 삭제:";
		["ChatDuplicatedProfile"]	= "프로필 복제:";
		["ChatResetProfile"]	= "모든 설정값 삭제:";
		["ChatSavedProfile"]	= "저장된 프로필:";
		["ChatUsingProfile"]	= "사용 중인 프로필:";
		["FrmtAutoDeActive"]	= "자동 마력 추출 활성화";
		["FrmtAutoDeDisabled"]	= "자동 마력 추출 비활성화";
		["FrmtAutoDeDisenchantCancelled"]	= "마력 추출이 취소되었습니다: 아이템을 찾을 수 없습니다.";
		["FrmtAutoDeDisenchanting"]	= "%s를 마력 추출합니다.";
		["FrmtAutoDeIgnorePermanent"]	= "%s를 영원히 무시합니다.";
		["FrmtAutoDeIgnoreSession"]	= "%s를 이번 접속 동안만 무시합니다.";
		["FrmtAutoDeInactive"]	= "자동 마력 추출 비활성화";
		["FrmtAutoDeMilling"]	= "%s를 제분합니다.";
		["FrmtAutoDeMillingCancelled"]	= "제분 취소: 아이템을 찾을 수 없습니다.";
		["FrmtAutoDeProspectCancelled"]	= "보석 추출 취소: 아이템을 찾을 수 없습니다.";
		["FrmtAutoDeProspecting"]	= "%s를 보석 추출합니다.";
		["FrmtBidbrokerCurbid"]	= "현재 입찰";
		["FrmtBidbrokerDone"]	= "입찰 중개 완료";
		["FrmtBidbrokerHeader"]	= "입찰이 평균 마력 추출 가격에서 %S 실버 절약되었습니다. (최소 %%less = %d):";
		["FrmtBidbrokerLine"]	= "%s, 가격: %s, %s: %s, 감소: %s, %s 이하, 시간: %s";
		["FrmtBidbrokerMinbid"]	= "최소 입찰";
		["FrmtBidBrokerSkipped"]	= "%d개의 경매품이 마진(%d%%)을 위해 건너뛰어짐";
		["FrmtBidBrokerSkippedBids"]	= "입찰값이 존재하여 %d개의 경매를 건너뛰었습니다.";
		["FrmtPctlessDone"]	= "%% 덜 됨.";
		["FrmtPctlessHeader"]	= "즉시 구입가격이 평균 마력추출 가격상에서 %d%% 절약되었습니다.:";
		["FrmtPctlessLine"]	= "%s, 가격: %s, BO: %s, 감소: %s, %s 이하";
		["FrmtPctlessSkillSkipped"]	= "%d개의 경매품이 전문기술숙련(%s) 때문에 건너뛰어짐";
		["FrmtPctlessSkipped"]	= "%d개의 경매품이 수익성(%s)을 위해 건너뛰어짐";

		-- Section: Tooltip Messages
		["Click"]	= "클릭";
		["EnxMMTip"]	= "Enchantrix는 마력추출, 보석추출, 제분으로 생산될 재료를 보여줍니다. 또한 가격 책정과 구매 의사 결정이 이루어질 수 있도록 Auctioneer에 통합하여 제공합니다.";
		["FrmtBarkerPrice"]	= "가격 알림 (%d%% 마진)";
		["FrmtDEItemLevels"]	= "%d에서 %d레벨 아이템에서 마력 추출 가능.";
		["FrmtDisinto"]	= "마력 추출:";
		["FrmtFound"]	= "%s|1이;가; 마력 추출되는 아이템:";
		["FrmtFoundNotDisenchant"]	= "%s는 마력 추출이 불가능합니다.";
		["FrmtInkFrom"]	= "원재료:";
		["FrmtMillingFound"]	= "%s|1이;가; 제분되는 아이템:";
		["FrmtMillingValueAuctHsp"]	= "제분 가격(HSP)";
		["FrmtMillingValueAuctMed"]	= "제분 가격 (중앙값)";
		["FrmtMillingValueAuctVal"]	= "제분 가격 (경매장값)";
		["FrmtMillingValueMarket"]	= "제분 가격 (기준값)";
		["FrmtMillsInto"]	= "제분:";
		["FrmtPriceEach"]	= "(%s 개)";
		["FrmtProspectFound"]	= "%s|1이;가; 보석 추출되는 아이템:";
		["FrmtProspectFrom"]	= "%s에서 추출 가능.";
		["FrmtProspectInto"]	= "보석 추출:";
		["FrmtProspectValueAuctHsp"]	= "보석 추출 가격 (HSP)";
		["FrmtProspectValueAuctMed"]	= "보석 추출 가격 (중앙값)";
		["FrmtProspectValueAuctVal"]	= "보석 추출 가격 (경매장값)";
		["FrmtProspectValueMarket"]	= "보석 추출 가격 (기본가)";
		["FrmtSuggestedPrice"]	= "제안 가격:";
		["FrmtTotal"]	= "총";
		["FrmtValueAuctHsp"]	= "마력추출 가격 (HSP)";
		["FrmtValueAuctMed"]	= "마력추출 가격 (중앙값)";
		["FrmtValueAuctVal"]	= "마력 추출 가격 (경매장값)";
		["FrmtValueFixedVal"]	= "마력 추출 가격(Fixed)";
		["FrmtValueMarket"]	= "마력 추출 가격 (기준값)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer가 실행되지 않아서 저장된 가격을 사용합니다.]";
		["FrmtWarnNoPrices"]	= "[가능한 가격 없음]";
		["FrmtWarnPriceUnavail"]	= "[일부 가격을 사용할 수 없음]";
		["RightClick"]	= "우-클릭";
		["ShiftClick"]	= "Shift-클릭";
		["TipOpenConfig"]	= "설정창 열기";
		["TipOpenEnchant"]	= "마법부여 창 열기";
		["TipOpenJewel"]	= "보석세공 창 열기";
		["TooltipMillingLevel"]	= "제분 요구 숙련도 %d";
		["TooltipProspectLevel"]	= "보석 추출 요구 숙련도 %d";
		["TooltipShowDisenchantLevel"]	= "마력 추출 요구 숙련도 %d";

		-- Section: User Interface
		["ExportPriceAucAdv"]	= "Enchantrix 가격을 Auctioneer Advanced로 내보냅니다.";
		["GuiActivateProfile"]	= "현재 프로필 활성화";
		["GuiAutoDeBoughtForDE"]	= "마력 추출용으로 구입된 아이템만";
		["GuiAutoDeEnable"]	= "가방에서 마력추출할 아이템을 찾습니다. - \"주의해서 사용하세요.\"";
		["GuiAutoDeEpicItems"]	= "영웅 (보라색) 아이템 자동 마력 추출";
		["GuiAutoDeOptions"]	= "자동화";
		["GuiAutoDePromptLine1"]	= "마력추출하겠습니까? :";
		["GuiAutoDePromptLine3"]	= "가치 : %s";
		["GuiAutoDeRareItems"]	= "희귀(파랑) 아이템 자동 마력 추출";
		["GuiAutoDESuggestion"]	= "제안 : %s";
		["GuiAutoMillingPromptLine1"]	= "제분 하겠습니까?";
		["GuiAutoProspectPromptLine1"]	= "보석추출하겠습니까:";
		["GuiBBUnbiddedOnly"]	= "입찰이 없는 아이템으로 BidBroker를 한정합니다.";
		["GuiConfigProfiles"]	= "설정 및 프로파일 수정";
		["GuiCreateReplaceProfile"]	= "프로파일 생성 또는 갱신";
		["GuiDefaultBBProfitPercent"]	= "기본 중개 수익률: %d";
		["GuiDefaultLessHSP"]	= "HSP보다 작은 기본%: %d";
		["GuiDefaultProfitMargin"]	= "기본 이윤:";
		["GuiDeleteProfileButton"]	= "삭제";
		["GuiDuplicateProfileButton"]	= "프로필 복사";
		["GuiFixedSettings"]	= "고정된 재료 가격";
		["GuiFixedSettingsNote"]	= "설명: 아래의 값들이 체크 되었을 경우에는 Auctioneer나 다른 가격 결정 요소 대신에 사용됩니다.¶ The following values are still affected by the reagent weights in the previous section, so if you want to make sure that the reagent is valued at exactly the specified amount below, then also make sure that it's weight is set to 100% in the weights section.";
		["GuiGeneralOptions"]	= "일반 Enchantrix 설정";
		["GuiIgnore"]	= "무시¶";
		["GuiItemValueAuc4HSP"]	= "Auc4 HSP";
		["GuiItemValueAuc4Median"]	= "Auc4 중간값";
		["GuiItemValueAuc5Appraiser"]	= "AucAdv 감정값";
		["GuiItemValueAuc5Market"]	= "AucAdv 시장 가격";
		["GuiItemValueAverage"]	= "평균 (기본값)";
		["GuiItemValueBaseline"]	= "시장 기준";
		["GuiItemValueCalc"]	= "다음으로부터 아이템 가치가 산정되었습니다:";
		["GuiMaxBuyout"]	= "즉시 구매 최대가 :";
		["GuiMillingingValues"]	= "제분시 예상 가치를 보여줍니다.";
		["GuiMillingLevels"]	= "제분 레벨제한을 툴팁에 보여줍니다.";
		["GuiMillingMaterials"]	= "제분 재료 정보를 툴팁에 보여줍니다.";
		["GuiMillingOptions"]	= "제분 옵션";
		["GuiMinBBProfitPercent"]	= "최소 중개 수익률: %d";
		["GuiMinimapButtonAngle"]	= "버튼 각도 : %d";
		["GuiMinimapButtonDist"]	= "거리 : %d";
		["GuiMinimapOptions"]	= "미니맵 표시 설정";
		["GuiMinimapShowButton"]	= "미니맵 버튼을 표시합니다.";
		["GuiMinLessHSP"]	= "HSP보다 작은 최소 %: %d";
		["GuiMinProfitMargin"]	= "최소 이윤 :";
		["GuiNewProfileName"]	= "새로운 프로파일 이름:";
		["GuiNo"]	= "아니오¶";
		["GuiPLBBOnlyBelowDESkill"]	= "현재 기술레벨로 마력추출이 가능한 아이템만 보이기";
		["GuiPLBBSettings"]	= "%, 중개 설정";
		["GuiProspectingLevels"]	= "보석추출 레벨제한을 툴팁에 보여줍니다.";
		["GuiProspectingMaterials"]	= "보석추출 재료 정보를 툴팁에 보여줍니다.";
		["GuiProspectingOptions"]	= "보석 추출 설정";
		["GuiProspectingValues"]	= "보석 추출의 예상 가치를 보여줍니다.";
		["GuiResetProfileButton"]	= "초기화";
		["GuiSaveProfileButton"]	= "저장";
		["GuiShowMilling"]	= "약초에 대한 제분 데이터를 보여줍니다.";
		["GuiShowProspecting"]	= "광석에 대한 보석 추출 데이터를 보여줍니다.";
		["GuiTabAuctions"]	= "경매";
		["GuiTabFixed"]	= "고정 가치";
		["GuiTabGeneral"]	= "일반";
		["GuiTabMilling"]	= "제분";
		["GuiTabProfiles"]	= "프로파일";
		["GuiTabProspecting"]	= "보석 추출";
		["GuiTabWeights"]	= "가중치";
		["GuiValueOptions"]	= "가치 표시 설정";
		["GuiValueShowAuc4HSP"]	= "Auctioneer HSP 값을 보여줍니다.";
		["GuiValueShowAuc4Median"]	= "Auctioneer 중간값을 보여줍니다.";
		["GuiValueShowAuc5Market"]	= "Auctioneer 시장 가치를 보여줍니다.";
		["GuiValueShowBaseline"]	= "내장 기준 가치를 보여줍니다.";
		["GuiValueShowDEValues"]	= "마력 추출시 예상 가치를 보여줍니다.";
		["GuiValueTerse"]	= "간략한 마력 추출 가치를 보여줍니다.";
		["GuiWeighSettingsNote"]	= "위의 가중치는 명시된 양만큼 주어진 재료의 가치계산을 변경합니다. 더 혹은 덜 가치있다고 판단하지 않는 한, 일반적으로 100%로 두는 것이 좋습니다.";
		["GuiWeightSettings"]	= "올바른 재료 마력추출";
		["GuiYes"]	= "예";
		["ModTTShow"]	= "Alt 키를 눌렀을 때만 별도의 툴팁을 보여줍니다.";
		["ModTTShow_alt"]	= "Alt 키가 눌렸을 때";
		["ModTTShow_always"]	= "항상";
		["ModTTShow_ctrl"]	= "Ctrl 키가 눌렸을 때";
		["ModTTShow_never"]	= "표시안함";
		["ModTTShow_noalt"]	= "Alt 키가 눌리지 않았을 때";
		["ModTTShow_noctrl"]	= "Ctrl 키가 눌리지 않았을 때";
		["ModTTShow_noshift"]	= "Shift 키가 눌리지 않았을 때";
		["ModTTShow_shift"]	= "Shift 키가 눌렸을 때";

}
