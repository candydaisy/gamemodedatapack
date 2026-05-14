scoreboard players set @s gm_authed 1
scoreboard players set @s test 0
tellraw @s {"text":"Authenticated! Use /trigger gm_switch set <1-4> to change gamemode.","color":"green"}
tellraw @s [{"text":"  1","color":"yellow"},{"text":" = Survival  ","color":"white"},{"text":"2","color":"aqua"},{"text":" = Creative  ","color":"white"},{"text":"3","color":"gold"},{"text":" = Adventure  ","color":"white"},{"text":"4","color":"gray"},{"text":" = Spectator","color":"white"}]
