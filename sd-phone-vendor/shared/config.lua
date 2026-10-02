-- Phone Salesman - Legion Square
-- Everything you are likely to change lives in this file.

return {
    -- Where the salesman stands. Change coords/heading to move him.
    Npc = {
        enabled = true,
        model   = `a_m_m_business_01`,          -- pedestrian hash
        coords  = vec3(195.8, -934.0, 30.7),    -- Legion Square, outside the main plaza
        heading = 240.0,
        scenario = 'WORLD_HUMAN_CLIPBOARD',     -- idle animation for the ped

        -- Map marker
        blip = {
            enabled = true,
            sprite  = 459,      -- phone icon
            color   = 2,        -- green
            scale   = 0.8,
            label   = 'Phone Salesman',
            -- Short-range blip: only draws when close. Set 0 for an always-on blip.
            radius  = 300.0,
        },

        -- ox_target interaction.
        target = {
            enabled  = true,
            distance = 2.0,
            label    = 'Talk to Phone Salesman',
            icon     = 'fa-solid fa-mobile-screen',
        },

        -- Press-E fallback (used alongside target, or alone when target is off).
        key = {
            enabled = true,
            control = 38,       -- INPUT_PICKUP / E
        },
    },

    -- What he sells.
    --   item must match the name in your ESX `items` table exactly.
    --   sd-phone seeds the eight stock phone items on boot (server/esxitems.lua).
    --   sim_card is only seeded when Sim.Enabled is true in configs/uniqueandsim.lua.
    Catalogue = {
        {
            id          = 'phone_black',
            label       = 'Smartphone (Black)',
            item        = 'phone_black',
            count       = 1,
            price       = 850,
            description = 'A brand new smartphone. Includes charger and warranty.',
        },
        {
            id          = 'sim_card',
            label       = 'SIM Card',
            item        = 'sim_card',
            count       = 1,
            price       = 75,
            description = 'SIM card with a freshly registered phone number.',
            -- Refused automatically while sd-phone's SIM feature is off.
            requiresSim = true,
        },
    },

    -- Account debited on purchase: 'cash' or 'bank'.
    -- Keep the server's affordability check in step with this.
    Account = 'cash',

    -- Notification title used for every purchase result.
    NotifyTitle = 'Phone Salesman',
}
