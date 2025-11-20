## 筛选实体
    data modify storage llib:temp get_arc_range_entity.target.pos set from entity @s Pos
    data modify storage llib:temp get_arc_range_entity.target.x set from storage llib:temp get_arc_range_entity.target.pos[0]
    data modify storage llib:temp get_arc_range_entity.target.y set from storage llib:temp get_arc_range_entity.target.pos[1]
    data modify storage llib:temp get_arc_range_entity.target.z set from storage llib:temp get_arc_range_entity.target.pos[2]
#