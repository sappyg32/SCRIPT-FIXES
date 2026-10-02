Config = {}

Config.Locale = 'fr'

Config.serverLogo = ''

-- Name shown in the top left box
Config.serverName = 'Sappy City RP'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {
	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	keys = {
		distance 	= 'G',
	}
}

Config.vehicle = {
	speedUnit = 'KMH',
	maxSpeed = 240,
	keys = {
		seatbelt 	= 'X',
		cruiser		= 'UP',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

-- How often the cash (ox_inventory) and bank (wx_banking) counters refresh, in ms
Config.money = {
	refreshRate = 1000,
}

-- The HUD stays hidden until the player spawns in (esx_multicharacter fires
-- esx:onPlayerSpawn / esx:playerLoaded when Play is pressed).
-- Fallback delay in ms in case those events never arrive -- set to 0 to disable.
Config.HudLoadTimeout = 30000

Config.ui = {
	showServerLogo		= false,
	showJob	 			= true,
	showVoice	 		= false,
	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,
	showMinimap			= true,
	showWeapons			= true,

	showMoney			= true,
	showServerName		= true,
	moneyThousandSeparator = ',',

	-- Date / location / society elements inherited from the original HUD.
	-- They were never defined in the upstream config, so these features were
	-- silently disabled. Set to true to turn them on.
	showDate			= false,
	showLocation		= false,
	showSocietyMoney	= false,
	showBankMoney		= false,
	showBlackMoney		= false,
	showWalletMoney		= false,

	-- Shifts the health / armor / thirst / hunger square from its default
	-- position: positive X moves it right, positive Y moves it up.
	statusOffsetX		= 80,
	statusOffsetY		= 50,

	-- Cash is an ox_inventory ITEM, not a money event. GetItemCount sums this
	-- item across every slot. Change the name if your cash item differs.
	cashItem			= 'money',

	-- Bank balance source. 'esx' reads ESX Legacy's own bank account
	-- (ESX.PlayerData.accounts), which is what this HUD is built against.
	bankSource			= 'esx',
}
