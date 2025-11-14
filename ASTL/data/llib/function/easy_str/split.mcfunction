##
    # 初始化: 
    #       data modify storage llib:input split.str set value "This is a test strsing"
    #       data modify storage llib:input split.sep set value "is"
    #       data modify storage llib:input split.count set value -1
    # 运行: function llib:easy_str/split
    # 结果: data get storage llib:output split

    #@args<storage> llib:input replace {
        # str : str - 原始字符串
        # sep : str - 分隔符
        # count : int - 替换的次数, -1 表示全部替换

    #}

    #@return<storage> llib:output split: List<str> - 分隔后的字符串数组

#


##
        data remove storage llib:output split
    # 获取sep索引
        data modify storage llib:input find_all.str set from storage llib:input split.str
        data modify storage llib:input find_all.find set from storage llib:input split.sep
        data modify storage llib:input find_all.count set from storage llib:input split.count
        function llib:easy_str/find_all
        # 获取总sep数
        execute store result score #sep_count temp1 if data storage llib:output find_all[]
        execute if score #sep_count temp1 matches 0 run data modify storage llib:output find_all append from storage llib:input split.str
        # 获取sep长度
        execute store result score #sep_length temp1 run data get storage llib:input split.sep
        # 获取用户要分割的次数
        execute store result score #split_count temp1 run data get storage llib:input split.count
    # 分割
        # 计算最大分割数
        execute if score #split_count temp1 matches ..0 run scoreboard players operation #split_count temp1 = #sep_count temp1
        scoreboard players operation #split_count temp1 < #sep_count temp1
        scoreboard players add #split_count temp1 1

        scoreboard players set #start_index temp1 0
        function llib:easy_str/private/split/_iter

    # clear
        scoreboard players reset #sep_length temp1
        scoreboard players reset #start_index temp1
        scoreboard players reset #end_index temp1
#