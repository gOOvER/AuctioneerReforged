--[[
	Enchantrix - Localization (ptBR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.ptBR = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Limpando todos os dados de encantamento";
		["FrmtActClearFail"]	= "Não foi possível encontrar o item: %s";
		["FrmtActClearOk"]	= "Limpando dados do item: %s";
		["FrmtActDefault"]	= "A opção %s do Enchantrix foi reiniciada para o valor padrão";
		["FrmtActDefaultAll"]	= "Todas as opções do Enchantrix foram reiniciadas para os valores padrões.";
		["FrmtActDisable"]	= "Não serão mostrados dados do item: %s";
		["FrmtActEnable"]	= "Exibindo dados do item %s";
		["FrmtActSet"]	= "Ajuste %s para '%s'";
		["FrmtActUnknown"]	= "Comando de palavra-chave desconhecido: '%s'";
		["FrmtActUnknownLocale"]	= "A localidade especificado ('%s') não é conhecido. Localidades válidos são:";
		["FrmtPrintin"]	= "Mensagens do enchantrix serão impressas agora no quadro de mensagens \"%s\"";
		["FrmtUsage"]	= "Uso:";
		["MesgDisable"]	= "Desabilitando o carregamento automático do Enchantrix";
		["MesgNotloaded"]	= "O Enchantrix não está carregado. Digite /enchantrix para mais informações.";

		-- Section: Command Options
		["OptFindBidauct"]	= "<prata>";
		["OptFindBuyauct"]	= "<porcentagem>";
		["OptLocale"]	= "<localidade>";
		["OptPrintin"]	= "(<indiceDaJanela>[Numero]|<nomeDaJanela>[Texto])";

		-- Section: Commands
		["CmdClear"]	= "limpar";
		["CmdDefault"]	= "padrão";
		["CmdDisable"]	= "desativar";
		["CmdOff"]	= "desligar";
		["CmdOn"]	= "ligar";
		["ConfigUI"]	= "configurar";
		["ShowDELevels"]	= "níveis";
		["ShowDEMaterials"]	= "materiais";
		["ShowEmbed"]	= "integrar";
		["ShowGuessAuctioneerVal"]	= "valorar-valor";
		["ShowGuessBaseline"]	= "valorar-base";
		["ShowTerse"]	= "conciso";
		["ShowUI"]	= "exibir";
		["ShowValue"]	= "valorar";
		["StatOff"]	= "Não exibindo qualquer dado de encantamento";
		["StatOn"]	= "Exibindo dados de encantamento configurados";

		-- Section: Config Text
		["GuiLoad"]	= "Carregar Enchantrix";
		["GuiLoad_Always"]	= "sempre";
		["GuiLoad_Never"]	= "nunca";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Triturar Ervas";
		["ArgSpellname"]	= "Desencantar";
		["ArgSpellProspectingName"]	= "Prospecção";
		["Enchanting"]	= "Encantamento";
		["Inscription"]	= "Escrivania";
		["Jewelcrafting"]	= "Joalheria";
		["PatReagents"]	= "Reagentes: (.+)";
		["TextCombat"]	= "Combate";
		["TextGeneral"]	= "Geral";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(vá para  para compartilhar seus dados)";
		["FrmtWelcome"]	= "Enchantrix v%s carregado";
		["MesgAuctVersion"]	= "Enchantrix necessita do Auctioneer versão 4.0 ou maior. Algumas funcionalidades estarão indisponíveis até que você atualize sua instalação do Auctioneer.";

		-- Section: Help Text
		["GuiAltChatlink"]	= "Abra dicas de links do bate-papo com Alt cliques-esquerdos";
		["GuiClearall"]	= "Limpar Todos os Dados do Enchantrix";
		["GuiClearallButton"]	= "Limpar Tudo";
		["GuiClearallHelp"]	= "Clique aqui para limpar todos os dados do Enchantrix para o servidor-reino atual.";
		["GuiClearallNote"]	= "para o servidor-facção atual.";
		["GuiDefaultAll"]	= "Resetar Todos as Opções do Enchantrix";
		["GuiDefaultAllButton"]	= "Resetar Tudo";
		["GuiDefaultAllHelp"]	= "Clique aqui para ajustar todas as opções do Enchantrix aos seus valores padrões. ATENÇÃO: Esta não ação NÃO pode ser desfeita.";
		["GuiDefaultOption"]	= "Resetar este ajuste";
		["GuiDELevels"]	= "Exibir níveis de desencanto necessários na dica";
		["GuiDEMaterials"]	= "Exibir informações de materiais de desencanto na dica";
		["GuiEmbed"]	= "Embutir informação numa dica do jogo";
		["GuiLocale"]	= "Ajustar a localidade para";
		["GuiMainEnable"]	= "Ativar Enchantrix";
		["GuiMainHelp"]	= "Contém configurações para o Enchantrix, um AddOn que exibe informações nas dicas dos itens referentes aos resultados de desencantamento daquele determinado item.";
		["GuiOtherHeader"]	= "Outras Opções";
		["GuiOtherHelp"]	= "Opções Diversas do Enchantrix";
		["GuiPrintin"]	= "Selecionar o quadro de mensagem desejado";
		["GuiPrintYieldsInChat"]	= "Exibir produções de itens no bate-papo";
		["GuiShowCraftReagents"]	= "Exibir reagentes de produção nas dicas";
		["GuiTerse"]	= "Ativar modo conciso";
		["GuiValuateAverages"]	= "valorar com as médias do Auctioneer";
		["GuiValuateBaseline"]	= "Valorar com os Dados Internos";
		["GuiValuateEnable"]	= "Ativar Valoração";
		["GuiValuateHeader"]	= "Valoração";
		["GuiValuateMedian"]	= "Valorar com as medianas do Auctioneer";
		["HelpAltChatlink"]	= "Ativa a abertura de dicas clicando num link de item no bate-papo quando a tecla Alt é pressionada.";
		["HelpClear"]	= "Limpa os dados do item especificado (você deve utilizar Shift-Clique para inserir item(s) no comando) Você pode também especificar a palavra-chave especial \"todos\"";
		["HelpDefault"]	= "Ajusta uma opção do Enchantrix para seu valor padrão. Você pode também especificar a palavra-chave especial \"todos\" para ajusta todas as opções do Enchantrix para seus valores padrões.";
		["HelpDisable"]	= "Deixa de carregar automaticamente o Enchantrix na próxima vez que você logar";
		["HelpEmbed"]	= "Embutir o texto na dica original do jogo (nota: algumas funcionalidades estão desativadas quando selecionado)";
		["HelpFindBidauct"]	= "Encontrar leilões nos quais o valor de desencanto possível é uma quantidade de prata menor que o preço da oferta";
		["HelpFindBuyauct"]	= "Encontrar leilões cujo preço de arremate  é uma certa porcentagem menor que o valor de desencanto possível (e, opcionalmente, uma certa quantidade menor que o valor de desencanto)";
		["HelpGuessAuctioneer5Val"]	= "Se a valoração estiver ativada, e você possuir o Auctioneer instalado, exibe o preço de mercado de desencantamento do item.";
		["HelpGuessAuctioneerHsp"]	= "Se a valoração estiver ativada, e você possuir o Auctioneer instalado, exibe a valoração do preço de venda (PVM)  de desencantar o item.";
		["HelpGuessAuctioneerMedian"]	= "Se a valoração estiver ativada, e você possuir o Auctioneer instalado, exibe a valoração baseada na mediana do desencantamento do item.";
		["HelpGuessBaseline"]	= "Se a valoração estiver ativada, (Auctioneer não necessário) exibe a valoração base do desencantamento do item, baseada nos preços embutidos.";
		["HelpGuessNoauctioneer"]	= "Os comandos valoração-pvm e valoração-mediana não estão disponíveis pois você não possui o Auctioneer instalado";
		["HelpLoad"]	= "Altera os ajustes de carregamento do Enchantrix para este quadrinho";
		["HelpLocale"]	= "Altera a localidade que é utilizada para exibir as mensagens do Enchantrix";
		["HelpOnoff"]	= "Liga e desliga a exibição de dados de encantamento";
		["HelpPrintin"]	= "Seleciona em qual janela o Enchantrix enviará suas mensagens. Você pode especificar tanto o nome ou o índice da janela.";
		["HelpShowDELevels"]	= "Seleciona se deve exibir na dica a perícia em encantamento necessária para desencantar o item.";
		["HelpShowDEMaterials"]	= "Seleciona se deve exibir na dica os possíveis materiais recuperados ao desencantar o item.";
		["HelpShowUI"]	= "Exibe ou esconde o painel de congigurações.";
		["HelpTerse"]	= "Ativa/Desativa o modo conciso, exibindo apenas o valor de desencanto. Pode ser anulado segurando pressionada a tecla Ctrl.";
		["HelpValue"]	= "Seleciona se deve exibir os valores estimados dos itens beaseados nas proporções de desencantamento possíveis.";
		["ModTTShow_Help"]	= "Determina o comportamento das dicas. Sempre: Exibir as Dicas do Enchantrix sempre. Quando <mod> é pressionada: Apenas exibe as dicas do Enchantrix se o modificador especificado for pressionado. Quando <mod> não é pressionado: Apenas exibe as dicas do Enchantrix se o modificador especificado não estiver pressionado. Nunca: Nunca exibe as dicas do Enchantrix.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "Você não possui o Auctioneer instalado. O Auctioneer deve estar instalado para realizar um escaneamento de leilões.";
		["AuctionScanVersionTooOld"]	= "Você não possui a versão correta do Auctioneer instalada, este recurso necessita do Auctioneer v4.0 ou maior.";
		["ChatDeletedProfile"]	= "Perfil removido:";
		["ChatDuplicatedProfile"]	= "Perfil duplicado para:";
		["ChatResetProfile"]	= "Resetar todas as configurações para:";
		["ChatSavedProfile"]	= "Perfil salvo:";
		["ChatUsingProfile"]	= "Agora utilizando o perfil:";
		["FrmtAutoDeActive"]	= "AutoDesencantamento ativado";
		["FrmtAutoDeDisabled"]	= "AutoDesencantamento desativado";
		["FrmtAutoDeDisenchantCancelled"]	= "Desencantamento cancelado: item não encontrado";
		["FrmtAutoDeDisenchanting"]	= "Desencantando %s";
		["FrmtAutoDeIgnorePermanent"]	= "Ignorando permanentemente %s";
		["FrmtAutoDeIgnoreSession"]	= "Ignorando %s nesta sessão";
		["FrmtAutoDeInactive"]	= "AutoDesencantamento inativo";
		["FrmtAutoDeMilling"]	= "Triturando %s";
		["FrmtAutoDeMillingCancelled"]	= "Trituração de Ervas cancelada: item não encontrado";
		["FrmtAutoDeProspectCancelled"]	= "Prospecção cancelada: item não encontrado";
		["FrmtAutoDeProspecting"]	= "Prospectando %s";
		["FrmtBidbrokerCurbid"]	= "lanceAtual";
		["FrmtBidbrokerDone"]	= "Quebra de lance realizada";
		["FrmtBidbrokerHeader"]	= "Lances possuindo economia de %s de prata no valor médio de desencantamento (mín %%less = %d):";
		["FrmtBidbrokerLine"]	= "%s, Valorado a: %s, %s: %s, Economia: %s, Menor %s, Tempo: %s";
		["FrmtBidbrokerMinbid"]	= "lanceMínimo";
		["FrmtBidBrokerSkipped"]	= "%d lances ignorados devido ao limite margem de lucro (%d%%)";
		["FrmtBidBrokerSkippedBids"]	= "%d leilões ignorados devido à existência de lances";
		["FrmtPctlessDone"]	= "Porcentagem menor concluída.";
		["FrmtPctlessHeader"]	= "Arremates possuindo economias de %d%% além da média do valor de desencantamento (economia mín = %s):";
		["FrmtPctlessLine"]	= "%s, Valorado e: %s, Arr: %s, Economia: %s, Menor %s";
		["FrmtPctlessSkillSkipped"]	= "%d leilões ignorados devido ao limite de nível de perícia (%s)";
		["FrmtPctlessSkipped"]	= "%d leilões ignorados devido ao limite de lucro (%s)";

		-- Section: Tooltip Messages
		["Click"]	= "Clique";
		["EnxMMTip"]	= "Enchantrix exibe em quais reagentes um item será desencantado, prospectado, ou triturado. Ele também provê integração com o Auctioneer para permitir que decisões de preço e compra sejam feitas.";
		["FrmtBarkerPrice"]	= "Preço do Anunciante(%d%% de margem)";
		["FrmtDEItemLevels"]	= "Desencantável de itens com nível de %d a %d.";
		["FrmtDisinto"]	= "Desencanta em:";
		["FrmtFound"]	= "Descoberto que %s desencanta em:";
		["FrmtFoundNotDisenchant"]	= "Descoberto que %s não é desencantável";
		["FrmtInkFrom"]	= "Criado de %s";
		["FrmtMillingFound"]	= "Descoberto que %s é triturado em:";
		["FrmtMillingValueAuctHsp"]	= "Valor de Trituração (PVM)";
		["FrmtMillingValueAuctMed"]	= "Valor de Trituração (Mediana)";
		["FrmtMillingValueAuctVal"]	= "Valor de Trituração (AucAvançado)";
		["FrmtMillingValueMarket"]	= "Valor de Trituração (Base)";
		["FrmtMillsInto"]	= "Tritura em:";
		["FrmtPriceEach"]	= "(%s cada)";
		["FrmtProspectFound"]	= "Descoberto que %s prospecta em:";
		["FrmtProspectFrom"]	= "Prospectável de %s";
		["FrmtProspectInto"]	= "Prespecta em:";
		["FrmtProspectValueAuctHsp"]	= "Valor de Prospecção (PVM)";
		["FrmtProspectValueAuctMed"]	= "Valor de Prospecção (Mediana)";
		["FrmtProspectValueAuctVal"]	= "Valor de Prospecção (AucAvançado)";
		["FrmtProspectValueMarket"]	= "Valor de Prospecção (Base)";
		["FrmtSuggestedPrice"]	= "Preço sugerido:";
		["FrmtTotal"]	= "Total";
		["FrmtValueAuctHsp"]	= "Valor de Desencantamento (PVM)";
		["FrmtValueAuctMed"]	= "Valor de Desencantamento (Mediana)";
		["FrmtValueAuctVal"]	= "Valor de Desencantamento (AucAvançado)";
		["FrmtValueFixedVal"]	= "Valor de Desencantamento (Fixo)";
		["FrmtValueMarket"]	= "Valor de Desencantamento (Base)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer não carregado, utilizando preços de tabela]";
		["FrmtWarnNoPrices"]	= "[Preços não disponíveis]";
		["FrmtWarnPriceUnavail"]	= "[Alguns preços não disponíveis]";
		["RightClick"]	= "Clique-Direito";
		["ShiftClick"]	= "Shift-Clique";
		["TipOpenConfig"]	= "para editar a configuração.";
		["TipOpenEnchant"]	= "para abrir a janela de Encantamento.";
		["TipOpenJewel"]	= "para abrir a janela de Joalheria.";
		["TooltipMillingLevel"]	= "Trituração de Ervas necessita %d de perícia";
		["TooltipProspectLevel"]	= "Prospecção necessita %d de perícia";
		["TooltipShowDisenchantLevel"]	= "Desencantamento necesita %d de perícia";

		-- Section: User Interface
		["BeanCounterRequired"]	= "BeanCounter é necessário para determinar motivos de compras. Desabilitando o limite de AutoDesencantamento até que o BeanCounter seja instalado.";
		["ExportPriceAucAdv"]	= "Exportar preços do Enchantrix para o Auctioneer Avançado";
		["GuiActivateProfile"]	= "Ativar um perfil atual";
		["GuiAutoDeBoughtForDE"]	= "Apenas itens comprados para desencantamento";
		["GuiAutoDeEnable"]	= "Observar sacos por itens desencantáveis - USE COM PRECAUÇÃO";
		["GuiAutoDeEpicItems"]	= "Auto Desencantar itens épicos (roxos)";
		["GuiAutoDeOptions"]	= "Automacão";
		["GuiAutoDePromptLine1"]	= "Você deseja desencantar:";
		["GuiAutoDePromptLine3"]	= "Valorado a %s";
		["GuiAutoDEPurchaseReason"]	= "Comprado por %s";
		["GuiAutoDeRareItems"]	= "Auto Desencantar itens raros (azuis)";
		["GuiAutoDESuggestion"]	= "Sugestão: %s este item";
		["GuiAutoLootDE"]	= "Saquear automaticamente itens manualmente desencantados, prospectados ou triturados.";
		["GuiAutoMillingPromptLine1"]	= "Você deseja triturar:";
		["GuiAutoProspectPromptLine1"]	= "Você deseja prospectar:";
		["GuiBBUnbiddedOnly"]	= "Restringir BidBroker apenas a itens sem lances";
		["GuiConfigProfiles"]	= "Ajuste, configure e edite perfis";
		["GuiCreateReplaceProfile"]	= "Criar ou substituir um perfil";
		["GuiDefaultBBProfitPercent"]	= "Porcentagem padrão de lucro do BidBroker: %d";
		["GuiDefaultLessHSP"]	= "Porcentagem padrão menor que o PVM: %d";
		["GuiDefaultProfitMargin"]	= "Margem de Lucro Padrão:";
		["GuiDeleteProfileButton"]	= "Remover";
		["GuiDuplicateProfileButton"]	= "Copiar Perfil";
		["GuiFixedSettings"]	= "Preços de reagentes fixos";
		["GuiFixedSettingsNote"]	= "Nota: Estes valores serão utilizados ao invés do Auctioneer ou qualquer outro método de valoração se esta caixa for marcada. Os segguitnes valores ainda são afetados pelos pesos dos reagentes na seção anterior, então se você deseja ter certeza de que o reagente está valorado na quantidade especificada abaixo, então também garanta que seu peso esteja ajustado para 100% na seção de pesos.";
		["GuiGeneralOptions"]	= "Opções gerais do Enchantrix";
		["GuiIgnore"]	= "Ignorar";
		["GuiItemValueAuc4HSP"]	= "Auc4 PVM";
		["GuiItemValueAuc4Median"]	= "Auc4 Mediana";
		["GuiItemValueAuc5Appraiser"]	= "Valor Avaliador do AucAvançado";
		["GuiItemValueAuc5Market"]	= "Valor de Mercado do AucAvançado";
		["GuiItemValueAverage"]	= "Média (padrão)";
		["GuiItemValueBaseline"]	= "Base do Mercado";
		["GuiItemValueCalc"]	= "Valor do item calculado de";
		["GuiMaxBuyout"]	= "Preço de Arremate máximo:";
		["GuiMillingingValues"]	= "Exibir valores de trituração estimados";
		["GuiMillingLevels"]	= "Exibir perícia de trituração necessária na dica";
		["GuiMillingMaterials"]	= "Exibir informações de materiais de trituração na dica";
		["GuiMillingOptions"]	= "Opções de Trituração de Ervas";
		["GuiMinBBProfitPercent"]	= "Porcentagem mínima de lucro do BidBroker: %d";
		["GuiMinimapButtonAngle"]	= "ângulo do botão: %d";
		["GuiMinimapButtonDist"]	= "Distância: %d";
		["GuiMinimapOptions"]	= "Opções de exibição do Minimapa";
		["GuiMinimapShowButton"]	= "Exibir botão do Minimapa";
		["GuiMinLessHSP"]	= "Porcentagem Mínima menor que o PVM: %d";
		["GuiMinProfitMargin"]	= "Margem de Lucro Mínima:";
		["GuiNewProfileName"]	= "Nome do novo perfil:";
		["GuiNo"]	= "Não";
		["GuiPLBBOnlyBelowDESkill"]	= "Apenas exibir itens desencantáveis na perícia atual";
		["GuiPLBBSettings"]	= "Configurações Sem Porcentagem e BidBroker";
		["GuiProspectingLevels"]	= "Exibir necessidade de perícia em prospecção na dica";
		["GuiProspectingMaterials"]	= "Exibir informações de prospecção de materiais na dica";
		["GuiProspectingOptions"]	= "Opções de Prospecção";
		["GuiProspectingValues"]	= "Exibir valores de prospecção estimados";
		["GuiResetProfileButton"]	= "Resetar";
		["GuiSaveProfileButton"]	= "Salvar";
		["GuiShowMatSources"]	= "Exibir fontes de materiais para itens obtidos por desencantamento, prospecção e trituração.";
		["GuiShowMilling"]	= "Exibir dados de Trituração para ervas";
		["GuiShowProspecting"]	= "Exibir dados de Prospecção para minérios";
		["GuiTabAuctions"]	= "Leilões";
		["GuiTabFixed"]	= "Valor Fixo";
		["GuiTabGeneral"]	= "Geral";
		["GuiTabMilling"]	= "Trituração";
		["GuiTabProfiles"]	= "Perfis";
		["GuiTabProspecting"]	= "Prospecção";
		["GuiTabWeights"]	= "Pesos";
		["GuiValueOptions"]	= "Opções de Exibição de Valores";
		["GuiValueShowAuc4HSP"]	= "Exibir valores de PVM do Auctioneer";
		["GuiValueShowAuc4Median"]	= "Exibir valores de mediana do Auctioneer";
		["GuiValueShowAuc5Market"]	= "Exibir valore de mercado do Auctioneer";
		["GuiValueShowBaseline"]	= "Exibir valores base internos";
		["GuiValueShowDEValues"]	= "Exibir valores de desencantamento estimados";
		["GuiValueTerse"]	= "Exibir valor de desencantamento conciso";
		["GuiWeighSettingsNote"]	= "Os pesos acima alteram a valoração do reagente selecionado pela quantidade especificada. Geralmente você deve deixar eles em 100% a não ser que acredite que eles devam ser mais ou menos valiosos do que o método de valoração que está utilizando diz.";
		["GuiWeightSettings"]	= "Desejo do reagente de desencantamento";
		["GuiYes"]	= "Sim";
		["ModTTShow"]	= "Exibir Dica:";
		["ModTTShow_alt"]	= "Quando o Alt estiver pressionado";
		["ModTTShow_always"]	= "Sempre";
		["ModTTShow_ctrl"]	= "Quando o Ctrl estiver pressionado";
		["ModTTShow_never"]	= "Nunca";
		["ModTTShow_noalt"]	= "Quando o Alt não estiver pressionado";
		["ModTTShow_noctrl"]	= "Quando o Ctrl não estiver pressionado";
		["ModTTShow_noshift"]	= "Quando o Shift estiver pressionado";
		["ModTTShow_shift"]	= "Quando o Shift estiver pressionado";

}
