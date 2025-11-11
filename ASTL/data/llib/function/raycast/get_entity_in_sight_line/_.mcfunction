## 内部循环
    # particle end_rod ~ ~ ~ 0 0 0 0 1
    scoreboard players operation #sight_line_watcher temp1 -= #sight_line_watcher temp2
    # tellraw @a [{text:"剩余距离: "},{score:{name:"%sight_line_watcher",objective:"temp1"}}, {text:"    步长: "},{score:{name:"%sight_line_watcher",objective:"temp2"}}]
    # 超出距离终止
    execute if score #sight_line_watcher temp1 matches ..0 run return run function llib:raycast/get_entity_in_sight_line/exeception
    # 遇到方块终止
    execute unless block ~ ~ ~ #llib:raycast/can_pass run return run function llib:raycast/get_entity_in_sight_line/exeception
    # 遇到实体终止并返回
    $execute as @n[$(selector),distance=..1] run return run function llib:raycast/get_entity_in_sight_line/success with storage llib:raycast_args

    $execute positioned ^ ^ ^$(step) run function llib:raycast/get_entity_in_sight_line/_ with storage llib:raycast_args


#