team add enemy
team modify enemy friendlyFire false
effect give @e[type=!player,team=enemy] resistance infinite 255 true
# 属性
scoreboard objectives add lrpg.health dummy "生命值"
scoreboard objectives add lrpg.attack dummy "攻击力"
scoreboard objectives add lrpg.defense dummy "防御值"
scoreboard objectives add lrpg.cause_damage dummy "造成伤害"
scoreboard objectives add lrpg.take_damage dummy "受到伤害"

#
scoreboard objectives add lrpg.attack_state dummy "攻击状态(次数)"
scoreboard objectives add lrpg.last_attack_time dummy "上次攻击时间"


scoreboard objectives add lrpg.return dummy "返回值"




# 