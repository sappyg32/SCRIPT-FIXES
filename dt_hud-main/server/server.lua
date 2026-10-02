ESX = exports.es_extended:getSharedObject()

TriggerEvent('es:addCommand', 'toggleui', function()
end, { help = _U('toggleui') })

RegisterServerEvent('dt_hud:getServerInfo')
AddEventHandler('dt_hud:getServerInfo', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local job, name = nil, nil
	local age

	if not xPlayer then return end

	name = xPlayer.name

	exports.oxmysql:query('SELECT dateofbirth FROM users WHERE identifier = ?', { xPlayer.identifier }, function(result)
		local dob = result[1] and result[1].dateofbirth or nil

		if dob then
			local month, day, year = dob:match("(%d+)%/(%d+)%/(%d+)")
			if month and day and year then
				local birth = os.time({year = tonumber(year), month = tonumber(month), day = tonumber(day)})
				local now = os.time()
				age = os.date("%Y", now) - tonumber(year)
				
				if os.date("%m%d", now) < (month .. day) then
					age = age - 1
				end

				age = tostring(math.floor(age)) .. ' ans'
			end
		end

		if xPlayer.job.label == xPlayer.job.grade_label then
			job = xPlayer.job.grade_label
		else
			job = xPlayer.job.label .. ': ' .. xPlayer.job.grade_label
		end

		local info = {
			job = job,
			name = name,
			age = age,
			player = xPlayer
		}

		TriggerClientEvent('dt_hud:setInfo', src, info)
	end)
end)

-- Bank balance for the HUD.
-- The client copy of ESX.PlayerData.accounts is unreliable under
-- esx_multicharacter (it clears ESX.PlayerData on selection and never assigns
-- the loaded data back), so read it from the authoritative server player object.
RegisterServerEvent('dt_hud:getBank')
AddEventHandler('dt_hud:getBank', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	if not xPlayer then return end

	local balance = 0

	local ok, bankAccount = pcall(function()
		return xPlayer.getAccount('bank')
	end)

	if ok and bankAccount and bankAccount.money ~= nil then
		balance = tonumber(bankAccount.money) or 0
	end

	TriggerClientEvent('dt_hud:setBank', src, balance)
end)

RegisterServerEvent('dt_hud:syncCarLights')
AddEventHandler('dt_hud:syncCarLights', function(status)
	TriggerClientEvent('dt_hud:syncCarLights', -1, source, status)
end)
