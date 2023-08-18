global function CodeCallback_MapInit
global function initFrontierDefenseData

void function CodeCallback_MapInit()
{
	// Load Frontier Defense Data
	if( GameRules_GetGameMode() == "fd" )
		initFrontierDefenseData()
}



void function initFrontierDefenseData()
{

	AddCallback_RegisterCustomFDContent( RegisterCustomFDContent )
	
	useCustomFDLoad = true

    shopPosition = < -2510.61, -2271.66 , 270.03>
	shopAngles = < 0, -15, 0 >
	FD_spawnPosition = < -2496.71, -2102.10, 270.03 >
	FD_spawnAngles = < 0, -7.47, 0 >
	FD_groundspawnPosition = < -2487.83, -2410.94, 80.03 >
	FD_groundspawnAngles = < 0, 78.31, 0 >

		
	//FD_DropPodSpawns.append(< -2372, -1430, 72 >)
	//FD_DropPodSpawns.append(< -682, -1113, 208 >)
	//FD_DropPodSpawns.append(< -264, -2126, 260 >)
	





	AddStationaryAIPosition(< -2708.83, 456.663, 64.5469 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< -2890, 1650.88, 154.404  >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< -2971.31, 3192.66, 188.649 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< -280.248, 3172.13, 87.3923  >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< -126.612, 1456.69, 66.6622 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 1279.49, 1094.6, 55.492 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 1873.66, 2631.05, 63.7953  >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 2849.33, 2125.69, 63.7953  >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 3589.76, 1029.92, 61.2394 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 4926.92, -1198.81, 61.2395 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 3314.32, -1653.38, 61.2395 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 2694.72, -1797.04, 67.0661 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 2738.27, -2830.66, 59.3036 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 1684.31, -3088.13, 43.9493 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 904.11, -1720.22, 63.7955 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)
	AddStationaryAIPosition(< 596.378, -339.111, 61.5854 >, eStationaryAIPositionTypes.LAUNCHER_REAPER)



	AddStationaryAIPosition(< -2157.37, 622.049, 348.031 > , eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< -1278.95, 2408.33, 306.031 > , eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< -1834.76, 1873.66, 448.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < -1317.92, 2004.5, 456.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< -1561.79, 2828.26, 492.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< -2216.4, 3069.97, 416.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 2985.61, 344.271, 208.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 3173.41, -3.40744, 340.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < 2172.05, -2292.67, 368.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < 1515.48, -2279.74, 332.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 3407.4, -479.958, 422.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)

	AddStationaryAIPosition(< -1748.04, 635.719, 63.7954 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < -1278.95, 2408.33, 306.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < -893.747, 2214.2, 126.23> , eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 2316.25, 2827.75, 120.031 > , eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 3210.92, 3245.28, 120.031 > , eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < 3717.96, 2599.67, 63.7953 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 4680.97, 1170.69, 225.065 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 3893.67, 75.4765, 72.0313 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 5633.7, -1221.96, 68.2686 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition(< 2575.68, -3260.13, 66.6531 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)
	AddStationaryAIPosition( < 609.008, -1176.81, 204.031 >, eStationaryAIPositionTypes.MORTAR_SPECTRE)



	AddStationaryAIPosition(< 5358.22, -1188.92, 76.1857 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition( < 5262.78, 626.801, 63.806 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition( < 5536.79, 1248.68, 67.9544 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition( < 5257.71, 2035.66, 64.9597 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition(< 3733.44, 2665.98, 63.7953 > , eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition( < 2898.47, 1152.21, 61.2394 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition(< 1573.72, 2311.07, 67.6735 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition(< -367.262, 3196.18, 91.738 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition( < -2981.22, 3265.91, 189.761 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition(< -2932.81, 2434.09, 186.632 >, eStationaryAIPositionTypes.MORTAR_TITAN)
	AddStationaryAIPosition(< -3482.25, 378.056, 64.9166 >, eStationaryAIPositionTypes.MORTAR_TITAN)

	AddStationaryAIPosition(< -1162.47, -212.165, 420.081 >, eStationaryAIPositionTypes.SNIPER_TITAN)
	AddStationaryAIPosition(< -2933.15, -183.271, 422.031 >, eStationaryAIPositionTypes.SNIPER_TITAN)



	int index = 1
	 array<WaveEvent> wave1

	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateShownewsEvent("伊甸園？",1,index++))


	 wave1.append(CreateDroppodSpectreMortarEvent(< -2157.37, 622.049, 348.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -2118.91, 1134.47, 348.031  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -1834.76, 1873.66, 448.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -1317.92, 2004.5, 456.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	 wave1.append(CreateDroppodSpectreMortarEvent(< -1561.79, 2828.26, 492.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -2216.4, 3069.97, 416.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 2985.61, 344.271, 208.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 3173.41, -3.40744, 340.031 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	 wave1.append(CreateDroppodSpectreMortarEvent(< 2172.05, -2292.67, 368.031  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 1515.48, -2279.74, 332.031  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(<  3407.4, -479.958, 422.031  >,"",index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )

 	 wave1.append(CreateDroppodSpectreMortarEvent(< -1748.04, 635.719, 63.7954 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -1278.95, 2408.33, 306.03 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< -893.747, 2214.2, 126.23  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 2316.25, 2827.75, 120.031  >,"",index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 3210.92, 3245.28, 120.031  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 3717.96, 2599.67, 63.7953 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 4680.97, 1170.69, 225.065 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 3893.67, 75.4765, 72.0313  >,"",index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 5633.7, -1221.96, 68.2686   >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 2575.68, -3260.13, 66.6531  >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateDroppodSpectreMortarEvent(< 609.008, -1176.81, 204.03 >,"",index++))
	 wave1.append(CreateWaitUntilAliveEvent( 4, index++ ) )

	  wave1.append(CreateMortarTitanEvent(<  5358.22, -1188.92, 76.1857  >,<  0, 70, 0 >,index++))
	  wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  5262.78, 626.801, 63.806  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  5536.79, 1248.68, 67.9544  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  5257.71, 2035.66, 64.9597  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	  wave1.append(CreateMortarTitanEvent(< 3733.44, 2665.98, 63.7953  >,<  0, 70, 0 >,index++))
	  wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(< 2898.47, 1152.21, 61.2394  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  1573.72, 2311.07, 67.6735  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(< -367.262, 3196.18, 91.738  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  -2981.22, 3265.91, 189.761  >,<  0, 70, 0 >,index++))
	 // wave1.append(CreateWaitForTimeEvent(2,index++))
	 // wave1.append(CreateMortarTitanEvent(<  -2932.81, 2434.09, 186.632  >,<  0, 70, 0 >,index++))
	  wave1.append(CreateWaitForTimeEvent(2,index++))
		 wave1.append(CreateSuperSpectreEvent(   < 917.029, -1769.7, 63.7955 > , < 0, 101.423, 0 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
	 wave1.append(CreateSuperSpectrenukeEvent(   <4575.05, -1399.7, 61.2395> , < 0, 101.423, 0 >,"",index++))
	 wave1.append(CreateWaitForTimeEvent(2,index++))
		 wave1.append(CreateMortarTitanEvent(<  -3482.25, 378.056, 64.9166  >,<  0, 70, 0 >,0))
	 waveEvents.append(wave1)

	  index = 1
      array<WaveEvent> wave2

	  wave2.append(CreateShownewsEvent("伊甸園？會有煙花？",1,index++))
	  wave2.append(CreateMonarchTitanEvent(< -2837.28, 3065.01, 180.146 > , < 0, 32.729, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateLegionTitanEvent( < -2959.58, 2528.53, 178.061 > , < 0, -108.067, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateDroppodGruntEvent( < 1006.05, -2226.02, 53.6523 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreatemarvinEvent(< 3489.56, 21.5109, 72.0313 >,"",index++))


	  wave2.append(CreateMonarchTitanEvent(< 1044.62, -32.2168, 59.8125 > , < 0, -173.317, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateLegionTitanEvent( < -2894.23, 2921.02, 180.261 > , < 0, 94.5842, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateDroppodGruntEvent( < 2524.38, -31.3229, 63.7954 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateWaitUntilAliveEvent( 8, index++ ) )

	  wave2.append(CreateRoninTitanEvent( < -2894.23, 2921.02, 180.261 > , < 0, 94.5842, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateRoninTitanEvent( < -2837.28, 3065.01, 180.146 > , < 0, -75.9283, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateIonTitanEvent(< -2713.35, 1755.34, 149.8 > , < 0, -90.4905, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateDroppodStalkerEvent(< -1826.44, 1525.13, 130.913 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent(8, index++ ) )

	  wave2.append(CreateRoninTitanEvent( < -1125.57, 1234.45, 66.6415 > , < 0, -146.671, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateRoninTitanEvent(< -377.935, 1414.08, 66.6415 > , < 0, -134.471, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateIonTitanEvent(< -564.849, 1915.72, 99.1891 > , < 0, 116.023, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateDroppodStalkerEvent(< -1075.47, 1105, 64.54 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 8, index++ ) )


	  wave2.append(CreateCloakDroneEvent(< -2959.58, 2528.53, 200 >,< 0.0 , 0.0 , 0.0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateToneTitanEvent( < -2959.58, 2528.53, 178.061 > , < 0, -108.067, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateMonarchTitanEvent(< -2837.28, 3065.01, 180.146 > , < 0, 32.729, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateDroppodGruntEvent(< -831.431, 508.455, 72.0313 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 8, index++ ) )



	  wave2.append(CreateCloakDroneEvent(< 1044.62, -32.2168, 200 >,< 0.0 , 0.0 , 0.0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateToneTitanEvent(< 1044.62, -32.2168, 59.8125 > , < 0, -173.317, 0 >		,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateLegionTitanEvent( < -2894.23, 2921.02, 180.261> , < 0, 94.5842, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 10, index++ ) )

	  wave2.append(CreateDroppodGruntEvent(< 240.305, -1644.88, 63.7955 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateArcTitanEvent( < 1515.67, -1667.92, 63.8367 > , < 0, 144.53, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateCloakDroneEvent(< 1515.67, -1667.92, 200 >,< 0.0 , 0.0 , 0.0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent(5, index++ ) )
	  wave2.append(CreateDroppodGruntEvent(< 561.92, -1116.87, 204.031 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))


	  wave2.append(CreateCloakDroneEvent(< -1162.47, -212.165, 500 >,< 0.0 , 0.0 , 0.0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateNorthstarSniperTitanEvent(  < -1162.47, -212.165, 420.081>, < 0, 156.939, 0 >,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 12, index++ ) )
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateMortarTitanEvent(<  -2932.81, 2434.09, 186.632  >,<  0, 70, 0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateMortarTitanEvent(< -367.262, 3196.18, 91.738  >,<  0, 70, 0 >,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 5, index++ ) )
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateScorchTitanEvent( < 2516.25, 849.805, 57.6159 > , < 0, -146.616, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append( CreateSpawnDroneEvent( < -2547.71, 835.68, 652.48 >, <  0, 70, 0 >,"fly3", index++, false ) )
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append( CreateSpawnDroneEvent( < 3078.95, -310.718, 768.333  >, <  0, 70, 0 >,"fly4", index++, false ) )
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	  wave2.append(CreateCloakDroneEvent(< 1515.67, -1667.92, 200 >,< 0.0 , 0.0 , 0.0 >,index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateSuperSpectreEvent(    < 2522.16, 579.686, 63.7954 >, < 0, 156.939, 0 >,"",index++))
 	  wave2.append(CreateWaitForTimeEvent(1,index++))
	  wave2.append(CreateSuperSpectreEvent(   < 2497.27, 333.004, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	  wave2.append(CreateWaitForTimeEvent(1,index++))

	  wave2.append(CreateArcTitanEvent(< 2785.1, -1799.86, 67.0043 > , < 0, -146.302, 0 >,"",0))

	 waveEvents.append(wave2)

	 index = 1
     array<WaveEvent> wave3

	 wave3.append(CreateShownewsEvent("伊甸園？會有死神煙花么？",1,index++))


	 wave3.append(CreateSuperSpectreEvent(   < 917.029, -1769.7, 63.7955 > , < 0, 101.423, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateSuperSpectrenukeEvent(   <4575.05, -1399.7, 61.2395> , < 0, 101.423, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateNukeTitanEvent(< 4051.32, -1513.34, 61.2395 > , < 0, -178.082, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateNukeTitanEvent(< 4575.05, -1399.7, 61.2395 > , < 0, -0.685717, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateToneTitanEvent(< 2785.1, -1799.86, 67.0043 > , < 0, -146.302, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateToneTitanEvent( < 3393, -1634.28, 61.2395 > , < 0, -172.581, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))


	 wave3.append(CreateNukeTitanEvent(< -2894.23, 2921.02, 180.261 > , < 0, -84.16, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateNukeTitanEvent(< -2893.07, 3251.66, 183.498 > , < 0, 64.0131, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateToneTitanEvent( < -2270.89, 1859.2, 153.723 > , < 0, -129.897, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateToneTitanEvent(  < -2191.82, 1571.06, 146.809 > , < 0, -102.85, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))


	 wave3.append(CreateWaitUntilAliveEvent( 4, index++ ) )
	 wave3.append(CreateNukeTitanEvent(< 4051.32, -1513.34, 61.2395 > , < 0, -178.082, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateNukeTitanEvent(< 4575.05, -1399.7, 61.2395 > , < 0, -0.685717, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateArcTitanEvent(< 2785.1, -1799.86, 67.0043 > , < 0, -146.302, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateArcTitanEvent( < 3393, -1634.28, 61.2395 > , < 0, -172.581, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))


	 wave3.append(CreateNukeTitanEvent(< -2894.23, 2921.02, 180.261 > , < 0, -84.16, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateNukeTitanEvent(< -2893.07, 3251.66, 183.498 > , < 0, 64.0131, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateArcTitanEvent( < -2270.89, 1859.2, 153.723 > , < 0, -129.897, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateSuperSpectrenukeEvent(   < 917.029, -1769.7, 63.7955 > , < 0, 101.423, 0 >,"",index++))
	 wave3.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	 wave3.append(CreateWaitForTimeEvent(2,index++))

	 wave3.append(CreateSuperSpectrenukeEvent(  < 2442.3, -0.298166, 63.7954 > , < 0, -103.874, 0 >,"",index++))
	 wave3.append(CreateSuperSpectreEvent(   < 2409.15, -646.82, 63.7954 > , < 0, -103.006, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateSuperSpectreEvent(   < 865.046, -359.279, 55.8383 > , < 0, 179.168, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateSuperSpectreEvent(    < 781.982, -18.2116, 60.2098 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateToneTitanEvent( < 2476.13, 335.031, 63.7954 > , < 0, -31.2322, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 6, index++ ) )

	 wave3.append(CreateMortarTitanEvent(<  1573.72, 2311.07, 67.6735  >,<  0, 70, 0 >,index++))
	 wave3.append(CreateWaitForTimeEvent(2,index++))
	 wave3.append(CreateMortarTitanEvent(<  -2932.81, 2434.09, 186.632  >,<  0, 70, 0 >,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 6, index++ ) )
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(    < 3867.7, 749.529, 63.5416 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3810.56, 1143.5, 80.5253 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3555.2, 1092.16, 61.2434 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3275.83, 1159.17, 61.2464 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2944.86, 1174.24, 61.2394 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2120.41, 889.153, 55.7956 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2396.74, -1721.79, 63.7965 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateNukeTitanEvent(< 4575.05, -1399.7, 61.2395 > , < 0, -0.685717, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateSuperSpectrenukeEvent(    < 2366.54, -1355.59, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2449.36, -944.033, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2532.01, 915.045, 60.8784 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(    < 2522.16, 579.686, 63.7954 >, < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2497.27, 333.004, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateArcTitanEvent(< 2785.1, -1799.86, 67.0043 > , < 0, -146.302, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2453.84, -754.777, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2450.92, -95.0443, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2099.89, -516.478, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 2116.18, -121.052, 63.7954 >, < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 1798.54, -434.502, 63.8212 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 1682.57, -30.0971, 60.1107 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 1262.82, -341.5, 57.2539 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 1183.71, -58.0543, 59.7957 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateArcTitanEvent( < 3393, -1634.28, 61.2395 > , < 0, -172.581, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateSuperSpectrenukeEvent(    < 3867.7, 749.529, 63.5416 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3810.56, 1143.5, 80.5253 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3555.2, 1092.16, 61.2434 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 3275.83, 1159.17, 61.2464 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2944.86, 1174.24, 61.2394 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2120.41, 889.153, 55.7956 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2396.74, -1721.79, 63.7965 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(    < 2366.54, -1355.59, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2449.36, -944.033, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2532.01, 915.045, 60.8784 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(    < 2522.16, 579.686, 63.7954 >, < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateNorthstarSniperTitanEvent(    < -1162.47, -212.165, 420.081>, < 0, 156.939, 0 >,index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2497.27, 333.004, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2453.84, -754.777, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(   < 2450.92, -95.0443, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 2099.89, -516.478, 63.7954 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 2116.18, -121.052, 63.7954 >, < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(   < 1798.54, -434.502, 63.8212 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateNorthstarSniperTitanEvent(   < -2933.15, -183.271, 422.031 >, < 0, 156.939, 0 >,index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateSuperSpectreEvent(  < 1682.57, -30.0971, 60.1107 >  , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectreEvent(  < 1262.82, -341.5, 57.2539 > , < 0, 156.939, 0 >,"",index++))
	 wave3.append(CreateWaitForTimeEvent(0.5,index++))
	 wave3.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	 wave3.append(CreateSuperSpectrenukeEvent(  < 1183.71, -58.0543, 59.7957 > , < 0, 156.939, 0 >,"",index++))



	 wave3.append(CreateNukeTitanEvent( < 2120.41, 889.153, 55.7956 >,< 0.0 , 105.0 , 0.0 >,"",0))
	 waveEvents.append(wave3)

		 index = 1
     array<WaveEvent> wave4

	 wave4.append(CreateWaitForTimeEvent( 10, index++ ) )
	 wave4.append(CreateShownewsEvent("馬文：無人機也會夢見煙花嗎！",1,index++))

	 wave4.append(CreatemarvinEvent(< -1640.65, 2108.66, 132.318 >,"",index++))
	 wave4.append(CreatemarvinEvent( < 2251.12, 2340.26, 63.7953 >,"",index++))
	 wave4.append(CreatemarvinEvent(< 1041.99, 294.011, 67.8343 >,"",index++))
	 wave4.append(CreatemarvinEvent(< 3904.72, -772.819, 72.0313 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < -2926.79, 3085.59, 598.687 > , < 0, -45.7206, 0 >,"fly3", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < -2797.93, 1764.48, 525.69 > , < 0, -58.8387, 0 >,"fly3", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))

	 wave4.append( CreateSpawnDroneEvent( < 928.623, -7319.1, 744.053 > , < 0, 131.25, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < 1515.27, -6804.63, 744.053 > , < 0, 131.25, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < 1394.01, -8507.9, 740.752 > , < 0, 123.642, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < 72.077, -4727.31, 933.793 > , < 0, 171.658, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )

	 wave4.append( CreateSpawnDroneEvent( < 1398.59, -5313.31, 903.092 > , < 0, 134.625, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < 2117.52, -6039.12, 813.523 > , < 0, 136.216, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < 2661.05, -6560.05, 705.006 > , < 0, 136.216, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < -91.671, -3300.47, 764.347 > , < 0, 173.345, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )


	 wave4.append( CreateSpawnDroneEvent( < 1053.38, -4178.78, 1080.85 > , < 0, 141.04, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < -866.949, -5090.78, 1086.54 > , < 0, 99.7628, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < -1248.95, -5940, 1241.89 > , < 0, 112.444, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )



	 wave4.append( CreateSpawnDroneEvent( < 928.623, -7319.1, 744.053 > , < 0, 131.25, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < 1515.27, -6804.63, 744.053 > , < 0, 131.25, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < 1394.01, -8507.9, 740.752 > , < 0, 123.642, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < 72.077, -4727.31, 933.793 > , < 0, 171.658, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )

	 wave4.append( CreateSpawnDroneEvent( < 1398.59, -5313.31, 903.092 > , < 0, 134.625, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < 2117.52, -6039.12, 813.523 > , < 0, 136.216, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < 2661.05, -6560.05, 705.006 > , < 0, 136.216, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndroneworkerEvent( < -91.671, -3300.47, 764.347 > , < 0, 173.345, 0 >,"fly2", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )

	 wave4.append( CreateSpawnDroneEvent( < 1053.38, -4178.78, 1080.85 > , < 0, 141.04, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronerocketEvent( < -866.949, -5090.78, 1086.54 > , < 0, 99.7628, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitForTimeEvent(2,index++))
	 wave4.append( CreateSpawndronebeamEvent(  < -1248.95, -5940, 1241.89 > , < 0, 112.444, 0 >,"fly1", index++, false ) )
	 wave4.append(CreateWaitUntilAliveEvent( 16, index++ ) )







	 wave4.append(CreateShownewsEvent("馬文：紅紅的是什麼，是我的煙花！",1,index++))
	 wave4.append(CreateSuperSpectreEventWithMinion(< -2890, 1650.88, 154.404  >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< -2971.31, 3192.66, 188.649>,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 1873.66, 2631.05, 63.7953  >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< -2708.83, 456.663, 64.5469 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 2849.33, 2125.69, 63.7953  >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 596.378, -339.111, 61.5854	>,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 3589.76, 1029.92, 61.2394  >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 3314.32, -1653.38, 61.2395 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< -280.248, 3172.13, 87.3923 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 2694.72, -1797.04, 67.0661 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< -126.612, 1456.69, 66.6622 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 1279.49, 1094.6, 55.492 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 2738.27, -2830.66, 59.3036 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 1684.31, -3088.13, 43.9493 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 4926.92, -1198.81, 61.2395 >,< 0 , 160 , 0 >,"",index++))
	 wave4.append(CreateWaitUntilAliveEvent( 24, index++ ) )
	 wave4.append(CreateWaitForTimeEvent( 2, index++ ) )
	 wave4.append(CreateSuperSpectreEventWithMinion(< 904.11, -1720.22, 63.7955  >,< 0 , 160 , 0 >,"",index++))

	 wave4.append(CreateTonenukeTitanEvent(< 2259 , 2564 , 80 >,< 0.0 , 180.0 , 0.0 >,"",0))
	 waveEvents.append(wave4)






	index = 1
    array<WaveEvent> wave5

	wave5.append(CreateWaitForTimeEvent(5.0,index++))
	wave5.append(CreateShownewsEvent("最後一波",1,index++))


	wave5.append(CreateLegionTitanEvent( < 2068.54, -3017.75, 51.2843 > , < 0, -171.018, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(2.0,index++))
	wave5.append(CreateLegionTitanEvent(< 1140.93, -3078.35, 49.5561 > , < 0, 115.922, 0 >,"titan4",index++))
	wave5.append(CreateWaitForTimeEvent(5.0,index++))
	wave5.append( CreateSpawndronebeamEvent(   < -2967.97, 2349.83, 552.004 > , < 0, -91.9851, 0 >,"fly3", index++, false ) )
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateMortarTitanEvent(<  5358.22, -1188.92, 76.1857  >,<  0, 70, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateWaitForTimeEvent(2.5,index++))
	wave5.append(CreateToneTitanEvent(< 2454.73, -798.3, 63.7954 > , < 0, -88.4113, 0 >,"titan1",index++))
	wave5.append(CreateWaitForTimeEvent(1.0,index++))
	wave5.append(CreateToneTitanEvent(< 2519.09, 141.747, 63.7954 > , < 0, -106.301, 0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append( CreateSpawndronerocketEvent( < 2262.68, -605.359, 836.245 > , < 0, 99.7628, 0 >,"fly4", index++, false ) )
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateWaitForTimeEvent(1.5,index++))
	wave5.append(CreateMortarTitanEvent(<  5262.78, 626.801, 63.806  >,<  0, 70, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateArcTitanEvent(< -1129.28, 1446.12, 65.2667 > , < 0, -85.9458, 0 >,"titan4",index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateWaitForTimeEvent(12,index++))

				//////////////////////
	wave5.append(CreateIonTitanEvent(< -2849.05, 3161.79, 181.205 > , < 0, -96.5782, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(3.0,index++))
	wave5.append(CreateScorchTitanEvent( < -3046.56, 2557.84, 174.258 > , < 0, -102.884, 0 >,"titan1",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append( CreateSpawndronebeamEvent(  < -2712.27, 2909.38, 690.973 > , < 0, -80.1471, 0 >,"fly3", index++, false ) )
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateScorchTitanEvent( < -2493.89, 2391.94, 166.769 > , < 0, -65.7065, 0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateMortarTitanEvent(<  5257.71, 2035.66, 64.9597  >,<  0, 70, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateMortarTitanEvent(<  5536.79, 1248.68, 67.9544  >,<  0, 70, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateNorthstarSniperTitanEvent(    < -1162.47, -212.165, 420.081>, < 0, 156.939, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(10,index++))




	// wave4.append( CreateSpawndronebeamEvent(   < -2910.42, 1762.08, 623.952 > , < 0, -67.9565, 0 >,"fly3", index++, false ) )
	// wave4.append(CreateWaitForTimeEvent(2,index++))


	//
	// wave4.append(CreateWaitUntilAliveEvent( 30, index++ ) )

	wave5.append(CreateIonTitanEvent(< 2775.68, -2947.5, 61.0118 > , < 0, 146.333, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.0,index++))
	wave5.append(CreateLegionTitanEvent(< 2834.95, -2449.74, 69.9372 > , < 0, 99.1268, 0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateCloakDroneEvent(< 1676.77, -3074.31, 143.892 > , < 0, 150.336, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(0.5,index++))
	wave5.append(CreateRoninTitanEvent(< 1161.22, -3051.9, 44.8224 > , < 0, 74.2847, 0 >,"titan4",index++))
	wave5.append(CreateWaitForTimeEvent(5.0,index++))

	wave5.append(CreateRoninTitanEvent( < 1009.44, -2240.41, 53.9855 > , < 0, -90.563, 0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateScorchTitanEvent( < 2328.39, -1600.76, 63.7955 > , < 0, 57.7303, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateToneTitanEvent( < 3210.12, -1568.61, 65.3856 > , < 0, -6.47443, 0 >,"titan1",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append( CreateSpawndronerocketEvent( < 1404.15, -178.271, 784.529 > , < 0, 99.7628, 0 >,"fly4", index++, false ) )
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateMonarchTitanEvent( < 2068.54, -3017.75, 51.2843 > , < 0, -171.018, 0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateMonarchTitanEvent( < 1009.44, -2240.41, 53.9855 > , < 0, -90.563, 0 >,"titan4",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateIonTitanEvent( < 1140.93, -3078.35, 49.5561 > , < 0, 115.922, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateScorchTitanEvent( < 5124.37, -1311.25, 82.7349 > , < 0, -8.93219, 0 >,"titan2",index++))

	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateScorchTitanEvent( < 5498.22, -1136.36, 74.2652 > , < 0, 92.8103, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateArcTitanEvent( < -578.366, 1921.99, 101.081 > , < 0, -100.411, 0 >,"titan1",index++))
	wave5.append(CreateWaitForTimeEvent(10.3,index++))

	wave5.append(CreateNorthstarSniperTitanEvent(   < -2933.15, -183.271, 422.031 >, < 0, 156.939, 0 >,index++))
	wave5.append(CreateSuperSpectreEvent( < 2454.73, -798.3, 63.7954 > , < 0, -88.4113, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateSuperSpectreEvent( < -2832.66, 2950.05, 177.835 > , < 0, -90.0283, 0 >,"titan4",index++))
	wave5.append(CreateWaitForTimeEvent(1.5,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateDroppodGruntEvent( < -290.243, -606.524, 56.4533 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(0.6,index++))
	wave5.append(CreateDroppodStalkerEvent(< 689 , -1569 , 128 >,"",index++))
	wave5.append(CreateWaitForTimeEvent(0.8,index++))
	wave5.append(CreateMortarTitanEvent(< -367.262, 3196.18, 91.738  >,<  0, 70, 0 >,index++))
	wave5.append(CreateWaitForTimeEvent(2,index++))
	wave5.append(CreateDroppodGruntEvent(< 587.268, -1192.46, 204.031 >,"",index++))
	wave5.append(CreateWaitForTimeEvent(1.2,index++))
	wave5.append(CreateDroppodStalkerEvent(< -1768.99, 674.084, 63.7954 >,"",index++))
	wave5.append(CreateWaitForTimeEvent(1.5,index++))
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
	wave5.append(CreateLegionTitanEvent(< -2466.3, 2615.22, 160.715 > , < 0, -92.2464, 0 >,"titan4",index++))
	wave5.append(CreateWaitForTimeEvent(3.5,index++))
	wave5.append(CreateIonTitanEvent(< -3115.69, 2524.03, 173.267 > , < 0, -122.368, 0 >,"titan3",index++))
	wave5.append(CreateWaitForTimeEvent(1.5,index++))
	wave5.append(CreateIonTitanEvent( < -211.508, 3211.78, 82.2876 >,< 0.0 , 90.0 , 0.0 >,"titan2",index++))
	wave5.append(CreateWaitForTimeEvent(5.0,index++))
	wave5.append( CreateSpawndronerocketEvent(  < 2783.79, -418.689, 880.548 > , < 0, 99.7628, 0 >,"fly4", index++, false ) )
	wave5.append(CreateWaitForTimeEvent(2,index++))

	wave5.append(CreateWaitUntilAliveEvent( 4, index++ ) )

	wave5.append(CreateWaitForTimeEvent(20,index++))






	wave5.append(CreateShownewsEvent( " 煙花！煙花！煙花！",1,index++))

	wave5.append( CreateArcTitanEvent( < 2519.09, 141.747, 63.7954 > , < 0, -106.301, 0 >, "titan4", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 0.6799927, index++ ) )
    wave5.append( CreateScorchnukeTitanEvent( < -2849.05, 3161.79, 181.205 > , < 0, -96.5782, 0 >, "titan3", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 1.2200317, index++ ) )
    wave5.append( CreateScorchnukeTitanEvent(< -3046.56, 2557.84, 174.258 > , < 0, -102.884, 0 >, "titan1", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 0.90997314, index++ ) )
    wave5.append( CreateTonenukeTitanEvent( < 2068.54, -3017.75, 51.2843 > , < 0, -171.018, 0 >, "titan3", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 0.5700073, index++ ) )
    wave5.append( CreateTonenukeTitanEvent( < -126.612, 1456.69, 66.6622 >,< 0 , 160 , 0 >, "titan4", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 1.4000244, index++ ) )
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
    wave5.append( CreateRoninnukeTitanEvent(  < 2120.41, 889.153, 55.7956 >  , < 0, 156.939, 0 >, "titan2", index++ ))
    wave5.append( CreateWaitForTimeEvent( 0.9299927, index++ ) )
    wave5.append( CreateRoninnukeTitanEvent( < -2466.3, 2615.22, 160.715 > , < 0, -92.2464, 0 >, "titan1", index++ ))
    wave5.append( CreateWaitForTimeEvent( 0.8899536, index++ ) )
    wave5.append( CreateCloakDroneEvent(< 1140.93, -3078.35, 49.5561 > , < 0, 115.922, 0 >, index++ ) )
    wave5.append( CreateWaitForTimeEvent( 4.3898926, index++ ) )
    wave5.append( CreateSuperSpectrenukeEvent( < -1220.81, 414.301, 62.3158 > , < 0, 79.2269, 0 >, "titan3", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 1.2000732, index++ ) )
    wave5.append( CreateSuperSpectrenukeEvent( < 2481.21, 544.718, 63.8104 > , < 0, -98.2314, 0 >, "titan3", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 0.92993164, index++ ) )
    wave5.append( CreateSuperSpectrenukeEvent( < 2306.43, -1602.92, 63.8045 > , < 0, -116.021, 0 >, "titan2", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 0.5800781, index++ ) )
	wave5.append(CreateWaitUntilAliveEvent( 10, index++ ) )
    wave5.append( CreateSuperSpectrenukeEvent( < 1078.34, -3019.8, 46.2057 > , < 0, 148.701, 0 >, "titan2", index++ ) )
    wave5.append( CreateWaitForTimeEvent( 5.0, index++ ) )
    wave5.append( CreateWaitUntilAliveWeightedEvent( 16, index++ ) )
	wave5.append(CreateIonnukeTitanEvent(< 2450.92, -95.0443, 63.7954 >,< 0 , 70 , 0 >,"titan4",index++))
    wave5.append( CreateWaitForTimeEvent( 0.9000244, index++ ) )
	wave5.append(CreateRoninnukeTitanEvent(< 2068.54, -3017.75, 51.2843 >,< 0 , 0 , 0 >,"titan2",index++))
    wave5.append( CreateWaitForTimeEvent( 1.5, index++ ) )
	wave5.append(CreateIonnukeTitanEvent(< 1183.71, -58.0543, 59.7957 >,< 0 , 70 , 0 >,"titan1",index++))
	wave5.append(CreateWaitForTimeEvent(1.3,index++))
	wave5.append(CreateRoninnukeTitanEvent(< 2519.09, 141.747, 63.7954 >,< 0 , -10 , 0 >,"titan4",0))



	waveEvents.append(wave5)
}

void function RegisterCustomFDContent()
{
	//SpawnFDHeavyTurret( < -2397, -1237, 72 >, < 0, 0, 0 >, < -2556, -1027, 208 >, < 0, -90, 0 > )
	
	// entity FDProp1 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2016, 176 >, < 0, -90, 0 >, 6 )
	// FDProp1.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp1, false )
	
	// entity FDProp2 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2144, 176 >, < 0, -90, 0 >, 6 )
	// FDProp2.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp2, false )
	
	// entity FDProp3 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2272, 176 >, < 0, -90, 0 >, 6 )
	// FDProp3.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp3, false )
	
	// entity FDProp4 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2016, 272 >, < 0, -90, 0 >, 6 )
	// FDProp4.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp4, false )
	
	// entity FDProp5 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2144, 272 >, < 0, -90, 0 >, 6 )
	// FDProp5.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp5, false )
	
	// entity FDProp6 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2272, 272 >, < 0, -90, 0 >, 6 )
	// FDProp6.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp6, false )
	
	// entity FDProp7 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -2400, 176 >, < 0, -90, 0 >, 6 )
	// FDProp6.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp7, false )
	
	// entity FDProp8 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -1888, 176 >, < 0, -90, 0 >, 6 )
	// FDProp8.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp8, false )
	
	// entity FDProp9 = CreatePropDynamicLightweight( $"models/imc_base/cargo_container_imc_01_blue.mdl", < -921, -1888, 272 >, < 0, -90, 0 >, 6 )
	// FDProp9.SetAIObstacle( true )
	// ToggleNPCPathsForEntity( FDProp9, false )

		
	routes[ "a1" ] <- []
	routes[ "a1" ].append( < -1153.71,-9.48, 796.51>  )
	routes[ "a1" ].append(  < -1238.71,-132.40, 588> )
	routes[ "a1" ].append( < -1393.01,-2044.25, 492.47>)
	routes[ "a1" ].append( < -2095, -1708, 52 > )



	routes[ "a2" ] <- []
	routes[ "a2" ].append( < 641.927, -190.789, 61.5337 >  )
	routes[ "a2" ].append( < -1717.21, -153.998, 65.9879 > )
	routes[ "a2" ].append( < -1292.4, -1999.98, 58.2624 >  )


	
	routes[ "a3" ] <- []
	routes[ "a3" ].append(  < 641.927, -190.789, 61.5337 >  )
	routes[ "a3" ].append(  < -1717.21, -153.998, 65.9879 >  )
	routes[ "a3" ].append(   < -1843.26, -2018.51, 69.6593 > )



	routes[ "titan1" ] <- []
	routes[ "titan1" ].append( < 274.151, -1641.71, 63.7955 > )
	routes[ "titan1" ].append( < -372.803, -1288.51, 63.2603 > )
	routes[ "titan1" ].append( < -1113.71, -1670.18, 83.8593 > )
	routes[ "titan1" ].append( < -1430.23, -2049.35, 68.392 >  )


	routes[ "titan2" ] <- []
	routes[ "titan2" ].append( < 137.858, -1654.83, 63.7955 > )
	routes[ "titan2" ].append( < -663.603, -1885.79, 66.3624 > )
	routes[ "titan2" ].append( < -1227.71, -2328.47, 82.4641 > )


	routes[ "titan3" ] <- []
	routes[ "titan3" ].append(  < -1555.42, -347.684, 66.3533 >)
	routes[ "titan3" ].append( < -1517.48, -1124.34, 75.6882 >  )
	routes[ "titan3" ].append(  < -1511.05, -1867.65, 83.1252 > )




	
	routes[ "titan4" ] <- []
	routes[ "titan4" ].append( < -1950.9, -63.5382, 66.5513 >)
	routes[ "titan4" ].append( < -1957.34, -938.738, 72.0413 > )
	routes[ "titan4" ].append( < -2107.18, -1570.74, 40.3927 > )
	routes[ "titan4" ].append( < -1994.58, -2010.75, 48.588 >  )


	
	
	routes[ "leftRoadMain" ] <- []
	routes[ "leftRoadMain" ].append( < -2774, 2067, 173 > )
	routes[ "leftRoadMain" ].append( < -2544, 269, 72 > )
	routes[ "leftRoadMain" ].append( < -1893, -677, 176 > )
	routes[ "leftRoadMain" ].append( < -2095, -1708, 52 > )
	
	routes[ "roadDesertMain" ] <- []
	routes[ "roadDesertMain" ].append( < 2636, 1113, 61 > )
	routes[ "roadDesertMain" ].append( < 2488, -172, 63 > )
	routes[ "roadDesertMain" ].append( < -283, -177, 57 > )
	routes[ "roadDesertMain" ].append( < -1609, -671, 182 > )
	routes[ "roadDesertMain" ].append( < -1172, -1477, 77 > )
	
	routes[ "eastDesertRoadMain" ] <- []
	routes[ "eastDesertRoadMain" ].append( < 4285, -1363, 65 > )
	routes[ "eastDesertRoadMain" ].append( < 809, -1753, 63 > )
	routes[ "eastDesertRoadMain" ].append( < -1121, -1697, 84 > )
	
	routes[ "westRoadFlank" ] <- []
	routes[ "westRoadFlank" ].append( < 1353, 2090, 64 > )
	routes[ "westRoadFlank" ].append( < 430, 1288, 56 > )
	routes[ "westRoadFlank" ].append( < -1038, 1302, 66 > )
	routes[ "westRoadFlank" ].append( < -1579, -670, 176 > )
	routes[ "westRoadFlank" ].append( < -2095, -1708, 52 > )
	
	routes[ "cliffsideRoad" ] <- []
	routes[ "cliffsideRoad" ].append( < -258, 3033, 108 > )
	routes[ "cliffsideRoad" ].append( < -357, 1473, 66 > )
	routes[ "cliffsideRoad" ].append( < -1295, 303, 63 > )
	routes[ "cliffsideRoad" ].append( < -1596, -673, 176 > )
	routes[ "cliffsideRoad" ].append( < -1210, -1604, 90 > )
	
	routes[ "southRoadInfantry" ] <- []
	routes[ "southRoadInfantry" ].append( < -3253, 567, 54 > )
	routes[ "southRoadInfantry" ].append( < -2414, 48, 61 > )
	routes[ "southRoadInfantry" ].append( < -2503, -923, 72 > )
	routes[ "southRoadInfantry" ].append( < -2426, -1864, 72 > )
	
	routes[ "desertBuildingsInfantry" ] <- []
	routes[ "desertBuildingsInfantry" ].append( < 2498, 623, 63 > )
	routes[ "desertBuildingsInfantry" ].append( < 2069, 460, 72 > )
	routes[ "desertBuildingsInfantry" ].append( < 282, 326, 72 > )
	routes[ "desertBuildingsInfantry" ].append( < -641, -191, 63 > )
	routes[ "desertBuildingsInfantry" ].append( < -881, -717, 208 > )
	routes[ "desertBuildingsInfantry" ].append( < -955, -1058, 208 > )
	
	routes[ "eastBuildingsInfantry" ] <- []
	routes[ "eastBuildingsInfantry" ].append( < 2335, -907, 63 > )
	routes[ "eastBuildingsInfantry" ].append( < 1430, -980, 68 > )
	routes[ "eastBuildingsInfantry" ].append( < 509, -1270, 68 > )
	routes[ "eastBuildingsInfantry" ].append( < -955, -1058, 208 > )
	
	routes[ "desertDeepMainAvenue" ] <- []
	routes[ "desertDeepMainAvenue" ].append( < 4804, 1470, 92 > )
	routes[ "desertDeepMainAvenue" ].append( < 2489, 912, 58 > )
	routes[ "desertDeepMainAvenue" ].append( < 2456, -95, 63 > )
	routes[ "desertDeepMainAvenue" ].append( < -281, -269, 56 > )
	routes[ "desertDeepMainAvenue" ].append( < -1892, -673, 176 > )
	routes[ "desertDeepMainAvenue" ].append( < -2112, -1688, 51 > )
	
	routes[ "eastCrates" ] <- []
	routes[ "eastCrates" ].append( < 1828, -3108, 45 > )
	routes[ "eastCrates" ].append( < 921, -1737, 63 > )
	routes[ "eastCrates" ].append( < -1151, -1794, 84 > )
	
	routes[ "droneMain" ] <- []
	routes[ "droneMain" ].append( < 2397, 749, 422 > )
	routes[ "droneMain" ].append( < 2466, -406, 422 > )
	routes[ "droneMain" ].append( < 2127, -1621, 63 > )
	routes[ "droneMain" ].append( < -788, -1832, 81 > )
	routes[ "droneMain" ].append( < -1743, -978, 72 > )
	routes[ "droneMain" ].append( < -1511, -181, 422 > )
	routes[ "droneMain" ].append( < -1178, 970, 60 > )
	routes[ "droneMain" ].append( < -382, 1526, 67 > )
	routes[ "droneMain" ].append( < 802, 1257, 55 > )
	routes[ "droneMain" ].append( < 1580, 933, 56 > )
	
	routes[ "droneReverse" ] <- []
	routes[ "droneReverse" ].append( < 2397, 749, 422 > )
	routes[ "droneReverse" ].append( < 1580, 933, 56 > )
	routes[ "droneReverse" ].append( < 802, 1257, 55 > )
	routes[ "droneReverse" ].append( < -382, 1526, 67 > )
	routes[ "droneReverse" ].append( < -1178, 970, 60 > )
	routes[ "droneReverse" ].append( < -1511, -181, 422 > )
	routes[ "droneReverse" ].append( < -1743, -978, 72 > )
	routes[ "droneReverse" ].append( < -788, -1832, 81 > )
	routes[ "droneReverse" ].append( < 2127, -1621, 63 > )
	routes[ "droneReverse" ].append( < 2466, -406, 422 > )
	
	routes[ "acrossAvenueInfantry" ] <- []
	routes[ "acrossAvenueInfantry" ].append( < 2486, 465, 63 > )
	routes[ "acrossAvenueInfantry" ].append( < 1433, 461, 67 > )
	routes[ "acrossAvenueInfantry" ].append( < 484, 438, 67 > )
	routes[ "acrossAvenueInfantry" ].append( < 663, -556, 68 > )
	routes[ "acrossAvenueInfantry" ].append( < 139, -629, 204 > )
	routes[ "acrossAvenueInfantry" ].append( < 58, -1195, 68 > )
	routes[ "acrossAvenueInfantry" ].append( < -955, -1058, 208 > )


	routes[ "fly1" ] <- []
	routes[ "fly1" ].append( < -34.5477, -5104.11, 563.012 >) 
	routes[ "fly1" ].append( < -1512, -3691.07, 603.067 >  ) 
	routes[ "fly1" ].append( < -1861.46, -2219.1, 481.849 >  )

	routes[ "fly2" ] <- []
	routes[ "fly2" ].append(   < -177.588, -3850.08, 450.835 >)
	routes[ "fly2" ].append(  < -979.975, -2681.94, 455.284 >  )
	routes[ "fly2" ].append(  < -1178.08, -1835.18, 280.425 > )


	routes[ "fly3" ] <- []
	routes[ "fly3" ].append( < -2547.71, 835.68, 652.48 > )
	routes[ "fly3" ].append( < -2298.73, -417.137, 615.16 > )
	routes[ "fly3" ].append( < -2008.7, -2079.23, 404.197> )


	routes[ "fly4" ] <- []
	routes[ "fly4" ].append(  < 3078.95, -310.718, 768.333 > )
	routes[ "fly4" ].append( < 1492.78, -118.664, 649.557 >  )
	routes[ "fly4" ].append( < 83.2781, -200.295, 673.661 > )
	routes[ "fly4" ].append( < -1207.7, -2156.69, 479.987 >  )

}