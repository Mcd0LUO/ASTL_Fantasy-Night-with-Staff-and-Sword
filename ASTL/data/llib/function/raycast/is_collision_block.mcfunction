## 检测distance范围内是否有碰撞(标准版本: 默认步长: 0.2
scoreboard players set #isCollition temp1 0
scoreboard players set #result temp1 0
execute anchored eyes run function llib:raycast/private/is_collision/_iter
return run scoreboard players get #result temp1