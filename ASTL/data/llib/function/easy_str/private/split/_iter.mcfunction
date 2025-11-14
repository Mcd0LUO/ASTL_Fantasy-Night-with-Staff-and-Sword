##
    # 获取sep索引 计算range
        
        execute store result score #end_index temp1 run data get storage llib:output find_all[0]
        # 特殊处理拼接最后一段
        execute if score #split_count temp1 matches 1 store result score #end_index temp1 run data get storage llib:input split.str
        # tellraw @a [{score:{name:"#start_index",objective:"temp1"}},"  ",{score:{name:"#end_index",objective:"temp1"}},"  ", {score:{name:"#split_count",objective:"temp1"}}]
        execute store result storage llib:temp split.end_index short 1 run scoreboard players get #end_index temp1
        execute store result storage llib:temp split.start_index short 1 run scoreboard players get #start_index temp1
        data remove storage llib:output find_all[0]

    # 添加sep前字符
        function llib:easy_str/private/split/append_elemet with storage llib:temp split

    # 完成分割
        scoreboard players remove #split_count temp1 1
        execute if score #split_count temp1 matches 0 run return 1
        # tellraw @a [{score:{name:"#start_index",objective:"temp1"}},"  ",{score:{name:"#end_index",objective:"temp1"}},"  ", {score:{name:"#split_count",objective:"temp1"}}]
    # 继续分割
        execute store result score #start_index temp1 run scoreboard players operation #end_index temp1 += #sep_length temp1
        function llib:easy_str/private/split/_iter
#