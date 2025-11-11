## 获取战士玩家普通攻击伤害
    scoreboard players set @s temp1 0
    execute store result score @s temp1 run function lrpg:player/api/get_mainhand_damage {scale:10}
    scoreboard players operation @s temp1 += @s lrpg.attack
    return run scoreboard players get @s temp1

#