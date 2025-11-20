tp @s ^ ^ ^1
data modify storage llib:temp trig.pos set from entity @s Pos
execute store result storage llib:output trig.sin double 1 run data get storage llib:temp trig.pos[0]
execute store result storage llib:output trig.cos double 1 run data get storage llib:temp trig.pos[2]
data remove storage llib:temp trig.pos
kill @s