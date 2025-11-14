##
    # 初始化: 
    #       data modify storage llib:input replace.str set value "This is a test strsing"
    #       data modify storage llib:input replace.old set value "is"
    #       data modify storage llib:input replace.new set value "is not"
    #       data modify storage llib:input replace.count set value -1
    # 运行: function llib:easy_str/replace
    # 结果: data get storage llib:output replace

    #@args<storage> llib:input replace {
        # str : str - 原始字符串
        # old : str - 待替换的字符串
        # new : str - 替换的字符串
        # count : int - 替换的次数, -1 表示全部替换

    #}

    #@return<storage> llib:output repalce : str - 替换后的字符串

#


##
        data remove storage llib:temp replace
        data remove storage llib:output replace
    # 获取所有要替换的初始索引
        data modify storage llib:input find_all.str set from storage llib:input replace.str
        data modify storage llib:input find_all.find set from storage llib:input replace.old
        data modify storage llib:input find_all.count set from storage llib:input replace.count
        function llib:easy_str/find_all
    # 获取要替换的字符串长度
        execute store result score #old_length temp1 run data get storage llib:input replace.old
        execute store result score #new_length temp1 run data get storage llib:input replace.new
    # 迭代
        data modify storage llib:temp replace.new set string storage llib:input replace.new
        data modify storage llib:temp replace.result set from storage llib:input replace.str
        execute store result score #replace_time temp1 run data get storage llib:input replace.count
        function llib:easy_str/private/replace/_iter
        data modify storage llib:output replace set from storage llib:temp replace.result
    # clear
        scoreboard players reset #old_length temp1
        scoreboard players reset #new_length temp1
        scoreboard players reset #replace_time temp1
        scoreboard players reset #start_index temp1
        scoreboard players reset #full_len temp1
#