# gamemode_trigger:tick
# Every tick: enable the trigger for the authorized player,
# then check if they fired it, and respond accordingly.
#
# REPLACE the UUID below with your player's actual UUID.
# Format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
# Example: 71f42065-dac1-40dd-9557-f6f228451c91
#
# Trigger values:
#   1 = Survival
#   2 = Creative
#   3 = Adventure
#   4 = Spectator

# --- Step 1: Enable the trigger ONLY for the authorized player ---
# This makes /trigger gm_switch available to them each tick.
scoreboard players enable 71f42065-dac1-40dd-9557-f6f228451c91 gm_switch

# --- Step 2: Check if the authorized player fired the trigger ---
# We use their UUID as the selector target via a UUID selector.
execute as 71f42065-dac1-40dd-9557-f6f228451c91 \
    if score @s gm_switch matches 1 \
    run function gamemode_trigger:set_survival

execute as 71f42065-dac1-40dd-9557-f6f228451c91 \
    if score @s gm_switch matches 2 \
    run function gamemode_trigger:set_creative

execute as 71f42065-dac1-40dd-9557-f6f228451c91 \
    if score @s gm_switch matches 3 \
    run function gamemode_trigger:set_adventure

execute as 71f42065-dac1-40dd-9557-f6f228451c91 \
    if score @s gm_switch matches 4 \
    run function gamemode_trigger:set_spectator

# --- Step 3: Reset the trigger score to 0 after handling ---
# This also re-disables the trigger until next tick enables it again.
execute as 71f42065-dac1-40dd-9557-f6f228451c91 \
    if score @s gm_switch matches 1.. \
    run scoreboard players set @s gm_switch 0
