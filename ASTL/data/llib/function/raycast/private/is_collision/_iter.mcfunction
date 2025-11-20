# particle end_rod ~ ~ ~ 0 0 0 0 0
scoreboard players add #isCollition temp1 1

execute if score #isCollition temp1 matches 100.. run return run scoreboard players set #result temp1 0

execute unless block ^ ^ ^0.4 #llib:raycast/can_pass run return run scoreboard players set #result temp1 1
execute positioned ^ ^ ^0.4 run function llib:raycast/private/is_collision/_iter