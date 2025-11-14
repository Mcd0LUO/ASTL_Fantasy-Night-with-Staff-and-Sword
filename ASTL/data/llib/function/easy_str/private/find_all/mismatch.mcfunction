##

#

##
    # 失配
        scoreboard players set #right_index temp1 -1
        data remove storage llib:temp find_all.move_step
        function llib:easy_str/private/find/get_bad_char_index with storage llib:temp find
        execute if data storage llib:temp find_all.move_step store result score #right_index temp1 run data get storage llib:temp find_all.move_step

    # 计算移动长度
        scoreboard players operation #move_step temp1 = #match_needle_start temp1
        scoreboard players operation #move_step temp1 -= #right_index temp1
        tellraw @a [{"text":"mismatch "},{score:{name:"#match_main_start",objective:"temp1"}}]
    # 移动
        scoreboard players operation #match_main_start temp1 += #move_step temp1
        scoreboard players operation #match_main_end temp1 += #move_step temp1
    # 重置模式串访问索引
        scoreboard players operation #match_needle_start temp1 = #find_length temp1
        scoreboard players operation #match_needle_end temp1 = #find_length temp1
        scoreboard players remove #match_needle_start temp1 1
    # 继续匹配
        return run function llib:easy_str/private/find_all/_bm_match

#