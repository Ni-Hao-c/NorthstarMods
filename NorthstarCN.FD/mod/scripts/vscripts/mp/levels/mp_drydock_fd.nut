global function initFrontierDefenseData
void function initFrontierDefenseData()
{
    shopPosition = < -710.46, 210.69 , 408>
	shopAngles = < 0, -90, 0 >
	FD_spawnPosition = < 2430.80, 594.53, 128 >
	FD_spawnAngles = < 0, 180, 0 >
	FD_groundspawnPosition = < 961, 845, 409 >
	FD_groundspawnAngles = < 0, -130, 0 >
	
	FD_DropPodSpawns.append(< 1403, 1310, 256 >)
	FD_DropPodSpawns.append(< -1135, 1450, 224 >)
	FD_DropPodSpawns.append(< 1041, -1422, 264 >)
	
	AddStationaryAIPosition(< 576, -3436, 141 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 3468, -3461, 0 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 3256, 3423, -47 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< -1910, 3458, 84 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 1968, 1282, 256 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 455, -3620, 144 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 3484, 1129, -25 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)

	int index = 1
	
    array<WaveEvent> wave1
	wave1.append(CreateWarningEvent( FD_IncomingWarnings.Infantry, index++ ))
	wave1.append(CreateWaitForTimeEvent(1.0,index++))
	wave1.append(CreateDroppodGruntEvent(< -1796 , -2349 , 113 >,"midHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodGruntEvent(< -1950 , -1182 , 113 >,"midHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.7,index++))
	wave1.append(CreateDroppodGruntEvent(< -1693 , -1081 , 113 >,"midHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 0, index++ ) )
	wave1.append(CreateDroppodGruntEvent(< 1079 , -2610 , 224 >,"rightHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.0,index++))
	wave1.append(CreateDroppodGruntEvent(< 935 , -2621 , 224 >,"rightHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateDroppodGruntEvent(< 1122 , 5509 , 330 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.8,index++))
	wave1.append(CreateDroppodGruntEvent(< 1239 , 5078 , 261 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.2,index++))
	wave1.append(CreateDroppodGruntEvent(< 781 , 4688 , 224 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 0, index++ ) )
	wave1.append(CreateDroppodGruntEvent(< -1924 , 2515 , 100 >,"leftHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.5,index++))
	wave1.append(CreateDroppodGruntEvent(< -1603 , 2896 , 111 >,"leftHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.0,index++))
	wave1.append(CreateDroppodGruntEvent(< -1777 , 1306 , 96 >,"leftHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	wave1.append(CreateDroppodGruntEvent(< 2297 , -3095 , -64 >,"right_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodGruntEvent(< 2521 , -3463 , -64 >,"rightHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.6,index++))
	wave1.append(CreateDroppodGruntEvent(< 2919 , -3325 , -64 >,"right_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.8,index++))
	wave1.append(CreateDroppodGruntEvent(< 2704 , -3245 , -64 >,"rightHalfway_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.2,index++))
	wave1.append(CreateDroppodGruntEvent(< 2826 , -2611 , -64 >,"right_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 0, index++ ) )
	wave1.append(CreateDroppodGruntEvent(< -1796 , -2349 , 113 >,"infantyPerch_right0",index++))
	wave1.append(CreateWaitForTimeEvent(1.2,index++))
	wave1.append(CreateWarningEvent( FD_IncomingWarnings.Stalkers, index++ ))
	wave1.append(CreateDroppodStalkerEvent(< -1950 , -1182 , 113 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(1.8,index++))
	wave1.append(CreateDroppodGruntEvent(< -1693 , -1081 , 113 >,"infantyPerch_right2",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	wave1.append(CreateDroppodGruntEvent(< 1122 , 5509 , 330 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodStalkerEvent(< 1239 , 5078 , 261 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodGruntEvent(< 781 , 4688 , 224 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(5.0,index++))
	wave1.append(CreateWaitUntilAliveEvent( 0, index++ ) )
	wave1.append(CreateSuperSpectreEventWithMinion(< 1812 , 3165 , 93 >,< 0 , -133 , 0 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(0.4,index++))
	wave1.append(CreateDroppodGruntEvent(< 896 , 3063 , 98 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.5,index++))
	wave1.append(CreateDroppodStalkerEvent(< 1697 , 2873 , 98 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(0.6,index++))
	wave1.append(CreateDroppodGruntEvent(< 1402 , 3033 , 101 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(0.7,index++))
	wave1.append(CreateDroppodStalkerEvent(< 1253 , 2700 , 98 >,"",index++))
	wave1.append(CreateWaitForTimeEvent(0.8,index++))
	wave1.append(CreateDroppodGruntEvent(< 509 , 2661 , 98 >,"left_infantry",index++))
	wave1.append(CreateWaitForTimeEvent(1.5,index++))
	wave1.append(CreateScorchTitanEvent(< 2915 , 2512 , -98 >,< 0 , -90 , 0 >,"rightSwitchShort2",0))
	waveEvents.append(wave1)
	index = 1
    array<WaveEvent> wave2
	//炸猪的效果并不是很好
	wave2.append(CreateWarningEvent( FD_IncomingWarnings.EnemyTitansIncoming, index++ ))
	wave2.append(CreateWaitForTimeEvent(1.2,index++))
	wave2.append(CreateDroppodTickEvent(< 1046.14, 2722.75, 85.0312 >, 4, "", index++ ) )
	
	wave2.append(CreateDroppodGruntEvent( < 1046.14, 2722.75, 85.0312 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodStalkerEvent(< 1313.12, 2911.57, 82.9564 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(1.0,index++))
	wave2.append(CreateSuperSpectreEvent( < 2947.59, 3654.5, -84.2501 >,< 0 , -140 , 0 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(1.0,index++))
	wave2.append(CreateDroppodGruntEvent(  < -1796.13, -1081.21, 101.031 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodGruntEvent(   < -532.29, -2325.12, 240.031 > ,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodGruntEvent(   < 1015.54, -1657.77, 264.031 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateToneTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))
	wave2.append(CreateDroppodTickEvent(< 1046.14, 2722.75, 85.0312 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))

	wave2.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	//wave2.append(CreateMortarTitanEvent(< 3457 , -3216 , 22 >,< 0 , 135 , 0 >,index++))
	wave2.append(CreateWaitForTimeEvent(1.2,index++))
	wave2.append(CreateDroppodTickEvent(< 1046.14, 2722.75, 85.0312 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent(< 1313.12, 2911.57, 82.9564 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent(< 2947.59, 3654.5, -84.2501 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent(< -532.29, -2325.12, 240.031 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent(< 1015.54, -1657.77, 264.031 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	//wave2.append(CreateMortarTitanEvent(< -1786.43, -1206.53, 101.031 >,< 0 , 135 , 0 >,index++))
	wave2.append(CreateWaitForTimeEvent(0.6,index++))
	wave2.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave2.append(CreateDroppodTickEvent(< -1748.67, -952.463, 101.031 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent( < -1847, -2250.58, 101.031 >, 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateDroppodTickEvent( < -518.372, -2218.24, 240.031 > , 4, "", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	
	wave2.append(CreateRoninTitanEvent(< 2660.1 ,3543.64 ,-98.0001>,< 0 , -60 , 0 >,"leftFar1",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++)) 
	wave2.append(CreateToneTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateIonTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateWaitForTimeEvent(0.6,index++))
	wave2.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave2.append(CreateMortarTitanEvent(< 3457 , -3216 , 22 >,< 0 , 135 , 0 >,index++))
	wave2.append(CreateWaitForTimeEvent(0.5,index++))
	wave2.append(CreateIonTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++)) //18前右 yesw
	wave2.append(CreateDroppodTickEvent(< 2521 , -3463 , -64 >, 4, "leftSwitchShort01", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.6,index++))
	wave2.append(CreateWaitForTimeEvent(0.6,index++))
	wave2.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave2.append(CreateDroppodTickEvent(< 2919 , -3325 , -64 >, 4, "leftSwitchShort01", index++ ) )
	wave2.append(CreateWaitForTimeEvent(0.7,index++))
	wave2.append(CreateDroppodStalkerEvent(< 2704 , -3245 , -64 >,"",index++))
	wave2.append(CreateWaitForTimeEvent(0.8,index++))	
	wave2.append(CreateDroppodTickEvent(< 2826 , -2611 , -64 >, 4, "leftSwitchShort01",0) )
	waveEvents.append(wave2)

	index = 1
    array<WaveEvent> wave3
	wave3.append(CreateWarningEvent( FD_IncomingWarnings.ArcTitanIntro, index++ ))
	wave3.append(CreateArcTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
    wave3.append(CreateArcTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
	wave3.append(CreateWaitForTimeEvent(10.5,index++))
	wave3.append(CreateDroppodStalkerEvent(< -518.372, -2218.24, 240.031 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateDroppodStalkerEvent(< 1445.25, 2848.43, 84.3375 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateDroppodStalkerEvent(< 914.118, 2963.04, 81.5999 > ,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateDroppodStalkerEvent(< -461.467, 2964.55, 134.343 > ,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateDroppodGruntEvent( < -1776.44, -1080.26, 101.031 >,"midHalfway_infantry",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < 2169.48, 3392.26, -14.044 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < 588.459, 3504.75, 81.5999 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < -1939.51, 3418.09, 87.0032 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent(  < 2624.6, -2390.45, -84.535 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < -1740.22, -2297.38, 101.031 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateWaitForTimeEvent(0.6,index++))
	wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave3.append(CreateToneTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))
	wave3.append(CreateWaitForTimeEvent(2.5,index++))
	wave3.append(CreateIonTitanEvent(< 486.744 ,-2620.22 ,238.001 >,< 0 , -60 , 0 >,"right_infantry",index++))//15 前右近yes//29前左短 yes
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateIonTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++)) //18前右 yesw
	wave3.append(CreateWaitForTimeEvent(20.5,index++))
	wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	
	//ARC=======================
	wave3.append(CreateWarningEvent( FD_IncomingWarnings.ArcTitanIntro, index++ ))
	wave3.append(CreateNukeTitanEvent(< -1828.65, -2325.26 ,117 >,< 0 , -60 , 0 >,"leftSwitchShort02",index++))//4 前右转 后左 半圈	
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateArcTitanEvent(< -1957.94 ,1381.61 ,105.184 >,< 0 , -60 , 0 >,"leftFar2",index++))//3 后右转后左 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateArcTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateArcTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateArcTitanEvent(< 2838.99 ,1033.37 ,-81.724 >,< 0 , -60 , 0 >,"midFar",index++))//25 后左转后右短 yes
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < -1939.51, 3418.09, 87.0032 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent(  < 2624.6, -2390.45, -84.535 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateSuperSpectreEvent( < -1740.22, -2297.38, 101.031 >,< 0 , -140 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateToneTitanEvent(< -1842.15 ,-1220.36 ,102.972 >,< 0 , -60 , 0 >,"leftSwitchLong03",index++)) 
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave3.append(CreateNukeTitanEvent(< -1957.94 ,1381.61 ,105.184 >,< 0 , -60 , 0 >,"leftFar2",index++))//3 后右转后左 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateNukeTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateNukeTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
	wave3.append(CreateWaitForTimeEvent(0.5,index++))
	wave3.append(CreateNukeTitanEvent(< 2838.99 ,1033.37 ,-81.724 >,< 0 , -60 , 0 >,"midFar",index++))//25 后左转后右短 yes
	wave3.append(CreateWaitUntilAliveEvent( 8, index++ ) )
	wave3.append(CreateArcTitanEvent(< 3054 , -2984 , -42 >,< 0 , 105 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateArcTitanEvent(< 2445 , -3570 , -61 >,< 0 , 155 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(1.0,index++))
	wave3.append(CreateArcTitanEvent(< 2505 , -3072 , -61 >,< 0 , 100 , 0 >,"",index++))
	wave3.append(CreateWaitForTimeEvent(3.0,index++))
	wave3.append(CreateScorchTitanEvent(< 3549 , -2495 , 22 >,< 0 , 140 , 0 >,"",index++))
	wave3.append(CreateDroppodTickEvent(< 2212 , -3204 , -54 >, 4, "",0) )
	waveEvents.append(wave3)

	index = 1
    array<WaveEvent> wave4
	wave4.append( CreateSmokeEvent( < 436.76, -713, 265 >, 120, index++ ) )
    wave4.append( CreateWaitForTimeEvent( 0.333, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(3.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(10.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(3.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateToneTitanEvent(< -1842.15 ,-1220.36 ,102.972 >,< 0 , -60 , 0 >,"leftSwitchLong03",index++)) 
	wave4.append(CreateWaitForTimeEvent(0.5,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateToneTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(10.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(10.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
 	wave4.append(CreateToneTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
    wave4.append(CreateToneTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
	wave4.append( CreateCloakDroneEvent( < -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >, index++ ) )
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append( CreateCloakDroneEvent( < 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >, index++ ) )
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateIonTitanEvent(< -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >,"rightSwitchShort1",index++))//7 后右转前左 半圈
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateIonTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"rightSwitchShort2",index++))//////6 后左转前右 半圈
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< 2629.44 , -5409.7 ,146.4825 >,< 0 , 90 , 0 >,"rightDrone01",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 1236.34 ,-5969.85, 266.929 >,< 0 , 90 , 0 >,"rightDrone02",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSpawnDroneEvent(< 342.04 ,-5992.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone03",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSpawnDroneEvent(< -457.96 ,-6000.37, 233.999 >,< 0 , 90 , 0 >,"rightDrone04",index++))
	wave4.append(CreateWaitUntilAliveEvent( 14, index++ ) )
	wave4.append(CreateSuperSpectreEvent( < 1955.91, 3518.37, 57.8461 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< 3049.81, 3589.21, -54.9322> ,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateLegionTitanEvent(< 2389 , -3334 , -64 >,< 0 , 90 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	wave4.append(CreateWaitForTimeEvent(1.2,index++))
	wave4.append(CreateLegionTitanEvent(< 2934 , -3281 , -64 >,< 0 , 90 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	wave4.append(CreateWaitForTimeEvent(0.5,index++))
	wave4.append(CreateDroppodGruntEvent(< 2297 , -3095 , -64 >,"rightHalfway_infantry",index++))
	wave4.append(CreateWaitForTimeEvent(0.6,index++))
	wave4.append(CreateDroppodTickEvent(< 2521 , -3463 , -64 >, 4, "leftSwitchShort01", index++ ) )
	wave4.append(CreateWaitForTimeEvent(0.4,index++))
	wave4.append(CreateDroppodStalkerEvent(< 2919 , -3325 , -64 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.2,index++))
	wave4.append(CreateDroppodGruntEvent(< 2704 , -3245 , -64 >,"rightHalfway_infantry",index++))
	wave4.append(CreateWaitForTimeEvent(1.4,index++))
	wave4.append(CreateDroppodTickEvent(< 2826 , -2611 , -64 >, 4, "leftSwitchShort01", index++ ) )
	wave4.append(CreateWaitForTimeEvent(5.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSuperSpectreEvent(< 2169.48, 3392.26, -14.044 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< -1939.51, 3418.09, 87.0032 > ,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent( < -1905.65, 3610.42, 84.0313 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateIonTitanEvent(< -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >,"rightSwitchShort1",index++))//7 后右转前左 半圈
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent( < -1503.81, 2987.11, 112.031 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent( < -948.399, 3179.21, 177.469 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< -587.81, 2942.95, 139.145 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< 84.6474, 2953.3, 90.2137 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< 619.02, 3412.39, 81.5999 > ,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateIonTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"rightSwitchShort2",index++))//////6 后左转前右 半圈
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateWaitUntilAliveEvent( 20, index++ ) )
	wave4.append(CreateSuperSpectreEvent( < 1955.91, 3518.37, 57.8461 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEvent(< 3049.81, 3589.21, -54.9322> ,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateWaitForTimeEvent(1.0,index++))
	wave4.append(CreateSuperSpectreEventWithMinion( < 3038.64, 2005.28, -68.6054 >,< 0 , -133 , 0 >,"",index++))
	wave4.append(CreateNukeTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))//29前左短 yes
	wave4.append( CreateCloakDroneEvent( < 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >, 0 ) )


	waveEvents.append(wave4)
	index = 1
    array<WaveEvent> wave5
	// wave5.append( CreateWarningEvent( FD_IncomingWarnings.Everything, index++ ) )
	// wave5.append(CreateRoninTitanEvent(< -2215 , 3278 , 164 >,< 0 , -90 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	// wave5.append(CreateWaitForTimeEvent(2.5,index++))
	// wave5.append(CreateToneTitanEvent(< -2203 , 2963 , 164 >,< 0 , -35 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	// wave5.append(CreateWaitForTimeEvent(2.5,index++))
	// wave5.append(CreateToneTitanEvent(< -1443 , 3100 , 124 >,< 0 , -65 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	// wave5.append(CreateWaitForTimeEvent(2.5,index++))
	// wave5.append(CreateIonTitanEvent(< -2195 , 3243 , 164 >,< 0 , -40 , 0 >,"",index++,1,"",FD_TitanType.TITAN_ELITE))
	// wave5.append(CreateWaitForTimeEvent(1.2,index++))
	// wave5.append(CreateLegionTitanEvent(< -1793 , 1339 , 96 >,< 0 , 0 , 0 >,"",index++))
	// wave5.append(CreateWaitForTimeEvent(0.5,index++))
	// wave5.append(CreateLegionTitanEvent(< -1792 , -1095 , 113 >,< 0 , 0 , 0 >,"",index++))
	// wave5.append(CreateWaitForTimeEvent(0.5,index++))
	// wave5.append(CreateLegionTitanEvent(< -1817 , -2235 , 113 >,< 0 , 0 , 0 >,"",index++))
	wave5.append(CreateWaitForTimeEvent(20.6,index++))
	wave5.append(CreateToneTitanEvent(< 3062.09, -3456.52, -72.6371 > , < 0, 97.6041, 0 >,"rightFar01",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateToneTitanEvent( < 2374.28, -3440.12, -76.0744 > , < 0, 97.6041, 0 >,"rightFar01",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateArcTitanEvent(< 1894.91, -3393.18, -4.70291 > , < 0, 97.6041, 0 >,"rightFar01",index++))//3 后右转后左 短半圈
	wave5.append(CreateWaitForTimeEvent(10.2,index++))
	wave5.append(CreateToneTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateToneTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
	wave5.append(CreateWaitForTimeEvent(10.2,index++))
	wave5.append(CreateNukeTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateToneTitanEvent(< 3062.09, -3456.52, -72.6371 > , < 0, 97.6041, 0 >,"rightFar01",index++))
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateSuperSpectreEventWithMinion(< 3164 , 3572 , -30 >,< 0 , -140 , 0 >,"",index++))
	wave5.append(CreateWaitForTimeEvent(10.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )

	wave5.append(CreateArcTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateToneTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2049.48, 3497.95, 26.1078 > , < 0, -111.349, 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1832.26, 1365.35, 84.0313 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >,"rightSwitchShort1",index++))//7 后右转前左 半圈
	wave5.append(CreateToneTitanEvent(< 3062.09, -3456.52, -72.6371 > , < 0, 97.6041, 0 >,"rightFar01",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateNukeTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"rightSwitchShort2",index++))//////6 后左转前右 半圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -1828.65, -2325.26 ,117 >,< 0 , -60 , 0 >,"leftSwitchShort02",index++))//4 前右转 后左 半圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateToneTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateToneTitanEvent(< 3062.09, -3456.52, -72.6371 > , < 0, 97.6041, 0 >,"rightFar01",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateToneTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -1828.65, -2325.26 ,117 >,< 0 , -60 , 0 >,"leftSwitchShort02",index++))//4 前右转 后左 半圈
	wave5.append( CreateMortarTitanEvent( < -1865.51, 1281.22, 84.0313 > , < 0, 30.6424, 0 >, index++ ) )
	wave5.append(CreateWaitForTimeEvent(10.6,index++))
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateToneTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateArcTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++))
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateArcTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateNukeTitanEvent( <  -1794.35, -2298.82, 101.031 > , < 0, 12.2698, 0 >,"rightNear",index++))
	wave5.append( CreateMortarTitanEvent( < -1865.51, 1281.22, 84.0313 > , < 0, 30.6424, 0 >, index++ ) )
	wave5.append( CreateMortarTitanEvent( <  -1794.35, -2298.82, 101.031 > , < 0, 12.2698, 0 >, index++ ) )

	wave5.append(CreateWaitForTimeEvent(20.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateArcTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++))
	wave5.append(CreateArcTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateArcTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateArcTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈	
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateScorchTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateScorchTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 8, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append( CreateMortarTitanEvent( < -1891, 3680.94, 84.0313 > , < 0, -80.0247, 0 >, index++ ) )
	wave5.append( CreateMortarTitanEvent( < -1865.51, 1281.22, 84.0313 > , < 0, 30.6424, 0 >, index++ ) )
	wave5.append(CreateWaitForTimeEvent(5.6,index++))
	wave5.append( CreateMortarTitanEvent( <  -1794.35, -2298.82, 101.031 > , < 0, 12.2698, 0 >, index++ ) )
	
	wave5.append(CreateWaitForTimeEvent(15.6,index++))
	wave5.append(CreateNukeTitanEvent(< -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >,"rightSwitchShort1",index++))//7 后右转前左 半圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateScorchTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateNukeTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateNukeTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"rightSwitchShort2",index++))//////6 后左转前右 半圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
	wave5.append(CreateNukeTitanEvent(< -1828.65, -2325.26 ,117 >,< 0 , -60 , 0 >,"leftSwitchShort02",index++))//4 前右转 后左 半圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左转前座 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateWaitUntilAliveEvent( 13, index++ ) )
	wave5.append(CreateScorchTitanEvent(< 3024 , -3544 , -50 >,< 0 , 135 , 0 >,"",0,1,"",FD_TitanType.TITAN_ELITE)) //1
    waveEvents.append(wave5)
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 以采集机为中心  第一波下的烈焰位置< 2915 , 2512 , -98 >是  后左
// wave5.append(CreateIonTitanEvent(< 2392.21 ,-3404.65 ,-58.9997 >,< 0 , -60 , 0 >,"rightFar01",index++))//29前左短 yes
// wave5.append(CreateIonTitanEvent(< -472.039 ,-2770.91 ,187.636 >,< 0 , -60 , 0 >,"rightNear",index++)) //18前右 yes
// wave5.append(CreateIonTitanEvent(< 2660.1 ,3543.64 ,-98.0001>,< 0 , -60 , 0 >,"leftFar1",index++))//28后左短 yes
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
// wave5.append(CreateIonTitanEvent(< 1185.18,1583.37, 269.999 >,< 0 , -60 , 0 >,"leftNear",index++))//23后左中短 yes
// wave5.append(CreateIonTitanEvent(< 486.744 ,-2620.22 ,238.001 >,< 0 , -60 , 0 >,"right_infantry",index++))//15 前右近yes
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
// wave5.append(CreateIonTitanEvent(< -1842.15 ,-1220.36 ,102.972 >,< 0 , -60 , 0 >,"leftSwitchLong03",index++)) //26 前右短 中 yes
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
//
//
//// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// wave5.append(CreateIonTitanEvent(< -1752.21,3193.71, 118.764>,< 0 , -60 , 0 >,"rightSwitchShort1",index++))//7 后右转前左 半圈
// wave5.append(CreateIonTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"rightSwitchShort2",index++))//////6 后左转前右 半圈
// wave5.append(CreateIonTitanEvent(< -1828.65, -2325.26 ,117 >,< 0 , -60 , 0 >,"leftSwitchShort02",index++))//4 前右转 后左 半圈	
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
// //===
// wave5.append(CreateIonTitanEvent(< -1957.94 ,1381.61 ,105.184 >,< 0 , -60 , 0 >,"leftFar2",index++))//3 后右转后左 短半圈
// wave5.append(CreateIonTitanEvent(< -1532.36, 3005.65, 113.744 >,< 0 , -60 , 0 >,"leftFar0",index++))//2 后右转后左 短半圈
// wave5.append(CreateIonTitanEvent(< 2293.87 ,3212.19 ,-47.344 >,< 0 , -60 , 0 >,"leftSwitchShort01",index++))//5 后左转后右 短半圈
// wave5.append(CreateIonTitanEvent(< 2838.99 ,1033.37 ,-81.724 >,< 0 , -60 , 0 >,"midFar",index++))//25 后左转后右短 yes
// wave5.append(CreateIonTitanEvent(< -1668.36 ,3045.65 ,113.744>,< 0 , -60 , 0 >,"leftFar0",index++))//24后右转左短 yes
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
//
// ////////////////////////////
// wave5.append(CreateIonTitanEvent(< -1680.21 ,3177.71, 118.764 >,< 0 , -60 , 0 >,"rightSwitchLong1",index++))//14 后右 一圈
// wave5.append(CreateIonTitanEvent(< 2430.32 ,3083.17, -79.5225 >,< 0 , -60 , 0 >,"rightSwitchLong2",index++))//10 后左 1圈
// wave5.append(CreateIonTitanEvent(< 2808.07 ,-3329.08, -58.9997 >,< 0 , -60 , 0 >,"leftSwitchLong01",index++))//9 前左 1圈
// wave5.append(CreateIonTitanEvent(< -1764.65, -2245.26, 117 >,< 0 , -60 , 0 >,"leftSwitchLong02",index++))//8 前右 1圈
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
// //////////////////
// wave5.append(CreateIonTitanEvent(< 2109.14 ,-3007.07, -15.9525 >,< 0 , -60 , 0 >,"rightFar02",index++))//11 前左到前中心 狙击点位
// wave5.append(CreateWaitUntilAliveEvent( 0, index++ ) )
//
// 
////
///////////////////////////////////////////////////////////////
// 无人机路线，投放无人机时建议使用下面的坐标 
// leftDrone    1001.67, 4974.07, 363.493
// rightDrone01 2629.44 , -5409.7 ,246.4825
// rightDrone02  1236.34 ,-5969.85, 366.929
// rightDrone03 342.04 ,-5992.37, 333.999 
// rightDrone04 -457.96 ,-6000.37, 333.999
// 
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////