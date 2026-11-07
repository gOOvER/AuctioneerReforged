--[[
	Auctioneer Reforged - Localization (elGR)
	License: GNU General Public License v3.0 (GPL-3.0-or-later)
]]

AuctioneerLocalizations = AuctioneerLocalizations or {}
AuctioneerLocalizations.elGR = {

		-- Section: Help
		["AAMU_Help_VendorOptions"]	= "AAMU: Επιλογές Προμηθευτή";
		["AAMU_Help_VendorOptionsAnswer"]	= "AUTOMAGIC θα πωλεί τα είδη που αγοράζονται για vendoring στον πωλητή αυτόματα. Έχει επίσης τη δυνατότητα της αυτόματης πώλησης όλα τα γκρίζα αντικείμενα ή στοιχεία σχετικά με τον κατάλογο πωλούν έθιμο.";
		["AAMU_Help_WhatAutoMagic"]	= "Τι είναι το AutoMagic?";
		["AAMU_Help_WhatAutoMagicAnswer"]	= "AUTOMAGIC είναι ένα έργο-σε-εξέλιξη. Στόχος του είναι να αυτοματοποιήσουν εργασίες που εκτελούνται σε εκπλειστηριαστές ότι μπορεί να είναι ένας πόνος να κάνει, αρκεί να είναι εντός των ορίων που προβλέπουν Blizzard. \ n \ nAutoMagic σήμερα θα αυτο-πωλήσουν οποιοδήποτε στοιχείο αγόρασε μέσω SearchUI για τους πωλητές, κάθε στοιχείο που είναι γκρι (αν είναι ενεργοποιημένη) ή σε οποιοδήποτε σημείο της αυτόματης πώλησης λίστα. Αν ενεργοποιηθεί, όταν ανοίγετε ένα παράθυρο έμπορος θα δείτε μια λίστα με τα σημεία πώλησης.";
		["AAMU_Help_WhatMailGUI"]	= "Τι είναι το Mail GUI?";
		["AAMU_Help_WhatMailGUIAnswer"]	= "Αυτό εμφανίζει ένα παράθυρο, όταν το γραμματοκιβώτιο ανοίγει που επιτρέπει την αυτόματη φόρτωση των στοιχείων στο παράθυρο στείλτε mail σε λόγους που έχουν αγοράσει από SearchUI. Μπορεί επίσης να χρησιμοποιήσετε το ItemSuggest ενότητα λόγων και όχι των λόγων που προβλέπονται SearchUI. Πολύ βολικό για τη μάζα αντικειμένων αλληλογραφίας αγόρασε για ένα επάγγελμα που έχει άλλο χαρακτήρα.";
		["ADV_Help_CannotDeleteProfile"]	= "Το επιλεγμένο προφίλ δεν μπορεί να διαγραφεί";
		["ADV_Help_InvalidProfileName"]	= "Δεν μπορείτε να δημιουργήσετε νέο λογαριασμό. Παρακαλώ δώστε ένα όνομα λογαριασμού πρώτα";
		["ADV_Help_PostAuctionError"]	= "Αυτό το αντικείμενο δεν μπορεί να προστεθεί σύμφωνα με το: %s";
		["ADV_Help_WhatAccuracy"]	= "Τι είναι λάθος τιμή αγοράς;";
		["ADV_Help_WhatAccuracyAnswer"]	= "Τιμή αγοράς λάθους σας επιτρέπει να ρυθμίσετε το ύψος του λάθους που θα είναι ανεκτή, ενώ οι τιμές της αγοράς πληροφορικής. Επειδή ο αλγόριθμος είναι εξαιρετικά περίπλοκη, μόνο μια εκτίμηση μπορεί να γίνει. Μειώνοντας τον αριθμό αυτό θα καταστήσει την εκτίμηση πιο ακριβή, αλλά θα απαιτήσει μεγαλύτερη ισχύ επεξεργασίας (και ενδέχεται να είναι χαμηλότερες για τους παλαιότερους υπολογιστές).";
		["ADV_Help_WhatClickHooks"]	= "Τι είναι το κλικ-γάντζους?";
		["ADV_Help_WhatClickHooksAnswer"]	= "Το κλικ γάντζοι σας επιτρέπουν να εκτελέσετε μια αναζήτηση για ένα αντικείμενο από Alt-δεξί κλικ είτε το στοιχείο σε τσάντες σας, ή μια σύνδεση στοιχείο στο παράθυρο συνομιλίας.";
		["ADV_Help_WhatExactMatch"]	= "Τι είναι μια ακριβή αντιστοιχία?";
		["ADV_Help_WhatExactMatchAnswer"]	= "Ορισμένα στοιχεία μπορεί να διαφέρουν ελαφρώς από το επίθεμα (για παράδειγμα: της Bear / Eagle / Ferret κλπ), ή την ακριβή στατιστικά στοιχεία (π.χ.: δύο στοιχεία τόσο της Bear, αλλά έχουν διαφορετικές στατιστικές). Μια ακριβή αντιστοιχία δεν θα ταιριάζει με τίποτα που δεν είναι 100% το ίδιο.";
		["ADV_Help_WhatIsImage"]	= "Τι είναι ένας οίκος δημοπρασιών εικόνα?";

		-- Section: Interface
		["AAMU_Interface_AutoNoPrompt"]	= "... χωρίς άμεση επιβεβαίωση";

		-- Section: Scanning Messages
		["PSS_AtEnd"]	= "στο τέλος";
		["PSS_Expired"]	= "ήταν προηγούμενος χρόνος λήξης)";
		["PSS_Filtered"]	= "φιλτραρισμένα στοιχεία";
		["PSS_Filtered_Removed"]	= "φιλτραρισμένα στοιχεία αφαιρούνται";
		["PSS_Hours"]	= "ώρες";
		["PSS_Incomplete_Missed_2"]	= "στοιχεία)";
		["PSS_MatchedItems"]	= "ταιριάζουν με το ερώτημά)?";
		["PSS_Minutes"]	= "λεπτά";
		["PSS_NewItems"]	= "νέα στοιχεία";
		["PSS_Removed_NoExpired"]	= "στοιχεία αφαιρούνται";
		["PSS_Unchanged_NoMissed"]	= "αμετάβλητα αντικείμενα";
		["PSS_Updated_NoMissed"]	= "ενημερωμένα στοιχεία";

		-- Section: Tooltip
		["APPR_Tooltip_AppraiserCurModel"]	= "εκτιμητή";
		["APPR_Tooltip_PostedCount"]	= "Δημοσιεύτηκε %2d στο avg / ea %s";
		["APPR_Tooltip_StartingBid"]	= "Αρχική τιμή x {{%d}}";
		["ASAL_Tooltip_ StdDeviation"]	= "Std Απόκλιση";
		["ASAL_Tooltip_3DaysBought"]	= "3 Ημέρες Αγορά {{%s}} σε κάθε avg";
		["ASAL_Tooltip_Confidence"]	= "εμπιστοσύνη:";
		["ASAL_Tooltip_Individually"]	= "(ή ατομικά)";
		["ILVL_Tooltip_Confidence"]	= "Εμπιστοσύνη: %s";
		["ILVL_Tooltip_Individually"]	= "(ή ατομικά)";
		["ILVL_Tooltip_MeanPrice"]	= "Η μέση τιμή";

}
