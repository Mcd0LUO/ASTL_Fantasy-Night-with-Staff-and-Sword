##
    #拥有连击组件的武器触发的连击主函数

    # 判断冷却
        execute store result score @s temp1 run data get entity @s SelectedItem.components."minecraft:custom_data".components.combo.cooldown 20
        execute store result score @s temp2 run data get entity @s SelectedItem.components."minecraft:custom_data".last_attack_timestamp 1
        execute store result score @s temp3 run time query gametime
        scoreboard players operation @s temp3 -= @s temp2
        # scoreboard players operation @s temp4 = @s temp1
        # scoreboard players operation @s temp4 -= @s temp3
        # execute if score @s temp3 < @s temp1 run tellraw @s [{"text":"§c[Lrpg] 冷却中 "},{score:{name:"*",objective:"temp4"}},{text:" tick"}]
        execute if score @s temp3 < @s temp1 run return fail
    # 获取左键连击配置
        data remove storage lrpg:temp {}
        function lrpg:player/api/weapon/get_mainhand_set_ref {storage:"lrpg:temp"}
    # 取左键连击段数
        execute store result storage lrpg:temp state byte 1 run function lrpg:player/api/weapon/get_mainhand_combo_state
        execute store result score @s temp1 run data get storage lrpg:temp state 1
    # 从配置获取连击函数
        function lrpg:player/attack/combo/macro/main_combo_func_select with storage lrpg:temp
    # 持久化攻击时间戳
        execute store result storage lrpg:temp timestamp long 1 run time query gametime
        function lrpg:player/api/weapon/set_mainhand_last_attack_timesatmp with storage lrpg:temp
    # 持久化连击段数
        scoreboard players add @s temp1 1
        execute store result storage lrpg:temp state byte 1 run scoreboard players get @s temp1
        function lrpg:player/api/weapon/set_mainhand_combo_state with storage lrpg:temp
    # 清理临时storage
        data remove storage lrpg:temp {}
     
# 