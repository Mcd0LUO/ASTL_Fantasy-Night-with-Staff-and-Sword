## 找到指定子串在字符串中的起始索引
    # 初始化: data modify storage llib:input find.str set value "This is a test strsing"
    #        data modify storage llib:input find.find set value "strs"
    # 运行: function llib:easy_str/find
    # 结果: data get storage llib:output find

    #@args<storage> llib:input find {
        # str : str - 待寻找的主串
        # find : str - 要匹配的模式串

    #}

    #@return<storage> llib:output find : int - 

#

##
        data remove storage llib:temp find
    # 计算字符串长度
        execute store result score #str_length temp1 run data get storage llib:input find.str
        execute store result score #find_length temp1 run data get storage llib:input find.find
    # 早返回异常关系
        execute unless score #str_length temp1 matches 0.. run return run function llib:easy_str/private/find/early_return
        execute unless score #find_length temp1 matches 0.. run return run function llib:easy_str/private/find/early_return
        execute if score #str_length temp1 < #find_length temp1 run return run function llib:easy_str/private/find/early_return
    # 预处理子串坏字符表
        scoreboard players set #bad_char_index temp1 0
        scoreboard players set #bad_char_end temp1 1
        function llib:easy_str/private/find/_collect_bad_char
    # 

    # BM 算法匹配
        scoreboard players set #match_start temp1 0
        scoreboard players operation #match_delte temp1 = #str_length temp1
        scoreboard players operation #match_delte temp1 -= #find_length temp1

        return run function llib:easy_str/private/find/_bm_match


        scoreboard players reset #match_start temp1
        scoreboard players reset #match_delte temp1
        scoreboard players reset #str_length temp1
        scoreboard players reset #find_length temp1
        scoreboard players reset #bad_char_end temp1
        scoreboard players reset #bad_char_index temp1
        scoreboard players reset #match_main_start temp1
        scoreboard players reset #match_main_end temp1
        scoreboard players reset #match_needle_start temp1
        scoreboard players reset #match_needle_end temp1
        scoreboard players reset #match_start temp1
        scoreboard players reset #is_match temp1
        scoreboard players reset #char_pos temp1
        scoreboard players reset #move_step temp1
#