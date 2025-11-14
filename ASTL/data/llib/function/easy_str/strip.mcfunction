##
    # 初始化: 
    #       data modify storage llib:input strip.str set value "This is a test strsing"
    #       data modify storage llib:input strip.starts set value "This"
    # 运行: function llib:easy_str/strip
    # 结果: data get storage llib:output strip

    #@args<storage> llib:input strip
        # str : str - 待去除的字符串
        # chars : str - 去除的字符串
    #}

    #@return<storage> llib:output strip

    #
        execute store result score #str_length temp1 run data get storage llib:input strip.str
        execute store result score #chars_length temp1 run data get storage llib:input strip.chars
        data modify storage llib:output strip set from storage llib:input strip.str

        scoreboard players set #strip_count temp1 0
    # 移除左侧
    scoreboard players set #start_index temp1 0
    scoreboard players operation #end_index temp1 = #chars_length temp1
    function llib:easy_str/private/strip/_iter_left
    execute store result storage llib:temp strip.end_index int 1 run scoreboard players get #str_length temp1
    function llib:easy_str/private/strip/set_str with storage llib:temp strip

    # 移除右侧
    execute store result score #str_length temp1 run data get storage llib:output strip
    scoreboard players operation #end_index temp1 = #str_length temp1
    scoreboard players operation #start_index temp1 = #end_index temp1
    scoreboard players operation #start_index temp1 -= #chars_length temp1
    function llib:easy_str/private/strip/_iter_right
    execute store result storage llib:temp strip.start_index int 1 run scoreboard players set #start_index temp1 0
    execute store result storage llib:temp strip.end_index int 1 run scoreboard players get #end_index temp1
    function llib:easy_str/private/strip/set_str with storage llib:temp strip
    # clear
    scoreboard players reset #str_length temp1
    scoreboard players reset #chars_length
    scoreboard players reset #start_index temp1
    scoreboard players reset #end_index temp1
    scoreboard players reset #not_match temp1
    data remove storage llib:temp strip

    return run scoreboard players get #strip_count temp1

#