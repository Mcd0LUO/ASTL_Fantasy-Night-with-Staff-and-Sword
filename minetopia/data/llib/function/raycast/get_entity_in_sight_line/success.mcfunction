##
    scoreboard players reset %sight_line_watcher temp1
    scoreboard players reset %sight_line_watcher temp2
    $execute as @n[$(selector),distance=..1] run function $(func)
    return 1
#