untyped
global function CodeCallback_MapInit

struct {
	array<vector> candidateSpawns
} file

void function CodeCallback_MapInit()
{
	// --- candidate pilot spawn positions for mp_training (sp_training gauntlet map) ---
	// sourced from sp_training .ent info_target/info_player_start markers
	// each entry: < x, y, z > (z is a nominal "above ground" height, we trace down to real ground)
	file.candidateSpawns = [
		< 10664, -10200, -6056 >, // info_player_start (campaign initial position)
		< -5074.92, 990.55, 48 >, // gauntlet_startpoint
		< -6071.69, 36.555, 56 >, // startpoint_gauntlet_entrance
		< -5748.37, -6638.22, -147.969 >, // basic_movement_wallrun_start_ref
		< -6132, -8096, -182 > // startpoint_zen_garden
	]

	AddCallback_EntitiesDidLoad( MP_Training_EntitiesDidLoad )
}

void function MP_Training_EntitiesDidLoad()
{
	// create a handful of pilot spawnpoints above ground at the candidate locations
	int made = 0
	foreach ( vector cand in file.candidateSpawns )
	{
		vector ground = TraceDownToGround( cand )
		if ( !IsValidSpawnPos( ground ) )
			continue

		entity spawnpoint = CreateEntity( "info_spawnpoint_human" )
		spawnpoint.SetOrigin( ground )
		spawnpoint.kv.ignoreGamemode = 1
		DispatchSpawn( spawnpoint )
		made++
	}

	// fallback: if we couldn't create any, use raw candidate positions regardless
	if ( made == 0 )
	{
		foreach ( vector cand in file.candidateSpawns )
		{
			entity spawnpoint = CreateEntity( "info_spawnpoint_human" )
			spawnpoint.SetOrigin( cand )
			spawnpoint.kv.ignoreGamemode = 1
			DispatchSpawn( spawnpoint )
		}
	}
}

vector function TraceDownToGround( vector start )
{
	vector top = < start.x, start.y, start.z + 64 >
	vector bottom = < start.x, start.y, start.z - 256 >

	TraceResults tr = TraceLine( top, bottom, [], TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE )
	if ( tr.fraction == 1.0 )
		return start

	return tr.endPos + < 0, 0, 8 > // nudge up slightly off the surface
}

bool function IsValidSpawnPos( vector pos )
{
	if ( pos.z < -9000 || pos.z > 9000 )
		return false

	// make sure there's nothing directly above the spawn that would block a drop
	TraceResults tr = TraceLine( pos, < pos.x, pos.y, pos.z + 128 >, [], TRACE_MASK_SOLID, TRACE_COLLISION_GROUP_NONE )
	return tr.fraction == 1.0
}
