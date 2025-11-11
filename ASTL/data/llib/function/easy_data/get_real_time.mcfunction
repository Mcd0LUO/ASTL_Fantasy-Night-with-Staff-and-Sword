# 获取现实世界时间 [时:分:秒]
    setblock 0 0 0 command_block keep
    data modify block 0 0 0 Command set value "time query daytime"
    setblock 0 1 0 redstone_block replace
    data modify storage llib:easy_data/time text set string block 0 0 0 LastOutput.text 1 9
    data modify storage llib:easy_data/time hour set string storage llib:easy_data/time text 0 2
    data modify storage llib:easy_data/time minute set string storage llib:easy_data/time text 3 5
    data modify storage llib:easy_data/time second set string storage llib:easy_data/time text 6 8
    setblock 0 1 0 air
