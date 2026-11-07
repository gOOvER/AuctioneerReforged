--[[
	BeanCounter - Localization (esES)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.esES = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "Configuración";
		["C_BeanCounterDatabaseMaintenance"]	= "Mantenimiento de la base de datos del BeanCounter";
		["C_BeanCounterOptions"]	= "Opciones de BeanCounter";
		["C_ColorizeSearch"]	= "Colorear los resultados en la ventana de busqueda";
		["C_DatabaseLength"]	= "Determina cuanto tiempo BeanCounter salvará las transaciones de la casa de subastas.";
		["C_DataMaintenance"]	= "Mantenimiento de los datos";
		["C_DateString"]	= "Formato de fecha a usar:";
		["C_DateStringExample"]	= "Fecha de ejemplo:";
		["C_ExtenalSearch"]	= "¿Permitir que otros Addons activen la busqueda de BeanCounter?";
		["C_MailInvoiceTimeout"]	= "Tiempo de espera del correo = %d segundos";
		["C_MailRecolor"]	= "Metodo de recolorear los correos";
		["C_ModTTShow"]	= "Mostrar el tooltip extra solo si se presiona Alt.";
		["C_MonthsToKeep"]	= "¿Cuantos meses se guardarän los datos?";
		["C_OpacityLevel"]	= "Nivel de opacidad";
		["C_Resortascendingtime"]	= "Reordenar todas las entradas de modo ascendente por la fecha";
		["C_ResortDatabase"]	= "Reordenar datos";
		["C_ScanDatabase"]	= "Escanear la base de datos: Usar si tienes errores al buscar.\nSalva los datos anteriores de BeanCounter antes de usarlo.";
		["C_SearchConfiguration"]	= "Configuración de busqueda";
		["C_SendToSearch"]	= "¿Añadir el objeto buscado en BeanCounter a la ventana principal de la casa de subastas?";
		["C_ShowBeginnerTooltips"]	= "Mostrar ayuda al pasar el ratón sobre los campos.";
		["C_ShowReasonPurchase"]	= "Mostrar precio en el tooltip.";
		["C_ValidateDatabase"]	= "Validar base de datos";

		-- Section: Generic Strings
		["NoRe-Color"]	= "No recolorear";
		["off"]	= "apagado";
		["Ok"]	= "Ok";
		["on"]	= "Encendido";
		["Re-ColorIcons"]	= "Recolorear iconos";
		["Re-ColorIconsandText"]	= "Recolorear iconos y texto";
		["Re-ColorText"]	= "Recolorear texto";
		["TooltipFailed"]	= "No se encuentra informacion";
		["UiNeutralCheckBox"]	= "Casa de subastas neutral";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter almacenará el precio de un objeto cuando fue comprado y lo mostrará en el tooltip.";
		["A_DateString"]	= "Controla como se muestra el campo de fecha en el interfaz de BeanCounter. Los comandos estan predecidos por un % y se puede mezclar comandos y texto. Por ejemplo %a == %X mostrará Mie == 21:34:21";
		["A_DateStringCommands"]	= "Comandos:\n%a = Abreviatura del día de la semana.\n%A = Día de la semana (en texto).\n%b = Abreviatura del mes.\n%B = Mes (en texto).\n%c = Fecha y hora.\n%d = Dia del mes (01-31).\n%H = Hora (24).\n%I = Hora (12).\n%M = Minuto.\n%m = Mes.\n%p = AM/PM.\n%S = Segundo.\n%U = Semana del año.\n%w = Día de la semana (0-6).\n%x = Fecha.\n%X = Hora (tiempo).\n%Y = Año 4 digitos.\n%y = Año 2 digitos.";
		["A_ExtenalSearch"]	= "Otros addons pueden aprovechar la funcionalidad de BeanCounter y solicitar que un objeto se muestre en el interfaz de BeanCounter. Por ejemplo: esto permite que se muestre el objeto que estas mirando en el Evaluador de forma automatica.";
		["A_MailInvoiceTimeout"]	= "El tiempo que BeanCounter esperará por una petición de una factura al servidor. Una factura es \"el Quien\", \"el Que\" y \"el Como\" de un correo de la casa de subastas.";
		["A_MailRecolor"]	= "BeanCounter lee todos los correos de la casa de subastas. Esta opción indica si se recolorearán los mensajes (y como) para que parezcan como no leidos.";
		["HelpGuiItemBox"]	= "Arrastra un objeto hasta la caja para buscar.";
		["Q_BeanCountersTooltip"]	= "¿Qué es el tooltip de BeanCounter?";
		["Q_DateString"]	= "¿Cual es el formato de fecha a utilizar?";
		["Q_DateStringCommands"]	= "¿Comandos para la fecha aceptables?";
		["Q_ExtenalSearch"]	= "¿Permitir que addons externos utilicen BeanCounter?";
		["Q_MailInvoiceTimeout"]	= "¿Cuánto tiempo se escaneará un correo?";
		["Q_MailRecolor"]	= "¿Cual es el método de recolorear correos?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Número máximo de resultados mostrados (de cada base de datos)";
		["TTDataExpireEnabled"]	= "Los datos más antiguos de la fecha seleccionada serán BORRADOS";
		["TT_ColorizeSearch"]	= "Cambia el color de las lineas de los objetos en la ventana de busqueda de BeanCounter";
		["TT_MaxDisplayedResults"]	= "Controla el número total de resultados a mostrar.";
		["TT_neutralCheck"]	= "Muestra los resultados de la casa de subastas neutral";
		["TT_OpacityLevel"]	= "Controla el nivel de opacidad de las barras de colores en la ventana de busqueda de BeanCounter (Si está habilitado)";
		["TT_sendtosearch"]	= "Cuando se realiza una busqueda en BeanCounter añadirá la cadena al marco de busqueda de la casa de subastas.";

		-- Section: Interface
		["Cancelled"]	= "Cancelada";
		["UiAucCancelled"]	= "Subasta Cancelada";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Casa de subastas: Alianza";
		["MailHordeAuctionHouse"]	= "Casa de subastas: Horda";
		["MailNeutralAuctionHouse"]	= "Casa de subastas: Aguasnegras";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Introduzca el formato de fecha que quiera mostrar. El valor predeterminado es %c.";
		["TTDateStringExample"]	= "Muestra un ejemplo de como será el formato de fecha seleccionado.";
		["TTExtenalSearch"]	= "Cuando se realiza una búsqueda con otro addon, BeanCounter hará la misma busqueda.";
		["TTMailInvoiceTimeout"]	= "Seleciona cuanto tiempo esperará para conseguir la factura de un correo del servidor. Bajo = más rápido pero pueden perderse facturas. Alto = más lento pero aumentan las posibilidades de conseguir datos aunque el servidor esté muy ocupado.";
		["TTMailRecolor"]	= "Seleciona como aparecerán los correos una vez escaneados por BeanCounter.";
		["TTModTTShow"]	= "Muestra el tooltip de BeanCounter solo si se pulsa Alt.";
		["TTOpenconfig"]	= "Abre la ventana de configuración de BeanCounter.";
		["TTResort Database"]	= "Reordena los datos de BeanCounter de forma ascendente por fecha. Esto ayuda a acelerar las funciones de compresión de la base de datos.";
		["TTShowBeginnerTooltips"]	= "Mostrar ayuda al pasar el ratón sobre los campos.";
		["TTShowReasonPurchase"]	= "Muestra el comentario almacenado al comprar un objeto en el tooltip.";
		["TTValidateDatabase"]	= "Escanea los datos de BeanCounter e intenta corregir cualquier error que encuentre. Usalo si te aparecen errores al buscar.";
		["TT_AuctionCheck"]	= "Muestra los objetos vendidos en la casa de subastas.";
		["TT_AuctionFailedCheck"]	= "Muestra las subastas que no se consiguieron vender.";
		["TT_BeanCounterAHTab"]	= "Click derecho para mostrar BeanCounter en una ventana externa.";
		["TT_BeanCounterSelectBox"]	= "Filtrar los resultados por servidor, jugador o facción.";
		["TT_BidCheck"]	= "Muestra los objetos comprados en la casa de subastas.";
		["TT_BidFailedCheck"]	= "Muestra los objetos en los que tu puja fue superada.";
		["TT_ClassicCheck"]	= "Muestra los resultados de la base de datos de BeanCounter Classic.";
		["TT_ExactCheck"]	= "Solo mostrará los objetos que coincidan exactamente con el texto introducido.";
		["TT_ItemIconBox"]	= "Arrastra un objeto aquí para buscarlo.\nMuestra el icono de la busqueda actual si es posible.\n(todos los resultados de la busqueda son del mismo objeto)";
		["TT_ScrollHeader"]	= "Click derecho + arrastrar para redimensionar.\nCtrl + click derecho para resetear.";
		["TT_SearchBox"]	= "Introduce la consulta a buscar aquí o dejalo en blanco para buscar todo.";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Base de datos con la historia de subastas";
		["UiAucExpired"]	= "Subasta no conseguida";
		["UiAucSuccessful"]	= "Subasta conseguida";
		["UiAuctions"]	= "Subastas";
		["UiAuctionTransaction"]	= "Subasta";
		["UiBids"]	= "Pujas";
		["UiBidTransaction"]	= "Puja";
		["UiBuyerSellerHeader"]	= "Comprador/Vendedor";
		["UiBuyTransaction"]	= "Compra";
		["UiClassicCheckBox"]	= "Mostrar datos BC Classic.";
		["UiData"]	= "Datos";
		["UiDateHeader"]	= "Fecha";
		["UiDepositTransaction"]	= "Depósito";
		["UiDone"]	= "Cerrar";
		["UiExactNameSearch"]	= "Solo nombre exacto";
		["UiFailedAuctions"]	= "Subastas no conseguidas";
		["UiFee"]	= "Comisión";
		["UiMailFrameRecording"]	= "BeanCounter esta registrando tu correo";
		["UiMailFrameWait1"]	= "Por favor no cierre la ventana del correo";
		["UiMailFrameWait2"]	= "o los objetos no serán registrados";
		["UiNameHeader"]	= "Artículo";
		["UiNetHeader"]	= "Neto";
		["UiNetPerHeader"]	= "Neto c/u";
		["UiOutbid"]	= "Puja superada";
		["UiOutbids"]	= "Pujas superadas";
		["UiPriceHeader"]	= "Precio";
		["UiPriceper"]	= "Precio ud";
		["UiPricePerHeader"]	= "Precio c/u";
		["UiPurchases"]	= "Compras";
		["UiQuantityHeader"]	= "Ctd";
		["UiReason"]	= "Razón";
		["UiSales"]	= "Ventas";
		["UiSearch"]	= "Buscar";
		["UiSearchForLabel"]	= "Buscar por:";
		["UiSellTransaction"]	= "Vender";
		["UiServer"]	= "Servidor";
		["UiTransactions"]	= "Transacciones";
		["UiTransactionsLabel"]	= "Transacciones:";
		["UiTransactionTypeHeader"]	= "Tipo";
		["UiWealth"]	= "Ganancias";
		["UiWononBid"]	= "Ganado en puja";
		["UiWononBuyout"]	= "Ganado en compra directa";

}
