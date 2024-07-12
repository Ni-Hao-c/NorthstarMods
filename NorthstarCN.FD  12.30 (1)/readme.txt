源项目地址：https://github.com/Zanieon/NorthstarMods/tree/gamemode_fd_experimental
//=============================================================//

 启动边境模式后 随机地图轮换 起码2023年9月1日的版本是这样的。

 {_gamemode_fd文件下 最后的函数 CheckMap() 控制地图轮换}
如果你想正常返回大厅，请注释掉1157行的CheckMap() ，启用 SetGameState(eGameState.Postmatch)

	//CheckMap() 
	SetGameState(eGameState.Postmatch)
//=============================================================//
## 说明
在此文件夹下的 mod.josn 修改 DefaultValue 来调整参数 0代表默认 1代表启用

>>"Name": "ns_use_phase_fix",  
"DefaultValue": "0"   
 //启用相位修复  
>>"Name": "ns_ronin_fair_phase",  
"DefaultValue": "0"  
//浪人相位重叠不会被杀死  
"Name": "ns_fd_min_numplayers_to_start",  
"DefaultValue": "1"  
//最小开始人数   
"Name": "ns_fd_allow_elite_titans",  
"DefaultValue": "0"  
//生成精英泰坦（更强血量跟厚）  
"Name": "ns_fd_allow_true_shield_captains",  
"DefaultValue": "0"     
//生成步兵队长（更强血量跟厚）    
"Name": "ns_fd_allow_titanfall_block",  
"DefaultValue": "0"  
//轨道事件？ 在波次中让玩家不在降落泰坦  
"Name": "ns_fd_arc_titans_uses_arc_cannon",  
"DefaultValue": "0"  
//让电弧泰坦使用电弧炮（等待cn更新，暂时不能使用）  
"Name": "ns_fd_show_drop_points",  
"DefaultValue": "0"   
//泰坦死神展示降落点   
"Name": "ns_fd_easymode_smartpistol",  
"DefaultValue": "1"  
//简单模式中让手枪替换为自瞄手枪   
"Name": "ns_fd_grunt_at_weapon",  
"DefaultValue": "mp_weapon_defender"  
//步兵可以使用的反泰坦武器   
"Name": "ns_fd_grunt_primary_weapon",  
"DefaultValue": "mp_weapon_rspn101,mp_weapon_car"   
 //步兵可以使用的武器   
"Name": "ns_fd_grunt_grenade",
"DefaultValue": "mp_weapon_frag_grenade"  
//步兵可以使用的手雷   
"Name": "ns_fd_spectre_primary_weapon",  
"DefaultValue": "mp_weapon_hemlok,mp_weapon_vinson"   
//幽灵战士可以使用的步枪  
"Name": "ns_fd_disable_respawn_dropship",  
"DefaultValue": "0"  
//运输船投放步兵  
"Name": "ns_fd_differentiate_ticks",  
"DefaultValue": "0"  
//死神生成的炸猪使用不同的模型  
"Name": "ns_fd_rodeo_highlight",  
"DefaultValue": "1"  
//训牛时高亮  
"Name": "ns_reaper_warpfall_kill",  
"DefaultValue": "1"  
//死神降落击杀  

//=============================================================//

这些是播放列表覆盖，您可以包含在服务器设置中，以更好地控制匹配的行为方式：

你实际上可以强迫咕噜在大师和疯狂困难之外使用反泰坦武器，使用你想使用的AT武器的咕噜数量，可以从1增加到4，这是基于掉落舱的小队，所以4将是所有使用它们的咕噜声fd_grunt_at_weapon_users
您也可以使用 对护盾队长执行相同的操作，相同的规则适用于上述设置。fd_grunt_shield_captains
使用边境防御的这个分支，可以使用 更改波之间的时间，默认值为 60 秒 fd_wave_buy_time
可以通过设置为 0 来启用捡起电池的行为，因此在泰坦捡起电池时会跑过电池 rodeo_battery_disembark_to_pickup