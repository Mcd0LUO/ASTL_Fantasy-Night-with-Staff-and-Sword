execute store result score %llib:tps_timer temp1 run stopwatch query llib:tps_timer 1000
scoreboard players set %llib:tps_timer temp2 5000000
scoreboard players operation %llib:tps_timer temp2 /= %llib:tps_timer temp1
scoreboard players operation %llib:tps_timer StdAnalysisTps = %llib:tps_timer temp2
stopwatch restart llib:tps_timer
schedule function llib:stdanalysis/tps/test_tps 5t replace
