execute positioned 0.0 0.0 0.0 rotated ~ 0 run tp @s ^ ^ ^1
data modify storage llib:temp get_arc_range_entity.forward.pos set from entity @s Pos
data modify storage llib:temp get_arc_range_entity.forward.x set from storage llib:temp get_arc_range_entity.forward.pos[0]
data modify storage llib:temp get_arc_range_entity.forward.y set from storage llib:temp get_arc_range_entity.forward.pos[1]
data modify storage llib:temp get_arc_range_entity.forward.z set from storage llib:temp get_arc_range_entity.forward.pos[2]
kill @s


execute at @a positioned ^ ^ ^10 as @e[distance=..10,type=!player] positioned as @s positioned ^ ^ ^9000000 facing entity @a eyes positioned ^ ^ ^9000000 at @s[distance=..2] run say 1

execute as @e[type=!minecraft:player] positioned as @s facing entity @a eyes positioned ^ ^ ^1 rotated as @a positioned ^ ^ ^0.966 at @s[distance=..0.259] run say 1