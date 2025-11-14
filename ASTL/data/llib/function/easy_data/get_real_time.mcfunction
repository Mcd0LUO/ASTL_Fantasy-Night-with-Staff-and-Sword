## 获取现实世界时间 [时:分:秒]
    setblock 0 0 0 redstone_block
    setblock 0 0 0 command_block{Command:"say 11",TrackOutput:true,UpdateLastExecution:true} replace
    setblock 0 1 0 redstone_block destroy
    data modify storage llib:temp time set string block 0 0 0 LastOutput.text 1 9
    data modify storage llib:output time.hour set string storage llib:temp time 0 2
    data modify storage llib:output time.minute set string storage llib:temp time 3 5
    data modify storage llib:output time.second set string storage llib:temp time 6 8
    data remove storage llib:temp time
    function llib:easy_data/private/to_num_time with storage llib:output time
    execute store result score #hour temp1 run data get storage llib:output time.hour
    execute store result score #minute temp1 run data get storage llib:output time.minute
    execute store result score #second temp1 run data get storage llib:output time.second
    scoreboard players set #math.60 temp1 60
    scoreboard players operation #hour temp1 *= #math.60 temp1
    scoreboard players operation #minute temp1 += #hour temp1
    scoreboard players operation #minute temp1 *= #math.60 temp1
    execute store result storage llib:output time.timestamp int 1 run scoreboard players operation #second temp1 += #minute temp1
#