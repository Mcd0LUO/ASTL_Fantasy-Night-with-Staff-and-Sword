## 求和
    # 初始化: data modify storage llib:input sum set value [I;1,2,3,4,5,6]

    #@args<storage> llib:input sum - 数组

    #@return<value> - 求和结果

#

##
    data modify storage llib:temp sum set from storage llib:input sum
    # 求和
    scoreboard players set #result temp1 0
    execute store result score #total temp1 run data get storage llib:temp sum
    # 早返回
    execute if score #total temp1 matches 0 run return 0
    function llib:math/private/sum/_iter
    return run scoreboard players get #result temp1
#