# sd-phone-vendor

A Phone Salesman NPC at Legion Square. He carries a map marker titled
**Phone Salesman** and opens an ox_lib menu that sells sd-phone handsets and
SIM cards.

Built against **ESX** and **sd-phone**.

## Install

1. Drop the `sd-phone-vendor` folder into your resources directory.
2. Add to `server.cfg`, after its dependencies:

```
ensure ox_lib
ensure es_extended
ensure sd-phone
ensure sd-phone-vendor
```

3. Restart the server.

The ped spawns at `195.8, -934.0, 30.7`, outside the Legion Square plaza.
Adjust `Npc.coords` and `Npc.heading` in `shared/config.lua` if he clips into
scenery on your game build.

## Using it

Walk up to the salesman and use either:

- **ox_target** on the ped ("Talk to Phone Salesman"), or
- **E** within 3 metres.

Either opens the menu. Picking a row buys one of that item immediately; there
is no basket.

## Configuring what he sells

Everything lives in `shared/config.lua`.

```lua
{
    id          = 'phone_black',
    label       = 'Smartphone (Black)',
    item        = 'phone_black',
    count       = 1,
    price       = 850,
    description = 'A brand new smartphone. Includes charger and warranty.',
}
```

`item` must match a row in your ESX `items` table exactly.

sd-phone seeds its eight stock handsets into the ESX catalogue on boot, so
these names are already valid:

`phone_black`, `phone_blue`, `phone_green`, `phone_orange`,
`phone_pink`, `phone_purple`, `phone_red`, `phone_yellow`

Add one catalogue row per colour you want to stock.

`sim_card` is different: it is only seeded into ESX when the SIM feature is
enabled, and the server refuses to sell it otherwise. See below.

## SIM cards

sd-phone ships with SIMs **off** (`Enabled = false` in
`configs/uniqueandsim.lua`), in which case the SIM row is refused at purchase
rather than sold as an item that does nothing. No config edit is needed to
handle that case - the server checks automatically via
`exports['sd-phone']:isSimModeActive()`.

To sell SIMs, in sd-phone's `configs/uniqueandsim.lua`:

1. Set `Enabled = true`.
2. Pick a `DataOwner` mode (`'device'` is the usual choice).
3. Leave `BuiltInNumbers = false` - built-in numbers means there is no SIM
   item at all.
4. Add the `sim_card` item to your ESX catalogue.

The vendor then calls `exports['sd-phone']:giveSimCard()`, which mints and
registers a real number and stamps it onto the card, so the buyer gets a
working SIM rather than a blank one.

## Payment

`Account` in `shared/config.lua` is `'cash'` by default. Set it to `'bank'` to
charge the bank account instead. The affordability check and the debit both
read the same value, so they stay in step.

## Map marker

Blip settings are under `Npc.blip`. `radius` controls the translucent circle
drawn around the marker; set it to `0` for an always-on blip with no circle.
`label` is the text shown on the map and is not truncated by the marker.

## Files

| File                | Purpose                                            |
| ------------------- | -------------------------------------------------- |
| `fxmanifest.lua`    | Resource manifest                                  |
| `shared/config.lua` | Ped, blip, target, key and catalogue settings      |
| `client.lua`        | Ped spawn, blip, ox_target, ox_lib menu            |
| `server.lua`        | Purchase validation, money handling, SIM issuing   |

## Notes

- Price is read server-side and never trusted from the client.
- The item is given before money is taken, and the give is verified against the
  player's inventory, so an unknown item name or a full inventory costs nothing
  instead of silently charging for nothing.
- The ped is frozen, invincible and mission-entity flagged, and is deleted along
  with the blips when the resource stops. He respawns on script restart.
