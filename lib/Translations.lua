---@diagnostic disable: undefined-global, lowercase-global

require('lib/samurais_utils')

Labels = {
    ["Self"] = {
        {iso = "en-US", text = "Self "},
        {iso = "de-DE", text = "Selbst "},
        {iso = "fr-FR", text = "Soi "},
        {iso = "it-IT", text = "L'io "},
        {iso = "pt-BR", text = "Autônomo "},
    },

    ["Auto-Heal"] = {
        {iso = "en-US", text = "Auto-Heal"},
        {iso = "de-DE", text = "Auto-Heilung"},
        {iso = "fr-FR", text = "Auto-Guérison"},
        {iso = "it-IT", text = "Auto-Guarigione"},
        {iso = "pt-BR", text = "Auto-Cura"},
    },

    ["autoheal_tooltip"] = {
        {iso = "en-US", text = "Automatically refill your health and armour."},
        {iso = "de-DE", text = "Füllt die Gesundheit und Rüstung automatisch wieder auf."},
        {iso = "fr-FR", text = "Rechargez automatiquement votre santé et votre armure."},
        {iso = "it-IT", text = "Ricarica automaticamente la tua salute e la tua armatura."},
        {iso = "pt-BR", text = "Recarregue automaticamente sua saúde e armadura."},
    },

    ["objectiveTP"] = {
        {iso = "en-US", text = "Teleport To Objective."},
        {iso = "de-DE", text = "Zum (Missions-)Ziel teleportieren."},
        {iso = "fr-FR", text = "Téléportation Vers L'objectif."},
        {iso = "it-IT", text = "Teletrasporto All'obiettivo."},
        {iso = "pt-BR", text = "Teleportar para o objetivo."},
    },

    ["objectiveTP_tooltip"] = {
        {iso = "en-US", text = "While this option is enabled, press [F10] to teleport to mission objectives."},
        {iso = "de-DE", text = "Wenn aktiviert, [F10] drücken um sich zum aktuellen Missionsziel zu teleportieren."},
        {iso = "fr-FR", text = "Lorsque cette option est activée, appuyez sur [F10] pour téléporter vers les objectifs de la mission."},
        {iso = "it-IT", text = "Mentre questa opzione è abilitata, premi [F10] per teletrasportarti agli obiettivi della missione."},
        {iso = "pt-BR", text = "Enquanto essa opção estiver ativada, pressione [F10] para se teletransportar para os objetivos da missão."},
    },

    ["CrouchCB"] = {
        {iso = "en-US", text = "Crouch Instead of Sneak"},
        {iso = "de-DE", text = "Ducken statt Schleichen"},
        {iso = "fr-FR", text = "Accroupir"},
        {iso = "it-IT", text = "Accovacciarsi"},
        {iso = "pt-BR", text = "Agachamento"},
    },

    ["Crouch_tooltip"] = {
        {iso = "en-US", text = "Replace stealth mode's sneaking animation (Left CTRL) with crouching."},
        {iso = "de-DE", text = "Ersetzt die Schleichanimation (L-STRG)."},
        {iso = "fr-FR", text = "Remplacez l'animation de furtivité (CTRL Gauche) par l'accroupissement."},
        {iso = "it-IT", text = "Sostituisci l'animazione furtiva (CTRL sinistro) con quella accovacciata."},
        {iso = "pt-BR", text = "Substituir a animação de esgueirar-se do modo furtivo (CTRL Esquerda) por agachar-se."},
    },

    ["PhoneAnimCB"] = {
        {iso = "en-US", text = "Enable Phone Animations"},
        {iso = "de-DE", text = "Aktiviere Handy-animationen"},
        {iso = "fr-FR", text = "Activer Les Animations Du Téléphone"},
        {iso = "it-IT", text = "Abilita Animazioni Telefono"},
        {iso = "pt-BR", text = "Ativar Animações Do Telefone"},
    },

    ["PhoneAnim_tooltip"] = {
        {iso = "en-US", text = "Restores the disabled phone animations from Single Player."},
        {iso = "de-DE", text = "Aktiviert die Handy-animationen aus dem Einzelspielermodus für GTA Online."},
        {iso = "fr-FR", text = "Restaure les animations téléphoniques désactivées du mode solo."},
        {iso = "it-IT", text = "Ripristina le animazioni del telefono disabilitate nella modalità giocatore singolo."},
        {iso = "pt-BR", text = "Restaura as animações telefônicas desativadas do modo Single Player."},
    },

    ["SprintInsideCB"] = {
        {iso = "en-US", text = "Sprint Inside Interiors"},
        {iso = "de-DE", text = "Drinnen sprinten"},
        {iso = "fr-FR", text = "Courir Dans Les Intérieurs"},
        {iso = "it-IT", text = "Correre Al Chiuso"},
        {iso = "pt-BR", text = "Correndo Em Interiores"},
    },

    ["SprintInside_tooltip"] = {
        {iso = "en-US", text = "Allows you to sprint at full speed inside interiors that do not allow it like the Casino. Some interiors will still force you to run slowly."},
        {iso = "de-DE", text = "Ermöglicht das Sprinten in Innenräumen. (Nicht in allen Innenräumen möglich)"},
        {iso = "fr-FR", text = "Permet de sprinter à pleine vitesse dans des intérieurs qui ne le permettent pas comme le Casino. Certains intérieurs vous obligeront tout de même à courir lentement."},
        {iso = "it-IT", text = "Ti consente di correre a tutta velocità all'interno di interni che non lo consentono, come il Casinò. Alcuni interni ti costringeranno comunque a correre lentamente."},
        {iso = "pt-BR", text = "Permite que você corra a toda velocidade em interiores que não permitem isso, como o Cassino. Alguns interiores ainda o forçarão a correr lentamente."},
    },

    ["LockpickCB"] = {
        {iso = "en-US", text = "Use Lockpick Animation"},
        {iso = "de-DE", text = "Dietrich-animation"},
        {iso = "fr-FR", text = "Utiliser L'animation De Crochetage"},
        {iso = "it-IT", text = "Usa L'animazione Del Gancio"},
        {iso = "pt-BR", text = "Usar Animação De Arrombamento"},
    },

    ["Lockpick_tooltip"] = {
        {iso = "en-US", text = "When stealing vehicles, your character will use the lockpick animation instead of breaking the window."},
        {iso = "de-DE", text = "Aktiviert die Dietrich-animation, beim Stehlen von Fahrzeugen, anstatt das Fenster einzuschlagen."},
        {iso = "fr-FR", text = "Lors du vol de véhicules, votre personnage utilisera l'animation de crochetage au lieu de casser la vitre."},
        {iso = "it-IT", text = "Quando rubi veicoli, il tuo personaggio userà l'animazione del grimaldello invece di rompere il finestrino."},
        {iso = "pt-BR", text = "Ao roubar veículos, seu personagem usará a animação de lockpick em vez de quebrar a janela."},
    },

    ["ActionModeCB"] = {
        {iso = "en-US", text = "Disable Action Mode"},
        {iso = "de-DE", text = "Aktionsmodus deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Le Mode D'action"},
        {iso = "it-IT", text = "Disabilita La Modalità Azione"},
        {iso = "pt-BR", text = "Desativar O Modo De Ação"},
    },

    ["ActionMode_tooltip"] = {
        {iso = "en-US", text = "Disables the forced movement style the player uses after firing a weapon. Note that this also disables stealth mode."},
        {iso = "de-DE", text = "Deaktiviert den erzwungenen Bewegungsstil des Charakters, nach dem Abfeuern einer Waffe. Das Schleichen [STRG] wird dadurch deaktiviert."},
        {iso = "fr-FR", text = "Désactive le style de mouvement forcé que le joueur utilise après avoir tiré avec une arme. Notez que cela désactive également le mode furtif."},
        {iso = "it-IT", text = "Disattiva lo stile di movimento forzato che il giocatore usa dopo aver sparato con un'arma. Nota che questo disattiva anche la modalità stealth."},
        {iso = "pt-BR", text = "Desativa o estilo de movimento forçado que o jogador usa depois de disparar uma arma. Observe que isso também desativa o modo furtivo."},
    },

    ["soundplayer"] = {
        {iso = "en-US", text = "Sound Player"},
        {iso = "de-DE", text = "Sound Player"},
        {iso = "fr-FR", text = "Joueur De Son"},
        {iso = "it-IT", text = "Lettore Suonare"},
        {iso = "pt-BR", text = "Reprodutor De Som"},
    },

    ["malesounds"] = {
        {iso = "en-US", text = "Male Sounds"},
        {iso = "de-DE", text = "Männliche Geräusche"},
        {iso = "fr-FR", text = "Sons Masculins"},
        {iso = "it-IT", text = "Suoni Maschili"},
        {iso = "pt-BR", text = "Sons Masculinos"},
    },

    ["femalesounds"] = {
        {iso = "en-US", text = "Female Sounds"},
        {iso = "de-DE", text = "Weibliche Geräusche"},
        {iso = "fr-FR", text = "Sons Feminins"},
        {iso = "it-IT", text = "Suoni Femminili"},
        {iso = "pt-BR", text = "Sons Femininos"},
    },

    ["playButton"] = {
        {iso = "en-US", text = " Play "},
        {iso = "de-DE", text = " Spielen "},
        {iso = "fr-FR", text = " Jouer "},
        {iso = "it-IT", text = " Giocare "},
        {iso = "pt-BR", text = " Jogar "},
    },

    ["weaponTab"] = {
        {iso = "en-US", text = "Weapon "},
        {iso = "de-DE", text = "Waffe "},
        {iso = "fr-FR", text = "Arme "},
        {iso = "it-IT", text = "Arma "},
        {iso = "pt-BR", text = "Arma "},
    },

    ["hashgrabberCB"] = {
        {iso = "en-US", text = "Info Gun"},
        {iso = "de-DE", text = "Info Waffe"},
        {iso = "fr-FR", text = "Arme D'infos"},
        {iso = "it-IT", text = "Arma Di Informazioni"},
        {iso = "pt-BR", text = "Arma De Informação"},
    },

    ["hashgrabber_tt"] = {
        {iso = "en-US", text = "This is mainly for developers. Aim your gun at a game entity and press [FIRE] to get information about it."},
        {iso = "de-DE", text = "Funktion für Entwickler. Mit Waffe auf ein Spielobjekt zielen und [FEUER] drücken, um informationen zum Objekt zu erhalten."},
        {iso = "fr-FR", text = "Ceci est principalement destiné aux développeurs. Visez une entité du jeu avec votre arme et appuyez sur [TIRER] pour obtenir des informations à son sujet."},
        {iso = "it-IT", text = "Questo è principalmente per gli sviluppatori. Punta la tua pistola a un'entità di gioco e premi [FUOCO] per ottenere informazioni su di essa."},
        {iso = "pt-BR", text = "Isso é principalmente para os desenvolvedores. Aponte sua arma para uma entidade do jogo e pressione [FIRE] para obter informações sobre ela."},
    },

    ["triggerbotCB"] = {
        {iso = "en-US", text = "Trigger Bot"},
        {iso = "de-DE", text = "Trigger Bot"},
        {iso = "fr-FR", text = "Bot De Déclencheur"},
        {iso = "it-IT", text = "Bot Di Grilletto"},
        {iso = "pt-BR", text = "Bot De Gatilho"},
    },

    ["triggerbot_tt"] = {
        {iso = "en-US", text = "A barebones triggerbot that uses game natives. No hackery involved.\10\10Press [Left Shift] while aiming at a ped to automatically shoot them in the head. Only works on foot."},
        {iso = "de-DE", text = "Ein Triggerbot, der 'native Elemente' (RAGE natives) des Spiels verwendet. Keine Hacks involviert.\10\10Drücke die [Linke Umschalttaste], während des Zielen auf einen NPC, um diesen automatisch in den Kopf zu schießen. Funktioniert nur zu Fuß."},
        {iso = "fr-FR", text = "Un triggerbot minimaliste qui utilise les natifs du jeu (RAGE natives). Aucun piratage n'est impliqué.\10\10Appuyez sur [Maj Gauche] tout en visant un piéton pour lui tirer automatiquement une balle dans la tête. Ne fonctionne qu'à pied."},
        {iso = "it-IT", text = "Un triggerbot essenziale che usa i nativi del gioco. Nessun hackeraggio coinvolto.\10\10Premi [Maiusc Sinistro] mentre miri a un pedone per sparargli automaticamente alla testa. Funziona solo a piedi."},
        {iso = "pt-BR", text = "Um triggerbot simples que usa nativos do jogo. Não há hackers envolvidos.\10\10Pressione [Shift esquerdo] ao mirar em um pedestre para atirar automaticamente na cabeça dele. Só funciona a pé."},
    },

    ["enemyonlyCB"] = {
        {iso = "en-US", text = "Enemies Only"},
        {iso = "de-DE", text = "Nur Gegner/Feinde"},
        {iso = "fr-FR", text = "Ennemis Seulement"},
        {iso = "it-IT", text = "Solo Nemici"},
        {iso = "pt-BR", text = "Somente Inimigos"},
    },

    ["autokillCB"] = {
        {iso = "en-US", text = "Auto Kill Enemies"},
        {iso = "de-DE", text = "Automatisches Töten von Gegnern/Feinden"},
        {iso = "fr-FR", text = "Auto-tuer Les Ennemis"},
        {iso = "it-IT", text = "Uccidi Automaticamente i Nemici"},
        {iso = "pt-BR", text = "Matar Inimigos Automaticamente"},
    },

    ["autokill_tt"] = {
        {iso = "en-US", text = "Automatically kill all enemies in your proximity."},
        {iso = "de-DE", text = "Tötet automatisch alle Gegner/Feinde in unmittelbarer nähe."},
        {iso = "fr-FR", text = "Tuez automatiquement tous les ennemis à proximité."},
        {iso = "it-IT", text = "Uccidi automaticamente tutti i nemici nelle tue vicinanze."},
        {iso = "pt-BR", text = "Mate automaticamente todos os inimigos que estiverem próximos a você."},
    },

    ["vehicleTab"] = {
        {iso = "en-US", text = "Vehicle "},
        {iso = "de-DE", text = "Fahrzeug "},
        {iso = "fr-FR", text = "Véhicule "},
        {iso = "it-IT", text = "Veicolo "},
        {iso = "pt-BR", text = "Veículo "},
    },

    ["driftModeCB"] = {
        {iso = "en-US", text = "Activate Drift Mode"},
        {iso = "de-DE", text = "Drift-Modus aktivieren"},
        {iso = "fr-FR", text = "Activer Le Mode Drift"},
        {iso = "it-IT", text = "Attiva La Modalità Drift"},
        {iso = "pt-BR", text = "Ativar O Modo Drift"},
    },

    ["driftMode_tt"] = {
        {iso = "en-US", text = "This will make your car lose grip. Hold [Left Shift] to drift."},
        {iso = "de-DE", text = "Das Fahrzeug verliert dadurch die Bodenhaftung. Halte [Linke Umschalttaste] gedrückt, um zu driften."},
        {iso = "fr-FR", text = "Cela fera perdre l'adhérence à votre voiture. Maintenez la touche [Maj Gauche] pour drifter."},
        {iso = "it-IT", text = "Questo farà perdere aderenza alla tua auto. Tieni premuto [Maiusc sinistro] per andare alla deriva."},
        {iso = "pt-BR", text = "Isso fará com que seu carro perca a aderência. Mantenha pressionada a tecla [Shift esquerdo] para fazer drift."},
    },

    ["driftSlider"] = {
        {iso = "en-US", text = "Intensity"},
        {iso = "de-DE", text = "Intensität"},
        {iso = "fr-FR", text = "Intensité"},
        {iso = "it-IT", text = "Intensità"},
        {iso = "pt-BR", text = "Intensidade"},
    },

    ["driftSlider_tt"] = {
        {iso = "en-US", text = "0: No Grip (very stiff).\n1: Balanced (Recommended).\n2: Weak Drift.\n3: Weakest Drift."},
        {iso = "de-DE", text = "0: Kein Grip (sehr steif).\n1: Ausgewogen (empfohlen).\n2: Schwacher Drift.\n3: Schwächster Drift."},
        {iso = "fr-FR", text = "0 : Pas d'adhérence (très rigide).\n1 : Équilibré (recommandé).\n2 : Dérive faible.\n3 : Dérive la plus faible."},
        {iso = "it-IT", text = "0: Nessuna presa (molto rigido).\n1: Bilanciato (consigliato).\n2: Drift debole.\n3: Drift debolissimo."},
        {iso = "pt-BR", text = "0: Sem aderência (muito rígido).\n1: Equilibrado (recomendado).\n2: Drift fraco.\n3: Drift mais fraco."},
    },

    ["driftTiresCB"] = {
        {iso = "en-US", text = "Equip Drift Tires"},
        {iso = "de-DE", text = "Driftreifen ausrüsten"},
        {iso = "fr-FR", text = "Équiper Les Pneus De Drift"},
        {iso = "it-IT", text = "Equipaggiare Pneumatici Da Drift"},
        {iso = "pt-BR", text = "Equipar Pneus De Drift"},
    },

    ["driftTires_tt"] = {
        {iso = "en-US", text = "This will equip your car with drift tires whenever you press [Left Shift]. Your tires will be reset when you release the button."},
        {iso = "de-DE", text = "Dadurch wird das Fahrzeug mit Drift-Reifen ausgestattet, wenn die [Linke Umschalttaste] gedrückt wird. Die Reifen werden wiederhergestellt, wenn die Taste losgelassen wird."},
        {iso = "fr-FR", text = "Cela équipera votre voiture de pneus de drift lorsque vous appuierez sur [MAJ Droite]. Vos pneus seront réinitialisés lorsque vous relâcherez le bouton."},
        {iso = "it-IT", text = "Questo equipaggerà l'auto con pneumatici da drift quando si preme [Left Shift]. I pneumatici verranno ripristinati quando si rilascia il pulsante."},
        {iso = "pt-BR", text = "Isso equipará seu carro com pneus de drift sempre que você pressionar [Left Shift]. Seus pneus serão zerados quando você soltar o botão."},
    },

    ["driftInvalidVehTxt"] = {
        {iso = "en-US", text = "\10You can only drift cars, trucks and quad bikes.\10\10"},
        {iso = "de-DE", text = "\10Das Driften funktioniert nur mit Autos, LKWs und Quads.\10\10"},
        {iso = "fr-FR", text = "\10Vous ne pouvez faire du drift que sur des voitures, des camions et des quads.\10\10"},
        {iso = "it-IT", text = "\10Si possono fare drifting solo con auto, camion e quad.\10\10"},
        {iso = "pt-BR", text = "\10Você só pode fazer drift de carros, caminhões e quadriciclos.\10\10"},
    },

    ["lvoCB"] = {
        {iso = "en-US", text = "Performance Cars Only"},
        {iso = "de-DE", text = "Nur Hochleistungsautos"},
        {iso = "fr-FR", text = "Voitures De Performance Uniquement"},
        {iso = "it-IT", text = "Solo Auto Ad Alte Prestazioni"},
        {iso = "pt-BR", text = "Somente Carros De Desempenho"},
    },

    ["lvo_tt"] = {
        {iso = "en-US", text = "Limit some options to performance vehicles only. For example, with this enabled slow and irrelevant vehicles will not have launch control or a crackle tune."},
        {iso = "de-DE", text = "Beschränke einige Optionen auf Hochleistungsfahrzeuge. Wenn diese Option aktiviert ist, haben beispielsweise langsame und irrelevante Fahrzeuge kein 'Launch Control' oder 'Pops & Bangs'."},
        {iso = "fr-FR", text = "Limitez certaines options aux véhicules performants uniquement. Par exemple, si cette option est activée, les véhicules lents et non pertinents n'auront pas de Launch Control ou de Pops & Bangs."},
        {iso = "it-IT", text = "Limita alcune opzioni solo ai veicoli ad alte prestazioni. Ad esempio, con questa opzione abilitata, i veicoli lenti e irrilevanti non avranno Launch Control o un Pops & Bangs."},
        {iso = "pt-BR", text = "Limitar algumas opções apenas a veículos de desempenho. Por exemplo, com essa opção ativada, os veículos lentos e irrelevantes não terão 'Launch Control' nem um 'Pops & Bangs'."},
    },

    ["lct_tt"] = {
        {iso = "en-US", text = "When your vehicle is completely stopped, press and hold [Accelerate] + [Brake] for 3 seconds then let go of the brakes."},
        {iso = "de-DE", text = "Halte die Tasten [Beschleunigen] + [Bremsen] drei Sekunden lang gedrückt und lasse dann die Bremse los. Funktioniert nur wenn das Fahrzeug still steht."},
        {iso = "fr-FR", text = "Lorsque votre véhicule est complètement arrêté, maintenez enfoncés [Accélérer] + [Frein] pendant 3 secondes puis relâchez les freins."},
        {iso = "it-IT", text = "Quando il veicolo è completamente fermo, tieni premuti [Accelerazione] + [Freno] per 3 secondi, quindi rilascia i freni."},
        {iso = "pt-BR", text = "Quando o veículo estiver completamente parado, pressione e mantenha pressionado [Acelerar] + [Freio] por 3 segundos e, em seguida, solte os freios."},
    },

    ["speedBoost_tt"] = {
        {iso = "en-US", text = "A speed boost that simulates nitrous. Gives you more power and increases your top speed when pressing [Left Shift]."},
        {iso = "de-DE", text = "Ein Geschwindigkeitsschub, der Lachgas simuliert. Dafür [Linke Umschalttaste] drücken, um mehr Leistung eine höhere Höchstgeschwindigkeit zu erhalten."},
        {iso = "fr-FR", text = "Un boost de vitesse qui simule le protoxyde d'azote. Vous donne plus de puissance et augmente votre vitesse de pointe lorsque vous appuyez sur [Maj Gauche]."},
        {iso = "it-IT", text = "Un aumento di velocità che simula il nitro. Ti dà più potenza e aumenta la tua velocità massima quando premi [Maiusc Sinistro]."},
        {iso = "pt-BR", text = "Um aumento de velocidade que simula o nitrogênio. Dá a você mais potência e aumenta a velocidade máxima ao pressionar [Shift esquerdo]."},
    },

    ["vfx_tt"] = {
        {iso = "en-US", text = "Activates a visual effect on your screen when using NOS."},
        {iso = "de-DE", text = "Aktiviert einen visuellen Effekt, wenn 'NOS' verwendet wird."},
        {iso = "fr-FR", text = "Active un effet visuel sur votre écran lorsque vous utilisez NOS."},
        {iso = "it-IT", text = "Attiva un effetto visivo sullo schermo quando si utilizza NOS."},
        {iso = "pt-BR", text = "Ativa um efeito visual na tela ao usar o NOS."},
    },

    ["loudradio_tt"] = {
        {iso = "en-US", text = "Makes your vehicle's radio sound louder from the outside. To notice the difference, activate this option then stand close to your car while the engine is running and the radio is on."},
        {iso = "de-DE", text = "Lässt das Radio vom Fahrzeugs außen lauter klingen. Um den Unterschied zu hören, aktiviere diese Option und stell dich dann bei laufendem Motor und eingeschaltetem Radio in der Nähe des Fahrzeugs hin."},
        {iso = "fr-FR", text = "Augmente le volume de la radio de votre véhicule depuis l'extérieur. Pour constater la différence, activez cette option puis placez-vous à proximité de votre voiture pendant que le moteur tourne et que la radio est allumée."},
        {iso = "it-IT", text = "Rende più forte il suono della radio del tuo veicolo dall'esterno. Per notare la differenza, attiva questa opzione, quindi stai vicino alla tua auto mentre il motore è in funzione e la radio è accesa."},
        {iso = "pt-BR", text = "Faz com que o rádio do seu veículo soe mais alto do lado de fora. Para notar a diferença, ative essa opção e fique perto do carro enquanto o motor estiver funcionando e o rádio estiver ligado."},
    },

    ["purge_tt"] = {
        {iso = "en-US", text = "Press [X] on keyboard or [A] on controller to purge your NOS Fast & Furious style."},
        {iso = "de-DE", text = "Drücken [X] (oder [A] auf dem Controller), um das NOS im Fast & Furious-Stil zu entleeren."},
        {iso = "fr-FR", text = "Appuyez sur [X] sur le clavier ou [A] sur le contrôleur pour purger votre NOS à la Fast & Furious."},
        {iso = "it-IT", text = "Premi [X] sulla tastiera o [A] sul controller per purgare il tuo NOS alla stile Fast & Furious."},
        {iso = "pt-BR", text = "Pressione [X] no teclado ou [A] no controle para limpar seu NOS no estilo Fast & Furious."},
    },

    ["pnb_tt"] = {
        {iso = "en-US", text = "Enables exhaust pops whenever you let go of [Accelerate] from high RPM."},
        {iso = "de-DE", text = "Aktiviert Abgasstöße. [Beschleunigen]-Taste bei hoher Motordrehzahl loslassen."},
        {iso = "fr-FR", text = "Active les rafales d'échappement lorsque vous relâchez la touche [Accélérer] à partir d'un régime moteur élevé."},
        {iso = "it-IT", text = "Attiva le raffiche di scarico quando si rilascia il pulsante [Accelerazione] da un regime elevato."},
        {iso = "pt-BR", text = "Ativa as rajadas de escapamento quando você solta o botão [Acelerar] em uma velocidade alta do motor."},
    },

    ["louderpnb_tt"] = {
        {iso = "en-US", text = "Makes your 'Pops & Bangs' sound extremely loud."},
        {iso = "de-DE", text = "Lässt 'Pops & Bangs' extrem laut klingen."},
        {iso = "fr-FR", text = "Rend le son de 'Pops & Bangs' extrêmement fort."},
        {iso = "it-IT", text = "Rende il suono di 'Pops & Bangs' estremamente forte."},
        {iso = "pt-BR", text = "Faz com que seus 'Pops & Bangs' soem extremamente altos."},
    },

    ["highbeams_tt"] = {
        {iso = "en-US", text = "Flash your high beams when honking."},
        {iso = "de-DE", text = "Schalte das Fernlicht beim Hupen ein."},
        {iso = "fr-FR", text = "Allumez vos feux de route lorsque vous klaxonnez."},
        {iso = "pt-BR", text = "Ligue o farol alto ao buzinar."},
    },

    ["brakeLight_tt"] = {
        {iso = "en-US", text = "Automatically turns on the brake lights when your car is stopped."},
        {iso = "de-DE", text = "Schaltet die Bremslichter automatisch ein, wenn das Fahrzeug anhält."},
        {iso = "fr-FR", text = "Allume automatiquement les feux stop lorsque votre voiture est à l'arrêt."},
        {iso = "it-IT", text = "Accende automaticamente le luci dei freni quando l'auto è ferma."},
        {iso = "pt-BR", text = "Acende automaticamente as luzes de freio quando o carro está parado."},
    },

    ["engineOn_tt"] = {
        {iso = "en-US", text = "Brings back GTA IV's vehicle exit: Hold [F] to turn off the engine before exiting the vehicle or press normally to exit and keep it running."},
        {iso = "de-DE", text = "Bringt das Aussteigen von Fahrzeugen aus GTA IV zurück: Halte vor dem Aussteigen [F] gedrückt, um den Motor auszuschalten, oder drücke [F] normal, um den Motor nach dem Aussteigen anzulassen."},
        {iso = "fr-FR", text = "Ramène la sortie du véhicule de GTA IV : maintenez la touche [F] pour éteindre le moteur avant de sortir du véhicule ou appuyez normalement pour sortir et le laisser en marche."},
        {iso = "it-IT", text = "Ripristina l'uscita dal veicolo di GTA IV: tieni premuto [F] per spegnere il motore prima di uscire dal veicolo o premi normalmente per uscire e tenerlo in funzione."},
        {iso = "pt-BR", text = "Traz de volta a saída do veículo do GTA IV: segure [F] para desligar o motor antes de sair do veículo ou pressione normalmente para sair e mantê-lo funcionando."},
    },

    ["canttouchthis_tt"] = {
        {iso = "en-US", text = "Prevent NPCs and players from carjacking you."},
        {iso = "de-DE", text = "Verhindert, dass NPCs und Spieler dich aus dem Fahrzeug zerren."},
        {iso = "fr-FR", text = "Empêche les PNJ et les joueurs de vous faire sortir de votre voiture."},
        {iso = "it-IT", text = "Impedisce a PNG e giocatori di farvi scendere dall'auto."},
        {iso = "pt-BR", text = "Impede que NPCs e jogadores tirem você do carro."},
    },

    ["insta180_tt"] = {
        {iso = "en-US", text = "Instantly turn your car 180 degrees."},
        {iso = "de-DE", text = "Drehen Sie Ihr Auto im Handumdrehen um 180 Grad."},
        {iso = "fr-FR", text = "Tournez instantanément votre voiture de 180 degrés."},
        {iso = "it-IT", text = "Ruota istantaneamente la tua auto di 180 gradi."},
        {iso = "pt-BR", text = "Gire instantaneamente seu carro em 180 graus."},
    },

    ["rgbLights"] = {
        {iso = "en-US", text = "RGB Lights"},
        {iso = "de-DE", text = "RGB-Fahrzeugbeleuchtung"},
        {iso = "fr-FR", text = "Lumières RVB"},
        {iso = "it-IT", text = "Luci RVB"},
        {iso = "pt-BR", text = "Luzes RGB"},
    },

    ["rgbSlider"] = {
        {iso = "en-US", text = "RGB Speed"},
        {iso = "de-DE", text = "RGB-Geschwindigkeit"},
        {iso = "fr-FR", text = "Vitesse RVB"},
        {iso = "it-IT", text = "Velocità RVB"},
        {iso = "pt-BR", text = "Velocidade RGB"},
    },

    ["engineSoundBtn"] = {
        {iso = "en-US", text = "Change Engine Sound"},
        {iso = "de-DE", text = "Motorsound ändern"},
        {iso = "fr-FR", text = "Changer Le Son Du Moteur"},
        {iso = "it-IT", text = "Cambia Il Suono Del Motore"},
        {iso = "pt-BR", text = "Alterar O Som Do Motor"},
    },

    ["engineSoundErr"] = {
        {iso = "en-US", text = "This option only works on road vehicles."},
        {iso = "de-DE", text = "Diese Option funktioniert nur bei Straßenfahrzeugen."},
        {iso = "fr-FR", text = "Cette option ne fonctionne que sur les véhicules routiers."},
        {iso = "it-IT", text = "Questa opzione funziona solo sui veicoli stradali."},
        {iso = "pt-BR", text = "Essa opção só funciona em veículos rodoviários."},
    },

    ["closeBtn"] = {
        {iso = "en-US", text = " Close "},
        {iso = "de-DE", text = " Schließen "},
        {iso = "fr-FR", text = " Fermer "},
        {iso = "it-IT", text = " Chiudere "},
        {iso = "pt-BR", text = " Próximo "},
    },

    ["openBtn"] = {
        {iso = "en-US", text = " Open "},
        {iso = "de-DE", text = " Offen "},
        {iso = "fr-FR", text = " Ouvrir "},
        {iso = "it-IT", text = " Aprire "},
        {iso = "pt-BR", text = " Aberto "},
    },

    ["searchVeh_hint"] = {
        {iso = "en-US", text = "Search Vehicle Names"},
        {iso = "de-DE", text = "Suche nach Fahrzeugnamen"},
        {iso = "fr-FR", text = "Rechercher les noms de véhicules"},
        {iso = "it-IT", text = "Cerca nomi veicoli"},
        {iso = "pt-BR", text = "Pesquisar Nomes De Veículos"},
    },

    ["Use This Sound"] = {
        {iso = "en-US", text = "Use This Sound"},
        {iso = "de-DE", text = "Diesen Sound verwenden"},
        {iso = "fr-FR", text = "Utilisez Ce Son"},
        {iso = "it-IT", text = "Usa Questo Suono"},
        {iso = "pt-BR", text = "Use Este Som"},
    },

    ["Restore Default"] = {
        {iso = "en-US", text = "Restore Default"},
        {iso = "de-DE", text = "Wiederherstellen"},
        {iso = "fr-FR", text = "Restaurer"},
        {iso = "it-IT", text = "Ristabilire"},
        {iso = "pt-BR", text = "Restaurador"},
    },

    ["Fix Engine"] = {
        {iso = "en-US", text = "Fix Engine"},
        {iso = "de-DE", text = "Motor Reparieren"},
        {iso = "fr-FR", text = "Réparer Le Moteur"},
        {iso = "it-IT", text = "Riparare Il Motore"},
        {iso = "pt-BR", text = "Reparo Do Motor"},
    },

    ["Destroy Engine"] = {
        {iso = "en-US", text = "Destroy Engine"},
        {iso = "de-DE", text = "Motor Zerstören"},
        {iso = "fr-FR", text = "Détruire Le Moteur"},
        {iso = "it-IT", text = "Distruggi Il Motore"},
        {iso = "pt-BR", text = "Destruir O Motor"},
    },

    ["getinveh"] = {
        {iso = "en-US", text = "Please get in a vehicle!"},
        {iso = "de-DE", text = "Steig in ein Fahrzeug ein!"},
        {iso = "fr-FR", text = "Veuillez montez dans un véhicule SVP !"},
        {iso = "it-IT", text = "Per favore, salite su un veicolo!"},
        {iso = "pt-BR", text = "Por favor, entre em um veículo!"},
    },

    ["playersTab"] = {
        {iso = "en-US", text = "Players "},
        {iso = "de-DE", text = "Spieler "},
        {iso = "fr-FR", text = "Joueurs "},
        {iso = "it-IT", text = "Giocatori "},
        {iso = "pt-BR", text = "Jogadores "},
    },

    ["temporarily disabled"] = {
        {iso = "en-US", text = "Temporarily Disabled"},
        {iso = "de-DE", text = "Zeitweise deaktiviert"},
        {iso = "fr-FR", text = "Temporairement Désactivé"},
        {iso = "it-IT", text = "Temporaneamente Disabilitato"},
        {iso = "pt-BR", text = "Temporariamente Desativado"},
    },

    ["worldTab"] = {
        {iso = "en-US", text = "World "},
        {iso = "de-DE", text = "Welt "},
        {iso = "fr-FR", text = "Monde "},
        {iso = "it-IT", text = "Mondo "},
        {iso = "pt-BR", text = "Mundo "},
    },

    ["failedToCtrlNPC"] = {
        {iso = "en-US", text = "Failed to take control of the NPC!"},
        {iso = "de-DE", text = "Der NPC konnte nicht kontrolliert werden!"},
        {iso = "fr-FR", text = "Échec de la prise de contrôle du PNJ !"},
        {iso = "it-IT", text = "Impossibile prendere il controllo del PNG!"},
        {iso = "pt-BR", text = "Falha ao assumir o controle do NPC!"},
    },

    ["pedGrabber"] = {
        {iso = "en-US", text = "Ped Grabber"},
        {iso = "de-DE", text = "NPC Greifer"},
        {iso = "fr-FR", text = "NPC Grabber"},
        {iso = "it-IT", text = "NPC Grabber"},
        {iso = "pt-BR", text = "NPC Grabber"},
    },

    ["pedGrabber_tt"] = {
        {iso = "en-US", text = "Stand close to an NPC who's on foot then pess [FIRE] to grab them. Once they are grabbed, hold [AIM] then press [FIRE] again to throw them."},
        {iso = "de-DE", text = "Drücke [FEUER] in unmittelbarer Nähe eines NPCs, der zu Fuß unterwegs ist, um diesen zu packen. Sobald dieser gepackt ist, halte [ZIELEN] und drücken erneut [FEUER], um diesen zu werfen."},
        {iso = "fr-FR", text = "Placez-vous près d'un PNJ à pied et appuyez sur [FEU] pour l'attraper. Une fois qu'ils sont saisis, maintenez [AIM] puis appuyez à nouveau sur [FEU] pour les lancer."},
        {iso = "it-IT", text = "Avvicinatevi a un PNG a piedi e premete [FUOCO] per afferrarlo. Una volta afferrato, tenete premuto [MIRARE] e premete di nuovo [FUOCO] per lanciarlo."},
        {iso = "pt-BR", text = "Aproxime-se de um NPC que esteja a pé e pressione [FIRE] para agarrá-lo. Depois que ele for agarrado, segure [AIM] e pressione [FIRE] novamente para arremessá-lo."},
    },

    ["Throw Force"] = {
        {iso = "en-US", text = "Throw Force:"},
        {iso = "de-DE", text = "Wurfstärke:"},
        {iso = "fr-FR", text = "Force De Lancement :"},
        {iso = "it-IT", text = "Forza Di Lancio:"},
        {iso = "pt-BR", text = "Força De Lançamento:"},
    },

    ["carpool"] = {
        {iso = "en-US", text = "Ride With NPCs"},
        {iso = "de-DE", text = "Bei NPCs mitfahren"},
        {iso = "fr-FR", text = "Chevaucher Avec Les NPCs"},
        {iso = "it-IT", text = "Cavalcare Con I NPCs"},
        {iso = "pt-BR", text = "Passeio Com NPCs"},
    },

    ["carpool_tt"] = {
        {iso = "en-US", text = "Allows you to get in NPC vehicles as passenger."},
        {iso = "de-DE", text = "Ermöglicht es dir, als Beifahrer in NPC-Fahrzeuge einzusteigen."},
        {iso = "fr-FR", text = "Permet de monter dans les véhicules des NPC en tant que passager."},
        {iso = "it-IT", text = "Permette di salire sui veicoli degli NPC come passeggero."},
        {iso = "pt-BR", text = "Permite que você entre em veículos de NPCs como passageiro."},
    },

    ["prevSeat"] = {
        {iso = "en-US", text = "Previous Seat"},
        {iso = "de-DE", text = "Vorheriger Sitz"},
        {iso = "fr-FR", text = "Siège Précédent"},
        {iso = "it-IT", text = "Sede Precedente"},
        {iso = "pt-BR", text = "Sede Anterior"},
    },

    ["nextSeat"] = {
        {iso = "en-US", text = "Next Seat"},
        {iso = "de-DE", text = "Nächster Sitz"},
        {iso = "fr-FR", text = "Siège Suivant"},
        {iso = "it-IT", text = "Prossima Sede"},
        {iso = "pt-BR", text = "Próxima Sede"},
    },

    ["settingsTab"] = {
        {iso = "en-US", text = "Settings "},
        {iso = "de-DE", text = "Einstellungen "},
        {iso = "fr-FR", text = "Paramètres "},
        {iso = "it-IT", text = "Impostazioni "},
        {iso = "pt-BR", text = "Configurações "},
    },

    ["Disable Tooltips"] = {
        {iso = "en-US", text = "Disable Tooltips"},
        {iso = "de-DE", text = "Tooltips Deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Les Infobulles"},
        {iso = "it-IT", text = "Disattivare I Suggerimenti"},
        {iso = "pt-BR", text = "Desativar Dicas De Ferramentas"},
    },

    ["DisableSound"] = {
        {iso = "en-US", text = "Disable UI Sound"},
        {iso = "de-DE", text = "UI-Ton Deaktivieren"},
        {iso = "fr-FR", text = "Désactiver Le Son De l'IU"},
        {iso = "it-IT", text = "Disattivare Il Suono Dell'IU"},
        {iso = "pt-BR", text = "Desativar O Som Da IU"},
    },

    ["DisableSound_tt"] = {
        {iso = "en-US", text = "Disable sound feedback from UI widgets."},
        {iso = "de-DE", text = "Deaktiviert Bestätingungs-Sounds."},
        {iso = "fr-FR", text = "Désactiver le retour sonore des widgets de l'interface utilisateur."},
        {iso = "it-IT", text = "Disabilita il feedback sonoro dai widget dell'interfaccia utente."},
        {iso = "pt-BR", text = "Desative o feedback sonoro dos widgets da interface do usuário."},
    },

    ["langTitle"] = {
        {iso = "en-US", text = "Language: "},
        {iso = "de-DE", text = "Sprache: "},
        {iso = "fr-FR", text = "Langue: "},
        {iso = "it-IT", text = "Lingua: "},
        {iso = "pt-BR", text = "Idioma: "},
    },

    ["gameLangCB"] = {
        {iso = "en-US", text = "Use Game Language"},
        {iso = "de-DE", text = "Spielsprache verwenden"},
        {iso = "fr-FR", text = "Utiliser Le Langage Du Jeu"},
        {iso = "it-IT", text = "Utilizzare Il Linguaggio Del Gioco"},
        {iso = "pt-BR", text = "Use A Linguagem Do Jogo"},
    },

    ["gameLang_tt"] = {
        {iso = "en-US", text = "To choose a different language, disable this option."},
        {iso = "de-DE", text = "Deaktiviere diese Option, um eine andere Sprache zu wählen."},
        {iso = "fr-FR", text = "Pour choisir une autre langue, désactivez cette option."},
        {iso = "it-IT", text = "Per scegliere una lingua diversa, disattivare questa opzione."},
        {iso = "pt-BR", text = "Para escolher um idioma diferente, desative essa opção."},
    },

    ["customLangTxt"] = {
        {iso = "en-US", text = "Custom"},
        {iso = "de-DE", text = "Personalisiert"},
        {iso = "fr-FR", text = "Personnalisé"},
        {iso = "it-IT", text = "Personalizzato"},
        {iso = "pt-BR", text = "Personalizado"},
    },

    ["saveBtn"] = {
        {iso = "en-US", text = " Save "},
        {iso = "de-DE", text = " Speichern "},
        {iso = "fr-FR", text = " Enregistrer "},
        {iso = "it-IT", text = " Risparmiare "},
        {iso = "pt-BR", text = " Salvar "},
    },

    ["lang_success_msg"] = {
        {iso = "en-US", text = "Language settings saved. Please reload the script to apply the changes."},
        {iso = "de-DE", text = "Spracheinstellungen gespeichert. Bitte lade das Skript neu, um die Änderungen zu übernehmen."},
        {iso = "fr-FR", text = "Les paramètres linguistiques ont été enregistrés. Veuillez recharger le script pour appliquer les changements."},
        {iso = "it-IT", text = "Impostazioni della lingua salvate. Ricaricare lo script per applicare le modifiche."},
        {iso = "pt-BR", text = "Configurações de idioma salvas. Recarregue o script para aplicar as alterações."},
    },

    ["reset_settings_Btn"] = {
        {iso = "en-US", text = "Reset Settings"},
        {iso = "de-DE", text = "Alles zurücksetzen"},
        {iso = "fr-FR", text = "Réinitialiser Tout"},
        {iso = "it-IT", text = "Resettare Tutto"},
        {iso = "pt-BR", text = "Restaurar Configurações"},
    },

    ["confirm_txt"] = {
        {iso = "en-US", text = "Are you sure?"},
        {iso = "de-DE", text = "Bist du dir sicher?"},
        {iso = "fr-FR", text = "Êtes-vous sûr?"},
        {iso = "it-IT", text = "Sei sicuro?"},
        {iso = "pt-BR", text = "Tem certeza?"},
    },

    ["yes"] = {
        {iso = "en-US", text = "Yes"},
        {iso = "de-DE", text = "Ja"},
        {iso = "fr-FR", text = "Oui"},
        {iso = "it-IT", text = "Si"},
        {iso = "pt-BR", text = "Sim"},
    },

    ["no"] = {
        {iso = "en-US", text = "No"},
        {iso = "de-DE", text = "Nein"},
        {iso = "fr-FR", text = "Non"},
        {iso = "it-IT", text = "No"},
        {iso = "pt-BR", text = "Não"},
    },

    ["getinsidefltbd"] = {
        {iso = "en-US", text = "Please get inside a flatbed truck.\10You can use the button below to spawn one"},
        {iso = "de-DE", text = "Bitte steigen Sie in einen Pritschenwagen.\10Sie können die Schaltfläche unten verwenden, um einen zu erzeugen"},
        {iso = "fr-FR", text = "Veuillez monter dans un camion à plate-forme.\10Vous pouvez utiliser le bouton ci-dessous pour en faire naître un."},
        {iso = "it-IT", text = "Entrare in un camion con pianale.\10Potete usare il pulsante qui sotto per generarne uno."},
        {iso = "pt-BR", text = "Entre em um caminhão-plataforma.\nVocê pode usar o botão abaixo para gerar um."},
    },

    ["spawnfltbd"] = {
        {iso = "en-US", text = "Spawn Flatbed"},
        {iso = "de-DE", text = "Spawn Flatbed"},
        {iso = "fr-FR", text = "Spawn Flatbed"},
        {iso = "it-IT", text = "Spawn Flatbed"},
        {iso = "pt-BR", text = "Spawn Flatbed"},
    },

    ["fltbd_nonearbyvehTxt"] = {
        {iso = "en-US", text = "No nearby vehicles found!"},
        {iso = "de-DE", text = "Keine Fahrzeuge in der Nähe gefunden!"},
        {iso = "fr-FR", text = "Aucun véhicule à proximité n'a été trouvé !"},
        {iso = "it-IT", text = "Nessun veicolo nelle vicinanze!"},
        {iso = "pt-BR", text = "Não foram encontrados veículos próximos!"},
    },

    ["fltbd_nootherfltbdTxt"] = {
        {iso = "en-US", text = "You can not tow another flatbed truck."},
        {iso = "de-DE", text = "Sie können keinen anderen Pritschenwagen abschleppen."},
        {iso = "fr-FR", text = "Vous ne pouvez pas remorquer un autre camion à plate-forme."},
        {iso = "it-IT", text = "Non è possibile trainare un altro camion con pianale."},
        {iso = "pt-BR", text = "Não é possível rebocar outro caminhão-plataforma."},
    },

    ["fltbd_carsOnlyTxt"] = {
        {iso = "en-US", text = "You can only tow cars, trucks and bikes."},
        {iso = "de-DE", text = "Sie können nur Autos, Lastwagen und Motorräder abschleppen."},
        {iso = "fr-FR", text = "Vous ne pouvez remorquer que des voitures, des camions et des motos."},
        {iso = "it-IT", text = "È possibile trainare solo auto, camion e moto."},
        {iso = "pt-BR", text = "Só é possível rebocar carros, caminhões e motocicletas."},
    },

    ["fltbd_closest_veh"] = {
        {iso = "en-US", text = "Closest Vehicle: "},
        {iso = "de-DE", text = "Nächstgelegenes Fahrzeug: "},
        {iso = "fr-FR", text = "Véhicule le plus proche : "},
        {iso = "it-IT", text = "Il veicolo più vicino: "},
        {iso = "pt-BR", text = "Veículo mais próximo: "},
    },

    ["fltbd_towingTxt"] = {
        {iso = "en-US", text = "Towed Vehicle: "},
        {iso = "de-DE", text = "Abgeschlepptes Fahrzeug: "},
        {iso = "fr-FR", text = "Véhicule remorqué : "},
        {iso = "it-IT", text = "Veicolo rimorchiato: "},
        {iso = "pt-BR", text = "Veículo rebocado: "},
    },

    ["Show Towing Position"] = {
        {iso = "en-US", text = "Show Towing Position"},
        {iso = "de-DE", text = "Abschlepp-Position Anzeigen"},
        {iso = "fr-FR", text = "Afficher La Position De Remorquage"},
        {iso = "it-IT", text = "Mostra Posizione Di Traino"},
        {iso = "pt-BR", text = "Mostrar Posição De Reboque"},
    },

    ["towpos_tt"] = {
        {iso = "en-US", text = "Marks the position at which the script detects nearby vehicles."},
        {iso = "de-DE", text = "Markiert die Position, an der das Skript Fahrzeuge in der Nähe erkennt."},
        {iso = "fr-FR", text = "Marque la position à laquelle le script détecte les véhicules proches."},
        {iso = "it-IT", text = "Contrassegna la posizione in cui lo script rileva i veicoli vicini."},
        {iso = "pt-BR", text = "Marca a posição em que o script detecta veículos próximos."},
    },

    ["Tow Everything"] = {
        {iso = "en-US", text = "Tow Everything"},
        {iso = "de-DE", text = "Abschleppen Alles"},
        {iso = "fr-FR", text = "Remorquer Tout"},
        {iso = "it-IT", text = "Rimorchiare Tutto"},
        {iso = "pt-BR", text = "Rebocar Tudo"},
    },

    ["TowEverything_tt"] = {
        {iso = "en-US", text = "By default, the script is limited to cars, trucks and bikes only. This option ignores that limit."},
        {iso = "de-DE", text = "Standardmäßig ist das Skript nur auf Autos, Lastwagen und Motorräder beschränkt. Mit dieser Option wird diese Beschränkung ignoriert."},
        {iso = "fr-FR", text = "Par défaut, le script est limité aux voitures, camions et motos. Cette option ignore cette limite."},
        {iso = "it-IT", text = "Per impostazione predefinita, lo script è limitato alle sole auto, camion e moto. Questa opzione ignora tale limite."},
        {iso = "pt-BR", text = "Por padrão, o script é limitado apenas a carros, caminhões e motocicletas. Essa opção ignora esse limite."},
    },

    ["towBtn"] = {
        {iso = "en-US", text = "   Tow   "},
        {iso = "de-DE", text = "Abschleppen"},
        {iso = "fr-FR", text = "Remorquer"},
        {iso = "it-IT", text = " Traino  "},
        {iso = "pt-BR", text = " Reboque "},
    },

    ["detachBtn"] = {
        {iso = "en-US", text = "  Detach  "},
        {iso = "de-DE", text = "Trennen Sie"},
        {iso = "fr-FR", text = " Détacher "},
        {iso = "it-IT", text = " Staccare "},
        {iso = "pt-BR", text = " Desanexar "},
    },

    ["failed_veh_ctrl"] = {
        {iso = "en-US", text = "Unable to take control of the vehicle! Does the owner have protections?"},
        {iso = "de-DE", text = "Unfähig, die Kontrolle über das Fahrzeug zu übernehmen! Verfügt der Eigentümer über Schutzmaßnahmen?"},
        {iso = "fr-FR", text = "Impossible de prendre le contrôle du véhicule ! Le propriétaire a-t-il des protections ?"},
        {iso = "it-IT", text = "Impossibile prendere il controllo del veicolo! Il proprietario ha delle protezioni?"},
        {iso = "pt-BR", text = "Incapaz de assumir o controle do veículo! O proprietário tem proteções?"},
    },

    ["Adjust Vehicle Position"] = {
        {iso = "en-US", text = "Adjust Vehicle Position"},
        {iso = "de-DE", text = "Fahrzeugposition einstellen"},
        {iso = "fr-FR", text = "Ajuster La Position Du Véhicule"},
        {iso = "it-IT", text = "Regolare La Posizione Del Veicolo"},
        {iso = "pt-BR", text = "Ajuste Da Posição Do Veículo"},
    },

    ["AdjustPosition_tt"] = {
        {iso = "en-US", text = "For the arrows to make sense, move the game camera to the right. (Look right)"},
        {iso = "de-DE", text = "Damit die Pfeile einen Sinn ergeben, bewegen Sie die Spielkamera nach rechts. (Blick nach rechts)"},
        {iso = "fr-FR", text = "Pour que les flèches aient un sens, déplacez la caméra du jeu vers la droite. (Regarder à droite)"},
        {iso = "it-IT", text = "Affinché le frecce abbiano senso, spostare la telecamera di gioco verso destra. (Guarda a destra)"},
        {iso = "pt-BR", text = "Para que as setas façam sentido, mova a câmera do jogo para a direita. (Olhe para a direita)"},
    },

    ["Exit your current vehicle first."] = {
        {iso = "en-US", text = "Exit your current vehicle first."},
        {iso = "de-DE", text = "Verlassen Sie zunächst Ihr aktuelles Fahrzeug."},
        {iso = "fr-FR", text = "Sortez d'abord de votre véhicule actuel."},
        {iso = "it-IT", text = "Uscire prima dal veicolo attuale."},
        {iso = "pt-BR", text = "Saia primeiro de seu veículo atual."},
    },

    ["Total Players:"] = {
        {iso = "en-US", text = "Total Players:"},
        {iso = "de-DE", text = "Spieler Insgesamt:"},
        {iso = "fr-FR", text = "Nombre De Joueurs :"},
        {iso = "it-IT", text = "Totale Giocatori:"},
        {iso = "pt-BR", text = "Total De Jogadores:"},
    },
}




local logMsg = true
--[[

Translates text to the script language.

If the label to translate is missing or the language is invalid then it defaults to English (US).
]]
---@param g string
function translateLabel(g)
    ---@type string
    local retStr
    if Labels[g] then
        for _, v in pairs(Labels[g]) do
            if LANG == v.iso then
                retStr = v.text
                break
            end
        end
        if retStr == nil or retStr == "" then
            if logMsg then
                gui.show_warning("Samurai's Scripts", "Unsupported language or missing label detected! Defaulting to English.")
                log.warning("Unsupported language or missing label detected! Defaulting to English.")
            end
            retStr = Labels[g][1].text
            logMsg = false
        end
    else
        retStr = tostring(g) .. " [LABEL NOT FOUND!]"
    end
    return retStr
end