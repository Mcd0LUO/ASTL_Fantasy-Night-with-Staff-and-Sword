## 收集子串坏字符
    execute store result storage llib:temp find_all.needle_start int 1 run scoreboard players get #bad_char_index temp1
    execute store result storage llib:temp find_all.needle_end int 1 run scoreboard players get #bad_char_end temp1
    # # 提取字符
    function llib:easy_str/private/find_all/get_needle_char with storage llib:temp find_all
    # 设置坏字符表
    function llib:easy_str/private/find_all/set_bad_char_map with storage llib:temp find_all
    # 计数
    scoreboard players add #bad_char_index temp1 1
    scoreboard players add #bad_char_end temp1 1
    # break
    execute if score #bad_char_end temp1 > #find_length temp1 run return 0
    # 收集
    function llib:easy_str/private/find_all/_collect_bad_char
#