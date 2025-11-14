stopwatch create llib:tps_timer
stopwatch restart llib:tps_timer
schedule function llib:stdanalysis/tps/test_tps 5t replace
scoreboard objectives add StdAnalysisTps dummy
# say stdanalysis tps test start