##
    # 初始化: 
    #       data modify storage llib:input startswith.str set value "This is a test strsing"
    #       data modify storage llib:input startswith.starts set value "This"
    # 运行: function llib:easy_str/startswith
    # 结果: data get storage llib:output startswith

    #@args<storage> llib:input startswith
        # str : str - 要判断的字符串
        # starts : str - 起始字符串

    #}

    #@return<value> boolean - 是否以starts开头

    execute store result score #str_length temp1 run data get storage llib:input startswith.str
    execute store result score #starts_length temp1 run data get storage llib:input startswith.starts
    execute if score #str_length temp1 < #starts_length temp1 run return fail

    # 截取字符串
    execute store result storage llib:temp startswith.end_index short 1 run scoreboard players get #starts_length temp1
    function llib:easy_str/private/startswith/substr with storage llib:temp startswith

    execute store result score #not_match temp1 run data modify storage llib:temp startswith.equal_str set from storage llib:input startswith.starts
    execute if score #not_match temp1 matches 1 run return fail

    data remove storage llib:temp startswith
    scoreboard players reset #str_length temp1
    scoreboard players reset #starts_length temp1
    scoreboard players reset #not_match temp1
    return 1
#