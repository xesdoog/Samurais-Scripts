---@diagnostic disable: undefined-global, lowercase-global

require('lib/samurais_utils')
require('lib/Translations')
require("objects")
Samurais_scripts = gui.get_tab("Samurai's Scripts")

default_config = {
  Regen             = false,
  objectiveTP       = false,
  disableTooltips   = false,
  phoneAnim         = false,
  sprintInside      = false,
  lockpick          = false,
  replaceSneakAnim  = false,
  disableSound      = false,
  disableActionMode = false,
  Triggerbot        = false,
  aimEnemy          = false,
  autoKill          = false,
  disableUiSounds   = false,
  driftMode         = false,
  DriftTires        = false,
  speedBoost        = false,
  nosvfx            = false,
  hornLight         = false,
  nosPurge          = false,
  insta180          = false,
  flappyDoors       = false,
  rgbLights         = false,
  loud_radio        = false,
  launchCtrl        = false,
  popsNbangs        = false,
  limitVehOptions   = false,
  louderPops        = false,
  autobrklight      = false,
  holdF             = false,
  noJacking         = false,
  useGameLang       = false,
  lang_idx          = 0,
  DriftIntensity    = 0,
  lightSpeed        = 1,
  LANG              = 'en-US',
  current_lang      = 'English',
}

LANG = lua_cfg.read("LANG")
current_lang = lua_cfg.read("current_lang")

--[[
    *self*
]]
local self_tab          = Samurais_scripts:add_tab(translateLabel("Self"))
local Regen             = lua_cfg.read("Regen")
local objectiveTP       = lua_cfg.read("objectiveTP")
local phoneAnim         = lua_cfg.read("phoneAnim")
local sprintInside      = lua_cfg.read("sprintInside")
local lockPick          = lua_cfg.read("lockPick")
local replaceSneakAnim  = lua_cfg.read("replaceSneakAnim")
local disableActionMode = lua_cfg.read("disableActionMode")
local isCrouched        = false
local objectives_T      = { 0, 1, 2, 143, 144, 145, 146, 280, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 535, 536, 537, 538, 539, 540, 541, 542 }
self_tab:add_imgui(function()
  Regen, RegenUsed = ImGui.Checkbox(translateLabel("Auto-Heal"), Regen, true)
  UI.helpMarker(false, translateLabel("autoheal_tooltip"))
  if RegenUsed then
    lua_cfg.save("Regen", Regen)
    UI.widgetSound("Nav2")
  end

  objectiveTP, objectiveTPUsed = ImGui.Checkbox(translateLabel("objectiveTP"), objectiveTP, true)
  UI.helpMarker(false, translateLabel("objectiveTP_tooltip"))
  if objectiveTPUsed then
    lua_cfg.save("objectiveTP", objectiveTP)
    UI.widgetSound("Nav2")
  end

  replaceSneakAnim, rsanimUsed = ImGui.Checkbox(translateLabel("CrouchCB"), replaceSneakAnim, true)
  UI.helpMarker(false, translateLabel("Crouch_tooltip"))
  if rsanimUsed then
    lua_cfg.save("replaceSneakAnim", replaceSneakAnim)
    UI.widgetSound("Nav2")
  end

  phoneAnim, phoneAnimUsed = ImGui.Checkbox(translateLabel("PhoneAnimCB"), phoneAnim, true)
  UI.helpMarker(false, translateLabel("PhoneAnim_tooltip"))
  if phoneAnimUsed then
    lua_cfg.save("phoneAnim", phoneAnim)
    UI.widgetSound("Nav2")
  end

  sprintInside, sprintInsideUsed = ImGui.Checkbox(translateLabel("SprintInsideCB"), sprintInside, true)
  UI.helpMarker(false,
    translateLabel("SprintInside_tooltip"))
  if sprintInsideUsed then
    lua_cfg.save("sprintInside", sprintInside)
    UI.widgetSound("Nav2")
  end

  lockPick, lockPickUsed = ImGui.Checkbox(translateLabel("LockpickCB"), lockPick, true)
  UI.helpMarker(false,
    translateLabel("Lockpick_tooltip"))
  if lockPickUsed then
    lua_cfg.save("lockPick", lockPick)
    UI.widgetSound("Nav2")
  end

  disableActionMode, actionModeUsed = ImGui.Checkbox(translateLabel("ActionModeCB"), disableActionMode, true)
  UI.helpMarker(false, translateLabel("ActionMode_tooltip"))
  if actionModeUsed then
    lua_cfg.save("disableActionMode", disableActionMode)
    UI.widgetSound("Nav2")
  end
end)

local sound_player    = self_tab:add_tab(translateLabel "soundplayer")
local sound_index1    = 0
local sound_index2    = 0
local switch          = 0
local male_sounds_T   = {
  { name = "Charge",            soundName = "GENERIC_WAR_CRY",          soundRef = "S_M_Y_BLACKOPS_01_BLACK_MINI_01" },
  { name = "Creep",             soundName = "SHOUT_PERV_AT_WOMAN_PERV", soundRef = "A_M_Y_MEXTHUG_01_LATINO_FULL_01" },
  { name = "Franklin Laughing", soundName = "LAUGH",                    soundRef = "WAVELOAD_PAIN_FRANKLIN" },
  { name = "How are you?",      soundName = "GENERIC_HOWS_IT_GOING",    soundRef = "S_M_M_PILOT_01_WHITE_FULL_01" },
  { name = "Insult",            soundName = "GENERIC_INSULT_HIGH",      soundRef = "S_M_Y_SHERIFF_01_WHITE_FULL_01" },
  { name = "Insult 02",         soundName = "GENERIC_FUCK_YOU",         soundRef = "FRANKLIN_DRUNK" },
  { name = "Threaten",          soundName = "CHALLENGE_THREATEN",       soundRef = "S_M_Y_BLACKOPS_01_BLACK_MINI_01" },
  { name = "You Look Stupid!",  soundName = "FRIEND_LOOKS_STUPID",      soundRef = "FRANKLIN_DRUNK" },
}
local female_sounds_T = {
  { name = "Blowjob",      soundName = "SEX_ORAL",              soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
  { name = "Hooker Offer", soundName = "HOOKER_OFFER_SERVICE",  soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
  { name = "How are you?", soundName = "GENERIC_HOWS_IT_GOING", soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
  { name = "Insult",       soundName = "GENERIC_INSULT_HIGH",   soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
  { name = "Moan",         soundName = "SEX_GENERIC_FEM",       soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
  { name = "Threaten",     soundName = "CHALLENGE_THREATEN",    soundRef = "S_F_Y_HOOKER_03_BLACK_FULL_01" },
}

local selected_sound
local function displayMaleSounds()
  filteredMaleSounds = {}
  for _, v in ipairs(male_sounds_T) do
    table.insert(filteredMaleSounds, v.name)
  end
  sound_index1, used = ImGui.Combo("##maleSounds", sound_index1, filteredMaleSounds, #male_sounds_T)
end

local function displayFemaleSounds()
  filteredFemaleSounds = {}
  for _, v in ipairs(female_sounds_T) do
    table.insert(filteredFemaleSounds, v.name)
  end
  sound_index2, used = ImGui.Combo("##femaleSounds", sound_index2, filteredFemaleSounds, #female_sounds_T)
end

sound_player:add_imgui(function()
  switch, isChanged = ImGui.RadioButton(translateLabel("malesounds"), switch, 0); ImGui.SameLine()
  if isChanged then
    UI.widgetSound("Nav")
  end
  switch, isChanged = ImGui.RadioButton(translateLabel("femalesounds"), switch, 1)
  if isChanged then
    UI.widgetSound("Nav")
  end
  if switch == 0 then
    displayMaleSounds()
    selected_sound = male_sounds_T[sound_index1 + 1]
  else
    displayFemaleSounds()
    selected_sound = female_sounds_T[sound_index2 + 1]
  end
  if ImGui.Button(translateLabel("playButton") .. "##sound") then
    script.run_in_fiber(function()
      local myCoords = Game.getCoords(self.get_ped(), true)
      AUDIO.PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE(selected_sound.soundName, selected_sound.soundRef, myCoords.x,
        myCoords.y, myCoords.z, "SPEECH_PARAMS_FORCE", 0)
    end)
  end
end)

--[[
    *weapon*
]]
local weapon_tab  = Samurais_scripts:add_tab(translateLabel("weaponTab"))
local Triggerbot  = lua_cfg.read("Triggerbot")
local aimEnemy    = lua_cfg.read("aimEnemy")
local autoKill    = lua_cfg.read("autoKill")
local aimBool     = false
local HashGrabber = false
local Entity      = 0

weapon_tab:add_imgui(function()
  HashGrabber, HgUsed = ImGui.Checkbox(translateLabel("hashgrabberCB"), HashGrabber, true)
  UI.helpMarker(false,
    translateLabel("hashgrabber_tt"))
  if HgUsed then
    UI.widgetSound("Nav2")
  end

  Triggerbot, TbUsed = ImGui.Checkbox(translateLabel("triggerbotCB"), Triggerbot, true)
  UI.helpMarker(false,
    translateLabel("triggerbot_tt"))
  if Triggerbot then
    ImGui.SameLine(); aimEnemy, aimEnemyUsed = ImGui.Checkbox(translateLabel("enemyonlyCB"), aimEnemy, true)
    if aimEnemyUsed then
      lua_cfg.save("aimEnemy", aimEnemy)
      UI.widgetSound("Nav2")
    end
  end
  if TbUsed then
    lua_cfg.save("Triggerbot", Triggerbot)
    UI.widgetSound("Nav2")
  end

  autoKill, autoKillUsed = ImGui.Checkbox(translateLabel("autokillCB"), autoKill, true)
  UI.helpMarker(false, translateLabel("autokill_tt"))
  if autoKillUsed then
    lua_cfg.save("autoKill", autoKill)
    UI.widgetSound("Nav2")
  end
end)

--[[
    *vehicle*
]]
local vehicle_tab        = Samurais_scripts:add_tab(translateLabel("vehicleTab"))
local popsnd, sndRef
local flame_size
local driftMode          = lua_cfg.read("driftMode")
local DriftIntensity     = lua_cfg.read("DriftIntensity")
local DriftTires         = lua_cfg.read("DriftTires")
local speedBoost         = lua_cfg.read("speedBoost")
local nosvfx             = lua_cfg.read("nosvfx")
local hornLight          = lua_cfg.read("hornLight")
local nosPurge           = lua_cfg.read("nosPurge")
local lightSpeed         = lua_cfg.read("lightSpeed")
local loud_radio         = lua_cfg.read("loud_radio")
local launchCtrl         = lua_cfg.read("launchCtrl")
local popsNbangs         = lua_cfg.read("popsNbangs")
local louderPops         = lua_cfg.read("louderPops")
local limitVehOptions    = lua_cfg.read("limitVehOptions")
local autobrklight       = lua_cfg.read("autobrklight")
local rgbLights          = lua_cfg.read("rgbLights")
local holdF              = lua_cfg.read("holdF")
local noJacking          = lua_cfg.read("noJacking")
local insta180           = lua_cfg.read("insta180")
local is_car             = false
local is_quad            = false
local is_boat            = false
local is_bike            = false
local validModel         = false
local has_xenon          = false
local tire_smoke         = false
local purge_started      = false
local nos_started        = false
local twostep_started    = false
local is_typing          = false
local open_sounds_window = false
local started_lct        = false
local launch_active      = false
local started_popSound   = false
local started_popSound2  = false
local customSmokeCol     = false
local timerA             = 0
local timerB             = 0
local lastVeh            = 0
local defaultXenon       = 0
local vehSound_index     = 0
local driftSmokeIndex    = 0
local selected_smoke_col = 0
local tdBtn              = 21
local search_term        = ""
local smokeHex           = ""
local smokePtfx_t        = {}
local nosptfx_t          = {}
local purgePtfx_t        = {}
local lctPtfx_t          = {}
local popSounds_t        = {}
local popsPtfx_t         = {}
local driftSmoke         = {r = 255, g = 255, b = 255}
local driftSmokeColors   = {"Black", "White", "Red", "Green", "Blue", "Yellow", "Orange", "Pink", "Purple"}
local gta_vehicles       = { "Airbus", "Airtug", "akula", "akuma", "aleutian", "alkonost", "alpha", "alphaz1",
  "AMBULANCE", "annihilator", "annihilator2", "apc", "ardent", "armytanker", "armytrailer", "armytrailer2", "asbo",
  "asea", "asea2", "asterope", "asterope2", "astron", "autarch", "avarus", "avenger", "avenger2", "avenger3", "avenger4",
  "avisa", "bagger", "baletrailer", "Baller", "baller2", "baller3", "baller4", "baller5", "baller6", "baller7", "baller8",
  "banshee", "banshee2", "BARRACKS", "BARRACKS2", "BARRACKS3", "barrage", "bati", "bati2", "Benson", "benson2", "besra",
  "bestiagts", "bf400", "BfInjection", "Biff", "bifta", "bison", "Bison2", "Bison3", "BjXL", "blade", "blazer", "blazer2",
  "blazer3", "blazer4", "blazer5", "BLIMP", "BLIMP2", "blimp3", "blista", "blista2", "blista3", "BMX", "boattrailer",
  "boattrailer2", "boattrailer3", "bobcatXL", "Bodhi2", "bombushka", "boor", "boxville", "boxville2", "boxville3",
  "boxville4", "boxville5", "boxville6", "brawler", "brickade", "brickade2", "brigham", "brioso", "brioso2", "brioso3",
  "broadway", "bruiser", "bruiser2", "bruiser3", "brutus", "brutus2", "brutus3", "btype", "btype2", "btype3", "buccaneer",
  "buccaneer2", "buffalo", "buffalo2", "buffalo3", "buffalo4", "buffalo5", "bulldozer", "bullet", "Burrito", "burrito2",
  "burrito3", "Burrito4", "burrito5", "BUS", "buzzard", "Buzzard2", "cablecar", "caddy", "Caddy2", "caddy3", "calico",
  "CAMPER", "caracara", "caracara2", "carbonizzare", "carbonrs", "Cargobob", "cargobob2", "Cargobob3", "Cargobob4",
  "cargoplane", "cargoplane2", "casco", "cavalcade", "cavalcade2", "cavalcade3", "cerberus", "cerberus2", "cerberus3",
  "champion", "cheburek", "cheetah", "cheetah2", "chernobog", "chimera", "chino", "chino2", "cinquemila", "cliffhanger",
  "clique", "clique2", "club", "coach", "cog55", "cog552", "cogcabrio", "cognoscenti", "cognoscenti2", "comet2", "comet3",
  "comet4", "comet5", "comet6", "comet7", "conada", "conada2", "contender", "coquette", "coquette2", "coquette3",
  "coquette4", "corsita", "coureur", "cruiser", "CRUSADER", "cuban800", "cutter", "cyclone", "cypher", "daemon",
  "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler", "deity", "deluxo", "deveste", "deviant", "diablous",
  "diablous2", "dilettante", "dilettante2", "Dinghy", "dinghy2", "dinghy3", "dinghy4", "dinghy5", "dloader",
  "docktrailer", "docktug", "dodo", "Dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6",
  "dominator7", "dominator8", "dominator9", "dorado", "double", "drafter", "draugur", "drifteuros", "driftfr36",
  "driftfuto", "driftjester", "driftremus", "drifttampa", "driftyosemite", "driftzr350", "dubsta", "dubsta2", "dubsta3",
  "dukes", "dukes2", "dukes3", "dump", "dune", "dune2", "dune3", "dune4", "dune5", "duster", "Dynasty", "elegy", "elegy2",
  "ellie", "emerus", "emperor", "Emperor2", "emperor3", "enduro", "entity2", "entity3", "entityxf", "esskey", "eudora",
  "Euros", "everon", "everon2", "exemplar", "f620", "faction", "faction2", "faction3", "fagaloa", "faggio", "faggio2",
  "faggio3", "FBI", "FBI2", "fcr", "fcr2", "felon", "felon2", "feltzer2", "feltzer3", "firetruk", "fixter", "flashgt",
  "FLATBED", "fmj", "FORKLIFT", "formula", "formula2", "fq2", "fr36", "freecrawler", "freight", "freight2", "freightcar",
  "freightcar2", "freightcont1", "freightcont2", "freightgrain", "Frogger", "frogger2", "fugitive", "furia", "furoregt",
  "fusilade", "futo", "futo2", "gargoyle", "Gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "gauntlet6",
  "gb200", "gburrito", "gburrito2", "glendale", "glendale2", "gp1", "graintrailer", "GRANGER", "granger2", "greenwood",
  "gresley", "growler", "gt500", "guardian", "habanero", "hakuchou", "hakuchou2", "halftrack", "handler", "Hauler",
  "Hauler2", "havok", "hellion", "hermes", "hexer", "hotknife", "hotring", "howard", "hunter", "huntley", "hustler",
  "hydra", "imorgon", "impaler", "impaler2", "impaler3", "impaler4", "impaler5", "impaler6", "imperator", "imperator2",
  "imperator3", "inductor", "inductor2", "infernus", "infernus2", "ingot", "innovation", "insurgent", "insurgent2",
  "insurgent3", "intruder", "issi2", "issi3", "issi4", "issi5", "issi6", "issi7", "issi8", "italigtb", "italigtb2",
  "italigto", "italirsx", "iwagen", "jackal", "jb700", "jb7002", "jester", "jester2", "jester3", "jester4", "jet",
  "jetmax", "journey", "journey2", "jubilee", "jugular", "kalahari", "kamacho", "kanjo", "kanjosj", "khamelion",
  "khanjali", "komoda", "kosatka", "krieger", "kuruma", "kuruma2", "l35", "landstalker", "landstalker2", "Lazer", "le7b",
  "lectro", "lguard", "limo2", "lm87", "locust", "longfin", "lurcher", "luxor", "luxor2", "lynx", "mamba", "mammatus",
  "manana", "manana2", "manchez", "manchez2", "manchez3", "marquis", "marshall", "massacro", "massacro2", "maverick",
  "menacer", "MESA", "mesa2", "MESA3", "metrotrain", "michelli", "microlight", "Miljet", "minitank", "minivan",
  "minivan2", "Mixer", "Mixer2", "mogul", "molotok", "monroe", "monster", "monster3", "monster4", "monster5",
  "monstrociti", "moonbeam", "moonbeam2", "Mower", "Mule", "Mule2", "Mule3", "mule4", "mule5", "nebula", "nemesis", "neo",
  "neon", "nero", "nero2", "nightblade", "nightshade", "nightshark", "nimbus", "ninef", "ninef2", "nokota", "Novak",
  "omnis", "omnisegt", "openwheel1", "openwheel2", "oppressor", "oppressor2", "oracle", "oracle2", "osiris", "outlaw",
  "Packer", "panthere", "panto", "paradise", "paragon", "paragon2", "pariah", "patriot", "patriot2", "patriot3",
  "patrolboat", "pbus", "pbus2", "pcj", "penetrator", "penumbra", "penumbra2", "peyote", "peyote2", "peyote3",
  "pfister811", "Phantom", "phantom2", "phantom3", "Phantom4", "Phoenix", "picador", "pigalle", "polgauntlet", "police",
  "police2", "police3", "police4", "police5", "policeb", "policeold1", "policeold2", "policet", "polmav", "pony", "pony2",
  "postlude", "Pounder", "pounder2", "powersurge", "prairie", "pRanger", "Predator", "premier", "previon", "primo",
  "primo2", "proptrailer", "prototipo", "pyro", "r300", "radi", "raiden", "raiju", "raketrailer", "rallytruck",
  "RancherXL", "rancherxl2", "RapidGT", "RapidGT2", "rapidgt3", "raptor", "ratbike", "ratel", "ratloader", "ratloader2",
  "rcbandito", "reaper", "Rebel", "rebel2", "rebla", "reever", "regina", "remus", "Rentalbus", "retinue", "retinue2",
  "revolter", "rhapsody", "rhinehart", "RHINO", "riata", "RIOT", "riot2", "Ripley", "rocoto", "rogue", "romero",
  "rrocket", "rt3000", "Rubble", "ruffian", "ruiner", "ruiner2", "ruiner3", "ruiner4", "rumpo", "rumpo2", "rumpo3",
  "ruston", "s80", "sabregt", "sabregt2", "Sadler", "sadler2", "Sanchez", "sanchez2", "sanctus", "sandking", "sandking2",
  "savage", "savestra", "sc1", "scarab", "scarab2", "scarab3", "schafter2", "schafter3", "schafter4", "schafter5",
  "schafter6", "schlagen", "schwarzer", "scorcher", "scramjet", "scrap", "seabreeze", "seashark", "seashark2",
  "seashark3", "seasparrow", "seasparrow2", "seasparrow3", "Seminole", "seminole2", "sentinel", "sentinel2", "sentinel3",
  "sentinel4", "serrano", "SEVEN70", "Shamal", "sheava", "SHERIFF", "sheriff2", "shinobi", "shotaro", "skylift",
  "slamtruck", "slamvan", "slamvan2", "slamvan3", "slamvan4", "slamvan5", "slamvan6", "sm722", "sovereign", "SPECTER",
  "SPECTER2", "speeder", "speeder2", "speedo", "speedo2", "speedo4", "speedo5", "squaddie", "squalo", "stafford",
  "stalion", "stalion2", "stanier", "starling", "stinger", "stingergt", "stingertt", "stockade", "stockade3", "stratum",
  "streamer216", "streiter", "stretch", "strikeforce", "stromberg", "Stryder", "Stunt", "submersible", "submersible2",
  "Sugoi", "sultan", "sultan2", "sultan3", "sultanrs", "Suntrap", "superd", "supervolito", "supervolito2", "Surano",
  "SURFER", "Surfer2", "surfer3", "surge", "swift", "swift2", "swinger", "t20", "Taco", "tahoma", "tailgater",
  "tailgater2", "taipan", "tampa", "tampa2", "tampa3", "tanker", "tanker2", "tankercar", "taxi", "technical",
  "technical2", "technical3", "tempesta", "tenf", "tenf2", "terbyte", "terminus", "tezeract", "thrax", "thrust",
  "thruster", "tigon", "TipTruck", "TipTruck2", "titan", "toreador", "torero", "torero2", "tornado", "tornado2",
  "tornado3", "tornado4", "tornado5", "tornado6", "toro", "toro2", "toros", "TOURBUS", "TOWTRUCK", "Towtruck2",
  "towtruck3", "towtruck4", "tr2", "tr3", "tr4", "TRACTOR", "tractor2", "tractor3", "trailerlarge", "trailerlogs",
  "trailers", "trailers2", "trailers3", "trailers4", "trailers5", "trailersmall", "trailersmall2", "Trash", "trash2",
  "trflat", "tribike", "tribike2", "tribike3", "trophytruck", "trophytruck2", "tropic", "tropic2", "tropos", "tug",
  "tula", "tulip", "tulip2", "turismo2", "turismo3", "turismor", "tvtrailer", "tvtrailer2", "tyrant", "tyrus",
  "utillitruck", "utillitruck2", "Utillitruck3", "vacca", "Vader", "vagner", "vagrant", "valkyrie", "valkyrie2", "vamos",
  "vectre", "velum", "velum2", "verlierer2", "verus", "vestra", "vetir", "veto", "veto2", "vigero", "vigero2", "vigero3",
  "vigilante", "vindicator", "virgo", "virgo2", "virgo3", "virtue", "viseris", "visione", "vivanite", "volatol",
  "volatus", "voltic", "voltic2", "voodoo", "voodoo2", "vortex", "vstr", "warrener", "warrener2", "washington",
  "wastelander", "weevil", "weevil2", "windsor", "windsor2", "winky", "wolfsbane", "xa21", "xls", "xls2", "yosemite",
  "yosemite2", "yosemite3", "youga", "youga2", "youga3", "youga4", "z190", "zeno", "zentorno", "zhaba", "zion", "zion2",
  "zion3", "zombiea", "zombieb", "zorrusso", "zr350", "zr380", "zr3802", "zr3803", "Ztype", }

local vehOffsets         = {
  fc   = 0x001C,
  ft   = 0x0014,
  rc   = 0x0020,
  rt   = 0x0018,
  cg   = 0x0882,
  ng   = 0x0880,
  tg   = 0x0886,
  vm   = 0x000C,
  dfm  = 0x0014,
  accm = 0x004C,
  cofm = 0x0020,
  bf   = 0x006C,
}

local function filterVehNames()
  filteredNames = {}
  for _, veh in ipairs(gta_vehicles) do
    if VEHICLE.IS_THIS_MODEL_A_CAR(joaat(veh)) or VEHICLE.IS_THIS_MODEL_A_BIKE(joaat(veh)) or VEHICLE.IS_THIS_MODEL_A_QUADBIKE(joaat(veh)) then
      valid_veh = veh
      if string.find(string.lower(valid_veh), string.lower(search_term)) then
        table.insert(filteredNames, valid_veh)
      end
    end
  end
end

local function displayVehNames()
  filterVehNames()
  local vehNames = {}
  for _, veh in ipairs(filteredNames) do
    local vehName = vehicles.get_vehicle_display_name(joaat(veh))
    table.insert(vehNames, vehName)
  end
  vehSound_index, used = ImGui.ListBox("##Vehicle Names", vehSound_index, vehNames, #filteredNames)
end

local function resetLastVehState()
  -- placeholder func
end

local function onVehEnter()
  lastVeh         = PLAYER.GET_PLAYERS_LAST_VEHICLE()
  current_vehicle = PED.GET_VEHICLE_PED_IS_USING(self.get_ped())
  lastVehPtr      = Game.getEntPtr(lastVeh)
  currentVehPtr   = Game.getEntPtr(current_vehicle)
  if current_vehicle ~= lastVeh then
    resetLastVehState()
  end
  return lastVeh, lastVehPtr, current_vehicle, currentVehPtr
end

vehicle_tab:add_imgui(function()
  local manufacturer  = Game.Vehicle.manufacturer()
  local vehicle_name  = Game.Vehicle.name()
  local full_veh_name = manufacturer .. " " .. vehicle_name
  local vehicle_class = Game.Vehicle.class()
  if PED.IS_PED_IN_ANY_VEHICLE(self.get_ped(), true) then
    if validModel then
      ImGui.Text(full_veh_name .. "   (" .. vehicle_class .. ")")
      ImGui.Spacing()
      driftMode, driftModeUsed = ImGui.Checkbox(translateLabel("driftModeCB"), driftMode, true)
      UI.helpMarker(false, translateLabel("driftMode_tt"))
      if driftModeUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("driftMode", driftMode)
        lua_cfg.save("DriftTires", false)
      end
      if driftMode then
        DriftTires = false
        ImGui.SameLine()
        -- ImGui.Text(translateLabel("driftSlider"))
        ImGui.PushItemWidth(160)
        DriftIntensity, DriftIntensityUsed = ImGui.SliderInt("##Intensity", DriftIntensity, 0, 3)
        ImGui.PopItemWidth()
        UI.toolTip(false, translateLabel("driftSlider_tt"))
        if DriftIntensityUsed then
          UI.widgetSound("Nav")
          lua_cfg.save("DriftIntensity", DriftIntensity)
        end
      end
      DriftTires, DriftTiresUsed = ImGui.Checkbox(translateLabel("driftTiresCB"), DriftTires, true)
      UI.helpMarker(false, translateLabel("driftTires_tt"))
      if DriftTires then
        driftMode = false
      end
      if DriftTiresUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("DriftTires", DriftTires)
        lua_cfg.save("driftMode", false)
      end
      if driftMode or DriftTires then
        ImGui.Spacing(); ImGui.Text(translateLabel("driftSmokeCol"))
        if not customSmokeCol then
          driftSmokeIndex, dsiUsed = ImGui.Combo("##tireSmoke", driftSmokeIndex, driftSmokeColors, #driftSmokeColors); ImGui.SameLine()
          if dsiUsed then
            selected_smoke_col = driftSmokeColors[driftSmokeIndex + 1]
            local r, g, b = UI.getColor(string.lower(selected_smoke_col))
            r, g, b = lua_Fn.round((r * 255), 2), lua_Fn.round((g * 255), 2), lua_Fn.round((b * 255), 2)
            driftSmoke.r, driftSmoke.g, driftSmoke.b = r, g, b
          end
        else
          smokeHex, smokeHexEntered = ImGui.InputTextWithHint("##customHex", "HEX", smokeHex, 8, ImGuiInputTextFlags.EnterReturnsTrue | ImGuiInputTextFlags.CharsNoBlank); ImGui.SameLine()
          if ImGui.IsItemActive() then
            is_typing = true
          else
            is_typing = false
          end
          UI.toolTip(false, translateLabel("hex_tt"))
          if smokeHexEntered then
            if smokeHex ~= nil then
              if not smokeHex:find("^#") then
                smokeHex = "#" .. smokeHex
              end
              driftSmoke.r, driftSmoke.g, driftSmoke.b = lua_Fn.hexToRGB(smokeHex)
            end
          end
        end
        customSmokeCol, cscUsed = ImGui.Checkbox(translateLabel("customLangTxt"), customSmokeCol, true)
        if cscUsed then
          UI.widgetSound("Nav2")
        end
      end
    else
      UI.wrappedText(translateLabel("driftInvalidVehTxt"), 15)
    end

    ImGui.Separator(); ImGui.Spacing(); limitVehOptions, lvoUsed = ImGui.Checkbox(translateLabel("lvoCB"),
      limitVehOptions, true)
    UI.toolTip(false, translateLabel("lvo_tt"))
    if lvoUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("limitVehOptions", limitVehOptions)
    end

    launchCtrl, lctrlUsed = ImGui.Checkbox("Launch Control", launchCtrl, true)
    UI.toolTip(false, translateLabel("lct_tt"))
    if lctrlUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("launchCtrl", launchCtrl)
    end

    ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine(); speedBoost, spdbstUsed = ImGui.Checkbox("NOS", speedBoost,
      true)
    UI.toolTip(false, translateLabel("speedBoost_tt"))
    if spdbstUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("speedBoost", speedBoost)
    end
    if speedBoost then
      ImGui.SameLine(); nosvfx, nosvfxUsed = ImGui.Checkbox("VFX", nosvfx, true)
      UI.toolTip(false, translateLabel("vfx_tt"))
      if nosvfxUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("nosvfx", nosvfx)
      end
    end

    loud_radio, loudRadioUsed = ImGui.Checkbox("Big Subwoofer", loud_radio, true)
    UI.toolTip(false, translateLabel("loudradio_tt"))
    if loudRadioUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("loud_radio", loud_radio)
    end
    if loud_radio then
      script.run_in_fiber(function()
        AUDIO.SET_VEHICLE_RADIO_LOUD(current_vehicle, true)
      end)
    else
      script.run_in_fiber(function()
        AUDIO.SET_VEHICLE_RADIO_LOUD(current_vehicle, false)
      end)
    end

    ImGui.SameLine(); ImGui.Dummy(32, 1); ImGui.SameLine(); nosPurge, nosPurgeUsed = ImGui.Checkbox("NOS Purge", nosPurge,
      true)
    UI.toolTip(false, translateLabel("purge_tt"))
    if nosPurgeUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("nosPurge", nosPurge)
    end

    popsNbangs, pnbUsed = ImGui.Checkbox("Pops & Bangs", popsNbangs, true)
    UI.toolTip(false, translateLabel("pnb_tt"))
    if pnbUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("popsNbangs", popsNbangs)
    end
    if popsNbangs then
      ImGui.SameLine(); ImGui.Dummy(37, 1); ImGui.SameLine(); louderPops, louderPopsUsed = ImGui.Checkbox("Louder Pops",
        louderPops, true)
      UI.toolTip(false, translateLabel("louderpnb_tt"))
      if louderPopsUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("louderPops", louderPops)
      end
    end

    hornLight, hornLightUsed = ImGui.Checkbox("High Beams on Horn", hornLight, true)
    UI.toolTip(false, translateLabel("highbeams_tt"))
    if hornLightUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("hornLight", hornLight)
    end

    ImGui.SameLine(); autobrklight, autobrkUsed = ImGui.Checkbox("Auto Brake Lights", autobrklight, true)
    UI.toolTip(false, translateLabel("brakeLight_tt"))
    if autobrkUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("autobrklight", autobrklight)
    end

    holdF, holdFused = ImGui.Checkbox("Keep Engine On", holdF, true)
    UI.toolTip(false, translateLabel("engineOn_tt"))
    if holdFused then
      UI.widgetSound("Nav2")
      lua_cfg.save("holdF", holdF)
    end

    ImGui.SameLine(); ImGui.Dummy(25, 1); ImGui.SameLine(); noJacking, noJackingUsed = ImGui.Checkbox(
      "Can't Touch This!", noJacking, true)
    UI.toolTip(false, translateLabel("canttouchthis_tt"))
    if noJackingUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("noJacking", noJacking)
    end

    insta180, insta180Used = ImGui.Checkbox("Instant 180°", insta180, true)
    if insta180Used then
      UI.widgetSound("Nav2")
      lua_cfg.save("insta180", insta180)
    end
    UI.toolTip(false, translateLabel("insta180_tt"))

    ImGui.SameLine(); ImGui.Dummy(54, 1); ImGui.SameLine(); flappyDoors, flappyDoorsUsed = ImGui.Checkbox("Flappy Doors",
      flappyDoors, true)
    if flappyDoorsUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("flappyDoors", flappyDoors)
    end

    rgbLights, rgbToggled = ImGui.Checkbox(translateLabel("rgbLights"), rgbLights, true)
    if rgbToggled then
      UI.widgetSound("Nav2")
      lua_cfg.save("rgbLights", rgbLights)
      script.run_in_fiber(function()
        if not VEHICLE.IS_TOGGLE_MOD_ON(current_vehicle, 22) then
          has_xenon = false
        else
          has_xenon    = true
          defaultXenon = VEHICLE.GET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle)
        end
      end)
    end
    if rgbLights then
      ImGui.SameLine();
      ImGui.PushItemWidth(120)
      lightSpeed, lightSpeedUsed = ImGui.SliderInt(translateLabel("rgbSlider"), lightSpeed, 1, 3)
      ImGui.PopItemWidth()
      if lightSpeedUsed then
        UI.widgetSound("Nav")
        lua_cfg.save("lightSpeed", lightSpeed)
      end
    end
    ImGui.Spacing()
    if ImGui.Button(translateLabel("engineSoundBtn")) then
      if is_car or is_bike or is_quad then
        open_sounds_window = true
      else
        open_sounds_window = false
        gui.show_error("Tokyo Drift", translateLabel("engineSoundErr"))
      end
    end
    if open_sounds_window then
      ImGui.SetNextWindowPos(740, 300, ImGuiCond.Appearing)
      ImGui.SetNextWindowSizeConstraints(100, 100, 600, 800)
      ImGui.Begin("Vehicle Sounds",
        ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoCollapse)
      if ImGui.Button(translateLabel("closeBtn")) then
        open_sounds_window = false
      end
      ImGui.Spacing(); ImGui.Spacing()
      ImGui.PushItemWidth(250)
      search_term, used = ImGui.InputTextWithHint("", translateLabel("searchVeh_hint"), search_term, 32)
      if ImGui.IsItemActive() then
        is_typing = true
      else
        is_typing = false
      end
      ImGui.PushItemWidth(270)
      displayVehNames()
      ImGui.PopItemWidth()
      local selected_name = filteredNames[vehSound_index + 1]
      ImGui.Spacing()
      if ImGui.Button(translateLabel("Use This Sound")) then
        script.run_in_fiber(function()
          AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(current_vehicle, selected_name)
        end)
      end
      ImGui.SameLine()
      if ImGui.Button(translateLabel("Restore Default")) then
        script.run_in_fiber(function()
          AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(current_vehicle,
            vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(current_vehicle)))
        end)
      end
      ImGui.End()
    end

    ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
    local engineHealth = VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle)
    if engineHealth <= 300 then
      engineDestroyed = true
    else
      engineDestroyed = false
    end
    if engineDestroyed then
      engineButton_label = translateLabel("Fix Engine")
      engine_hp          = 1000
    else
      engineButton_label = translateLabel("Destroy Engine")
      engine_hp          = -4000
    end
    if ImGui.Button(engineButton_label) then
      script.run_in_fiber(function()
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(current_vehicle, engine_hp)
      end)
    end
  else
    ImGui.Text(translateLabel("getinveh"))
  end
end)

local flatbed          = vehicle_tab:add_tab("Flatbed")
local attached_vehicle = 0
local xAxis            = 0.0
local yAxis            = 0.0
local zAxis            = 0.0
local modelOverride    = false
flatbed:add_imgui(function()
  local vehicleHandles = entities.get_all_vehicles_as_handles()
  local flatbedModel   = 1353720154
  local vehicle_model  = Game.getEntityModel(current_vehicle)
  local playerPosition = self.get_pos()
  local playerForwardX = Game.getForwardX(self.get_ped())
  local playerForwardY = Game.getForwardY(self.get_ped())
  for _, veh in ipairs(vehicleHandles) do
    script.run_in_fiber(function(detector)
      local detectPos = vec3:new(playerPosition.x - (playerForwardX * 10), playerPosition.y - (playerForwardY * 10),
        playerPosition.z)
      local vehPos    = ENTITY.GET_ENTITY_COORDS(veh, false)
      local vDist     = SYSTEM.VDIST(detectPos.x, detectPos.y, detectPos.z, vehPos.x, vehPos.y, vehPos.z)
      if vDist <= 5 then
        closestVehicle = veh
      else
        detector:sleep(50)
        closestVehicle = nil
        return
      end
    end)
  end
  local closestVehicleModel = Game.getEntityModel(closestVehicle)
  local iscar               = VEHICLE.IS_THIS_MODEL_A_CAR(closestVehicleModel)
  local isbike              = VEHICLE.IS_THIS_MODEL_A_BIKE(closestVehicleModel)
  local closestVehicleName  = vehicles.get_vehicle_display_name(closestVehicleModel)
  if vehicle_model == flatbedModel then
    is_in_flatbed = true
  else
    is_in_flatbed = false
  end
  if closestVehicleName == "" then
    displayText = translateLabel("fltbd_nonearbyvehTxt")
  elseif tostring(closestVehicleName) == "Flatbed" then
    displayText = translateLabel("fltbd_nootherfltbdTxt")
  else
    displayText = (translateLabel("fltbd_closest_veh") .. tostring(closestVehicleName))
  end
  if attached_vehicle ~= 0 then
    displayText = translateLabel("fltbd_towingTxt") ..
        vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(attached_vehicle)) .. "."
  end
  if modelOverride then
    towable = true
  else
    towable = false
  end
  if iscar then
    towable = true
  end
  if isbike then
    towable = true
  end
  if closestVehicleModel == 745926877 then --Buzzard
    towable = true
  end
  if is_in_flatbed then
    ImGui.Text(displayText)
    towPos, towPosUsed = ImGui.Checkbox(translateLabel("Show Towing Position"), towPos, true)
    UI.helpMarker(false, translateLabel("towpos_tt"))
    if towPosUsed then
      UI.widgetSound("Nav2")
    end

    towEverything, towEverythingUsed = ImGui.Checkbox(translateLabel("Tow Everything"), towEverything, true)
    UI.helpMarker(false, translateLabel("TowEverything_tt"))
    if towEverythingUsed then
      UI.widgetSound("Nav2")
    end
    if towEverything then
      modelOverride = true
    else
      modelOverride = false
    end

    if attached_vehicle == 0 then
      if ImGui.Button(translateLabel("towBtn")) then
        UI.widgetSound("Select")
        if towable and closestVehicle ~= nil and closestVehicleModel ~= flatbedModel then
          script.run_in_fiber(function()
            controlled = entities.take_control_of(closestVehicle, 300)
            if controlled then
              flatbedHeading = ENTITY.GET_ENTITY_HEADING(current_vehicle)
              flatbedBone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, "chassis_dummy")
              vehBone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(closestVehicle, "chassis_dummy")
              local vehicleClass = VEHICLE.GET_VEHICLE_CLASS(closestVehicle)
              if vehicleClass == 1 then
                zAxis = 0.9
                yAxis = -2.3
              elseif vehicleClass == 2 then
                zAxis = 0.993
                yAxis = -2.17046
              elseif vehicleClass == 6 then
                zAxis = 1.00069420
                yAxis = -2.17046
              elseif vehicleClass == 7 then
                zAxis = 1.009
                yAxis = -2.17036
              elseif vehicleClass == 15 then
                zAxis = 1.3
                yAxis = -2.21069
              elseif vehicleClass == 16 then
                zAxis = 1.5
                yAxis = -2.21069
              else
                zAxis = 1.1
                yAxis = -2.0
              end
              ENTITY.SET_ENTITY_HEADING(closestVehicleModel, flatbedHeading)
              ENTITY.ATTACH_ENTITY_TO_ENTITY(closestVehicle, current_vehicle, flatbedBone, xAxis, yAxis, zAxis, 0.0, 0.0,
                0.0, true, true, false, false, 1, true, 1)
              attached_vehicle = closestVehicle
              ENTITY.SET_ENTITY_CANT_CAUSE_COLLISION_DAMAGED_ENTITY(attached_vehicle, current_vehicle)
            else
              gui.show_error("Flatbed Script", translateLabel("failed_veh_ctrl"))
            end
          end)
        end
        if closestVehicle ~= nil and closestVehicleModel ~= flatbedModel and not towable then
          gui.show_message("Flatbed Script", translateLabel("fltbd_carsOnlyTxt"))
        end
        if closestVehicle ~= nil and closestVehicleModel == flatbedModel then
          gui.show_message("Flatbed Script", translateLabel("fltbd_nootherfltbdTxt"))
        end
      end
    else
      if ImGui.Button(translateLabel("detachBtn")) then
        UI.widgetSound("Select2")
        script.run_in_fiber(function()
          local modelHash = ENTITY.GET_ENTITY_MODEL(attached_vehicle)
          local attachedVehicle = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(
            PED.GET_VEHICLE_PED_IS_USING(self.get_ped()), modelHash)
          local attachedVehcoords = ENTITY.GET_ENTITY_COORDS(attached_vehicle, false)
          controlled = entities.take_control_of(attachedVehicle, 300)
          if ENTITY.DOES_ENTITY_EXIST(attachedVehicle) then
            if controlled then
              ENTITY.DETACH_ENTITY(attachedVehicle)
              ENTITY.SET_ENTITY_COORDS(attachedVehicle, attachedVehcoords.x - (playerForwardX * 10),
                attachedVehcoords.y - (playerForwardY * 10), playerPosition.z, false, false, false, false)
              VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(attached_vehicle, 5.0)
              attached_vehicle = 0
            end
          end
        end)
      end
      ImGui.Spacing(); ImGui.Text(translateLabel("Adjust Vehicle Position"))
      if ImGui.IsItemHovered() then
        ImGui.BeginTooltip()
        ImGui.PushTextWrapPos(ImGui.GetFontSize() * 20)
        ImGui.TextWrapped(translateLabel("AdjustPosition_tt"))
        ImGui.PopTextWrapPos()
        ImGui.EndTooltip()
      end
      ImGui.Separator(); ImGui.Spacing()
      ImGui.Dummy(100, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Up", 2)
      if ImGui.IsItemActive() then
        zAxis = zAxis + 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(attached_vehicle, current_vehicle, flatbedBone, xAxis, yAxis, zAxis, 0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.Dummy(60, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Left", 0)
      if ImGui.IsItemActive() then
        yAxis = yAxis + 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(attached_vehicle, current_vehicle, flatbedBone, xAxis, yAxis, zAxis, 0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.SameLine(); ImGui.Dummy(23, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Right", 1)
      if ImGui.IsItemActive() then
        yAxis = yAxis - 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(attached_vehicle, current_vehicle, flatbedBone, xAxis, yAxis, zAxis, 0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.Dummy(100, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Down", 3)
      if ImGui.IsItemActive() then
        zAxis = zAxis - 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(attached_vehicle, current_vehicle, flatbedBone, xAxis, yAxis, zAxis, 0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
    end
  else
    ImGui.Text(translateLabel("getinsidefltbd"))
    if ImGui.Button(translateLabel("spawnfltbd")) then
      script.run_in_fiber(function(script)
        if not PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
          local try = 0
          while not STREAMING.HAS_MODEL_LOADED(flatbedModel) do
            STREAMING.REQUEST_MODEL(flatbedModel)
            script:yield()
            if try > 100 then
              return
            else
              try = try + 1
            end
          end
          fltbd = VEHICLE.CREATE_VEHICLE(flatbedModel, playerPosition.x, playerPosition.y, playerPosition.z,
            ENTITY.GET_ENTITY_HEADING(self.get_ped()), true, false, false)
          PED.SET_PED_INTO_VEHICLE(self.get_ped(), fltbd, -1)
          ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(fltbd)
        else
          gui.show_error("Flatbed Script", translateLabel("Exit your current vehicle first."))
        end
      end)
    end
  end
end)


--[[
    *players*
]]
players_tab           = Samurais_scripts:add_tab(translateLabel("playersTab"))

playerIndex           = 0
local selectedPlayer  = 0
local playerCount     = 0
local targetPlayerPed = 0
local playerHeading   = 0
local playerHealth    = 0
local playerArmour    = 0
local playerVeh       = 0
local player_name     = ""
local playerWallet    = ""
local playerBank      = ""
local playerCoords    = vector3
local godmode         = false
local player_in_veh   = false
local player_active   = false
local targetPlayerIndex
players_tab:add_imgui(function()
  if Game.isOnline() then
    ImGui.Text(translateLabel("Total Players:") .. "  [ " .. playerCount .. " ]")
    ImGui.PushItemWidth(320)
    Game.displayPlayerList()
    ImGui.PopItemWidth()
    ImGui.Spacing()
    if player_active then
      ImGui.Spacing()
      ImGui.Text("Cash:" .. "      " .. playerWallet)
      ImGui.Spacing()
      ImGui.Text("Bank:" .. "      " .. playerBank)
      ImGui.Spacing()
      ImGui.Text("Coords:" .. "      " .. tostring(playerCoords))
      if ImGui.IsItemHovered() and ImGui.IsItemClicked(0) then
        log.debug(player_name .. "'s coords: " .. tostring(playerCoords))
        gui.show_message("Samurai's Scripts", player_name .. "'s coordinates logged to console.")
      end
      ImGui.Spacing()
      ImGui.Text("Heading:" .. "     " .. tostring(playerHeading))
      if ImGui.IsItemHovered() and ImGui.IsItemClicked(0) then
        log.debug(player_name .. "'s heading: " .. tostring(playerHeading))
        gui.show_message("Samurai's Scripts", player_name .. "'s heading logged to console.")
      end
      ImGui.Spacing()
      ImGui.Text("Health:" .. "        " .. tostring(playerHealth))
      if playerArmour ~= nil then
        ImGui.Spacing()
        ImGui.Text("Armour:" .. "      " .. tostring(playerArmour))
      end
      ImGui.Spacing()
      ImGui.Text("God Mode:" .. "  " .. tostring(godmode))
      if player_in_veh then
        ImGui.Spacing()
        ImGui.Text("Vehicle:" .. "  " .. tostring(vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(playerVeh))))
        if ImGui.Button("Delete Vehicle") then
          script.run_in_fiber(function(del)
            local pvCTRL = entities.take_control_of(playerVeh, 350)
            if pvCTRL then
              ENTITY.SET_ENTITY_AS_MISSION_ENTITY(playerVeh, true, true)
              del:sleep(200)
              VEHICLE.DELETE_VEHICLE(playerVeh)
              gui.show_success("Samurai's Scripts", "" .. player_name .. "'s vehicle has been yeeted.")
            else
              gui.show_error("Samurai's Scripts",
                "Failed to delete the vehicle! " .. player_name .. " probably has protections on.")
            end
          end)
        end
      end
    else
      ImGui.Text("Player left the session.")
    end
  else
    ImGui.Text("You are currently in Single Player.")
  end
end)


--[[
    *world*
]]
local world_tab          = Samurais_scripts:add_tab(translateLabel("worldTab"))
local pedGrabber         = false
local ped_grabbed        = false
local carpool            = false
local show_npc_veh_ctrls = false
local stop_searching     = false
local attached_ped       = 0
local thisVeh            = 0
local pedthrowF          = 10

local function playHandsUp()
  script.run_in_fiber(function()
    if Game.requestAnimDict("mp_missheist_countrybank@lift_hands") then
      TASK.TASK_PLAY_ANIM(self.get_ped(), "mp_missheist_countrybank@lift_hands", "lift_hands_in_air_outro", 4.0, -4.0, -1,
        50, 1.0, false, false, false)
    end
  end)
end

local function attachPed(ped)
  local myBone = PED.GET_PED_BONE_INDEX(self.get_ped(), 6286)
  script.run_in_fiber(function()
    if not ped_grabbed and not PED.IS_PED_A_PLAYER(ped) then
      if entities.take_control_of(ped, 300) then
        TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, self.get_ped(), myBone, 0.35, 0.3, -0.04, 100.0, 90.0, -10.0, false, true,
          false, true, 1, true, 1)
        ped_grabbed = true
        attached_ped = ped
      else
        gui.show_error("Samurai's Scripts", translateLabel("failedToCtrlNPC"))
      end
    end
  end)
  return ped_grabbed, attached_ped
end

world_tab:add_imgui(function()
  pedGrabber, pgUsed = ImGui.Checkbox(translateLabel("pedGrabber"), pedGrabber, true)
  UI.helpMarker(false, translateLabel("pedGrabber_tt"))
  if pgUsed then
    UI.widgetSound("Nav2")
  end

  if pedGrabber then
    ImGui.Text(translateLabel("Throw Force"))
    ImGui.PushItemWidth(160)
    pedthrowF, ptfUsed = ImGui.SliderInt("##throw_force", pedthrowF, 10, 100, "%d", 0)
    ImGui.PopItemWidth()
    if ptfUsed then
      UI.widgetSound("Nav")
    end
  end

  carpool, carpoolUsed = ImGui.Checkbox(translateLabel("carpool"), carpool, true)
  UI.helpMarker(false, translateLabel("carpool_tt"))
  if carpoolUsed then
    UI.widgetSound("Nav2")
  end

  if carpool then
    if show_npc_veh_ctrls and thisVeh ~= 0 then
      if ImGui.Button("< " .. translateLabel("prevSeat")) then
        script.run_in_fiber(function()
          if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
            local numSeats = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(thisVeh)
            local mySeat   = Game.getPedVehicleSeat(self.get_ped())
            if mySeat <= 0 then
              mySeat = numSeats
            end
            mySeat = mySeat - 1
            if VEHICLE.IS_VEHICLE_SEAT_FREE(thisVeh, mySeat, true) then
              UI.widgetSound("Nav")
              PED.SET_PED_INTO_VEHICLE(self.get_ped(), thisVeh, mySeat)
            else
              mySeat = mySeat - 1
              return
            end
          end
        end)
      end
      ImGui.SameLine()
      if ImGui.Button(translateLabel("nextSeat") .. " >") then
        script.run_in_fiber(function()
          if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
            local numSeats = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(thisVeh)
            local mySeat   = Game.getPedVehicleSeat(self.get_ped())
            if mySeat > numSeats then
              mySeat = 0
            end
            mySeat = mySeat + 1
            if VEHICLE.IS_VEHICLE_SEAT_FREE(thisVeh, mySeat, true) then
              UI.widgetSound("Nav")
              PED.SET_PED_INTO_VEHICLE(self.get_ped(), thisVeh, mySeat)
            else
              mySeat = mySeat + 1
              return
            end
          end
        end)
      end
    end
  end
end)

local object_spawner         = world_tab:add_tab("Object Spawner")
local coords                 = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
local heading                = ENTITY.GET_ENTITY_HEADING(self.get_ped())
local forwardX               = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
local forwardY               = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
local searchQuery            = ""
local propName               = ""
local invalidType            = ""
local showCustomProps        = true
local edit_mode              = false
local activeX                = false
local activeY                = false
local activeZ                = false
local rotX                   = false
local rotY                   = false
local rotZ                   = false
local attached               = false
local attachToSelf           = false
local attachToVeh            = false
local previewStarted         = false
local isChanged              = false
local showInvalidObjText     = false
local blacklisted_obj        = false
local prop                   = 0
local propHash               = 0
local os_switch              = 0
local prop_index             = 0
local objects_index          = 0
local spawned_index          = 0
local selectedObject         = 0
local axisMult               = 1
local selected_bone          = 0
local previewEntity          = 0
local currentObjectPreview   = 0
local attached_index         = 0
local zOffset                = 0
local spawned_props          = {}
local spawnedNames           = {}
local filteredSpawnNames     = {}
local selfAttachments        = {}
local selfAttachNames        = {}
local vehAttachments         = {}
local vehAttachNames         = {}
local filteredVehAttachNames = {}
local filteredAttachNames    = {}
local spawnDistance          = { x = 0, y = 0, z = 0 }
local spawnRot               = { x = 0, y = 0, z = 0 }
local attachPos              = { x = 0.0, y = 0.0, z = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 }
local pedBones               = {
  { name = "Root",       ID = 0 },
  { name = "Head",       ID = 12844 },
  { name = "Spine 00",   ID = 23553 },
  { name = "Spine 01",   ID = 24816 },
  { name = "Spine 02",   ID = 24817 },
  { name = "Spine 03",   ID = 24818 },
  { name = "Right Hand", ID = 6286 },
  { name = "Left Hand",  ID = 18905 },
  { name = "Right Foot", ID = 35502 },
  { name = "Left Foot",  ID = 14201 },
}
local vehBones               = { "chassis", "chassis_lowlod", "chassis_dummy", "seat_dside_f", "seat_dside_r",
  "seat_dside_r1", "seat_dside_r2", "seat_dside_r3", "seat_dside_r4", "seat_dside_r5", "seat_dside_r6", "seat_dside_r7",
  "seat_pside_f", "seat_pside_r", "seat_pside_r1", "seat_pside_r2", "seat_pside_r3", "seat_pside_r4", "seat_pside_r5",
  "seat_pside_r6", "seat_pside_r7", "window_lf1", "window_lf2", "window_lf3", "window_rf1", "window_rf2", "window_rf3",
  "window_lr1", "window_lr2", "window_lr3", "window_rr1", "window_rr2", "window_rr3", "door_dside_f", "door_dside_r",
  "door_pside_f", "door_pside_r", "handle_dside_f", "handle_dside_r", "handle_pside_f", "handle_pside_r", "wheel_lf",
  "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr",
  "suspension_lf", "suspension_rf", "suspension_lm", "suspension_rm", "suspension_lr", "suspension_rr", "spring_rf",
  "spring_lf", "spring_rr", "spring_lr", "transmission_f", "transmission_m", "transmission_r", "hub_lf", "hub_rf",
  "hub_lm1", "hub_rm1", "hub_lm2", "hub_rm2", "hub_lm3", "hub_rm3", "hub_lr", "hub_rr", "windscreen", "windscreen_r",
  "window_lf", "window_rf", "window_lr", "window_rr", "window_lm", "window_rm", "bodyshell", "bumper_f", "bumper_r",
  "wing_rf", "wing_lf", "bonnet", "boot", "exhaust", "exhaust_2", "exhaust_3", "exhaust_4", "exhaust_5", "exhaust_6",
  "exhaust_7", "exhaust_8", "exhaust_9", "exhaust_10", "exhaust_11", "exhaust_12", "exhaust_13", "exhaust_14",
  "exhaust_15", "exhaust_16", "engine", "overheat", "overheat_2", "petrolcap", "petroltank", "petroltank_l",
  "petroltank_r", "steering", "hbgrip_l", "hbgrip_r", "headlight_l", "headlight_r", "taillight_l", "taillight_r",
  "indicator_lf", "indicator_rf", "indicator_lr", "indicator_rr", "brakelight_l", "brakelight_r", "brakelight_m",
  "reversinglight_l", "reversinglight_r", "extralight_1", "extralight_2", "extralight_3", "extralight_4", "numberplate",
  "interiorlight", "siren1", "siren2", "siren3", "siren4", "siren5", "siren6", "siren7", "siren8", "siren9", "siren10",
  "siren11", "siren12", "siren13", "siren14", "siren15", "siren16", "siren17", "siren18", "siren19", "siren20",
  "siren_glass1", "siren_glass2", "siren_glass3", "siren_glass4", "siren_glass5", "siren_glass6", "siren_glass7",
  "siren_glass8", "siren_glass9", "siren_glass10", "siren_glass11", "siren_glass12", "siren_glass13", "siren_glass14",
  "siren_glass15", "siren_glass16", "siren_glass17", "siren_glass18", "siren_glass19", "siren_glass20", "spoiler",
  "struts", "misc_a", "misc_b", "misc_c", "misc_d", "misc_e", "misc_f", "misc_g", "misc_h", "misc_i", "misc_j", "misc_k",
  "misc_l", "misc_m", "misc_n", "misc_o", "misc_p", "misc_q", "misc_r", "misc_s", "misc_t", "misc_u", "misc_v", "misc_w",
  "misc_x", "misc_y", "misc_z", "misc_1", "misc_2", "weapon_1a", "weapon_1b", "weapon_1c", "weapon_1d", "weapon_1a_rot",
  "weapon_1b_rot", "weapon_1c_rot", "weapon_1d_rot", "weapon_2a", "weapon_2b", "weapon_2c", "weapon_2d", "weapon_2a_rot",
  "weapon_2b_rot", "weapon_2c_rot", "weapon_2d_rot", "weapon_3a", "weapon_3b", "weapon_3c", "weapon_3d", "weapon_3a_rot",
  "weapon_3b_rot", "weapon_3c_rot", "weapon_3d_rot", "weapon_4a", "weapon_4b", "weapon_4c", "weapon_4d", "weapon_4a_rot",
  "weapon_4b_rot", "weapon_4c_rot", "weapon_4d_rot", "turret_1base", "turret_1barrel", "turret_2base", "turret_2barrel",
  "turret_3base", "turret_3barrel", "ammobelt", "searchlight_base", "searchlight_light", "attach_female", "roof", "roof2",
  "soft_1", "soft_2", "soft_3", "soft_4", "soft_5", "soft_6", "soft_7", "soft_8", "soft_9", "soft_10", "soft_11",
  "soft_12", "soft_13", "forks", "mast", "carriage", "fork_l", "fork_r", "forks_attach", "frame_1", "frame_2", "frame_3",
  "frame_pickup_1", "frame_pickup_2", "frame_pickup_3", "frame_pickup_4", "freight_cont", "freight_bogey",
  "freightgrain_slidedoor", "door_hatch_r", "door_hatch_l", "tow_arm", "tow_mount_a", "tow_mount_b", "tipper",
  "combine_reel", "combine_auger", "slipstream_l", "slipstream_r", "arm_1", "arm_2", "arm_3", "arm_4", "scoop", "boom",
  "stick", "bucket", "shovel_2", "shovel_3", "Lookat_UpprPiston_head", "Lookat_LowrPiston_boom", "Boom_Driver",
  "cutter_driver", "vehicle_blocker", "extra_1", "extra_2", "extra_3", "extra_4", "extra_5", "extra_6", "extra_7",
  "extra_8", "extra_9", "extra_ten", "extra_11", "extra_12", "break_extra_1", "break_extra_2", "break_extra_3",
  "break_extra_4", "break_extra_5", "break_extra_6", "break_extra_7", "break_extra_8", "break_extra_9", "break_extra_10",
  "mod_col_1", "mod_col_2", "mod_col_3", "mod_col_4", "mod_col_5", "handlebars", "forks_u", "forks_l", "wheel_f",
  "swingarm", "wheel_r", "crank", "pedal_r", "pedal_l", "static_prop", "moving_prop", "static_prop2", "moving_prop2",
  "rudder", "rudder2", "wheel_rf1_dummy", "wheel_rf2_dummy", "wheel_rf3_dummy", "wheel_rb1_dummy", "wheel_rb2_dummy",
  "wheel_rb3_dummy", "wheel_lf1_dummy", "wheel_lf2_dummy", "wheel_lf3_dummy", "wheel_lb1_dummy", "wheel_lb2_dummy",
  "wheel_lb3_dummy", "bogie_front", "bogie_rear", "rotor_main", "rotor_rear", "rotor_main_2", "rotor_rear_2", "elevators",
  "tail", "outriggers_l", "outriggers_r", "rope_attach_a", "rope_attach_b", "prop_1", "prop_2", "elevator_l",
  "elevator_r", "rudder_l", "rudder_r", "prop_3", "prop_4", "prop_5", "prop_6", "prop_7", "prop_8", "rudder_2",
  "aileron_l", "aileron_r", "airbrake_l", "airbrake_r", "wing_l", "wing_r", "wing_lr", "wing_rr", "engine_l", "engine_r",
  "nozzles_f", "nozzles_r", "afterburner", "wingtip_1", "wingtip_2", "gear_door_fl", "gear_door_fr", "gear_door_rl1",
  "gear_door_rr1", "gear_door_rl2", "gear_door_rr2", "gear_door_rml", "gear_door_rmr", "gear_f", "gear_rl", "gear_lm1",
  "gear_rr", "gear_rm1", "gear_rm", "prop_left", "prop_right", "legs", "attach_male", "draft_animal_attach_lr",
  "draft_animal_attach_rr", "draft_animal_attach_lm", "draft_animal_attach_rm", "draft_animal_attach_lf",
  "draft_animal_attach_rf", "wheelcover_l", "wheelcover_r", "barracks", "pontoon_l", "pontoon_r", "no_ped_col_step_l",
  "no_ped_col_strut_1_l", "no_ped_col_strut_2_l", "no_ped_col_step_r", "no_ped_col_strut_1_r", "no_ped_col_strut_2_r",
  "light_cover", "emissives", "neon_l", "neon_r", "neon_f", "neon_b", "dashglow", "doorlight_lf", "doorlight_rf",
  "doorlight_lr", "doorlight_rr", "unknown_id", "dials", "engineblock", "bobble_head", "bobble_base", "bobble_hand",
  "chassis_Control", }

local function resetSliders()
  spawnDistance = { x = 0, y = 0, z = 0 }
  spawnRot      = { x = 0, y = 0, z = 0 }
  attachPos     = { x = 0.0, y = 0.0, z = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 }
end

object_spawner:add_imgui(function()
  ImGui.PushItemWidth(280)
  searchQuery, used = ImGui.InputTextWithHint("##searchObjects", translateLabel("search_hint"), searchQuery, 32)
  ImGui.PopItemWidth()
  if ImGui.IsItemActive() then
    is_typing = true
  else
    is_typing = false
  end
end)

local function updateFilteredProps()
  filteredProps = {}
  for _, p in ipairs(custom_props) do
    if string.find(string.lower(p.name), string.lower(searchQuery)) then
      table.insert(filteredProps, p)
    end
    table.sort(custom_props, function(a, b)
      return a.name < b.name
    end)
  end
end
local function displayFilteredProps()
  updateFilteredProps()
  local propNames = {}
  for _, p in ipairs(filteredProps) do
    table.insert(propNames, p.name)
  end
  prop_index, used = ImGui.ListBox("##propList", prop_index, propNames, #filteredProps)
  prop = filteredProps[prop_index + 1]
  if prop ~= nil then
    propHash = prop.hash
    propName = prop.name
  end
end
local function getAllObjects()
  filteredObjects = {}
  for _, object in ipairs(gta_objets) do
    if searchQuery ~= "" then
      if string.find(string.lower(object), string.lower(searchQuery)) then
        table.insert(filteredObjects, object)
      end
    else
      table.insert(filteredObjects, object)
    end
  end
  objects_index, used = ImGui.ListBox("##gtaObjectsList", objects_index, filteredObjects, #filteredObjects)
  prop                = filteredObjects[objects_index + 1]
  propHash            = joaat(prop)
  propName            = prop
  if gui.is_open() and os_switch ~= 0 then
    for _, b in ipairs(mp_blacklist) do
      if propName == b then
        showInvalidObjText = true
        blacklisted_obj    = true
        invalidType = translateLabel("R*_blacklist")
        break
      else
        showInvalidObjText = false
        blacklisted_obj    = false
      end
      for _, c in ipairs(crash_objects) do
        if propName == c then
          showInvalidObjText = true
          invalidType = translateLabel("crash_object")
          break
        else
          showInvalidObjText = false
        end
      end
    end
  end
end

local function updateSelfBones()
  filteredSelfBones = {}
  for _, bone in ipairs(pedBones) do
    table.insert(filteredSelfBones, bone)
  end
end

local function displaySelfBones()
  updateSelfBones()
  local boneNames = {}
  for _, bone in ipairs(filteredSelfBones) do
    table.insert(boneNames, bone.name)
  end
  selected_bone, used = ImGui.Combo("##pedBones", selected_bone, boneNames, #filteredSelfBones)
end

local function updateVehBones()
  filteredVehBones = {}
  for _, bone in ipairs(vehBones) do
    local bone_idx = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, bone)
    if bone_idx ~= nil and bone_idx ~= -1 then
      table.insert(filteredVehBones, bone)
    end
  end
end

local function displayVehBones()
  updateVehBones()
  local boneNames = {}
  for _, bone in ipairs(filteredVehBones) do
    table.insert(boneNames, bone)
  end
  selected_bone, used = ImGui.Combo("##vehBones", selected_bone, boneNames, #filteredVehBones)
end

local function clearPreviewData()
  pedPreviewModel     = 0
  vehiclePreviewModel = 0
  objectPreviewModel  = 0
  previewEntity       = 0
end

local function stopPreview()
  if previewStarted then
    previewStarted = false
  end
  clearPreviewData()
end

object_spawner:add_imgui(function()
  os_switch, _ = ImGui.RadioButton(translateLabel("Custom Objects"), os_switch, 0)
  ImGui.SameLine(); os_switch, _ = ImGui.RadioButton(translateLabel("All Objects"), os_switch, 1)
  if os_switch == 0 then
    ImGui.PushItemWidth(300)
    displayFilteredProps()
    ImGui.PopItemWidth()
  else
    ImGui.PushItemWidth(300)
    getAllObjects()
    ImGui.PopItemWidth()
  end
  ImGui.Spacing()
  if blacklisted_obj then
    ImGui.BeginDisabled()
    preview, _ = ImGui.Checkbox(translateLabel("Preview"), preview, true)
    ImGui.EndDisabled()
  else
    preview, _ = ImGui.Checkbox(translateLabel("Preview"), preview, true)
  end
  if preview then
    spawnCoords            = ENTITY.GET_ENTITY_COORDS(previewEntity, false)
    previewLoop            = true
    currentObjectPreview   = propHash
    local previewObjectPos = ENTITY.GET_ENTITY_COORDS(previewEntity, false)
    ImGui.Text(translateLabel("Move_FB")); ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine(); ImGui.Text(translateLabel("Move_UD"))
    ImGui.Dummy(10, 1); ImGui.SameLine()
    ImGui.ArrowButton("##f2", 2)
    if ImGui.IsItemActive() then
      forwardX = forwardX * 0.1
      forwardY = forwardY * 0.1
      ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x + forwardX, previewObjectPos.y + forwardY,
        previewObjectPos.z)
    end
    ImGui.SameLine()
    ImGui.ArrowButton("##f3", 3)
    if ImGui.IsItemActive() then
      forwardX = forwardX * 0.1
      forwardY = forwardY * 0.1
      ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x - forwardX, previewObjectPos.y - forwardY,
        previewObjectPos.z)
    end
    ImGui.SameLine()
    ImGui.Dummy(60, 1); ImGui.SameLine()
    ImGui.ArrowButton("##z2", 2)
    if ImGui.IsItemActive() then
      zOffset = zOffset + 0.01
      ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x, previewObjectPos.y, previewObjectPos.z + 0.01)
    end
    ImGui.SameLine()
    ImGui.ArrowButton("##z3", 3)
    if ImGui.IsItemActive() then
      zOffset = zOffset - 0.01
      ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x, previewObjectPos.y, previewObjectPos.z - 0.01)
    end
  else
    previewStarted = false
    previewLoop    = false
    zOffset        = 0.0
    forwardX       = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
    forwardY       = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
  end
  if NETWORK.NETWORK_IS_SESSION_ACTIVE() then
    if not preview then
      ImGui.SameLine()
    end
    if blacklisted_obj then
      ImGui.BeginDisabled()
      spawnForPlayer, _ = ImGui.Checkbox(translateLabel("Spawn For a Player"), spawnForPlayer, true)
      ImGui.EndDisabled()
    else
      spawnForPlayer, _ = ImGui.Checkbox(translateLabel("Spawn For a Player"), spawnForPlayer, true)
    end
  end
  if spawnForPlayer then
    ImGui.PushItemWidth(200)
    Game.displayPlayerList()
    ImGui.PopItemWidth()
    selectedPlayer = filteredPlayers[playerIndex + 1]
    coords         = ENTITY.GET_ENTITY_COORDS(selectedPlayer, false)
    heading        = ENTITY.GET_ENTITY_HEADING(selectedPlayer)
    forwardX       = ENTITY.GET_ENTITY_FORWARD_X(selectedPlayer)
    forwardY       = ENTITY.GET_ENTITY_FORWARD_Y(selectedPlayer)
    ImGui.SameLine()
  else
    coords   = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
    heading  = ENTITY.GET_ENTITY_HEADING(self.get_ped())
    forwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
    forwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
  end
  if blacklisted_obj then
    ImGui.BeginDisabled()
    ImGui.Button("   " .. translateLabel("Spawn") .. "  ")
    ImGui.EndDisabled()
  else
    if ImGui.Button("   " .. translateLabel("Spawn") .. "  ") then
      script.run_in_fiber(function()
        while not STREAMING.HAS_MODEL_LOADED(propHash) do
          STREAMING.REQUEST_MODEL(propHash)
          coroutine.yield()
        end
        if preview then
          spawnedObject = OBJECT.CREATE_OBJECT(propHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, false)
        else
          spawnedObject = OBJECT.CREATE_OBJECT(propHash, coords.x + (forwardX * 3), coords.y + (forwardY * 3), coords.z,
            true, true, false)
        end
        if ENTITY.DOES_ENTITY_EXIST(spawnedObject) then
          ENTITY.SET_ENTITY_HEADING(spawnedObject, heading)
          OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(spawnedObject)
          table.insert(spawned_props, spawnedObject)
          table.insert(spawnedNames, propName)
          local dupes = lua_Fn.getTableDupes(spawnedNames, propName)
          if dupes > 1 then
            newPropName = propName .. " #" .. tostring(dupes)
            table.insert(filteredSpawnNames, newPropName)
          else
            table.insert(filteredSpawnNames, propName)
          end
        end
      end)
    end
  end
  if showInvalidObjText then
    UI.coloredText(translateLabel("invalid_obj") .. invalidType, "#EED202", 1, 15)
  end
  if spawned_props[1] ~= nil then
    ImGui.Text(translateLabel("spawned_objects"))
    ImGui.PushItemWidth(230)
    spawned_index, used = ImGui.Combo("##Spawned Objects", spawned_index, filteredSpawnNames, #spawned_props)
    ImGui.PopItemWidth()
    selectedObject = spawned_props[spawned_index + 1]
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_delete") .. "##objects") then
      script.run_in_fiber(function(script)
        if ENTITY.DOES_ENTITY_EXIST(selectedObject) then
          ENTITY.SET_ENTITY_AS_MISSION_ENTITY(selectedObject)
          script:sleep(100)
          ENTITY.DELETE_ENTITY(selectedObject)
          table.remove(spawnedNames, spawned_index + 1)
          table.remove(filteredSpawnNames, spawned_index + 1)
          table.remove(spawned_props, spawned_index + 1)
          spawned_index = 0
          if spawned_index > 1 then
            spawned_index = spawned_index - 1
          end
          if selfAttachments[1] ~= nil or vehAttachments[1] ~= nil then
            attachPos      = { x = 0.0, y = 0.0, z = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 }
            attached       = false
            attachedToSelf = false
            attachedToVeh  = false
          end
        end
      end)
    end
    ImGui.Separator()
    attachToSelf, attachToSelfUsed = ImGui.Checkbox(translateLabel("Attach To Self"), attachToSelf, true)
    if attachToSelfUsed then
      UI.widgetSound("Nav2")
    end
    if current_vehicle ~= nil and current_vehicle ~= 0 then
      ImGui.SameLine(); attachToVeh, attachToVehUsed = ImGui.Checkbox(translateLabel("Attach To Vehicle"), attachToVeh, true)
      if attachToVehUsed then
        attachToSelf = false
        UI.widgetSound("Nav2")
      end
    else
      ImGui.BeginDisabled()
      ImGui.SameLine(); attachToVeh, attachToVehUsed = ImGui.Checkbox(translateLabel("Attach To Vehicle"), attachToVeh, true)
      ImGui.EndDisabled()
      UI.toolTip(false, translateLabel("getinveh"))
    end
    if attachToSelf then
      attachToVeh = false
      displaySelfBones()
      boneData = filteredSelfBones[selected_bone + 1]
      ImGui.SameLine()
      if ImGui.Button(" " .. translateLabel("attachBtn") .. " " .. "##self") then
        script.run_in_fiber(function()
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, self.get_ped(),
            PED.GET_PED_BONE_INDEX(self.get_ped(), boneData.ID), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false,
            2, true, 1)
          attached = true
          attachedObject = selectedObject
          attachedObjectName = propName
          if selfAttachments[1] ~= nil then
            for _, v in ipairs(selfAttachments) do
              if attachedObject ~= v then
                table.insert(selfAttachments, attachedObject)
                table.insert(selfAttachNames, attachedObjectName)
              end
            end
          else
            table.insert(selfAttachments, attachedObject)
            table.insert(selfAttachNames, attachedObjectName)
          end
          local attach_dupes = lua_Fn.getTableDupes(selfAttachNames, propName)
          if attach_dupes > 1 then
            attach_name = attachedObjectName .. " #" .. tostring(attach_dupes)
            table.insert(filteredAttachNames, attach_name)
          else
            table.insert(filteredAttachNames, propName)
          end
        end)
      end
      if selfAttachments[1] ~= nil then
        ImGui.Text(translateLabel("attached_objects"))
        ImGui.PushItemWidth(200)
        attached_index, used = ImGui.Combo("##Attached Objects", attached_index, filteredAttachNames, #selfAttachments)
        ImGui.PopItemWidth()
        selectedAttachment = selfAttachments[attached_index + 1]
        ImGui.SameLine()
        if ImGui.Button(translateLabel("detachBtn") .. "##self") then
          script.run_in_fiber(function()
            ENTITY.DETACH_ENTITY(selectedAttachment, true, true)
            attachPos = { x = 0.0, y = 0.0, z = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 }
          end)
        end
      end
    end
    if attachToVeh then
      attachToSelf = false
      displayVehBones()
      boneData = filteredVehBones[selected_bone + 1]
      ImGui.SameLine()
      if ImGui.Button(" " .. translateLabel("attachBtn") .. " " .. "##veh") then
        script.run_in_fiber(function()
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, current_vehicle,
            ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false,
            false,
            2, true, 1)
          attached = true
          attachedObject = selectedObject
          attachedObjectName = propName
          if vehAttachments[1] ~= nil then
            for _, v in ipairs(vehAttachments) do
              if attachedObject ~= v then
                table.insert(vehAttachments, attachedObject)
                table.insert(vehAttachNames, attachedObjectName)
              end
            end
          else
            table.insert(vehAttachments, attachedObject)
            table.insert(vehAttachNames, attachedObjectName)
          end
          local attach_dupes = lua_Fn.getTableDupes(vehAttachNames, propName)
          if attach_dupes > 1 then
            attach_name = attachedObjectName .. " #" .. tostring(attach_dupes)
            table.insert(filteredVehAttachNames, attach_name)
          else
            table.insert(filteredVehAttachNames, propName)
          end
        end)
      end
      if vehAttachments[1] ~= nil then
        ImGui.Text(translateLabel("attached_objects"))
        ImGui.PushItemWidth(200)
        attached_index, used = ImGui.Combo("##vehAttachedObjects", attached_index, filteredVehAttachNames,
          #vehAttachments)
        ImGui.PopItemWidth()
        selectedAttachment = vehAttachments[attached_index + 1]
        ImGui.SameLine()
        if ImGui.Button(translateLabel("detachBtn") .. "##veh") then
          script.run_in_fiber(function()
            ENTITY.DETACH_ENTITY(selectedAttachment, true, true)
            attachPos = { x = 0.0, y = 0.0, z = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 }
          end)
        end
      end
    end
    ImGui.Separator()
    edit_mode, used = ImGui.Checkbox(translateLabel("editMode"), edit_mode, true)
    UI.helpMarker(false, translateLabel("editMode_tt"))
    if edit_mode and not attached then
      ImGui.Text(translateLabel("xyz_multiplier"))
      ImGui.PushItemWidth(280)
      axisMult, _ = ImGui.InputInt("##multiplier", axisMult, 1, 2, 0)
      ImGui.Text(translateLabel("Move Object:"))
      ImGui.Text("                        X Axis :")
      spawnDistance.x, _ = ImGui.SliderFloat(" ", spawnDistance.x, -0.1 * axisMult, 0.1 * axisMult)
      activeX = ImGui.IsItemActive()
      ImGui.Separator()
      ImGui.Text("                        Y Axis :")
      spawnDistance.y, _ = ImGui.SliderFloat("  ", spawnDistance.y, -0.1 * axisMult, 0.1 * axisMult)
      activeY = ImGui.IsItemActive()
      ImGui.Separator()
      ImGui.Text("                        Z Axis :")
      spawnDistance.z, _ = ImGui.SliderFloat("   ", spawnDistance.z, -0.05 * axisMult, 0.05 * axisMult)
      activeZ = ImGui.IsItemActive()
      ImGui.Separator(); ImGui.Text(translateLabel("Rotate Object:"))
      ImGui.Text("                        X Axis :")
      spawnRot.x, _ = ImGui.SliderFloat("##xRot", spawnRot.x, -0.1 * axisMult, 0.1 * axisMult)
      rotX = ImGui.IsItemActive()
      ImGui.Separator()
      ImGui.Text("                        Y Axis :")
      spawnRot.y, _ = ImGui.SliderFloat("##yRot", spawnRot.y, -0.1 * axisMult, 0.1 * axisMult)
      rotY = ImGui.IsItemActive()
      ImGui.Separator()
      ImGui.Text("                        Z Axis :")
      spawnRot.z, _ = ImGui.SliderFloat("##zRot", spawnRot.z, -0.5 * axisMult, 0.5 * axisMult)
      rotZ = ImGui.IsItemActive()
      ImGui.PopItemWidth()
    else
      if edit_mode and selfAttachments[1] ~= nil or edit_mode and vehAttachments[1] ~= nil then
        ImGui.Text(translateLabel("Move Object:") .. "##attached"); ImGui.Separator(); ImGui.Spacing()
        if attachToSelf then
          target     = self.get_ped()
          attachBone = PED.GET_PED_BONE_INDEX(self.get_ped(), boneData.ID)
        elseif attachToVeh then
          target     = current_vehicle
          attachBone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData)
        end
        ImGui.Text(translateLabel("xyz_multiplier"))
        ImGui.PushItemWidth(271)
        axisMult, _ = ImGui.InputInt("##AttachMultiplier", axisMult, 1, 2, 0)
        ImGui.PopItemWidth()
        ImGui.Spacing()
        ImGui.Text("X Axis :"); ImGui.SameLine(); ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Y Axis :"); ImGui
            .SameLine()
        ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Z Axis :")
        ImGui.ArrowButton("##Xleft", 0)
        if ImGui.IsItemActive() then
          attachPos.x = attachPos.x + 0.001
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##XRight", 1)
        if ImGui.IsItemActive() then
          attachPos.x = attachPos.x - 0.001 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.Dummy(5, 1); ImGui.SameLine()
        ImGui.ArrowButton("##Yleft", 0)
        if ImGui.IsItemActive() then
          attachPos.y = attachPos.y + 0.001 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##YRight", 1)
        if ImGui.IsItemActive() then
          attachPos.y = attachPos.y - 0.001 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.Dummy(5, 1); ImGui.SameLine()
        ImGui.ArrowButton("##zUp", 2)
        if ImGui.IsItemActive() then
          attachPos.z = attachPos.z + 0.001 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##zDown", 3)
        if ImGui.IsItemActive() then
          attachPos.z = attachPos.z - 0.001 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.Text("X Rotation :"); ImGui.SameLine(); ImGui.Text("Y Rotation :"); ImGui.SameLine(); ImGui.Text(
          "Z Rotation :")
        ImGui.ArrowButton("##rotXleft", 0)
        if ImGui.IsItemActive() then
          attachPos.rotX = attachPos.rotX + 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##rotXright", 1)
        if ImGui.IsItemActive() then
          attachPos.rotX = attachPos.rotX - 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.Dummy(5, 1); ImGui.SameLine()
        ImGui.ArrowButton("##rotYleft", 0)
        if ImGui.IsItemActive() then
          attachPos.rotY = attachPos.rotY + 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##rotYright", 1)
        if ImGui.IsItemActive() then
          attachPos.rotY = attachPos.rotY - 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.Dummy(5, 1); ImGui.SameLine()
        ImGui.ArrowButton("##rotZup", 2)
        if ImGui.IsItemActive() then
          attachPos.rotZ = attachPos.rotZ + 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
        ImGui.SameLine()
        ImGui.ArrowButton("##rotZdown", 3)
        if ImGui.IsItemActive() then
          attachPos.rotZ = attachPos.rotZ - 1 * axisMult
          ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, attachPos.x,
            attachPos.y, attachPos.z, attachPos.rotX, attachPos.rotY, attachPos.rotZ, false, false, false, false, 2, true,
            1)
        end
      end
    end
    if ImGui.Button("   " .. translateLabel("generic_reset") .. "   ") then
      resetSliders()
      if attached then
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject, target, attachBone, 0.0, 0.0, 0.0,
          0.0, 0.0, 0.0, false, false, false, false, 2, true, 1)
      else
        ENTITY.SET_ENTITY_COORDS(selectedObject, coords.x + (forwardX * 3), coords.y + (forwardY * 3), coords.z)
        ENTITY.SET_ENTITY_HEADING(selectedObject, heading)
        OBJECT.PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(selectedObject)
      end
    end
    UI.helpMarker(false, translateLabel("resetSlider_tt"))
  end
end)
--[[
    *settings*
]]
local settings_tab = Samurais_scripts:add_tab(translateLabel("settingsTab"))
lang_idx           = lua_cfg.read("lang_idx")
disableTooltips    = lua_cfg.read("disableTooltips")
disableUiSounds    = lua_cfg.read("disableUiSounds")
useGameLang        = lua_cfg.read("useGameLang")
local selected_lang
local lang_T       = {
  { name = 'English',               iso = 'en-US' },
  { name = 'Français',              iso = 'fr-FR' },
  { name = 'Deutsch',               iso = 'de-DE' },
  { name = 'Italiano',              iso = 'it-IT' },
  -- { name = 'Chinese (Traditional)', iso = 'zh-TW' },
  -- { name = 'Chinese (Simplified)',  iso = 'zh-CH' },
  -- { name = 'Español',               iso = 'es-ES' },
  { name = 'Português (Brasil)',    iso = 'pt-BR' },
}

function displayLangs()
  filteredLangs = {}
  for _, lang in ipairs(lang_T) do
    table.insert(filteredLangs, lang.name)
  end
  lang_idx, lang_idxUsed = ImGui.Combo("##langs", lang_idx, filteredLangs, #lang_T)
end

settings_tab:add_imgui(function()
  disableTooltips, dtUsed = ImGui.Checkbox(translateLabel("Disable Tooltips"), disableTooltips, true)
  if dtUsed then
    lua_cfg.save("disableTooltips", disableTooltips)
    UI.widgetSound("Nav2")
  end

  disableUiSounds, duisndUsed = ImGui.Checkbox(translateLabel("DisableSound"), disableUiSounds, true)
  UI.toolTip(false, translateLabel("DisableSound_tt"))
  if duisndUsed then
    lua_cfg.save("disableUiSounds", disableUiSounds)
    UI.widgetSound("Nav2")
  end

  ImGui.Text(translateLabel("langTitle") .. " " .. current_lang)
  useGameLang, uglUsed = ImGui.Checkbox(translateLabel("gameLangCB"), useGameLang, true)
  UI.toolTip(false, translateLabel("gameLang_tt"))
  if useGameLang then
    LANG, current_lang = Game.GetLang()
  end
  if uglUsed then
    UI.widgetSound("Nav2")
    gui.show_success("Samurai's Scripts", translateLabel("lang_success_msg"))
    lua_cfg.save("useGameLang", useGameLang)
    lua_cfg.save("LANG", LANG)
    lua_cfg.save("lang_idx", 0)
  end

  if not useGameLang then
    ImGui.Text(translateLabel("customLangTxt"))
    ImGui.PushItemWidth(180)
    displayLangs()
    ImGui.PopItemWidth()
    selected_lang = lang_T[lang_idx + 1]
    ImGui.SameLine()
    if ImGui.Button(translateLabel("saveBtn") .. "##lang") then
      UI.widgetSound("Select")
      LANG         = selected_lang.iso
      current_lang = selected_lang.name
      lua_cfg.save("lang_idx", lang_idx)
      lua_cfg.save("LANG", LANG)
      lua_cfg.save("current_lang", current_lang)
      gui.show_success("Samurai's Scripts", translateLabel("lang_success_msg"))
    end
  end

  ImGui.Dummy(10, 1)
  if UI.coloredButton(translateLabel("reset_settings_Btn"), "#FF0000", "#EE4B2B", "#880808", 1) then
    UI.widgetSound("Focus_In")
    ImGui.OpenPopup("Confirm")
  end
  ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
  ImGui.SetNextWindowBgAlpha(0.6)
  if ImGui.BeginPopupModal("Confirm", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
    UI.coloredText(translateLabel("confirm_txt"), "yellow", 1, 20)
    if ImGui.Button("  " .. translateLabel("yes") .. "  ") then
      UI.widgetSound("Select2")
      lua_cfg.reset(default_config)
      Regen             = false
      objectiveTP       = false
      disableTooltips   = false
      phoneAnim         = false
      sprintInside      = false
      lockpick          = false
      replaceSneakAnim  = false
      disableSound      = false
      disableActionMode = false
      Triggerbot        = false
      aimEnemy          = false
      disableUiSounds   = false
      driftMode         = false
      DriftTires        = false
      speedBoost        = false
      nosvfx            = false
      hornLight         = false
      nosPurge          = false
      insta180          = false
      flappyDoors       = false
      rgbLights         = false
      loud_radio        = false
      launchCtrl        = false
      popsNbangs        = false
      limitVehOptions   = false
      louderPops        = false
      autobrklight      = false
      holdF             = false
      noJacking         = false
      useGameLang       = false
      DriftIntensity    = 0
      lang_idx          = 0
      lightSpeed        = 1
      LANG              = "en-US"
      current_lang      = "English"
      ImGui.CloseCurrentPopup()
    end
    ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
    if ImGui.Button("  " .. translateLabel("no") .. "  ") then
      UI.widgetSound("Cancel")
      ImGui.CloseCurrentPopup()
    end
    ImGui.EndPopup()
  end
end)


local function SS_handle_events()
  if attached_ped ~= nil and attached_ped ~= 0 then
    ENTITY.DETACH_ENTITY(attached_ped, true, true)
    ENTITY.FREEZE_ENTITY_POSITION(attached_ped, false)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
  end

  if attached_vehicle ~= nil and attached_vehicle ~= 0 then
    local modelHash         = ENTITY.GET_ENTITY_MODEL(attached_vehicle)
    local attachedVehicle   = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(PED.GET_VEHICLE_PED_IS_USING(self.get_ped()),
      modelHash)
    local attachedVehcoords = ENTITY.GET_ENTITY_COORDS(attached_vehicle, false)
    local playerForwardX    = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
    local playerForwardY    = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
    controlled              = entities.take_control_of(attachedVehicle, 300)
    if ENTITY.DOES_ENTITY_EXIST(attachedVehicle) then
      if controlled then
        ENTITY.DETACH_ENTITY(attachedVehicle, true, true)
        ENTITY.SET_ENTITY_COORDS(attachedVehicle, attachedVehcoords.x - (playerForwardX * 10),
          attachedVehcoords.y - (playerForwardY * 10), playerPosition.z, false, false, false, false)
        VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(attached_vehicle, 5.0)
        attached_vehicle = 0
      end
    end
  end

  if spawned_props[1] ~= nil then
    for _, p in ipairs(spawned_props) do
      if ENTITY.DOES_ENTITY_EXIST(p) then
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(p)
        ENTITY.DELETE_ENTITY(p)
      end
    end
  end

  if selfAttachments[1] ~= nil then
    for _, v in ipairs(selfAttachments) do
      ENTITY.DETACH_ENTITY(v, true, true)
    end
  end

  if vehAttachments[1] ~= nil then
    for _, v in ipairs(vehAttachments) do
      ENTITY.DETACH_ENTITY(v, true, true)
    end
  end
end

--[[
    looped scripts
]]

-- Game Input
script.register_looped("GameInput", function()
  if is_typing then
    PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
  end

  if HashGrabber then
    PAD.DISABLE_CONTROL_ACTION(0, 24, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 257, 1)
  end

  if replaceSneakAnim then
    PAD.DISABLE_CONTROL_ACTION(0, 36, 1)
  end

  if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
    if validModel then
      if nosPurge or is_in_flatbed then
        PAD.DISABLE_CONTROL_ACTION(0, 73, true)
      end
    end
    if speedBoost and PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, tdBtn) then
      if validModel or is_boat or is_bike then
        -- prevent face planting when using NOS mid-air
        PAD.DISABLE_CONTROL_ACTION(0, 60, true)
        PAD.DISABLE_CONTROL_ACTION(0, 61, true)
        PAD.DISABLE_CONTROL_ACTION(0, 62, true)
      end
    end
    if holdF then
      if Game.Self.isDriving() and not is_typing then
        PAD.DISABLE_CONTROL_ACTION(0, 75, true)
      else
        timerB = 0
      end
    end
  end

  if pedGrabber and Game.Self.isOnFoot() then
    PAD.DISABLE_CONTROL_ACTION(0, 24, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 25, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 50, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 68, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 91, 1)
    PAD.DISABLE_CONTROL_ACTION(0, 257, 1)
  end
end)

-- self stuff
script.register_looped("auto-heal", function(ah)
  ah:yield()
  if Regen and Game.Self.isAlive() then
    local maxHp  = Game.Self.maxHealth()
    local myHp   = Game.Self.health()
    local myArmr = Game.Self.armour()
    if PLAYER.GET_PLAYER_MAX_ARMOUR(self.get_id()) < 100 then
      PLAYER.SET_PLAYER_MAX_ARMOUR(self.get_id(), 100)
    end
    if myHp < maxHp and myHp > 0 then
      if PED.IS_PED_IN_COVER(self.get_ped()) then
        ENTITY.SET_ENTITY_HEALTH(self.get_ped(), myHp + 10, 0, 0)
      else
        ENTITY.SET_ENTITY_HEALTH(self.get_ped(), myHp + 1, 0, 0)
      end
    end
    if myArmr == nil then
      PED.SET_PED_ARMOUR(self.get_ped(), 10)
    end
    if myArmr ~= nil and myArmr < 100 then
      PED.ADD_ARMOUR_TO_PED(self.get_ped(), 0.5)
    end
  end
end)

script.register_looped("objectiveTP", function()
  if objectiveTP then
    if PAD.IS_CONTROL_JUST_PRESSED(0, 57) then
      for _, n in pairs(objectives_T) do
        local blip = HUD.GET_CLOSEST_BLIP_INFO_ID(n)
        if HUD.DOES_BLIP_EXIST(blip) then
          blipCoords = HUD.GET_BLIP_COORDS(blip)
          break
        end
      end
      if blipCoords ~= nil then
        Game.Self.teleport(true, blipCoords)
      else
        gui.show_warning("Objective Teleport", "No objective found!")
      end
    end
  end
end)
script.register_looped("self features", function(script)
  -- Crouch instead of sneak
  if Game.Self.isOnFoot() and not Game.Self.isInWater() then
    if replaceSneakAnim then
      if not isCrouched and PAD.IS_DISABLED_CONTROL_PRESSED(0, 36) then
        script:sleep(200)
        while not STREAMING.HAS_CLIP_SET_LOADED("move_ped_crouched") and not STREAMING.HAS_CLIP_SET_LOADED("move_aim_strafe_crouch_2h") do
          STREAMING.REQUEST_CLIP_SET("move_ped_crouched")
          STREAMING.REQUEST_CLIP_SET("move_aim_strafe_crouch_2h")
          coroutine.yield()
        end
        PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_ped_crouched", 0.3)
        PED.SET_PED_STRAFE_CLIPSET(self.get_ped(), "move_aim_strafe_crouch_2h")
        script:sleep(500)
        isCrouched = true
      end
    end
    if isCrouched and PAD.IS_DISABLED_CONTROL_PRESSED(0, 36) then
      script:sleep(200)
      PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0.3)
      script:sleep(500)
      isCrouched = false
    end
  end

  -- Online Phone Animations
  if NETWORK.NETWORK_IS_SESSION_ACTIVE() then
    if phoneAnim and not ENTITY.IS_ENTITY_DEAD(self.get_ped()) then
      if not is_playing_anim and not is_playing_scenario and PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET(self.get_ped()) == 0 then
        if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 242, 1) then
          PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, false)
        end
        if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 243, 1) then
          PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, false)
        end
        if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 244, 1) then
          PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, false)
        end
        if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 243, 1) and AUDIO.IS_MOBILE_PHONE_CALL_ONGOING() then
          if not STREAMING.HAS_ANIM_DICT_LOADED("anim@scripted@freemode@ig19_mobile_phone@male@") then
            STREAMING.REQUEST_ANIM_DICT("anim@scripted@freemode@ig19_mobile_phone@male@")
            return
          end
          TASK.TASK_PLAY_PHONE_GESTURE_ANIMATION(self.get_ped(), "anim@scripted@freemode@ig19_mobile_phone@male@", "base",
            "BONEMASK_HEAD_NECK_AND_R_ARM", 0.25, 0.25, true, false)
          repeat
            script:sleep(10)
          until
            AUDIO.IS_MOBILE_PHONE_CALL_ONGOING() == false
          TASK.TASK_STOP_PHONE_GESTURE_ANIMATION(self.get_ped(), 0.25)
        end
      else
        PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, true)
        PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, true)
        PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, true)
      end
    else
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, true)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, true)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 242, 1) and PED.GET_PED_CONFIG_FLAG(self.get_ped(), 243, 1) and PED.GET_PED_CONFIG_FLAG(self.get_ped(), 244, 1) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 242, false)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 243, false)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 244, false)
    end
  end

  -- Sprint Inside
  if sprintInside then
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 427, 1) == false then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 427, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 427, 1) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 427, false)
    end
  end

  -- Lockpick animation
  if lockPick then
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 426, 1) == false then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 426, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 426, 1) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 426, false)
    end
  end
end)

-- Action Mode
script.register_looped("action mode", function(amode)
  if disableActionMode then
    if PED.IS_PED_USING_ACTION_MODE(self.get_ped()) then
      PLAYER.SET_DISABLE_AMBIENT_MELEE_MOVE(self.get_id(), true)
      PED.SET_PED_USING_ACTION_MODE(self.get_ped(), false, -1, 0)
    else
      amode:sleep(500)
    end
    amode:yield()
  end
end)

-- Hash Grabber
script.register_looped("HashGrabber", function(hg)
  if HashGrabber then
    if PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) and PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 24) then
      local ent  = Game.getAimedEntity()
      local hash = Game.getEntityModel(ent)
      local type = Game.getEntityTypeString(ent)
      log.info("Entity N°: " .. tostring(ent) .. " Entity Hash: " .. tostring(hash) .. " Entity Type: " .. tostring(type))
    end
  end
  hg:yield()
end)

-- Triggerbot loop
script.register_looped("TriggerBot", function(trgrbot)
  if Triggerbot then
    if PLAYER.IS_PLAYER_FREE_AIMING(PLAYER.PLAYER_ID()) then
      aimBool, Entity = PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(PLAYER.PLAYER_ID(), Entity)
      if aimBool then
        if ENTITY.IS_ENTITY_A_PED(Entity) and PED.IS_PED_HUMAN(Entity) then
          local bonePos = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(Entity, "head"))
          weapon = Game.Self.weapon()
          if WEAPON.IS_PED_WEAPON_READY_TO_SHOOT(self.get_ped()) and Game.Self.isOnFoot() and not PED.IS_PED_RELOADING(self.get_ped()) then
            if not ENTITY.IS_ENTITY_DEAD(Entity) then
              if PAD.IS_CONTROL_PRESSED(0, 21) then
                if aimEnemy then
                  if PED.IS_PED_IN_COMBAT(Entity, self.get_ped()) then
                    TASK.TASK_AIM_GUN_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, true, false)
                    TASK.TASK_SHOOT_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, 2556319013)
                  end
                else
                  TASK.TASK_AIM_GUN_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, true, false)
                  TASK.TASK_SHOOT_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, 2556319013)
                end
              end
            end
          end
        end
      else
        Entity = 0
      end
    else
      bool = false
    end
  end
  trgrbot:yield()
end)

script.register_looped("auto-kill-enemies", function(ak)
  if autoKill then
    local myCoords = self.get_pos()
    local gta_peds = entities.get_all_peds_as_handles()
    if (PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET_WITHIN_RADIUS(self.get_ped(), myCoords.x, myCoords.y, myCoords.z, 100)) > 0 then
      for _, p in pairs(gta_peds) do
        if PED.IS_PED_HUMAN(p) and PED.IS_PED_IN_COMBAT(p, self.get_ped()) and not PED.IS_PED_A_PLAYER(p) then
          if PED.CAN_PED_IN_COMBAT_SEE_TARGET(p, self.get_ped()) then
            PED.APPLY_DAMAGE_TO_PED(p, 100000, 1, 0); PED.EXPLODE_PED_HEAD(p, 0x7FD62962)
          else
            ak:sleep(969) -- prevent kill spamming. It's fine, I just don't like it.
            PED.APPLY_DAMAGE_TO_PED(p, 100000, 1, 0); PED.EXPLODE_PED_HEAD(p, 0x7FD62962)
          end
          ak:yield()
        end
      end
    end
  end
  ak:yield()
end)

-- vehicle stuff
script.register_looped("TDFT", function(script)
  script:yield()
  if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
    lastVeh, _, current_vehicle, _ = onVehEnter()
    is_car                         = VEHICLE.IS_THIS_MODEL_A_CAR(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_quad                        = VEHICLE.IS_THIS_MODEL_A_QUADBIKE(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_bike                        = (VEHICLE.IS_THIS_MODEL_A_BIKE(ENTITY.GET_ENTITY_MODEL(current_vehicle)) and VEHICLE.GET_VEHICLE_CLASS(current_vehicle) ~= 13)
    is_boat                        = VEHICLE.IS_THIS_MODEL_A_BOAT(ENTITY.GET_ENTITY_MODEL(current_vehicle)) or
        VEHICLE.IS_THIS_MODEL_A_JETSKI(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    if is_car or is_quad then
      validModel = true
    else
      validModel = false
    end
    if validModel and DriftTires and PAD.IS_CONTROL_PRESSED(0, tdBtn) then
      if not VEHICLE.GET_DRIFT_TYRES_SET(current_vehicle) then
        VEHICLE.SET_DRIFT_TYRES(current_vehicle, true)
      end
      VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 100.0)
    else
      VEHICLE.SET_DRIFT_TYRES(current_vehicle, false)
      VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
    end
    script:yield()
    if validModel and driftMode and PAD.IS_CONTROL_PRESSED(0, tdBtn) and not DriftTires then
      VEHICLE.SET_VEHICLE_REDUCE_GRIP(current_vehicle, true)
      VEHICLE.SET_VEHICLE_REDUCE_GRIP_LEVEL(current_vehicle, DriftIntensity)
      VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 100.0)
    else
      VEHICLE.SET_VEHICLE_REDUCE_GRIP(current_vehicle, false)
      VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
    end
    if speedBoost then
      if validModel or is_boat or is_bike then
        if VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
          if PAD.IS_DISABLED_CONTROL_PRESSED(0, tdBtn) and PAD.IS_CONTROL_PRESSED(0, 71) then
            VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 5.0)
            VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, 100.0)
            AUDIO.SET_VEHICLE_BOOST_ACTIVE(current_vehicle, true)
            using_nos = true
          end
        else
          if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
            if PAD.IS_DISABLED_CONTROL_PRESSED(0, tdBtn) and PAD.IS_CONTROL_PRESSED(0, 71) then
              if VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) < 300 then
                failSound = AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "Engine_fail", current_vehicle,
                  "DLC_PILOT_ENGINE_FAILURE_SOUNDS", true, 0)
                repeat
                  script:sleep(50)
                until
                  AUDIO.HAS_SOUND_FINISHED(failSound) and PAD.IS_CONTROL_PRESSED(0, tdBtn) == false and PAD.IS_CONTROL_PRESSED(0, 71) == false
                AUDIO.STOP_SOUND(failSound)
              end
            end
          end
        end
      end
      if using_nos and PAD.IS_DISABLED_CONTROL_RELEASED(0, tdBtn) then
        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, -1)
        AUDIO.SET_VEHICLE_BOOST_ACTIVE(current_vehicle, false)
        using_nos = false
      end
    end
    if hornLight and Game.Self.isDriving() then
      if not VEHICLE.GET_BOTH_VEHICLE_HEADLIGHTS_DAMAGED(current_vehicle) then
        if PAD.IS_CONTROL_PRESSED(0, 86) then
          VEHICLE.SET_VEHICLE_LIGHTS(current_vehicle, 2)
          VEHICLE.SET_VEHICLE_FULLBEAM(current_vehicle, true)
          repeat
            script:sleep(50)
          until
            PAD.IS_CONTROL_PRESSED(0, 86) == false
          VEHICLE.SET_VEHICLE_FULLBEAM(current_vehicle, false)
          VEHICLE.SET_VEHICLE_LIGHTS(current_vehicle, 0)
        end
      else
        if PAD.IS_CONTROL_JUST_RELEASED(0, 86) then
          gui.show_warning("Tokyo Drift", "Your headlights are broken!")
        end
      end
    end
    if holdF then
      if PAD.IS_DISABLED_CONTROL_PRESSED(0, 75) then
        timerB = timerB + 1
        if timerB >= 15 then
          PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, false)
          TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 0)
          timerB = 0
        end
      end
      if timerB >= 1 and timerB <= 10 then
        if PAD.IS_DISABLED_CONTROL_RELEASED(0, 75) then
          PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, true)
          TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 0)
          timerB = 0
        end
      end
    else
      if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 241, 1) then
        PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, false)
      end
    end
  else
    current_vehicle = 0
    if started_lct then
      started_lct = false
    end
    if started_popSound then
      started_popSound = false
    end
    if started_popSound2 then
      started_popSound2 = false
    end
  end
end)

script.register_looped("tire smoke", function(smkptfx)
  if driftMode or DriftTires then
    if is_car and PAD.IS_CONTROL_PRESSED(0, tdBtn) and VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle) > 0 and ENTITY.GET_ENTITY_SPEED(current_vehicle) > 6 then
      local dict = "scr_ba_bb"
      local wheels = { "wheel_lr", "wheel_rr" }
      if VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(current_vehicle) and not VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
        if Game.requestNamedPtfxAsset(dict) then
          for _, boneName in ipairs(wheels) do
            local r_wheels = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneName)
            GRAPHICS.USE_PARTICLE_FX_ASSET(dict)
            smokePtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("scr_ba_bb_plane_smoke_trail",
              current_vehicle,
              -0.4, 0.0, 0.0, 0.0, 0.0, 0.0, r_wheels, 0.3, false, false, false, 0, 0, 0)
            GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(smokePtfx, driftSmoke.r, driftSmoke.g, driftSmoke.b, 0)
            table.insert(smokePtfx_t, smokePtfx)
            GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke)
            tire_smoke = true
          end
          if tire_smoke then
            repeat
              smkptfx:sleep(50)
            until
              PAD.IS_CONTROL_RELEASED(0, tdBtn) or PAD.IS_CONTROL_RELEASED(0, 71)
            for _, smoke in ipairs(smokePtfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(smoke) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke)
                GRAPHICS.REMOVE_PARTICLE_FX(smoke)
              end
            end
            tire_smoke = false
          end
        end
      end
    end
  end
end)

script.register_looped("LCTRL", function(lct)
  if launchCtrl and Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        lct:yield()
        return
      end
    end
    local notif_sound, notif_ref
    if NETWORK.NETWORK_IS_SESSION_ACTIVE() then
      notif_sound, notif_ref = "SELL", "GTAO_EXEC_SECUROSERV_COMPUTER_SOUNDS"
    else
      notif_sound, notif_ref = "MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"
    end
    if validModel or is_bike or is_quad then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) > 300 then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) then
          started_lct = true
          ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, true)
          timerA = timerA + 1
          if timerA >= 150 then
            gui.show_success("TokyoDrift", "Launch Control Activated!")
            AUDIO.PLAY_SOUND_FRONTEND(-1, notif_sound, notif_ref, true)
            repeat
              lct:sleep(100)
            until PAD.IS_CONTROL_RELEASED(0, 72)
            launch_active = true
          end
        elseif started_lct and timerA > 0 and timerA < 150 then
          if PAD.IS_CONTROL_RELEASED(0, 71) or PAD.IS_CONTROL_RELEASED(0, 72) then
            timerA = 0
            ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, false)
            started_lct = false
          end
        end
      end
      if launch_active then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_RELEASED(0, 72) then
          PHYSICS.SET_IN_ARENA_MODE(true)
          VEHICLE.SET_VEHICLE_MAX_LAUNCH_ENGINE_REVS_(current_vehicle, -1)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 10)
          VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, 100.0)
          ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, false)
          VEHICLE.SET_VEHICLE_FORWARD_SPEED(current_vehicle, 9.3)
          lct:sleep(4269)
          VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, -1)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
          VEHICLE.SET_VEHICLE_MAX_LAUNCH_ENGINE_REVS_(current_vehicle, 1.0)
          PHYSICS.SET_IN_ARENA_MODE(false)
          launch_active = false
          timerA = 0
        end
      end
    end
  end
  lct:yield()
end)

script.register_looped("MISC Vehicle Options", function(mvo)
  if Game.Self.isDriving() then
    if autobrklight then
      if VEHICLE.IS_VEHICLE_DRIVEABLE(current_vehicle) and VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
        VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(current_vehicle, true)
      end
    end

    if insta180 then
      local vehRot = ENTITY.GET_ENTITY_ROTATION(current_vehicle, 2)
      if PAD.IS_CONTROL_JUST_PRESSED(0, 97) then -- numpad + // mouse scroll down
        ENTITY.SET_ENTITY_ROTATION(current_vehicle, vehRot.x, vehRot.y, (vehRot.z - 180), 2, true)
        if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
          VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(current_vehicle, 5.0)
        end
      end
    end
  end
  if flappyDoors and is_car then
    local lastveh = onVehEnter()
    local n_doors = VEHICLE.GET_NUMBER_OF_VEHICLE_DOORS(lastveh)
    if n_doors > 0 then
      for i = -1, n_doors + 1 do
        if VEHICLE.GET_IS_DOOR_VALID(lastveh, i) then
          mvo:sleep(180)
          VEHICLE.SET_VEHICLE_DOOR_OPEN(lastveh, i, false, false)
          mvo:sleep(180)
          VEHICLE.SET_VEHICLE_DOOR_SHUT(lastveh, i, false)
        end
      end
    end
  end
end)

script.register_looped("NOS ptfx", function(spbptfx)
  if speedBoost and Game.Self.isDriving() then
    if validModel or is_boat or is_bike then
      if PAD.IS_DISABLED_CONTROL_PRESSED(0, tdBtn) and PAD.IS_CONTROL_PRESSED(0, 71) then
        if VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
          local effect  = "veh_xs_vehicle_mods"
          local counter = 0
          while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(effect) do
            STREAMING.REQUEST_NAMED_PTFX_ASSET(effect)
            spbptfx:yield()
            if counter > 100 then
              return
            else
              counter = counter + 1
            end
          end
          local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
          for i = 0, exhaustCount do
            local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
            if retBool then
              GRAPHICS.USE_PARTICLE_FX_ASSET(effect)
              nosPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_nitrous", current_vehicle, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, 1.0, false, false, false, 0, 0, 0)
              table.insert(nosptfx_t, nosPtfx)
              if nosvfx then
                GRAPHICS.ANIMPOSTFX_PLAY("DragRaceNitrous", 0, false)
              end
              nos_started = true
            end
          end
          if nos_started then
            repeat
              spbptfx:sleep(50)
            until
              PAD.IS_DISABLED_CONTROL_RELEASED(0, tdBtn) or PAD.IS_CONTROL_RELEASED(0, 71)
            if nosvfx then
              GRAPHICS.ANIMPOSTFX_PLAY("DragRaceNitrousOut", 0, false)
            end
            if GRAPHICS.ANIMPOSTFX_IS_RUNNING("DragRaceNitrous") then
              GRAPHICS.ANIMPOSTFX_STOP("DragRaceNitrous")
            end
            if GRAPHICS.ANIMPOSTFX_IS_RUNNING("DragRaceNitrousOut") then
              GRAPHICS.ANIMPOSTFX_STOP("DragRaceNitrousOut")
            end
            for _, nos in ipairs(nosptfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(nos) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(nos)
                GRAPHICS.REMOVE_PARTICLE_FX(nos)
                nos_started = false
              end
            end
          end
        end
      end
    end
  end
end)

script.register_looped("2-step", function(twostep)
  if launchCtrl and Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        twostep:yield()
        return
      end
    end
    if validModel or is_bike or is_quad then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) >= 300 then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) then
          local asset   = "core"
          local counter = 0
          while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
            STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
            twostep:yield()
            if counter > 100 then
              return
            else
              counter = counter + 1
            end
          end
          local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
          for i = 0, exhaustCount do
            local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
            if retBool then
              GRAPHICS.USE_PARTICLE_FX_ASSET(asset)
              lctPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_backfire", current_vehicle, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, 0.69420, false, false, false, 0, 0, 0)
              table.insert(lctPtfx_t, lctPtfx)
              twostep_started = true
            end
          end
          if twostep_started then
            repeat
              twostep:sleep(50)
            until PAD.IS_CONTROL_RELEASED(0, 72) or launch_active == false
            for _, bfire in ipairs(lctPtfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(bfire) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(bfire)
                GRAPHICS.REMOVE_PARTICLE_FX(bfire)
              end
            end
            twostep_started = false
          end
        end
      end
    end
  end
end)

script.register_looped("LCTRL SFX", function(tstp)
  if Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        tstp:yield()
        return
      end
    end

    if launchCtrl then
      if lctPtfx_t[1] ~= nil then
        local popSound
        if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) then
          for _, p in ipairs(lctPtfx_t) do
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(p) then
              local randStime = math.random(60, 120)
              popSound = AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "BOOT_POP", current_vehicle, "DLC_VW_BODY_DISPOSAL_SOUNDS",
                true, 0)
              AUDIO.SET_AUDIO_SPECIAL_EFFECT_MODE(1)
              table.insert(popSounds_t, popSound)
              tstp:sleep(randStime)
              started_popSound = true
            end
          end
        end
        if started_popSound then
          if PAD.IS_CONTROL_RELEASED(0, 71) or PAD.IS_CONTROL_RELEASED(0, 72) then
            for _, s in ipairs(popSounds_t) do
              AUDIO.STOP_SOUND(s)
            end
          end
        end
      end
    end

    if popsNbangs then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
        rpmThreshold = 0.45
      else
        rpmThreshold = 0.69
      end
      if not louderPops then
        popsnd, sndRef = "BOOT_POP", "DLC_VW_BODY_DISPOSAL_SOUNDS"
        flame_size = 0.42069
      else
        popsnd, sndRef = "SNIPER_FIRE", "DLC_BIKER_RESUPPLY_MEET_CONTACT_SOUNDS"
        flame_size = 1.5
      end
      local currRPM  = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
      local currGear = VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle)
      if PAD.IS_CONTROL_RELEASED(0, 71) and currRPM < 1.0 and currRPM > rpmThreshold and currGear ~= 0 then
        local popSound2
        local randStime = math.random(60, 200)
        popSound2 = AUDIO.PLAY_SOUND_FROM_ENTITY(-1, popsnd, current_vehicle, sndRef, true, 0)
        table.insert(popSounds_t, popSound2)
        tstp:sleep(randStime)
        started_popSound2 = true
      end
      if started_popSound2 then
        currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
        if PAD.IS_CONTROL_PRESSED(0, 71) or currRPM < rpmThreshold then
          for _, s in ipairs(popSounds_t) do
            AUDIO.STOP_SOUND(s)
          end
        end
      end
    end
  else
    tstp:yield()
  end
end)

script.register_looped("pops&bangs", function(pnb)
  if Game.Self.isDriving() and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
    if is_car or is_bike or is_quad then
      if popsNbangs then
        if limitVehOptions then
          if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
            pnb:yield()
            return
          end
        end
        AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(current_vehicle, false)
        local counter  = 0
        local asset    = "core"
        local currRPM  = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
        local currGear = VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle)
        if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
          rpmThreshold = 0.45
        else
          rpmThreshold = 0.69
        end
        while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
          STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
          pnb:yield()
          if counter > 100 then
            return
          else
            counter = counter + 1
          end
        end
        if PAD.IS_CONTROL_RELEASED(0, 71) and currRPM < 1.0 and currRPM > rpmThreshold and currGear ~= 0 then
          local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
          for i = 0, exhaustCount do
            local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
            if retBool then
              currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
              if currRPM < 1.0 and currRPM > 0.55 then
                GRAPHICS.USE_PARTICLE_FX_ASSET(asset)
                popsPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_backfire", current_vehicle,
                  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, flame_size, false, false, false, 0, 0, 0)
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(popsPtfx)
                table.insert(popsPtfx_t, popsPtfx)
                started_popSound2 = true
              end
            end
          end
        end
        if started_popSound2 then
          currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
          if PAD.IS_CONTROL_PRESSED(0, 71) or currRPM < rpmThreshold then
            for _, bfire in ipairs(popsPtfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(bfire) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(bfire)
                GRAPHICS.REMOVE_PARTICLE_FX(bfire)
              end
            end
            for _, s in ipairs(popSounds_t) do
              AUDIO.STOP_SOUND(s)
            end
          end
        end
      else
        AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(current_vehicle, true)
      end
    end
  else
    pnb:yield()
  end
end)

script.register_looped("Purge", function(nosprg)
  if Game.Self.isDriving() then
    if nosPurge and validModel or nosPurge and is_bike then
      if PAD.IS_DISABLED_CONTROL_PRESSED(0, 73) and not is_in_flatbed then
        local dict       = "core"
        local purgeBones = { "suspension_lf", "suspension_rf" }
        if not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(dict) then
          STREAMING.REQUEST_NAMED_PTFX_ASSET(dict)
          coroutine.yield()
        end
        for _, boneName in ipairs(purgeBones) do
          local purge_exit = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneName)
          if boneName == "suspension_lf" then
            purge_rotZ = -180.0
            purge_posX = -0.3
          else
            purge_rotZ = 0.0
            purge_posX = 0.3
          end
          GRAPHICS.USE_PARTICLE_FX_ASSET(dict)
          purgePtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("weap_extinguisher", current_vehicle,
            purge_posX, -0.33, 0.2, 0.0, -17.5, purge_rotZ, purge_exit, 0.4, false, false, false, 0, 0, 0)
          table.insert(purgePtfx_t, purgePtfx)
          purge_started = true
        end
        if purge_started then
          repeat
            nosprg:sleep(50)
          until
            PAD.IS_DISABLED_CONTROL_RELEASED(0, 73)
          for _, purge in ipairs(purgePtfx_t) do
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(purge) then
              GRAPHICS.STOP_PARTICLE_FX_LOOPED(purge)
              GRAPHICS.REMOVE_PARTICLE_FX(purge)
              purge_started = false
            end
          end
        end
      end
    end
  else
    nosprg:yield()
  end
end)

script.register_looped("rgbLights", function(rgb)
  if rgbLights then
    for i = 0, 14 do
      if rgbLights and not VEHICLE.GET_BOTH_VEHICLE_HEADLIGHTS_DAMAGED(current_vehicle) then
        if not has_xenon then
          VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 22, true)
        end
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.9)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.8)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.7)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.6)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.5)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.4)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.3)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.2)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.1)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.2)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.3)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.4)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.5)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.6)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.7)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.8)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.9)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        rgb:sleep(100 / lightSpeed)
      else
        if has_xenon then
          VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
          VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, defaultXenon)
          break
        else
          VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
          VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 22, false)
          break
        end
      end
    end
  else
    rgb:yield()
  end
end)

script.register_looped("no jacking", function(ctt)
  if noJacking then
    if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 398, 1) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 398, true)
    end
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 177, 1) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 177, true)
    end
  end
  ctt:yield()
end)

-- World
script.register_looped("Ped Grabber", function(pg)
  if pedGrabber then
    if Game.Self.isOnFoot() then
      local nearestPed = Game.getClosestPed(self.get_ped(), 10)
      if not ped_grabbed and nearestPed ~= 0 then
        if PED.IS_PED_ON_FOOT(nearestPed) and not PED.IS_PED_A_PLAYER(nearestPed) then
          if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 257) then
            ped_grabbed, attached_ped = attachPed(nearestPed)
            pg:sleep(200)
            if attached_ped ~= 0 then
              playHandsUp()
              ENTITY.FREEZE_ENTITY_POSITION(attached_ped, true)
              ped_grabbed = true
            end
          end
        end
      end
      if ped_grabbed and attached_ped ~= 0 then
        PED.FORCE_PED_MOTION_STATE(attached_ped, 0x0EC17E58, 0, 0, 0)
        if PED.IS_PED_RAGDOLL(self.get_ped()) then
          repeat
            pg:sleep(100)
          until PED.IS_PED_RAGDOLL(self.get_ped()) == false
          playHandsUp()
        end
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, 25) then
          if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_PRESSED(0, 257) then
            local myFwdX = Game.getForwardX(self.get_ped())
            local myFwdY = Game.getForwardY(self.get_ped())
            ENTITY.FREEZE_ENTITY_POSITION(attached_ped, false)
            ENTITY.DETACH_ENTITY(attached_ped, true, true)
            TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
            PED.SET_PED_TO_RAGDOLL(attached_ped, 1500, 0, 0, false)
            ENTITY.SET_ENTITY_VELOCITY(attached_ped, (pedthrowF * myFwdX), (pedthrowF * myFwdY), 0)
            TASK.CLEAR_PED_TASKS(self.get_ped())
            pg:sleep(200)
            attached_ped = 0
            ped_grabbed  = false
          end
        end
      end
    end
  end
  pg:yield()
end)

script.register_looped("Carpool", function(cp)
  if carpool then
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
      stop_searching = true
    else
      stop_searching = false
    end
    if not stop_searching then
      nearestVeh = Game.getClosestVehicle(self.get_ped(), 10)
    end
    local trying_to_enter = PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(self.get_ped())
    if trying_to_enter ~= 0 and trying_to_enter == nearestVeh then
      driverPed = VEHICLE.GET_PED_IN_VEHICLE_SEAT(trying_to_enter, -1, true)
      if driverPed ~= nil and driverPed ~= self.get_ped() and not PED.IS_PED_A_PLAYER(driverPed) then
        thisVeh = trying_to_enter
        PED.SET_PED_CONFIG_FLAG(driverPed, 251, true)
        PED.SET_PED_CONFIG_FLAG(driverPed, 255, true)
        PED.SET_PED_CONFIG_FLAG(driverPed, 398, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driverPed, true)
      end
    end
    if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
      local ped_to_reset = VEHICLE.GET_PED_IN_VEHICLE_SEAT(thisVeh, -1, true)
      if ped_to_reset ~= nil and ped_to_reset ~= self.get_ped() and not PED.IS_PED_A_PLAYER(ped_to_reset) then
        show_npc_veh_ctrls = true
        stop_searching     = true
        repeat
          cp:sleep(100)
        until PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) == false
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 251, false)
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 255, false)
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 398, false)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped_to_reset, false)
        show_npc_veh_ctrls = false
        stop_searching     = false
      else
        show_npc_veh_ctrls = false
      end
    end
  end
  cp:yield()
end)

-- object spawner
script.register_looped("Preview", function(preview)
  if previewLoop and gui.is_open() then
    local currentHeading = ENTITY.GET_ENTITY_HEADING(previewEntity)
    if currentObjectPreview ~= previewEntity then
      ENTITY.DELETE_ENTITY(previewEntity)
      previewStarted = false
    end
    if isChanged then
      ENTITY.DELETE_ENTITY(previewEntity)
      previewStarted = false
    end
    if not ENTITY.IS_ENTITY_DEAD(self.get_ped()) then
      while not STREAMING.HAS_MODEL_LOADED(propHash) do
        STREAMING.REQUEST_MODEL(propHash)
        coroutine.yield()
      end
      if not previewStarted then
        previewEntity = OBJECT.CREATE_OBJECT(propHash, coords.x + forwardX * 5, coords.y + forwardY * 5, coords.z,
          currentHeading, false, false, false)
        ENTITY.SET_ENTITY_ALPHA(previewEntity, 200.0, false)
        ENTITY.SET_ENTITY_COLLISION(previewEntity, false, false)
        ENTITY.SET_ENTITY_CAN_BE_DAMAGED(previewEntity, false)
        ENTITY.SET_ENTITY_PROOFS(previewEntity, true, true, true, true, true, true, true, true)
        ENTITY.SET_CAN_CLIMB_ON_ENTITY(previewEntity, false)
        OBJECT.SET_OBJECT_ALLOW_LOW_LOD_BUOYANCY(previewEntity, false)
        currentObjectPreview = ENTITY.GET_ENTITY_MODEL(previewEntity)
        previewStarted = true
      end
      if PED.IS_PED_STOPPED(self.get_ped()) then
        while true do
          preview:yield()
          if gui.is_open() then
            currentHeading = currentHeading + 1
            ENTITY.SET_ENTITY_HEADING(previewEntity, currentHeading)
            preview:sleep(10)
            if currentObjectPreview ~= ENTITY.GET_ENTITY_MODEL(previewEntity) then
              ENTITY.DELETE_ENTITY(previewEntity)
              previewStarted = false
            end
            if not PED.IS_PED_STOPPED(self.get_ped()) or not previewStarted then
              previewStarted = false
              break
            end
          else
            ENTITY.DELETE_ENTITY(previewEntity)
            previewStarted = false
          end
        end
      else
        return
      end
    end
  else
    ENTITY.DELETE_ENTITY(previewEntity)
    stopPreview()
  end
end)
script.register_looped("edit mode", function()
  if spawned_props[1] ~= nil then
    if edit_mode and selfAttachments[1] == nil and vehAttachments[1] == nil then
      local current_coords   = ENTITY.GET_ENTITY_COORDS(selectedObject)
      local current_rotation = ENTITY.GET_ENTITY_ROTATION(selectedObject, 2)
      if activeX then
        ENTITY.SET_ENTITY_COORDS(selectedObject, current_coords.x + spawnDistance.x, current_coords.y, current_coords.z)
      end
      if activeY then
        ENTITY.SET_ENTITY_COORDS(selectedObject, current_coords.x, current_coords.y + spawnDistance.y, current_coords.z)
      end
      if activeZ then
        ENTITY.SET_ENTITY_COORDS(selectedObject, current_coords.x, current_coords.y, current_coords.z + spawnDistance.z)
      end
      if rotX then
        ENTITY.SET_ENTITY_ROTATION(selectedObject, current_rotation.x + spawnRot.x, current_rotation.y,
          current_rotation.z, 2, true)
      end
      if rotY then
        ENTITY.SET_ENTITY_ROTATION(selectedObject, current_rotation.x, current_rotation.y + spawnRot.y,
          current_rotation.z, 2, true)
      end
      if rotZ then
        ENTITY.SET_ENTITY_ROTATION(selectedObject, current_rotation.x, current_rotation.y,
          current_rotation.z + spawnRot.z, 2, true)
      end
    end
    for k, v in ipairs(spawned_props) do
      if not ENTITY.DOES_ENTITY_EXIST(v) then
        table.remove(spawned_props, k)
      end
    end
  end
  if selfAttachments[1] ~= nil then
    for index, entity in ipairs(selfAttachments) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(entity, self.get_ped()) then
        table.remove(selfAttachments, index)
      end
    end
  end
  if vehAttachments[1] ~= nil then
    for index, entity in ipairs(vehAttachments) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(entity, lastVeh) then
        table.remove(vehAttachments, index)
      end
    end
  end
end)

script.register_looped("flatbed script", function(script)
  local vehicleHandles  = entities.get_all_vehicles_as_handles()
  local current_vehicle = PED.GET_VEHICLE_PED_IS_USING(self.get_ped())
  local vehicle_model   = ENTITY.GET_ENTITY_MODEL(current_vehicle)
  local flatbedHeading  = ENTITY.GET_ENTITY_HEADING(current_vehicle)
  local flatbedBone     = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, "chassis")
  local playerPosition  = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
  local playerForwardX  = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
  local playerForwardY  = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
  for _, veh in ipairs(vehicleHandles) do
    local detectPos = vec3:new(playerPosition.x - (playerForwardX * 10), playerPosition.y - (playerForwardY * 10),
      playerPosition.z)
    local vehPos = ENTITY.GET_ENTITY_COORDS(veh, false)
    local vDist = SYSTEM.VDIST(detectPos.x, detectPos.y, detectPos.z, vehPos.x, vehPos.y, vehPos.z)
    if vDist <= 5 then
      closestVehicle = veh
    end
  end
  local closestVehicleModel = ENTITY.GET_ENTITY_MODEL(closestVehicle)
  local iscar = VEHICLE.IS_THIS_MODEL_A_CAR(closestVehicleModel)
  local isbike = VEHICLE.IS_THIS_MODEL_A_BIKE(closestVehicleModel)
  local towable = false
  if modelOverride then
    towable = true
  else
    towable = false
  end
  if iscar then
    towable = true
  end
  if isbike then
    towable = true
  end
  if closestVehicleModel == 745926877 then --Buzzard
    towable = true
  end
  if closestVehicleModel == 1353720154 then
    towable = false
  end
  if vehicle_model == 1353720154 then
    is_in_flatbed = true
  else
    is_in_flatbed = false
  end
  if is_in_flatbed and attached_vehicle == 0 then
    if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 73) and towable and closestVehicleModel ~= flatbedModel then
      script:sleep(200)
      controlled = entities.take_control_of(closestVehicle, 350)
      if controlled then
        local vehicleClass = VEHICLE.GET_VEHICLE_CLASS(closestVehicle)
        if vehicleClass == 1 then
          zAxis = 0.9
          yAxis = -2.3
        elseif vehicleClass == 2 then
          zAxis = 0.993
          yAxis = -2.17046
        elseif vehicleClass == 6 then
          zAxis = 1.00069420
          yAxis = -2.17046
        elseif vehicleClass == 7 then
          zAxis = 1.009
          yAxis = -2.17036
        elseif vehicleClass == 15 then
          zAxis = 1.3
          yAxis = -2.21069
        elseif vehicleClass == 16 then
          zAxis = 1.5
          yAxis = -2.21069
        else
          zAxis = 1.1
          yAxis = -2.0
        end
        ENTITY.SET_ENTITY_HEADING(closestVehicleModel, flatbedHeading)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(closestVehicle, current_vehicle, flatbedBone, 0.0, yAxis, zAxis, 0.0, 0.0, 0.0,
          false, true, true, false, 1, true, 1)
        attached_vehicle = closestVehicle
        script:sleep(200)
      else
        gui.show_error("Flatbed Script", translateLabel("failed_veh_ctrl"))
      end
    end
    if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 73) and closestVehicle ~= nil and not towable then
      gui.show_message("Flatbed Script", translateLabel("fltbd_carsOnlyTxt"))
      script:sleep(400)
    end
    if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 73) and closestVehicleModel == flatbedModel then
      script:sleep(400)
      gui.show_message("Flatbed Script", translateLabel("fltbd_nootherfltbdTxt"))
    end
  elseif is_in_flatbed and attached_vehicle ~= 0 then
    if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 73) then
      script:sleep(200)
      for _, v in ipairs(vehicleHandles) do
        local modelHash         = ENTITY.GET_ENTITY_MODEL(v)
        local attachedVehicle   = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(current_vehicle, modelHash)
        local attachedVehcoords = ENTITY.GET_ENTITY_COORDS(attached_vehicle, false)
        controlled              = entities.take_control_of(attachedVehicle, 350)
        if ENTITY.DOES_ENTITY_EXIST(attachedVehicle) then
          if controlled then
            ENTITY.DETACH_ENTITY(attachedVehicle)
            ENTITY.SET_ENTITY_COORDS(attachedVehicle, attachedVehcoords.x - (playerForwardX * 10),
              attachedVehcoords.y - (playerForwardY * 10), playerPosition.z, 0, 0, 0, 0)
            VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(attached_vehicle, 5.0)
            attached_vehicle = 0
          end
        end
      end
    end
  end
end)
script.register_looped("TowPos Marker", function()
  if towPos then
    if is_in_flatbed and attached_vehicle == 0 then
      local playerPosition = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
      local playerForwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      local playerForwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
      local detectPos      = vec3:new(playerPosition.x - (playerForwardX * 10), playerPosition.y - (playerForwardY * 10),
        playerPosition.z)
      GRAPHICS.DRAW_MARKER_SPHERE(detectPos.x, detectPos.y, detectPos.z, 2.5, 180, 128, 0, 0.115)
    end
  end
end)

-- online players
script.register_looped("Online Player Info", function(opi)
  if Game.isOnline() and gui.is_open() and players_tab:is_selected() then
    playerCount       = Game.getPlayerCount()
    selectedPlayer    = filteredPlayers[playerIndex + 1]
    targetPlayerPed   = selectedPlayer
    targetPlayerIndex = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(targetPlayerPed)
    player_name       = PLAYER.GET_PLAYER_NAME(targetPlayerIndex)
    if NETWORK.NETWORK_IS_PLAYER_ACTIVE(targetPlayerIndex) then
      player_active = true
      playerWallet  = Game.getPlayerWallet(targetPlayerIndex)
      playerBank    = Game.getPlayerBank(targetPlayerIndex)
      playerCoords  = Game.getCoords(targetPlayerPed, false)
      playerHeading = math.floor(Game.getHeading(targetPlayerPed))
      playerHealth  = ENTITY.GET_ENTITY_HEALTH(targetPlayerPed)
      playerArmour  = PED.GET_PED_ARMOUR(targetPlayerPed)
      godmode       = PLAYER.GET_PLAYER_INVINCIBLE(targetPlayerIndex)
      if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targetPlayerPed) then
        player_in_veh = true
        playerVeh = PED.GET_VEHICLE_PED_IS_IN(targetPlayerPed, true)
      else
        player_in_veh = false
      end
    else
      player_active = false
    end
  end
end)


--[[
   *event handlers*
]]
event.register_handler(menu_event.MenuUnloaded, function()
  SS_handle_events()
end)

event.register_handler(menu_event.ScriptsReloaded, function()
  SS_handle_events()
end)
