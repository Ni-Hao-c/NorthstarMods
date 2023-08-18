
global function initFrontierDefenseData


//   CreateSmokeEvent  烟雾  wave1.append( CreateSmokeEvent( < -12, 1720, 1540 >, 90, index++ ) ) 位置、时间、索引
//   CreateArcTitanEvent 电弧
//   wave4.append( CreateWarningEvent( FD_IncomingWarnings.ArcTitan, index++ ) )
//   wave4.append( CreateArcTitanEvent( < 2665.469971, 4456.529785, 960.656006 >, < 0.000000, -141.108002, 0.000000 >, "", index++ ) )
//   CreateWaitForTimeEvent  等待
//   CreateSuperSpectreEvent （死神）
//   CreateSuperSpectreEventWithMinion （炸猪死神 ）
//   CreateDroppodGruntEvent
//   CreateNukeTitanEvent
//   CreateMortarTitanEvent
//   CreateGenericSpawnEvent
//   CreateGenericTitanSpawnWithAiSettingsEvent
//   CreateDroppodStalkerEvent
//   CreateDroppodSpectreMortarEvent
//   CreateWaitUntilAliveEvent
//   CreateWaitUntilAliveWeightedEvent
//   CreateCloakDroneEvent
//   CreateDroppodTickEvent
//   CreateSpawnDroneEvent
//   CreateToneSniperTitanEvent
//   CreateNorthstarSniperTitanEvent //northstars are always sniper titans 北极星
//   CreateIonTitanEvent 离子
//   CreateScorchTitanEvent 烈焰
//   CreateRoninTitanEvent 
//   CreateToneTitanEvent 强力
//   CreateLegionTitanEvent 军团
//   CreateMonarchTitanEvent 帝王
//   CreateWarningEvent
//    wave1.append(CreateWaitUntilAliveEvent( 6, index++ ) )


void function initFrontierDefenseData()
{
    shopPosition = < 3625 , -4583, 24.1857>
	shopAngles = < 0, 171.69, 0 >
	FD_spawnPosition = <  3227.91 , -5265.71,26.13 >
	//FD_spawnAngles = < 0, 0, 168 >

	NPCSetAimConeFocusParams( 0.2, 1.0 )
	NPCSetAimPatternFocusParams( 0.2, 0.1, 0.8 )
	NPCSetReacquireParams( 5, 3.5 )
	//npc.kv.WeaponProficiency = eWeaponProficiency.PERFECT
	//npcTitan.kv.WeaponProficiency = eWeaponProficiency.PERFECT

	int index = 1
    array<WaveEvent> wave1
	wave1.append(CreateWaitForTimeEvent( 20.0, index++ ) )
	wave1.append(CreateNukeTitanEvent(< -4499.95 ,-1335.20 , 328.67 >,< 0 , -10 , 0 >,"",index++))
	wave1.append(CreateWaitForTimeEvent( 5.0, index++ ) )
	wave1.append(CreateMonarchTitanEvent(< 1771.87 , -6136.99 ,146.18 >,< 0 , -10 , 0 >,"",index++))//左一
	wave1.append(CreateWaitForTimeEvent( 5.0, index++ ) )
	wave1.append(CreateMonarchTitanEvent(< 1633.54 ,-2238.62 , 80.04 >,< 0 , -10 , 0 >,"",index++))//右一
	wave1.append(CreateWaitUntilAliveEvent( 0, index++ ) )
	wave1.append(CreateSpawnDroneEvent(< 2742  , -5783  , 590 >,< 0.004999 , -115.792000 , 0.000004 >,"",index++, false ))
    wave1.append(CreateWaitForTimeEvent(2.0170135,index++))
	wave1.append(CreateSpawnDroneEvent(< 3823.41  , -2516.7, 201.766  >,< 0.004999 , -115.792000 , 0.000004 >,"",index++, false ))
    wave1.append(CreateWaitForTimeEvent(2.0170135,index++))




 	wave1.append( CreateSmokeEvent( < 3625 , -4583, 24.1857>, 120, index++ ) ) 
	//wave1.append( CreateSmokeEvent( < -12, 1720, 1540 >, 90, index++ ) )
	// wave1.append(CreateWaitForTimeEvent(0.3,index++))
	wave1.append(CreateDroppodGruntEvent(<1257.27 , -5005.52, 125.63 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(0.3,index++))
	wave1.append(CreateDroppodStalkerEvent(< -4482.62 , -3813.63 , 384.62 >,"",index++))//后左3
	wave1.append(CreateWaitForTimeEvent(0.8,index++))
	wave1.append(CreateDroppodGruntEvent(< -3628.56 , -4314.62 , 490.84>,"",index++))//后左2
	wave1.append(CreateWaitForTimeEvent(0.4,index++))
	wave1.append(CreateDroppodGruntEvent(< -2974.43 , -4352.02 ,459.73 >,"",index++))//后左1
	wave1.append(CreateWaitForTimeEvent(0.6,index++))
	wave1.append(CreateSuperSpectreEventWithMinion(< 1284.05 , -4376.64 , 153.14 >,< 0 , 0 , 0 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateDroppodStalkerEvent(< -4499.95 ,-1335.20 , 328.67 >,"",index++))//迫击炮6
	wave1.append(CreateWaitForTimeEvent(0.2,index++))
	wave1.append(CreateDroppodGruntEvent(< -5450.80 ,-1392.08 , 202.86 >,"",index++))//迫击炮5
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateSuperSpectreEvent(< -5338.37 ,-2537.82 , 269.87 >,< 0 , 0 , 0 >,"",index++))//迫击炮4
	wave1.append(CreateWaitForTimeEvent(0.1,index++))
	wave1.append(CreateDroppodStalkerEvent(< -5432.52 , -3099.92 , 322.12 >,"",index++))//迫击炮3
	wave1.append(CreateWaitForTimeEvent(0.2,index++))
	wave1.append(CreateDroppodGruntEvent(< -4434.57 , -3806.52 , 390.79 >,"",index++))//迫击炮2
	wave1.append(CreateWaitForTimeEvent(0.3,index++))
	wave1.append(CreateDroppodStalkerEvent(< -4111.51 , -3063.11 , 473.78 >,"",index++))//迫击炮1
	wave1.append(CreateWaitForTimeEvent(0.4,index++))
	wave1.append(CreateDroppodGruntEvent(< -3260.79 , -2982.36 , 498.32>,"",index++))//后右4
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodStalkerEvent(< -2730.35 , -3059.87 , 488.75 >,"",index++))//后右3
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateSuperSpectreEvent(< -2640.37 , -2653.26 , 457.57 >,< 0 , 0 , 0 >,"",index++))//后右2
	wave1.append(CreateWaitForTimeEvent(0.8,index++))
	wave1.append(CreateDroppodStalkerEvent(< -1624.42 , -2144.02, -78.93 >,"",index++))//后右1
	wave1.append(CreateWaitForTimeEvent(0.4,index++))
	wave1.append(CreateDroppodStalkerEvent(< 2611.32 , -2095.84 , 60.79 >,"",index++))//前右2
	wave1.append(CreateWaitForTimeEvent(0.2,index++))
	wave1.append(CreateDroppodStalkerEvent(< 1633.54 ,-2238.62 , 80.04 >,"",index++))//前右1
	wave1.append(CreateWaitForTimeEvent(0.7,index++))
	wave1.append(CreateDroppodGruntEvent(< 1491.55 , -3297.66 , 136.47 >,"",index++))//前中2
	wave1.append(CreateWaitForTimeEvent(0.1,index++))
	wave1.append(CreateDroppodStalkerEvent(< 1284.05 , -4376.64 , 153.14 >,"",index++))//前中1
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	//wave1.append(CreateIonTitanEvent(< 2915.77, -6152.73, 110.00 >,< 0 , -35 , 0 >,"",index++))//左二
	wave1.append(CreateWaitForTimeEvent( 5.0, index++ ) )
	wave1.append(CreateWarningEvent( FD_IncomingWarnings.MortarTitan, index++ ) )
	wave1.append(CreateMortarTitanEvent(<  -4244.25  , -1751.26  , 343.567 >,< 0 , -10 , 0 >,0))
	waveEvents.append(wave1)


	index = 1
    array<WaveEvent> wave2
	wave2.append(CreateWaitForTimeEvent( 5.0, index++ ) )
	wave2.append(CreateToneTitanEvent(< 1568 , -3736, 152 >,< 0 , -10 , 0 >,"",index++)) //中路1
	wave2.append(CreateWaitForTimeEvent(0.4,index++))
	wave2.append(CreateToneTitanEvent(< 1920 , -4608  , 152  >,< 0 , 0 , 0 >,"",index++))//中路2
	wave2.append(CreateWaitForTimeEvent(0.8,index++))
	wave2.append(CreateToneTitanEvent(< 2408  , -2520 , 168  >,< 0 , 50 , 0 >,"",index++))//前右路1
	wave2.append(CreateWaitForTimeEvent(2.5,index++))
	wave2.append(CreateDroppodGruntEvent(< -1345.84  , -4891.35 , 225.809 >,"",index++))//后坐路1
	wave2.append(CreateWaitForTimeEvent(0.2,index++))
	wave2.append(CreateDroppodStalkerEvent(< -1377.84 , -4283.35  , 217.809  >,"",index++))//后中路1
	wave2.append(CreateWaitForTimeEvent(0.3,index++))
	wave2.append(CreateDroppodGruntEvent(< -1325.84  , -2279.35, 9.809  >,"",index++))//后右路1
	wave2.append(CreateWaitForTimeEvent(0.6,index++))
	wave2.append(CreateDroppodStalkerEvent(< -1325.84  , -2279.35  , -102.191 >,"",index++))//后右路-3
	wave2.append(CreateWaitForTimeEvent(0.4,index++))
	wave2.append(CreateDroppodGruntEvent(< -1721.84 , -2043.35  , 9.809  >,"",index++))//后右路-2
	wave2.append(CreateWaitForTimeEvent(0.8,index++))
	wave2.append(CreateDroppodStalkerEvent(< -2429.84 , -1891.35 ,281.809  >,"",index++))//后右路-1
	wave2.append(CreateWaitForTimeEvent(5.0,index++))
	wave2.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	wave2.append(CreateLegionTitanEvent(< -1689.84  , -4663.35  , 217.809  >,< 0 , -35 , 0 >,"",index++))//后ZUO路-1
	wave2.append(CreateWaitForTimeEvent(1.2,index++))
	wave2.append(CreateLegionTitanEvent(< 1443.06  , -2083.05  , 200 >,< 0 , 50 , 0 >,"",index++))//前ZUO路-1
	wave2.append(CreateWaitForTimeEvent(1.6,index++))
	wave2.append(CreateMonarchTitanEvent(< 2227.14  , -2200.17  , 132.291 >,< 0 , 50 , 0 >,"",index++))//前ZUO路-2
	wave2.append(CreateWaitForTimeEvent(2.5,index++))
	wave2.append(CreateDroppodGruntEvent(< -3914.04  , -3166.76 , 504.128 >,"",index++))//后后1
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodStalkerEvent(< -4209.77  , -3650.77 , 523.237  >,"",index++))//后后2
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodGruntEvent(< -4602   , -3730  , 440   >,"",index++))//后后3
	wave2.append(CreateWaitForTimeEvent(1.0,index++))
	wave2.append(CreateDroppodGruntEvent(< -4936  , -3622 , 404 >,"",index++))//后后4
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodStalkerEvent(< -864 , 3524 , 2 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -627 , 3765 , 3 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(5.0,index++))
	// wave2.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	// wave2.append(CreateIonTitanEvent(< -3618 , -2267 , 122 >,< 0 , -10 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.8,index++))
	// wave2.append(CreateIonTitanEvent(< -3376 , -2713 , 135 >,< 0 , 0 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.2,index++))
	// wave2.append(CreateMonarchTitanEvent(< -3038 , -3124 , 137 >,< 0 , 50 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(2.0,index++))
	// wave2.append(CreateLegionTitanEvent(< -459 , -2085 , 165 >,< 0 , 70 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.2,index++))
	// wave2.append(CreateLegionTitanEvent(< -733 , -2170 , 188 >,< 0 , 70 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(2.5,index++))
	// wave2.append(CreateLegionTitanEvent(< 338 , -2212 , 251 >,< 0 , 70 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodStalkerEvent(< -1542 , -1015 , 147 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -1446 , -1464 , 185 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodStalkerEvent(< -864 , 3524 , 2 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -627 , 3765 , 3 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(5.0,index++))
	// wave2.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	// wave2.append(CreateScorchTitanEvent(< -2778 , 3336 , -99 >,< 0 , -35 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.2,index++))
	// wave2.append(CreateNorthstarSniperTitanEvent(< -2757 , 3877 , -153 >,< 0 , 50 , 0 >,index++))
	// wave2.append(CreateWaitForTimeEvent(1.6,index++))
	// wave2.append(CreateNorthstarSniperTitanEvent(< -3069 , 3464 , -122 >,< 0 , 50 , 0 >,index++))
	// wave2.append(CreateWaitForTimeEvent(2.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -1812 , -1233 , 175 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodStalkerEvent(< -1542 , -1015 , 147 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -1446 , -1464 , 185 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -1110 , 3419 , 4 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodStalkerEvent(< -864 , 3524 , 2 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateDroppodGruntEvent(< -627 , 3765 , 3 >,"",index++))
	// wave2.append(CreateWarningEvent( FD_IncomingWarnings.Reaper, index++ ))
	// wave2.append(CreateSuperSpectreEventWithMinion(< 752 , -1986 , 256 >,< 0 , 90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.2,index++))
	// wave2.append(CreateSuperSpectreEventWithMinion(< -1825 , 1717 , 10 >,< 0 , -30 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.2,index++))
	// wave2.append(CreateSuperSpectreEventWithMinion(< -2023 , -949 , 145 >,< 0 , -12 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(5.0,index++))
	// wave2.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	// wave2.append(CreateLegionTitanEvent(< 742 , 5092 , -60 >,< 0 , -90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.0,index++))
	// wave2.append(CreateLegionTitanEvent(< -200 , 5238 , -65 >,< 0 , -90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.0,index++))
	// wave2.append(CreateIonTitanEvent(< -235 , 5679 , -62 >,< 0 , -90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.0,index++))
	// wave2.append(CreateIonTitanEvent(< 665 , 5612 , -64 >,< 0 , -90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.5,index++))
	// wave2.append(CreateToneTitanEvent(< 344 , 6128 , -87 >,< 0 , -90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(3.5,index++))
	// wave2.append(CreateLegionTitanEvent(< -2778 , 3336 , -99 >,< 0 , -35 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.2,index++))
	// wave2.append(CreateLegionTitanEvent(< -2757 , 3877 , -153 >,< 0 , 50 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(1.0,index++))
	// wave2.append(CreateMonarchTitanEvent(< -3069 , 3464 , -122 >,< 0 , 50 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.6,index++))
	// wave2.append(CreateSuperSpectreEventWithMinion(< 752 , -1986 , 256 >,< 0 , 90 , 0 >,"",index++))
	// wave2.append(CreateWaitForTimeEvent(0.4,index++))
	// wave2.append(CreateSuperSpectreEventWithMinion(< -1825 , 1717 , 10 >,< 0 , -30 , 0 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.2,index++))
	wave2.append(CreateSuperSpectreEventWithMinion(< -2023 , -949 , 145 >,< 0 , -12 , 0 >,"",0))
	waveEvents.append(wave2)
	
}

    