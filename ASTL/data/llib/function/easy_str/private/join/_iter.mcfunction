## 内部join函数迭代

##
    # 每次获取-1索引不断组成新字符串

    # 获取-1索引
    data modify storage llib:input join.start set from storage llib:input join.str_list[-1]
    # 删除-1索引
    data remove storage llib:input join.str_list[-1]
    # 内部方法拼接两个字符串
    function llib:easy_str/private/join/combine with storage llib:input join
    # 计数
    scoreboard players remove #easy_str.length temp1 1
    execute if score #easy_str.length temp1 matches 1.. run function llib:easy_str/private/join/_iter

#