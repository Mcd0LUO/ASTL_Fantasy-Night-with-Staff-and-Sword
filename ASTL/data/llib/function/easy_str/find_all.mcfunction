## 找到指定子串在字符串中匹配的所有位置
    # 初始化: data modify storage llib:input find.str set value "This is a test strsing"
    #        data modify storage llib:input find.find set value "strs"
    # 运行: function llib:easy_str/find_all
    # 结果: data get storage llib:output find

    #@args<storage> llib:input find {
        # str : str - 待寻找的主串
        # find : str - 要匹配的模式串
        # count: int - 子串位置的最大数量 默认为-1

    #}

    #@return<storage> llib:output find : list<int> - 匹配到的所有位置

#

##
        # data remove storage llib:temp find_all
        data remove storage llib:output find_all
    # 计算字符串长度
        execute store result score #str_length temp1 run data get storage llib:input find_all.str
        execute store result score #find_length temp1 run data get storage llib:input find_all.find
    # 早返回异常关系
        execute unless score #str_length temp1 matches 0.. run return run function llib:easy_str/private/find_all/early_return
        execute unless score #find_length temp1 matches 0.. run return run function llib:easy_str/private/find_all/early_return
        execute if score #str_length temp1 < #find_length temp1 run return run function llib:easy_str/private/find_all/early_return
    # 预处理子串坏字符表
        scoreboard players set #bad_char_index temp1 0
        scoreboard players set #bad_char_end temp1 1
        function llib:easy_str/private/find_all/_collect_bad_char
    # 

    # BM 算法匹配
        scoreboard players set #match_start temp1 0
        scoreboard players operation #match_delte temp1 = #str_length temp1
        scoreboard players operation #match_delte temp1 -= #find_length temp1
        # 获取匹配数量
        execute store result score #match_max_count temp1 run data get storage llib:input find_all.count 1
        # 不限制匹配
        execute if score #match_max_count temp1 matches ..0 run scoreboard players set #match_max_count temp1 -1
        return run function llib:easy_str/private/find_all/_bm_match

#