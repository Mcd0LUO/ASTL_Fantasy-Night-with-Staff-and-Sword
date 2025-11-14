##

    #
    execute store result storage llib:temp strip.start_index int 1 run scoreboard players get #start_index temp1
    execute store result storage llib:temp strip.end_index int 1 run scoreboard players get #end_index temp1
    # 获取当前字符
    function llib:easy_str/private/strip/get_char with storage llib:temp strip
    # 比较字符
    execute store result score #not_match temp1 run data modify storage llib:temp strip.equal_char set from storage llib:input strip.chars
    # 不匹配则终止
    execute if score #not_match temp1 matches 1 run return 1
    # 匹配则索引移动
    scoreboard players operation #start_index temp1 -= #chars_length temp1
    scoreboard players operation #end_index temp1 -= #chars_length temp1
    # 计数
    scoreboard players add #strip_count temp1 1

    function llib:easy_str/private/strip/_iter_right
#