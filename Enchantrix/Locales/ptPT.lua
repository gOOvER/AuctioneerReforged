--[[
	Enchantrix - Localization (ptPT)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.ptPT = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "A limpar toda a informação de enchanting";
		["FrmtActClearFail"]	= "Impossível encontrar objecto: %s";
		["FrmtActClearOk"]	= "Informação eliminada do objecto: %s";
		["FrmtActDefault"]	= "%s do Enchantrix voltaram às definições padrão";
		["FrmtActDefaultAll"]	= "Todas as opções Enchantrix revertidas para o normal.";
		["FrmtActDisable"]	= "Não está a ser mostrada informação do objecto %s";
		["FrmtActEnable"]	= "Está a ser mostrada informação do objecto %s";
		["FrmtActSet"]	= "Definir %s para '%s'";
		["FrmtActUnknown"]	= "Comando de palavra-chave desconhecido: '%s'";
		["FrmtActUnknownLocale"]	= "A localização dada ('%s') nao foi encontrada. Localizações válidas são:";
		["FrmtPrintin"]	= "Mensagens do Enchantrix vão ser mostradas no chat \"%s\"";
		["FrmtUsage"]	= "Uso:";
		["MesgDisable"]	= "A desactivar o carregamento automático do Enchantrix";
		["MesgNotloaded"]	= "Enchantrix não está carregado.  Escreva /enchantrix para mais informações.";

		-- Section: Command Options
		["CmdClearAll"]	= "todos";
		["OptClear"]	= "[Objecto]|todos";
		["OptDefault"]	= "(<opção>|todos)";
		["OptFindBidauct"]	= "<prata>";
		["OptFindBuyauct"]	= "<percentagem>";
		["OptLocale"]	= "<local>";
		["OptPrintin"]	= "(<frameIndex>[Número]<frameName>[Corda])";

		-- Section: Commands
		["CmdClear"]	= "apagar";
		["CmdDefault"]	= "por defeito";
		["CmdDisable"]	= "desactivar";
		["CmdHelp"]	= "ajuda";
		["CmdLocale"]	= "localização";
		["CmdOff"]	= "desligado";
		["CmdOn"]	= "ligado";
		["CmdPrintin"]	= "imprimir em";
		["CmdToggle"]	= "alternar";
		["ConfigUI"]	= "configuração";
		["ShowDELevels"]	= "níveis";
		["ShowDEMaterials"]	= "materiais";
		["ShowEmbed"]	= "embebido";
		["ShowGuessAuctioneerMed"]	= "valor médio";
		["ShowGuessAuctioneerVal"]	= "valor estimado";
		["ShowGuessBaseline"]	= "valor base";
		["ShowTerse"]	= "breve";
		["ShowUI"]	= "ver";
		["ShowValue"]	= "avaliar";
		["StatOff"]	= "Informação do encantamento escondida";
		["StatOn"]	= "Informação configurada do encantamento ligada";

		-- Section: Config Text
		["GuiLoad"]	= "A carregar Enchantrix";
		["GuiLoad_Always"]	= "sempre";
		["GuiLoad_Never"]	= "nunca";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Maceração";
		["ArgSpellname"]	= "Desencantar";
		["ArgSpellProspectingName"]	= "Pesquisador";
		["Enchanting"]	= "Encantar";
		["Inscription"]	= "Inscrição";
		["Jewelcrafting"]	= "Joalharia";
		["PatReagents"]	= "Reagentes: (.+)";
		["TextCombat"]	= "Combate";
		["TextGeneral"]	= "Geral";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(vai a  para partilhares a tua informação)";
		["FrmtWelcome"]	= "Enchantrix v%s carregado";
		["MesgAuctVersion"]	= "Enchantrix requer a versão 3.4 do Auctioneer ou mais elevado. Algumas características serão desligadas até que você actualize sua instalação do Auctioneer.";

		-- Section: Help Text
		["GuiClearall"]	= "Limpar toda a informação do Enchantrix";
		["GuiClearallButton"]	= "Limpar tudo";
		["GuiClearallHelp"]	= "Carrega aqui para limpar toda a informação do Enchantrix do servidor actual.";
		["GuiClearallNote"]	= "para o servidor/facção actual";
		["GuiDefaultAll"]	= "Limpar todas as opções do Enchantrix";
		["GuiDefaultAllButton"]	= "Limpar tudo";
		["GuiDefaultAllHelp"]	= "Clique aqui para voltar às definições padrão do Enchantrix. ATENÇÃO: Esta acção NÃO é reversível.";
		["GuiDefaultOption"]	= "Limpar esta definição";
		["GuiDELevels"]	= "Mostrar requerimentos de nivel na janela de ajuda.";
		["GuiDEMaterials"]	= "Mostrar informação dos materiais na janela de ajuda.";
		["GuiEmbed"]	= "Informação embebida na janela de ajuda do jogo";
		["GuiLocale"]	= "Definir localização para";
		["GuiMainEnable"]	= "Activar Enchantrix";
		["GuiMainHelp"]	= "Contém definições para o Enchantrix, um AddOn que mostra informação na tooltip dos objectos com possíveis resultados de desencantamento do dito objecto.";
		["GuiOtherHeader"]	= "Outras Opções";
		["GuiOtherHelp"]	= "Outras Opções do Enchantrix";
		["GuiPrintin"]	= "Seleccionar a expressão desejada da mensagem";
		["GuiPrintYieldsInChat"]	= "Mostrar ganhos dos objectos no chat.";
		["GuiShowCraftReagents"]	= "Mostar reagentes de profissão in dicas";
		["GuiTerse"]	= "Ligar modo breve";
		["GuiValuateAverages"]	= "Validar com as médias Auctioneer";
		["GuiValuateBaseline"]	= "Validar com a Data Padrão";
		["GuiValuateEnable"]	= "Activar Validação";
		["GuiValuateHeader"]	= "Validação";
		["GuiValuateMedian"]	= "Validar com os Números Médios Auctioneer";
		["HelpClear"]	= "Limpar a informação específica de um objecto (tem de carregar shift+click o objecto no comando) Também podes especificar a palavra especial \"Todos\"";
		["HelpDefault"]	= "Aplicar uma opção do Enchantrix para o seu Padrão. Também podes especificar a palavra especial \"Todos\" para por todos as opções Padrão.";
		["HelpDisable"]	= "Proíbir o Enchantrix de se ligar da próxima vez que entrar no jogo";
		["HelpEmbed"]	= "Encaixar o texto no tooltip original do jogo (nota: determinadas características são desligadas quando esta opção é selecionada)";
		["HelpFindBidauct"]	= "Encontrar os leilões cujo possível valor do desencanto é uma determinada quantidade de prata menos do que o preço de oferta";
		["HelpFindBuyauct"]	= "Encontrar os auctions cujo possível valor de desencanto é um determinado por cento menos do que o preço compra directa";
		["HelpGuessAuctioneer5Val"]	= "Se a evaluação está ligada, e o Auctioneer está instalado, mostra o valor de mercado de desencantar o objecto.";
		["HelpGuessAuctioneerHsp"]	= "Se a validação estiver permitida, e você tiver o Auctioneer instalado, indicar o preço de venda (HSP) de disencanto do artigo.";
		["HelpGuessAuctioneerMedian"]	= "Se a validação estiver permitida, e você tiver o Auctioneer instalado, indicar o valor baseado mediano de disencanto do artigo.";
		["HelpGuessBaseline"]	= "Se a validação for permitida, (Auctioneer não necessitado) indicar o valor da linha de base de disencanto do artigo, baseado nos preços inbutidos.";
		["HelpGuessNoauctioneer"]	= "Se a validação for permitida, (Auctioneer não necessitado) indicar o valor da linha de base de disencanto do artigo, baseado nos preços inbutidos";
		["HelpLoad"]	= "Mudar as opções de carregamento para este personagem";
		["HelpLocale"]	= "Mudar a localização que é usada para mostrar as mensagens do Enchantrix";
		["HelpOnoff"]	= "Liga e Desliga a exposição de dados do Enchant";
		["HelpPrintin"]	= "Selecionar em que janela o Enchantrix irá imprimir as suas mensagens. Poderás expecificar o nome da janela ou o inicio da janela.";
		["HelpShowDELevels"]	= "Selecciona se deve mostrar o nivel necessário de encantamento para desencantar o objecto, na janela de ajuda.";
		["HelpShowDEMaterials"]	= "Selecciona se deve mostrar os materiais possiveis de obter, desencantando o item, na janela de ajuda.";
		["HelpShowUI"]	= "Mostrar ou esconder o painel de configuração.";
		["HelpTerse"]	= "Ligar/Desligar o modo breve, mostrando somente o valor de desencantamento. Pode ser forçado segurando na tecla Ctrl.";
		["HelpValue"]	= "Seleccionar se quer ver os valores estimados baseados em proporções dos possiveis desencantos.";
		["ModTTShow_Help"]	= "Esta opção vai mostar dicas extras no Enchantrix somente se ALT tiver sido pressionado.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "O Auctioneer não está instalado. Para efectuar a pesquisa dos leilões o Auctioneer tem que ser instalado.";
		["AuctionScanVersionTooOld"]	= "Versão incorrecta do Auctioneer instalado, esta funcionalidade requer o Auctioneer v4.0 or superior.";
		["ChatDeletedProfile"]	= "Perfil apagado:";
		["ChatDuplicatedProfile"]	= "Duplicar perfil para:";
		["ChatResetProfile"]	= "Limpar todas as configurações para:";
		["ChatSavedProfile"]	= "Perfil guardado:";
		["ChatUsingProfile"]	= "Utilizando o perfil:";
		["FrmtAutoDeActive"]	= "Desencantamento automático activo";
		["FrmtAutoDeDisabled"]	= "Desencantamento automático desactivado";
		["FrmtAutoDeDisenchantCancelled"]	= "Desencantamento cancelado: objecto não encontrado";
		["FrmtAutoDeDisenchanting"]	= "Desencantando %s";
		["FrmtAutoDeIgnorePermanent"]	= "Ignorando %s permanentemente";
		["FrmtAutoDeIgnoreSession"]	= "Ignorando %s esta sessão";
		["FrmtAutoDeInactive"]	= "Desencantamento automático inactivo";
		["FrmtAutoDeMilling"]	= "Maceração %s";
		["FrmtAutoDeMillingCancelled"]	= "Maceração cancelada: item não encontrado";
		["FrmtAutoDeProspectCancelled"]	= "Pesquisa cancelada: item não encontrado";
		["FrmtBidbrokerCurbid"]	= "Ofcur";
		["FrmtBidbrokerDone"]	= "Oferta do corrector feita";
		["FrmtBidbrokerHeader"]	= "As ofertas que têm as economias de prata de %s na média do valor disencanto:";
		["FrmtBidbrokerLine"]	= "%s, Avaliado em: %s, %s: %s, Excepto: %s, Menos %s, Tempo: %s";
		["FrmtBidbrokerMinbid"]	= "Ofmin";
		["FrmtPctlessDone"]	= "Percentagem menos feito";
		["FrmtPctlessHeader"]	= "As Compras Directas que têm excesso do artigo médio das economias de %d%% do valor do desencanto:";
		["FrmtPctlessLine"]	= "%s, Avaliado em: %s, BO: %s, Excepto: %s, Menos %s";

		-- Section: Tooltip Messages
		["FrmtBarkerPrice"]	= "Preço de Vendedor (%d%% margem)";
		["FrmtDisinto"]	= "Desencanta em:";
		["FrmtFound"]	= "Observado que %s desencanta em:";
		["FrmtPriceEach"]	= "(%s cada)";
		["FrmtSuggestedPrice"]	= "Preço sugerido:";
		["FrmtTotal"]	= "Total";
		["FrmtValueAuctHsp"]	= "Valor do Desencanto (MPV)";
		["FrmtValueAuctMed"]	= "Valor do Desencanto (Números médios)";
		["FrmtValueMarket"]	= "Valor de Disencanto (Referência)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer não carregado, usando preços em cache]";
		["FrmtWarnNoPrices"]	= "[Nenhuns Preços Disponiveis]";
		["FrmtWarnPriceUnavail"]	= "[Alguns preços indisponiveis]";

}
