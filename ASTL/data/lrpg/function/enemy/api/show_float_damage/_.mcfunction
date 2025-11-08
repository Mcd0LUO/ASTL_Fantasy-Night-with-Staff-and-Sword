$execute on attacker at @s positioned ~ ~2 ~ run summon text_display ^$(x) ^$(y) ^$(z) {text:"$(value)",alignment:"center",billboard:"vertical",Tags:["float_damage_$(uid)"]}
schedule function lrpg:enemy/api/show_float_damage/kill 1s append


