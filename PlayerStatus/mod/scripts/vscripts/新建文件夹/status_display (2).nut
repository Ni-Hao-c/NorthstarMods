untyped
global function status_display_init
global function bbshield

const bool DISPLAY_HEALTH = true
const bool DISPLAY_SHIELD = true

const DEPLOYABLE_SHIELD_FX_AMPED = $"P_bubble_shield"

struct
{
	table< entity, int > playerToBubbleShieldsActiveTable //Mainly used to track stat for amped wall execution unlock
	int index
}file;
//const bool DISPLAY_VELOCITY = true
//const bool VELOCITY_CONSIDER_Z = false
//const bool VELOCITY_IN_MPH = false

table < int, string > playerbuffdescriptions = {
	[0] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[11] 				= "\x1b[31m<攻击强化S>\x1b[0m：按住E时进入狩猎模式，此时你受到自我伤害，且你的攻击秒杀敌人！",
 	[12] 				= "\x1b[31m<生命恢复S>\x1b[0m：你每秒恢复500HP",
	[13] 				= "\x1b[31m<无声无息S>\x1b[0m：你的模型隐藏",
	[14] 				= "\x1b[31m<高效作战S>\x1b[0m：在你死亡之前，你的得分效率X5",
	[15] 				= "\x1b[31m<防弹改装S>\x1b[0m：你受到弱点伤害略微提升，但弱点以外伤害大幅降低",
	[16] 				= "\x1b[31m<针锋相对S>\x1b[0m：你获得针锋相对模式脉冲刀，命中秒杀敌人且清空其分数",
	[17] 				= "\x1b[31m<同归于尽S>\x1b[0m：你的下一次攻击秒杀目标与自己",
	[18] 				= "\x1b[31m<无动于衷S>\x1b[0m：当你低头时，受到的任何种类伤害降低（秒杀除外）。视角越低，减伤越高。最高-95%",
	[19] 				= "\x1b[31m<非法改装S>\x1b[0m：你造成的任何伤害都将为你恢复等量的HP",

	[20] 				= "\x1b[31m<无法触及S>\x1b[0m：你有80%的概率闪避任意伤害",  
	
	[21] 				= "\x1b[31m<机体重塑S>\x1b[0m：你的机体更换为<破舰者>。按住空格会加速积攒动能，基于速度造成撞击伤害与击退，但受到由弱到强的自我伤害",  
	[22] 				= "\x1b[31m<空间撕裂S>\x1b[0m：你获得破空大剑，大范围，高伤害，无限攻击距离" ,
	[23] 				= "\x1b[31m<维度逃逸S>\x1b[0m：你可以按住E预备<维度逃逸>，此状态下受到伤害时固定为100点，且进入相位空间0.5s" ,
	[24] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[25] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[26] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[27] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[28] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[29] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[30] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[31] 				= "\x1b[36m<攻击强化A>\x1b[0m：按住E时进入狩猎模式，此时你受到自我伤害，且你的攻击让敌人进入毁灭状态！但你无法对毁灭姿态的敌人造成伤害。",
 	[32] 				= "\x1b[36m<正向随机A>\x1b[0m：你的伤害随机增加50%~200%",
	[33] 				= "\x1b[36m<超级机种A>\x1b[0m：你的血量上限随机增加50%~200%",
	[34] 				= "\x1b[36m<后勤之友A>\x1b[0m：你的主武器弹药无限",
	[35] 				= "\x1b[36m<能量充盈A>\x1b[0m：你的核心自然回复速度极大幅增加,帝王仅能回复四次",
	[36] 				= "\x1b[36m<枪斗专精A>\x1b[0m：你冲刺时主武器弹药装满,所有技能立即刷新",
	[37] 				= "\x1b[36m<势大力沉A>\x1b[0m：你的任何攻击都附带大幅度击退",
	[38] 				= "\x1b[36m<毒蛇推进A>\x1b[0m：你的冲刺力度极大幅增强",
	[39] 				= "\x1b[36m<瑞克7代A>\x1b[0m：你的电子烟雾使敌人10秒内无法移动",

	[40] 				= "\x1b[36m<反演入侵A>\x1b[0m：你受到任意伤害时，攻击者减速90%，并被声呐探测",

	[41] 				= "\x1b[36m<爆反装甲A>\x1b[0m：你受到任意伤害时，对周围所有敌方造成350点伤害",
	[42] 				= "\x1b[36m<能量聚集A>\x1b[0m：你可以受到友方的伤害，但仅承受其中25%，剩余的75%存储，攻击敌方时，消耗所有存储的伤害，提升等量攻击力",
	[43] 				= "\x1b[36m<博格装甲A>\x1b[0m：你受到连续受到同种伤害时，乘算减伤12%，受到不同种伤害时重置",
	[44] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[45] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[46] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[47] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[48] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[49] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[50] 				= "\x1b[96m请按E键抽取\x1b[0m",  	

    [51] 				= "\x1b[33m<轻装速行B>\x1b[0m：你的移速增加50%",
 	[52] 				= "\x1b[33m<死神队长B>\x1b[0m：召唤三名死神援军，其中一名为死神队长，极难击溃，请尝试将敌人引过来",
	[53] 				= "\x1b[33m<急速进攻B>\x1b[0m：你的进攻技能CD减少75%（特殊类型提升其他效果）",
	[54] 				= "\x1b[33m<战地医生B>\x1b[0m：你可以攻击队友，为其恢复生命值（每次50点HP）",
	[55] 				= "\x1b[33m<急速防御B>\x1b[0m：你的防御技能CD减少75%（特殊类型提升其他数值）",
	[56] 				= "\x1b[33m<要害打击B>\x1b[0m：你的暴击伤害+100%",
	[57] 				= "\x1b[33m<急速战术B>\x1b[0m：你的战术技能CD减少75%（特殊类型提升其他数值）",
	[58] 				= "\x1b[33m<作战意识B>\x1b[0m：你的生命值低于一半时，攻击力+100%；你处于毁灭状态时，攻击力+200%；你处于毁灭状态且生命中低于一半时，攻击力+300%",
	[59] 				= "\x1b[33m<快去抽人B>\x1b[0m：你与目标距离越远，伤害越高，最高+100%",      //"\x1b[33m<棒球高手B>\x1b[0m：你的近战攻击可以击飞敌人",
	
	[60] 				= "\x1b[33m<独行长路B>\x1b[0m：一定范围内无队友时，你造成的伤害+80%",     

	[61] 				= "\x1b[33m<蓄势待发B>\x1b[0m：你未造成伤害时，下次伤害每秒+15%，最高+330%，造成伤害后重置",  
	[62] 				= "\x1b[33m<终极猎手B>\x1b[0m：每有一个处于死亡状态的队友，你的士气等级提升1（伤害+60%）",     
	[63] 				= "\x1b[33m<医学背景B>\x1b[0m：你完全免疫自我伤害，反而每次伤害回复60HP",  
	[64] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[65] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[66] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[67] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[68] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[69] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[70] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[71] 				= "\x1b[34m<核心充能C>\x1b[0m：核心立即就绪",
 	[72] 				= "\x1b[34m<护盾充能C>\x1b[0m：护盾立即充满",
	[73] 				= "\x1b[34m<电磁手雷C>\x1b[0m：进攻技能替换为全息致盲幻影手雷",
	[74] 				= "\x1b[34m<PTSD C>\x1b[0m:你下次攻击造成3075点伤害",
	[75] 				= "\x1b[34m<鬼影小队C>\x1b[0m：你间歇性隐身",
	[76] 				= "\x1b[34m<毁灭收割C>\x1b[0m：你对毁灭状态的敌人伤害+200%",     //"\x1b[34m<近战击退C>\x1b[0m：你的近战攻击强而有力",
	[77] 				= "\x1b[34m<宁死不屈C>\x1b[0m：你死亡后生成一次核爆",
	[78] 				= "\x1b[34m<玩北玩的C>\x1b[0m：给予毒蛇电浆磁轨炮（2号武器位，有特殊强化）",
	[79] 				= "\x1b[34m<膝盖改装C>\x1b[0m：你冲刺时跳跃（需要在地面）",
	
	[80] 				= "\x1b[34m<决不放弃C>\x1b[0m：你在毁灭状态自然恢复生命值",

	[81] 				= "\x1b[34m<能量转换C>\x1b[0m：你受到任意伤害后均回复少量核心值",
	[82] 				= "\x1b[34m<相位引擎C>\x1b[0m：你按住E时，冲刺变为相位冲刺（战术缺失时无法使用）",
	[83] 				= "\x1b[34m<倚老卖老C>\x1b[0m：你在毁灭状态受到的任意伤害-80%",
	[84] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[85] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[86] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[87] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[88] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[89] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[90] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[91] 				= "<核心充能D>：核心立刻充能50%",
 	[92] 				= "<近身訓練D>：你的近战获得升级",
	[93] 				= "<漂移集气D>：你冲刺时回复500护盾值",
	[94] 				= "<友军之灾D>：你可以对友军造成伤害",
	[95] 				= "<冲刺装弹D>：你冲刺时主武器弹药+1",
	[96] 				= "<护盾充能D>：护盾立刻充能50%",
	[97] 				= "<幽默援军D>：呼叫步兵援军（老天，这太没用了）",
	[98] 				= "<严肃援军D>：你的准星处生成即将爆炸的炸蛛",
	[99] 				= "<一路小跑D>：进入一次20S的激素",
   
    [100] 				= "<救命稻草D>：你下次使用核心时回复2500点HP" ,

	[101] 				= "<见招拆招D>：你的核心激活期间受到的伤害降低70%，浪人仅降低30%" ,
	[102] 				= "<钢铁利爪D>：你的近战攻击距离+100%",  
	[103] 				= "<充能防御D>：每受到6次伤害，抵挡下一次伤害", 
	[104] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[105] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[106] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[107] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[108] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[109] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[110] 				= "\x1b[96m请按E键抽取\x1b[0m",  

}

table < int, string > playerdebuffdescriptions = {		

	[0] 				= "请按E键抽取",  

	[11] 				= "\x1b[31m<连线受损S>\x1b[0m：你在40S内逐渐失明",
 	[12] 				= "\x1b[31m<劣质电池S>\x1b[0m：你每秒失去300HP",
	[13] 				= "\x1b[31m<心中有愧S>\x1b[0m：当你击杀得分时，受到当前生命值一半的伤害",
	[14] 				= "\x1b[31m<一碰就碎S>\x1b[0m：你受到任何伤害时有5%的概率直接死亡",
	[15] 				= "\x1b[31m<寸步难行S>\x1b[0m：你无法移动",
	[16] 				= "\x1b[31m<同生共死S>\x1b[0m：你造成任何伤害时，对自身也造成等值伤害",
	[17] 				= "\x1b[31m<链接超时S>\x1b[0m：你将在20S后被踢出游戏，获得击杀重置倒计时（真惨）",
	[18] 				= "\x1b[31m<定时炸弹S>\x1b[0m：你将在15s后死亡,获得击杀重置倒计时",
	[19] 				= "\x1b[31m<劣质弹药S>\x1b[0m：你只能对护盾造成伤害",

	[20] 				= "\x1b[31m<机魂不悦S>\x1b[0m：从现在开始，有队友阵亡时你有30%的概率也随之死亡",

	[21] 				= "\x1b[31m<不息恶火S>\x1b[0m：你每秒受到100点燃烧伤害，每获得击杀翻倍",
	[22] 				= "\x1b[31m<头号通缉S>\x1b[0m：击杀你的玩家（包括你的队友）获得S级buff！已将你特殊标记并告知全部玩家！！",
	[23] 				= "\x1b[31m<拟真损伤S>\x1b[0m：随着血量降低，你受到越来越严重的减速与转向减速效果",
	[24] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[25] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[26] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[27] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[28] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[29] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[30] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[31] 				= "\x1b[36m<外壳无效A>\x1b[0m：你受到任何伤害时，有5%的概率直接进入毁灭状态",
 	[32] 				= "\x1b[36m<负面随机A>\x1b[0m：你的伤害随机浮动-30%~0%",
	[33] 				= "\x1b[36m<轻装上阵A>\x1b[0m：你的血量上限随机浮动-30%~-60%",
	[34] 				= "\x1b[36m<内鬼改装A>\x1b[0m：你的攻击有1/3的概率不造成伤害，反而为目标恢复等量HP",
	[35] 				= "\x1b[36m<动力不足A>\x1b[0m：你的移速减半，且只能步行",
	[36] 				= "\x1b[36m<劣质装甲A>\x1b[0m：你受到的任何伤害+100%",
	[37] 				= "\x1b[36m<无效得分A>\x1b[0m：你死亡时清空得分",
	[38] 				= "\x1b[36m<心中有愧A>\x1b[0m：你造成击杀时扣除1500HP",
	[39] 				= "\x1b[36m<舍命突袭A>\x1b[0m：你冲刺时扣除1000HP",

	[40] 				= "\x1b[36m<以逸待劳A>\x1b[0m：你移动时每秒扣除80HP",

	[41] 				= "\x1b[36m<门没关好A>\x1b[0m：你受到的暴击伤害+1000%（没看错）",
	[42] 				= "\x1b[36m<典型症状A>\x1b[0m：你造成伤害时有20%的概率开始换弹",
	[43] 				= "\x1b[36m<能量过载A>\x1b[0m：你释放核心时自爆死亡",
	[44] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[45] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[46] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[47] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[48] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[49] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[50] 				= "\x1b[96m请按E键抽取\x1b[0m",  

    [51] 				= "\x1b[33m<连线异常B>\x1b[0m：你间歇性无法移动",
 	[52] 				= "\x1b[33m<后勤之敌B>\x1b[0m：你的主武器弹容减半",
	[53] 				= "\x1b[33m<劣质装甲B>\x1b[0m：你的生命值低于一半时，受到的任何伤害+100%",
	[54] 				= "\x1b[33m<赔本买卖B>\x1b[0m：立即扣除50%HP",
	[55] 				= "\x1b[33m<引人注目B>\x1b[0m：你永久被声呐探测",
	[56] 				= "\x1b[33m<进攻缺失B>\x1b[0m：你的进攻技能冷却时间+100%（特殊类型降低其他数值）",
	[57] 				= "\x1b[33m<防御缺失B>\x1b[0m：你的防御技能冷却时间+100%（特殊类型降低其他数值）",
	[58] 				= "\x1b[33m<战术缺失B>\x1b[0m：你的战术技能冷却时间+100%（特殊类型降低其他数值）",
	[59] 				= "\x1b[33m<门没关好B>\x1b[0m：你受到的暴击伤害+100%",

	[60] 				= "\x1b[33m<心不在焉B>\x1b[0m：你的攻击有30%的概率未命中",  

	[61] 				= "\x1b[33m<传统护盾B>\x1b[0m：你的护盾值越高，移动速度越低",  
	[62] 				= "\x1b[33m<积重难返B>\x1b[0m：你的转生等级每有一级，伤害降低2%，最多降低至30%",    
	[63] 				= "\x1b[33m<制动失灵B>\x1b[0m：你的机体失去制动能力",  
	[64] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[65] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[66] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[67] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[68] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[69] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[70] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[71] 				= "\x1b[34m<动力不足C>\x1b[0m：你的移速降低30%，且只能步行",
 	[72] 				= "\x1b[34m<引人注目C>\x1b[0m：你造成击杀时获得20S声呐",
	[73] 				= "\x1b[34m<新手司机C>\x1b[0m：你的转向速度降低30%",
	[74] 				= "\x1b[34m<视觉过载C>\x1b[0m：你造成击杀时失明5S",
	[75] 				= "\x1b[34m<稳扎稳打C>\x1b[0m：你失去冲刺",
	[76] 				= "\x1b[34m<心慈手软C>\x1b[0m：你对毁灭状态的敌人伤害-66%",
	[77] 				= "\x1b[34m<玩玩烈焰C>\x1b[0m：你的装备组替换为烈焰",
	[78] 				= "\x1b[34m<辐射易伤C>\x1b[0m：你头顶无遮挡时被辐射伤害",
	[79] 				= "\x1b[34m<动力不足C>\x1b[0m：你间歇性移速降低",

	[80] 				= "\x1b[34m<消极态度C>\x1b[0m：你在毁灭状态自然流失生命值", 

	[81] 				= "\x1b[34m<反手无力C>\x1b[0m：你暴击时不再造成伤害", 
	[82] 				= "\x1b[34m<下盘不稳C>\x1b[0m：你受到伤害时更容易被击退", 
	[83] 				= "\x1b[34m<回光返照C>\x1b[0m：你处于毁灭状态时提升25%伤害，但不处于毁灭状态时降低20%伤害", 
	[84] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[85] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[86] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[87] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[88] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[89] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[90] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[91] 				= "<好好练枪D>：你失去近战",
 	[92] 				= "<舍命突袭D>：你冲刺后扣除200HP",
	[93] 				= "<手忙脚乱D>：你冲刺后主武器弹药-1",
	[94] 				= "<老式弹药D>：你对护盾伤害降低50%",
	[95] 				= "<模糊不清D>：友军能够对你造成伤害",
	[96] 				= "<退无可退D>：你无法后退",
	[97] 				= "<护盾缺失D>：你不能再拥有护盾",
	[98] 				= "<你别架了D>：你不移动时每秒扣除200HP",
	[99] 				= "<脆弱核心D>：你在毁灭状态受到任意伤害时立即死亡",

    [100] 				= "<破绽百出D>：你在装弹时受到的任意伤害+50%",

	[101] 				= "<畏手畏脚D>：你对生命值比你高的敌人造成的伤害-30%",
	[102] 				= "<娇生惯养D>：你受到伤害后减速20%",
	[103] 				= "<酒后驾驶D>：每隔五秒，你随机向一个方向移动（请勿模仿，酒驾是违法犯罪行为）",
	[104] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[105] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[106] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[107] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[108] 				= "\x1b[96m请按E键抽取\x1b[0m",  
	[109] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[110] 				= "\x1b[96m请按E键抽取\x1b[0m",  
}





table < int, string > buffdescriptions = {

    [0] 				= "請按E鍵抽取",  

	[11] 				= "<攻擊強化S>",
 	[12] 				= "<生命恢復S>",
	[13] 				= "<無聲無息S>",
	[14] 				= "<高效作戰S>",
	[15] 				= "<防彈改裝S>",
	[16] 				= "<針鋒相對S>",
	[17] 				= "<同歸於盡S>",
	[18] 				= "<無動於衷S>",
	[19] 				= "<非法改裝S>",

    [20] 				= "<無法触及S>", 

	[21] 				= "<機體重塑S>", 
	[22] 				= "<空間撕裂S>", 
	[23] 				= "<維度逃逸S>", 
	[24] 				= "請按E鍵抽取", 
	[25] 				= "請按E鍵抽取", 
	[26] 				= "請按E鍵抽取", 
	[27] 				= "請按E鍵抽取", 
	[28] 				= "請按E鍵抽取", 
	[29] 				= "請按E鍵抽取", 

	[30] 				= "請按E鍵抽取",  
	
	[31] 				= "<攻擊強化A>",
 	[32] 				= "<正向隨機A>",
	[33] 				= "<超級機種A>",
	[34] 				= "<後勤之友A>",
	[35] 				= "<能量充盈A>",
	[36] 				= "<槍鬥專精A>",
	[37] 				= "<勢大力沈A>",
	[38] 				= "<毒蛇推進A>",
	[39] 				= "<瑞克7代A>",

    [40] 				= "<反演入侵A>",

	[41] 				= "<爆反裝甲A>", 
	[42] 				= "<能量聚集A>", 
	[43] 				= "<博格裝甲A>", 
	[44] 				= "請按E鍵抽取", 
	[45] 				= "請按E鍵抽取", 
	[46] 				= "請按E鍵抽取", 
	[47] 				= "請按E鍵抽取", 
	[48] 				= "請按E鍵抽取", 
	[49] 				= "請按E鍵抽取", 

	[50] 				= "請按E鍵抽取",  

    [51] 				= "<輕裝速行B>",
 	[52] 				= "<死神隊長B>",
	[53] 				= "<急速進攻B>",
	[54] 				= "<戰地醫生B>",
	[55] 				= "<急速防禦B>",
	[56] 				= "<要害打擊B>",
	[57] 				= "<急速戰術B>",
	[58] 				= "<作戰意識B>",
	[59] 				= "<快去抽人B>",

    [60] 				= "<獨行長路B>",

	[61] 				= "<蓄勢待發B>", 
	[62] 				= "<終極獵手B>", 
	[63] 				= "<醫學背景B>", 
	[64] 				= "請按E鍵抽取", 
	[65] 				= "請按E鍵抽取", 
	[66] 				= "請按E鍵抽取", 
	[67] 				= "請按E鍵抽取", 
	[68] 				= "請按E鍵抽取", 
	[69] 				= "請按E鍵抽取", 

	[70] 				= "請按E鍵抽取",  

	[71] 				= "<核心充能C>",
 	[72] 				= "<護盾充能C>",
	[73] 				= "<電磁手雷C>",
	[74] 				= "<PTSD C>",
	[75] 				= "<鬼影小隊C>",
	[76] 				= "<毀滅收割C>",
	[77] 				= "<寧死不屈C>",
	[78] 				= "<玩北玩的C>",
	[79] 				= "<膝蓋改裝C>",

    [80] 				= "<決不放棄C>",

	[81] 				= "<能量轉換C>", 
	[82] 				= "<相位引擎C>", 
	[83] 				= "<倚老賣老C>", 
	[84] 				= "請按E鍵抽取", 
	[85] 				= "請按E鍵抽取", 
	[86] 				= "請按E鍵抽取", 
	[87] 				= "請按E鍵抽取", 
	[88] 				= "請按E鍵抽取", 
	[89] 				= "請按E鍵抽取", 

	[90] 				= "請按E鍵抽取",  

	[91] 				= "<核心充能D>",
 	[92] 				= "<近身訓練D>",
	[93] 				= "<漂移集氣D>",
	[94] 				= "<友軍之災D>",
	[95] 				= "<沖刺裝彈D>",
	[96] 				= "<護盾充能D>",
	[97] 				= "<幽默援軍D>",
	[98] 				= "<嚴肅援軍D>",
	[99] 				= "<一路小跑D>",

    [100] 				= "<救命稻草D>",

	[101] 				= "<見招拆招D>", 
	[102] 				= "<鋼鐵利爪D>", 
	[103] 				= "<充能防禦D>", 
	[104] 				= "請按E鍵抽取", 
	[105] 				= "請按E鍵抽取", 
	[106] 				= "請按E鍵抽取", 
	[107] 				= "請按E鍵抽取", 
	[108] 				= "請按E鍵抽取", 
	[109] 				= "請按E鍵抽取", 

	[110] 				= "請按E鍵抽取",  

}

table < int, string > debuffdescriptions = {
        
    [0] 				= "請按E鍵抽取",  

	[11] 				= "<連線受損S>",
 	[12] 				= "<劣質電池S>",
	[13] 				= "<心中有愧S>",
	[14] 				= "<一碰就碎S>",
	[15] 				= "<寸步難行S>",
	[16] 				= "<同生共死S>",
	[17] 				= "<鏈接超時S>",
	[18] 				= "<定時炸彈S>",
	[19] 				= "<劣質彈藥S>",

    [20] 				= "<機魂不悅S>",

	[21] 				= "<不息惡火S>", 
	[22] 				= "<頭號通緝S>", 
	[23] 				= "<擬真損傷S>", 
	[24] 				= "請按E鍵抽取", 
	[25] 				= "請按E鍵抽取", 
	[26] 				= "請按E鍵抽取", 
	[27] 				= "請按E鍵抽取", 
	[28] 				= "請按E鍵抽取", 
	[29] 				= "請按E鍵抽取", 

	[30] 				= "請按E鍵抽取",  

	[31] 				= "<外殼無效A>",
 	[32] 				= "<負面隨機A>",
	[33] 				= "<輕裝上陣A>",
	[34] 				= "<內鬼改裝A>",
	[35] 				= "<動力不足A>",
	[36] 				= "<劣質裝甲A>",
	[37] 				= "<無效得分A>",
	[38] 				= "<心中有愧A>",
	[39] 				= "<舍命突襲A>",

    [40] 				= "<以逸待勞A>",  

	[41] 				= "<門沒關好A>", 
	[42] 				= "<典型病狀A>", 
	[43] 				= "<能量過載A>", 
	[44] 				= "請按E鍵抽取", 
	[45] 				= "請按E鍵抽取", 
	[46] 				= "請按E鍵抽取", 
	[47] 				= "請按E鍵抽取", 
	[48] 				= "請按E鍵抽取", 
	[49] 				= "請按E鍵抽取", 

	[50] 				= "請按E鍵抽取", 

    [51] 				= "<連線異常B>",
 	[52] 				= "<後勤之敵B>",
	[53] 				= "<劣質裝甲B>",
	[54] 				= "<賠本買賣B>",
	[55] 				= "<引人註目B>",
	[56] 				= "<進攻缺失B>",
	[57] 				= "<防禦缺失B>",
	[58] 				= "<戰術缺失B>",
	[59] 				= "<門沒關好B>",

    [60] 				= "<心不在焉B>",  

	[61] 				= "<傳統護盾B>", 
	[62] 				= "<積重難返B>", 
	[63] 				= "<制動失靈B>", 
	[64] 				= "請按E鍵抽取", 
	[65] 				= "請按E鍵抽取", 
	[66] 				= "請按E鍵抽取", 
	[67] 				= "請按E鍵抽取", 
	[68] 				= "請按E鍵抽取", 
	[69] 				= "請按E鍵抽取", 

	[70] 				= "請按E鍵抽取",  

	[71] 				= "<動力不足C>",
 	[72] 				= "<引人註目C>",
	[73] 				= "<新手司機C>",
	[74] 				= "<視覺過載C>",
	[75] 				= "<穩紮穩打C>",
	[76] 				= "<心慈手軟C>",
	[77] 				= "<玩玩烈焰C>",
	[78] 				= "<輻射易傷C>",
	[79] 				= "<動力不足C>",

    [80] 				= "<消極態度C>", 

	[81] 				= "<反手無力C>", 
	[82] 				= "<下盤不穩C>", 
	[83] 				= "<回光返照C>", 
	[84] 				= "請按E鍵抽取", 
	[85] 				= "請按E鍵抽取", 
	[86] 				= "請按E鍵抽取", 
	[87] 				= "請按E鍵抽取", 
	[88] 				= "請按E鍵抽取", 
	[89] 				= "請按E鍵抽取", 

	[90] 				= "請按E鍵抽取",  

	[91] 				= "<好好練槍D>",
 	[92] 				= "<舍命突襲D>",
	[93] 				= "<手忙腳亂D>",
	[94] 				= "<老式彈藥D>",
	[95] 				= "<模糊不清D>",
	[96] 				= "<退無可退D>",
	[97] 				= "<護盾缺失D>",
	[98] 				= "<妳別架了D>",
	[99] 				= "<脆弱核心D>",

    [100] 				= "<破綻百出D>",  

	[101] 				= "<畏手畏腳D>", 
	[102] 				= "<嬌生慣養D>", 
	[103] 				= "<酒後駕駛D>", 
	[104] 				= "請按E鍵抽取", 
	[105] 				= "請按E鍵抽取", 
	[106] 				= "請按E鍵抽取", 
	[107] 				= "請按E鍵抽取", 
	[108] 				= "請按E鍵抽取", 
	[109] 				= "請按E鍵抽取", 

	[110] 				= "請按E鍵抽取",  

}

void function status_display_init() {
    AddCallback_OnPlayerRespawned(OnPlayerRespawn)
		AddSpawnCallback( "npc_titan", titanspawn )

	file.index = PrecacheParticleSystem( DEPLOYABLE_SHIELD_FX_AMPED )
	PrecacheModel( $"models/fx/xo_shield.mdl" )
}

void function titanspawn(entity titan){

	thread bbshield( titan, titan.GetOrigin() , <0,0,-20>)

}

void function OnPlayerRespawn(entity player) {
    thread OnPlayerRespawnImpl(player)
}

void function OnPlayerRespawnImpl(entity player) {
    if (IsValid(player)) {
        thread DisplayHealth(player)
    }
}

void function DisplayHealth(entity player) {

	int playersbuffnum = expect int(player.s.buff)
	int playersdebuffnum = expect int(player.s.debuff)

    player.EndSignal("OnDestroy");
    player.EndSignal("OnDeath");

    string id_hp = UniqueString("kk_health#")
    string id_shp = UniqueString("kk_shield_health#")
    string id_vel = UniqueString("kk_velocity#")
    if (DISPLAY_HEALTH)
        NSCreateStatusMessageOnPlayer(player, "", "当前Buff: unknown", id_hp)
    if (DISPLAY_SHIELD)
        NSCreateStatusMessageOnPlayer(player, "", "当前Debuff: unknown", id_shp)
    //if (DISPLAY_VELOCITY)
        //NSCreateStatusMessageOnPlayer(player, "", "当前速度: unknown", id_vel)

    OnThreadEnd(
        function() : (player, id_hp, id_shp, id_vel) {
            if (DISPLAY_HEALTH)
                NSDeleteStatusMessageOnPlayer(player, id_hp)
            if (DISPLAY_SHIELD)
                NSDeleteStatusMessageOnPlayer(player, id_shp)
            //if (DISPLAY_VELOCITY)
                //NSDeleteStatusMessageOnPlayer(player, id_vel)
        }
    )

    while (true) {
        if (!IsValid(player) || !IsAlive(player))
            break
        int buff = expect int(player.s.buff)
        int debuff = expect int(player.s.debuff)
        //int shp_max

        if (DISPLAY_HEALTH)
            NSEditStatusMessageOnPlayer(player, "", "当前Buff: " + buffdescriptions[buff] , id_hp)
        if (DISPLAY_SHIELD)

            NSEditStatusMessageOnPlayer(player, "", "当前Debuff: " + debuffdescriptions[debuff]  , id_shp)
            

        //if (DISPLAY_VELOCITY)
            //NSEditStatusMessageOnPlayer(player, "", "当前速度: " + velStr, id_vel)
        

		if(!player.s.hasshowbuff){
			//print("hasntshow")

			int playersbuffnum = expect int(player.s.buff)
        	int playersdebuffnum = expect int(player.s.debuff)

			if(!player.s.hasshowbuffmessage){
				if(playersbuffnum == 0){
					NSSendAnnouncementMessageToPlayer(player, "按下交互鍵（默認是“E”）來抽取buff！","", <41,171,224>, 10, 5)
					player.s.hasshowbuffmessage <- true
				}
			}

			if(playersbuffnum != 0 ){


				Chat_ServerPrivateMessage( player,  playerbuffdescriptions[playersbuffnum], false, true )
				Chat_ServerPrivateMessage( player,  playerdebuffdescriptions[playersdebuffnum], false, true )

				player.s.hasshowbuff <- true
					//print("showbuffdone")

			}
			
		}

		wait 1

    }
}

void function bbshield( entity titan, vector origin, vector angles ){
	wait 1
	if(IsValid(titan) && IsAlive(titan)){
		Assert( titan )
		//EmitSoundOnEntity( titan, "Hardcover_Shield_Start_3P" )
		titan.SetBlocksRadiusDamage( true )

		vector fwd = AnglesToForward( angles )
		vector up = AnglesToUp( angles )
		origin = origin// - (fwd * (DEPLOYABLE_SHIELD_RADIUS - 1.0))
		origin = origin - (up * 1.0)

		entity shieldFX = StartParticleEffectInWorld_ReturnEntity( file.index, origin, angles )
		
		//entity titan = titan.GetPetTitan()
		vector origin = titan.GetOrigin()
		shieldFX.SetOrigin(origin)
		shieldFX.SetParent(titan)


		angles = AnglesCompose( angles, <0,180,0> )
		
		entity bubbleShield = CreatePropDynamic( $"models/fx/xo_shield.mdl", origin, angles, SOLID_VPHYSICS )
		bubbleShield.kv.contents = (int(bubbleShield.kv.contents) | CONTENTS_NOGRAPPLE)
		bubbleShield.kv.CollisionGroup = TRACE_COLLISION_GROUP_BLOCK_WEAPONS_AND_PHYSICS
		bubbleShield.SetPassThroughFlags( PTF_ADDS_MODS | PTF_NO_DMG_ON_PASS_THROUGH )
		bubbleShield.SetBlocksRadiusDamage( true )
		bubbleShield.kv.rendercolor =  Vector(102,65,195)
		
		bubbleShield.SetTakeDamageType( DAMAGE_NO)
		bubbleShield.SetDamageNotifications( true )
		bubbleShield.SetMaxHealth( 50000 )
		bubbleShield.SetHealth( 50000 )
		
		bubbleShield.EndSignal( "OnDestroy" )
		SetVisibleEntitiesInConeQueriableEnabled( bubbleShield, true )

		SetTeam( bubbleShield, TEAM_BOTH )

		bubbleShield.SetPassThroughThickness( 0.5 )
		bubbleShield.SetPassThroughDirection( -1 )
		StatusEffect_AddTimed( bubbleShield, eStatusEffect.pass_through_amps_weapon, 1.0, 3, 0.0 )

		CreateAirShakeRumbleOnly( origin, 16, 150, 0.6, 150 )
	

	OnThreadEnd(
		function() : ( bubbleShield, titan, shieldFX )
		{
			//StopSoundOnEntity( titan, "Hardcover_Shield_Start_3P" )
			//EmitSoundOnEntity( titan, "Hardcover_Shield_End_3P" )

			if ( IsValid( bubbleShield ) )
				bubbleShield.Destroy()

			if ( IsValid( shieldFX ) )
				shieldFX.Destroy()
		}
	)
	

	wait 6

		if ( IsValid( bubbleShield ) )
			bubbleShield.Destroy()

		if ( IsValid( shieldFX ) )
			shieldFX.Destroy()
	}

}