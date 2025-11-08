team add enemy
team modify enemy friendlyFire false
effect give @e[type=!player,team=enemy] resistance infinite 255 true

scoreboard objectives add Lhealth dummy
scoreboard objectives add Lattack dummy
scoreboard objectives add Ldefense dummy
scoreboard objectives add Lcause_damage dummy "造成伤害"
scoreboard objectives add Ltake_damage dummy "受到伤害"