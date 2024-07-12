untyped
global function CreateRandomTitanEvent
global function CreateRandomArcTitanEvent
global function CreateRandomArcNIUTitanEvent
global function CreateRandomSuperSpectreEvent
global function CreateRandomSuperSpectreEventWithMinion
global function CreateRandomNukeTitanEvent
global function CreateRandomNukeNIUTitanEvent
global function CreateRandomPowerNIUTitanEvent
global function CreateRandomSmartNIUTitanEvent
global function CreateRandomShotNIUTitanEvent
global function CreateRandomNukeNIU2TitanEvent
global function CreateRandomMortarTitanEvent
global function CreateRandomMortarNIUTitanEvent
global function CreateRandomToneSniperTitanEvent
global function CreateRandomNorthstarSniperTitanEvent //northstars are always sniper titans
global function CreateRandomIonTitanEvent
global function CreateRandomScorchTitanEvent
global function CreateRandomRoninTitanEvent
global function CreateRandomToneTitanEvent
global function CreateRandomLegionTitanEvent
global function CreateRandomMonarchTitanEvent


// global function CreateRandomTitanEvent
global array<WaveEvent functionref( array<vector>, vector, string, int, int = 0, string = 0, int = 0,float = 0 )> RandomtitanTypes = []

const FD_TITAN_AOE_REACTTIME = 3 //This is in seconds




/* Event Generators
███████╗██╗   ██╗███████╗███╗   ██╗████████╗     ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ ███████╗
██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║       ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝███████╗
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║       ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗╚════██║
███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║       ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║███████║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝        ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
*/
void function CreateRandomTitanEvent()
{

WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) RoninTitana  = CreateRandomRoninTitanEvent
WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) IonTitana    = CreateRandomIonTitanEvent
WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) ScorchTitana =  CreateRandomScorchTitanEvent
WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) ToneTitana   = CreateRandomToneTitanEvent
WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) LegionTitana = CreateRandomLegionTitanEvent
WaveEvent functionref(array<vector>,vector,string,int,int=0,string=0,int=0,float = 0 ) MonarchTitana = CreateRandomMonarchTitanEvent
// WaveEvent functionref(vector,vector,string,int,int=0,string=0,int=0,float = 0 ) NukeTitana = CreateRandomNukeTitanEvent
// WaveEvent functionref(vector,vector,string,int,int=0,string=0,int=0,float = 0 ) ArcTitana = CreateRandomArcTitanEvent

// array<WaveEvent functionref( array<vector>, vector, string, int, int = 0, string = 0, int = 0,float = 0 )> RandomtitanTypes = []

RandomtitanTypes.append(RoninTitana)
RandomtitanTypes.append(IonTitana )
RandomtitanTypes.append(ToneTitana )
RandomtitanTypes.append(LegionTitana)
RandomtitanTypes.append(MonarchTitana)
RandomtitanTypes.append(ScorchTitana)

// array<WaveEvent functionref( array<vector>, vector, string, int, int = 0, string = 0, int = 0,float = 0 )> Random6titanTypes = []

// Random6titanTypes.append(RoninTitana)
// Random6titanTypes.append(IonTitana )
// Random6titanTypes.append(ToneTitana )
// Random6titanTypes.append(LegionTitana)
// Random6titanTypes.append(MonarchTitan)
// Random6titanTypes.append(ScorchTitana)
//titanTypes.append(NukeTitana )
//titanTypes.append(ArcTitana )


elitesAllowed = GetConVarBool( "ns_fd_allow_elite_titans" )
//wave5.append(Random5titanTypes[ RandomInt( Random5titanTypes.len() ) ]Random5titanTypes[ RandomInt( Random5titanTypes.len() ) ] (.........................................................)

}


WaveEvent function CreateRandomArcTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnRandomArcTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_ARC
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.titanType = titanType
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomArcNIUTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnArcNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_ARC
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.titanType = titanType
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateRandomSuperSpectreEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnSuperSpectre
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.REAPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomSuperSpectreEventWithMinion( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnSuperSpectreWithMinion
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.REAPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateRandomNukeTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnNukeTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_NUKE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomNukeNIUTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnNukeNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_NUKE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateRandomSmartNIUTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnSmartNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_MORTAR
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateRandomShotNIUTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnShotNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_SNIPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateRandomPowerNIUTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnPowerNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
    event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_ARC
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomNukeNIU2TitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "",int titanType = FD_TitanType.TITAN_COMMON , float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnNukeNIU2Titan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_NUKE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomMortarTitanEvent( array<vector> origins, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnMortarTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_MORTAR
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}
WaveEvent function CreateRandomMortarNIUTitanEvent( array<vector> origins, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnMortarNIUTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_MORTAR
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateRandomNorthstarSniperTitanEvent( array<vector> origins, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = spawnSniperTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_SNIPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomToneSniperTitanEvent( array<vector> origins, vector angles, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnToneSniperTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TITAN_SNIPER
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}


WaveEvent function CreateRandomIonTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnIonTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.ION
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomScorchTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnScorchTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.SCORCH
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomRoninTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnRoninTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.RONIN
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomToneTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnToneTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.TONE
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomLegionTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnLegionTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.LEGION
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}

WaveEvent function CreateRandomMonarchTitanEvent( array<vector> origins, vector angles, string route, int nextEventIndex, int executeOnThisCall = 1, string entityGlobalKey = "", int titanType = FD_TitanType.TITAN_COMMON, float spawnradius = 0.0 )
{
	WaveEvent event
	event.eventFunction = SpawnMonarchTitan
	event.executeOnThisCall = executeOnThisCall
	event.nextEventIndex = nextEventIndex
	event.shouldThread = true
	event.spawnEvent.spawnType= eFD_AITypeIDs.MONARCH
	event.spawnEvent.spawnAmount = 1
	event.spawnEvent.origins = origins
	event.spawnEvent.angles = angles
	event.spawnEvent.route = route
	event.spawnEvent.entityGlobalKey = entityGlobalKey
	event.spawnEvent.titanType = titanType
	event.spawnInDifficulty = eFDSD.ALL
	event.spawnEvent.spawnradius = spawnradius
	return event
}


/* Event Functions
███████╗██╗   ██╗███████╗███╗   ██╗████████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║       █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║       ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║       ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/

//Hack by using one of the existing struct vars, hopefully nothing will break


void function spawnRandomArcTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector origin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Arc Titan at: " + origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( origin, TEAM_IMC, 5 )
	PingMinimap( origin.x, origin.y, 4, 600, 150, 0 )
	entity npc = CreateArcTitan( TEAM_IMC, origin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_arc" )
	SetSpawnOption_Alert( npc )
	spawnedNPCs.append( npc )
	DispatchSpawn( npc )
	npc.kv.reactChance = 50


	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE | NPC_USE_SHOOTING_COVER | NPC_ALLOW_PATROL )
	npc.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	thread singleNav_thread( npc, spawnEvent.route )
	thread EMPTitanThinkConstant( npc )
}

void function spawnArcNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector origin = Randomorigins(spawnEvent.origins)
	printt( "Spawning ArcNIU Titan at: " + origin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( origin, TEAM_IMC, 5 )
	PingMinimap( origin.x, origin.y, 4, 600, 150, 0 )
	entity npc = CreateArcTitan(TEAM_IMC, origin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons

	SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_boss_fd_elite" )
	// SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_arc" )
	SetTitanAsElite( npc )


	SetSpawnOption_Alert( npc )
	spawnedNPCs.append( npc )
	DispatchSpawn( npc )

	SetEliteTitanPostSpawn( npc )
	npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
	npc.SetHealth( npc.GetMaxHealth() )
	npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_3"

    	npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.TakeOffhandWeapon( OFFHAND_TITAN_CENTER )
     	npc.TakeOffhandWeapon( OFFHAND_SPECIAL )
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		npc.GiveOffhandWeapon( "mp_titanweapon_vortex_shield_ion", OFFHAND_SPECIAL, [ "tcp_vortex", "burn_mod_titan_vortex_shield" ] )
		npc.GiveOffhandWeapon( "mp_titanability_laser_trip", OFFHAND_TITAN_CENTER, [ "pas_ion_tripwire", "tcp_arc_trip" ] )
		npc.GiveOffhandWeapon( "mp_titanweapon_dumbfire_rockets", OFFHAND_ORDNANCE, [ "archon_stun_impact" ] )
		npc.GiveOffhandWeapon( "mp_titancore_shift_core", OFFHAND_EQUIPMENT, [ "tcp_arc_wave" ] )

		npc.SetSharedEnergyRegenDelay( 1.0 )
		npc.SetSharedEnergyRegenRate( 100 )
		npc.GetTitanSoul().s.SharedEnergyRegenRate <- 100
		npc.GetTitanSoul().s.SharedEnergyRegenDelay <- 1.0


	SlowEnemyMovementBasedOnDifficulty( npc )
	npc.kv.reactChance = 20
	npc.AssaultSetFightRadius( 0 )

	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE | NPC_USE_SHOOTING_COVER | NPC_ALLOW_PATROL )
	npc.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	thread singleNav_thread( npc, spawnEvent.route )
	thread EMPTitanThinkConstant( npc )


}

void function spawnSuperSpectre( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	vector spawnorigin = Randomorigins(spawnEvent.origins)
	//vector spawnorigin = spawnEvent.origin
	if( spawnEvent.spawnradius > 0 )
	{
		spawnorigin.x += RandomFloatRange( -spawnEvent.spawnradius, spawnEvent.spawnradius )
		spawnorigin.y += RandomFloatRange( -spawnEvent.spawnradius, spawnEvent.spawnradius )
		spawnorigin.z += 128 //Ensure we're above all playable geometry
		spawnorigin = OriginToGround( spawnorigin )
	}
	printt( "Spawning Common Reaper at: " + spawnorigin  )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5.7 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	wait 1.7
	TryAnnounceTitanfallWarningToEnemyTeam( TEAM_IMC, spawnorigin )
	wait 3.0

	entity npc = CreateSuperSpectre( TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_AISettings( npc, "npc_super_spectre_fd" )
	SetSpawnOption_Alert( npc )
	spawnedNPCs.append( npc )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	EnableLeeching( npc )
	npc.SetUsableByGroup( "enemies pilot" )
	DispatchSpawn( npc )
	npc.SetAllowSpecialJump( true )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) )
	AddMinimapForHumans( npc )

	thread SuperSpectre_WarpFall( npc )
	npc.WaitSignal( "WarpfallComplete" )
	//npc.SetCapabilityFlag( bits_CAP_MOVE_TRAVERSE, true )
	thread singleNav_thread( npc, spawnEvent.route )
	thread create_emp_decoy(npc)
}

void function spawnSuperSpectreWithMinion( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(  spawnEvent.origins )
	// vector spawnorigin = spawnEvent.origin
	if( spawnEvent.spawnradius > 0 )
	{
		spawnorigin.x += RandomFloatRange( -spawnEvent.spawnradius, spawnEvent.spawnradius )
		spawnorigin.y += RandomFloatRange( -spawnEvent.spawnradius, spawnEvent.spawnradius )
		spawnorigin.z += 128 //Ensure we're above all playable geometry
		spawnorigin = OriginToGround( spawnorigin )
	}
	printt( "Spawning Tick-deployer Reaper at: " + spawnorigin  )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5.7 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	wait 1.7
	TryAnnounceTitanfallWarningToEnemyTeam( TEAM_IMC, spawnorigin )
	wait 3.0

	entity npc = CreateSuperSpectre( TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_AISettings( npc, "npc_super_spectre_fd" )
	SetSpawnOption_Alert( npc )
	spawnedNPCs.append( npc )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	DispatchSpawn( npc )
	npc.SetAllowSpecialJump( true )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) )
	AddMinimapForHumans( npc )
	thread SuperSpectre_WarpFall( npc )
	npc.WaitSignal( "WarpfallComplete" )
	//npc.SetCapabilityFlag( bits_CAP_MOVE_TRAVERSE, true )
	thread ReaperMinionLauncherThink( npc )
	thread create_emp_decoy(npc)
}


void function SpawnIonTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{
	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Ion Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_ion_lasercannon" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_ion_weapon" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_ion_tripwire" )
		SetSpawnOption_TitanSoulPassive2( npc, "pas_ion_vortex" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_ion_weapon_ads" )
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
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 12500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_0"
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "fd_split_shot_cost" )
		maingun.AddMod( "fd_upgraded_proto_particle_accelerator_pas" )
		maingun.AddMod( "fd_balance" )
		maingun.AddMod( "pas_ion_weapon" )
		maingun.AddMod( "pas_ion_weapon_ads" )

		npc.GetOffhandWeapon( OFFHAND_EQUIPMENT ).AddMod( "fd_laser_cannon" )
		npc.GetOffhandWeapon( OFFHAND_EQUIPMENT ).AddMod( "fd_balance" )
		npc.GetOffhandWeapon( OFFHAND_EQUIPMENT ).AddMod( "pas_ion_lasercannon" )
		npc.GetOffhandWeapon( OFFHAND_ORDNANCE ).AddMod( "fd_balance" )
		npc.GetOffhandWeapon( OFFHAND_ORDNANCE ).AddMod( "fd_laser_upgrade" )
		npc.GetOffhandWeapon( OFFHAND_ANTIRODEO ).AddMod( "pas_ion_tripwire" )
		npc.GetOffhandWeapon( OFFHAND_SPECIAL ).AddMod( "pas_ion_vortex" )
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnScorchTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Scorch Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnEvent.origin.x, spawnEvent.origin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_scorch_flamecore" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_scorch_selfdmg" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_scorch_weapon" )
		SetSpawnOption_TitanSoulPassive2( npc, "pas_scorch_shield" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_scorch_firewall" )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor_boss_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 15000 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_1"
		
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity weapon = primaryWeapons[0]
		weapon.AddMod( "fd_wpn_upgrade_2" )
		weapon.AddMod( "fd_fire_damage_upgrade" )
		weapon.AddMod( "fd_hot_streak" )
		weapon.AddMod( "pas_scorch_weapon" )
		npc.GetOffhandWeapon( OFFHAND_ANTIRODEO ).AddMod( "fd_explosive_barrel" )
		npc.GetOffhandWeapon( OFFHAND_SPECIAL ).AddMod( "pas_scorch_shield" )
		npc.GetOffhandWeapon( OFFHAND_ORDNANCE ).AddMod( "pas_scorch_firewall" )
		npc.GetOffhandWeapon( OFFHAND_EQUIPMENT ).AddMod( "pas_scorch_flamecore" )

		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
	{
		npc.kv.reactChance = 60
		npc.kv.AccuracyMultiplier = 0.5
		npc.kv.WeaponProficiency = eWeaponProficiency.AVERAGE
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	}
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnRoninTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Ronin Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_stryder", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_ronin_swordcore" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_ronin_weapon" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_ronin_phase" )
		SetSpawnOption_TitanSoulPassive2( npc, "pas_ronin_arcwave" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_ronin_autoshift" )
	}
	else
	{
		if ( difficultyLevel == eFDDifficultyLevel.EASY || difficultyLevel == eFDDifficultyLevel.NORMAL )
			SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall" )
		else
			SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_boss_fd" )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 10000 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_3"
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "pas_ronin_weapon" )
		npc.GetOffhandWeapon( OFFHAND_MELEE ).AddMod( "fd_sword_upgrade" )
		npc.GetOffhandWeapon( OFFHAND_MELEE ).AddMod( "modelset_prime" )
		npc.GetOffhandWeapon( OFFHAND_SPECIAL ).AddMod( "fd_sword_block" )
		npc.GetOffhandWeapon( OFFHAND_SPECIAL ).AddMod( "modelset_prime" )
		npc.GetOffhandWeapon(  OFFHAND_ANTIRODEO ).AddMod( "pas_ronin_phase" )
		npc.GetOffhandWeapon(  OFFHAND_ANTIRODEO ).AddMod( "fd_phase_charges" )
		npc.GetOffhandWeapon(  OFFHAND_ANTIRODEO ).AddMod( "fd_phase_distance" )
		npc.GetOffhandWeapon(  OFFHAND_ANTIRODEO ).AddMod( "pas_ronin_autoshift" )
		npc.GetOffhandWeapon(  OFFHAND_ORDNANCE ).AddMod( "pas_ronin_arcwave" )
		
		npc.GetOffhandWeapon(  OFFHAND_EQUIPMENT ).AddMod( "fd_duration" )
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
	{
		npc.kv.AccuracyMultiplier = 0.7
		npc.kv.WeaponProficiency = eWeaponProficiency.AVERAGE
	}
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnToneTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Tone Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_tone_sonar" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_tone_wall" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_tone_weapon" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_tone_rockets" )
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
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 12500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
		npc.GetOffhandWeapon(  OFFHAND_EQUIPMENT ).AddMod( "fd_salvo_core" )
		npc.GetOffhandWeapon( OFFHAND_SPECIAL ).AddMod( "pas_tone_wall" )
		npc.GetOffhandWeapon(  OFFHAND_ORDNANCE ).AddMod( "pas_tone_rockets" )
		entity tonesonar = npc.GetOffhandWeapon( OFFHAND_ANTIRODEO )
		tonesonar.AddMod( "fd_sonar_duration" )
		tonesonar.AddMod( "fd_sonar_damage_amp" )
		tonesonar.AddMod( "pas_tone_sonar" )
		
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "fast_reload" )
		maingun.AddMod( "fd_splasher_rounds" )
		maingun.AddMod( "fd_tone_weapon_2" )
		maingun.AddMod( "pas_tone_weapon" )
		
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnLegionTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Legion Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_legion_spinup" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_legion_weapon" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_legion_gunshield" )
		//SetSpawnOption_TitanSoulPassive2( npc, "pas_legion_smartcore" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_legion_chargeshot" )
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
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 20000 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 1.0 //Ironically lowering their accuracy increases the chance of them hitting the enemy
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_5"
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		npc.GiveOffhandWeapon( "mp_titancore_flame_wave", OFFHAND_EQUIPMENT, ["pas_scorch_flamecore"] )
		//npc.GetOffhandWeapon(  OFFHAND_EQUIPMENT ).AddMod( "pas_legion_smartcore" )
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "fd_closerange_helper" )
		maingun.AddMod( "fd_longrange_helper" )
		maingun.AddMod( "fd_piercing_shots" )
		maingun.AddMod( "fd_CloseRangePowerShot" )
		maingun.AddMod( "fd_LongRangePowerShot" )
		maingun.AddMod( "fd_gun_shield_redirect" )
		maingun.AddMod( "SiegeMode" )
		maingun.AddMod( "pas_legion_weapon" )
		maingun.AddMod( "pas_legion_spinup" )
		maingun.AddMod( "pas_legion_gunshield" )
		//maingun.AddMod( "pas_legion_smartcore" )
		maingun.AddMod( "pas_legion_chargeshot" )

		entity gunshield = npc.GetOffhandWeapon( OFFHAND_SPECIAL )
		gunshield.AddMod( "npc_more_shield" )
		gunshield.AddMod( "npc_infinite_shield" )
		gunshield.AddMod( "fd_gun_shield" )
		gunshield.AddMod( "fd_gun_shield_redirect" )
		gunshield.AddMod( "SiegeMode" )
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function SpawnMonarchTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Monarch Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc,"npc_titan_atlas_vanguard_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive2( npc, "pas_vanguard_coremeter" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_vanguard_shield" )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_vanguard_rearm" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_vanguard_doom" )
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
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 12500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_6"
		npc.GetTitanSoul().SetTitanSoulNetInt( "upgradeCount", 3 )
		npc.GetTitanSoul().SetTitanSoulNetInt( "upgradeCount", 5 )
		npc.GetTitanSoul().SetTitanSoulNetInt( "upgradeCount", 8 )
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "arc_rounds" )
		maingun.AddMod( "rapid_reload" )
		maingun.AddMod( "fd_vanguard_weapon_1" )
		maingun.AddMod( "fd_vanguard_weapon_2" )
		maingun.AddMod( "fd_vanguard_utility_1" )
		maingun.AddMod( "fd_vanguard_utility_2" )
		
		npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.GiveOffhandWeapon( "mp_titanweapon_shoulder_rockets", OFFHAND_ORDNANCE, ["mod_ordnance_core","upgradeCore_MissileRack_Vanguard","dev_mod_low_recharge"] )
		
		entity shieldLaser = npc.GetOffhandWeapon( OFFHAND_SPECIAL )
		shieldLaser.AddMod( "energy_field" )
		shieldLaser.AddMod( "burn_mod_titan_laser_lite" )
		
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
}

void function spawnNukeTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Nuke Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc
	if ( spawnEvent.titanType == 0 )
	{
	 npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_nuke" )
	}
	else
	{
		int n =RandomInt(5)
		switch(n)
		{
		case 0:
			npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_nuke" )
		break
		case 1:
			npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb_boss_fd" )
			SlowEnemyMovementBasedOnDifficulty( npc )
		break
		case 2:
			npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_meteor_boss_fd" )
			SlowEnemyMovementBasedOnDifficulty( npc )
		break
		case 3:
			 npc = CreateNPCTitan( "titan_stryder", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_stryder_leadwall_boss_fd" )
		break
		case 4:
			 npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd" )
			SlowEnemyMovementBasedOnDifficulty( npc )
		break
		case 5:
			 npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc,"npc_titan_atlas_vanguard_boss_fd" )
			SlowEnemyMovementBasedOnDifficulty( npc )
		break

		default:
			npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
			SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_nuke" )
		break

	}
	}
	SetSpawnOption_Melee( npc, "null" )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.EnableNPCMoveFlag( NPCMF_WALK_ALWAYS | NPCMF_WALK_NONCOMBAT )
	npc.DisableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	npc.DisableNPCFlag( NPC_DIRECTIONAL_MELEE )
	npc.AssaultSetFightRadius( 0 )
	SlowEnemyMovementBasedOnDifficulty( npc )
	npc.SetDangerousAreaReactionTime( 15 ) //Lasts longer than any AoE the game has
	npc.SetCapabilityFlag( bits_CAP_INNATE_MELEE_ATTACK1 | bits_CAP_INNATE_MELEE_ATTACK2 | bits_CAP_SYNCED_MELEE_ATTACK , false )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function spawnNukeNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnNukeNIUTitan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_boss_fd_elite" )
	SetTitanAsElite( npc )
	SetSpawnOption_TitanSoulPassive4( npc, "pas_legion_spinup" )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 5.0 //Elite Legions don't ever use their cores, but this shall compensate passively, considering the gun's spread
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_1"
		npc.GetTitanSoul().s.SharedEnergyRegenRate <- 333.3
		npc.GetTitanSoul().s.SharedEnergyRegenDelay <- 1.0
		npc.SetSharedEnergyRegenDelay( 1.0 )
		npc.SetSharedEnergyRegenRate( 333.3 )
		array<entity> weapons = npc.GetMainWeapons()
        foreach( entity weapon in weapons )
        {
			npc.TakeWeaponNow( weapon.GetWeaponClassName() )
        }
        npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.TakeOffhandWeapon( OFFHAND_TITAN_CENTER )
        npc.TakeOffhandWeapon( OFFHAND_SPECIAL )
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		npc.GiveWeapon( "mp_titanweapon_xo16_vanguard" ,["arc_rounds_with_battle_rifle"])
		npc.GiveOffhandWeapon( "mp_titanability_particle_wall", OFFHAND_SPECIAL, [ "tcp_dash_shield" ] )
		npc.GiveOffhandWeapon( "mp_titanability_sonar_pulse", OFFHAND_TITAN_CENTER, [ "tcp_smoke" ] )
        npc.GiveOffhandWeapon( "mp_titanweapon_homing_rockets", OFFHAND_ORDNANCE )
		npc.GiveOffhandWeapon( "mp_titancore_amp_core", OFFHAND_EQUIPMENT )
		npc.SetDangerousAreaReactionTime( 0 )
		
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}
void function spawnSmartNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnSmartNIUTitan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_vanguard_boss_fd_elite" )
	SetTitanAsElite( npc )

	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 12500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 5.0 //Elite Legions don't ever use their cores, but this shall compensate passively, considering the gun's spread
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
		npc.GetTitanSoul().s.SharedEnergyRegenRate <- 233.3
		npc.GetTitanSoul().s.SharedEnergyRegenDelay <- 1.0
		npc.SetSharedEnergyRegenDelay( 1.0 )
		npc.SetSharedEnergyRegenRate( 233.3 )
		array<entity> weapons = npc.GetMainWeapons()
        foreach( entity weapon in weapons )
        {
			npc.TakeWeaponNow( weapon.GetWeaponClassName() )
        }
        npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.TakeOffhandWeapon( OFFHAND_TITAN_CENTER )
        npc.TakeOffhandWeapon( OFFHAND_SPECIAL )
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		npc.GiveWeapon( "mp_titanweapon_predator_cannon", [ "pas_legion_weapon","pas_legion_spinup","fd_closerange_helper","fd_longrange_helper","fd_LongRangePowerShot","fd_CloseRangePowerShot","fd_gun_shield_redirect","fd_piercing_shots" ])
		npc.GiveOffhandWeapon( "mp_titanability_gun_shield", OFFHAND_SPECIAL, ["fd_gun_shield","npc_more_shield","fd_gun_shield_redirect"])
		npc.GiveOffhandWeapon( "mp_titanability_laser_trip", OFFHAND_TITAN_CENTER,["pas_ion_tripwire"] )
        npc.GiveOffhandWeapon( "mp_titanability_power_shot", OFFHAND_ORDNANCE, [ "pas_legion_chargeshot" ] )
		npc.GiveOffhandWeapon( "mp_titancore_upgrade", OFFHAND_EQUIPMENT, ["shield_core"] )
		
		npc.SetDangerousAreaReactionTime( 0 )
		
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )

}
void function spawnShotNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnShotNIUTitan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_boss_fd_elite" )
	SetTitanAsElite( npc )

	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 5.0 
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
		npc.GetTitanSoul().s.SharedEnergyRegenRate <- 233.3
		npc.GetTitanSoul().s.SharedEnergyRegenDelay <- 1.0
		npc.SetSharedEnergyRegenDelay( 1.0 )
		npc.SetSharedEnergyRegenRate( 233.3 )
		array<entity> weapons = npc.GetMainWeapons()
        foreach( entity weapon in weapons )
        {
			npc.TakeWeaponNow( weapon.GetWeaponClassName() )
        }
        npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.TakeOffhandWeapon( OFFHAND_TITAN_CENTER )
        npc.TakeOffhandWeapon( OFFHAND_SPECIAL )
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		//.TakeOffhandWeapon( OFFHAND_MELEE)
		npc.GiveWeapon( "mp_titanweapon_sniper", ["pas_northstar_weapon","power_shot","pas_northstar_optics","fd_upgrade_charge","fd_upgrade_crit" ])
		npc.GiveOffhandWeapon( "mp_titanability_tether_trap", OFFHAND_SPECIAL,["pas_northstar_trap","fd_explosive_trap","fd_trap_charges"])
		npc.GiveOffhandWeapon( "mp_titanweapon_homing_rockets",OFFHAND_ORDNANCE  )
        npc.GiveOffhandWeapon( "mp_titanweapon_dumbfire_rockets", OFFHAND_TITAN_CENTER, [ "pas_northstar_cluster","fd_twin_cluster" ] )
		npc.GiveOffhandWeapon( "mp_titancore_salvo_core", OFFHAND_EQUIPMENT,["fd_salvo_core"] )
		//npc.GiveOffhandWeapon( "melee_titan_punch_northstar",OFFHAND_MELEE)
		
		npc.SetDangerousAreaReactionTime( 0 )
		
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )

}
void function spawnPowerNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnPowerNIUTitan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_stickybomb_boss_fd_elite" )
	SetTitanAsElite( npc )

	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 7.0 //Elite Legions don't ever use their cores, but this shall compensate passively, considering the gun's spread
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
		npc.GetTitanSoul().s.SharedEnergyRegenRate <- 300.3
		npc.GetTitanSoul().s.SharedEnergyRegenDelay <- 0.75
		npc.SetSharedEnergyRegenDelay( 0.75 )
		npc.SetSharedEnergyRegenRate( 300.3 )
		array<entity> weapons = npc.GetMainWeapons()
        foreach( entity weapon in weapons )
        {
			npc.TakeWeaponNow( weapon.GetWeaponClassName() )
        }
        npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.TakeOffhandWeapon( OFFHAND_TITAN_CENTER )
        npc.TakeOffhandWeapon( OFFHAND_SPECIAL )
		npc.TakeOffhandWeapon( OFFHAND_EQUIPMENT )
		npc.GiveWeapon( "mp_titanweapon_rocketeer_rocketstream", [ "tcp_brute","kk_amped" ])
		npc.GiveOffhandWeapon( "mp_titanweapon_heat_shield", OFFHAND_SPECIAL, ["pas_scorch_shield"] )
		npc.GiveOffhandWeapon( "mp_titanability_laser_trip", OFFHAND_TITAN_CENTER, [ "pas_ion_tripwire" ] )
        npc.GiveOffhandWeapon( "mp_titanweapon_dumbfire_rockets", OFFHAND_ORDNANCE, [ "pas_northstar_cluster","fd_twin_cluster" ] )
		npc.GiveOffhandWeapon( "mp_titancore_upgrade", OFFHAND_EQUIPMENT, [ "shield_core" ] )
		npc.SetDangerousAreaReactionTime( 0 )
		
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
	
}


void function spawnNukeNIU2Titan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnNukeNIU2Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )

	entity npc = CreateNPCTitan( "titan_ogre", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.reactChance = 60
	SetSpawnOption_AISettings( npc, "npc_titan_ogre_minigun_boss_fd_elite" )
	SetTitanAsElite( npc )
	SetSpawnOption_TitanSoulPassive4( npc, "pas_legion_spinup" )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.kv.AccuracyMultiplier = 10.0 //Elite Legions don't ever use their cores, but this shall compensate passively, considering the gun's spread
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_legion"
		npc.TakeOffhandWeapon( OFFHAND_ORDNANCE )
		npc.GiveOffhandWeapon( "mp_titanweapon_homing_rockets", OFFHAND_ORDNANCE, [ "tcp_push_back" ] )
		entity gunshield = npc.GetOffhandWeapon( OFFHAND_SPECIAL )
		gunshield.AddMod( "npc_more_shield" )
		gunshield.AddMod( "npc_infinite_shield" )
		gunshield.AddMod( "SiegeMode" )
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread singleNav_thread( npc, spawnEvent.route )
	thread NukeTitanThink( npc, fd_harvester.harvester )
}

void function spawnMortarTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Mortar Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_mortar" )
	SetSpawnOption_Titanfall( npc )
	SetSpawnOption_Alert( npc )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	npc.SetSkin( 2 )
	npc.SetCamo( 1 )
	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
	npc.DisableNPCMoveFlag( NPCMF_WALK_NONCOMBAT )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread MortarTitanThink( npc, fd_harvester.harvester )
}
void function spawnMortarNIUTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{

	vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning spawnMortarNIUTitan Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_mortar" )
	SetSpawnOption_Titanfall( npc )
	SetSpawnOption_Alert( npc )
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	SetEliteTitanPostSpawn( npc )
	npc.SetMaxHealth( npc.GetMaxHealth() + 7500 )
	npc.SetHealth( npc.GetMaxHealth() )
	npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
	npc.SetSkin( 2 )
	npc.SetCamo( 30 )
	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
	npc.DisableNPCMoveFlag( NPCMF_WALK_NONCOMBAT )
	npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	array<entity> players = GetPlayerArrayOfEnemies_Alive( npc.GetTeam() )
	entity a = players[ RandomInt( players.len() ) ]
	thread MortarTitanThink( npc, a )
}
void function spawnSniperTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Northstar Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_stryder", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	SetSpawnOption_Alert( npc )
	npc.kv.AccuracyMultiplier = 2
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_stryder_sniper_boss_fd_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_northstar_cluster" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_northstar_trap" )
		SetSpawnOption_TitanSoulPassive2( npc, "pas_northstar_optics" )
		SetSpawnOption_TitanSoulPassive3( npc, "pas_northstar_weapon" )

	}
	else
	{
		SetSpawnOption_AISettings( npc, "npc_titan_stryder_sniper_fd" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 10000 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_2"
		
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "instant_shot" )
		maingun.AddMod( "fast_reload" )
		maingun.AddMod( "pas_northstar_weapon" )
		maingun.AddMod( "burn_mod_titan_sniper" )
		maingun.AddMod( "fd_upgrade_charge" )
		maingun.AddMod( "pas_northstar_optics")
		
		
		entity tethertrap = npc.GetOffhandWeapon( OFFHAND_SPECIAL )
		tethertrap.AddMod( "fd_trap_charges" )
		tethertrap.AddMod( "fd_explosive_trap" )
		
		entity clustermissile = npc.GetOffhandWeapon( OFFHAND_ORDNANCE )
		clustermissile.AddMod( "pas_northstar_cluster" )
		clustermissile.AddMod( "fd_twin_cluster" )
		clustermissile.AddMod( "dev_mod_low_recharge" )
		clustermissile.AddMod( "burn_mod_titan_dumbfire_rockets" )
		
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
	npc.DisableNPCMoveFlag( NPCMF_WALK_NONCOMBAT )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	npc.AssaultSetFightRadius( 0 )
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread SniperTitanThink( npc, fd_harvester.harvester )
}

void function SpawnToneSniperTitan( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
{   vector spawnorigin = Randomorigins(spawnEvent.origins)
	printt( "Spawning Sniper Tone Titan at: " + spawnorigin )
	if ( GetConVarBool( "ns_fd_show_drop_points" ) )
		thread Drop_Spawnpoint( spawnorigin, TEAM_IMC, 5 )
	PingMinimap( spawnorigin.x, spawnorigin.y, 4, 600, 150, 0 )
	entity npc = CreateNPCTitan( "titan_atlas", TEAM_IMC, spawnorigin, spawnEvent.angles )
	SetSpawnOption_Titanfall( npc )
	npc.kv.AccuracyMultiplier = 2
	npc.kv.reactChance = 60
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_fd_sniper_elite" )
		SetTitanAsElite( npc )
		SetSpawnOption_TitanSoulPassive4( npc, "pas_tone_sonar" )
		SetSpawnOption_TitanSoulPassive5( npc, "pas_tone_wall" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_tone_rockets" )
		SetSpawnOption_TitanSoulPassive6( npc, "pas_tone_weapon" )
	}
	else
	{
		SetSpawnOption_AISettings( npc, "npc_titan_atlas_tracker_fd_sniper" )
		SlowEnemyMovementBasedOnDifficulty( npc )
	}
	SetTargetName( npc, GetTargetNameForID( spawnEvent.spawnType ) ) // required for client to create icons
	DispatchSpawn( npc )
	if ( spawnEvent.titanType == 1 && elitesAllowed )
	{
		SetEliteTitanPostSpawn( npc )
		npc.SetMaxHealth( npc.GetMaxHealth() + 12500 )
		npc.SetHealth( npc.GetMaxHealth() )
		npc.GetOffhandWeapon(  OFFHAND_EQUIPMENT ).AddMod( "fd_salvo_core" )
		npc.GetTitanSoul().soul.titanLoadout.titanExecution = "execution_random_4"
		
		entity tonesonar = npc.GetOffhandWeapon( OFFHAND_ANTIRODEO )
		tonesonar.AddMod( "fd_sonar_duration" )
		tonesonar.AddMod( "fd_sonar_damage_amp" )
		
		array<entity> primaryWeapons = npc.GetMainWeapons()
		entity maingun = primaryWeapons[0]
		maingun.AddMod( "fast_reload" )
		maingun.AddMod( "fd_splasher_rounds" )
		maingun.AddMod( "fd_tone_weapon_2" )
		
		npc.SetDangerousAreaReactionTime( 0 )
	}
	else
	{
		npc.SetSkin( 6 )
		npc.SetCamo( 2 )
		npc.SetDangerousAreaReactionTime( FD_TITAN_AOE_REACTTIME )
	}
	npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE )
	npc.DisableNPCMoveFlag( NPCMF_WALK_NONCOMBAT )
	if( spawnEvent.entityGlobalKey != "" )
		GlobalEventEntitys[spawnEvent.entityGlobalKey] <- npc
	npc.AssaultSetFightRadius( 0 )
	spawnedNPCs.append( npc )
	AddMinimapForTitans( npc )
	npc.WaitSignal( "TitanHotDropComplete" )
	npc.GetTitanSoul().SetTitanSoulNetBool( "showOverheadIcon", true )
	thread SniperTitanThink( npc, fd_harvester.harvester )
}




/* Event Helpers
███████╗██╗   ██╗███████╗███╗   ██╗████████╗    ██╗  ██╗███████╗██╗     ██████╗ ███████╗██████╗ ███████╗
██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝    ██║  ██║██╔════╝██║     ██╔══██╗██╔════╝██╔══██╗██╔════╝
█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║       ███████║█████╗  ██║     ██████╔╝█████╗  ██████╔╝███████╗
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║       ██╔══██║██╔══╝  ██║     ██╔═══╝ ██╔══╝  ██╔══██╗╚════██║
███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║       ██║  ██║███████╗███████╗██║     ███████╗██║  ██║███████║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝
*/

void function PingMinimap( float x, float y, float duration, float spreadRadius, float ringRadius, int colorIndex )
{
	foreach( entity player in GetPlayerArrayOfTeam( TEAM_MILITIA ) )
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
		if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
		{
			deduct++
			continue
		}
		if( IsAirDrone( npc ) && GetDroneType( npc ) == "drone_type_cloaked" )
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
			if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
			{
				deduct++
				continue
			}
			if( IsAirDrone( npc ) && GetDroneType( npc ) == "drone_type_cloaked" )
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

void function waitForDeathOfTitans( int amount )
{
	int deduct = 0
	foreach ( entity npc in spawnedNPCs )
	{
		if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
		{
			deduct++
			continue
		}
		if( !npc.IsTitan() )
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
			if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
			{
				deduct++
				continue
			}
			if( !npc.IsTitan() )
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
		if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
			continue

		if( IsAirDrone( npc ) && GetDroneType( npc ) == "drone_type_cloaked" )
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
				if( !IsValid( npc ) || IsValid( GetPetTitanOwner( npc ) ) || npc.GetTeam() == TEAM_MILITIA )
					continue

				if( IsAirDrone( npc ) && GetDroneType( npc ) == "drone_type_cloaked" )
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


/* NPC Functions
███╗   ██╗██████╗  ██████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
████╗  ██║██╔══██╗██╔════╝    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
██╔██╗ ██║██████╔╝██║         █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
██║╚██╗██║██╔═══╝ ██║         ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║ ╚████║██║     ╚██████╗    ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝  ╚═══╝╚═╝      ╚═════╝    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
*/




void function SlowEnemyMovementBasedOnDifficulty( entity npc )
{
	//This is not exact vanilla behavior i think, but enemies definetely moves slower on Frontier Defense than player autotitans
	Assert( IsValid( npc ) && npc.IsNPC(), "Tried to set up movespeed scale in non-NPC entity: " + npc )

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

void function SetupGruntBehaviorFlags( entity npc )
{
	Assert( IsValid( npc ) && IsGrunt( npc ), "Entity is not a Grunt: " + npc )

	switch ( difficultyLevel )
	{
		case eFDDifficultyLevel.EASY:
		case eFDDifficultyLevel.NORMAL:
			npc.EnableNPCFlag( NPC_ALLOW_HAND_SIGNALS | NPC_ALLOW_FLEE | NPC_USE_SHOOTING_COVER )
			npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE | NPC_ALLOW_PATROL )
			break
		case eFDDifficultyLevel.HARD:
		case eFDDifficultyLevel.MASTER:
		case eFDDifficultyLevel.INSANE:
			npc.EnableNPCFlag( NPC_ALLOW_HAND_SIGNALS )
			npc.DisableNPCFlag( NPC_ALLOW_INVESTIGATE | NPC_ALLOW_PATROL | NPC_ALLOW_FLEE | NPC_USE_SHOOTING_COVER )
			break
	}
}

void function GruntTargetsTitan( entity npc )
{
	Assert( IsValid( npc ) && IsGrunt( npc ), "Entity is not a Grunt: " + npc )

	OnEnemyChanged_MinionSwitchToHeavyArmorWeapon( npc )

	entity enemy = npc.GetEnemy()
	if( enemy != null )
	{
		switch ( difficultyLevel )
		{
			case eFDDifficultyLevel.EASY:
			case eFDDifficultyLevel.NORMAL:
				if( enemy.IsTitan() )
					npc.AssaultSetFightRadius( 800 )
				else
					npc.AssaultSetFightRadius( 0 )
				break
			case eFDDifficultyLevel.HARD:
			case eFDDifficultyLevel.MASTER:
			case eFDDifficultyLevel.INSANE:
				npc.AssaultSetFightRadius( 0 )
				break
		}
	}
}

// void function SetTitanAsElite( entity npc )
// {
// 	if( GetGameState() != eGameState.Playing || !IsHarvesterAlive( fd_harvester.harvester ) )
// 		return

// 	Assert( IsValid( npc ) && npc.IsTitan(), "Entity is not a Titan to set as Elite: " + npc )
// 	if ( npc.IsTitan() && elitesAllowed )
// 	{
// 		SetSpawnOption_NPCTitan( npc, TITAN_MERC )
// 		SetSpawnOption_TitanSoulPassive1( npc, "pas_enhanced_titan_ai" )
// 		SetSpawnOption_TitanSoulPassive2( npc, "pas_defensive_core" )
// 		SetSpawnOption_TitanSoulPassive3( npc, "pas_assault_reactor" )
// 		//SetSpawnflags( npc, SF_TITAN_SOUL_NO_DOOMED_EVASSIVE_COMBAT )
// 	}
// }

// void function SetEliteTitanPostSpawn( entity npc )
// {
// 	if( GetGameState() != eGameState.Playing || !IsHarvesterAlive( fd_harvester.harvester ) )
// 		return

// 	Assert( IsValid( npc ) && npc.IsTitan(), "Entity is not a Titan to set as Elite: " + npc )
// 	if ( npc.IsTitan() && elitesAllowed )
// 	{
// 		npc.EnableNPCFlag( NPC_NO_PAIN | NPC_NO_GESTURE_PAIN | NPC_NEW_ENEMY_FROM_SOUND ) //NPC_AIM_DIRECT_AT_ENEMY
// 		npc.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
// 		npc.DisableNPCFlag( NPC_PAIN_IN_SCRIPTED_ANIM )
// 		npc.DisableNPCMoveFlag( NPCMF_WALK_NONCOMBAT )
// 		npc.SetCapabilityFlag( bits_CAP_NO_HIT_SQUADMATES, false )
// 		npc.SetDefaultSchedule( "SCHED_ALERT_WALK" )
// 		npc.kv.AccuracyMultiplier = 5.0
// 		npc.kv.WeaponProficiency = eWeaponProficiency.PERFECT
// 		SetTitanWeaponSkin( npc )
// 		HideCrit( npc )
// 		npc.SetTitle( npc.GetSettingTitle() )
// 		ShowName( npc )

// 		entity soul = npc.GetTitanSoul()
// 		if( IsValid( soul ) )
// 		{
// 			soul.SetPreventCrits( true )
// 			soul.SetShieldHealthMax( 7500 )
// 			soul.SetShieldHealth( 7500 )
// 		}

// 		thread MonitorEliteTitanCore( npc )
// 	}
// }

// void function MonitorEliteTitanCore( entity npc )
// {
// 	Assert( IsValid( npc ) && npc.IsTitan(), "Entity is not a Titan to set as Elite: " + npc )
// 	entity soul = npc.GetTitanSoul()
// 	if ( !IsValid( soul ) )
// 		return

// 	soul.EndSignal( "OnDestroy" )
// 	soul.EndSignal( "OnDeath" )

// 	while( true )
// 	{
// 		SoulTitanCore_SetNextAvailableTime( soul, 1.0 )

// 		npc.WaitSignal( "CoreBegin" )
// 		wait 0.1

// 		soul.SetShieldHealthMax( 7500 )
// 		soul.SetShieldHealth( 7500 )
// 	// entity meleeWeapon = npc.GetMeleeWeapon()
// 	//if( meleeWeapon.HasMod( "super_charged" ) || meleeWeapon.HasMod( "super_charged_SP" ) ) //Hack for Elite Ronin
// 		if(npc.GetModelName() == $"models/titans/light/titan_light_ronin_prime.mdl")
// 			npc.SetAISettings( "npc_titan_stryder_leadwall_boss_fd_elite" )

// 		npc.WaitSignal( "CoreEnd" )
// 		switch ( difficultyLevel )
// 		{
// 			case eFDDifficultyLevel.EASY:
// 			case eFDDifficultyLevel.NORMAL:
// 			case eFDDifficultyLevel.HARD:
// 				wait RandomFloatRange( 20.0, 40.0 )
// 				break
// 			case eFDDifficultyLevel.MASTER:
// 			case eFDDifficultyLevel.INSANE:
// 				wait RandomFloatRange( 40.0, 60.0 )
// 				break
// 		}
// 	}
// }



/* Extra Content
███████╗██╗  ██╗████████╗██████╗  █████╗      ██████╗ ██████╗ ███╗   ██╗████████╗███████╗███╗   ██╗████████╗
██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗    ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝████╗  ██║╚══██╔══╝
█████╗   ╚███╔╝    ██║   ██████╔╝███████║    ██║     ██║   ██║██╔██╗ ██║   ██║   █████╗  ██╔██╗ ██║   ██║
██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║    ██║     ██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██║╚██╗██║   ██║
███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║   ██║   ███████╗██║ ╚████║   ██║
╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝   ╚═╝
*/

void function Drop_Spawnpoint( vector origin, int team, float impactTime )
{
	vector surfaceNormal = < 0, 0, 1 >

	int index = GetParticleSystemIndex( $"P_ar_titan_droppoint" )

	entity effectEnemy = StartParticleEffectInWorld_ReturnEntity( index, origin, surfaceNormal )
	SetTeam( effectEnemy, team )
	EffectSetControlPointVector( effectEnemy, 1, < 255, 64, 16 > )
	effectEnemy.kv.VisibilityFlags = ENTITY_VISIBLE_TO_ENEMY

	wait impactTime

	EffectStop( effectEnemy )
}

vector function GetSkyCeiling( vector point )
{
	vector skyOrigin = Vector( point.x, point.y, MAX_WORLD_COORD )
	vector traceFromPos = point

	while ( true )
	{
		TraceResults traceResult = TraceLine( traceFromPos, skyOrigin, null, (TRACE_MASK_SHOT), TRACE_COLLISION_GROUP_NONE )

		if ( traceResult.hitSky )
		{
			skyOrigin = traceResult.endPos
			skyOrigin.z -= 1
			break
		}

		traceFromPos = traceResult.endPos
		traceFromPos.z += 1
	}

	return skyOrigin
}

// void function SetTitanWeaponSkin( entity npc, int skinindex = 1, int camoindex = 31 )
// {
// 	Assert( IsValid( npc ) && npc.IsTitan(), "Entity is not a Titan: " + npc )

// 	if ( npc.IsTitan() )
// 	{
// 		array<entity> primaryWeapons = npc.GetMainWeapons()
// 		entity weapon = primaryWeapons[0]
// 		weapon.SetSkin( skinindex )
// 		weapon.SetCamo( camoindex )
// 	}
// }






//===========================

//wave5.append(CreateScorchTitanEvent(< 9784 , -4432 , 2007 >,< 0, 180, 0 >,"northForestLongUnderpass",index++,1,"",FD_TitanType.TITAN_ELITE))

// void function RandomTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	if(spawnEvent.spawnType == 3)
// 	spawnEvent.spawnType=RandomInt(1)

// 	// array<WaveEvent functionref( vector, vector, string, int, int = 0, string= "", int = 0,float= 0  )> titanTypes = []

// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string= "",int= 0,float= 0 ) RoninTitana = CreateRoninTitanEvent
// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string="",int= 0,float = 0) IonTitana = CreateIonTitanEvent
// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string= "",int= 0,float= 0 ) ScorchTitana =  CreateScorchTitanEvent
// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string= "",int= 0,float= 0 ) ToneTitana = CreateToneTitanEvent
// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string= "",int= 0,float= 0 ) LegionTitana = CreateLegionTitanEvent
// 	// WaveEvent functionref(vector,vector,string,int,int= 0,string= "",int= 0,float= 0 ) MonarchTitan = CreateMonarchTitanEvent
// 	// titanTypes.append(RoninTitana)
// 	// titanTypes.append(IonTitana )
// 	// titanTypes.append(ScorchTitana)
// 	// titanTypes.append(ToneTitana )
// 	// titanTypes.append(LegionTitana)
// 	// titanTypes.append(MonarchTitan)


// 	// titanTypes[ RandomInt( titanTypes.len() ) ] ( origins,spawnEvent.angles,spawnEvent.route,1 ,1,1,spawnEvent.spawnType)

// }

// void function RandomNukeTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	CreateNukeTitanEvent( origins,spawnEvent.angles,spawnEvent.route,1,1,1)

// }


// void function RandomArcTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	CreateArcTitanEvent ( origins,spawnEvent.angles,spawnEvent.route,1 ,1,1)

// }

// void function RandomMortarTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	CreateMortarTitanEvent ( origins, spawnEvent.angles , 1 ,1,1)

// }

// void function RandomToneSniperTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	if(spawnEvent.spawnType == 3)
// 	spawnEvent.spawnType=RandomInt(1)
// 	CreateToneSniperTitanEvent ( origins, spawnEvent.angles , 1,1,1,spawnEvent.spawnType)

// }

// void function RandomNorthstarSniperTitans( SmokeEvent smokeEvent, SpawnEvent spawnEvent, FlowControlEvent flowControlEvent, SoundEvent soundEvent )
// {
// 	vector origins = Randomorigins(spawnEvent)
// 	if(spawnEvent.spawnType == 3)
// 	spawnEvent.spawnType=RandomInt(1)
// 	CreateNorthstarSniperTitanEvent ( origins, spawnEvent.angles , 1 ,1,1,spawnEvent.spawnType)

// }

void function TitanNAME()
{


}



vector function Randomorigins(array<vector> originss)
{

	array<vector> validSpawns

	foreach ( vector spawnpoint in originss )
	{
		if(CompareEnemyNPCPositions(spawnpoint) == true)
			validSpawns.append( spawnpoint )
	}
	WaitFrame()
	if(validSpawns.len() == 0)
	{

		foreach ( vector spawnpoint in originss )
		{
			validSpawns.append( spawnpoint )
		}


	}

	// if(validSpawns.len() == 0)
	// {
	// foreach ( vector spawnpoint in originss )
	// 	{
	// 		validSpawns.append( spawnpoint )
	// 	}
	// }
	return validSpawns[ RandomInt( validSpawns.len() ) ]

}

// void function waitRandomorigins (array<vector> originss)
// {

// 	float waittime = Time() + 1

// 	array<vector> validSpawns
// 	int i = 0

// 	while(validSpawns.len() == 0 && waittime - Time() > 0)
// 	{
// 		wait 15
// 		waittime = Time() + 10
// 		foreach ( vector spawnpoint in originss )
// 		{
// 			if(CompareEnemyNPCPositions(spawnpoint))
// 				validSpawns.append( spawnpoint )
// 		}

// 		foreach(entity player in GetPlayerArray())
// 		{// if ( GetNPCArray().len() == 0 )
// 		// 	return true
// 		Chat_ServerPrivateMessage(player, "npc:validSpawns"+ validSpawns.len()+"cao"+i, false)
// 		}

// 		i++

// 		if( !IsHarvesterAlive( fd_harvester.harvester ) )
// 		return

// 	}

// }


bool function CompareEnemyNPCPositions(vector spawnpoint )
{

	// foreach(entity player in GetPlayerArray())
	// {// if ( GetNPCArray().len() == 0 )
	// // 	return true
	// Chat_ServerPrivateMessage(player, "npc:"+GetNPCArray().len(), false)
	// }

	foreach(entity npc in GetNPCArrayByClass( "npc_titan" ) )
	{  if(IsAlive( npc ))
		{
		float aa = Distance2D( spawnpoint, npc.GetOrigin() )
		if (aa < 512)
		 {
			return false
		}
		}
	}

	return true
}





















