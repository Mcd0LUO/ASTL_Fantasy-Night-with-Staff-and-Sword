##
    # 获取传入角度对应的sin，cos 值
    #@args<macro> {
        # angle: float - 角度

    #}

    #return<storage> llib:output trig
#
$execute summon minecraft:marker positioned 0.0 0.0 0.0 rotated -$(angle) 0 run function llib:math/private/trig/marker_pos