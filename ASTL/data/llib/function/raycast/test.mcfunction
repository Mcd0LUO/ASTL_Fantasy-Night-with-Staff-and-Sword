##
 # test.mcfunction
 # 
 #
 # Created by .
##
# scoreboard players set #times temp1 50
# scoreboard players set #times temp2 50
# execute as @a at @s rotated ~15 0 run function llib:raycast/test2
# execute as @a at @s rotated ~-15 0 run function llib:raycast/test3
# schedule function llib:raycast/test 5t