# gamemodedatapack
a Datapack for changing oneself gamemode withoutt any permission

A lightweight utility datapack for Java Edition 1.21+ that lets any player authenticate with a password via /trigger, then freely switch between all four gamemodes without needing OP.
And also tracks and displays the number of in-game days elapsed since datapack added. For deception

# How to use

---

Any player on the server can type:
```
/trigger test set 1031
```
`test` is a `trigger`-type scoreboard objective, which means non-OP players can use it on themselves. The tick function runs every tick and checks if your `test` score hit exactly `1031`. If it does, it calls `auth_success` which sets your `gm_authed` score to `1` and resets `gm_auth` back to `0`. If you typed any other number, the score just gets silently reset to `0` — no error, no feedback.

Every tick, the datapack runs:
```mcfunction
scoreboard players enable @a test
execute as @a if score @s gm_authed matches 1 run scoreboard players enable @s gm_switch
```
`trigger` objectives are special, players can only fire them if they've been explicitly *enabled* for that player. So `test` gets enabled for everyone every tick, meaning anyone can attempt the password at any time. `gm_switch` only gets enabled for players whose `gm_authed` score is `1`, so unauthenticated players can't fire it at all.

Once authenticated, you type:
```
/trigger gm_switch set 1
/trigger gm_switch set 2
/trigger gm_switch set 3
/trigger gm_switch set 4
```
The tick function checks your `gm_switch` score and calls the matching setter function — `set_survival`, `set_creative`, `set_adventure`, or `set_spectator`. Each one runs `gamemode <mode> @s` on you (since the function executes as you) and sends a colored confirmation message. The score resets to `0` immediately after.

The `/gamemode` command normally requires OP, but when a datapack function runs it *the server is executing it*, not the player. The player only fires `/trigger`, which is a zero-permission command. So the datapack acts as a trusted middleman — the player signals intent via the trigger, and the server carries out the privileged action.
