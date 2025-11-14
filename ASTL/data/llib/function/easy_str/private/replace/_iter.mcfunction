##
    # 倒序遍历索引修改字符串
    # tellraw @a {nbt:"",storage:"llib:output"}
    execute store result score #start_index temp1 run data get storage llib:output find_all[-1]
    data remove storage llib:output find_all[-1]
    # 存储
    execute store result storage llib:temp replace.start_index int 1 run scoreboard players get #start_index temp1
    execute store result storage llib:temp replace.end_index int 1 run scoreboard players operation #start_index temp1 += #old_length temp1
    execute store result score #full_len temp1 run data get storage llib:temp replace.result
    execute store result storage llib:temp replace.suffix_len int 1 run scoreboard players get #full_len temp1
    # 替换
    function llib:easy_str/private/replace/get_range_str_prefix with storage llib:temp replace
    function llib:easy_str/private/replace/get_range_str_suffix with storage llib:temp replace
    function llib:easy_str/private/replace/combine with storage llib:temp replace

    scoreboard players remove #replace_time temp1 1
    execute if score #replace_time temp1 matches 0 run return 1
    execute unless data storage llib:output find_all[] run return 1
    function llib:easy_str/private/replace/_iter
#