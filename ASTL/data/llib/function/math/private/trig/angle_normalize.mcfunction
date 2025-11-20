# 角度归一化 参数#angle temp1
    scoreboard players set #180 temp1 180
    scoreboard players set #360 temp1 360
    scoreboard players set #sign temp1 1
    scoreboard players operation #theta_scaled temp1 = #angle temp1
    # 超出2PI 取余
    execute if score #theta_scaled temp1 matches 361.. run scoreboard players operation #theta_scaled temp1 %= #36000 temp1

    execute if score #theta_scaled temp1 matches 91..180 store result score #theta_scaled temp1 run return run scoreboard players operation #180 temp1 -= #theta_scaled temp1
    # 负数部分
    execute if score #theta_scaled temp1 matches 181..359 run scoreboard players set #sign temp1 -1
    execute if score #theta_scaled temp1 matches 181..270 run return run scoreboard players operation #theta_scaled temp1 -= #18000 temp1

    execute if score #theta_scaled temp1 matches 271..359 run scoreboard players operation #360 temp1 -= #theta_scaled temp1
