--[[
	Enchantrix - Localization (esES)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

EnchantrixLocalizations = EnchantrixLocalizations or {}
EnchantrixLocalizations.esES = {

		-- Section: Command Messages
		["FrmtActClearall"]	= "Eliminando toda información de encantamientos";
		["FrmtActClearFail"]	= "Imposible encontrar artí­culo: %s";
		["FrmtActClearOk"]	= "Información eliminada para el artí­culo: %s";
		["FrmtActDefault"]	= "La opción %s de Enchantrix ha sido reestablecida a sus ajustes por defecto.";
		["FrmtActDefaultAll"]	= "Todas las opciones de Enchantrix han sido reestablecidas a sus ajustes por defecto.";
		["FrmtActDisable"]	= "Ocultando información del artículo: %s";
		["FrmtActEnable"]	= "Mostrando información del artí­culo: %s";
		["FrmtActSet"]	= "%s establecido a '%s'";
		["FrmtActUnknown"]	= "Comando o palabra clave desconocida: '%s'";
		["FrmtActUnknownLocale"]	= "La localización que has especificado ('%s') no es válida. Las localizaciones válidas son:";
		["FrmtPrintin"]	= "Los mensajes de Enchantrix se imprimirán en la ventana de chat \"%s\"";
		["FrmtUsage"]	= "Uso:";
		["MesgDisable"]	= "Desactivando la carga automática de Enchantrix";
		["MesgNotloaded"]	= "Enchantrix no está cargado. Escriba /enchantrix para más información.";

		-- Section: Command Options
		["CmdClearAll"]	= "todo";
		["OptClear"]	= "([Item]|todo)";
		["OptDefault"]	= "(<opción>|todo)";
		["OptFindBidauct"]	= "<dinero>";
		["OptFindBuyauct"]	= "<porcentaje>";
		["OptLocale"]	= "<localización>";
		["OptPrintin"]	= "(<indiceVentana>[Número]|<nombreVentana>[Serie])";

		-- Section: Commands
		["CmdClear"]	= "borrar";
		["CmdDefault"]	= "original";
		["CmdDisable"]	= "deshabilitar";
		["CmdFindBidauct"]	= "corredorofertas";
		["CmdFindBidauctShort"]	= "co";
		["CmdFindBuyauct"]	= "porcientomenos";
		["CmdFindBuyauctShort"]	= "pm";
		["CmdHelp"]	= "ayuda";
		["CmdLocale"]	= "localidad";
		["CmdOff"]	= "apagado";
		["CmdOn"]	= "prendido";
		["CmdPrintin"]	= "imprimir-en";
		["CmdToggle"]	= "invertir";
		["ConfigUI"]	= "configurar";
		["ShowDELevels"]	= "niveles";
		["ShowDEMaterials"]	= "materiales";
		["ShowEmbed"]	= "integrar";
		["ShowGuessAuctioneerHsp"]	= "valorizar-pmv";
		["ShowGuessAuctioneerMed"]	= "valorizar-mediano";
		["ShowGuessAuctioneerVal"]	= "Evaluar-valor";
		["ShowGuessBaseline"]	= "valorizar-referencia";
		["ShowTerse"]	= "conciso";
		["ShowUI"]	= "mostrar";
		["ShowValue"]	= "valorizar";
		["StatOff"]	= "Ocultando toda información de los desencantamientos";
		["StatOn"]	= "Mostrando datos de encantamiento configurados.";

		-- Section: Config Text
		["GuiLoad"]	= "Cargar Enchantrix";
		["GuiLoad_Always"]	= "siempre";
		["GuiLoad_Never"]	= "nunca";

		-- Section: Game Constants
		["ArgSpellMillingName"]	= "Moler";
		["ArgSpellname"]	= "Desencantar";
		["ArgSpellProspectingName"]	= "Prospectar";
		["Enchanting"]	= "Encantamiento";
		["Inscription"]	= "Inscripción";
		["Jewelcrafting"]	= "Joyería";
		["PatReagents"]	= "Componentes:(.+)";
		["TextCombat"]	= "Combate";
		["TextGeneral"]	= "General";

		-- Section: Generic Messages
		["FrmtCredit"]	= "(ve a  para comparti­r tu información)";
		["FrmtWelcome"]	= "Enchantrix versión %s cargado";
		["MesgAuctVersion"]	= "Enchantrix requiere la versión 3.4 o mayor de Auctioneer. Algunas características no estarán disponibles hasta que actualices tu instalación de Auctioneer.";

		-- Section: Help Text
		["GuiAltChatlink"]	= "Mostrar herramientas desde los links del chat pulsando Alt-Click-Izquierdo";
		["GuiClearall"]	= "Elimina toda la información de Enchantrix";
		["GuiClearallButton"]	= "Eliminar Todo";
		["GuiClearallHelp"]	= "Clic aquí para eliminar toda la información de Enchantrix sobre el reino-facción actual.";
		["GuiClearallNote"]	= "para el reino-facción actual.";
		["GuiDefaultAll"]	= "Reestablece todas las opciones de Enchantrix";
		["GuiDefaultAllButton"]	= "Reestablecer Todo";
		["GuiDefaultAllHelp"]	= "Clic aquí para establecer todas las opciones de Auctioneer a sus valores por defecto. ADVERTENCIA: Esta acción NO es reversible.";
		["GuiDefaultOption"]	= "Reestablece esta opción";
		["GuiDELevels"]	= "Mostrar los requerimientos de nivel de desencanto en la descripción";
		["GuiDEMaterials"]	= "Mostrar informacion de los materiales desencantados en la caja de ayuda";
		["GuiEmbed"]	= "Integra la información en la caja de ayuda";
		["GuiLocale"]	= "Establece la localización a";
		["GuiMainEnable"]	= "Activa Enchantrix";
		["GuiMainHelp"]	= "Contiene ajustes para Enchantrix, un accesorio que muestra información en la caja de ayuda de objetos sobre el desencantamiento del objeto en cuestión.";
		["GuiOtherHeader"]	= "Otras Opciones";
		["GuiOtherHelp"]	= "Otras Opciones de Enchantrix";
		["GuiPrintin"]	= "Selecciona la ventana deseada";
		["GuiPrintYieldsInChat"]	= "Mostrar rendimientos de los items en el chat";
		["GuiShowCraftReagents"]	= "Mostrar creaciones reactivas en ventanas";
		["GuiTerse"]	= "Activa el modo conciso";
		["GuiValuateAverages"]	= "Valora con Promedios de Auctioneer";
		["GuiValuateBaseline"]	= "Valora con la información integrada";
		["GuiValuateEnable"]	= "Activa Valoración";
		["GuiValuateHeader"]	= "Valoración";
		["GuiValuateMedian"]	= "Valora con Promedios de Auctioneer";
		["HelpAltChatlink"]	= "Habilita el abrir una herramienta haciendo Click-Izquierdo en el link de un item en el chat mientras la tecla Alt esta siendo presionada";
		["HelpClear"]	= "Elimina la información sobre el objeto especificado (debes usar clic-mayúsculas para incluir el/los objeto(s) en el comando) También puedes especificar las palabra clave \"todo\"";
		["HelpDefault"]	= "Establece una opción de Enchantrix a su valor por defecto. También puedes especificar la palabra clave especial \"todo\" para establecer todas las opciones de Enchantrix a sus valores por defecto.";
		["HelpDisable"]	= "Impide que Enchantrix se cargue automáticamente la próxima vez que te conectes";
		["HelpEmbed"]	= "Inserta el texto en la caja de ayuda original del juego (nota: algunas características se desactivan cuando esta opción es seleccionada)";
		["HelpFindBidauct"]	= "Encuentra subastas en las que el valor de desencantamiento posible es una cantidad de dinero menor que el precio de puja";
		["HelpFindBuyauct"]	= "Encuentra subastas en las que el precio de compra es un porcentaje menor que el valor de desencantamiento posible (y, opcionalmente, una cantidad menor que el valor de desenctanemiento)";
		["HelpGuessAuctioneer5Val"]	= "Si la valoración está activada y tienes Auctioneer instalado, muestra el valor de mercado del desencantamiento del objeto.";
		["HelpGuessAuctioneerHsp"]	= "Si la valoración está activada y tienes Auctioneer instalado, muestra la valoración del precio de venta (PMV) al desencantar el objeto.";
		["HelpGuessAuctioneerMedian"]	= "Si la valoración está activada y tienes Auctioneer instalado, muestra la valoración basada en promedios al desencantar el objeto.";
		["HelpGuessBaseline"]	= "Si la valoración está activada (no se necesita Auctioneer) muestra la valoración base al desencantar el objeto, basado en los precios integrados.";
		["HelpGuessNoauctioneer"]	= "Los comandos valorar-pmv y valorar-promedio no están disponibles porque no tienes Auctioneer instalado";
		["HelpLoad"]	= "Cambia las opciones de carga de Enchantrix para este personaje";
		["HelpLocale"]	= "Cambia la localización que es usada para mostrar los mensajes de Enchantrix";
		["HelpOnoff"]	= "Activa y desactiva la visualización de la información de encantamientos";
		["HelpPrintin"]	= "Determina en qué ventana se imprimen los mensajes d eEnchantrix. Puedes especificar el nombre de la ventana o su índice.";
		["HelpShowDELevels"]	= "Seleccione si desea mostrar la habilidad de encantamiento necesaria para desencantar el objeto en forma de mensaje.";
		["HelpShowDEMaterials"]	= "Seleccione si desea mostrar los posibles materiales dados por desencantar un objeto en forma de mensaje.";
		["HelpShowUI"]	= "Mostrar u ocultar el panel de configuración.";
		["HelpTerse"]	= "Activa y desactiva el modo conciso, mostrando solo el valor de los desencantamientos. Puede ser desactivado temporalmente manteniendo pulsada la tecla Control.";
		["HelpValue"]	= "Determina si se muestran los valores de objeto estimados basados en las proporciones de los posibles desencantamientos";
		["ModTTShow_Help"]	= "Con esta opción solo se mostrará el globo de ayuda extra de Enchantrix si Alt está pulsado.";

		-- Section: Report Messages
		["AuctionScanAuctNotInstalled"]	= "No tienes Auctioneer instalado. Auctioneer debe estar installado para escanear la subasta.";
		["AuctionScanVersionTooOld"]	= "No tienes la versión correcta de Auctioneer instalada, esta caracteristica requiere Auctioneer v4.0 o superior.";
		["ChatDeletedProfile"]	= "Eliminado perfil:";
		["ChatDuplicatedProfile"]	= "Duplicado perfil a:";
		["ChatResetProfile"]	= "Reiniciar todas las configuraciones para:";
		["ChatSavedProfile"]	= "Perfil salvado:";
		["ChatUsingProfile"]	= "Usando el perfil:";
		["FrmtAutoDeActive"]	= "AutoDesencantar activo";
		["FrmtAutoDeDisabled"]	= "AutoDesencantar desactivado";
		["FrmtAutoDeDisenchantCancelled"]	= "Desencantar cancelado: no se encuentra el objeto";
		["FrmtAutoDeDisenchanting"]	= "Desencantando %s";
		["FrmtAutoDeIgnorePermanent"]	= "Ignorando %s permanentemente";
		["FrmtAutoDeIgnoreSession"]	= "Ignorando %s durante esta sesión";
		["FrmtAutoDeInactive"]	= "AutoDesencantar inactivo";
		["FrmtAutoDeMilling"]	= "Moliendo %s";
		["FrmtAutoDeMillingCancelled"]	= "Moler cancelado: no se encuentra el objeto";
		["FrmtAutoDeProspectCancelled"]	= "Prospectar cancelado: no se encuentra el objeto";
		["FrmtAutoDeProspecting"]	= "Prospectando %s";
		["FrmtBidbrokerCurbid"]	= "pujaActual";
		["FrmtBidbrokerDone"]	= "Corredor de pujas finalizado";
		["FrmtBidbrokerHeader"]	= "Pujas que tienen un promedio de ahorro de %s de plata en el valor de desencantamiento (min %%menos= %d):";
		["FrmtBidbrokerLine"]	= "%s, Valorado en: %s, %s: %s, Ahorra: %s, Menos %s, Tiempo: %s";
		["FrmtBidbrokerMinbid"]	= "pujaMin";
		["FrmtBidBrokerSkipped"]	= "Saltadas %d subastas que están por debajo del margen de beneficios (%d%%)";
		["FrmtBidBrokerSkippedBids"]	= "Saltado %d subastas debido a las ofertas existentes";
		["FrmtPctlessDone"]	= "Porcentajes menores finalizado.";
		["FrmtPctlessHeader"]	= "Compras que tienen %d%% de ahorro sobre el precio promedio de desencantamiento del artí­culo (ahorro min= %s):";
		["FrmtPctlessLine"]	= "%s, Valorado en: %s, Compra: %s, Ahorra: %s, Menos %s";
		["FrmtPctlessSkillSkipped"]	= "Ignoradas %d subastas por el filtro de nivel (%s)";
		["FrmtPctlessSkipped"]	= "Saltadas %d subastas que están por debajo del margen de beneficios (%s)";

		-- Section: Tooltip Messages
		["Click"]	= "Click";
		["FrmtBarkerPrice"]	= "Precio de Pregonero (margen de %d%%)";
		["FrmtDEItemLevels"]	= "Se desencantan de niveles %d a %d del artículo.";
		["FrmtDisinto"]	= "Se desencanta en:";
		["FrmtFound"]	= "Se ha descubierto que %s se desencanta en:";
		["FrmtFoundNotDisenchant"]	= "Descubierto que %s no se puede desencantar";
		["FrmtInkFrom"]	= "Hecho de %s";
		["FrmtMillingFound"]	= "Encontrado que %s se muele en:";
		["FrmtMillingValueAuctHsp"]	= "Valor molido (HSP)";
		["FrmtMillingValueAuctMed"]	= "Valor molido (Media)";
		["FrmtMillingValueAuctVal"]	= "Valor molido (AucAdv)";
		["FrmtMillingValueMarket"]	= "Valor molido (Baseline)";
		["FrmtMillsInto"]	= "Se muele en:";
		["FrmtPriceEach"]	= "(%s c/u)";
		["FrmtProspectFound"]	= "Descubierto que %s se prospecciona para:";
		["FrmtProspectFrom"]	= "Se prospecciona de %s.";
		["FrmtProspectInto"]	= "Se prospecciona en:";
		["FrmtProspectValueAuctHsp"]	= "Valor de prospección (HSP)";
		["FrmtProspectValueAuctMed"]	= "Valor de prospección (Media)";
		["FrmtProspectValueAuctVal"]	= "Valor de prospección (AucAdv)";
		["FrmtProspectValueMarket"]	= "Valor de prospección (Baseline)";
		["FrmtSuggestedPrice"]	= "Precio Sugerido:";
		["FrmtTotal"]	= "Total";
		["FrmtValueAuctHsp"]	= "Valor de desencantamiento (PMV)";
		["FrmtValueAuctMed"]	= "Valor de desencantamiento (Promedio)";
		["FrmtValueAuctVal"]	= "Valor de desencantamiento (AucAdv)";
		["FrmtValueFixedVal"]	= "Valor de desencantamiento (Fijo)";
		["FrmtValueMarket"]	= "Valor de desencantamiento (Referencia)";
		["FrmtWarnAuctNotLoaded"]	= "[Auctioneer no se ha cargado, usando los precios guardados]";
		["FrmtWarnNoPrices"]	= "[No hay precios disponibles]";
		["FrmtWarnPriceUnavail"]	= "[Algunos precios no están disponibles]";
		["RightClick"]	= "Click-Derecho";
		["ShiftClick"]	= "Shift-click";
		["TipOpenConfig"]	= "Para editar la configuracion.";
		["TipOpenEnchant"]	= "para abrir la ventana de encantamiento.";
		["TipOpenJewel"]	= "para abrir la ventana de jollería.";
		["TooltipMillingLevel"]	= "Habilidad de moler requerida %d";
		["TooltipProspectLevel"]	= "Habilidad de prospección requerida %d";
		["TooltipShowDisenchantLevel"]	= "Habilidad de desencantamiento requerida %d";

		-- Section: User Interface
		["BeanCounterRequired"]	= "Se requiere BeanCounter para determinar la razón de compra. AutoDE será desactivado hasta que se instale BeanCounter.";
		["ExportPriceAucAdv"]	= "Exportar precios de Enchantrix a Auctioneer Advanced";
		["GuiActivateProfile"]	= "Activar el perfil actual";
		["GuiAutoDeBoughtForDE"]	= "Solamente artículos comprados para desencantar.";
		["GuiAutoDeEnable"]	= "Monitorizar bolsas por objetos desencantables - USAR CON PRECAUCIÓN";
		["GuiAutoDeEpicItems"]	= "Auto desencantar objetos de calidad épica (morados)";
		["GuiAutoDeOptions"]	= "Automatización";
		["GuiAutoDePromptLine1"]	= "¿Quieres desencantar:¶";
		["GuiAutoDePromptLine3"]	= "Valorado en %s¶";
		["GuiAutoDEPurchaseReason"]	= "Fue Comprado por %s";
		["GuiAutoDeRareItems"]	= "Auto desencantar objetos de calidad rara (azules)";
		["GuiAutoDESuggestion"]	= "Sugerencia: %s este artículo";
		["GuiAutoLootDE"]	= "Recoger automaticamente objetos desencantados, prospeccionados o molidos.";
		["GuiAutoMillingPromptLine1"]	= "¿Quieres moler:";
		["GuiAutoProspectPromptLine1"]	= "¿Quieres prospectar:¶";
		["GuiBBUnbiddedOnly"]	= "Restringir BidBroker sólo a los artículos sin puja";
		["GuiConfigProfiles"]	= "Establecer, configurar y editar perfiles.";
		["GuiCreateReplaceProfile"]	= "Crear o reemplazar un perfil";
		["GuiDefaultBBProfitPercent"]	= "porcentaje de beneficio del Bidbroker por defecto: %d";
		["GuiDefaultLessHSP"]	= "Porcentaje menor que HSP por defecto: %d";
		["GuiDefaultProfitMargin"]	= "Margen de beneficio por defecto:";
		["GuiDeleteProfileButton"]	= "Eliminar";
		["GuiDuplicateProfileButton"]	= "Copiar Perfil";
		["GuiFixedSettings"]	= "Precios de reagentes ajustados";
		["GuiFixedSettingsNote"]	= "Nota: estos valores se usaran en lugar de los de Auctioneer o los de otros metodos de valoración si se marca el checkbox.¶\nLos valores siguientes están afectados por los pesos de los reagentes de la sección anterior, por lo que para asegurate de que el valor de los reagentes esta valorado exactamente como se especifica abajo, asegurate que los pesos estan establecidos al 100% en la seccion de pesos.";
		["GuiGeneralOptions"]	= "Opciones generales de Enchantrix";
		["GuiIgnore"]	= "Ignorar";
		["GuiItemValueAuc4HSP"]	= "Auc4 HSP";
		["GuiItemValueAuc4Median"]	= "Auc4 Media";
		["GuiItemValueAuc5Appraiser"]	= "AucAdv Valor de Appraiser";
		["GuiItemValueAuc5Market"]	= "AucAdv Valor de Mercado";
		["GuiItemValueAverage"]	= "Media (predeterminado)";
		["GuiItemValueBaseline"]	= "Linea base de Mercado";
		["GuiItemValueCalc"]	= "Valor del objeto calculado de";
		["GuiMaxBuyout"]	= "Maximo valor de compra inmediata:";
		["GuiMillingingValues"]	= "Muestra valores estimados de moler";
		["GuiMillingLevels"]	= "Muestra requerimientos de nivel para moler en el globo de ayuda.";
		["GuiMillingMaterials"]	= "Muestra información del material de moler en el globo de ayuda.";
		["GuiMillingOptions"]	= "Opciones de Moler";
		["GuiMinBBProfitPercent"]	= "Mínimo porcentaje de beneficio del Bidbroker por defecto: %d";
		["GuiMinimapButtonAngle"]	= "Ángulo del botón: %d";
		["GuiMinimapButtonDist"]	= "Distancia: %d";
		["GuiMinimapOptions"]	= "Opciones de visualización del minimapa";
		["GuiMinimapShowButton"]	= "Mostrar el boton del mini-mapa.";
		["GuiMinLessHSP"]	= "Mínimo porcentage menor que HSP: %d";
		["GuiMinProfitMargin"]	= "Margen mínimo de beneficio:";
		["GuiNewProfileName"]	= "Nuevo nombre de perfil:";
		["GuiNo"]	= "No";
		["GuiPLBBOnlyBelowDESkill"]	= "Solo mostrar objetos desencantables al nivel de habilidad actual";
		["GuiPLBBSettings"]	= "Ajusted de Percentless y Bidbroker";
		["GuiProspectingLevels"]	= "Mostrar requerimientos de nivel de prospeccion en información";
		["GuiProspectingMaterials"]	= "Mostrar informacion del material de prospección en la descripción";
		["GuiProspectingOptions"]	= "Opciones de prospectar";
		["GuiProspectingValues"]	= "Mostrar valores de prospección estimados en la descripción";
		["GuiResetProfileButton"]	= "Reiniciar";
		["GuiSaveProfileButton"]	= "Salvar";
		["GuiShowMatSources"]	= "Muestre el material de origen de artículos obtenidos por desencante, prospección, o molidos.";
		["GuiShowMilling"]	= "Mostrar datos de molido para las hierbas";
		["GuiShowProspecting"]	= "Mostrar datos de prospectado para las menas";
		["GuiTabAuctions"]	= "Subastas";
		["GuiTabFixed"]	= "Valor fijo";
		["GuiTabGeneral"]	= "General";
		["GuiTabMilling"]	= "Moler";
		["GuiTabProfiles"]	= "Perfiles";
		["GuiTabProspecting"]	= "Propectar";
		["GuiTabWeights"]	= "Pesos";
		["GuiValueOptions"]	= "Opciones de visualización de valor";
		["GuiValueShowAuc4HSP"]	= "Mostrar valores de HSP del Auctioneer";
		["GuiValueShowAuc4Median"]	= "Mostrar valores medios del Auctioneer";
		["GuiValueShowAuc5Market"]	= "Mostrar valores de mercado del Auctioneer";
		["GuiValueShowBaseline"]	= "Mostrar incorporados valores de línea base";
		["GuiValueShowDEValues"]	= "Mostrar valores de desencantamiento estimados";
		["GuiValueTerse"]	= "Mostrar valores de desencantamiento concisos";
		["GuiWeighSettingsNote"]	= "El cambio de pesos por encima de la valoración de los reactivos dada por el monto determinado. Generalmente usted querrá dejarlos al 100% a menos que usted piense que debe ser más o menos valiosa que el método de valoración que dice que está utilizando.";
		["GuiWeightSettings"]	= "Conveniencia de desencantar reactivo";
		["GuiYes"]	= "Si";
		["ModTTShow"]	= "Solo mostrar el globo de ayuda extra si Alt está pulsado.";
		["ModTTShow_alt"]	= "Cuando se presiona la tecla Alt";
		["ModTTShow_always"]	= "Siempre";
		["ModTTShow_ctrl"]	= "Cuando se presiona la tecla Ctrl";
		["ModTTShow_never"]	= "Nunca";
		["ModTTShow_noalt"]	= "Cuando la tecla Alt no está siendo presionada";
		["ModTTShow_noctrl"]	= "Cuando la tecla Ctrl no está siendo presionada";
		["ModTTShow_noshift"]	= "Cuando la tecla Shift no está siendo presionada";
		["ModTTShow_shift"]	= "Cuando la tecla Shift está siendo presionada";

}
