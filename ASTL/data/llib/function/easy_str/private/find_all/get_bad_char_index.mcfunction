# 获取失配字符处，在预处理的坏字符表的索引
$return run data modify storage llib:temp find_all.char_pos set from storage llib:temp find_all.bad_char_map."$(temp_char)"