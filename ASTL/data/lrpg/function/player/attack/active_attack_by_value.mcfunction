## 固定伤害攻击
    #@args {
        # uuid: string - 命令执行者uuid
        # damage: int - 攻击值 > 具体值 * 10,如攻击值0.5,传入5
        # target: selector - 选择器参数 > 请传入可以选择到将攻击的可攻击对象的选择器参数
    #}
    $scoreboard players set @s lrpg.cause_damage $(damage)
    $execute as @e[$(target)] run function lrpg:enemy/hurt/hurt_by_fixed_value {damage: $(damage)}

#