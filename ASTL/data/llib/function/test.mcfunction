# data modify storage llib:input join.str_list set value ["a", "b", "c","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
# data modify storage llib:input join.join set value ","
# # 0索引方法
# function llib:easy_str/join

# data modify storage llib:input find_all.str set value "This is a test string"
# data modify storage llib:input find_all.find set value "s"
# data modify storage llib:input find_all.count set value 3
# execute store result score #result temp1 run function llib:easy_str/find_all
# tellraw @a [{"text":"索引: "},{"score":{"name":"#result","objective":"temp1"}}]
# scoreboard players reset #times temp1

# data modify storage llib:input replace.str set value "This is a tesist sistring"
# data modify storage llib:input replace.old set value "is"
# data modify storage llib:input replace.new set value "was"
# data modify storage llib:input replace.count set value -1
# execute store result score #result temp1 run function llib:easy_str/replace
# tellraw @a [{"text":"索引: "},{"score":{"name":"#result","objective":"temp1"}}]
# scoreboard players reset #times temp1

data modify storage llib:input split.str set value "This is a test string"
data modify storage llib:input split.sep set value " "
data modify storage llib:input split.count set value -1
function llib:easy_str/split
