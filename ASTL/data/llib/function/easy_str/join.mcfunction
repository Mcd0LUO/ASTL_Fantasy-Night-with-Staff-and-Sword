## 拼接字符串
    # 初始化: data modify storage llib:input join.str_list set value ["a", "b", "c", "d"]
    # 运行: function llib:easy_str/join
    # 结果: data get storage llib:output join

    #@args<storage> llib:input join {
        # str_list : List<str> - 要拼接的字符串数组
        # join : str - 字符串连接符

    #}

    #@return<storage> llib:output join : str - 拼接后的字符串

#

##
    # 初始化
            data remove storage llib:output join
        # 获取长度
            execute store result score #easy_str.length temp1 if data storage llib:input join.str_list[]
            execute if score #easy_str.length temp1 matches ..0 run return fail
        # 初始化默认连接符
            execute unless data storage llib:input join.join run data modify storage llib:input join set value ""
        # 列表长度为1则直接返回
            execute if score #easy_str.length temp1 matches 1 run function llib:easy_str/private/join/early_return
    # 拼接
        # 初始化结果
        data modify storage llib:input join.result set from storage llib:input join.str_list[-1]
        data remove storage llib:input join.str_list[-1]
        scoreboard players remove #easy_str.length temp1 1
        # 迭代
        function llib:easy_str/private/join/_iter
    # 结束
        data modify storage llib:output join set from storage llib:input join.result

    # clear
        scoreboard players reset #easy_str.length
#