##

    #@args<storage> llib:input get_arc_range_entity {
        # selector: string - 选择器(full)
        # range: float - 获取范围(角度)
        # func: string - 实体执行的函数
    #}

    #return boolean - 是否获取成功
#

##
    scoreboard players set #resutl temp1 0
    # 存储玩家坐标
        data modify storage llib:temp get_arc_range_entity.player.pos set from entity @s Pos
        data modify storage llib:temp get_arc_range_entity.player.rot set from entity @s Rotation
        data modify storage llib:temp get_arc_range_entity.player.x set from storage llib:temp get_arc_range_entity.player.pos[0]
        data modify storage llib:temp get_arc_range_entity.player.y set from storage llib:temp get_arc_range_entity.player.pos[1]
        data modify storage llib:temp get_arc_range_entity.player.z set from storage llib:temp get_arc_range_entity.player.pos[2]
    # 
    # 存储玩家视线所在方向向量
    execute anchored feet summon marker run function llib:raycast/private/get_arc_range_entity/get_forward_vector
    $execute as $(selector) run function llib:raycast/private/get_arc_range_entity/select

    return run scoreboard players get #result temp1
#