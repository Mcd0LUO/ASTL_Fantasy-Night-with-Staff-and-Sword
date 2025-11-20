## 角度制转弧度制
# #@args<score> #num temp1 - 要转换的角度
# 弧度_int = (嫉妒 * PI_int + 90) /180
# scoreboard players set #PI temp1 3141593
# scoreboard players set #90 temp1 90
# scoreboard players set #180 temp1 180
# scoreboard players operation #temp temp1 = #num temp1
# scoreboard players operation #temp temp1 *= #PI temp1
# scoreboard players operation #temp temp1 += #90 temp1
# scoreboard players operation #temp temp1 /= #180 temp1
# scoreboard players reset #PI temp1
# scoreboard players reset #90 temp1
# scoreboard players reset #180 temp1
# return run scoreboard players get #temp temp1
scoreboard players set #RD_1 temp1 174533
scoreboard players set #360 temp1 360
scoreboard players operation #temp temp1 = #num temp1
execute if score #num temp1 matches 361.. run scoreboard players operation #temp temp1 %= #360 temp1
execute store result storage llib:output radians float 0.0000001 run scoreboard players operation #temp temp1 *= #RD_1 temp1
return run scoreboard players get #temp temp1