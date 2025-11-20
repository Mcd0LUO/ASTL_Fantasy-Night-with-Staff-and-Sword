import math

def calculate_abc(x_deg, rd=4):
    """
    核心逻辑：A=1（斜边），∠C = x/2，B=cos(x/2)，C=sin(x/2)
    :param x_deg: 玩家视角角度（如30、60，单位：度）
    :return: A, B, C（保留4位小数，适配指令精度）
    """
    # 1. 固定斜边A=1
    A = 1.0
    
    # 2. 计算∠C = x/2（角度转弧度，用于三角函数计算）
    angle_C_rad = math.radians(x_deg / 2)
    
    # 3. 计算B（cos(x/2)）和C（sin(x/2)）
    B = math.cos(angle_C_rad)  # 指令中P→Q的向量长度（^ ^ ^B）
    C_radius = math.sin(angle_C_rad)  # 指令中检测半径（distance=.C）
    
    # 保留4位小数，兼顾精准度和指令兼容性
    return round(A, 4), round(B, 4), round(C_radius, 4)

if __name__ == "__main__":
    # 接收用户输入视角角度x
    while True:
        try:
            x_input = input("请输入玩家视角角度x（单位：度，如30、60）：")
            x_deg = float(x_input)
            # 视角角度合理范围（0<x<180，避免无意义结果）
            if 0 < x_deg < 180:
                # 计算A、B、C
                A, B, C_radius = calculate_abc(x_deg)
                
                # 输出结果（明确对应指令参数）
                print("\n" + "="*50)
                print(f"视角角度x = {x_deg}°")
                print(f"核心参数（A=1，B=cos(x/2)，C=sin(x/2)）：")
                print(f"A = {A} （实体→P点向量长度，指令中^ ^ ^A）")
                print(f"B = {B} （P→Q点向量长度，指令中^ ^ ^B）")
                print(f"C = {C_radius} （检测半径，指令中distance=.C）")
                print("="*50 + "\n")
                
                # 输出直接可用的Minecraft指令
                mc_command = (f"execute as @e[type=!minecraft:player] positioned as @s facing entity @a eyes "
                            f"positioned ^ ^ ^{A} rotated as @a positioned ^ ^ ^{B} "
                            f"at @s[distance=.{C_radius}] run say 1")
                print("直接可用的Minecraft指令：")
                print(mc_command)
            else:
                print("视角角度需在0~180度之间，请重新输入！")
        except ValueError:
            print("输入错误！请输入数字（如30、60.5）。")
    