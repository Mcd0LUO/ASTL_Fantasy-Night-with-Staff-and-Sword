# 存储值并继续寻找下一个子串

    # 存储结果

    execute store result storage llib:temp find_all.pos short 1 run scoreboard players get #match_start temp1
    data modify storage llib:output find_all append from storage llib:temp find_all.pos
    scoreboard players add #match_start temp1 1

    # 统计成功次数
    scoreboard players remove #match_max_count temp1 1

    return run function llib:easy_str/private/find_all/_bm_match

#