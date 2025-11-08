## 怪物受伤

    # 懒加载属性
    tag @s add target
    execute unless entity @s[tag=init] run function lrpg:enemy/load_attribute with entity @s data
    # 获取玩家伤害
    execute store result score @s Ltake_damage on attacker run function lrpg:player/attack/get_normal_damage
    scoreboard players operation @s Ltake_damage -= @s Ldefense
    # 运算生命
    scoreboard players operation @s Lhealth -= @s Ltake_damage
    # 持久化
    tellraw @a [{text:"造成了伤害: "},{score:{name: "@s",objective:Ltake_damage}},{text:"剩余生命: "}, {score:{name: "@s",objective:Lhealth}}]
    # execute store result storage lrpg:float_damage map.value float 1 run scoreboard players get @s Ltake_damage
    # 伤害显示
    # function lrpg:enemy/api/show_float_damage/main
    # 判断是否死亡
    execute if score @s Lhealth matches ..0 run function lrpg:enemy/death/main

#