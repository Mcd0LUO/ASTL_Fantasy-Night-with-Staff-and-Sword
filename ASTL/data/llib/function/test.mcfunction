# data modify storage llib:input join.str_list set value ["a", "b", "c","1","2","3","4","5","6","7","8","9","10"]
# data modify storage llib:input join.join set value "----------------------"
# return run function llib:easy_str/join

# data modify storage llib:input find_all.str set value "This is a test string"
# data modify storage llib:input find_all.find set value "s"
# data modify storage llib:input find_all.count set value -1
# return run function llib:easy_str/find_all

# data modify storage llib:input replace.str set value "This is a test string"
# data modify storage llib:input replace.old set value "is"
# data modify storage llib:input replace.new set value "was"
# data modify storage llib:input replace.count set value 1
# execute store result score #result temp1 run function llib:easy_str/replace
# tellraw @a [{"text":"索引: "},{"score":{"name":"#result","objective":"temp1"}}]
# scoreboard players reset #times temp1

# data modify storage llib:input split.str set value "This is a test string"
# data modify storage llib:input split.sep set value " "
# data modify storage llib:input split.count set value -1
# function llib:easy_str/split


# data modify storage llib:input startswith.str set value "This is a test string"
# data modify storage llib:input startswith.starts set value "This is "
# return run function llib:easy_str/startswith

# data modify storage llib:input strip.str set value "This is a test This"
# data modify storage llib:input strip.chars set value "This"
# return run function llib:easy_str/strip

data modify storage llib:input get_arc_range_entity.selector set value "@e[tag=enemy,distance=..5,limit=2]"
data modify storage llib:input get_arc_range_entity.range set value 60f
data modify storage llib:input get_arc_range_entity.func set value ""
function llib:raycast/get_arc_range_entity with storage llib:input get_arc_range_entity