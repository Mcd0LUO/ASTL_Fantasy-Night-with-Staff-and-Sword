## 拼接字符串
    #@setting llib:easy_str/join {
        # str_list : List<str> - 要拼接的字符串数组
        # join : str - 字符串连接符

    #}

    #@return result : str - 拼接后的字符串

#

##
    # 初始化
        # 获取长度
        execute store result score #easy_str.length temp1 if data storage llib:easy_str/join str_list[]
        execute if score #easy_str.length temp1 matches ..0 run return fail
        # 连接符
        execute unless data storage llib:easy_str/join join run data modify storage llib:easy_str/join join set value "" 
        # 循环
    # 

#