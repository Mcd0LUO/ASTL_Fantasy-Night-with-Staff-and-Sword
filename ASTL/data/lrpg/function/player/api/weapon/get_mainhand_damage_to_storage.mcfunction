##
    #@desc 获取右手手持武器的持久化伤害
    #@param storage: string - 存入的storage
    #@param key: string  - 存入storage的key
    #@param scale: float  - 倍率
    #@return void
##
    $execute store result storage $(storage) $(key) float $(scale) run data get entity @s SelectedItem.components."minecraft:custom_data".attribute.attack_power
#