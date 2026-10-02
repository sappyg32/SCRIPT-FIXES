-- Phone Salesman - client
-- Spawns a ped at Legion Square, gives him a map marker, and opens an ox_lib
-- context menu that lets the player buy a phone or a SIM card.

local config = require 'shared.config'

local menuOpen = false
local ped      = nil
local blip     = nil
local radiusBlip = nil

-- ─── Helpers ────────────────────────────────────────────────────────────────

local function notify(msg, kind)
    lib.notify({
        title       = config.NotifyTitle or 'Phone Salesman',
        description = msg,
        type        = kind or 'inform',
    })
end

local function money(amount)
    amount = math.floor((tonumber(amount) or 0) + 0.5)
    -- Insert thousands separators without relying on a locale call.
    local formatted = tostring(amount):reverse():gsub('(%d%d%d)', '%1,'):reverse()
    formatted = formatted:gsub('^,', '')
    return ('$%s'):format(formatted)
end

-- ─── Ped + blip ─────────────────────────────────────────────────────────────

local function spawnNpc()
    local npc   = config.Npc
    local model = npc.model

    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    ped = CreatePed(4, model, npc.coords.x, npc.coords.y, npc.coords.z, npc.heading, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetPedCanRagdoll(ped, false)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetPedFleeAttributes(ped, 0, false)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedDropsWeaponsWhenDead(ped, false)

    if npc.scenario then
        TaskStartScenarioInPlace(ped, npc.scenario, 0, true)
    end

    SetModelAsNoLongerNeeded(model)

    if npc.target and npc.target.enabled then
        exports.ox_target:addLocalEntity(ped, {
            {
                name     = 'sd_phone_vendor_talk',
                label    = npc.target.label,
                icon     = npc.target.icon,
                distance = npc.target.distance,
                onSelect = function() openMenu() end,
            },
        })
    end
end

local function createBlip()
    local b = config.Npc.blip
    if not b or not b.enabled then return end

    local c = config.Npc.coords
    blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite(blip, b.sprite)
    SetBlipColour(blip, b.color)
    SetBlipScale(blip, b.scale)
    SetBlipAsShortRange(blip, (b.radius or 0) > 0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(b.label)
    EndTextCommandSetBlipName(blip)

    -- A wider translucent circle, so the marker reads from a distance.
    if b.radius and b.radius > 0 then
        radiusBlip = AddBlipForRadius(c.x, c.y, c.z, b.radius + 0.0)
        SetBlipColour(radiusBlip, b.color)
        SetBlipAlpha(radiusBlip, 80)
    end
end

-- ─── Purchase ───────────────────────────────────────────────────────────────

-- The server owns price, stock and inventory checks; this only asks.
local function buy(entry)
    local ok, msg = lib.callback.await('sd-phone-vendor:buy', false, entry.id)
    notify(msg or (ok and 'Purchase complete.' or 'Purchase failed.'), ok and 'success' or 'error')
end

-- ─── Menu ───────────────────────────────────────────────────────────────────

local function buildOptions()
    local options = {}

    for _, entry in ipairs(config.Catalogue) do
        options[#options + 1] = {
            title       = entry.label,
            description = ('%s  -  %s'):format(money(entry.price), entry.description or ''),
            icon        = (entry.item == 'sim_card')
                              and 'fa-solid fa-sim-card'
                              or  'fa-solid fa-mobile-screen-button',
            arrow       = true,
            onSelect    = function() buy(entry) end,
        }
    end

    options[#options + 1] = {
        title       = 'Never mind',
        description = 'Leave without buying',
        icon        = 'fa-solid fa-xmark',
        onSelect    = function() end,
    }

    return options
end

function openMenu()
    if menuOpen then return end
    menuOpen = true

    lib.registerContext({
        id      = 'sd_phone_vendor',
        title   = config.NotifyTitle or 'Phone Salesman',
        options = buildOptions(),
    })

    lib.showContext('sd_phone_vendor')
    menuOpen = false
end

-- ─── Interaction thread ─────────────────────────────────────────────────────

CreateThread(function()
    if not config.Npc.enabled then return end

    spawnNpc()
    createBlip()

    local key = config.Npc.key
    if not (key and key.enabled) then return end

    local coords = config.Npc.coords
    while true do
        local sleep = 1000
        local pos   = GetEntityCoords(PlayerPedId())

        if #(pos - coords) < 3.0 and not menuOpen and not IsPauseMenuActive() then
            sleep = 0
            if IsControlJustReleased(0, key.control) then
                openMenu()
            end
        end

        Wait(sleep)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if blip and DoesBlipExist(blip) then RemoveBlip(blip) end
    if radiusBlip and DoesBlipExist(radiusBlip) then RemoveBlip(radiusBlip) end
    if ped and DoesEntityExist(ped) then DeleteEntity(ped) end
end)
