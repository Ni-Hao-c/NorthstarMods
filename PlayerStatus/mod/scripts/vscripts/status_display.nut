untyped
global function status_display_init
global function cancelshield
//global function bbshield

const bool DISPLAY_HEALTH = true
const bool DISPLAY_SHIELD = true

const DEPLOYABLE_SHIELD_FX_AMPED = $"P_bubble_shield"
const string0 = "重生护盾将在你进行除移动外的任何操作(包括抽buff)时解除，若对当前复活点不满意，可以长按 蹲 进行自毁，不计入死亡次数"
const string1 = "自毁: "
const string2 = "["
const string3 = "/"
const string4 = "-"
const string5 = "]"

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

	[11] 				= "\x1b[31m<致命一击S>\x1b[0m：按住E时进入抹杀模式，以极高的自我伤害为代价，使你的攻击秒杀敌人！（待更新）",
 	[12] 				= "\x1b[31m<生命恢复S>\x1b[0m：你每秒恢复500HP",
	[13] 				= "\x1b[31m<无声无息S>\x1b[0m：你的模型隐藏",
	[14] 				= "\x1b[31m<高效作战S>\x1b[0m：在你死亡之前，你的得分效率X5（待更新）",
	[15] 				= "\x1b[31m<防弹改装S>\x1b[0m：你受到弱点伤害略微提升，但弱点以外伤害大幅降低",
	[16] 				= "\x1b[31m<针锋相对S>\x1b[0m：你获得针锋相对模式脉冲刀，命中秒杀敌人且清空其分数",
	[17] 				= "\x1b[31m<同归于尽S>\x1b[0m：你的下一次攻击秒杀目标与自己",
	[18] 				= "\x1b[31m<无动于衷S>\x1b[0m：当你低头时，受到的任何种类伤害降低（秒杀除外）。视角越低，减伤越高。最高-95%",
	[19] 				= "\x1b[31m<非法改装S>\x1b[0m：你造成的任何伤害都将为你恢复等量的HP",

	[20] 				= "\x1b[31m<无法触及S>\x1b[0m：你有80%的概率闪避任意伤害",  
	
	[21] 				= "\x1b[31m<机体重塑S>\x1b[0m：你的机体更换为<破舰者>。按住空格会加速积攒动能，基于速度造成撞击伤害与击退，但受到由弱到强的自我伤害",  
	[22] 				= "\x1b[31m<空间撕裂S>\x1b[0m：你获得破空大剑，大范围，高伤害，无限攻击距离" ,
	[23] 				= "\x1b[31m<维度逃逸S>\x1b[0m：你可以按住E预备<维度逃逸>，此状态下受到伤害时固定为100点，且进入相位空间0.5s" ,
	[24] 				= "\x1b[31m<复仇反击S>\x1b[0m：受到伤害时向攻击者反弹该伤害的200%，若被暴击则改为400%" ,
	[25] 				= "\x1b[31m<痛觉无效S>\x1b[0m：受到伤害时无敌0.5秒，若伤害超过1000，改为2秒" ,
	[26] 				= "\x1b[31m<无尽壁垒S>\x1b[0m：你可以按E消耗100血量换取500护盾，无冷却" ,
	[27] 				= "\x1b[31m<屹立不倒S>\x1b[0m：你受到致死伤害时不会死亡，在接下来20秒内攻击力+330%，且生命值不会低于1，时间结束后强制死亡" ,
	[28] 				= "\x1b[31m<意志坚定S>\x1b[0m：你毁灭状态只受近战和处决伤害" ,
	[29] 				= "\x1b[31m<落井下石S>\x1b[0m：攻击有概率附带800点伤害，概率等于目标已损失生命值比例，毁灭状态视为100%" ,

	[30] 				= "\x1b[96m请按E键抽取\x1b[0m",  
（待更新）
	[31] 				= "\x1b[33m<攻击强化A>\x1b[0m：按住E时进入狩猎模式，此时你受到自我伤害，且你的攻击让敌人进入毁灭状态！你无法对毁灭姿态的敌人造成伤害。（待更新）",
 	[32] 				= "\x1b[33m<正向随机A>\x1b[0m：你的伤害随机增加50%~200%",
	[33] 				= "\x1b[33m<超级机种A>\x1b[0m：你的血量上限随机增加50%~200%",
	[34] 				= "\x1b[33m<后勤之友A>\x1b[0m：你的主武器弹药无限",
	[35] 				= "\x1b[33m<能量充盈A>\x1b[0m：你的核心自然回复速度极大幅增加,帝王仅能回复四次",
	[36] 				= "\x1b[33m<枪斗专精A>\x1b[0m：你冲刺时主武器弹药装满,所有技能立即刷新",
	[37] 				= "\x1b[33m<势大力沉A>\x1b[0m：你的任何攻击都附带大幅度击退",
	[38] 				= "\x1b[33m<毒蛇推进A>\x1b[0m：你的冲刺力度极大幅增强",
	[39] 				= "\x1b[33m<瑞克7代A>\x1b[0m：你的电子烟雾使敌人10秒内无法移动",

	[40] 				= "\x1b[33m<反演入侵A>\x1b[0m：你受到任意伤害时，攻击者减速90%，并被声呐探测",

	[41] 				= "\x1b[33m<爆反装甲A>\x1b[0m：你受到任意伤害时，对周围所有敌方造成350点伤害",
	[42] 				= "\x1b[33m<能量聚集A>\x1b[0m：你可以受到友方的伤害，但仅承受其中25%，剩余的75%存储，攻击敌方时，消耗所有存储的伤害，提升等量攻击力",
	[43] 				= "\x1b[33m<博格装甲A>\x1b[0m：你受到连续受到同种伤害时，乘算减伤12%，受到不同种伤害时重置",
	[44] 				= "\x1b[33m<势如破竹A>\x1b[0m：你获得击杀时，刷新全部技能cd与核心",
	[45] 				= "\x1b[33m<滴水不漏A>\x1b[0m：你的手持武器正在换弹时，减伤95%",
	[46] 				= "\x1b[33m<见缝插针A>\x1b[0m：你攻击正在换弹的敌人时，伤害+300%",
	[47] 				= "\x1b[33m<摆完挂机A>\x1b[0m：你的核心替换为 镭射核心-Infinite，持续时间无限",
	[48] 				= "\x1b[33m<地狱之火A>\x1b[0m：你的核心替换为 火焰核心-HellFire 与回火改装，消耗血量释放360度铝热剂冲击波与火墙",
	[49] 				= "\x1b[33m<火力覆盖A>\x1b[0m：你的核心替换为 弹群核心-Strike 呼叫空中轰炸持续洗地,注意寻找开阔地形！",

	[50] 				= "\x1b[96m请按E键抽取\x1b[0m",  	

    [51] 				= "\x1b[36m<轻装速行B>\x1b[0m：你的移速增加50%",
 	[52] 				= "\x1b[36m<死神队长B>\x1b[0m：召唤三名死神援军，其中一名为死神队长，极难击溃，请尝试将敌人引导过来",
	[53] 				= "\x1b[36m<急速进攻B>\x1b[0m：你的进攻技能CD减少75%（特殊类型提升其他效果）（待更新）",
	[54] 				= "\x1b[36m<战地医生B>\x1b[0m：你可以攻击队友，为其恢复生命值（每次50点HP）",
	[55] 				= "\x1b[36m<急速防御B>\x1b[0m：你的防御技能CD减少75%（特殊类型提升其他数值）（待更新）",
	[56] 				= "\x1b[36m<要害打击B>\x1b[0m：你的暴击伤害+100%",
	[57] 				= "\x1b[36m<急速战术B>\x1b[0m：你的战术技能CD减少75%（特殊类型提升其他数值）（待更新）",
	[58] 				= "\x1b[36m<作战意识B>\x1b[0m：你的生命值低于一半时，攻击力+100%；你处于毁灭状态时，攻击力+200%；你处于毁灭状态且生命中低于一半时，攻击力+300%",
	[59] 				= "\x1b[36m<快去抽人B>\x1b[0m：你与目标距离越远，伤害越高，最高+100%",      //"\x1b[33m<棒球高手B>\x1b[0m：你的近战攻击可以击飞敌人",
	
	[60] 				= "\x1b[36m<独行长路B>\x1b[0m：一定范围内无队友时，你造成的伤害+80%",     

	[61] 				= "\x1b[36m<蓄势待发B>\x1b[0m：你未造成伤害时，下次伤害每秒+15%，最高+330%，造成伤害后重置",  
	[62] 				= "\x1b[36m<终极猎手B>\x1b[0m：每有一个处于核心状态的队友，你的士气等级提升1（伤害+60%）",     
	[63] 				= "\x1b[36m<医学背景B>\x1b[0m：你完全免疫自我伤害，反而每次伤害回复当次伤害的一半",  
	[64] 				= "\x1b[36m<致命节奏B>\x1b[0m：每造成四次伤害，下一次伤害+200%",  
	[65] 				= "\x1b[36m<只会大招B>\x1b[0m：你同时拥有四种核心，核心值满时可以释放其中任意一种，每秒获得一定核心值（待更新）",  
	[66] 				= "\x1b[36m<借力打力B>\x1b[0m：你的攻击附带上次受到伤害的值，最多储存一次",  
	[67] 				= "\x1b[36m<对症下药B>\x1b[0m：你攻击持有buff的敌人时，根据其buff等级由低到高，获得25%~125%的伤害加成（待更新）",  
	[68] 				= "\x1b[36m<弱肉强食B>\x1b[0m：你可以处决血量低于你的非毁灭状态目标",  
	[69] 				= "\x1b[36m<食腐习性B>\x1b[0m：周围有泰坦死亡时，你回复1000生命值",  

	[70] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[71] 				= "\x1b[34m<核心充能C>\x1b[0m：核心立即就绪",
 	[72] 				= "\x1b[34m<护盾充能C>\x1b[0m：护盾立即充满",
	[73] 				= "\x1b[34m<电磁手雷C>\x1b[0m：进攻技能替换为全息致盲幻影手雷（待更新）",
	[74] 				= "\x1b[34m<PTSD C>\x1b[0m:你下次攻击造成3075点伤害",
	[75] 				= "\x1b[34m<鬼影小队C>\x1b[0m：你间歇性隐身",
	[76] 				= "\x1b[34m<毁灭收割C>\x1b[0m：你对毁灭状态的敌人伤害+200%",     //"\x1b[34m<近战击退C>\x1b[0m：你的近战攻击强而有力",
	[77] 				= "\x1b[34m<宁死不屈C>\x1b[0m：你死亡后生成一次核爆",
	[78] 				= "\x1b[34m<玩北玩的C>\x1b[0m：给予毒蛇电浆磁轨炮（2号武器位，有特殊强化）",
	[79] 				= "\x1b[34m<膝盖改装C>\x1b[0m：长按冲刺可以跳跃，短按则正常冲刺",
	
	[80] 				= "\x1b[34m<决不放弃C>\x1b[0m：你在毁灭状态自然恢复生命值",

	[81] 				= "\x1b[34m<能量转换C>\x1b[0m：你受到任意伤害后均回复少量核心值",
	[82] 				= "\x1b[34m<相位引擎C>\x1b[0m：你按住E时，冲刺变为相位冲刺（战术缺失时无法使用）（待更新）",
	[83] 				= "\x1b[34m<倚老卖老C>\x1b[0m：你在毁灭状态受到的任意伤害-80%",
	[84] 				= "\x1b[34m<奇迹力场C>\x1b[0m：生命值百分比越低，闪避率越高，最高30%",  
	[85] 				= "\x1b[34m<末影珍珠C>\x1b[0m：你获得末影珍珠",  
	[86] 				= "\x1b[34m<牢大支援C>\x1b[0m：你可以按E消耗5000分呼叫牢大支援(2500伤害)",  
	[87] 				= "\x1b[34m<叹息之壁C>\x1b[0m：你受到敌方泰坦的伤害最高为150点(磁轨炮除外)",  
	[88] 				= "\x1b[34m<完美击球C>\x1b[0m：你的近战攻击可以将敌人超大力度击退",  
	[89] 				= "\x1b[34m<折戟浴血C>\x1b[0m：你的近战攻击造成伤害时额外恢复50%核心",  

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
	[104] 				= "<一合残像D>：你冲刺产生幻影，本体隐身", 
	[105] 				= "<蒸蒸日上D>：你获得击杀后播报", 
	[106] 				= "<顺手牵羊D>：你造成伤害后偷取200分", 
	[107] 				= "<破财消灾D>：你可以按E消耗1000分数获得200点护盾", 
	[108] 				= "<心高气傲D>：你不可被处决", 
	[109] 				= "<杀戮幻觉D>：你造成伤害时有概率额外获得10000分", 

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
	[24] 				= "\x1b[31m<去量深化S>\x1b[0m：你受到任意伤害时，有概率额外增加1点、10点、100点、1000点或10000点",
	[25] 				= "\x1b[31m<手摇发电S>\x1b[0m：你无法造成任何伤害，仅能通过按F，概率增加可以造成伤害的次数，最多持有10次",
	[26] 				= "\x1b[31m<命悬一线S>\x1b[0m：你每隔5秒掷一次骰子，连续掷得同一点数立即死亡",
	[27] 				= "\x1b[31m<核心危殆S>\x1b[0m：你立即进入毁灭状态",
	[28] 				= "\x1b[31m<人格分裂S>\x1b[0m：你瞄向敌人或队友时有概率看向别处",
	[29] 				= "\x1b[31m<手足相残S>\x1b[0m：你只能对与你同种机体造成伤害",

	[30] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[31] 				= "\x1b[33m<外壳无效A>\x1b[0m：你受到任何伤害时，有5%的概率直接进入毁灭状态",
 	[32] 				= "\x1b[33m<负面随机A>\x1b[0m：你的伤害随机浮动-30%~-60%",
	[33] 				= "\x1b[33m<轻装上阵A>\x1b[0m：你的血量上限随机浮动-30%~-60%",
	[34] 				= "\x1b[33m<内鬼改装A>\x1b[0m：你的攻击有1/3的概率不造成伤害，反而为目标恢复等量HP",
	[35] 				= "\x1b[33m<动力不足A>\x1b[0m：你的移速减半，且只能步行",
	[36] 				= "\x1b[33m<劣质装甲A>\x1b[0m：你受到的任何伤害+100%",
	[37] 				= "\x1b[33m<无效得分A>\x1b[0m：你死亡时清空得分",
	[38] 				= "\x1b[33m<心中有愧A>\x1b[0m：你造成击杀时扣除1500HP",
	[39] 				= "\x1b[33m<舍命突袭A>\x1b[0m：你冲刺时扣除1000HP",

	[40] 				= "\x1b[33m<以逸待劳A>\x1b[0m：你移动时每秒扣除80HP",

	[41] 				= "\x1b[33m<门没关好A>\x1b[0m：你受到的暴击伤害+1000%（没看错）",
	[42] 				= "\x1b[33m<典型症状A>\x1b[0m：你造成伤害时有20%的概率开始换弹",
	[43] 				= "\x1b[33m<能量过载A>\x1b[0m：你释放核心时自爆死亡",
	[44] 				= "\x1b[33m<低效杀伤A>\x1b[0m：你造成的伤害降低80点固定值",
	[45] 				= "\x1b[33m<尊老爱幼A>\x1b[0m：你无法对转生等级相差10以上的玩家造成伤害",
	[46] 				= "\x1b[33m<血肉畸变A>\x1b[0m：你的主武器弹容与换弹速度减半，技能冷却速度-75%",
	[47] 				= "\x1b[33m<痛觉残留A>\x1b[0m：你每次被攻击过一次，受到的最终伤害+5，叠加次数无限",
	[48] 				= "\x1b[33m<血压失序A>\x1b[0m：你的血压在你攻击敌人时下降，被敌人攻击时上升，都没有时则缓慢回归正常水平，超出一定范围立即死亡",
	[49] 				= "\x1b[33m<断线重连A>\x1b[0m：3秒后进入断线状态，合适时机按E重连，但每次失败扣除500hp，失败3次被踢出",

	[50] 				= "\x1b[96m请按E键抽取\x1b[0m",  

    [51] 				= "\x1b[36m<连线异常B>\x1b[0m：你间歇性无法移动",
 	[52] 				= "\x1b[36m<后勤之敌B>\x1b[0m：你的主武器弹容减半",
	[53] 				= "\x1b[36m<劣质装甲B>\x1b[0m：你的生命值低于一半时，受到的任何伤害+100%",
	[54] 				= "\x1b[36m<赔本买卖B>\x1b[0m：立即扣除50%HP",
	[55] 				= "\x1b[36m<引人注目B>\x1b[0m：你永久被声呐探测",
	[56] 				= "\x1b[36m<进攻缺失B>\x1b[0m：你的进攻技能冷却时间+100%（特殊类型降低其他数值）",
	[57] 				= "\x1b[36m<防御缺失B>\x1b[0m：你的防御技能冷却时间+100%（特殊类型降低其他数值）",
	[58] 				= "\x1b[36m<战术缺失B>\x1b[0m：你的战术技能冷却时间+100%（特殊类型降低其他数值）",
	[59] 				= "\x1b[36m<门没关好B>\x1b[0m：你受到的暴击伤害+100%",

	[60] 				= "\x1b[36m<心不在焉B>\x1b[0m：你的攻击有30%的概率未命中",  

	[61] 				= "\x1b[36m<传统护盾B>\x1b[0m：你的护盾值越高，移动速度越低",  
	[62] 				= "\x1b[36m<积重难返B>\x1b[0m：你的转生等级每有一级，伤害降低2%，最多降低至30%",    
	[63] 				= "\x1b[36m<制动失灵B>\x1b[0m：你的机体失去制动能力",  
	[64] 				= "\x1b[36m<恶有恶报B>\x1b[0m：生命值一半以上时，每造成100点伤害叠加一层<罪业>，生命值一半以下时，每层<罪业>提升1%受到的伤害",  
	[65] 				= "\x1b[36m<新兵蛋子B>\x1b[0m：你的换弹时间加倍",  
	[66] 				= "\x1b[36m<卓尔不群B>\x1b[0m：你周围有队友时，攻击力下降50%",  
	[67] 				= "\x1b[36m<违规停车B>\x1b[0m：你不移动时每秒扣除1000分数，分数不足改为扣除同等血量",  
	[68] 				= "\x1b[36m<引力异常B>\x1b[0m：攻击你的敌人会被拉向你，在你处于毁灭状态时力度增大",  
	[69] 				= "\x1b[36m<倒霉透顶B>\x1b[0m：你头顶有遮挡时重力反转",  

	[70] 				= "\x1b[96m请按E键抽取\x1b[0m",  

	[71] 				= "\x1b[34m<动力不足C>\x1b[0m：你的移速降低30%，且只能步行",
 	[72] 				= "\x1b[34m<引人注目C>\x1b[0m：你造成击杀时获得20S声呐",
	[73] 				= "\x1b[34m<新手司机C>\x1b[0m：你的转向速度降低30%",
	[74] 				= "\x1b[34m<视觉过载C>\x1b[0m：你造成击杀时失明5S",
	[75] 				= "\x1b[34m<稳扎稳打C>\x1b[0m：你失去冲刺",
	[76] 				= "\x1b[34m<心慈手软C>\x1b[0m：你对毁灭状态的敌人伤害-66%",
	[77] 				= "\x1b[34m<玩玩烈焰C>\x1b[0m：你的装备组替换为无装备烈焰（待更新）",
	[78] 				= "\x1b[34m<辐射易伤C>\x1b[0m：你头顶无遮挡时被辐射伤害",
	[79] 				= "\x1b[34m<动力不足C>\x1b[0m：你间歇性移速降低",

	[80] 				= "\x1b[34m<消极态度C>\x1b[0m：你在毁灭状态自然流失生命值", 

	[81] 				= "\x1b[34m<反手无力C>\x1b[0m：你暴击时不再造成伤害", 
	[82] 				= "\x1b[34m<下盘不稳C>\x1b[0m：你受到伤害时更容易被击退", 
	[83] 				= "\x1b[34m<麻木不仁C>\x1b[0m：你不处于毁灭状态时降低20%伤害", 
	[84] 				= "\x1b[34m<反向阻滞C>\x1b[0m：被你攻击的敌人加速30%", 
	[85] 				= "\x1b[34m<疲劳驾驶C>\x1b[0m：你每获得一次击杀，伤害降低10%", 
	[86] 				= "\x1b[34m<专注失调C>\x1b[0m：每隔10秒，你的视角随机移动1次", 
	[87] 				= "\x1b[34m<地形劣势C>\x1b[0m：你攻击高处目标伤害-50%，高处目标攻击你伤害+50%", 
	[88] 				= "\x1b[34m<三心二意C>\x1b[0m：若你攻击的目标与上一次相同，伤害减半", 
	[89] 				= "\x1b[34m<火控失效C>\x1b[0m：按下攻击键时有概率受到较大后坐力", 

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
	[104] 				= "<持续创伤D>：你受到的伤害增加30点固定值",
	[105] 				= "<只通一窍D>：你首次造成伤害后，后续只有这种伤害正常比例，其他种类伤害减半,",
	[106] 				= "<神经退行D>：你在15秒内无法移动与转向",
	[107] 				= "<一心一意D>：你对一名敌人造成伤害后,除非由你击杀这名敌人,否则对其他敌人伤害减半",
	[108] 				= "<信号干扰D>：你的延迟增加150%",
	[109] 				= "<信息泄露D>：被你瞄准的敌人会被提示",

	[110] 				= "\x1b[96m请按E键抽取\x1b[0m",  
}

table < int, string > buffdescriptions = {

    [0] 				= "請按E鍵抽取",  

	[11] 				= "<致命一擊S>",
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
	[24] 				= "<復仇反擊S>", 
	[25] 				= "<痛覺無效S>", 
	[26] 				= "<無盡壁壘S>", 
	[27] 				= "<屹立不倒S>", 
	[28] 				= "<意誌堅定S>", 
	[29] 				= "<落井下石S>", 

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
	[44] 				= "<勢如破竹A>", 
	[45] 				= "<滴水不漏A>", 
	[46] 				= "<見縫插針A>", 
	[47] 				= "<擺完掛機A>", 
	[48] 				= "<地獄之火A>", 
	[49] 				= "<火力覆蓋A>", 

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
	[64] 				= "<致命節奏B>", 
	[65] 				= "<只會大招B>", 
	[66] 				= "<借力打力B>", 
	[67] 				= "<對病下藥B>", 
	[68] 				= "<弱肉強食B>", 
	[69] 				= "<食腐習性B>", 

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
	[84] 				= "<奇跡力場C>", 
	[85] 				= "<末影珍珠C>", 
	[86] 				= "<牢大支援C>", 
	[87] 				= "<嘆息之壁C>", 
	[88] 				= "<完美擊球C>", 
	[89] 				= "<折戟浴血C>", 

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
	[104] 				= "<一合殘像D>", 
	[105] 				= "<蒸蒸日上D>", 
	[106] 				= "<順手牽羊D>", 
	[107] 				= "<破財消災D>", 
	[108] 				= "<心高氣傲D>", 
	[109] 				= "<殺戮幻覺D>", 

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
	[24] 				= "<去量深化S>", 
	[25] 				= "<手搖發電S>", 
	[26] 				= "<命懸一線S>", 
	[27] 				= "<核心危殆S>", 
	[28] 				= "<人格分裂S>", 
	[29] 				= "<手足相殘S>", 

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
	[44] 				= "<低效殺傷A>", 
	[45] 				= "<尊老愛幼A>", 
	[46] 				= "<血肉畸變A>", 
	[47] 				= "<痛覺殘留A>", 
	[48] 				= "<血壓失序A>", 
	[49] 				= "<斷線重連A>", 

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
	[64] 				= "<惡有惡報B>", 
	[65] 				= "<新兵蛋子B>", 
	[66] 				= "<卓爾不群B>", 
	[67] 				= "<違規停車B>", 
	[68] 				= "<引力異常B>", 
	[69] 				= "<倒霉透頂B>", 

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
	[83] 				= "<麻木不仁C>", 
	[84] 				= "<反向阻滯C>", 
	[85] 				= "<疲勞駕駛C>", 
	[86] 				= "<專註失調C>", 
	[87] 				= "<地形劣勢C>", 
	[88] 				= "<三心二意C>", 
	[89] 				= "<火控失效C>", 

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
	[104] 				= "<持續創傷D>", 
	[105] 				= "<只通一竅D>", 
	[106] 				= "<神經退行D>", 
	[107] 				= "<一心一意D>", 
	[108] 				= "<信號幹擾D>", 
	[109] 				= "<信息泄露D>", 

	[110] 				= "請按E鍵抽取",  

}

void function status_display_init() {
    AddCallback_OnPlayerRespawned(OnPlayerRespawn)
	//AddSpawnCallback( "npc_titan", titanspawn )

	AddCallback_OnClientConnected( OnClientConnected )
	

	file.index = PrecacheParticleSystem( DEPLOYABLE_SHIELD_FX_AMPED )
	PrecacheModel( $"models/fx/xo_shield.mdl" )
}

void function titanspawn(entity titan){
	float duration = 10.0
	//thread CreateGenericBubbleShield( titan, titan.GetOrigin() , <0,0,0> , duration)


	//thread CreateParentedBubbleShield( titan, titan.GetOrigin() , <0,0,0> , duration)


}

void function OnClientConnected(entity player)
{
	//AddButtonPressedPlayerInputCallback( player, IN_OFFHAND0, cancelshield )
    //AddButtonPressedPlayerInputCallback( player, IN_OFFHAND1, cancelshield )
   // AddButtonPressedPlayerInputCallback( player, IN_OFFHAND2, cancelshield )
   // AddButtonPressedPlayerInputCallback( player, IN_OFFHAND3, cancelshield )
   // AddButtonPressedPlayerInputCallback( player, IN_OFFHAND4, cancelshield )
   // AddButtonPressedPlayerInputCallback( player, IN_ATTACK, cancelshield )
	//AddButtonPressedPlayerInputCallback( player, IN_USE, cancelshield )
	//AddButtonPressedPlayerInputCallback( player, IN_CROUCH, Selfdestory )
	//thread Selfdestory(player)
}

void function Selfdestory(entity player)
{
	while(true){

		if(IsValid(player) && IsAlive(player)){
			entity soul = player.GetTitanSoul()
			if(IsValid(soul) && IsAlive(soul)){
				if(IsValid(soul.soul.bubbleShield)){
					if(player.IsInputCommandHeld(IN_DUCK)){
						player.s.Selfdestorytime++
						int Selfdestorytimes = expect int(player.s.Selfdestorytime)
						string message1 = ""
						string message2 = ""
						for(int ms1 = 1 ; ms1 < Selfdestorytimes ; ms1++){
							message1 = message1 + string3
						}
						for(int ms2 = 1 ; ms2 < (11-Selfdestorytimes) ; ms2++){
							message2 = message2 + string4
						}

						SendHudMessage(player, string0 +"\n" +string1 + string2 +  message1 + message1 + message1 + message2+ message2+message2 + string5,-1,0.65,60,196,130,1,0,0.5,0) 
					}
					else{
						if(expect int(player.s.Selfdestorytime) > 1){
							player.s.Selfdestorytime--
							
						}
						int Selfdestorytimes = expect int(player.s.Selfdestorytime)
						string message1 = ""
						string message2 = ""
						for(int ms1 = 1 ; ms1 < Selfdestorytimes ; ms1++){
							message1 = message1 + string3
						}
						for(int ms2 = 1 ; ms2 < (11-Selfdestorytimes) ; ms2++){
							message2 = message2 + string4
						}

						SendHudMessage(player, string0 +"\n" +string1 + string2 +  message1 + message1 + message1 + message2+ message2+message2 + string5,-1,0.65,60,196,130,1,0,0.5,0) 

					}
				}
			}
			
		}

		if(IsValid(player) && IsAlive(player)){
			if(expect int(player.s.Selfdestorytime) > 10){
				if(IsValid(player) && IsAlive(player)){
					player.Die(player,null, {damageSourceId = eDamageSourceId.restart})    //直接秒杀
					player.SetPlayerGameStat(PGS_DEATHS , player.GetPlayerGameStat(PGS_DEATHS) - 1)
				}
			}

		}

		wait 0.1
	}
}

void function cancelshield(entity player)
{
	
		return
	
	//CleanupTitanBubbleShieldVars(titan,soul,bbshield)
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
      //  if(gametime == 820)
		//	NSSendAnnouncementMessageToPlayer( player , "最後一分鐘！!","S級對決開啟！！", <41,13,13>, 10, 6)
        

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
				print("////////////////////////////Buff////////////////////////////")
				print(player.GetPlayerName() + " Buff ->  " + buffdescriptions[playersbuffnum])
				print(player.GetPlayerName() + " Debuff ->  " +  debuffdescriptions[playersdebuffnum])

				player.s.hasshowbuff <- true
					//print("showbuffdone")

			}
			
		}

		wait 0.5

    }
}
