-- Phone Salesman - server
-- Authoritative purchase handler. Price comes from the config here, never from
-- the client, and the item is verified to have landed before any money moves.

local config = require 'shared.config'

local ESX = exports['es_extended']:getSharedObject()

-- Lookup built once at boot rather than scanned per purchase.
local byId = {}
for _, entry in ipairs(config.Catalogue) do
    byId[entry.id] = entry
end

local function money(amount)
    return ('$%s'):format(math.floor((tonumber(amount) or 0) + 0.5))
end

-- True while sd-phone's unique-phones / SIM feature is live.
local function simsAreLive()
    local ok, active = pcall(function()
        return exports['sd-phone']:isSimModeActive()
    end)
    return ok and active == true
end

-- Reads the configured account robustly across ESX versions, plus getMoney().
local function balanceOf(xPlayer)
    local account = config.Account or 'cash'
    if account == 'bank' then
        local acc = xPlayer.getAccount and xPlayer.getAccount('bank')
        return acc and acc.money or 0
    end
    return xPlayer.getMoney and xPlayer.getMoney() or 0
end

local function charge(xPlayer, price)
    local account = config.Account or 'cash'
    if account == 'bank' then
        if xPlayer.removeAccountMoney then
            xPlayer.removeAccountMoney('bank', price)
        else
            xPlayer.removeMoney(price)
        end
        return
    end
    xPlayer.removeMoney(price)
end

lib.callback.register('sd-phone-vendor:buy', function(source, entryId)
    local entry = byId[entryId]
    if not entry then
        return false, 'That item is not for sale.'
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return false, 'Could not find your character.'
    end

    local price = math.floor(tonumber(entry.price) or 0)

    if entry.requiresSim and not simsAreLive() then
        return false, 'SIM cards are not sold on this server.'
    end

    if balanceOf(xPlayer) < price then
        return false, ('You need %s to buy that.'):format(money(price))
    end

    -- Hand over the goods first; if that fails, nothing was paid.
    local given = false

    if entry.item == 'sim_card' then
        -- Registers a real number and stamps it onto the card.
        local number = exports['sd-phone']:giveSimCard(source, {})
        given = number ~= nil
    else
        xPlayer.addInventoryItem(entry.item, entry.count or 1)
        -- ESX's addInventoryItem silently no-ops on an unknown item or a full
        -- inventory, so confirm it actually landed before charging.
        local carried = xPlayer.getInventoryItem(entry.item)
        given = (carried and carried.count or 0) >= (entry.count or 1)
    end

    if not given then
        return false, 'You have no room for that.'
    end

    charge(xPlayer, price)

    return true, ('Bought %s for %s.'):format(entry.label, money(price))
end)
