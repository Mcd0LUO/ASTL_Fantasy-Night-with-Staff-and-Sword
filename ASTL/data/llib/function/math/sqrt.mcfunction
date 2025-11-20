##
    # 注： 源函数来自   https://github.com/Triton365/fast_integer_sqrt 这里仅做本地化修改
    #@score #num : temp1 - 待开方数
#

scoreboard players set #559 const 559
scoreboard players set #32768 const 32768


execute store result score #t1 temp1 store result score #t2 temp1 store result score #t3 temp1 run scoreboard players operation #y temp1 = #num temp1
execute if score #num temp1 matches 0..1515359 run scoreboard players operation #y temp1 /= #559 const
execute if score #num temp1 matches 0..1515359 run scoreboard players add #y temp1 15
execute if score #num temp1 matches 1515360.. run scoreboard players operation #y temp1 /= #32768 const
execute if score #num temp1 matches 1515360.. run scoreboard players add #y temp1 2456
scoreboard players operation #t1 temp1 /= #y temp1
scoreboard players operation #y temp1 += #t1 temp1
scoreboard players operation #y temp1 /= #2 const
scoreboard players operation #t2 temp1 /= #y temp1
scoreboard players operation #y temp1 += #t2 temp1
scoreboard players operation #y temp1 /= #2 const
scoreboard players operation #t3 temp1 /= #y temp1
scoreboard players operation #y temp1 += #t3 temp1
scoreboard players operation #y temp1 /= #2 const
scoreboard players operation #num temp1 /= #y temp1
execute if score #y temp1 > #num temp1 run scoreboard players remove #y temp1 1


scoreboard players reset #559 const
scoreboard players reset #32768 const
# OUTPUT: scoreboard players get #y temp1
return run scoreboard players get #y temp1