untyped
global function CreateSpawnShipEvent
global function CreateSpawndronerocketEvent
global function CreateSpawndroneworkerEvent
global function CreateSpawndronebeamEvent
global function CreateSpawndroneShieldEvent
global function CreateSpawndroneEMPEvent
global function CreatemarvinEvent
global function CreateShownewsEvent
global function CreateBOSSEvent
global function CreateEnemyEvent
global function CreateDroppodRocketDroneGruntEvent
global function CreateDroppodShieldDroneGruntEvent
global function CreateElitePilotAssassinGruntEvent
global function CreateDroppodshieldGruntEvent

global function CreateGiveNuclearEvent
global function CreateTakeNuclearEvent


global function CreateSuperSpectrenukeEvent
global function CreateIonnukeTitanEvent
global function CreateScorchnukeTitanEvent
global function CreateRoninnukeTitanEvent
global function CreateTonenukeTitanEvent
global function CreateLegionnukeTitanEvent
global function CreateMonarchnukeTitanEvent
global function flyThink
global function create_emp_decoy

const float MAX_WAIT_TIME = 6.0
const float POP_DELAY = 0.8
const float PULL_DELAY = 2.0
const float PUSH_DELAY = 0.2
const float POP_HEIGHT = 60
const float PULL_RANGE = 100.0
const float PULL_STRENGTH_MAX = 300.0
const float PULL_VERT_VEL = 220
const float PUSH_STRENGTH_MAX = 125.0
const float EXPLOSION_DELAY = 0.1
const float FX_END_CAP_TIME = 1.5
const FD_TITAN_AOE_REACTTIME = 3

// global struct SpawnEvent{
// 	void functionref(array<vector>) eventFunction
// 	WaveEvent WaveEvent

//  }

// /****************************************************************************************************************\
// ####### #     # ####### #     # #######     #####  ####### #     # ####### ######     #    ####### ####### ######
// #       #     # #       ##    #    #       #     # #       ##    # #       #     #   # #      #    #     # #     #
// #       #     # #       # #   #    #       #       #       # #   # #       #     #  #   #     #    #     # #     #
// #####   #     # #####   #  #  #    #       #  #### #####   #  #  # #####   ######  #     #    #    #     # ######
// #        #   #  #       #   # #    #       #     # #       #   # # #       #   #   #######    #    #     # #   #
// #         # #   #       #    ##    #       #     # #       #    ## #       #    #  #     #    #    #     # #    #
// #######    #    ####### #     #    #        #####  ####### #     # ####### #     # #     #    #    ####### #     #
// \*****************************************************************************************************************/

WaveEvent function CreateSpawnShipEvent( vector origin,vector angles,  string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnShips
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	return event
}


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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateSpawndroneShieldEvent(vector origin,vector angles,string route,int nextEventIndex, bool shouldLoop = true, int executeOnThisCall = 1, string entityGlobalKey="" , float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = SpawndroneShield
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.route = route
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.shouldLoop = shouldLoop
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateSpawndroneEMPEvent(vector origin,vector angles,string route,int nextEventIndex, bool shouldLoop = true, int executeOnThisCall = 1, string entityGlobalKey="" , float spawnradius = 0.0)
{
	WaveEvent event
	event.eventFunction = SpawnEMPdrone
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.DRONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origin = origin
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.route = route
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
	event.shouldThread = false
	event.flowControlEvent.waitAmount = amount
	return event
}

WaveEvent function CreateGiveNuclearEvent( int amount,int nextEventIndex, int executeOnThisCall = 1 )
{
	WaveEvent event
	event.eventFunction = GiveNuclear
	//event.spawnEvent.spawnAmount = spawnAmount
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.spawnInDifficulty = eFDSD.ALL
	event.shouldThread = true
	event.flowControlEvent.waitAmount = amount
	return event
}

WaveEvent function CreateTakeNuclearEvent( int amount,int nextEventIndex, int executeOnThisCall = 1 )
{
	WaveEvent event
	event.eventFunction = TakeNuclear
	//event.spawnEvent.spawnAmount = spawnAmount
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.spawnInDifficulty = eFDSD.ALL
	event.shouldThread = true
	event.flowControlEvent.waitAmount = amount
	return event
}



WaveEvent function CreateBOSSEvent( vector origin, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = BOSSEvent
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.spawnInDifficulty = eFDSD.ALL
	event.shouldThread = true
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateEnemyEvent( vector origin, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = EnemyEvent
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.spawnInDifficulty = eFDSD.ALL
	event.shouldThread = true
	event.spawnEvent.origin = origin
	event.spawnEvent.angles = angles
	event.spawnEvent.spawnradius = spawnradius
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

void function SpawnShips( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning SpawnShips Drop Pod at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity ship =ExtraSpawner_SpawnGunShip( spawnEvent.origin,spawnEvent.angles, TEAM_IMC)
	spawnedNPCs.append( ship )
	//spawnedNPCs.append( ship )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- ship
	SetTargetName( ship, GetTargetNameForID( spawnEvent.spawnType ) )
	//AddMinimapForTitans( ship )

	ship.Minimap_AlwaysShow( TEAM_IMC, null )
	ship.Minimap_AlwaysShow( TEAM_MILITIA, null )
	ship.Minimap_SetHeightTracking( true )
	ship.Minimap_SetCustomState( eMinimapObject_npc.AI_TDM_AI )

	thread droneNav_thread( ship, spawnEvent.route, 0 , 160, true)
}

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
			TakeAllWeapons( guy )
			guy.GiveWeapon( "mp_weapon_car" )
			guy.GiveWeapon( "mp_weapon_wingman" )
			guy.kv.grenadeWeaponName = "mp_weapon_frag_grenade"
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
	wait 100
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
		thread droneNav_thread(guy, spawnEvent.route, 0, 160, spawnEvent.shouldLoop )
	}
}


void function Spawndronebeams( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning Spawndronebeams at: " + spawnEvent.origin )
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
		//thread FD_DroneShieldThink( guy )
		//thread EMPDroneThinkConstant(guy)
		thread droneNav_thread(guy, spawnEvent.route, 0, 160, spawnEvent.shouldLoop )
	}
}

void function SpawndroneShield( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning SpawndroneShield at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	array<vector> offsets = [ < 0, 32, 0 >, < 32, 0, 0 >, < 0, -32, 0 >, < -32, 0, 0 > ]

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
	for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
   {
		entity guy = CreateGenericDrone( TEAM_IMC, spawnEvent.origin + offsets[i], spawnEvent.angles )
		SetSpawnOption_AISettings( guy, "npc_drone_plasma_fast" )
		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey + i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )
		// array<entity> weapons = guy.GetMainWeapons()
        // foreach( entity weapon in weapons )
        // {
        //     guy.TakeWeaponNow( weapon.GetWeaponClassName() )
        // }
		DispatchSpawn( guy )
		guy.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
		guy.EnableNPCFlag( NPC_STAY_CLOSE_TO_SQUAD )
		guy.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_PREFER_SPRINT )
		SetSquad( guy, squadName )
		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.DRONE ) )
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		thread FD_DroneShieldThink( guy )
		//thread npcdie(guy)

		//thread EMPDroneThinkConstant(guy)
		//thread droneNav_thread(guy, spawnEvent.route, 0, 16, spawnEvent.shouldLoop )
	}
}

void function SpawnEMPdrone( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	printt( "Spawning SpawnEMPdrone at: " + spawnEvent.origin )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	array<vector> offsets = [ < 0, 32, 0 >, < 32, 0, 0 >, < 0, -32, 0 >, < -32, 0, 0 > ]

	string squadName = MakeSquadName( TEAM_IMC, UniqueString() )
		for ( int i = 0; i < spawnEvent.spawnAmount; i++ )
    {
		entity guy = CreateGenericDrone( TEAM_IMC, spawnEvent.origin + offsets[i], spawnEvent.angles )
		SetSpawnOption_AISettings( guy, "npc_drone_plasma_fast" )

		if( spawnEvent.entityGlobalKey != "" )
			GlobalEventEntitys[ spawnEvent.entityGlobalKey + i.tostring() ] <- guy
		SetTeam( guy, TEAM_IMC )

		// array<entity> weapons = guy.GetMainWeapons()
        // foreach( entity weapon in weapons )
        // {
        //     guy.TakeWeaponNow( weapon.GetWeaponClassName() )
        // }

		DispatchSpawn( guy )
		guy.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
		guy.EnableNPCFlag( NPC_STAY_CLOSE_TO_SQUAD )
		guy.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_PREFER_SPRINT )
		SetSquad( guy, squadName )
		SetTargetName( guy, GetTargetNameForID( eFD_AITypeIDs.DRONE ) )
		AddMinimapForHumans( guy )
		spawnedNPCs.append( guy )
		//thread FD_DroneShieldThink( guy )
		thread EMPDroneThinkConstant(guy)
		//thread droneNav_thread(guy, spawnEvent.route, 0, 16, spawnEvent.shouldLoop )
		//thread npcdie(guy)
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
				NSSendAnnouncementMessageToPlayer(player, spawnEvent.Shownews, "=========", <1,1,0>, 1, 1)

			}
		}
}

void function GiveNuclear( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

		if ( flowControlEvent.waitAmount == 1 )
		{
			foreach( entity player in GetPlayerArray() )
			{
				if( player.GetPlayerNetInt( "numSuperRodeoGrenades" ) < 8 )
				{
					if( player.GetPlayerNetInt( "numSuperRodeoGrenades" ) < 3 )
					{
						NSSendInfoMessageToPlayer(player,"你得到了核武訓牛！！")
					}
					player.SetPlayerNetInt( "numSuperRodeoGrenades", 8	)
				}
		}
	}
}


void function TakeNuclear( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

		if ( flowControlEvent.waitAmount == 1 )
		{
			foreach( entity player in GetPlayerArray() )
			{
				player.SetPlayerNetInt( "numSuperRodeoGrenades", 0 )
				NSSendInfoMessageToPlayer(player,"你失去了所有的核武訓牛！！")
			}
		}
}

void function EnemyEvent( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{


	if( GetPlayerArrayOfTeam( TEAM_MILITIA ).len() < 6 )
		return

	if( GetPlayerArrayOfTeam( TEAM_IMC ).len() > 0 )
		return
	FD_SetNumAllowedRestarts( 0 )
	wait 3


	SetPlayerDeathsHidden( true )
	int highestScore
	entity highestScore_player

	if( GetPlayerArrayOfTeam( TEAM_MILITIA ).len() >= 0 )
	{
		highestScore = 0
		highestScore_player = GetPlayerArrayOfTeam( TEAM_MILITIA )[0]
	}

	foreach( entity p in GetPlayerArrayOfTeam( TEAM_MILITIA ) )
		{
			if( highestScore < (p.GetPlayerGameStat( PGS_ASSAULT_SCORE ) + p.GetPlayerGameStat( PGS_DEFENSE_SCORE )) )
			{
				highestScore = p.GetPlayerGameStat( PGS_ASSAULT_SCORE ) + p.GetPlayerGameStat( PGS_DEFENSE_SCORE )
				highestScore_player = p
			}
		}


	foreach( entity p in GetPlayerArray() )
	{
		NSSendAnnouncementMessageToPlayer(p,"選擇敌对玩家中 and 禁止重试！", "特殊事件", <1,1,0>, 1, 1)
	}

	wait 1
	foreach( entity p in GetPlayerArray() )
	{
		ScreenFadeFromBlack( p )
	}
	entity player = highestScore_player

	if(IsValid ( player ) && IsAlive(player) && player.IsTitan())
		{
			TitanEjectPlayer(player, true)
			wait 0.25
			if(IsValid ( player )  )
			{
				 SetTeam( player, TEAM_IMC )
				 player.SetOrigin(  spawnEvent.origin )

			}

		}
	if( IsValid ( player )  && !player.IsTitan())
	{
		if(PlayerHasTitan ( player ) )
		{
				entity titan
			if ( player.IsTitan() )
				titan = player
			else
				titan = player.GetPetTitan()
		if(IsAlive(titan))
				titan.Die()
		if(IsAlive(player))
				player.Die()
		}
		if(IsAlive(player))
			player.Die()
		wait 0.25
		player.RespawnPlayer( null )
		SetTeam( player, TEAM_IMC )
	}
	player.SetTitanDisembarkEnabled( false )
	wait 1

	foreach ( entity npc in GetEntArrayByClass_Expensive( "C_AI_BaseNPC" ) )
	{
		entity BossPlayer = npc.GetBossPlayer()
		if ( !IsValidPlayer( BossPlayer ) && IsValid( npc ) && npc.GetTeam() == TEAM_MILITIA ) //player == BossPlayer )
			npc.Destroy()
	}
	foreach( entity turret in GetNPCArrayByClass( "npc_turret_sentry" ) )
	{
		entity BossPlayer = turret.GetBossPlayer()
		if (  BossPlayer.GetTeam() != TEAM_MILITIA && IsValid( turret ) && turret.GetAISettingsName() == "npc_turret" )
				turret.Destroy()

	}
	WaitFrame()
	SetPlayerDeathsHidden( false )
	wait 2
	if ( IsValid( player ) )
		NSSendAnnouncementMessageToPlayer( player ,"協助npc摧毁採集机", "特殊事件", <1,1,0>, 1, 1)

	foreach( entity p in GetPlayerArrayOfTeam( TEAM_MILITIA )  )
	{
		NSSendAnnouncementMessageToPlayer( p,"保護採集机！", "特殊事件", <1,1,0>, 1, 1)
	}

	wait 1.6

	thread addnumSuperRodeoGrenades(player)
	// thread playerOnDeath(player,titan)
}

void function addnumSuperRodeoGrenades(entity player)
{
	while( IsValid( player ))
	{
		if( player.GetPlayerNetInt( "numSuperRodeoGrenades" ) < 8 )
		{
			player.SetPlayerNetInt( "numSuperRodeoGrenades", player.GetPlayerNetInt( "numSuperRodeoGrenades" ) + 1 )
			NSSendInfoMessageToPlayer(player,"你得到了1个核武訓牛！！")
		}
		if (!IsValid( player ))
			break
		wait 120
	}
}



void function BOSSEvent( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{


	 if( GetPlayerArrayOfTeam( TEAM_MILITIA ).len() < 4 )
		return

	//array<entity> ps
	//foreach( entity p in GetPlayerArrayOfTeam( TEAM_MILITIA ) )
	//{
	//	//if( p.s.completedwaves >= 3 )
	//	ps.append(p)
	//}
	//if( ps.len() < 1)
	//	return



	// 	foreach( entity player in GetPlayerArray() )
	// 	{
	// 		NSSendAnnouncementMessageToPlayer(player,"本波次須要6人", "遊戲結束", <1,1,0>, 1, 1)
	// 		wait 5
	// 	}
	// 	spawnedNPCs = []
	// 	SetWinner( TEAM_MILITIA )//restart round
	// 	wait 5

	// 	//SetGameState(eGameState.Postmatch)



	// }


	wait 5

	foreach( entity player in GetPlayerArray() )
	{
		NSSendAnnouncementMessageToPlayer(player," 回復採集机血量！无重试机会！", "BOSS事件", <1,1,0>, 1, 1)
	}
	FD_SetNumAllowedRestarts( 0 )
	fd_harvester.harvester.SetHealth(fd_harvester.harvester.GetMaxHealth())
	//fd_harvester.harvester.SetShieldHealthMax(6000)
	wait 3





	entity T = CreateNPCTitan( "titan_stryder", TEAM_IMC ,  spawnEvent.origin, < 0  , 0 , 0>, ["turbo_titan","pas_dash_recharge"] )
	SetSpawnOption_AISettings( T, "npc_titan_stryder_sniper_fd" )
	SetSpawnOption_Warpfall( T )
	DispatchSpawn( T )
	T.SetMaxHealth( 100000 )
	T.SetHealth( T.GetMaxHealth() )
	TakeAllWeapons(T )
	T.GiveWeapon( "mp_titanweapon_sniper", ["BossTitanViper" ] )
	T.GiveOffhandWeapon( "mp_ability_cloak", OFFHAND_ANTIRODEO, [ "bc_fast_cooldown_cloak1"] )
	T.GiveOffhandWeapon( "mp_titanweapon_vortex_shield_ion",OFFHAND_SPECIAL , [] )
	T.GiveOffhandWeapon( "mp_titanweapon_dumbfire_rockets", OFFHAND_ORDNANCE ,["sur_level_3", "fd_twin_cluster"])
	T.GiveOffhandWeapon( "mp_titancore_laser_cannon", OFFHAND_EQUIPMENT, ["fd_laser_cannon"])
	T.GiveOffhandWeapon( "melee_titan_punch_northstar", OFFHAND_MELEE)
	T.WaitSignal( "TitanHotDropComplete" )

	SetPlayerDeathsHidden( true )
	array<entity> players
	foreach( entity p in GetPlayerArrayOfTeam( TEAM_MILITIA ) )
	{
		// if( p.s.completedwaves >= 2 )
		players.append(p)
	}

	entity player
	if( players.len() > 0)
		 player  =   players[  RandomInt( players.len() ) ]
	else
		return
	foreach( entity p in GetPlayerArray() )
	{
		NSSendAnnouncementMessageToPlayer(p,"選擇BOSS中", "BOSS事件", <1,1,0>, 1, 1)
	}

	wait 1
	foreach( entity p in GetPlayerArray() )
	{
		ScreenFadeFromBlack( p )
	}

	if(IsValid ( player ) && IsAlive(player) && player.IsTitan())
		{
			TitanEjectPlayer(player, true)
			wait 0.25
			if(IsValid ( player )  )
			{
				 SetTeam( player, TEAM_IMC )
			 	 ClearTitanAvailable( player )
				 player.SetOrigin( T.GetOrigin() )
				 PilotBecomesTitan( player, T )
			}

		}
	if( IsValid ( player )  && !player.IsTitan())
	{
		if(PlayerHasTitan ( player ) )
		{
				entity titan
			if ( player.IsTitan() )
				titan = player
			else
				titan = player.GetPetTitan()
		if(IsAlive(titan))
				titan.Die()
		if(IsAlive(player))
				player.Die()
		}
		if(IsAlive(player))
			player.Die()
		wait 0.25
		player.RespawnPlayer( null )
		SetTeam( player, TEAM_IMC )
		ClearTitanAvailable( player )
		player.SetOrigin( T.GetOrigin() )
		PilotBecomesTitan( player, T )
	}
	T.Destroy()
	DisableTitanRodeo( player )
	player.SetTitanDisembarkEnabled( false )
	wait 1
	if ( IsValid( player ) )
		thread flyThink(player)

	foreach ( entity npc in GetEntArrayByClass_Expensive( "C_AI_BaseNPC" ) )
	{
		entity BossPlayer = npc.GetBossPlayer()
		if ( !IsValidPlayer( BossPlayer ) && IsValid( npc ) && npc.GetTeam() == TEAM_MILITIA ) //player == BossPlayer )
			npc.Destroy()
	}
	foreach( entity turret in GetNPCArrayByClass( "npc_turret_sentry" ) )
	{
		entity BossPlayer = turret.GetBossPlayer()
		if (  BossPlayer.GetTeam() != TEAM_MILITIA && IsValid( turret ))
				turret.Destroy()

	}
	WaitFrame()
	SetPlayerDeathsHidden( false )
	wait 2
	if ( IsValid( player ) )
		NSSendAnnouncementMessageToPlayer( player ,"協助npc摧毁採集机", "BOSS事件", <1,1,0>, 1, 1)

	foreach( entity p in GetPlayerArrayOfTeam( TEAM_MILITIA )  )
	{
		NSSendAnnouncementMessageToPlayer( p,"保護採集机！", "BOSS事件", <1,1,0>, 1, 1)
	}

	wait 1.6
	thread  ANN(player)
	// thread playerOnDeath(player,titan)
}
void function flyThink( entity player)
{

	//NSSendAnnouncementMessageToPlayer( player,"活着！按 空格 起飛！！", "启用喷射装置", <1,1,0>, 1, 1)

		if ( IsValid( player ) )
		{
		thread AddPlayerHeldButtonEventCallback(  player, IN_JUMP ,  flyB, 0.5)
		thread AddPlayerHeldButtonEventCallback(  player, IN_DODGE	,  flyB, 0.1)
		}
	NSSendInfoMessageToPlayer(player,"空格 起飛！！")

}

void function flyB( entity player )
{
	float flightTime = 1.0
	float horizVel = 800.0

		HoverSounds soundInfo
		soundInfo.liftoff_1p = "titan_flight_liftoff_1p"
		soundInfo.liftoff_3p = "titan_flight_liftoff_3p"
		soundInfo.hover_1p = "titan_flight_hover_1p"
		soundInfo.hover_3p = "titan_flight_hover_3p"
		soundInfo.descent_1p = "titan_flight_descent_1p"
		soundInfo.descent_3p = "titan_flight_descent_3p"
		soundInfo.landing_1p = "core_ability_land_1p"
		soundInfo.landing_3p = "core_ability_land_3p"


	if ( player.IsPlayer() )
	{
		player.Server_TurnDodgeDisabledOn()
	    player.kv.airSpeed = horizVel
	    player.kv.airAcceleration = 540
	    player.kv.gravity = 0.0
	}
	// player.SetGroundFrictionScale( 1 )



		while( IsValid( player ))
		{
		CreateShake( player.GetOrigin(), 16, 150, 1.00, 400 )
		// EmitSoundOnEntityOnlyToPlayer( player, player,  soundInfo.liftoff_1p )
		// EmitSoundOnEntityExceptToPlayer( player, player, soundInfo.liftoff_3p )
		float height
	 	height = GraphCapped( 2, 0, 25, 1000 * 0.5, 1000 )
		vector vel = player.GetVelocity()
		vel = LimitVelocityHorizontal( vel, horizVel + 50 )
		vel.z = height
		player.SetVelocity( vel )
		wait 0.25
		}



}


vector function LimitVelocityHorizontal( vector vel, float speed )
{
	vector horzVel = <vel.x, vel.y, 0>
	if ( Length( horzVel ) <= speed )
		return vel

	horzVel = Normalize( horzVel )
	horzVel *= speed
	vel.x = horzVel.x
	vel.y = horzVel.y
	return vel
}
 void function ANN(entity player) //宣佈
 {


 	while(IsValid ( player )  )
 	{

	if( !player.IsTitan())
	{
			PlayerEarnMeter_SetMode( player, eEarnMeterMode.DISABLED )
			ClearTitanAvailable( player )
	}

	player.WaitSignal( "OnDeath" )
	}

}







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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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
	event.spawnInDifficulty = eFDSD.ALL
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

/* void function SetTitanAsElite( entity npc )
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
} */

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

void function npcdie(entity npc)
{
	wait 200
	if( IsValid(npc) && IsAlive(npc) )
		{npc.Die()}

}





void function create_emp_decoy( entity player )
{

	vector pos = player.GetOrigin()
	vector angle  = player.GetAngles()

	player.WaitSignal( "OnDeath", "OnDestroy" )
		pos = player.GetOrigin()
		angle = player.GetAngles()
		array<entity> ts = GetNearbyEnemiesForGravGrenade(player)
		foreach( t in ts)
		Proto_SetEnemyVelocity_Pull(t , pos )




}

void function Proto_SetEnemyVelocity_Pull( entity enemy, vector projOrigin )
{
	if ( enemy.IsPhaseShifted() )
		return
	vector enemyOrigin = enemy.GetOrigin()
	vector dir = Normalize( projOrigin - enemy.GetOrigin() )
	float dist = Distance( enemyOrigin, projOrigin )
	float distZ = enemyOrigin.z - projOrigin.z
	vector newVelocity = enemy.GetVelocity() * GraphCapped( dist, 50, PULL_RANGE, 0, 1 ) + dir * GraphCapped( dist, 50, PULL_RANGE, 0, PULL_STRENGTH_MAX ) + < 0, 0, GraphCapped( distZ, -50, 0, PULL_VERT_VEL, 0 )>
	if ( enemy.IsTitan() )
		newVelocity.z = 1000
	enemy.SetVelocity( newVelocity )
}

array<entity> function GetNearbyEnemiesForGravGrenade( entity projectile )
{
	int team = projectile.GetTeam()
	entity owner = projectile.GetOwner()
	vector origin = projectile.GetOrigin()
	array<entity> nearbyEnemies
	array<entity> guys = GetPlayerArrayEx( "any", TEAM_ANY, TEAM_ANY, origin, PULL_RANGE+500 )
	foreach ( guy in guys )
	{
		if ( !IsAlive( guy ) )
			continue

		if ( IsEnemyTeam( team, guy.GetTeam() ) || (IsValid( owner ) && guy == owner) )
			nearbyEnemies.append( guy )
	}

	array<entity> ai = GetNPCArrayEx( "any", TEAM_ANY, team, origin, PULL_RANGE )
	foreach ( guy in ai )
	{
		if ( IsAlive( guy ) )
			nearbyEnemies.append( guy )
	}

	return nearbyEnemies
}

