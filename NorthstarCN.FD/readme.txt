源项目地址：https://github.com/Zanieon/NorthstarMods/tree/gamemode_fd_experimental


 启动边境模式后 随机在以下地图轮换
 {_gamemode_fd文件下 最后的函数控制地图轮换}

难度排行
虎大 1 
异常 1.1
黑水 1.2 （小改）
系外 1.4 （小改）
崛起 1.5 
新型城镇 1.6
伊甸 1.8
综合设施 2.0






在 cfg 中添加这些变量来控制它们autoexec_ns_server：

ns_fd_allow_elite_titans默认值为 0，设置为 1 以允许精英泰坦生成
ns_fd_allow_true_shield_captains默认值为 0，设置为 1 以允许战役中的盾牌队长在大师或疯狂难度下生成
ns_fd_allow_titanfall_block默认值为 0，设置为 1 将允许某些地图在第5波不能降落泰坦（天使城、异常、殖民地？）
ns_fd_show_drop_points默认值为 0，设置为 1 将显示泰坦降落标记，用于敌人
ns_fd_grunt_primary_weapon默认值为“mp_weapon_rspn101”，即R-201，设置为另一种常用武器以使士兵使用它们
ns_fd_grunt_grenade_type默认值为“mp_weapon_frag_grenade”，即碎片手榴弹，设置为另一种手榴弹类型以使士兵扔它们
ns_fd_grunt_at_weapon默认值为“mp_weapon_defender”，设置为另一种反泰坦武器，使士兵在大师或疯狂难度上使用它们
ns_fd_disable_respawn_dropship默认值为 0，设置为 1 使玩家始终直接在收割机或商店附近的地面重生
ns_reaper_warpfall_kill默认值为 1，如果您不希望死神在坠落时杀死泰坦，请设置为 0
ns_ronin_fair_phase 默认设置为 1 ，浪人在相移中在敌方泰坦体内实体化时不会自杀，相反，他只会对目标泰坦施加 5000 点伤害



这些是播放列表覆盖，您可以包含在服务器设置中，以更好地控制匹配的行为方式：

你实际上可以强迫咕噜在大师和疯狂困难之外使用反泰坦武器，使用你想使用的AT武器的咕噜数量，可以从1增加到4，这是基于掉落舱的小队，所以4将是所有使用它们的咕噜声fd_grunt_at_weapon_users
您也可以使用 对护盾队长执行相同的操作，相同的规则适用于上述设置。fd_grunt_shield_captains
使用边境防御的这个分支，可以使用 更改波之间的时间，默认值为 60 秒 fd_wave_buy_time
可以通过设置为 0 来启用捡起电池的行为，因此在泰坦捡起电池时会跑过电池 rodeo_battery_disembark_to_pickup