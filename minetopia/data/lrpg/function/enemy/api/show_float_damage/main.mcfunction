## 显示飘动伤害
execute store result storage lrpg:float_damage map.x float 0.1 run random value -10..10
execute store result storage lrpg:float_damage map.y float 0.1 run random value -5..5
execute store result storage lrpg:float_damage map.z float 0.1 run random value 22..30
execute store result storage lrpg:float_damage map.uid int 1 run scoreboard players add %math.2 const 0
function lrpg:enemy/api/show_float_damage/_ with storage lrpg:float_damage map

