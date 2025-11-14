# 递归匹配字符串
    # 所有字符都匹配成功，右移继续匹配
        execute if score #match_needle_start temp1 matches ..-1 run return run function llib:easy_str/private/find_all/_right_move
    # 匹配字符串
        # 获取模式串字符
            execute store result storage llib:temp find_all.needle_start int 1 run scoreboard players get #match_needle_start temp1
            execute store result storage llib:temp find_all.needle_end int 1 run scoreboard players get #match_needle_end temp1
            function llib:easy_str/private/find_all/get_needle_char with storage llib:temp find_all
        # 获取主串字符
            scoreboard players operation #match_main_start temp1 = #match_needle_start temp1
            scoreboard players operation #match_main_start temp1 += #match_start temp1
            scoreboard players operation #match_main_end temp1 = #match_main_start temp1
            execute store result storage llib:temp find_all.main_start int 1 run scoreboard players get #match_main_start temp1
            execute store result storage llib:temp find_all.main_end int 1 run scoreboard players add #match_main_end temp1 1
            function llib:easy_str/private/find_all/get_main_char with storage llib:temp find_all
        # equal字符串
            data modify storage llib:temp find_all.temp_char set from storage llib:temp find_all.needle_char
            execute store result score #is_match temp1 run data modify storage llib:temp find_all.temp_char set from storage llib:temp find_all.main_char
        # 成功则左移并递归匹配
            execute unless score #is_match temp1 matches 1 run return run function llib:easy_str/private/find_all/_left_move

        # 失配则计算移动步数
            data remove storage llib:temp find_all.char_pos
            function llib:easy_str/private/find_all/get_bad_char_index with storage llib:temp find_all
            scoreboard players set #char_pos temp1 -1
            execute if data storage llib:temp find_all.char_pos store result score #char_pos temp1 run data get storage llib:temp find_all.char_pos
            scoreboard players operation #move_step temp1 = #match_needle_start temp1
            scoreboard players operation #move_step temp1 -= #char_pos temp1
            execute unless score #move_step temp1 matches 1.. run scoreboard players set #move_step temp1 1
 
        # 模式串右移
            scoreboard players operation #match_start temp1 += #move_step temp1 
        # 递归匹配
            return run function llib:easy_str/private/find_all/_bm_match
#