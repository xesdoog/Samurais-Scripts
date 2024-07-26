---@diagnostic disable: undefined-global, lowercase-global

require('lib/samurais_utils')

Labels = {
    ["Self"] = {
        {iso = "en-US", text = "Self "},
        {iso = "de-DE", text = "Sich "},
        {iso = "fr-FR", text = "Soi "},
        {iso = "it-IT", text = "L'io "},
    },

    ["Auto-Heal"] = {
        {iso = "en-US", text = "Auto-Heal"},
        {iso = "de-DE", text = "Auto-Heilung"},
        {iso = "fr-FR", text = "Auto-Guérison"},
        {iso = "it-IT", text = "Auto-Guarigione"},
    },

    ["autoheal_tooltip"] = {
        {iso = "en-US", text = "Automatically refill your health and armour."},
        {iso = "de-DE", text = "Füllen sie ihre gesundheit und rüstung automatisch wieder auf."},
        {iso = "fr-FR", text = "Rechargez automatiquement votre santé et votre armure."},
        {iso = "it-IT", text = "Ricarica automaticamente la tua salute e la tua armatura."},
    },

    ["objectiveTP"] = {
        {iso = "en-US", text = "Teleport To Objective."},
        {iso = "de-DE", text = "Zum Ziel Teleportieren."},
        {iso = "fr-FR", text = "Téléportation Vers L'objectif."},
        {iso = "it-IT", text = "Teletrasporto All'obiettivo."},
    },

    ["objectiveTP_tooltip"] = {
        {iso = "en-US", text = "While this option is enabled, press [F10] to teleport to mission objectives."},
        {iso = "de-DE", text = "Wenn diese option aktiviert ist, drücken sie [F10] um sich zu missionszielen zu teleportieren."},
        {iso = "fr-FR", text = "Lorsque cette option est activée, appuyez sur [F10] pour téléporter vers les objectifs de la mission."},
        {iso = "it-IT", text = "Mentre questa opzione è abilitata, premi [F10] per teletrasportarti agli obiettivi della missione."},
    },

    ["CrouchCB"] = {
        {iso = "en-US", text = "Crouch Instead of Sneak"},
        {iso = "de-DE", text = "Ducken Statt Schleichen"},
        {iso = "fr-FR", text = "Accroupir"},
        {iso = "it-IT", text = "Accovacciarsi"},
    },

    ["Crouch_tooltip"] = {
        {iso = "en-US", text = "Replace stealth mode's sneaking animation (Left CTRL) with crouching."},
        {iso = "de-DE", text = "Ersetzen sie die schleichanimation (linke CTRL) im stealth-modus durch die annäherung."},
        {iso = "fr-FR", text = "Remplacez l'animation de furtivité (Ctrl gauche) par l'accroupissement."},
        {iso = "it-IT", text = "Sostituisci l'animazione furtiva (CTRL sinistro) con quella accovacciata."},
    },

    ["PhoneAnimCB"] = {
        {iso = "en-US", text = "Enable Phone Animations"},

        {iso = "de-DE", text = "Aktivieren Telefon Animationen"},
        {iso = "fr-FR", text = "Activer Les Animations Du Téléphone"},
        {iso = "it-IT", text = "Abilita Animazioni Telefono"},
    },

    ["PhoneAnim_tooltip"] = {
        {iso = "en-US", text = "Restores the disabled phone animations from Single Player."},
        {iso = "de-DE", text = "Stellt die deaktivierten telefonanimationen des einzelspielermodus wieder her."},
        {iso = "fr-FR", text = "Restaure les animations téléphoniques désactivées du mode solo."},
        {iso = "it-IT", text = "Ripristina le animazioni del telefono disabilitate nella modalità giocatore singolo."},
    },

    ["SprintInsideCB"] = {
        {iso = "en-US", text = "Sprint Inside Interiors"},
        {iso = "de-DE", text = "Drinnen Laufen"},
        {iso = "fr-FR", text = "Courir Dans Les Intérieurs"},
        {iso = "it-IT", text = "Correre Al Chiuso"},
    },

    ["SprintInside_tooltip"] = {
        {iso = "en-US", text = "Allows you to sprint at full speed inside interiors that do not allow it like the Casino. Some interiors will still force you to run slowly."},
        {iso = "de-DE", text = "Ermöglicht ihnen, in innenräumen, in denen dies nicht möglich ist, mit voller geschwindigkeit zu sprinten. In manchen innenräumen müssen sie trotzdem langsam laufen."},
        {iso = "fr-FR", text = "Permet de sprinter à pleine vitesse dans des intérieurs qui ne le permettent pas comme le Casino. Certains intérieurs vous obligeront tout de même à courir lentement."},
        {iso = "it-IT", text = "Ti consente di correre a tutta velocità all'interno di interni che non lo consentono, come il Casinò. Alcuni interni ti costringeranno comunque a correre lentamente."},
    },

    ["LockpickCB"] = {
        {iso = "en-US", text = "Use Lockpick Animation"},
        {iso = "de-DE", text = "Verwenden Sie Die Hook-Animation"},
        {iso = "fr-FR", text = "Utiliser L'animation De Crochetage"},
        {iso = "it-IT", text = "Usa L'animazione Del Gancio"},
    },

    ["Lockpick_tooltip"] = {
        {iso = "en-US", text = "When stealing vehicles, your character will use the lockpick animation instead of breaking the window."},
        {iso = "de-DE", text = "Beim stehlen von fahrzeugen verwendet ihr charakter die dietrich animation, anstatt das fenster einzuschlagen."},
        {iso = "fr-FR", text = "Lors du vol de véhicules, votre personnage utilisera l'animation de crochetage au lieu de casser la vitre."},
        {iso = "it-IT", text = "Quando rubi veicoli, il tuo personaggio userà l'animazione del grimaldello invece di rompere il finestrino."},
    },

    ["ActionModeCB"] = {
        {iso = "en-US", text = "Disable Action Mode"},
        {iso = "de-DE", text = "Aktionsmodus Deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Le Mode D'action"},
        {iso = "it-IT", text = "Disabilita La Modalità Azione"},
    },

    ["ActionMode_tooltip"] = {
        {iso = "en-US", text = "Disables the forced movement style the player uses after firing a weapon. Note that this also disables stealth mode."},
        {iso = "de-DE", text = "Deaktiviert den erzwungenen Bewegungsstil, den der Spieler nach dem Abfeuern einer Waffe verwendet. Beachten Sie, dass dadurch auch der Stealth-Modus deaktiviert wird."},
        {iso = "fr-FR", text = "Désactive le style de mouvement forcé que le joueur utilise après avoir tiré avec une arme. Notez que cela désactive également le mode furtif."},
        {iso = "it-IT", text = "Disattiva lo stile di movimento forzato che il giocatore usa dopo aver sparato con un'arma. Nota che questo disattiva anche la modalità stealth."},
    },

    ["soundplayer"] = {
        {iso = "en-US", text = "Sound Player"},
        {iso = "de-DE", text = "Sound Player"},
        {iso = "fr-FR", text = "Joueur De Son"},
        {iso = "it-IT", text = "Lettore Suonare"},
    },

    ["malesounds"] = {
        {iso = "en-US", text = "Male Sounds"},
        {iso = "de-DE", text = "Männliche Klänge"},
        {iso = "fr-FR", text = "Sons Masculins"},
        {iso = "it-IT", text = "Suoni Maschili"},
    },

    ["femalesounds"] = {
        {iso = "en-US", text = "Fale Sounds"},
        {iso = "de-DE", text = "Weibliche Klänge"},
        {iso = "fr-FR", text = "Sons Feminins"},
        {iso = "it-IT", text = "Suoni Femminili"},
    },

    ["playButton"] = {
        {iso = "en-US", text = " Play "},
        {iso = "de-DE", text = " Spielen "},
        {iso = "fr-FR", text = " Jouer "},
        {iso = "it-IT", text = " Giocare "},
    },

    ["weaponTab"] = {
        {iso = "en-US", text = "Weapon "},
        {iso = "de-DE", text = "Waffe "},
        {iso = "fr-FR", text = "Arme "},
        {iso = "it-IT", text = "Arma "},
    },

    ["hashgrabberCB"] = {
        {iso = "en-US", text = "Info Gun"},
        {iso = "de-DE", text = "Info Waffen"},
        {iso = "fr-FR", text = "Arme D'infos"},
        {iso = "it-IT", text = "Arma Di Informazioni"},
    },

    ["hashgrabber_tt"] = {
        {iso = "en-US", text = "This is mainly for developers. Aim your gun at a game entity and press [FIRE] to get information about it."},
        {iso = "de-DE", text = "Dies ist hauptsächlich für entwickler gedacht. Zielen sie mit ihrer waffe auf ein spielobjekt und drücken sie [FEUER], um informationen darüber zu erhalten."},
        {iso = "fr-FR", text = "Ceci est principalement destiné aux développeurs. Visez une entité du jeu avec votre arme et appuyez sur [TIRER] pour obtenir des informations à son sujet."},
        {iso = "it-IT", text = "Questo è principalmente per gli sviluppatori. Punta la tua pistola a un'entità di gioco e premi [FUOCO] per ottenere informazioni su di essa."},
    },

    ["triggerbotCB"] = {
        {iso = "en-US", text = "Trigger Bot"},
        {iso = "de-DE", text = "Auslösen Bot"},
        {iso = "fr-FR", text = "Bot De Déclencheur"},
        {iso = "it-IT", text = "Bot Di Grilletto"},
    },

    ["triggerbot_tt"] = {
        {iso = "en-US", text = "A barebones triggerbot that uses game natives. No hackery involved.\10\10Press [Left Shift] while aiming at a ped to automatically shoot them in the head. Only works on foot."},
        {iso = "de-DE", text = "Ein Triggerbot mit Grundausstattung, der native Elemente des Spiels verwendet. Keine Hacker-Techniken erforderlich.\10\10Drücken Sie die [Linke Umschalttaste], während Sie auf einen Fußgänger zielen, um ihm automatisch in den Kopf zu schießen. Funktioniert nur zu Fuß."},
        {iso = "fr-FR", text = "Un déclencheur minimaliste qui utilise des éléments natifs du jeu. Aucun piratage n'est impliqué.\10\10Appuyez sur [Maj Gauche] tout en visant un piéton pour lui tirer automatiquement une balle dans la tête. Ne fonctionne qu'à pied."},
        {iso = "it-IT", text = "Un triggerbot essenziale che usa i nativi del gioco. Nessun hackeraggio coinvolto.\10\10Premi [Maiusc Sinistro] mentre miri a un pedone per sparargli automaticamente alla testa. Funziona solo a piedi."},
    },

    ["enemyonlyCB"] = {
        {iso = "en-US", text = "Enemies Only"},
        {iso = "de-DE", text = "Nur Feinde"},
        {iso = "fr-FR", text = "Ennemis Seulement"},
        {iso = "it-IT", text = "Solo Nemici"},
    },

    ["autokillCB"] = {
        {iso = "en-US", text = "Auto Kill Enemies"},
        {iso = "de-DE", text = "Automatisch Töten Feinde"},
        {iso = "fr-FR", text = "Auto-tuer Les Ennemis"},
        {iso = "it-IT", text = "Uccidi Automaticamente i Nemici"},
    },

    ["autokill_tt"] = {
        {iso = "en-US", text = "Automatically kill all enemies in your proximity."},
        {iso = "de-DE", text = "Töten sie automatisch alle feinde in ihrer nähe."},
        {iso = "fr-FR", text = "Tuez automatiquement tous les ennemis à proximité."},
        {iso = "it-IT", text = "Uccidi automaticamente tutti i nemici nelle tue vicinanze."},
    },

    ["vehicleTab"] = {
        {iso = "en-US", text = "Vehicle "},
        {iso = "de-DE", text = "Fahrzeug "},
        {iso = "fr-FR", text = "Véhicule "},
        {iso = "it-IT", text = "Veicolo "},
    },

    ["driftModeCB"] = {
        {iso = "en-US", text = "Activate Drift Mode"},
        {iso = "de-DE", text = "Drift-Modus Aktivieren"},
        {iso = "fr-FR", text = "Activer Le Mode Drift"},
        {iso = "it-IT", text = "Attiva La Modalità Drift"},
    },

    ["driftMode_tt"] = {
        {iso = "en-US", text = "This will make your car lose grip. Hold [Left Shift] to drift"},
        {iso = "de-DE", text = "Dadurch verliert Ihr Auto die Bodenhaftung. Halten Sie [Linke Umschalttaste] gedrückt, um zu driften"},
        {iso = "fr-FR", text = "Cela fera perdre l'adhérence à votre voiture. Maintenez la touche [Maj Gauche] pour drifter"},
        {iso = "it-IT", text = "Questo farà perdere aderenza alla tua auto. Tieni premuto [Maiusc sinistro] per andare alla deriva"},
    },

    ["driftSlider"] = {
        {iso = "en-US", text = "Intensity"},
        {iso = "de-DE", text = "Intensität"},
        {iso = "fr-FR", text = "Intensité"},
        {iso = "it-IT", text = "Intensità"},
    },

    ["driftSlider_tt"] = {
        {iso = "en-US", text = "Intensity"},
        {iso = "de-DE", text = "0: Kein Grip (sehr steif).\n1: Ausgewogen (empfohlen).\n2: Schwacher Drift.\n3: Schwächster Drift."},
        {iso = "fr-FR", text = "0 : Pas d'adhérence (très rigide).\n1 : Équilibré (recommandé).\n2 : Dérive faible.\n3 : Dérive la plus faible."},
        {iso = "it-IT", text = "0: Nessuna presa (molto rigido).\n1: Bilanciato (consigliato).\n2: Drift debole.\n3: Drift debolissimo."},
    },

    ["driftTiresCB"] = {
        {iso = "en-US", text = "Activate Drift Tires"},
        {iso = "de-DE", text = "Driftreifen Ausrüsten"},
        {iso = "fr-FR", text = "Équiper Les Pneus De Drift"},
        {iso = "it-IT", text = "Equipaggiare Pneumatici Da Drift"},
    },

    ["driftTires_tt"] = {
        {iso = "en-US", text = "Activate Drift Tires"},
        {iso = "de-DE", text = "Driftreifen Ausrüsten"},
        {iso = "fr-FR", text = "Équiper Les Pneus De Drift"},
        {iso = "it-IT", text = "Equipaggiare Pneumatici Da Drift"},
    },

    ["driftInvalidVehTxt"] = {
        {iso = "en-US", text = "\10You can only drift cars, trucks and quad bikes.\10\10"},
        {iso = "de-DE", text = "\10Sie können nur mit Autos, LKWs und Quads driften.\10\10"},
        {iso = "fr-FR", text = "\10Vous ne pouvez faire du drift que sur des voitures, des camions et des quads.\10\10"},
        {iso = "it-IT", text = "\10Si possono fare drifting solo con auto, camion e quad.\10\10"},
    },

    ["lvoCB"] = {
        {iso = "en-US", text = "Performance Cars Only"},
        {iso = "de-DE", text = "Nur Hochleistungsautos"},
        {iso = "fr-FR", text = "Voitures De Performance Uniquement"},
        {iso = "it-IT", text = "Solo Auto Ad Alte Prestazioni"},
    },

    ["lvo_tt"] = {
        {iso = "en-US", text = "Limit some options to performance vehicles only. For example, with this enabled slow and irrelevant vehicles will not have launch control or a crackle tune."},
        {iso = "de-DE", text = "Beschränken Sie einige Optionen auf Hochleistungsfahrzeuge. Wenn diese Option aktiviert ist, haben beispielsweise langsame und irrelevante Fahrzeuge kein Launch Control oder ein Pops & Bangs."},
        {iso = "fr-FR", text = "Limitez certaines options aux véhicules performants uniquement. Par exemple, si cette option est activée, les véhicules lents et non pertinents n'auront pas de Launch Control ou de Pops & Bangs."},
        {iso = "it-IT", text = "Limita alcune opzioni solo ai veicoli ad alte prestazioni. Ad esempio, con questa opzione abilitata, i veicoli lenti e irrilevanti non avranno Launch Control o un Pops & Bangs."},
    },

    ["lct_tt"] = {
        {iso = "en-US", text = "When your vehicle is completely stopped, press and hold [Accelerate] + [Brake] for 3 seconds then let go of the brakes."},
        {iso = "de-DE", text = "Wenn Ihr Fahrzeug vollständig zum Stillstand gekommen ist, halten Sie die Tasten [Beschleunigen] + [Bremsen] drei Sekunden lang gedrückt und lassen Sie dann die Bremsen los."},
        {iso = "fr-FR", text = "Lorsque votre véhicule est complètement arrêté, maintenez enfoncés [Accélérer] + [Frein] pendant 3 secondes puis relâchez les freins."},
        {iso = "it-IT", text = "Quando il veicolo è completamente fermo, tieni premuti [Accelerazione] + [Freno] per 3 secondi, quindi rilascia i freni."},
    },

    ["speedBoost_tt"] = {
        {iso = "en-US", text = "A speed boost that simulates nitrous. Gives you more power and increases your top speed when pressing [Left Shift]."},
        {iso = "de-DE", text = "Ein Geschwindigkeitsschub, der Lachgas simuliert. Verleiht Ihnen mehr Leistung und erhöht Ihre Höchstgeschwindigkeit, wenn Sie die [Linke Umschalttaste] drücken."},
        {iso = "fr-FR", text = "Un boost de vitesse qui simule le protoxyde d'azote. Vous donne plus de puissance et augmente votre vitesse de pointe lorsque vous appuyez sur [Maj Gauche]."},
        {iso = "it-IT", text = "Un aumento di velocità che simula il nitro. Ti dà più potenza e aumenta la tua velocità massima quando premi [Maiusc Sinistro]."},
    },

    ["vfx_tt"] = {
        {iso = "en-US", text = "Activates a visual effect on your screen when using NOS."},
        {iso = "de-DE", text = "Aktiviert einen visuellen Effekt auf Ihrem Bildschirm, wenn Sie NOS verwenden."},
        {iso = "fr-FR", text = "Active un effet visuel sur votre écran lorsque vous utilisez NOS."},
        {iso = "it-IT", text = "Attiva un effetto visivo sullo schermo quando si utilizza NOS."},
    },

    ["loudradio_tt"] = {
        {iso = "en-US", text = "Makes your vehicle's radio sound louder from the outside. To notice the difference, activate this option then stand close to your car while the engine is running and the radio is on."},
        {iso = "de-DE", text = "Lässt das Radio Ihres Fahrzeugs von außen lauter klingen. Um den Unterschied zu spüren, aktivieren Sie diese Option und stehen Sie dann bei laufendem Motor und eingeschaltetem Radio in der Nähe Ihres Autos."},
        {iso = "fr-FR", text = "Augmente le volume de la radio de votre véhicule depuis l'extérieur. Pour constater la différence, activez cette option puis placez-vous à proximité de votre voiture pendant que le moteur tourne et que la radio est allumée."},
        {iso = "it-IT", text = "Rende più forte il suono della radio del tuo veicolo dall'esterno. Per notare la differenza, attiva questa opzione, quindi stai vicino alla tua auto mentre il motore è in funzione e la radio è accesa."},
    },

    ["purge_tt"] = {
        {iso = "en-US", text = "Press [X] on keyboard or [A] on controller to purge your NOS Fast & Furious style."},
        {iso = "de-DE", text = "Drücken Sie [X] auf der Tastatur oder [A] auf dem Controller, um Ihren NOS Fast & Furious-Stil zu löschen."},
        {iso = "fr-FR", text = "Appuyez sur [X] sur le clavier ou [A] sur le contrôleur pour purger votre NOS à la Fast & Furious."},
        {iso = "it-IT", text = "Premi [X] sulla tastiera o [A] sul controller per purgare il tuo NOS alla stile Fast & Furious."},
    },

    ["pnb_tt"] = {
        {iso = "en-US", text = "Enables exhaust pops whenever you let go of [Accelerate] from high RPM."},
        {iso = "de-DE", text = "Aktiviert Abgasstöße, wenn Sie die [Beschleunigen]-Taste bei hohen Motordrehzahlen loslassen."},
        {iso = "fr-FR", text = "Active les rafales d'échappement lorsque vous relâchez la touche [Accélérer] à partir d'un régime moteur élevé."},
        {iso = "it-IT", text = "Attiva gli scarichi di scarico quando si rilascia il pulsante [Accelera] a regimi elevati del motore."},
    },

    ["louderpnb_tt"] = {
        {iso = "en-US", text = "Makes your Pops & Bangs sound extremely loud."},
        {iso = "de-DE", text = "Lässt 'Pops & Bangs' extrem laut klingen."},
        {iso = "fr-FR", text = "Rend le son de 'Pops & Bangs' extrêmement fort."},
        {iso = "it-IT", text = "Rende il suono di 'Pops & Bangs' estremamente forte."},
    },

    ["highbeams_tt"] = {
        {iso = "en-US", text = "Flash your high beams when honking."},
        {iso = "de-DE", text = "Schalten sie das fernlicht ein, wenn sie hupen."},
        {iso = "fr-FR", text = "Allumez vos feux de route lorsque vous klaxonnez."},
        {iso = "it-IT", text = "Accendi gli abbaglianti quando suoni il clacson."},
    },

    ["brakeLight_tt"] = {
        {iso = "en-US", text = "Automatically turns on the brake lights when your car is stopped."},
        {iso = "de-DE", text = "Schaltet die Bremslichter automatisch ein, wenn Ihr Auto anhält."},
        {iso = "fr-FR", text = "Allume automatiquement les feux stop lorsque votre voiture est à l'arrêt."},
        {iso = "it-IT", text = "Accende automaticamente le luci dei freni quando l'auto è ferma."},
    },

    ["engineOn_tt"] = {
        {iso = "en-US", text = "Brings back GTA IV's vehicle exit: Hold [F] to turn off the engine before exiting the vehicle or press normally to exit and keep it running."},
        {iso = "de-DE", text = "Bringt die Funktion zum Aussteigen aus dem Fahrzeug aus GTA IV zurück: Halten Sie [F] gedrückt, um den Motor auszuschalten, bevor Sie das Fahrzeug verlassen, oder drücken Sie normal, um auszusteigen und das Fahrzeug am Laufen zu halten."},
        {iso = "fr-FR", text = "Ramène la sortie du véhicule de GTA IV : maintenez la touche [F] pour éteindre le moteur avant de sortir du véhicule ou appuyez normalement pour sortir et le laisser en marche."},
        {iso = "it-IT", text = "Ripristina l'uscita dal veicolo di GTA IV: tieni premuto [F] per spegnere il motore prima di uscire dal veicolo o premi normalmente per uscire e tenerlo in funzione."},
    },

    ["canttouchthis_tt"] = {
        {iso = "en-US", text = "Prevent NPCs and players from carjacking you."},
        {iso = "de-DE", text = "Verhindert, dass NPCs und Spieler Sie aus Ihrem Auto zerren."},
        {iso = "fr-FR", text = "Empêche les PNJ et les joueurs de vous faire sortir de votre voiture."},
        {iso = "it-IT", text = "Impedisce ai PNG e ai giocatori di trascinarti fuori dalla tua auto."},
    },

    ["rgbSlider"] = {
        {iso = "en-US", text = "RGB Speed"},
        {iso = "de-DE", text = "RGB-Geschwindigkeit"},
        {iso = "fr-FR", text = "Vitesse RVB"},
        {iso = "it-IT", text = "Velocità RGB"},
    },

    ["engineSoundBtn"] = {
        {iso = "en-US", text = "Change Engine Sound"},
        {iso = "de-DE", text = "Motorsound Ändern"},
        {iso = "fr-FR", text = "Changer Le Son Du Moteur"},
        {iso = "it-IT", text = "Cambia Il Suono Del Motore"},
    },

    ["engineSoundErr"] = {
        {iso = "en-US", text = "This option only works on road vehicles."},
        {iso = "de-DE", text = "Diese Option funktioniert nur bei Straßenfahrzeugen."},
        {iso = "fr-FR", text = "Cette option ne fonctionne que sur les véhicules routiers."},
        {iso = "it-IT", text = "Questa opzione funziona solo sui veicoli stradali."},
    },

    ["closeBtn"] = {
        {iso = "en-US", text = "Close"},
        {iso = "de-DE", text = "Schließen"},
        {iso = "fr-FR", text = "Fermer"},
        {iso = "it-IT", text = "Chiudere"},
    },

    ["openBtn"] = {
        {iso = "en-US", text = "Open"},
        {iso = "de-DE", text = "Offen"},
        {iso = "fr-FR", text = "Ouvrir"},
        {iso = "it-IT", text = "Aprire"},
    },

    ["searchVeh_hint"] = {
        {iso = "en-US", text = "Search Vehicle Names"},
        {iso = "de-DE", text = "Suche nach Fahrzeugnamen"},
        {iso = "fr-FR", text = "Rechercher les noms de véhicules"},
        {iso = "it-IT", text = "Cerca nomi veicoli"},
    },

    ["Use This Sound"] = {
        {iso = "en-US", text = "Use This Sound"},
        {iso = "de-DE", text = "Diesen ton verwenden"},
        {iso = "fr-FR", text = "Utilisez ce son"},
        {iso = "it-IT", text = "Usa questo suono"},
    },

    ["Restore Default"] = {
        {iso = "en-US", text = "Restore Default"},
        {iso = "de-DE", text = "Wiederherstellen"},
        {iso = "fr-FR", text = "Restaurer"},
        {iso = "it-IT", text = "Ristabilire"},
    },

    ["Fix Engine"] = {
        {iso = "en-US", text = "Fix Engine"},
        {iso = "de-DE", text = "Motor Reparieren"},
        {iso = "fr-FR", text = "Réparer Le Moteur"},
        {iso = "it-IT", text = "Correggi Il Motore"},
    },

    ["Destroy Engine"] = {
        {iso = "en-US", text = "Destroy Engine"},
        {iso = "de-DE", text = "Motor Zerstören"},
        {iso = "fr-FR", text = "Détruire Le Moteur"},
        {iso = "it-IT", text = "Distruggi Il Motore"},
    },

    ["getinveh"] = {
        {iso = "en-US", text = "Please get in a vehicle!"},
        {iso = "de-DE", text = "Steigen sie bitte in ein fahrzeug!"},
        {iso = "fr-FR", text = "Montez dans un véhicule SVP !"},
        {iso = "it-IT", text = "Per favore, salite su un veicolo!"},
    },

    ["playersTab"] = {
        {iso = "en-US", text = "Players "},
        {iso = "de-DE", text = "Spieler "},
        {iso = "fr-FR", text = "Joueurs "},
        {iso = "it-IT", text = "Giocatori "},
    },

    ["temporarily disabled"] = {
        {iso = "en-US", text = "Temporarily Disabled"},
        {iso = "de-DE", text = "Zeitweise Deaktiviert"},
        {iso = "fr-FR", text = "Temporairement Désactivé"},
        {iso = "it-IT", text = "Temporaneamente Disabilitato"},
    },

    ["worldTab"] = {
        {iso = "en-US", text = "World "},
        {iso = "de-DE", text = "Welt "},
        {iso = "fr-FR", text = "Monde "},
        {iso = "it-IT", text = "Mondo "},
    },

    ["failedToCtrlNPC"] = {
        {iso = "en-US", text = "Failed to take control of the NPC!"},
        {iso = "de-DE", text = "Die Kontrolle über den NPC konnte nicht übernommen werden!"},
        {iso = "fr-FR", text = "Échec de la prise de contrôle du PNJ !"},
        {iso = "it-IT", text = "Impossibile prendere il controllo del PNG!"},
    },

    ["pedGrabber"] = {
        {iso = "en-US", text = "Ped Grabber"},
        {iso = "de-DE", text = "???"},
        {iso = "fr-FR", text = ""},
        {iso = "it-IT", text = ""},
    },

    ["pedGrabber_tt"] = {
        {iso = "en-US", text = "Stand close to an NPC who's on foot then pess [FIRE] to grab them. Once they are grabbed, hold [AIM] then press [FIRE] again to throw them."},
        {iso = "de-DE", text = "Stellen Sie sich in die Nähe eines NPCs, der zu Fuß unterwegs ist, und drücken Sie [FEUER], um ihn zu packen. Sobald sie gepackt sind, halten Sie [AIM] und drücken Sie erneut [FIRE], um sie zu werfen."},
        {iso = "fr-FR", text = "Placez-vous près d'un PNJ à pied et appuyez sur [FEU] pour l'attraper. Une fois qu'ils sont saisis, maintenez [AIM] puis appuyez à nouveau sur [FEU] pour les lancer."},
        {iso = "it-IT", text = "Avvicinatevi a un PNG a piedi e premete [FUOCO] per afferrarlo. Una volta afferrato, tenete premuto [MIRARE] e premete di nuovo [FUOCO] per lanciarlo."},
    },

    ["Throw Force"] = {
        {iso = "en-US", text = "Throw Force:"},
        {iso = "de-DE", text = "???"},
        {iso = "fr-FR", text = "Force De Projection :"},
        {iso = "it-IT", text = "Forza Di Lancio:"},
    },

    ["carpool"] = {
        {iso = "en-US", text = "Ride With NPCs"},
        {iso = "de-DE", text = "Reiten Mit NPCs"},
        {iso = "fr-FR", text = "Chevaucher Avec Les PNJ"},
        {iso = "it-IT", text = "Cavalcare Con I PNG"},
    },

    ["carpool_tt"] = {
        {iso = "en-US", text = "Allows you to get in NPC vehicles as passenger."},
        {iso = "de-DE", text = "Ermöglicht es dir, als Beifahrer in NPC-Fahrzeuge einzusteigen."},
        {iso = "fr-FR", text = "Permet de monter dans les véhicules des PNJ en tant que passager."},
        {iso = "it-IT", text = "Permette di salire sui veicoli degli NPC come passeggero."},
    },

    ["prevSeat"] = {
        {iso = "en-US", text = "Previous Seat"},
        {iso = "de-DE", text = "Vorheriger Sitz"},
        {iso = "fr-FR", text = "Siège Précédent"},
        {iso = "it-IT", text = "Sede Precedente"},
    },

    ["nextSeat"] = {
        {iso = "en-US", text = "Next Seat"},
        {iso = "de-DE", text = "Nächster Sitz"},
        {iso = "fr-FR", text = "Siège Suivant"},
        {iso = "it-IT", text = "Prossima Sede"},
    },

    ["settingsTab"] = {
        {iso = "en-US", text = "Settings "},
        {iso = "de-DE", text = "Einstellungen "},
        {iso = "fr-FR", text = "Paramètres "},
        {iso = "it-IT", text = "Impostazioni "},
    },

    ["Disable Tooltips"] = {
        {iso = "en-US", text = "Disable Tooltips"},
        {iso = "de-DE", text = "Tooltips Deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Les Infobulles"},
        {iso = "it-IT", text = "Disattivare I Suggerimenti"},
    },

    ["DisableSound"] = {
        {iso = "en-US", text = "Disable UI Sound"},
        {iso = "de-DE", text = "UI-Ton Deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Le Son De l'IU"},
        {iso = "it-IT", text = "Disattivare Il Suono Dell'IU"},
    },

    ["DisableSound_tt"] = {
        {iso = "en-US", text = "Disable sound feedback from UI widgets."},
        {iso = "de-DE", text = "???"},
        {iso = "fr-FR", text = "Désactiver le retour sonore des widgets de l'interface utilisateur."},
        {iso = "it-IT", text = "Disabilita il feedback sonoro dai widget dell'interfaccia utente."},
    },

    ["langTitle"] = {
        {iso = "en-US", text = "Language: "},
        {iso = "de-DE", text = "Sprache: "},
        {iso = "fr-FR", text = "Langue: "},
        {iso = "it-IT", text = "Lingua: "},
    },

    ["gameLangCB"] = {
        {iso = "en-US", text = "Use Game Language"},
        {iso = "de-DE", text = "Spielsprache Verwenden"},
        {iso = "fr-FR", text = "Utiliser Le Langage Du Jeu"},
        {iso = "it-IT", text = "Utilizzare Il Linguaggio Del Gioco"},
    },

    ["gameLang_tt"] = {
        {iso = "en-US", text = "To choose a different language, disable this option."},
        {iso = "de-DE", text = "Um eine andere sprache zu wählen, deaktivieren sie diese option."},
        {iso = "fr-FR", text = "Pour choisir une autre langue, désactivez cette option."},
        {iso = "it-IT", text = "Per scegliere una lingua diversa, disattivare questa opzione."},
    },

    ["customLangTxt"] = {
        {iso = "en-US", text = "Custom"},
        {iso = "de-DE", text = "Personalisiert"},
        {iso = "fr-FR", text = "Personnalisé"},
        {iso = "it-IT", text = "Personalizzato"},
    },

    ["saveBtn"] = {
        {iso = "en-US", text = " Save "},
        {iso = "de-DE", text = " Speichern "},
        {iso = "fr-FR", text = " Enregistrer "},
        {iso = "it-IT", text = " Risparmiare "},
    },

    ["lang_success_msg"] = {
        {iso = "en-US", text = "Language settings saved. Please reload the script to apply the changes."},
        {iso = "de-DE", text = "Spracheinstellungen gespeichert. Bitte laden sie das skript neu, um die Änderungen zu übernehmen."},
        {iso = "fr-FR", text = "Les paramètres linguistiques ont été enregistrés. Veuillez recharger le script pour appliquer les changements."},
        {iso = "it-IT", text = "Impostazioni della lingua salvate. Ricaricare lo script per applicare le modifiche."},
    },

    ["reset_settings_Btn"] = {
        {iso = "en-US", text = "Reset Settings"},
        {iso = "de-DE", text = "Alles Zurücksetzen"},
        {iso = "fr-FR", text = "Réinitialiser Tout"},
        {iso = "it-IT", text = "Resettare Tutto"},
    },

    ["confirm_txt"] = {
        {iso = "en-US", text = "Are you sure?"},
        {iso = "de-DE", text = "Bist du dir dicher?"},
        {iso = "fr-FR", text = "Êtes-vous sûr?"},
        {iso = "it-IT", text = "Sei sicuro?"},
    },

    ["yes"] = {
        {iso = "en-US", text = "Yes"},
        {iso = "de-DE", text = "Ja"},
        {iso = "fr-FR", text = "Oui"},
        {iso = "it-IT", text = "Si"},
    },

    ["no"] = {
        {iso = "en-US", text = "No"},
        {iso = "de-DE", text = "Nein"},
        {iso = "fr-FR", text = "Non"},
        {iso = "it-IT", text = "No"},
    },
}

---@param g string
function translateLabel(g)
    local retStr
    if Labels[g] then
        for _, v in pairs(Labels[g]) do
            if LANG == v.iso then
                retStr = v.text
                break
            end
        end
        if retStr == nil or retStr == "" then
            gui.show_error("Samurai's Scripts", "Unsupported language detected! Defaulting to English.")
            log.warning("Unsupported language detected! Defaulting to English.")
            retStr = Labels[g][1].text
        end
    else
        retStr = tostring(g) .. " [LABEL NOT FOUND!]"
    end
    return retStr
end