## BM 算法的字符串匹配
    # 循环判断，确保模式串在主串内
        execute unless score #match_start temp1 <= #match_delte temp1 run return run function llib:easy_str/private/find_all/end
    # 次数判断，确保列表长度不超过预设上限
        execute if score #match_max_count temp1 matches 0 run return run function llib:easy_str/private/find_all/end
    # 模式串末尾匹配
        # 初始化访问索引
        scoreboard players operation #match_needle_start temp1 = #find_length temp1
        scoreboard players operation #match_needle_end temp1 = #find_length temp1
        scoreboard players remove #match_needle_start temp1 1
        # 匹配
        return run function llib:easy_str/private/find_all/_bm_equal_str
