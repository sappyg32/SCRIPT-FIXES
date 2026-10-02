ESX = exports["es_extended"]:getSharedObject()

local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')

local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};

--[[
	Load gate

	The HUD stays hidden from resource start until the player actually spawns in.
	esx_multicharacter fires esx:onPlayerSpawn / esx:playerLoaded from inside its
	esx:playerLoaded spawn callback -- the moment the Play button flow finishes and
	control is handed back to the player. Until then nothing shows.
]]

local hudReady = false

local function setHudVisible(visible)
	SendNUIMessage({ action = 'toggleUi', value = visible })

	if not visible then
		if Config.ui.showMinimap == false then DisplayRadar(false) end
		DisplayHud(false)
	end
end

local function markHudReady()
	if hudReady then return end
	hudReady = true

	Wait(500) -- let the spawn fade finish so the HUD doesn't pop in mid-black
	setHudVisible(true)
end

Citizen.CreateThread(function()
	Wait(0)
	setHudVisible(false)

	-- Safety net: if no multicharacter is installed the spawn events never arrive,
	-- so don't leave the player staring at a blank screen forever.
	if Config.HudLoadTimeout and Config.HudLoadTimeout > 0 then
		Wait(Config.HudLoadTimeout)

		if not hudReady then
			hudReady = true
			setHudVisible(true)
		end
	end
end)

RegisterNetEvent('esx:onPlayerSpawn', function() markHudReady() end)
RegisterNetEvent('esx:playerLoaded', function() markHudReady() end)
AddEventHandler('esx:playerLoaded', function() markHudReady() end)

-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()
    local isPauseMenu = false

	while true do
		Citizen.Wait(0)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu

				-- Don't un-hide during character selection
				if hudReady then
					SendNUIMessage({ action = 'toggleUi', value = true })
				end
			end

			HideHudComponentThisFrame(1)
			HideHudComponentThisFrame(2)
			HideHudComponentThisFrame(3)
			HideHudComponentThisFrame(4)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(8)
			HideHudComponentThisFrame(9)
			HideHudComponentThisFrame(13)
			HideHudComponentThisFrame(17)
			HideHudComponentThisFrame(20)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Config.ui.showDate == true then
			SendNUIMessage({ action = 'setText', id = 'date', value = trewDate() })
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local player = GetPlayerPed(-1)
		local position = GetEntityCoords(player)

		if Config.ui.showLocation == true then
			local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
			local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))

			local locationMessage = nil

			if zoneNameFull then
				locationMessage = streetName .. ', ' .. zoneNameFull
			else
				locationMessage = streetName
			end

			locationMessage = string.format(
				Locales[Config.Locale]['you_are_on_location'],
				locationMessage
			)

			SendNUIMessage({ action = 'setText', id = 'location', value = locationMessage })
		end
	end
end)

local vehicleCruiser
local vehicleSignalIndicator = 'off'
local seatbeltEjectSpeed = 45.0
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local position = GetEntityCoords(player)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
		local vehicleInfo

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then
			local vehicleClass = GetVehicleClass(vehicle)

			if Config.ui.showMinimap == false then
				DisplayRadar(true)
			end

			local vehicleSpeedSource = GetEntitySpeed(vehicle)
			local vehicleSpeed
			if Config.vehicle.speedUnit == 'MPH' then
				vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237)
			else
				vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
			end

			local vehicleNailSpeed

			if vehicleSpeed > Config.vehicle.maxSpeed then
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
			else
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
			end

			local vehicleFuel
			vehicleFuel = GetVehicleFuelLevel(vehicle)

			local vehicleGear = GetVehicleCurrentGear(vehicle)

			if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
				vehicleGear = 'N'
			elseif vehicleSpeed > 0 and vehicleGear == 0 then
				vehicleGear = 'R'
			end

			local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
			local vehicleIsLightsOn
			if vehicleLights == 1 and vehicleHighlights == 0 then
				vehicleIsLightsOn = 'normal'
			elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
				vehicleIsLightsOn = 'high'
			else
				vehicleIsLightsOn = 'off'
			end

			local vehicleSiren

			if IsVehicleSirenOn(vehicle) then
				vehicleSiren = true
			else
				vehicleSiren = false
			end

			if has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8 then
				local prevSpeed = currSpeed
                currSpeed = vehicleSpeedSource

                SetPedConfigFlag(PlayerPedId(), 32, true)

                if not seatbeltIsOn then
                	local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then

                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else
                        prevVelocity = GetEntityVelocity(vehicle)
                    end

                else
                	DisableControlAction(0, 75)
                end
			end

			vehicleInfo = {
				action = 'updateVehicle',

				status = true,
				speed = vehicleSpeed,
				nail = vehicleNailSpeed,
				gear = vehicleGear,
				fuel = vehicleFuel,
				lights = vehicleIsLightsOn,
				signals = vehicleSignalIndicator,
				cruiser = vehicleCruiser,
				type = vehicleClass,
				siren = vehicleSiren,
				seatbelt = {},

				config = {
					speedUnit = Config.vehicle.speedUnit,
					maxSpeed = Config.vehicle.maxSpeed
				}
			}
			vehicleInfo['seatbelt']['status'] = seatbeltIsOn
		else
			vehicleCruiser = false
			vehicleNailSpeed = 0
			vehicleSignalIndicator = 'off'

            seatbeltIsOn = false

			vehicleInfo = {
				action = 'updateVehicle',

				status = false,
				nail = vehicleNailSpeed,
				seatbelt = { status = seatbeltIsOn },
				cruiser = vehicleCruiser,
				signals = vehicleSignalIndicator,
				type = 0,
			}

			if Config.ui.showMinimap == false then
				DisplayRadar(false)
			end
		end

		SendNUIMessage(vehicleInfo)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local playerStatus 
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if Config.ui.showHealth == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['isdead'] = false

			playerStatus['status'][showPlayerStatus] = {
				name = 'health',
				value = GetEntityHealth(GetPlayerPed(-1)) - 100
			}

			if IsEntityDead(GetPlayerPed(-1)) then
				playerStatus.isdead = true
			end
		end

		if Config.ui.showArmor == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'armor',
				value = GetPedArmour(GetPlayerPed(-1)),
			}
		end

		if Config.ui.showStamina == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'stamina',
				value = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
			}
		end

		TriggerServerEvent('dt_hud:getServerInfo')

		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end

	end
end)

RegisterNetEvent('dt_hud:setInfo')
AddEventHandler('dt_hud:setInfo', function(info)
	SendNUIMessage({ action = 'setText', id = 'job', value = info['job'] })
	SendNUIMessage({ action = 'setText', id = 'name', value = info['name'] })
	SendNUIMessage({ action = 'setText', id = 'age', value = info['age'] })

	if ESX.PlayerData.job ~= nil then
		if ESX.PlayerData.job.grade_name ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
			if (Config.ui.showSocietyMoney == true) then
				SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
			end
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
			end, ESX.PlayerData.job.name)
		else
			SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		end
	end

	local playerStatus 
	local showPlayerStatus = 0
	playerStatus = { action = 'setStatus', status = {} }


	if Config.ui.showHunger == true then
		showPlayerStatus = (showPlayerStatus+1)

		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			playerStatus['status'][showPlayerStatus] = {
				name = 'hunger',
				-- esx_status already returns a 0-100 percentage where 100 = full
				value = math.floor(status.getPercent())
			}
		end)

	end

	if Config.ui.showThirst == true then
		showPlayerStatus = (showPlayerStatus+1)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			playerStatus['status'][showPlayerStatus] = {
				name = 'thirst',
				-- esx_status already returns a 0-100 percentage where 100 = full
				value = math.floor(status.getPercent())
			}
		end)
	end

	if showPlayerStatus > 0 then
		SendNUIMessage(playerStatus)
	end
end)

-- esx_status broadcasts esx_status:onTick every tick with the current values, so
-- the hunger/thirst bars update the instant they change instead of waiting on the
-- dt_hud:getServerInfo round trip. The payload carries `percent` already
-- (val / Config.StatusMax * 100), matching what status.getPercent() returns.
AddEventHandler('esx_status:onTick', function(data)
	if Config.ui.showHunger ~= true and Config.ui.showThirst ~= true then return end

	local playerStatus = { action = 'setStatus', isdead = false, status = {} }
	local count = 0

	for k, v in pairs(data) do
		if v.name == 'hunger' or v.name == 'thirst' then
			if (v.name == 'hunger' and Config.ui.showHunger == true)
				or (v.name == 'thirst' and Config.ui.showThirst == true) then
				count = count + 1
				playerStatus['status'][count] = {
					name = v.name,
					value = math.floor(v.percent or 0)
				}
			end
		end
	end

	if count > 0 then SendNUIMessage(playerStatus) end
end)

Citizen.CreateThread(function()
	if Config.ui.showVoice == true then
	    RequestAnimDict('facials@gen_male@variations@normal')
	    RequestAnimDict('mp_facial')

	    while true do
	        Citizen.Wait(300)
	        local playerID = PlayerId()

	        for _,player in ipairs(GetActivePlayers()) do
	            local boolTalking = NetworkIsPlayerTalking(player)

	            if player ~= playerID then
	                if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
	            end
	        end
	    end

	end
end)

Citizen.CreateThread(function()
	if Config.ui.showVoice == true then
		local isTalking = false
		local voiceDistance = nil

		while true do
			Citizen.Wait(1)

			if NetworkIsPlayerTalking(PlayerId()) and not isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			end

			if IsControlJustPressed(1, Keys[Config.voice.keys.distance]) then

				Config.voice.levels.current = (Config.voice.levels.current + 1) % 3

				if Config.voice.levels.current == 0 then
					NetworkSetTalkerProximity(Config.voice.levels.default)
					voiceDistance = 'normal'
				elseif Config.voice.levels.current == 1 then
					NetworkSetTalkerProximity(Config.voice.levels.shout)
					voiceDistance = 'shout'
				elseif Config.voice.levels.current == 2 then
					NetworkSetTalkerProximity(Config.voice.levels.whisper)
					voiceDistance = 'whisper'
				end

				SendNUIMessage({ action = 'setVoiceDistance', value = voiceDistance })
			end

			if Config.voice.levels.current == 0 then
				voiceDistance = 'normal'
			elseif Config.voice.levels.current == 1 then
				voiceDistance = 'shout'
			elseif Config.voice.levels.current == 2 then
				voiceDistance = 'whisper'
			end
		end
	end
end)

Citizen.CreateThread(function()
	if Config.ui.showWeapons == true then
		while true do
			Citizen.Wait(100)

			local player = GetPlayerPed(-1)
			local status = {}

			if IsPedArmed(player, 7) then

				local weapon = GetSelectedPedWeapon(player)
				local ammoTotal = GetAmmoInPedWeapon(player,weapon)
				local bool,ammoClip = GetAmmoInClip(player,weapon)
				local ammoRemaining = math.floor(ammoTotal - ammoClip)
				
				status['armed'] = true

				for key,value in pairs(AllWeapons) do

					for keyTwo,valueTwo in pairs(AllWeapons[key]) do
						if weapon == GetHashKey('weapon_'..keyTwo) then
							status['weapon'] = keyTwo

							if key == 'melee' then
								SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
							else
								if keyTwo == 'stungun' then
									SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
								else
									SendNUIMessage({ action = 'element', task = 'enable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'enable', value = 'bullets' })
								end
							end
						end
					end
				end

				SendNUIMessage({ action = 'setText', id = 'weapon_clip', value = ammoClip })
				SendNUIMessage({ action = 'setText', id = 'weapon_ammo', value = ammoRemaining })
			else
				status['armed'] = false	
			end

			SendNUIMessage({ action = 'updateWeapon', status = status })
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
			if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and (has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8) then
				seatbeltIsOn = not seatbeltIsOn
			end
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.cruiser]) and GetPedInVehicleSeat(vehicle, -1) == player and (has_value(vehiclesCars, vehicleClass) == true) then
			
			local vehicleSpeedSource = GetEntitySpeed(vehicle)

			if vehicleCruiser == 'on' then
				vehicleCruiser = 'off'
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
				
			else
				vehicleCruiser = 'on'
				SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
			end
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalLeft]) and (has_value(vehiclesCars, vehicleClass) == true) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'left'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('dt_hud:setCarSignalLights', vehicleSignalIndicator)
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalRight]) and (has_value(vehiclesCars, vehicleClass) == true) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'right'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('dt_hud:setCarSignalLights', vehicleSignalIndicator)
		end

		if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalBoth]) and (has_value(vehiclesCars, vehicleClass) == true) then
			if vehicleSignalIndicator == 'off' then
				vehicleSignalIndicator = 'both'
			else
				vehicleSignalIndicator = 'off'
			end

			TriggerEvent('dt_hud:setCarSignalLights', vehicleSignalIndicator)
		end
	end
end)

AddEventHandler('onClientMapStart', function()
	SendNUIMessage({ action = 'ui', config = Config.ui })
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
	SendNUIMessage({ action = 'setLogo', value = Config.serverLogo })
	
	if Config.ui.showVoice == true then
		if Config.voice.levels.current == 0 then
			NetworkSetTalkerProximity(Config.voice.levels.default)
		elseif Config.voice.levels.current == 1 then
			NetworkSetTalkerProximity(Config.voice.levels.shout)
		elseif Config.voice.levels.current == 2 then
			NetworkSetTalkerProximity(Config.voice.levels.whisper)
		end
	end
end)

AddEventHandler('playerSpawned', function()
	if Config.ui.showVoice == true then
	    NetworkSetTalkerProximity(5.0)
	end

	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(13)
end)

--[[
	Cash / Bank counters

	Cash  -> money held in ox_inventory (inventory item 'money', falling back to
	         the ox_inventory:getPlayerInventoryMoney server export).
	Bank  -> account balance from wx_banking
	         (falling back to ESX.PlayerData.accounts 'bank').

	Everything runs through pcall + resource state checks so a missing or renamed
	resource can never break the HUD, it simply shows 000.
]]

local lastSentMoney = nil

local function resourceStarted(resourceName)
	return GetResourceState(resourceName) == 'started'
end

-- Cash is an ITEM in ox_inventory, not an event stream. ox_inventory exports
-- GetItemCount(name), which sums that item's count across every slot:
--   exports('GetItemCount', Inventory.GetItemCount) --> item.count
local function getCash()
	if not resourceStarted('ox_inventory') then return 0 end

	local ok, count = pcall(function()
		return exports.ox_inventory:GetItemCount(Config.ui.cashItem or 'money')
	end)

	if ok and count ~= nil then
		return tonumber(count) or 0
	end

	return 0
end

-- Bank balance. esx_multicharacter's beginSelection() does `ESX.PlayerData = {}`
-- and its esx:playerLoaded handler never assigns the player data back, so the
-- client copy of ESX.PlayerData.accounts stays empty even though every other
-- resource (and ESX's own display) reads it fine from the server object.
-- So read the balance from the server instead of this stale local copy.
local bankBalance = 0

RegisterNetEvent('dt_hud:setBank')
AddEventHandler('dt_hud:setBank', function(bank)
	bankBalance = tonumber(bank) or 0
end)

local function getBank()
	return bankBalance
end

local function sendMoney(force)
	if Config.ui.showMoney ~= true then return end

	local cash = getCash()
	local bank = getBank()

	-- Only push to the UI when something actually changed
	if not force and lastSentMoney and lastSentMoney.cash == cash and lastSentMoney.bank == bank then return end

	lastSentMoney = { cash = cash, bank = bank }

	SendNUIMessage({
		action = 'setMoney',
		wallet = cash,
		bank = bank,
		separator = Config.ui.moneyThousandSeparator
	})
end

Citizen.CreateThread(function()
	Citizen.Wait(1500)
	TriggerServerEvent('dt_hud:getBank')
	sendMoney(true)

	while true do
		Citizen.Wait(Config.money.refreshRate or 1000)
		TriggerServerEvent('dt_hud:getBank')
		sendMoney(false)
	end
end)

-- Refresh instantly when money or an inventory changes.
local function requestInstantRefresh()
	CreateThread(function()
		sendMoney(true)
	end)
end

AddEventHandler('esx:setAccountMoney', function() requestInstantRefresh() end)
AddEventHandler('esx:playerLoaded', function() requestInstantRefresh() end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function() requestInstantRefresh() end)

AddEventHandler('ox_inventory:updateInventory', function() requestInstantRefresh() end)

function trewDate()
	local timeString = nil

	local day = _U('day_' .. GetClockDayOfMonth())
	local weekDay = _U('weekDay_' .. GetClockDayOfWeek())
	local month = _U('month_' .. GetClockMonth())
	local day = _U('day_' .. GetClockDayOfMonth())
	local year = GetClockYear()


	local hour = GetClockHours()
	local minutes = GetClockMinutes()
	local time = nil
	local AmPm = ''


	if Config.date.AmPm == true then

		if hour >= 13 and hour <= 24 then
			hour = hour - 12
			AmPm = 'PM'
		else
			if hour == 0 or hour == 24 then
				hour = 12
			end
			AmPm = 'AM'
		end

	end

	if hour <= 9 then
		hour = '0' .. hour
	end
	if minutes <= 9 then
		minutes = '0' .. minutes
	end

	time = hour .. ':' .. minutes .. ' ' .. AmPm




	local date_format = Locales[Config.Locale]['date_format'][Config.date.format]

	if Config.date.format == 'default' then
		timeString = string.format(
			date_format,
			day, month, year
		)
	elseif Config.date.format == 'simple' then
		timeString = string.format(
			date_format,
			day, month
		)

	elseif Config.date.format == 'simpleWithHours' then
		timeString = string.format(
			date_format,
			time, day, month
		)	
	elseif Config.date.format == 'withWeekday' then
		timeString = string.format(
			date_format,
			weekDay, day, month, year
		)
	elseif Config.date.format == 'withHours' then
		timeString = string.format(
			date_format,
			time, day, month, year
		)
	elseif Config.date.format == 'withWeekdayAndHours' then
		timeString = string.format(
			date_format,
			time, weekDay, day, month, year
		)
	end

	return timeString
end

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local toggleui = false
RegisterCommand('toggleui', function()
	if not toggleui then
		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'bank' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'blackMoney' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'wallet' })
	else
		if (Config.ui.showJob == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
		end
		if (Config.ui.showSocietyMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
		end
		if (Config.ui.showBankMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'bank' })
		end
		if (Config.ui.showBlackMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'blackMoney' })
		end
		if (Config.ui.showWalletMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'wallet' })
		end
	end

	toggleui = not toggleui
end)

exports('createStatus', function(args)
	local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
	SendNUIMessage(statusCreation)
end)

exports('setStatus', function(args)
	local playerStatus = { action = 'setStatus', status = {
		{ name = args['name'], value = args['value'] }
	}}
	SendNUIMessage(playerStatus)
end)
