# 获取主手连击次数
$item modify entity @s weapon.mainhand {function:"set_custom_data",tag:{components:{combo:{state:$(state)b}}}}