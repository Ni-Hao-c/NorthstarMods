global function CodeCallback_MapInit


struct {
	int batteryIndex = 0
} file

const array<vector> BATTERY_SPAWNS = [
	< 3960, 1215.04, 942 >,     // cliff
	< 31, 462.459, 797 >,       // mid
	< -4150.21, 693.654, 1123 > // mountain
]

void function CodeCallback_MapInit()
{
	
	// Battery spawns (in LTS/Free Agents) are in old locations, so we move them to the proper locations
	AddSpawnCallbackEditorClass( "script_ref", "script_power_up_other", FixBatterySpawns )

	// Load Frontier Defense Data
	if( GameRules_GetGameMode() == "fd" )
		initFrontierDefenseData()


	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/beacon/beacon_crane_yellow.mdl")
	PrecacheModel($"models/beacon/beacon_fanroom_pipe_03.mdl")
	PrecacheModel($"models/beacon/beacon_pipe_tower_01.mdl")
	PrecacheModel($"models/beacon/beacon_big_screen_01.mdl")
	PrecacheModel($"models/beacon/beacon_big_screen_01.mdl")
	PrecacheModel($"models/beacon/beacon_crane_yellow.mdl")
	PrecacheModel($"models/beacon/beacon_big_screen_01.mdl")
	PrecacheModel($"models/beacon/beacon_big_screen_01.mdl")
	PrecacheModel($"models/beacon/beacon_fanroom_pipe_03.mdl")
	PrecacheModel($"models/beacon/beacon_crane_yellow.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/barriers/tetrapod_barrier_01.mdl")
	PrecacheModel($"models/beacon/beacon_fanroom_pipe_03.mdl")
	PrecacheModel($"models/beacon/beacon_fanroom_pipe_03.mdl")
	PrecacheModel($"models/beacon/beacon_small_radar_dish_02.mdl")
	PrecacheModel($"models/beacon/beacon_small_radar_dish_02.mdl")
	PrecacheModel($"models/beacon/beacon_small_radar_dish_02.mdl")
	PrecacheModel($"models/beacon/beacon_small_radar_dish_02.mdl")
	PrecacheModel($"models/beacon/beacon_pipe_tower_01.mdl")
	PrecacheModel($"models/beacon/support_wall_beam_angled_02.mdl")
	PrecacheModel($"models/beacon/beacon_wallrun_panel_01.mdl")
	PrecacheModel($"models/beacon/beacon_wallrun_panel_01.mdl")
	PrecacheModel($"models/beacon/support_wall_beam_angled_02.mdl")
	PrecacheModel($"models/beacon/beacon_wallrun_panel_01.mdl")
	PrecacheModel($"models/beacon/beacon_wallrun_panel_01.mdl")

	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< 450.746,1500.14,1433.94>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -1075.19,593.857,1356.58>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -1113.23,2319.96,1367.98>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< 967.915,-208.239,1351.91>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -143.394,-859.521,790.379>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -263.469,-897.625,769.312>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -279.394,-773.668,785.324>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -141.646,-723.135,796.572>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -30.4404,-759.417,793.519>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -325.553,-1009.7,788.651>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -274.539,-630.582,794.418>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< 102.972,2639.44,939.562>,< 0,-180,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< 23.5971,2545.9,949.324>,< 0,-157.632,0>, true, 8000 )
	// CreateEditorProp($"models/barriers/tetrapod_barrier_01.mdl",< -75.7768,2485.05,928.78>,< 0,-90,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_fanroom_pipe_03.mdl",< 204.5,-509.026,1200.25>,< 0,90,90>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_fanroom_pipe_03.mdl",< 206.589,-509.381,1200.22>,< 0,90,-90>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_small_radar_dish_02.mdl",< -3091.79,2205.81,2650.53>,< -90,-150,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_small_radar_dish_02.mdl",< -3046.08,2320.47,2128.14>,< -90,120,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_small_radar_dish_02.mdl",< -3074.43,2230.31,1625.55>,< -90,-150,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_small_radar_dish_02.mdl",< -3068.71,2354.78,3032.42>,< -90,120.015,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/beacon_pipe_tower_01.mdl",< 1224.38,1149.38,4020.84>,< 0,150,0>, true, 8000 )
	// CreateEditorProp($"models/beacon/support_wall_beam_angled_02.mdl",< 2946.85,1235.08,2370.52>,< 0,-90,0>, true, 8000 )
	CreateEditorProp($"models/beacon/beacon_wallrun_panel_01.mdl",< 2946.9,1212.72,2117.56>,< -90,0,0>, true, 8000 )
	CreateEditorProp($"models/beacon/beacon_wallrun_panel_01.mdl",< 2950.8,1212.91,2373.72>,< 90,0,0>, true, 8000 )
	CreateEditorProp($"models/beacon/support_wall_beam_angled_02.mdl",< 2186.2,1392.98,2441.07>,< 0,90,0>, true, 8000 )
	CreateEditorProp($"models/beacon/beacon_wallrun_panel_01.mdl",< 2183.11,1411.37,2188.57>,< -90,180,0>, true, 8000 )
	CreateEditorProp($"models/beacon/beacon_wallrun_panel_01.mdl",< 2181.13,1411.25,2445.83>,< 90,180,0>, true, 8000 )

}

void function FixBatterySpawns( entity spawn )
{
	if ( GAMETYPE != LAST_TITAN_STANDING && GAMETYPE != FREE_AGENCY )
		return

	PowerUp powerupDef = GetPowerUpFromItemRef( expect string( spawn.kv.powerUpType ) )
	if ( powerupDef.spawnFunc() )
		spawn.SetOrigin( BATTERY_SPAWNS[file.batteryIndex++] )
}

#if SERVER
entity function CreateEditorProp(asset a, vector pos, vector ang, bool mantle = false, float fade = 2000)
{
	entity e = CreatePropDynamic(a,pos,ang,SOLID_VPHYSICS,fade)
	e.kv.fadedist = fade
	if(mantle) e.AllowMantle()
	return e
}
#endif


