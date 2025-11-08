## 固定攻击值的攻击函数 传入攻击数值，并对攻击对象赋值tag: active_attack_target

    $scoreboard players set @s temp1 $(damage)
    scoreboard players operation @e[distance=..20,tag=active_attack_target] Lhealth -= @s temp1


#