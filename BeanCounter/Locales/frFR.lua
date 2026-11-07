--[[
	BeanCounter - Localization (frFR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

BeanCounterLocalizations = BeanCounterLocalizations or {}
BeanCounterLocalizations.frFR = {

		-- Section: Config Text
		["C_BeanCounterConfig"]	= "Configuration de BeanCounter";
		["C_BeanCounterDatabaseMaintenance"]	= "Maintenance de la base de données BeanCounter";
		["C_BeanCounterOptions"]	= "Options de BeanCounter";
		["C_ColorizeSearch"]	= "Ajouter un dégradé de couleur pour chaque résultat dans la fenêtre de recherche";
		["C_DatabaseLength"]	= "Détermine combien de temps BeanCounter sauvegardera les transactions à l'Hôtel des Ventes";
		["C_DataMaintenance"]	= "Maintenance des données";
		["C_DateString"]	= "Format de date à utiliser:";
		["C_DateStringExample"]	= "Exemple de Date:";
		["C_ExtenalSearch"]	= "Autoriser les Addons Externes à utiliser la recherche BeanCounter?";
		["C_MailInvoiceTimeout"]	= "Temps au bout duquel la récupération des mails est abandonnée = %d secondes";
		["C_MailRecolor"]	= "Méthode de re colorisation de mail";
		["C_ModTTShow"]	= "Afficher l'infobulle supplémentaire uniquement si Alt est enfoncée";
		["C_MonthsToKeep"]	= "Combien de mois une donnée doit-elle être gardée?";
		["C_OpacityLevel"]	= "Niveau d'opacité";
		["C_Resortascendingtime"]	= "Trier les entrées par ordre chronologique ascendant";
		["C_ResortDatabase"]	= "Trier la base de données";
		["C_ScanDatabase"]	= "Scanner les erreurs de la base de données: A utiliser si vous avez des erreurs en faisant des recherches avec BeanCounter.\n Sauvegarder les \"saved variables\" de BeanCounter avant d'utiliser cette option.";
		["C_SearchConfiguration"]	= "Configuration de la recherche";
		["C_SendToSearch"]	= "Ajouter les objets cherchés dans BeanCounter dans la fenêtre principale de l'Hôtel des Ventes?";
		["C_ShowBeginnerTooltips"]	= "Montre les encadrés d'aide pour débutant au passage de la souris";
		["C_ShowReasonPurchase"]	= "Afficher la raison d'achat dans l'infobulle";
		["C_ValidateDatabase"]	= "Valider la base de données";

		-- Section: Generic Strings
		["NoRe-Color"]	= "Pas de changement de couleur";
		["off"]	= "Eteint";
		["Ok"]	= "Ok";
		["on"]	= "Allumé";
		["Re-ColorIcons"]	= "Changement couleur d'icones";
		["Re-ColorIconsandText"]	= "Changement couleur d'icones et du texte";
		["Re-ColorText"]	= "Changement couleur du texte";
		["TooltipFailed"]	= "Impossible d'obtenir la bulle d'aide";
		["UiNeutralCheckBox"]	= "Montrer les données de l'HV neutre";

		-- Section: Help Text
		["A_BeanCountersTooltip"]	= "BeanCounter enregistrera la raison SearchUI pour laquelle un objet a été acheté et l'affichera dans l'encadré d'aide.";
		["A_DateString"]	= "Ceci contrôle le mode d'affichage de la date pour BeanCounter GUI. Les commandes doivent être précédées de % et plusieurs commandes peuvent être associées avec du texte. Par exemple %a == %X affichera Mer == 21:34:21";
		["A_DateStringCommands"]	= "Commandes: \n %a = abr.jour de la semaine,\n %A = jour de la semaine,\n %b = abr.nom du mois,\n %B = nom du mois,\n %c = date et heure,\n %d = jour du mois (01-31),\n %H = Heure (24),\n %I = heure (12)\n %M = minute, \n %m = month,\n %p = am/pm, \n %S = secondes,\n %U = semaine de l'année (01-52) ,\n %w = chiffre du jour de la semaine (0-6),\n %x = date, \n %X = heure,\n %Y = année complète (2007), \n %y = année (deux derniers chiffres ex: 07)";
		["A_ExtenalSearch"]	= "D'autres adjonctions peuvent avoir la recherche de BeanCounter d'un article à montrer dans BeanCounter' ; GUI de s. Par exemple ceci permet à BeanCounter de montrer quels articles vous regardez dans le priseur";
		["A_MailInvoiceTimeout"]	= "La durée BeanCounter attendra sur le serveur pour répondre à une demande de facture. Une facture est le \" ; who\" ; , \" ; what\" ; , et \" ; how\" ; d'un courrier de maison des ventes aux-enchères.";
		["A_MailRecolor"]	= "BeanCounter lit tout le courrier de la maison des ventes aux-enchères. Cette option indique à BeanCounter que l'utilisateur veut que la re-couleur les messages rende leur le sembler non lu.";
		["HelpGuiItemBox"]	= "Déplacer l'item dans la boite de recherche";
		["Q_BeanCountersTooltip"]	= "Qu'est ce que l'encadré d'aide BeanCounter";
		["Q_DateString"]	= "Format de date à utiliser";
		["Q_DateStringCommands"]	= "Commandes acceptables de date ?";
		["Q_ExtenalSearch"]	= "Autoriser les addons externes à utiliser BeanCounter";
		["Q_MailInvoiceTimeout"]	= "Quel est temps mort de facture de courrier ?";
		["Q_MailRecolor"]	= "Quelle est méthode de Re-couleur de courrier ?";

		-- Section: HelpTooltip
		["C_MaxDisplayedResults"]	= "Affichage Max des résultats de recherche (à partir de chaque base de données)";
		["TTDataExpireEnabled"]	= "Des données plus anciennes que la période sélectionnée sera SUPPRIMÉ";
		["TT_ColorizeSearch"]	= "Cette option change la couleur de la ligne des objets dans la fenêtre de recherche de BeanCounter";
		["TT_MaxDisplayedResults"]	= "Cela contrôle le nombre total de résultats afficher";
		["TT_neutralCheck"]	= "Afficher les résultats de l'hôtel des ventes \"Blackwater\"";
		["TT_OpacityLevel"]	= "Cela contrôle le niveau d'opacité des barres colorées dans la fenêtre de recherche de BeanCounter (si activées)";
		["TT_sendtosearch"]	= "Lorsque qu'une recherche est entrée sur BeanCounter, elle sera également ajouter à la fenêtre de parcours de l'HV.";

		-- Section: Interface
		["Cancelled"]	= "Annulé";
		["UiAucCancelled"]	= "Vente aux enchères annulée";

		-- Section: Mail
		["MailAllianceAuctionHouse"]	= "Hôtel des ventes de l'Alliance";
		["MailHordeAuctionHouse"]	= "Hôtel des ventes de la Horde";
		["MailNeutralAuctionHouse"]	= "Maison des ventes aux-enchères de Blackwater";
		["MailSenderAuctionHouse"]	= "Hotel des ventes";

		-- Section: Tooltip Messages
		["TTDateString"]	= "Entrez le format voulu d'affichage de votre date.Par défaut c'est %c";
		["TTDateStringExample"]	= "Montre un exemple de votre format de date";
		["TTExtenalSearch"]	= "Quand vous entrez une recherche dans un autre addon,BeanCounter affichera aussi une recherche pour cette objet";
		["TTMailInvoiceTimeout"]	= "Choisit pendant combien de temps BeanCounter attendra l'arrivée d'un message du serveur avant d'abandonner. Bas = plus rapide mais plus de chance de rater une donnée. Haut = plus lent mais augmente les chances d'avoir les données si le serveur de messagerie est extrêmement occupé.";
		["TTMailRecolor"]	= "Choisissez comment un mail va apparaitre après que BeanCounter\naura scanné la boite au lettre";
		["TTModTTShow"]	= "Cette option affichera la bulle d'aide de BeanCounter uniquement si Alt est enfoncé";
		["TTOpenconfig"]	= "Ouvrir la fenêtre de configuration de BeanCounter";
		["TTResort Database"]	= "Ceci scanne les données de BeanCounter et les trie par date d'arrivée ascendant. Ceci réduit le temps de compression de la base de données.";
		["TTShowBeginnerTooltips"]	= "Activer les bulles d'aide pour débutant qui s'affichent au survol de la souris.";
		["TTShowReasonPurchase"]	= "Affiche la raison pour laquelle un objet a été acheté dans l'encadré d'aide.";
		["TTValidateDatabase"]	= "Ceci scanne les données de BeanCounter et tente de corriger les erreurs éventuelles. A utiliser si vous avez des erreurs lors de vos recherches.";
		["TT_AuctionCheck"]	= "Afficher les objets vendus à l'hôtel des ventes.";
		["TT_AuctionFailedCheck"]	= "Afficher les objets que vous n'avez pas réussi à vendre.";
		["TT_BeanCounterAHTab"]	= "Clic droit pour afficher BeanCounter dans une autre fenêtre";
		["TT_BeanCounterSelectBox"]	= "Filtrer les résultats de la recherche par serveur, joueur, ou faction.";
		["TT_BidCheck"]	= "Afficher les objets achetés à l'hôtel des ventes.";
		["TT_BidFailedCheck"]	= "Affiche les objets pour lesquels vous avez été surenchéri.";
		["TT_ClassicCheck"]	= "Affiche les résultats de la base de données de BeanCounter Classic.";
		["TT_ExactCheck"]	= "Affiche uniquement les objets correspondant au texte exact de la recherche.";
		["TT_ItemIconBox"]	= "Déposez un objet ici pour commencer une recherche dessus.\nAffiche la fenêtre de recherche actuelle si c'est possible.";
		["TT_ScrollHeader"]	= "maintenir clic droit et bouger la souris pour redimensionner.\nCTRL + Clic droit pour réinitialiser la taille.";
		["TT_SearchBox"]	= "Entrez les critèresde recherche ici ou laisser vide pour une recherche générale";

		-- Section: User Interface
		["UiAddonTitle"]	= "BeanCounter: Historique de vente";
		["UiAucExpired"]	= "Vente terminée";
		["UiAucSuccessful"]	= "Vente réussie";
		["UiAuctions"]	= "Enchères";
		["UiAuctionTransaction"]	= "Enchère";
		["UiBids"]	= "Offres";
		["UiBidTransaction"]	= "Offre";
		["UiBuyerSellerHeader"]	= "Acheteur/Vendeur";
		["UiBuyTransaction"]	= "Acheter";
		["UiClassicCheckBox"]	= "Afficher les données BeanCounter classique";
		["UiData"]	= "Donnée";
		["UiDateHeader"]	= "Date";
		["UiDepositTransaction"]	= "Dépôt";
		["UiDone"]	= "Effectué";
		["UiExactNameSearch"]	= "Nom exact";
		["UiFailedAuctions"]	= "Vente ratée";
		["UiFee"]	= "Commission";
		["UiMailFrameRecording"]	= "BeanCounter enregistre votre mail";
		["UiMailFrameWait1"]	= "Veuillez ne pas fermer la fenêtre de mail ou";
		["UiMailFrameWait2"]	= "les objets d'enchère ne seront pas enregistrés";
		["UiNameHeader"]	= "Objet";
		["UiNetHeader"]	= "Net";
		["UiNetPerHeader"]	= "Net unit.";
		["UiOutbid"]	= "Surenchere";
		["UiOutbids"]	= "Surencheres";
		["UiPriceHeader"]	= "Prix";
		["UiPriceper"]	= "Prix/par";
		["UiPricePerHeader"]	= "Prix unit.";
		["UiPurchases"]	= "Achats";
		["UiQuantityHeader"]	= "Qte";
		["UiReason"]	= "Raison";
		["UiSales"]	= "Ventes";
		["UiSearch"]	= "Recherche";
		["UiSearchForLabel"]	= "Rechercher :";
		["UiSellTransaction"]	= "Vendre";
		["UiServer"]	= "Serveur";
		["UiTransactions"]	= "Transactions";
		["UiTransactionsLabel"]	= "Transactions:";
		["UiTransactionTypeHeader"]	= "Type";
		["UiWealth"]	= "Fortune";
		["UiWononBid"]	= "Gagné sur enchere";
		["UiWononBuyout"]	= "Gagné sur achat direct";

}
