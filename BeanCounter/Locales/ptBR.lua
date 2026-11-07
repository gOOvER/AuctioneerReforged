--[[
	BeanCounter - Localization (ptBR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.ptBR = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "Configuração do BeanCounter";
		["C_BeanCounterDatabaseMaintenance"]	= "Manutenção do banco de dados do BeanCounter";
		["C_BeanCounterOptions"]	= "Opções do BeanCounter";
		["C_ColorizeSearch"]	= "Adicionar um gradiente de cor de cada resultado na janela de pesquisa";
		["C_DatabaseLength"]	= "Determina quanto tempo BeanCounter salvará as transações da Casa de Leilões";
		["C_DataMaintenance"]	= "Manutenção dos Dados";
		["C_DateString"]	= "Formato da Data para usar:";
		["C_DateStringExample"]	= "Data de Exemplo:";
		["C_ExtenalSearch"]	= "Permitir que Addons externos usem a Busca do BeanCounter";
		["C_MailInvoiceTimeout"]	= "Tempo de espera do correio = %d segundos";
		["C_MailRecolor"]	= "Método de Recolorização do Correio";
		["C_ModTTShow"]	= "Exibir tooltip extra somente se Alt for pressionado.";
		["C_MonthsToKeep"]	= "Quantos meses de dados manter?";
		["C_OpacityLevel"]	= "Opacidade";
		["C_Resortascendingtime"]	= "Ordenar todas as entradas por tempo em ordem crescente";
		["C_ResortDatabase"]	= "Reorganizar Base de Dados";
		["C_ScanDatabase"]	= "Escanear base de dados por erros: Usar somente se você tiver erros quando procurar no BeanCounter. Faça um backup das variáveis salvas do BeanCounter antes de usar.";
		["C_SearchConfiguration"]	= "Configuração de Busca";
		["C_SendToSearch"]	= "Adicionar item buscado no BeanCounter na janela principal da Casa de Leilões?";
		["C_ShowBeginnerTooltips"]	= "Mostrar tooltips iniciais ao passar o mouse em cima";
		["C_ShowReasonPurchase"]	= "Mostrar motivo da compra no tooltip";
		["C_ValidateDatabase"]	= "Validar Base de Dados";

		-- Section: Generic Strings
		["NoRe-Color"]	= "Não Recolorir";
		["off"]	= "desl";
		["Ok"]	= "Ok";
		["on"]	= "lig";
		["Re-ColorIcons"]	= "Recolorir ícones";
		["Re-ColorIconsandText"]	= "Recolorir Ícones e Texto";
		["Re-ColorText"]	= "Recolorir Texto";
		["TooltipFailed"]	= "Incapaz de pegar Informações da Dica";
		["UiNeutralCheckBox"]	= "Exibir dados neutros";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter armazenará o motivo que um item foi comprado e mostrará no tooltip.";
		["A_DateString"]	= "Isto controla como o campo de Data da interface do BeanCounter  é mostrada. Comandos são precedidos por % e múltiplos comandos e textos podem ser misturados. Por exemplo %a == %X mostraria Qua == 21:34:21";
		["A_DateStringCommands"]	= "Comandos: \n %a = abrev. dia da semana, \n %A = dia da semana, \n %b = abrev. nome do mês, \n %B = nome do mês,\n %c = data e hora, \n %d = dia do mês (01-31),\n %H = hora (24), \n %I = hora (12),\n %M = minuto, \n %m = mês,\n %p = am/pm, \n %S = segundo,\n %U = número da semana do ano ,\n %w = número do dia da semana(0-6),\n %x = data, \n %X = tempo,\n %Y = ano cheio (2007), \n %y = ano em 2 digitos (07)";
		["A_ExtenalSearch"]	= "Outros addons podem aproveitar a busca do BeanCounter por um item e solicitar que o objeto se mostre na interface do BeanCounter. Por exemplo, isto permite que o BeanCounter mostre quais itens você está procurando no Appraiser de forma automática";
		["A_MailInvoiceTimeout"]	= "A quantidade de tempo que o BeanCounter irá esperar para que o servidor responda a requisição da fatura. Uma fatura é o \"quem\", \"que\" e \"como\" de uma mensagem da Casa de Leilões.";
		["A_MailRecolor"]	= "BeanCounter lê todos os correios da Casa de Leilões. Esta opção diz ao BeanCounter como o usuário quer recolorir as mensagens para fazê-las parecer não lidas.";
		["HelpGuiItemBox"]	= "Arraste o item na caixa para buscar.";
		["Q_BeanCountersTooltip"]	= "O que é o Tooltip do BeanCounter";
		["Q_DateString"]	= "Formatos de Data para usar?";
		["Q_DateStringCommands"]	= "Comandos de Data Aceitáveis?";
		["Q_ExtenalSearch"]	= "Permitir que addons externos usem o BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "O que é o tempo de espera do correio?";
		["Q_MailRecolor"]	= "O que é o Método de Recolorir Correio?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Número máximo de resultados mostrados (de cada base de dados)";
		["TTDataExpireEnabled"]	= "Dados mais velhos que a faixa de tempo selecionada serão APAGADOS";
		["TT_ColorizeSearch"]	= "Esta opção muda a cor da linha dos itens na janela de busca do BeanCounter.";
		["TT_MaxDisplayedResults"]	= "Isto controla o número total de resultados mostrados.";
		["TT_neutralCheck"]	= "Mostra resultados da Casa de Leilões neutra";
		["TT_OpacityLevel"]	= "Controla o nível de opacidade das barras coloridas na janela de busca do BeanCounter (se ativado)";
		["TT_sendtosearch"]	= "Quando entra uma busca no BeanCounter, também adiciona o texto na janela da Casa de Leilões.";

		-- Section: Interface
		["Cancelled"]	= "Cancelado";
		["UiAucCancelled"]	= "Leilão Cancelado";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Casa de Leilões da Aliança";
		["MailHordeAuctionHouse"]	= "Casa de Leilões da Horda";
		["MailNeutralAuctionHouse"]	= "Casa de Leilões de Aguanegra";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Entre o formato que você gostaria que o campo de data fosse mostrado. O padrão é %c.";
		["TTDateStringExample"]	= "Mostra um exemplo de como será sua data formatada.";
		["TTExtenalSearch"]	= "Quando entrar uma busca em outro addon, BeanCounter também irá mostrar uma busca para este item.";
		["TTMailInvoiceTimeout"]	= "Escolha quanto tempo BeanCounter tentará recuperar uma fatura do correio do servidor antes de desistir. Mais baixo == mais rápido, porém tem mais chance de dados incompletos. Mais alto == mais lento, porém aumenta a chance de recuperar os dados se o servidor de correio está extremamente ocupado.";
		["TTMailRecolor"]	= "Escolha como o correio vai aparecer depois que o BeanCounter escanear a Caixa de Correio.";
		["TTModTTShow"]	= "Esta opção irá mostrar o tooltip extra do BeanCounter somente se o Alt for pressionado.";
		["TTOpenconfig"]	= "Abre a janela de configuração do BeanCounter";
		["TTResort Database"]	= "Isto escaneará os Dados do Beancounter e organizará todas as entradas em ordem ascendente. Isto ajuda a aumentar a velocidade das funções de compressão do banco de dados.";
		["TTShowBeginnerTooltips"]	= "Exibe as dicas de iniciante ao passar do mouse.";
		["TTShowReasonPurchase"]	= "Liga a IU de pesquisa para motivo de um item ter sido comprado na dica.";
		["TTValidateDatabase"]	= "Sito varrerá os Dados do Beancounter e tentaqrá corrigir quaisquer erros que possa encontrar. Utilize se está recebendo erros ao pesquisar.";
		["TT_AuctionCheck"]	= "Exibe itens vendidos na Casa de Leilões.";
		["TT_AuctionFailedCheck"]	= "Exibir itens que você falhou em vender.";
		["TT_BeanCounterAHTab"]	= "Clique-direito para exibir o BeanCounter numa janela externa.";
		["TT_BeanCounterSelectBox"]	= "Filtrar resultados de pesquisa por servidors, jogador ou facção.";
		["TT_BidCheck"]	= "Exibir itens comprados na casa de Leilões.";
		["TT_BidFailedCheck"]	= "Exibir itens nos quais você foi superdo.";
		["TT_ClassicCheck"]	= "Exibir resultados do Banco de Dados Clássico do Beancounter.";
		["TT_ExactCheck"]	= "Apenas corresponder o texto exato na caixa de pesquisa.";
		["TT_ItemIconBox"]	= "Solte um item aqui para começar uma pesquisa por ele. Exibe o ícone de pesquisa atual se possível.";
		["TT_ScrollHeader"]	= "\nCliqueDireito+Arraste para Mover ALT+CliqueDireito para Redimensionar CTRL+CliqueDireito para Resetar";
		["TT_SearchBox"]	= "Digite as consultas de pesquisa aqui ou deixe em branco para pesquisar tudo";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeacnCounter: Banco de Dados do Histórico de Leilões";
		["UiAucExpired"]	= "Leilão Expirado";
		["UiAucSuccessful"]	= "Leilão bem-sucedido";
		["UiAuctions"]	= "Leilões";
		["UiAuctionTransaction"]	= "Leilão";
		["UiBids"]	= "Lances";
		["UiBidTransaction"]	= "Lance";
		["UiBuyerSellerHeader"]	= "Comprador/Vendedor";
		["UiBuyTransaction"]	= "Compra";
		["UiClassicCheckBox"]	= "Exibir dados clássicos do BC.";
		["UiData"]	= "Dados";
		["UiDateHeader"]	= "Data";
		["UiDepositTransaction"]	= "Depósito";
		["UiDone"]	= "Pronto";
		["UiExactNameSearch"]	= "Busca por nome exato";
		["UiFailedAuctions"]	= "Leilões Falhados";
		["UiFee"]	= "Taxa";
		["UiMailFrameRecording"]	= "O BeanCounter está registrando seu correio";
		["UiMailFrameWait1"]	= "Por favor não feche a janela de correio ou";
		["UiMailFrameWait2"]	= "Itens de Leilão não serão registrados";
		["UiNameHeader"]	= "Item";
		["UiNetHeader"]	= "Líq";
		["UiNetPerHeader"]	= "Líq Por";
		["UiOutbid"]	= "Superar";
		["UiOutbids"]	= "Lances superados";
		["UiPriceHeader"]	= "Preço";
		["UiPriceper"]	= "Preço/Por";
		["UiPricePerHeader"]	= "Cabeçalho de Preço";
		["UiPurchases"]	= "Compras";
		["UiQuantityHeader"]	= "Qtde";
		["UiReason"]	= "Motivo";
		["UiSales"]	= "Vendas";
		["UiSearch"]	= "Pesquisa";
		["UiSearchForLabel"]	= "Pesquisar por:";
		["UiSellTransaction"]	= "Vender";
		["UiServer"]	= "Servidor";
		["UiTransactions"]	= "Transações";
		["UiTransactionsLabel"]	= "Transações:";
		["UiTransactionTypeHeader"]	= "Tipo";
		["UiWealth"]	= "Vida";
		["UiWononBid"]	= "Ganhos nos Lances";
		["UiWononBuyout"]	= "Ganhos no Arremate";

}
