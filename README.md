
# NorthstarMods

[Squirrel](http://www.squirrel-lang.org/squirreldoc/reference/index.html) scripts used to recreate server-side gamelogic and add [custom content](https://r2northstar.gitbook.io/r2northstar-wiki/using-northstar/gamemodes) to the game. 

## Contents:

Issues in this repository should be created if they are related to these domains:
- `Northstar.Client` - Localisation files, UI and client-side scripts.
- `Northstar.Coop` - Soon™.
- `Northstar.Custom` - Northstar custom content.
- `Northstar.CustomServer` - Server config files and scripts necessary for multiplayer.


# NorthstarCN.fd
## 开始：
截止2023.8.18，兼容nscn 1.13.5版本


## 来源：

根据nsen 上游的Zanieon的边境文件进行兼容
https://github.com/Zanieon/NorthstarMods/tree/gamemode_fd_experimental

借鉴 VoyageDB来生成额外的npc

https://github.com/DBmaoha/Super.Mixed.Game/

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


