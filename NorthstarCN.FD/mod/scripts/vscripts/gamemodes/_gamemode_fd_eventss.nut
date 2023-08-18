global function CreateSpawndronerocketEvent
global function CreateSpawndroneworkerEvent
global function CreateSpawndronebeamEvent
global function CreatemarvinEvent
global function CreateShownewsEvent
global function CreateDroppodRocketDroneGruntEvent
global function CreateDroppodShieldDroneGruntEvent
global function CreateElitePilotAssassinGruntEvent
global function CreateDroppodshieldGruntEvent


// global function CreateTitanfallBlockEvent //Careful when using this, it really changes gameplay perspective for players and can make a wave impossible to beat (Use 1 to Block, and 0 to Unblock midwave)
// global function CreateGruntDropshipEvent //This one always requires testing after usage because sometimes Grunts wont zipline to the ground, also good to explicitly set up their route, or they may do some long pathing

// TryAutoAssignAntiTitanWeapon( npc )






// /****************************************************************************************************************\
// ####### #     # ####### #     # #######     #####  ####### #     # ####### ######     #    ####### ####### ######
// #       #     # #       ##    #    #       #     # #       ##    # #       #     #   # #      #    #     # #     #
// #       #     # #       # #   #    #       #       #       # #   # #       #     #  #   #     #    #     # #     #
// #####   #     # #####   #  #  #    #       #  #### #####   #  #  # #####   ######  #     #    #    #     # ######
// #        #   #  #       #   # #    #       #     # #       #   # # #       #   #   #######    #    #     # #   #
// #         # #   #       #    ##    #       #     # #       #    ## #       #    #  #     #    #    #     # #    #
// #######    #    ####### #     #    #        #####  ####### #     # ####### #     # #     #    #    ####### #     #
// \*****************************************************************************************************************/



WaveEvent function CreateDroppodRocketDroneGruntEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnDroppodRocketDroneGrunts
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.GRUNT
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	return event
}



WaveEvent function CreateDroppodShieldDroneGruntEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "" ,float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = spawnShieldDroneGrunts
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.GRUNT
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	return event
}


WaveEvent function CreateElitePilotAssassinGruntEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnElitePilotAssassinGrunts
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.GRUNT
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	return event
}




WaveEvent function CreateDroppodshieldGruntEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnDroppodshieldGrunts
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.GRUNT
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	return event
}

// WaveEvent function CreateDroppodGruntEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "" )
// {
// 	WaveEvent event
// 	event.eventFunction = spawnDroppodGrunts
// 	event.executeOnThisCall = executeOnThisCall
// 	event.nextEventIndex = nextEventIndex
// 	event.shouldThread = true
// 	event.spawnEvent.spawnType= eFD_AITypeIDs.GRUNT
// 	event.spawnEvent.spawnAmount = 4
// 	event.spawnEvent.origin = origin
// 	event.spawnEvent.route = route
// 	event.spawnEvent.entityGlobalKey = entityGlobalKey
// 	return event
// }










WaveEvent function CreatemarvinEvent( vector origin, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnmarvins
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.STALKER
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateSpawndronerocketEvent(vector origin,vector angles,string route,int nextEventIndex, bool shouldLoop = true, int executeOnThisCall = 1, string entityGlobalKey="" , float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = Spawndronerockets
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.route = route
	event.spawnEvent.shouldLoop = shouldLoop
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateSpawndronebeamEvent(vector origin,vector angles,string route,int nextEventIndex, bool shouldLoop = true, int executeOnThisCall = 1, string entityGlobalKey="" , float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = Spawndronebeams
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 4
	event.spawnEvent.origin = origin
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.route = route
	event.spawnEvent.shouldLoop = shouldLoop
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateSpawndroneworkerEvent(vector origin,vector angles,string route,int nextEventIndex, bool shouldLoop = true, int executeOnThisCall = 1, string entityGlobalKey="" , float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = Spawndroneworker
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.route = route
	event.spawnEvent.shouldLoop = shouldLoop
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateShownewsEvent( string news,int amount,int nextEventIndex, int executeOnThisCall = 1 )
{
	WaveEvent event
	event.eventFunction = Shownewss
	event.spawnEvent.Shownews = news
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = false
	event.flowControlEvent.waitAmount = amount
	return event
}



// /************************************************************************************************************\
// ####### #     # ####### #     # #######    ####### #     # #     #  #####  ####### ### ####### #     #  #####
// #       #     # #       ##    #    #       #       #     # ##    # #     #    #     #  #     # ##    # #     #
// #       #     # #       # #   #    #       #       #     # # #   # #          #     #  #     # # #   # #
// #####   #     # #####   #  #  #    #       #####   #     # #  #  # #          #     #  #     # #  #  #  #####
// #        #   #  #       #   # #    #       #       #     # #   # # #          #     #  #     # #   # #       #
// #         # #   #       #    ##    #       #       #     # #    ## #     #    #     #  #     # #    ## #     #
// #######    #    ####### #     #    #       #        #####  #     #  #####     #    ### ####### #     #  #####
// \************************************************************************************************************/


void function spawnDroppodRocketDroneGrunts( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning RocketDroneGrunt Drop Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity pod = CreateDropPod( spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	DropToGround(pod)
	SetTeam( pod, TEAM_IMC )
	InitFireteamDropPod( pod )

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	string at_weapon = GetConVarString( "ns_fd_grunt_at_weapon" )
	array<entity> guys

	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateRocketDroneGrunt( TEAM_IMC, spawnEvent.origin, < 0, 0, 0 > )
		
	
		thread ActivatePersonalShield( guy )
		
		
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey+ i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		guy.EnableNPCFlag(  NPC_ALLOW_INVESTIGATE | NPC_ALLOW_HAND_SIGNALS | NPC_ALLOW_FLEE )
		guy.DisableNPCFlag( NPC_ALLOW_PATROL )
		DispatchSpawn( guy )
		guy.SetEfficientMode( true )
		guy.SetParent( pod, "ATTACH", true )
		SetSquad( guy, squadName )

		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.GRUNT ) ) // do shield captains get their own target name in vanilla?
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		guys.append( guy )
	}
	
	waitthread LaunchAnimDropPod( pod, "pod_testpath", spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	ActivateFireteamDropPod( pod, guys )
	foreach( npc in guys )
	{
		npc.SetEfficientMode( false )
		thread singleNav_thread( npc, spawnEvent.route )
	}
}

void function spawnShieldDroneGrunts( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning spawnShieldDroneGrunts Drop Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity pod = CreateDropPod( spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	SetTeam( pod, TEAM_IMC )
	DropToGround(pod)
	InitFireteamDropPod( pod )

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	string at_weapon = GetConVarString( "ns_fd_grunt_at_weapon" )
	array<entity> guys

	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateShieldDroneGrunt( TEAM_IMC, spawnEvent.origin, < 0, 0, 0 > )
		

		thread ActivatePersonalShield( guy )
		
		
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey+ i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		guy.EnableNPCFlag(  NPC_ALLOW_INVESTIGATE | NPC_ALLOW_HAND_SIGNALS | NPC_ALLOW_FLEE )
		guy.DisableNPCFlag( NPC_ALLOW_PATROL )

		DispatchSpawn( guy )
		guy.SetEfficientMode( true )
		guy.SetParent( pod, "ATTACH", true )
		SetSquad( guy, squadName )

		// should this grunt have an anti titan weapon instead of its normal weapon?
		if ( i < GetCurrentPlaylistVarInt( "fd_grunt_at_weapon_users", 0 ) )
		{
			if( at_weapon == "mp_weapon_defender" )
				guy.GiveWeapon( at_weapon, [ "quick_charge" ] )
			else
				guy.GiveWeapon( at_weapon )
		}

		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.GRUNT ) ) // do shield captains get their own target name in vanilla?
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		guys.append( guy )
	}
	
	waitthread LaunchAnimDropPod( pod, "pod_testpath", spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	ActivateFireteamDropPod( pod, guys )
	foreach( npc in guys )
	{
		npc.SetEfficientMode( false )
		thread singleNav_thread( npc, spawnEvent.route )
	}
}

void function spawnElitePilotAssassinGrunts( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning spawnspawnElitePilotAssassinGrunts Drop Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity pod = CreateDropPod( spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	DropToGround(pod)
	SetTeam( pod, TEAM_IMC )
	InitFireteamDropPod( pod )

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	string at_weapon = GetConVarString( "ns_fd_grunt_at_weapon" )
	array<entity> guys

	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateElitePilotAssassin( TEAM_IMC, spawnEvent.origin, < 0, 0, 0 > )

			
		thread ActivatePersonalShield( guy )
		
		
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey+ i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		guy.EnableNPCFlag(  NPC_ALLOW_INVESTIGATE | NPC_ALLOW_HAND_SIGNALS | NPC_ALLOW_FLEE )
		guy.DisableNPCFlag( NPC_ALLOW_PATROL )
		if ( FD_GruntWeapons.len() > 0 )
		{
			string baseweapon = FD_GruntWeapons[ RandomInt( FD_GruntWeapons.len() ) ]
			SetSpawnOption_Weapon( guy, baseweapon )
		}
		DispatchSpawn( guy )
		guy.SetEfficientMode( true )
		guy.SetParent( pod, "ATTACH", true )
		SetSquad( guy, squadName )

		//guy.GiveWeapon(  "mp_weapon_arc_launcher " )
		

		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.GRUNT ) ) // do shield captains get their own target name in vanilla?
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		guys.append( guy )
	}
	
	waitthread LaunchAnimDropPod( pod, "pod_testpath", spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	ActivateFireteamDropPod( pod, guys )
	foreach( npc in guys )
	{
		npc.SetEfficientMode( false )
		thread singleNav_thread( npc, spawnEvent.route )
	}
}


void function spawnDroppodshieldGrunts( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning shieldGrunt Drop Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity pod = CreateDropPod( spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	DropToGround(pod)
	SetTeam( pod, TEAM_IMC )
	InitFireteamDropPod( pod )

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	
	array<entity> guys

	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateSoldier( TEAM_IMC, spawnEvent.origin, < 0, 0, 0 > )
		
		// should this grunt be a shield captain?
		if (i < 4 )
		{
			if ( GetConVarBool( "ns_fd_allow_true_shield_captains" ) )
				SetSpawnOption_AISettings( guy, "npc_soldier_shield_captain" )
			else
				thread ActivatePersonalShield( guy )
		}
		
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey+ i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		guy.EnableNPCFlag(  NPC_ALLOW_INVESTIGATE | NPC_ALLOW_HAND_SIGNALS | NPC_ALLOW_FLEE )
		guy.DisableNPCFlag( NPC_ALLOW_PATROL )
		SetSpawnOption_Weapon( guy, "mp_weapon_smr" )
		DispatchSpawn( guy )
		guy.SetEfficientMode( true )
		guy.SetParent( pod, "ATTACH", true )
		SetSquad( guy, squadName )

		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.GRUNT ) ) // do shield captains get their own target name in vanilla?
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		guys.append( guy )
	}
	
	waitthread LaunchAnimDropPod( pod, "pod_testpath", spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	ActivateFireteamDropPod( pod, guys )
	foreach( npc in guys )
	{
		npc.SetEfficientMode( false )
		thread singleNav_thread( npc, spawnEvent.route )
	}
}



























void function spawnmarvins( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning nmarvin Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity pod = CreateDropPod( spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	SetTeam( pod, TEAM_IMC )
	DropToGround(pod)
	InitFireteamDropPod( pod )

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	array<entity> guys

	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateMarvin( TEAM_IMC, spawnEvent.origin, < 0, 0, 0 > )



		SetTeam( guy, TEAM_IMC )
		DispatchSpawn( guy )

		guy.SetEfficientMode( true )
		guy.SetParent( pod, "ATTACH", true )
		SetSquad( guy, squadName )


		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.STALKER ) ) // do shield captains get their own target name in vanilla?
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		guys.append( guy )
	}

	waitthread LaunchAnimDropPod( pod, "pod_testpath", spawnEvent.origin, < 0, RandomIntRange( 0, 359 ), 0 > )
	ActivateFireteamDropPod( pod, guys )
	wait 200
	foreach( npc in guys )
	{
		if( IsValid(npc) && IsAlive(npc) )
			{npc.Die()}

	}
}





void function Spawndronerockets( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Spawndronerockets at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	array<vector> offsets = [ < 0, 32, 0 >, < 32, 0, 0 >, < 0, -32, 0 >, < -32, 0, 0 > ]

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateGenericDrone( TEAM_IMC, spawnEvent.origin + offsets[i], spawnEvent.angles )
		SetSpawnOption_AISettings( guy, "npc_drone_rocket_fast" )
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey + i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		DispatchSpawn( guy )
		guy.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
		guy.EnableNPCFlag( NPC_STAY_CLOSE_TO_SQUAD )
		guy.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_PREFER_SPRINT )
		SetSquad( guy, squadName )
		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.DRONE ) )
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		thread droneNav_thread(guy, spawnEvent.route, 0, 16, spawnEvent.shouldLoop )
	}
}

void function Spawndronebeams( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Spawndronerockets at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	array<vector> offsets = [ < 0, 32, 0 >, < 32, 0, 0 >, < 0, -32, 0 >, < -32, 0, 0 > ]

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateGenericDrone( TEAM_IMC, spawnEvent.origin + offsets[i], spawnEvent.angles )
		SetSpawnOption_AISettings( guy, "npc_drone_beam" )
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey + i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		DispatchSpawn( guy )
		guy.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
		guy.EnableNPCFlag( NPC_STAY_CLOSE_TO_SQUAD )
		guy.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_PREFER_SPRINT )
		SetSquad( guy, squadName )
		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.DRONE ) )
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		thread droneNav_thread(guy, spawnEvent.route, 0, 16, spawnEvent.shouldLoop )
	}
}

void function Spawndroneworker( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Spawndronerockets at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	array<vector> offsets = [ < 0, 32, 0 >, < 32, 0, 0 >, < 0, -32, 0 >, < -32, 0, 0 > ]

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateGenericDrone( TEAM_IMC, spawnEvent.origin + offsets[i], spawnEvent.angles )
		SetSpawnOption_AISettings( guy, "npc_drone_beam" )
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey + i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		DispatchSpawn( guy )
		guy.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
		guy.EnableNPCFlag( NPC_STAY_CLOSE_TO_SQUAD )
		guy.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_PREFER_SPRINT )
		SetSquad( guy, squadName )
		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.DRONE ) )
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		Highlight_SetEnemyHighlight( guy, "enemy_sonar" )
		thread droneNav_thread(guy, spawnEvent.route, 0, 16, spawnEvent.shouldLoop )
		//thread NukedroneThink( guy, fd_harvester.harvester )
	}
}



//Hack by using one of the existing struct vars, hopefully nothing will break
void function Shownewss( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

		if ( flowControlEvent.waitAmount == 1 )
		{
			print( spawnEvent.Shownews )
			foreach( entity player in GetPlayerArray() )
			{
				NSSendAnnouncementMessageToPlayer(player, spawnEvent.Shownews, "敬告", <1,1,0>, 1, 1)
			}
		}


}




// /****************************************************************************************\
// ####### #     # ####### #     # #######    #     # ####### #       ######  ####### ######
// #       #     # #       ##    #    #       #     # #       #       #     # #       #     #
// #       #     # #       # #   #    #       #     # #       #       #     # #       #     #
// #####   #     # #####   #  #  #    #       ####### #####   #       ######  #####   ######
// #        #   #  #       #   # #    #       #     # #       #       #       #       #   #
// #         # #   #       #    ##    #       #     # #       #       #       #       #    #
// #######    #    ####### #     #    #       #     # ####### ####### #       ####### #     #
// \****************************************************************************************/


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

