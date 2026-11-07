--[[
	Auctioneer Reforged - Localization (esMX)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

AuctioneerLocalizations = AuctioneerLocalizations or {}
AuctioneerLocalizations.esMX = {

		-- Section: Help
		["AAMU_Help_VendorOptions"]	= "AAMU: Opciones de Vendedor";
		["AAMU_Help_VendorOptionsAnswer"]	= "AutoMagic enviará los objetos comprados para vender al vendedor automaticamente. Tambien tiene la opcion de auto-vender todos los objetos grises o los de la lista de vender.";
		["AAMU_Help_WhatAutoMagic"]	= "¿Qué es AutoMagic?";
		["AAMU_Help_WhatAutoMagicAnswer"]	= "AutoMagic es un trabajo en progreso. Su objetivo es automatizar las tareas que hacen los subastadores que puede ser una molestia hacer, siempre y cuando sea dentro de los límites establecidos por Blizzard. \n\nAutoMagic actualmente se auto-vende cualquier artículo comprado a través de SearchUI para vendedores, cualquier item que es de color gris (si está activo) o en cualquier item en  la lista de auto-venta. Si está activada, al abrir una ventana de mercado, verá una lista de los items a vender.";
		["AAMU_Help_WhatMailGUI"]	= "¿Qué es el Mail GUI?";
		["AAMU_Help_WhatMailGUIAnswer"]	= "Esto muestra una ventana cuando se abre el buzón de correo que permite la auto-carga de elementos en la ventana de enviar mensajes basado en las razones de compra desde SearchUI. También puede utilizar las razones del módulo de ItemSuggest en lugar de las razones previstas por SearchUI. Muy útil para los artículos comprados en masa de correo para una profesión que tiene otro personaje.";
		["ADV_Help_InvalidProfileName"]	= "No se puede crear un nuevo perfil: favor de ingresar un nombre diferente";
		["ADV_Help_WhatAccuracy"]	= "¿Qué es Error de Precio de Mercado?";
		["ADV_Help_WhatAccuracyAnswer"]	= "Error de Precio de mercado le permite establecer la cantidad de error que se tolera mientras se computan los precios del mercado. Debido a que el algoritmo es extremadamente complejo, sólo una estimación se puede hacer. La reducción de este número hará que la estimación sea más precisa, pero requerirá más potencia de procesamiento (y puede ser más lenta para los ordenadores más antiguos).";
		["ADV_Help_WhatClickHooks"]	= "¿Qué son los ganchos de click?";
		["ADV_Help_WhatClickHooksAnswer"]	= "Los ganchos de click te permiten realizar una búsqueda de un item ya sea por click en Alt derecha en el item de sus bolsas, o Alt + click en un enlace en el item del panel de chat.";
		["ADV_Help_WhatExactMatch"]	= "¿Qué es una coincidencia exacta?";
		["ADV_Help_WhatExactMatchAnswer"]	= "Algunos items pueden variar ligeramente en un sufijo (por ejemplo: del Oso / Águila / Hurón, etc), o las estadísticas exactas (por ejemplo: dos itms ambos del Oso, pero tienen diferentes estadísticas). Una coincidencia exacta no coinciden con todo lo que no es 100% a la misma.";
		["ADV_Help_WhatIsImage"]	= "¿Qué es una imagen de la casa de subastas?";
		["ADV_Help_WhatPreferredLanguage"]	= "¿Cuál es el idioma preferido?";
		["ADV_Help_WhatPreferredLanguageAnswer"]	= "El idioma perferido le deja a usted escoger lo cual de las traducciones apoyadas que quiere que use Auctioneer.  Esto puedo ser útil si usted prefiere que Auctioneer use una escena distinta de cliente del juego.  Esta función requiere que usted recomience o /console reloadui.";
		["AHWC_Help_AuctionHouseScale"]	= "Casa de subastas escala?";
		["AHWC_Help_AuctionHouseScaleAnswer"]	= "La casa de subastas escala deslizante ajusta el tamaño global de toda la casa de subastas ventana. El tamaño predeterminado es 1.";
		["AHWC_Help_CompactUIFontScale"]	= "CompactUI font escala?";
		["AHWC_Help_CompactUIFontScaleAnswer"]	= "La fuente CompactUI Escala deslizante ajusta el tamaño del texto aparece en AucAdvance CompactUI opción en la ficha Búsqueda. El tamaño predeterminado es 0.";
		["APPR_Help_HowMarkdownPctCalculated"]	= "¿Cómo es el porcentaje calculado Markdown?";

		-- Section: Interface
		["AAMU_HelpTooltip_AutoSellGreyNoPrompt"]	= "No se mostrará ventana de confirmación al vender objetos grises (calidad pobre).";
		["AAMU_Interface_AutoSellGrey"]	= "Vender automáticamente objetos grises (calidad pobre).";
		["AAMU_Interface_AutoSellList"]	= "Lista de Auto-Venta";
		["AAMU_Interface_GeneralOptions"]	= "Opciones generales";
		["AAMU_Interface_GUIOptions"]	= "Opciones de interfaz";
		["ADV_Interface_CopyProfile"]	= "Copiar";
		["ADV_Interface_CreateProfile"]	= "Crea o reemplaza un perfil";
		["ADV_Interface_Delete"]	= "Borrar";
		["ADV_Interface_Down"]	= "Abajo";
		["ADV_Interface_FactionAlliance"]	= "Alianza";
		["ADV_Interface_FactionHorde"]	= "Horda";
		["ADV_Interface_General"]	= "General";
		["ADV_Interface_PreferredLanguage"]	= "Idioma Preferida";
		["ADV_Interface_ProfileName"]	= "Nombre de perfil nuevo:";
		["ADV_Interface_PurchasingOptions"]	= "Opciones de Comprar";
		["AHWC_Interface_Always"]	= "Siempre";
		["AHWC_Interface_AuctionHouseScale"]	= "Escala de Casa de Subastas";
		["AHWC_Interface_Never"]	= "Nunca";
		["APPR_Interface_12Hours"]	= "12 horas";
		["APPR_Interface_8Hours"]	= "18 horas";
		["APPR_Interface_2Hours"]	= "2 horas";
		["APPR_Interface_24Hours"]	= "24 horas";
		["APPR_Interface_48Hours"]	= "48 horas";
		["APPR_Interface_All"]	= "Todo";
		["APPR_Interface_AuctionDetail"]	= "Detalle de subasta:";
		["APPR_Interface_Auctions"]	= "Subastas";
		["APPR_Interface_Bottom"]	= "Fondo";
		["APPR_Interface_Buy"]	= "Comprar";
		["APPR_Interface_Configure"]	= "Configurar";
		["APPR_Interface_Deposit"]	= "Depósito:";
		["APPR_Interface_Divisions"]	= "Divisiones";
		["APPR_Interface_Duration: %s"]	= "Duración: %s";
		["APPR_Interface_Examples"]	= "%s ejemplos:";
		["APPR_Interface_FixedPrice"]	= "Precio fijo";
		["APPR_Interface_Full"]	= "Lleno";
		["APPR_Interface_FullView"]	= "Vista Completa";
		["APPR_Interface_Hidden"]	= "Escondido";
		["APPR_Interface_HideThisItem"]	= "Esconde este artículo";
		["APPR_Interface_HowIgnoreSeller"]	= "Como ignorar las subastas de un vendedor";
		["APPR_Interface_HowUnIgnoreSeller"]	= "Como des-ignorar las subastas de un vendedor";
		["APPR_Interface_Items"]	= "%d artículos";
		["APPR_Interface_Left"]	= "Izquierda";
		["APPR_Interface_None"]	= "[Nada]";
		["APPR_Interface_NoPriceAvailable"]	= "No hay precio disponible para %s!";
		["APPR_Interface_Off"]	= "Apagado";
		["APPR_Interface_Only"]	= "Solo";
		["APPR_Interface_Right"]	= "Derecha";
		["APPR_Interface_RoundSubtract"]	= "Restar cantidad fija:";
		["APPR_Interface_Seller"]	= "Vendedor";
		["APPR_Interface_Show"]	= "Mostrar:";
		["APPR_Interface_TotalDeposit"]	= "Depósito Total:";
		["APPR_Interface_Totals"]	= "Totales:";
		["APPR_Interface_ValueRounding"]	= "Redondeación de valor";
		["APPR_Interface_WhatValueRounding"]	= "¿Qué es redondeación de valor?";
		["ASKP_Interface_Miscellaneous"]	= "Misceláneo:";
		["ASKP_Interface_Options"]	= "Opciones";
		["ASKP_Interface_SimpleTrigger"]	= "Activación Sencilla:";
		["BASC_Interface_BasicFilterOptions"]	= "Opciones de Filtro Básico";
		["BASC_Interface_MinimumItemLevel"]	= "Nivel mínimo de artículo";
		["BASC_Interface_MinimumQuality"]	= "Calidad Mínima: %d";
		["COMP_Interface_CompActivated"]	= "Dejar uso de interfaz compacto de usuario (requiere salida)";
		["COMP_Interface_Options"]	= "Opciones";
		["ILVL_Interface_DisplayMean"]	= "Muestra Promedio";
		["SBTN_Interface_Options"]	= "Opciones";
		["SDEV_Interface_DisplayMean"]	= "Muestra Promedio";
		["SHTG_Interface_DisplayMedian"]	= "Muestra Promedio";
		["SIMP_Interface_SimpleOptions"]	= "Opciones Sencillas";
		["UCUT_Interface_MarketValue"]	= "Valor de mercado";

}
