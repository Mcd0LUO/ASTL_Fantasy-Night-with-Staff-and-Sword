##
    #@desc 获取右手手持武器的持久化伤害
    #@param scale: float  - 倍率
    #@return int - 取整的伤害
##
    $return run data get entity @s SelectedItem.components."minecraft:custom_data".attribute.attack_power $(scale)
#