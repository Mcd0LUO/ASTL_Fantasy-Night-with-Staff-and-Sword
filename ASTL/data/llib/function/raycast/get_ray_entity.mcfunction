##

    #@args<storage> llib:input get_ray_entity {
        # selector: string - 选择器
        # distance: float - 最大获取距离(block)
        # step: float - 步长(block)
        # func: string - 实体执行的函数
    #}

    #return boolean - 是否获取成功
#

##
    # 距离
    execute store result score #sight_line_watcher temp1 run data get storage llib:input get_ray_entity.distance 10
    # 步长
    execute store result score #sight_line_watcher temp2 run data get storage llib:input get_ray_entity.step 10
    scoreboard players set #success temp1 0
    # 递归
    execute anchored eyes run function llib:raycast/private/get_ray_entity/_iter with storage llib:input get_ray_entity
    return run scoreboard players get #success temp1

#