scoreboard players enable @a test
execute as @a if score @s gm_authed matches 1 run scoreboard players enable @s gm_switch

execute as @a if score @s test matches 1031 run function day_counter:auth_success
execute as @a if score @s test matches 1..1030 run scoreboard players set @s test 0
execute as @a if score @s test matches 1032.. run scoreboard players set @s test 0

execute as @a if score @s gm_authed matches 1 if score @s gm_switch matches 1 run function day_counter:set_survival
execute as @a if score @s gm_authed matches 1 if score @s gm_switch matches 2 run function day_counter:set_creative
execute as @a if score @s gm_authed matches 1 if score @s gm_switch matches 3 run function day_counter:set_adventure
execute as @a if score @s gm_authed matches 1 if score @s gm_switch matches 4 run function day_counter:set_spectator

execute as @a if score @s gm_authed matches 1 if score @s gm_switch matches 1.. run scoreboard players set @s gm_switch 0

execute store result score $day daycounter run time query gametime
scoreboard players operation $day daycounter /= $24000 const
title @a actionbar [{"type":"text","text":"Day ","color":"white"},{"type":"score","score":{"objective":"daycounter","name":"$day"}}]