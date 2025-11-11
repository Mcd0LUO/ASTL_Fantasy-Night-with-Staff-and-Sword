## 传入固定伤害
    $scoreboard players remove @s lrpg.health $(damage)
    execute if function lrpg:enemy/death/is_imminent_to_die run function lrpg:enemy/death/main

#