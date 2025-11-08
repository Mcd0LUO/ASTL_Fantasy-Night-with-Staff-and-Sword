## 获取视线前方的第一个实体
    #@setting llib:raycast_args {
        # selector: string - 选择器
        # distance: float - 最大获取距离(block)
        # step: float - 步长(block)
        # func: string - 实体执行的函数
    #}

    #return boolean - 是否获取成功
#

##
    # 距离
    execute store result score %sight_line_watcher temp1 run data get storage llib:raycast_args distance 10
    # 步长
    execute store result score %sight_line_watcher temp2 run data get storage llib:raycast_args step 10
    # 递归
    function llib:raycast/get_entity_in_sight_line/_ with storage llib:raycast_args


#