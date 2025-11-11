## 
    #玩家使用武器攻击怪物

    # 组件检测
        # 连击
        execute if items entity @s weapon.mainhand *[minecraft:custom_data~{"components":{"combo":{enable:true}}}] \ 
        run function lrpg:player/attack/combo/main
    

#