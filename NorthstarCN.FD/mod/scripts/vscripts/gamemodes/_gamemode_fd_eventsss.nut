
global function CreateSuperSpectrenukeEvent
global function CreateIonnukeTitanEvent
global function CreateScorchnukeTitanEvent
global function CreateRoninnukeTitanEvent
global function CreateTonenukeTitanEvent
global function CreateLegionnukeTitanEvent
global function CreateMonarchnukeTitanEvent







/****************************************************************************************************************\
####### #     # ####### #     # #######     #####  ####### #     # ####### ######     #    ####### ####### ######
#       #     # #       ##    #    #       #     # #       ##    # #       #     #   # #      #    #     # #     #
#       #     # #       # #   #    #       #       #       # #   # #       #     #  #   #     #    #     # #     #
#####   #     # #####   #  #  #    #       #  #### #####   #  #  # #####   ######  #     #    #    #     # ######
#        #   #  #       #   # #    #       #     # #       #   # # #       #   #   #######    #    #     # #   #
#         # #   #       #    ##    #       #     # #       #    ## #       #    #  #     #    #    #     # #    #
#######    #    ####### #     #    #        #####  ####### #     # ####### #     # #     #    #    ####### #     #
\*****************************************************************************************************************/



WaveEvent function CreateSuperSpectrenukeEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnSuperSpectres
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.REAPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateIonnukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnIonTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.ION
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateScorchnukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnScorchTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.SCORCH
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRoninnukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnRoninTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.RONIN
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateTonenukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnToneTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateLegionnukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnLegionTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.LEGION
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateMonarchnukeTitanEvent( vector origin, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnMonarchTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.MONARCH
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnEvent.spawnradius = spawnradius
	return event
}

/************************************************************************************************************\
####### #     # ####### #     # #######    ####### #     # #     #  #####  ####### ### ####### #     #  #####
#       #     # #       ##    #    #       #       #     # ##    # #     #    #     #  #     # ##    # #     #
#       #     # #       # #   #    #       #       #     # # #   # #          #     #  #     # # #   # #
#####   #     # #####   #  #  #    #       #####   #     # #  #  # #          #     #  #     # #  #  #  #####
#        #   #  #       #   # #    #       #       #     # #   # # #          #     #  #     # #   # #       #
#         # #   #       #    ##    #       #       #     # #    ## #     #    #     #  #     # #    ## #     #
#######    #    ####### #     #    #       #        #####  #     #  #####     #    ### ####### #     #  #####
\************************************************************************************************************/


void function spawnSuperSpectres( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Common Reaper at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5.7 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	wait 1.7
	TryAnnounceTitanfallWarningToEnemyTeam( TEAM_IMC, spawnEvent.origin )
	wait 3.0

	entity npc = CreateSuperSpectre( TEAM_IMC, spawnEvent.origin, spawnEvent.angles )
	DropToGround(npc)
	SetSpawnOption_AISettings( npc, "npc_super_spectre" )
	spawnedNPCs.append( npc )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	DispatchSpawn( npc )
	npc.SetAllowMelee( true )
	npc.SetAllowSpecialJump( true )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) )
	AddMinimapForHumans( npc )
	thread SuperSpectre_WarpFall( npc )
	npc.WaitSignal( "WarpfallComplete" )
	npc.SetCapabilityFlag( bits_CAP_MOVE_TRAVERSE, true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnIonTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Ion Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnEvent.origin, spawnEvent.angles)
	DropToGround(npc)
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb_boss_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function SpawnScorchTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Scorch Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnEvent.origin, spawnEvent.angles )
	DropToGround(npc)
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		/* I don't wanna know if this is vanilla behavior or not, i stopped accepting Scorches should aimbot the moment i got killed in the frame the respawn
		dropship made me and another guy vulnerable and this motherfucker simply decided to snipe us midair, not even Northstars does this all the time but
		this son of a bitch does whenever he has the chance, so now i made sure hes a drunk guy who cant handle shit even on his face */
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor_boss_fd" )
		npc.kv.AccuracyMultiplier = 0.5
		npc.kv.WeaponProficiency = eWeaponProficiency.AVERAGE
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function SpawnRoninTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Ronin Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_stryder", TEAM_IMC, spawnEvent.origin, spawnEvent.angles)
	DropToGround(npc)
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings (npc, "npc_titan_stryder_leadwall_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings (npc, "npc_titan_stryder_leadwall" )
		else
			SetSpawnOption_AISettings (npc, "npc_titan_stryder_leadwall_boss_fd" )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function SpawnToneTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Tone Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnEvent.origin, spawnEvent.angles)
	DropToGround(npc)
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd" )
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function SpawnLegionTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Legion Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnEvent.origin, spawnEvent.angles )
	DropToGround(npc)
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_boss_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function SpawnMonarchTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Monarch Titan at: " + spawnEvent.origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnEvent.origin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnEvent.origin, spawnEvent.angles )
	DropToGround(npc)
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc,"npc_titan_atlas_vanguard_boss_fd_elite" )
		SetTitanAsElite( npc )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc,"npc_titan_atlas_vanguard" )
		else
			SetSpawnOption_AISettings( npc,"npc_titan_atlas_vanguard_boss_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetEnemyChangeCallback( OnFDHarvesterTargeted )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	Highlight_SetEnemyHighlight( npc, "enemy_sonar" )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}





/****************************************************************************************\
####### #     # ####### #     # #######    #     # ####### #       ######  ####### ######
#       #     # #       ##    #    #       #     # #       #       #     # #       #     #
#       #     # #       # #   #    #       #     # #       #       #     # #       #     #
#####   #     # #####   #  #  #    #       ####### #####   #       ######  #####   ######
#        #   #  #       #   # #    #       #     # #       #       #       #       #   #
#         # #   #       #    ##    #       #     # #       #       #       #       #    #
#######    #    ####### #     #    #       #     # ####### ####### #       ####### #     #
\****************************************************************************************/


void function PingMinimap( float x, float y, float duration, float spreadRadius, float ringRadius, int colorIndex )
{
	foreach( entity player in GetPlayerArray() )
	{
		Remote_CallFunction_NonReplay( player, "ServerCallback_FD_PingMinimap", x, y, duration, spreadRadius, ringRadius, colorIndex )
		EmitSoundOnEntityOnlyToPlayer( player, player, "coop_minimap_ping" )
	}
}

void function waitUntilLessThanAmountAlive( int amount )
{	
	int deduct = 0
	foreach ( entity npc in spawnedNPCs )
	{
		if( !IsValid(npc) )
		{
			deduct++
			continue
		}
		if( IsValid( GetPetTitanOwner( npc ) ) )
		{
			deduct++
			continue
		}
		if( npc.GetTeam() == TEAM_MILITIA )
		{
			deduct++
			continue
		}
	}
	int aliveNPCs = spawnedNPCs.len() - deduct
	while( aliveNPCs > amount )
	{
		WaitFrame()
		deduct = 0
		foreach ( entity npc in spawnedNPCs )
		{
			if( !IsValid( npc ) )
			{
				deduct++
				continue
			}
			if( IsValid( GetPetTitanOwner( npc ) ) )
			{
				deduct++
				continue
			}
			if( npc.GetTeam() == TEAM_MILITIA )
			{
				deduct++
				continue
			}
		}
		aliveNPCs = spawnedNPCs.len() - deduct
		
		if( !IsHarvesterAlive( fd_harvester.harvester ) )
			return
	}
}

void function waitUntilLessThanAmountAliveWeighted( int amount, int humanWeight = 1, int reaperWeight = 3, int titanWeight = 5 )
{

	int aliveNPCsWeighted = 0;
	foreach( npc in spawnedNPCs )
	{	
		if( !IsValid( npc ) )
			continue

		if( IsValid( GetPetTitanOwner( npc ) ) )
			continue
		
		if( npc.GetTeam() == TEAM_MILITIA )
			continue
		
		if( npc.IsTitan() )
			aliveNPCsWeighted += titanWeight
		else if( npc.GetTargetName() == "reaper" )
			aliveNPCsWeighted += reaperWeight
		else
			aliveNPCsWeighted += humanWeight
	}
	while( aliveNPCsWeighted > amount )
	{
		WaitFrame()
			aliveNPCsWeighted = 0;
			foreach( npc in spawnedNPCs )
			{	
				if( !IsValid( npc ) )
					continue
				
				if( IsValid( GetPetTitanOwner( npc ) ) )
					continue
				
				if( npc.GetTeam() == TEAM_MILITIA )
					continue
				
				if( npc.IsTitan() )
					aliveNPCsWeighted += titanWeight
				else if( npc.GetTargetName() == "reaper" )
					aliveNPCsWeighted += reaperWeight
				else
					aliveNPCsWeighted += humanWeight
			}
		if( !IsHarvesterAlive( fd_harvester.harvester ) )
			return
	}
}

void function AddMinimapForTitans( entity titan )
{
	titan.Minimap_SetAlignUpright( true )
	titan.Minimap_AlwaysShow( TEAM_IMC, null )
	titan.Minimap_AlwaysShow( TEAM_MILITIA, null )
	titan.Minimap_SetHeightTracking( true )
	titan.Minimap_SetCustomState( eMinimapObject_npc_titan.AT_BOUNTY_BOSS )
}

// including drones
void function AddMinimapForHumans( entity human )
{
	human.Minimap_SetAlignUpright( true )
	human.Minimap_AlwaysShow( TEAM_IMC, null )
	human.Minimap_AlwaysShow( TEAM_MILITIA, null )
	human.Minimap_SetHeightTracking( true )
	human.Minimap_SetCustomState( eMinimapObject_npc.AI_TDM_AI )
}

void function SlowEnemyMovementBasedOnDifficulty( entity npc )
{
	//This is not exact vanilla behavior i think, but enemies definetely moves slower on Frontier Defense than player autotitans
	switch ( difficultyLevel )
	{
		case eFDDifficultyLevel.EASY:
		case eFDDifficultyLevel.NORMAL:
			npc.SetNPCMoveSpeedScale( 0.75 )
			break
		case eFDDifficultyLevel.HARD:
		case eFDDifficultyLevel.MASTER:
		case eFDDifficultyLevel.INSANE:
			npc.SetNPCMoveSpeedScale( 0.5 )
			break
	}
}

void function SetTitanAsElite( entity npc )
{
	if( GetGameState() != eGameState.Playing || !IsHarvesterAlive( fd_harvester.harvester ) )
		return
	
	if ( npc.IsTitan() && elitesAllowed )
	{
		thread MonitorEliteTitanCore( npc )
		npc.ai.bossTitanType = 1
		npc.kv.disable_vdu = 1
		npc.kv.skip_boss_intro = 1
		npc.kv.AccuracyMultiplier = 5
		npc.kv.WeaponProficiency = eWeaponProficiency.PERFECT
	}
}

void function MonitorEliteTitanCore( entity npc )
{
	wait 6
	
	if( GetGameState() != eGameState.Playing || !IsHarvesterAlive( fd_harvester.harvester ) )
		return
	
	AddCreditToTitanCoreBuilder( npc, 1.0 )
	entity soul = npc.GetTitanSoul()
	if ( IsValid( soul ) )
		SoulTitanCore_SetNextAvailableTime( soul, 1 )
}

void function Drop_Spawnpoint( vector origin, int team, float impactTime )
{
	array<entity> targetEffects = []
	vector surfaceNormal = < 0, 0, 1 >

	int index = GetParticleSystemIndex( $"P_ar_titan_droppoint" )

	entity effectEnemy = StartParticleEffectInWorld_ReturnEntity( index, origin, surfaceNormal )
	SetTeam( effectEnemy, team )
	EffectSetControlPointVector( effectEnemy, 1, < 255, 64, 16 > )
	effectEnemy.kv.VisibilityFlags = ENTITY_VISIBLE_TO_ENEMY
	targetEffects.append( effectEnemy )
	
	wait impactTime

	foreach( entity targetEffect in targetEffects )
	{
		if ( IsValid( targetEffect ) )
			EffectStop( targetEffect )
	}
}

void function OnFDHarvesterTargeted( entity titan )
{
	entity enemy = titan.GetEnemy()
	if ( enemy == fd_harvester.harvester )
	{
		titan.SetCapabilityFlag( bits_CAP_INNATE_MELEE_ATTACK1, false )
		titan.SetCapabilityFlag( bits_CAP_INNATE_MELEE_ATTACK2, false )
		titan.DisableNPCFlag( NPC_DIRECTIONAL_MELEE )
		titan.SetAllowMelee( false )
	}
	else
	{
		titan.SetAllowMelee( true )
		titan.EnableNPCFlag( NPC_DIRECTIONAL_MELEE )
		titan.SetCapabilityFlag( bits_CAP_INNATE_MELEE_ATTACK1, true )
		titan.SetCapabilityFlag( bits_CAP_INNATE_MELEE_ATTACK2, true )
	}
}

