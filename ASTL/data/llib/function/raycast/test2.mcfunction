particle end_rod ~ ~0.1 ~ 0 0.1 0 0 1
scoreboard players remove #times temp1 1
execute unless score #times temp1 matches 0 positioned ^ ^ ^0.5 run function llib:raycast/test2