particle end_rod ~ ~ ~ 0 0 0 0 0
scoreboard players add #isCollition temp1 1

execute if score #isCollition temp1 matches 100.. run return run function llib:raycast/is_collision/end

execute unless block ^ ^ ^0.2 #llib:raycast/can_pass run return run function llib:raycast/is_collision/end
execute positioned ^ ^ ^0.2 run function llib:raycast/is_collision/_