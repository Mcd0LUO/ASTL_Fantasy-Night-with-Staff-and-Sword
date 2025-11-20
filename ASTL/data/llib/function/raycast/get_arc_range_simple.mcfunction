##

    #@args<storage> llib:input get_arc_range_simple {
        # selector: string - 选择器(full)
        # range: int - 获取范围(角度)  15 | 30 | 45 |60 | 75 | 90 | 105 | 120 | 135
        # distance: float - 获取距离
        # command: string - 实体执行的命令
    #}

    #return boolean - 是否获取成功
#

scoreboard players set #result temp1 0
tag @s add arc_range_simple
$function llib:raycast/private/get_arc_range_simple/simple_$(range) with storage llib:input get_arc_range_simple
execute if data storage llib:input get_arc_range_simple.command as @e[tag=arc_range.target] run function llib:run with storage llib:input get_arc_range_simple
tag @s remove arc_range.simple
execute as @e[tag=arc_range.target] run scoreboard players add #result temp1 1

return run scoreboard players get #result temp1