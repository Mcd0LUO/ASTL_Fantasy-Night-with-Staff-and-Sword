##
    
    execute store result score #i0 temp1 run data get storage llib:temp sum[-1]
    execute store result score #i1 temp1 run data get storage llib:temp sum[-2]
    execute store result score #i2 temp1 run data get storage llib:temp sum[-3]
    execute store result score #i3 temp1 run data get storage llib:temp sum[-4]
    execute store result score #i4 temp1 run data get storage llib:temp sum[-5]
    scoreboard players operation #result temp1 += #i0 temp1
    scoreboard players operation #result temp1 += #i1 temp1
    scoreboard players operation #result temp1 += #i2 temp1
    scoreboard players operation #result temp1 += #i3 temp1
    scoreboard players operation #result temp1 += #i4 temp1
    data remove storage llib:temp sum[-1]
    data remove storage llib:temp sum[-1]
    data remove storage llib:temp sum[-1]
    data remove storage llib:temp sum[-1]
    data remove storage llib:temp sum[-1]

    scoreboard players remove #total temp1 5
    execute if score #total temp1 matches 1.. run function llib:math/private/sum/_iter