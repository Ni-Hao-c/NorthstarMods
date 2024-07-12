untyped

global function AiSuperspectre_Init

global function SuperSpectre_OnGroundSlamImpact
global function SuperSpectre_OnGroundLandImpact
global function SuperSpectreThink
global function SuperSpectreOnLeeched
global function SuperSpectre_WarpFall
global function CreateExplosionInflictor
global function FragDroneDeplyAnimation
global function ForceTickLaunch

global function Reaper_LaunchFragDrone_Think
global function ReaperMinionLauncherThink

// modified...
// so you can add nuke reapers without have to change their aisettings
global function SuperSpectre_AddNukeDeath
global function SuperSpectre_SetNukeDeathThreshold
global function SuperSpectre_SetForcedKilledByTitans // other than this the reaper will be killed by titans, won't ever try to nuke
global function SuperSpectre_SetSelfAsNukeAttacker // the nuke's attacker will always be the reaper
global function SuperSpectre_SetDropBatteryOnDeath
global function SuperSpectre_SetNukeExplosionDamageEffect
global function SuperSpectre_SetSpawnerTickExplodeOnOwnerDeath // ticks will go explode if their owner reaper nuke or gibbed
global function SuperSpectre_SetSpawnerTickMaxCount // decides how many ticks this reaper can own
global function SuperSpectre_SetDoNukeBeforeDeath // reapers will do nuke before their actual death, similar to stalker overload. this makes score reward goes later, but their highlight and title stuffs won't be removed until nuke sequence ends
global function SuperSpectre_SetDoBodyGroupUpdateOnDamage // adding back this vanilla removed feature and make it a setting
//

// shared utility
global function SuperSpectre_IsReaperDoingNukeSequence // returns true if this reaper is doing nuke sequence while still alive( modified version of nuke )
global function AddCallback_OnReaperLaunchedFragDroneSpawned // so you're able to know ticks owner reaper, and modify their behavior

//==============================================================
// AI Super Spectre
//
// Super Spectre keeps an array of the minions it spawned.
// Each of those minions has a reference back to it's "master."
//==============================================================
// nessie note: these're not used at all... spectre spawning now handled by purely script
const FRAG_DRONE_BATCH_COUNT				= 10
const FRAG_DRONE_IN_FRONT_COUNT				= 2
const FRAG_DRONE_MIN_LAUNCH_COUNT			= 4
const FRAG_DRONE_LAUNCH_INTIAL_DELAY_MIN	= 10
const FRAG_DRONE_LAUNCH_INTIAL_DELAY_MAX	= 20
const FRAG_DRONE_LAUNCH_INTERVAL			= 40
const SPAWN_ENEMY_TOO_CLOSE_RANGE_SQR		= 1048576 	// Don't spawn guys if the target enemy is closer than this range (1024^2).
const SPAWN_HIDDEN_ENEMY_WITHIN_RANGE_SQR	= 1048576 	// If the enemy can't bee seen, and they are within in this range (1024^2), spawn dudes to find him.
const SPAWN_ENEMY_ABOVE_HEIGHT  			= 128		// If the enemy is at least this high up, then spawn dudes to find him.
const SPAWN_FUSE_TIME						= 2.0	  	// How long after being fired before the spawner explodes and spawns a spectre.
const SPAWN_PROJECTILE_AIR_TIME				= 3.0    	// How long the spawn project will be in the air before hitting the ground.
const SPECTRE_EXPLOSION_DMG_MULTIPLIER		= 1.2 		// +20%
const DEV_DEBUG_PRINTS						= false

// new adding consts. was in functions, need to use them as default values
const int MAX_TICKS = 4
const int SUPER_SPECTRE_NUKE_DEATH_THRESHOLD = 300 // make it a file const

// modified!!!
// default values are from damagedef.txt
struct ReaperNukeDamage
{
	int count = 8
	float duration = 1.0
	int damage = 85 //[$mp] value
	int damageHeavyArmor = 700
	int innerRadius = 330
	int outerRadius = 430
	int explosionFlags = SF_ENVEXPLOSION_MASK_BRUSHONLY
	int explosionForce = 50000
	int damageFlags = DF_RAGDOLL | DF_EXPLOSION | DF_BYPASS_SHIELD | DF_SKIPS_DOOMED_STATE
}

struct
{
	int activeMinions_GlobalArrayIdx = -1


	// modified callbacks
	array<void functionref( entity reaper, entity nade, entity fragDrone, string droneSettings )> onReaperLaunchedFragDroneSpawnedCallbacks

	// in-file table
	//table<entity, bool> reaperStartedNukeFromThisDamage // this check is actually no where used because we're now always handle damage in finalDamageCallback
	table<entity, bool> reaperKilledFromSelfNukeExplosion
	table<entity, bool> reaperDoingNukeSequence

	// modified...
	array<entity> forceNukeReapers // so you can add nuke reapers without have to change their aisettings
	table<entity, int> reaperNukeDamageThreshold
	table<entity, bool> reaperForcedKilledByTitans
	table<entity, bool> reaperAsNukeAttacker
	table<entity, bool> reaperDropBattOnDeath
	table<entity, ReaperNukeDamage> reaperNukeDamageOverrides
	table<entity, bool> reaperMinionExplodeOwnerDeath
	table<entity, int> reaperMinionMaxCount
	table<entity, bool> reaperDoNukeBeforeDeath // new nuke think to make it more like stalkers: do nuke before actual death
	table<entity, bool> reaperDoBodyGroupUpdateOnDamage // adding back this vanilla removed feature and make it a setting
	//
} file

function AiSuperspectre_Init()
{
	PrecacheParticleSystem( $"P_sup_spectre_death" )
	PrecacheParticleSystem( $"P_sup_spectre_death_nuke" )
	PrecacheParticleSystem( $"P_xo_damage_fire_2" )
	PrecacheParticleSystem( $"P_sup_spec_dam_vent_1" )
	PrecacheParticleSystem( $"P_sup_spec_dam_vent_2" )
	PrecacheParticleSystem( $"P_sup_spectre_dam_1" )
	PrecacheParticleSystem( $"P_sup_spectre_dam_2" )
	PrecacheParticleSystem( $"drone_dam_smoke_2" )
	PrecacheParticleSystem( $"P_wpn_muzzleflash_sspectre" )

	PrecacheImpactEffectTable( "superSpectre_groundSlam_impact" )
	PrecacheImpactEffectTable( "superSpectre_megajump_land" )

	RegisterSignal( "SuperSpectre_OnGroundSlamImpact" )
	RegisterSignal( "SuperSpectre_OnGroundLandImpact" )
	RegisterSignal( "SuperSpectreThinkRunning" )
	RegisterSignal( "OnNukeBreakingDamage" ) // enough damage to break out or skip nuke
	RegisterSignal( "death_explosion" )
	RegisterSignal( "WarpfallComplete" )
	RegisterSignal( "BeginLaunchAttack" )

	AddDeathCallback( "npc_super_spectre", SuperSpectreDeath )
	AddDamageCallback( "npc_super_spectre", SuperSpectre_OnDamage )
	// adding back this vanilla removed feature and make it a setting
	//AddPostDamageCallback( "npc_super_spectre", SuperSpectre_PostDamage )
	AddPostDamageCallback( "npc_super_spectre", SuperSpectre_PostDamage )

	file.activeMinions_GlobalArrayIdx = CreateScriptManagedEntArray()

	// modified signals
	RegisterSignal( "StartedNukeSequence" )
	RegisterSignal( "NukeSequenceFailSafe" )
	// modified callback to init in-file tables
	AddSpawnCallback( "npc_super_spectre", SuperSpectreOnSpawn )
	// modified callback to handle nuke before death
	AddDamageFinalCallback( "npc_super_spectre", SuperSpectre_FinalDamage )
}

// modified callback to init in-file tables
void function SuperSpectreOnSpawn( entity npc )
{
	//file.reaperStartedNukeFromThisDamage[ npc ] <- false // this check is actually no where used because we're now always handle damage in finalDamageCallback
	file.reaperKilledFromSelfNukeExplosion[ npc ] <- false
	file.reaperDoingNukeSequence[ npc ] <- false
}

void function SuperSpectre_OnDamage( entity npc, var damageInfo )
{
	// always cleanup last damaged state
	// this check is actually no where used because we're now always handle damage in finalDamageCallback
	//file.reaperStartedNukeFromThisDamage[ npc ] = false

	// if reaper is doing nuke sequence, always set damage to 0
	if ( SuperSpectre_IsReaperDoingNukeSequence( npc ) )
	{
		DamageInfo_SetDamage( damageInfo, 0 )
		return
	}

	int damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )
	if ( damageSourceId == eDamageSourceId.suicideSpectreAoE )
	{
		// super spectre takes reduced damage from suicide spectres
		DamageInfo_ScaleDamage( damageInfo, 0.666 )
	}

	// modified to handle nuke before death
	// can't be handled here!!!
	// plasma cannon increases it's damage so it can be handled here
	// but laser core actually decreases it's damage against heavy armor unit, possibly they have extremely high damage
	// this check makes reaper begin nuke on getting hit by laser core, no matter how many health left
	/*
	if ( DamageShouldStartReaperNuke( npc, damageInfo ) )
	{
		// mark as we've setup nuke from this damage, so SuperSpectre_FinalDamage() can handle modified damages
		file.reaperStartedNukeFromThisDamage[ npc ] = true
		// don't die from damage
		StartReaperNukeSequenceFromDamageInfo( npc, damageInfo )
		return
	}
	*/
}

// modified function to handle nuke before death
bool function DamageShouldStartReaperNuke( entity npc, var damageInfo )
{
	// general check
	if ( !SuperSpectreCanStartNukeSequence( npc, damageInfo ) )
		return false

	// nuke before death check
	if ( ShouldReaperDoNukeBeforeDeath( npc ) )
	{
		if ( IsAlive( npc ) ) // dead reapers can nuke in DoSuperSpectreDeath(), needs to prevent doing together with that
		{
			float health = npc.GetHealth().tofloat()
			float damage = DamageInfo_GetDamage( damageInfo )
			// modified check: killshot to overload
			bool isKillShot = health - damage <= 1.0 // hitting reaper to 1HP means we can nuke them. prevent accidentally kill them
			if ( isKillShot )
				return true // return true if this damage is about to kill our reaper
		}
	}

	// default case is we never do nuke
	return false
}

// modified callback to handle nuke before death
void function SuperSpectre_FinalDamage( entity npc, var damageInfo )
{
	if ( !IsAlive( npc ) )
		return
	
	// if reaper already started nuke in SuperSpectre_OnDamage()
	// we reduce the damage so nothing can kill them
	// removed because we're now leaving only finalDamageCallback
	/*
	if ( file.reaperStartedNukeFromThisDamage[ npc ] )
	{
		// don't die from damage
		float damage = DamageInfo_GetDamage( damageInfo )
		damage = npc.GetHealth() - 1.0
		DamageInfo_SetDamage( damageInfo, damage )
		
		return
	}
	*/

	// use a better check for handling modified overload cases
	if ( DamageShouldStartReaperNuke( npc, damageInfo ) )
	{
		StartReaperNukeSequenceFromDamageInfo( npc, damageInfo )
		return
	}
}

// wrapped function
void function StartReaperNukeSequenceFromDamageInfo( entity npc, var damageInfo )
{
	// don't die from damage
	float damage = DamageInfo_GetDamage( damageInfo )
	damage = npc.GetHealth() - 1.0
	DamageInfo_SetDamage( damageInfo, damage )

	entity attacker = DamageInfo_GetAttacker( damageInfo )
	thread SuperSpectre_StartNukeSequence( npc, attacker )
}

void function SuperSpectre_StartNukeSequence( entity npc, entity attacker = null )
{
	// nuke sequence checks so we don't do it over and over
	if ( SuperSpectre_IsReaperDoingNukeSequence( npc ) )
		return
	
	// do pre-setup
	npc.ai.killShotSound = false
	file.reaperDoingNukeSequence[ npc ] = true
	npc.SetNoTarget( true )
	npc.SetNoTargetSmartAmmo( true )
	// disable targeting
	npc.EnableNPCFlag( NPC_IGNORE_ALL )
	npc.DisableBehavior( "Follow" )
	npc.DisableBehavior( "Assault" )
	if ( IsValid( npc.GetEnemy() ) )
		npc.ClearEnemy()
	npc.ClearAllEnemyMemory()

	npc.Signal( "StartedNukeSequence" ) // stop other thinks that may play animation
	npc.EndSignal( "OnDestroy" )

	// minion management
	if ( ShouldDetonateMinionsOnDeath( npc ) )
		SuperSpectre_DetonateAllOwnedTicks( npc )

	entity nukeFXInfoTarget = CreateEntity( "info_target" )
	nukeFXInfoTarget.kv.spawnflags = SF_INFOTARGET_ALWAYS_TRANSMIT_TO_CLIENT
	DispatchSpawn( nukeFXInfoTarget )

	nukeFXInfoTarget.SetParent( npc, "HIJACK" )

	// sound is now handled by ReaperNukeSequenceThink()
	//EmitSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
	thread ReaperNukeSequenceThink( npc, nukeFXInfoTarget )

	AI_CreateDangerousArea_DamageDef( damagedef_reaper_nuke, nukeFXInfoTarget, TEAM_INVALID, true, true )

	// needs to do animations manually because nuke sequence is actually reaper's death activity
	// this version is unstable, reaper can delay their death animation. now handled by ReaperNukeSequenceThink()
	//PlayRandomReaperDeathAnim( npc )
	//thread ReaperNukeSequenceFailSafe( npc ) // failsafe handler: keep trying to play animation, detonate reaper after certain delay

	// wait for nuke anim to signal
	WaitSignal( npc, "OnDeath", "death_explosion", "NukeSequenceFailSafe" )

	if ( IsValid( nukeFXInfoTarget ) )
	{
		StopSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
		nukeFXInfoTarget.Destroy()
	}

	// attacker checks
	// if attacker has been destroyed, or we force uses reaper itself as attacker
	// we should update attacker
	if ( !IsValid( attacker ) || ShouldUseSelfAsNukeAttacker( npc ) )
		attacker = npc
	
	// drop battery handled by DoSuperSpectreDeath(), we need to mark the reaper as killed by nuke sequence
	file.reaperKilledFromSelfNukeExplosion[ npc ] = true

	// start nuke
	// wait for gib is bad!!! a gibbed npc getting killed will instantly destroy them
	//waitthread SuperSpectreNukes( npc, attacker ) // wait for reaper being gib, so we don't overlap death animation
	SuperSpectreNukes( npc, attacker, false ) // modified to add parameter that allows us to not gib the reaper

	// wait for effect grow
	WaitFrame()

	// kill the reaper
	npc.Die( attacker, npc, { damageSourceId = damagedef_reaper_nuke } )
	npc.Gib( <0,0,100> ) // manually gib reaper because SuperSpectreNukes() is not doing that
}

// failsafe handler: the reaper didn't make it to explode
void function ReaperNukeSequenceFailSafe( entity npc )
{
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnDeath" )
	// calculation: "sspec_death_f" and "sspec_death_b" both lasts 7.23333s. 
	// they have AE_RAGDOLL at 200th frame, the 89th frame signals "death_explosion"
	// ( 89/200 ) * 7.233 ≈ 3.21, so we wait 3.3s as failsafe
	wait 0.1
	// here's for fun: if reaper don't have a animation active
	// it must means it's animation gets intterupted by something
	// we manually do a effect( can't handle beam effects because there're too many of them, like SP ticks )
	// NOTE: this can't handle because after anim start the reaper will be recognized as AnimActive, but actually they can still gets stuck
	if ( !npc.Anim_IsActive() )
	{
		entity nukeBodyFX = PlayFXOnEntity( $"P_sup_spectre_warn_body", npc, "exp_torso_core_fx" )
		nukeBodyFX.DisableHibernation()
	}
	wait 3.2

	// if reaper still not dying after so long, signal to manually detonate them
	//print( "Reaper nuke sequence failsafe!" )
	npc.Signal( "NukeSequenceFailSafe" )
}

// new HACKY stuff here: keep trying to play animation until it starts
// bit more like death animation, they also can be delayed until reaper has nothing to do
void function ReaperNukeSequenceThink( entity npc, entity nukeFXInfoTarget )
{
	// starting sequence and setup
	EmitSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
	PlayDeathAnimByActivity( npc ) // play the anim before think starts

	// for fun
	entity nukeBodyFX = PlayFXOnEntity( $"P_sup_spectre_warn_body", npc, "exp_torso_core_fx" )
	nukeBodyFX.DisableHibernation()

	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( "death_explosion" )

	// removed because we're adding initial time for nuke anim
	//float failsafeTime = 5.0 // bit longer failsafe timer to make it more like death animations
	// recalculated failsafe timer: reaper's death anim running at 30fps, the 89th frame signals "death_explosion"
	// 89/30 ≈ 2.96666, we wait 3.1s as failsafe
	//float failsafeTime = 3.3
	float failsafeTime = 3.1
	float startTime = Time()
	float endTime = Time() + failsafeTime

	bool playedSound = true // we did sound above, here we mark it as true
	while ( Time() < endTime )
	{
		// this must means reaper isn't actually playing animation, they got some schedule to do...
		if ( !npc.Anim_IsActive() )
		{
			//print( "reaper still don't have anim active!" )
			//print( "elapsed time: " + string( Time() - startTime ) )
			PlayDeathAnimByActivity( npc ) // keep it trying...
			npc.Anim_SetInitialTime( Time() - startTime ) // jump to the time nuke should start

			// clean up sound, we do it again later
			// removed because we're adding initial time for nuke anim
			//StopSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
			//playedSound = false
		}

		// animation succesfully function
		// welp, seems script will recognize anim as active even after reaper failed to do so
		// anim will restart after ~1.3s by code above, should be working fine
		// but... sound fix doesn't seem very useful because of this
		// it's always played right after reaper starts nuke, just like we place it in SuperSpectre_StartNukeSequence()
		// removed because we're adding initial time for nuke anim
		/*
		if ( npc.Anim_IsActive() )
		{
			if ( !playedSound && IsValid( nukeFXInfoTarget ) ) // only do sound once no matter what's happening
			{
				//print( "reaper finally got anim active!" )
				//print( "elapsed time: " + string( Time() - startTime ) )
				EmitSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
				playedSound = true
			}
		}
		*/

		WaitFrame()
	}

	// if reaper still not dying after so long, signal to manually detonate them
	//print( "Reaper nuke sequence failsafe!" )
	npc.Signal( "NukeSequenceFailSafe" )
}

// this can't intterupt reaper's attack anim...
void function PlayDeathAnimByActivity( entity npc )
{
	npc.Anim_Stop()
	npc.Anim_ScriptedPlayActivityByName( "ACT_DIESIMPLE", true, 0.1 )
	//npc.UseSequenceBounds( true )
	npc.Anim_DisableSequenceTransition() // ignore blending, stops current attack anim stuffs immediately
}

// hardcoded anims version
// needs to do animations manually because nuke sequence is actually reaper's death activity
const array<string> REAPER_NUKE_ANIMS =
[
	"sspec_death_f",
	"sspec_death_b",
]

void function PlayRandomReaperDeathAnim( entity npc )
{
	npc.Anim_Stop()
	thread PlayAnim( npc, REAPER_NUKE_ANIMS[ RandomInt( REAPER_NUKE_ANIMS.len() ) ] )
	npc.Anim_DisableSequenceTransition() // ignore blending, stops current attack anim stuffs immediately
}
// modified stuffs ends

void function SuperSpectre_PostDamage( entity npc, var damageInfo )
{
	// adding back this vanilla removed feature and make it a setting
	// with some modifications: lowerbody switch at 66% health, upperbody switch at 33% health, like cl_super_spectre.nut's healthFX ratio
	/*
	float switchRatio = 0.33
	float ratio = HealthRatio( npc )
	if ( ratio < switchRatio )
		return
	float newRatio = ( npc.GetHealth() - DamageInfo_GetDamage( damageInfo ) ) / npc.GetMaxHealth()
	if ( newRatio >= switchRatio )
		return

	// destroy body groups
	int bodygroup
	bodygroup = npc.FindBodyGroup( "lowerbody" )
	npc.SetBodygroup( bodygroup, 1 )
	bodygroup = npc.FindBodyGroup( "upperbody" )
	npc.SetBodygroup( bodygroup, 1 )
	*/

	// this is actually doomed bodygroup like titans
	if ( ShouldReaperDoDamagedBodyGroupUpdate( npc ) )
	{
		float ratio = HealthRatio( npc )
		float newRatio = ( npc.GetHealth() - DamageInfo_GetDamage( damageInfo ) ) / npc.GetMaxHealth()
		if ( ratio > 0.66 && newRatio <= 0.66 ) // lower body switch
		{
			//print( "Reaper lower body broke!!!" )
			int bodygroup = npc.FindBodyGroup( "lowerbody" )
			//if ( bodygroup > 0 ) // bodygroup can be 0??? seems only -1 means invalid bodygroup
			if ( bodygroup > -1 )
				npc.SetBodygroup( bodygroup, 1 )
		}
		else if ( ratio > 0.33 && newRatio <= 0.33 ) // upper body switch
		{
			//print( "Reaper upper body broke!!!" )
			int bodygroup = npc.FindBodyGroup( "upperbody" )
			if ( bodygroup > -1 )
				npc.SetBodygroup( bodygroup, 1 )
		}
	}
}

void function SuperSpectreDeath( entity npc, var damageInfo )
{
	thread DoSuperSpectreDeath( npc, damageInfo )
}

// modified to add gibReaper parameter
void function SuperSpectreNukes( entity npc, entity attacker, bool gibReaper = true )
{
	// modified here: we at least need a attacker, because it's MP
	// by default it will be npc themselves
	#if MP
		if ( !IsValid( attacker ) )
			attacker = npc
	#endif

	// modified to make gib can be toggle
	if ( gibReaper )
		npc.EndSignal( "OnDestroy" )
	vector origin = npc.GetWorldSpaceCenter()
	EmitSoundAtPosition( npc.GetTeam(), origin, "ai_reaper_nukedestruct_explo_3p" )
	// modified here: all these fx should never hibernate on client-side...
	// needs clean up, to prevent it play again after watching replay or when player getting close
	//PlayFX( $"P_sup_spectre_death_nuke", origin, npc.GetAngles() )
	entity nukeFX = PlayFX( $"P_sup_spectre_death_nuke", origin, npc.GetAngles() )
	nukeFX.DisableHibernation()
	thread DelayedCleanUpNukeFX( npc, nukeFX )

	// modified: can get more infomation from reaper itself, pass it to SuperSpectreNukeDamage()
	//thread SuperSpectreNukeDamage( npc.GetTeam(), origin, attacker )
	thread SuperSpectreNukeDamage( npc.GetTeam(), origin, attacker, npc )
	// modified to make gib can be toggle
	if ( gibReaper )
	{
		WaitFrame() // so effect has time to grow and cover the swap to gibs
		npc.Gib( <0,0,100> )
	}
}

// to prevent it play again after watching replay
void function DelayedCleanUpNukeFX( entity npc, entity nukeFX )
{
	nukeFX.EndSignal( "OnDestroy" )
	npc.WaitSignal( "OnDestroy" )
	EffectStop( nukeFX )
}

void function DoSuperSpectreDeath( entity npc, var damageInfo )
{
	// destroyed?
	if ( !IsValid( npc ) )
		return

	entity attacker = DamageInfo_GetAttacker( damageInfo )

	// making it a file const
	//const int SUPER_SPECTRE_NUKE_DEATH_THRESHOLD = 300

	// modified, so you can have reapers dropping batteries in mp
	bool giveBattery = ( npc.ai.shouldDropBattery && IsSingleplayer() )
	if ( IsMultiplayer() )
		giveBattery = ShouldDropBatteryOnDeath( npc )
	
	// modified, minion management
	//print( "ShouldDetonateMinionsOnDeath(): " + string( ShouldDetonateMinionsOnDeath( npc ) ) )
	if ( ShouldDetonateMinionsOnDeath( npc ) )
	{
		SuperSpectre_DetonateAllOwnedTicks( npc )
	}

	// modified to handle nuke before death: if reaper killed by self nuke, we don't do any think below
	if ( file.reaperKilledFromSelfNukeExplosion[ npc ] )
	{
		// only do battery think
		if ( giveBattery )
			SpawnTitanBatteryOnDeath( npc, null )
		return // don't do any following thinks
	}

	// modified nuke threshold and force kill think, wrapped into function
	//if ( !ShouldNukeOnDeath( npc ) || !npc.IsOnGround() || !npc.IsInterruptable() || DamageInfo_GetDamage( damageInfo ) > SUPER_SPECTRE_NUKE_DEATH_THRESHOLD || ( IsValid( attacker ) && attacker.IsTitan() ) )
	if ( !SuperSpectreCanStartNukeSequence( npc, damageInfo ) ) // check if we can start nuke sequence
	{
		// failing checks, just boom
		vector origin = npc.GetWorldSpaceCenter()
		EmitSoundAtPosition( npc.GetTeam(), origin, "ai_reaper_explo_3p" )
		npc.Gib( DamageInfo_GetDamageForce( damageInfo ) )
		if ( giveBattery )
			SpawnTitanBatteryOnDeath( npc, null ) // this has been modified in _titan_npc.gnut, supports mp

		return
	}

	npc.ai.killShotSound = false
	npc.EndSignal( "OnDestroy" )

	entity nukeFXInfoTarget = CreateEntity( "info_target" )
	nukeFXInfoTarget.kv.spawnflags = SF_INFOTARGET_ALWAYS_TRANSMIT_TO_CLIENT
	DispatchSpawn( nukeFXInfoTarget )

	nukeFXInfoTarget.SetParent( npc, "HIJACK" )

	EmitSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )

	AI_CreateDangerousArea_DamageDef( damagedef_reaper_nuke, nukeFXInfoTarget, TEAM_INVALID, true, true )

	OnThreadEnd(
	function() : ( nukeFXInfoTarget, npc, attacker, giveBattery )
		{
			if ( IsValid( nukeFXInfoTarget ) )
			{
				StopSoundOnEntity( nukeFXInfoTarget, "ai_reaper_nukedestruct_warmup_3p" )
				nukeFXInfoTarget.Destroy()
			}


			if ( IsValid( npc ) )
			{
				// modified over here...
				//thread SuperSpectreNukes( npc, attacker )
				if ( ShouldUseSelfAsNukeAttacker( npc ) ) // force use reaper itself as attacker
					thread SuperSpectreNukes( npc, npc )
				else // default
					thread SuperSpectreNukes( npc, attacker )

				if ( giveBattery )
				{
					SpawnTitanBatteryOnDeath( npc, null ) // this has been modified in _titan_npc.gnut, supports mp
				}
			}
		}
	)

	//int bodygroup = npc.FindBodyGroup( "upperbody" )
	//npc.SetBodygroup( bodygroup, 1 )

	// TODO: Add death sound

	WaitSignalOnDeadEnt( npc, "death_explosion" )
}

entity function CreateExplosionInflictor( vector origin )
{
	entity inflictor = CreateEntity( "script_ref" )
	inflictor.SetOrigin( origin )
	inflictor.kv.spawnflags = SF_INFOTARGET_ALWAYS_TRANSMIT_TO_CLIENT
	DispatchSpawn( inflictor )
	return inflictor
}

// modified nuke threshold and force kill think, wrapped into function
bool function SuperSpectreCanStartNukeSequence( entity npc, var damageInfo = null )
{
	// these are checks that only valid when passing a damageInfo inside
	bool damageThresholdChecksFailed = false
	bool forceKilledByTitanChecksFailed = false
	if ( damageInfo != null )
	{
		int damage = int( DamageInfo_GetDamage( damageInfo ) )
		entity attacker = DamageInfo_GetAttacker( damageInfo )
		int damageThreshold = GetNukeDeathThreshold( npc )
		bool forceKilledByTitan = IsForcedKilledByTitans( npc )

		damageThresholdChecksFailed = damage > damageThreshold
		forceKilledByTitanChecksFailed = IsValid( attacker ) && attacker.IsTitan() && forceKilledByTitan
	}

	// failing checks:
	if( !ShouldNukeOnDeath( npc ) 
		|| !npc.IsOnGround() 
		|| !npc.IsInterruptable() // it's weird that if reaper is in attack or flinch activity, it won't be recognized as "not interruptable", unlike stalkers...
		|| damageThresholdChecksFailed
		|| forceKilledByTitanChecksFailed
		)
		return false
	
	// all checks passed
	return true
}

// modified: can get more infomation from reaper itself, pass it to SuperSpectreNukeDamage()
//void function SuperSpectreNukeDamage( int team, vector origin, entity attacker )
void function SuperSpectreNukeDamage( int team, vector origin, entity attacker, entity reaper = null )
{
	// all damage must have an inflictor currently
	entity inflictor = CreateExplosionInflictor( origin )

	OnThreadEnd(
		function() : ( inflictor )
		{
			if ( IsValid( inflictor ) )
				inflictor.Destroy()
		}
	)

	int explosions 				= 8
	float duration 				= 1.0 // won't use if no damage overrides
	//float time 					= 1.0

	// nuke damage overrides
	bool hasDamageOverride = false
	// should cache everything here because reaper's gonna be destroyed soon
	ReaperNukeDamage nukeStruct
	if ( IsValid( reaper ) )
	{
		if ( ReaperHasNukeDamageOverride( reaper ) )
		{
			hasDamageOverride = true
			nukeStruct = GetReaperNukeDamageOverride( reaper )
			explosions = nukeStruct.count
			duration = nukeStruct.duration
		}
	}

	for ( int i = 0; i < explosions; i++ )
	{
		entity explosionOwner
		if ( IsValid( attacker ) )
			explosionOwner = attacker
		else
			explosionOwner = GetTeamEnt( team )

		if ( hasDamageOverride ) // nuke damage effect override
		{
			RadiusDamage( 
				origin,								// origin
				explosionOwner,						// owner
				inflictor,							// inflictor
				nukeStruct.damage,					// normal damage
				nukeStruct.damageHeavyArmor,		// heavy armor damage
				nukeStruct.innerRadius,				// inner radius
				nukeStruct.outerRadius,				// outer radius
				nukeStruct.explosionFlags,			// flags
				0,									// distanceFromAttacker
				nukeStruct.explosionForce,			// explosionForce
				nukeStruct.damageFlags,				// scriptDamageFlags
				damagedef_reaper_nuke				// scriptDamageSourceIdentifier
			)
		}
		else // vanilla behavior
		{
			RadiusDamage_DamageDefSimple(
				damagedef_reaper_nuke,
				origin,								// origin
				explosionOwner,						// owner
				inflictor,							// inflictor
				0 )									// dist from attacker
		}

		// modified to have constant explosion interval
		//wait RandomFloatRange( 0.01, 0.21 )
		if ( hasDamageOverride )
			wait duration / explosions
		else
			wait RandomFloatRange( 0.01, 0.21 )
	}
}

void function SuperSpectre_OnGroundLandImpact( entity npc )
{
	PlayImpactFXTable( npc.GetOrigin(), npc, "superSpectre_megajump_land", SF_ENVEXPLOSION_INCLUDE_ENTITIES )
}


void function SuperSpectre_OnGroundSlamImpact( entity npc )
{
	PlayGroundSlamFX( npc )
}


function PlayGroundSlamFX( entity npc )
{
	int attachment = npc.LookupAttachment( "muzzle_flash" )
	vector origin = 	npc.GetAttachmentOrigin( attachment )
	PlayImpactFXTable( origin, npc, "superSpectre_groundSlam_impact", SF_ENVEXPLOSION_INCLUDE_ENTITIES )
}


bool function EnemyWithinRangeSqr( entity npc, entity enemy, float range )
{
	vector pos		= npc.GetOrigin()
	vector enemyPos = enemy.GetOrigin()
	float distance 	= DistanceSqr( pos, enemyPos )

	return distance <= range
}

bool function ShouldLaunchFragDrones( entity npc, int activeMinions_EntArrayID )
{
//	printt( "active " + GetScriptManagedEntArrayLen( activeMinions_EntArrayID ) )
	if ( !npc.ai.superSpectreEnableFragDrones )
		return false

	// check global minions
	if ( GetScriptManagedEntArrayLen( file.activeMinions_GlobalArrayIdx ) > 5 )
		return false

	// only launch if all minions are dead
	if ( GetScriptManagedEntArrayLen( activeMinions_EntArrayID ) > 5 )
		return false

	entity enemy = npc.GetEnemy()

	// Only spawn dudes if we have an enemy
	if ( !IsValid( enemy ) )
		return false

	vector ornull lkp = npc.LastKnownPosition( enemy )
	if ( lkp == null )
		return false

	expect vector( lkp )

	// Don't spawn if the enemy is too far away
	if ( Distance( npc.GetOrigin(), lkp ) > 1500 )
		return false

	return true
}

void function SuperSpectreOnLeeched( npc, player )
{
	local maxHealth = npc.GetMaxHealth()
	npc.SetHealth( maxHealth * 0.5 )	 // refill to half health
}

function SuperSpectreThink( entity npc )
{
	npc.EndSignal( "OnDeath" )

	int team = npc.GetTeam()

	int activeMinions_EntArrayID = CreateScriptManagedEntArray()
	if ( npc.kv.squadname == "" )
		SetSquad( npc, UniqueString( "super_spec_squad" ) )

	npc.ai.superSpectreEnableFragDrones = expect int( npc.Dev_GetAISettingByKeyField( "enable_frag_drones" ) ) == 1

	OnThreadEnd (
		function() : ( activeMinions_EntArrayID, npc, team )
		{
			entity owner
			if ( IsValid( npc ) )
				owner = npc
			
			foreach ( minion in GetScriptManagedEntArray( activeMinions_EntArrayID ) )
			{
				// Self destruct the suicide spectres if applicable
				if ( minion.GetClassName() != "npc_frag_drone" )
					continue
				
				if ( minion.ai.suicideSpectreExplodingAttacker == null )
					minion.TakeDamage( minion.GetHealth(), owner, owner, { scriptType = DF_DOOMED_HEALTH_LOSS, damageSourceId = eDamageSourceId.mp_weapon_super_spectre } )
			}
		}
	)

	wait RandomFloatRange( FRAG_DRONE_LAUNCH_INTIAL_DELAY_MIN, FRAG_DRONE_LAUNCH_INTIAL_DELAY_MAX )

	npc.kv.doScheduleChangeSignal = true

	while ( 1 )
	{
		if ( ShouldLaunchFragDrones( npc, activeMinions_EntArrayID ) )
			waitthread SuperSpectre_LaunchFragDrone_Think( npc, activeMinions_EntArrayID )

		wait FRAG_DRONE_LAUNCH_INTERVAL
	}
}

void function SuperSpectre_LaunchFragDrone_Think( entity npc, int activeMinions_EntArrayID )
{
	array<vector> targetOrigins = GetFragDroneTargetOrigins( npc, npc.GetOrigin(), 200, 2000, 64, FRAG_DRONE_BATCH_COUNT )

	if ( targetOrigins.len() < FRAG_DRONE_MIN_LAUNCH_COUNT )
		return

	npc.RequestSpecialRangeAttack( targetOrigins.len() + FRAG_DRONE_IN_FRONT_COUNT )

	// wait for first attack signal
	npc.WaitSignal( "OnSpecialAttack" )
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( "OnScheduleChange" ) // kv.doScheduleChangeSignal = true

	// drop a few in front of enemy view
	entity enemy = npc.GetEnemy()
	if ( enemy )
	{
		vector searchOrigin = enemy.GetOrigin() + ( enemy.GetForwardVector() * 400 )
		array<vector> frontOfEnemyOrigins = GetFragDroneTargetOrigins( npc, searchOrigin, 0, 500, 16, FRAG_DRONE_IN_FRONT_COUNT )

		foreach ( targetOrigin in frontOfEnemyOrigins )
		{
			thread LaunchSpawnerProjectile( npc, targetOrigin, activeMinions_EntArrayID )
			//DebugDrawBox( targetOrigin, Vector(-10, -10, 0), Vector(10, 10, 10), 255, 0, 0, 255, 5 )
			npc.WaitSignal( "OnSpecialAttack" )
		}
	}

	// drop rest in pre-searched spots
	foreach ( targetOrigin in targetOrigins )
	{
		thread LaunchSpawnerProjectile( npc, targetOrigin, activeMinions_EntArrayID )
		npc.WaitSignal( "OnSpecialAttack" )
	}
}

// !!!!! this has been modified to add tickType parameter
void function ReaperMinionLauncherThink( entity reaper, string tickType = "npc_frag_drone_fd" )
{
	// modified: defensive fix for sometimes reaper already entered nuke and we're calling this function
	if ( SuperSpectre_IsReaperDoingNukeSequence( reaper ) )
		return
	//
	
	if ( GetBugReproNum() != 221936 )
		reaper.kv.squadname = ""
		StationaryAIPosition ornull launchPos = GetClosestAvailableStationaryPosition( reaper.GetOrigin(), 8000, eStationaryAIPositionTypes.LAUNCHER_REAPER )
		while ( launchPos == null )
		{
			// incase all stationary reaper positions are in use wait for one to become available
			wait 5
			launchPos = GetClosestAvailableStationaryPosition( reaper.GetOrigin(), 8000, eStationaryAIPositionTypes.LAUNCHER_REAPER )
		}
		expect StationaryAIPosition( launchPos )
	launchPos.inUse = true

	OnThreadEnd(
		function () : ( launchPos )
		{
			launchPos.inUse = false
		}
	)

	reaper.EndSignal( "OnDeath" )
	reaper.EndSignal( "StartedNukeSequence" ) // modified signal: end this thread if reaper has started nuke sequence while still alive
	reaper.AssaultSetFightRadius( 96 )
	reaper.AssaultSetGoalRadius( reaper.GetMinGoalRadius() )

	while ( true )
	{
		WaitFrame()

		if ( Distance( reaper.GetOrigin(), launchPos.origin ) > 96 )
		{
			//printt( reaper," ASSAULT:", launchPos.origin, Distance( reaper.GetOrigin(), launchPos.origin ) )
			reaper.AssaultPoint( launchPos.origin )
			table signalData = WaitSignal( reaper, "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
			//printt( reaper," END ASSAULT:", launchPos.origin, signalData.signal )
			if ( signalData.signal == "OnFailedToPath" )
				continue
		}

		//printt( reaper," LAUNCH:", launchPos.origin )
		waitthread Reaper_LaunchFragDrone_Think( reaper, "npc_frag_drone_fd" )
		//printt( reaper," END LAUNCH:", launchPos.origin )
		while ( GetScriptManagedEntArrayLen( reaper.ai.activeMinionEntArrayID ) > 2 )
			WaitFrame()
	}
}

void function Reaper_LaunchFragDrone_Think( entity reaper, string fragDroneSettings = "" )
{
	// modified: defensive fix for sometimes reaper already entered nuke and we're calling this function
	if ( SuperSpectre_IsReaperDoingNukeSequence( reaper ) )
		return
	//

	if ( reaper.ai.activeMinionEntArrayID < 0 )
		reaper.ai.activeMinionEntArrayID = CreateScriptManagedEntArray()

	int activeMinions_EntArrayID = reaper.ai.activeMinionEntArrayID

	// making it a file const
	//const int MAX_TICKS = 4

	int currentMinions = GetScriptManagedEntArray( reaper.ai.activeMinionEntArrayID ).len()
	// adding new settings function
	//int minionsToSpawn = MAX_TICKS - currentMinions
	int minionsToSpawn = GetReaperMaxMinionSpawn( reaper ) - currentMinions

	if ( minionsToSpawn <= 0 )
		return

	// adding new settings function
	//array<vector> targetOrigins = GetFragDroneTargetOrigins( reaper, reaper.GetOrigin(), 200, 2000, 64, MAX_TICKS )
	array<vector> targetOrigins = GetFragDroneTargetOrigins( reaper, reaper.GetOrigin(), 200, 2000, 64, minionsToSpawn )

	if ( targetOrigins.len() < minionsToSpawn )
		return

	if ( IsAlive( reaper.GetEnemy() ) && ( reaper.GetEnemy().IsPlayer() || reaper.GetEnemy().IsNPC() ) && reaper.CanSee( reaper.GetEnemy() ) )
		return

	OnThreadEnd(
		function() : ( reaper )
		{
			if ( IsValid( reaper ) )
			{
				reaper.Anim_Stop()
			}
		}
	)

	// vanilla missing this case. they always print out reaper's launch
	//printt( reaper, "   BEGIN LAUNCHING: ", minionsToSpawn, reaper.GetCurScheduleName() )
	#if DEV_DEBUG_PRINTS
		printt( reaper, "   BEGIN LAUNCHING: ", minionsToSpawn, reaper.GetCurScheduleName() )
	#endif


	reaper.EndSignal( "OnDeath" )
	reaper.EndSignal( "StartedNukeSequence" ) // modified signal: end this thread if reaper has started nuke sequence while still alive

	while ( !reaper.IsInterruptable() )
		WaitFrame()

	waitthread PlayAnim( reaper, "sspec_idle_to_speclaunch" )

	while ( minionsToSpawn > 0 )
	{
		// drop rest in pre-searched spots
		foreach ( targetOrigin in targetOrigins )
		{
			if ( minionsToSpawn <= 0 )
				break

			// vanilla missing this case. they always print out reaper's launch
			//printt( reaper, "    LAUNCHING: ", minionsToSpawn )
			#if DEV_DEBUG_PRINTS
				printt( reaper, "    LAUNCHING: ", minionsToSpawn )
			#endif
			thread LaunchSpawnerProjectile( reaper, targetOrigin, activeMinions_EntArrayID, fragDroneSettings )
			minionsToSpawn--

			if ( minionsToSpawn <= 0 )
				break

			waitthread PlayAnim( reaper, "sspec_speclaunch_fire" )
		}
		// modified
		//print( "reaper try to spawn a minion..." )
		//WaitFrame() // whatever we do, a WaitFrame() is good to have!
	}

	waitthread PlayAnim( reaper, "sspec_speclaunch_to_idle" )
}



array<vector> function GetFragDroneTargetOrigins( entity npc, vector origin, float minRadius, float maxRadius, int randomCount, int desiredCount )
{
	array<vector> targetOrigins
/*
	vector angles = npc.GetAngles()
	angles.x = 0
	angles.z = 0

	vector origin = npc.GetOrigin() + Vector( 0, 0, 1 )
	float arc = 0
	float dist = 200

	for ( ;; )
	{
		if ( dist > 2000 || targetOrigins.len() >= 12 )
			break

		angles = AnglesCompose( angles, <0,arc,0> )
		arc += 35
		arc %= 360
		dist += 200

		vector ornull tryOrigin = TryCreateFragDroneLaunchTrajectory( npc, origin, angles, dist )
		if ( tryOrigin == null )
			continue
		expect vector( tryOrigin )
		targetOrigins.append( tryOrigin )
	}
*/
	float traceFrac = TraceLineSimple( origin, origin + <0, 0, 200>, npc )
	if ( traceFrac < 1 )
		return targetOrigins;

	array< vector > randomSpots = NavMesh_RandomPositions_LargeArea( origin, HULL_HUMAN, randomCount, minRadius, maxRadius )

	int numFragDrones = 0
	foreach( spot in randomSpots )
	{
		targetOrigins.append( spot )
		numFragDrones++
		if ( numFragDrones == desiredCount )
			break
	}

	return targetOrigins
}

vector ornull function TryCreateFragDroneLaunchTrajectory( entity npc, vector origin, vector angles, float dist )
{
	vector forward = AnglesToForward( angles )
	vector targetOrigin = origin + forward * dist

	vector ornull clampedPos = NavMesh_ClampPointForHullWithExtents( targetOrigin, HULL_HUMAN, < 300, 300, 100 > )

	if ( clampedPos == null )
			return null

	vector vel = GetVelocityForDestOverTime( origin, expect vector( clampedPos ), SPAWN_PROJECTILE_AIR_TIME )
	float traceFrac = TraceLineSimple( origin, origin + vel, npc )
	//DebugDrawLine( origin, origin + vel, 255, 0, 0, true, 5.0 )
	if ( traceFrac >= 0.5 )
		return clampedPos
	return null
}

void function FragDroneDeplyAnimation( entity drone, float minDelay = 0.5, float maxDelay = 2.5 )
{
	Assert( !drone.ai.fragDroneArmed, "Armed drone was told to play can animation. Spawn drone with CreateFragDroneCan()" )
	drone.EndSignal( "OnDeath" )

	drone.SetInvulnerable()
	OnThreadEnd(
		function() : ( drone )
		{
			drone.ClearInvulnerable()
		}
	)

	drone.Anim_ScriptedPlay( "sd_closed_idle" )
	wait RandomFloatRange( minDelay, maxDelay )

	#if MP
	while ( !drone.IsInterruptable() )
	{
		WaitFrame()
	}
	#endif

	drone.Anim_ScriptedPlay( "sd_closed_to_open" )

	// Wait for P_drone_frag_open_flicker FX to play inside sd_closed_to_open
	wait 0.6
}

void function LaunchSpawnerProjectile( entity npc, vector targetOrigin, int activeMinions_EntArrayID, string droneSettings = "" )
{
	//npc.EndSignal( "OnDeath" )

	entity weapon  			= npc.GetOffhandWeapon( 0 )

	if ( !IsValid( weapon ) )
		return

	int id 	   				= npc.LookupAttachment( "launch" )
	vector launchPos		= npc.GetAttachmentOrigin( id )
	int team 				= npc.GetTeam()
	vector launchAngles		= npc.GetAngles()
	string squadname = expect string( npc.kv.squadname )
	vector vel = GetVelocityForDestOverTime( launchPos, targetOrigin, SPAWN_PROJECTILE_AIR_TIME )

//	DebugDrawLine( npc.GetOrigin() + <3,3,3>, launchPos + <3,3,3>, 255, 0, 0, true, 5.0 )
	float armTime = SPAWN_PROJECTILE_AIR_TIME + RandomFloatRange( 1.0, 2.5 )
	vector angularVelocity = < 200, 0, 0 >
	entity nade = weapon.FireWeaponGrenade( launchPos, vel, angularVelocity, armTime, damageTypes.dissolve, damageTypes.explosive, PROJECTILE_NOT_PREDICTED, true, true )

	// modified callbacks, for we can get ticks owner reaper on their spawn
	foreach ( callbackFunc in file.onReaperLaunchedFragDroneSpawnedCallbacks )
		callbackFunc( npc, nade, null, droneSettings )
	//

	AddToScriptManagedEntArray( activeMinions_EntArrayID, nade )
	AddToScriptManagedEntArray( file.activeMinions_GlobalArrayIdx, nade )

	nade.SetOwner( npc )
	nade.EndSignal( "OnDestroy" )

	// modified, minion management
	table results = {}
	results.detonateMinion <- ShouldDetonateMinionsOnDeath( npc )
	//

	OnThreadEnd
	(
		// modified, minion management
		//function() : ( nade, team, activeMinions_EntArrayID, squadname, droneSettings )
		function() : ( nade, team, activeMinions_EntArrayID, squadname, droneSettings, npc, results )
		{
			vector origin = nade.GetOrigin()
			vector angles = nade.GetAngles()

			vector ornull clampedPos = NavMesh_ClampPointForHullWithExtents( origin, HULL_HUMAN, < 100, 100, 100 > )
			if ( clampedPos == null )
				return

			entity drone = CreateFragDroneCan( team, expect vector( clampedPos ), < 0, angles.y, 0 > )
			SetSpawnOption_SquadName( drone, squadname )
			if ( droneSettings != "" )
			{ 
				SetSpawnOption_AISettings( drone, droneSettings )
			}
			drone.kv.spawnflags = SF_NPC_ALLOW_SPAWN_SOLID // clamped to navmesh no need to check solid
			DispatchSpawn( drone )

			// modified callbacks, for we can get ticks owner reaper on their spawn
			foreach ( callbackFunc in file.onReaperLaunchedFragDroneSpawnedCallbacks )
				callbackFunc( npc, nade, drone, droneSettings )
			//

			// modified minion management. if reaper died and we should detonate it's minion...
			if ( !IsAlive( npc ) && results.detonateMinion )
				thread WaitForFragDroneDeployThenDetonate( drone )
			else // vanilla behavior
				thread FragDroneDeplyAnimation( drone )

			AddToScriptManagedEntArray( activeMinions_EntArrayID, drone )
			AddToScriptManagedEntArray( file.activeMinions_GlobalArrayIdx, drone )
		}
	)

	Grenade_Init( nade, weapon )

	EmitSoundOnEntity( npc, "SpectreLauncher_AI_WpnFire" )
	WaitForever()

//	wait SPAWN_PROJECTILE_AIR_TIME + SPAWN_FUSE_TIME
}


// Seriously don't use this unless absolutely necessary!  Used for scripted moment in Reapertown.
// Bypasses all of the tick launch rules and sends a request for launching ticks to code immediately.
void function ForceTickLaunch( entity npc )
{
	SuperSpectre_LaunchFragDrone_Think( npc, file.activeMinions_GlobalArrayIdx )
}


/************************************************************************************************\
########  ########   #######  ########  #######  ######## ##    ## ########  ########
##     ## ##     ## ##     ##    ##    ##     ##    ##     ##  ##  ##     ## ##
##     ## ##     ## ##     ##    ##    ##     ##    ##      ####   ##     ## ##
########  ########  ##     ##    ##    ##     ##    ##       ##    ########  ######
##        ##   ##   ##     ##    ##    ##     ##    ##       ##    ##        ##
##        ##    ##  ##     ##    ##    ##     ##    ##       ##    ##        ##
##        ##     ##  #######     ##     #######     ##       ##    ##        ########
\************************************************************************************************/


function SuperSpectre_WarpFall( entity ai )
{
	ai.EndSignal( "OnDestroy" )

	vector origin = ai.GetOrigin()
	entity mover = CreateOwnedScriptMover( ai )
	ai.SetParent( mover, "", false, 0 )
	ai.Hide()
	ai.SetEfficientMode( true )
	ai.SetInvulnerable()

	WaitFrame() // give AI time to hide before moving

	vector warpPos = origin + < 0, 0, 1000 >
	mover.SetOrigin( warpPos )

	#if GRUNTCHATTER_ENABLED
		GruntChatter_TryIncomingSpawn( ai, origin )
	#endif

	EmitSoundAtPosition( TEAM_UNASSIGNED, origin, "Titan_1P_Warpfall_Start" )

	local e = {}
	e.warpfx <- PlayFX( TURBO_WARP_FX, warpPos + < 0, 0, -104 >, mover.GetAngles() )
	// modified here: all these fx should never hibernate on client-side...
	e.warpfx.DisableHibernation()
	e.smokeFx <- null

	OnThreadEnd(
		function() : ( e, mover, ai )
		{
			if ( IsAlive( ai ) )
			{
				ai.ClearParent()
				ai.SetVelocity( <0,0,0> )
				ai.Signal( "WarpfallComplete" )
			}
			if ( IsValid( e.warpfx ) )
				e.warpfx.Destroy()
			if ( IsValid( e.smokeFx ) )
				e.smokeFx.Destroy()
			if ( IsValid( mover ) )
				mover.Destroy()
		}
	)
	wait 0.5

	EmitSoundAtPosition( TEAM_UNASSIGNED, origin, "Titan_3P_Warpfall_WarpToLanding" )

	wait 0.4

	ai.Show()

	e.smokeFx = PlayFXOnEntity( TURBO_WARP_COMPANY, ai, "", <0.0, 0.0, 152.0> )
	// modified here: all these fx should never hibernate on client-side...
	e.smokeFx.DisableHibernation()

	local time = 0.2
	mover.MoveTo( origin, time, 0, 0 )
	wait time

	ai.SetEfficientMode( false )
	ai.ClearInvulnerable()

	e.smokeFx.Destroy()
	// modified here: use the same FX play method as droppod's landing
	//PlayFX( $"droppod_impact", origin )
	PlayImpactFXTable( origin, ai, HOTDROP_IMPACT_FX_TABLE )

	Explosion_DamageDefSimple(
		damagedef_reaper_fall,
		origin,
		ai,								// attacker
		ai,								// inflictor
		origin )

	wait 0.1
}

bool function ShouldNukeOnDeath( entity ent )
{
	// modified, so you can add nuke reapers without have to change their aisettings
	//if ( IsMultiplayer() )
	//	return false
	if ( IsMultiplayer() )
		return file.forceNukeReapers.contains( ent )

	return ent.Dev_GetAISettingByKeyField( "nuke_on_death" ) == 1
}


// modified...
// settings, shared
void function SuperSpectre_AddNukeDeath( entity ent )
{
	if ( !file.forceNukeReapers.contains( ent ) )
		file.forceNukeReapers.append( ent )
}

void function SuperSpectre_SetNukeDeathThreshold( entity ent, int threshold )
{
	if ( !( ent in file.reaperNukeDamageThreshold ) )
		file.reaperNukeDamageThreshold[ ent ] <- SUPER_SPECTRE_NUKE_DEATH_THRESHOLD // default value
	file.reaperNukeDamageThreshold[ ent ] = threshold
}

void function SuperSpectre_SetForcedKilledByTitans( entity ent, bool forcedKill )
{
	if ( !( ent in file.reaperForcedKilledByTitans ) )
		file.reaperForcedKilledByTitans[ ent ] <- true // default is always force killed by titans
	file.reaperForcedKilledByTitans[ ent ] = forcedKill
}

void function SuperSpectre_SetSelfAsNukeAttacker( entity ent, bool asAttacker )
{
	if ( !( ent in file.reaperAsNukeAttacker ) )
		file.reaperAsNukeAttacker[ ent ] <- false // default is use attacker from damageInfo
	file.reaperAsNukeAttacker[ ent ] = asAttacker
}

void function SuperSpectre_SetDropBatteryOnDeath( entity ent, bool dropBatt )
{
	if ( !( ent in file.reaperDropBattOnDeath ) )
		file.reaperDropBattOnDeath[ ent ] <- false // default is not dropping battery, although npc.ai.shouldDropBattery is default to be true...
	file.reaperDropBattOnDeath[ ent ] = dropBatt
}

void function SuperSpectre_SetNukeExplosionDamageEffect( entity ent, int count, float duration, int damage, int damageHeavyArmor, int innerRadius, int outerRadius, int explosionFlags, int explosionForce, int damageFlags )
{
	ReaperNukeDamage nukeStruct
	if ( !( ent in file.reaperNukeDamageOverrides ) )
		file.reaperNukeDamageOverrides[ ent ] <- nukeStruct // default
	
	nukeStruct.count = count
	nukeStruct.duration = duration
	nukeStruct.damage = damage
	nukeStruct.damageHeavyArmor = damageHeavyArmor
	nukeStruct.innerRadius = innerRadius
	nukeStruct.outerRadius = outerRadius
	nukeStruct.explosionFlags = explosionFlags
	nukeStruct.explosionForce = explosionForce
	nukeStruct.damageFlags = damageFlags
	file.reaperNukeDamageOverrides[ ent ] = nukeStruct
}

void function SuperSpectre_SetSpawnerTickExplodeOnOwnerDeath( entity ent, bool explode )
{
	if ( !( ent in file.reaperMinionExplodeOwnerDeath ) )
		file.reaperMinionExplodeOwnerDeath[ ent ] <- false // default is don't detonate tick on owner death
	file.reaperMinionExplodeOwnerDeath[ ent ] = explode
}

void function SuperSpectre_SetSpawnerTickMaxCount( entity ent, int maxCount )
{
	if ( !( ent in file.reaperMinionMaxCount ) )
		file.reaperMinionMaxCount[ ent ] <- MAX_TICKS // default value
	file.reaperMinionMaxCount[ ent ] = maxCount
}

void function SuperSpectre_SetDoNukeBeforeDeath( entity ent, bool doNukeBeforeDeath )
{
	if ( !( ent in file.reaperDoNukeBeforeDeath ) )
		file.reaperDoNukeBeforeDeath[ ent ] <- false // default value
	file.reaperDoNukeBeforeDeath[ ent ] = doNukeBeforeDeath
}

void function SuperSpectre_SetDoBodyGroupUpdateOnDamage( entity ent, bool updateBodyGroupOnDamage )
{
	if ( !( ent in file.reaperDoBodyGroupUpdateOnDamage ) )
		file.reaperDoBodyGroupUpdateOnDamage[ ent ] <- false // default value
	file.reaperDoBodyGroupUpdateOnDamage[ ent ] = updateBodyGroupOnDamage
}

// get modified settings
int function GetNukeDeathThreshold( entity ent )
{
	if ( !( ent in file.reaperNukeDamageThreshold ) ) // not modified
		return SUPER_SPECTRE_NUKE_DEATH_THRESHOLD // default value
	return file.reaperNukeDamageThreshold[ ent ]
}

bool function IsForcedKilledByTitans( entity ent )
{
	if ( !( ent in file.reaperForcedKilledByTitans ) ) // not modified
		return true // default is always force killed by titans
	return file.reaperForcedKilledByTitans[ ent ]
}

bool function ShouldUseSelfAsNukeAttacker( entity ent )
{
	if ( !( ent in file.reaperAsNukeAttacker ) ) // not modified
		return false // default is use attacker from damageInfo
	return file.reaperAsNukeAttacker[ ent ]
}

bool function ShouldDropBatteryOnDeath( entity ent )
{
	if ( !( ent in file.reaperDropBattOnDeath ) )
		return false // default is not dropping battery, although npc.ai.shouldDropBattery is default to be true...
	return file.reaperDropBattOnDeath[ ent ]
}

bool function ReaperHasNukeDamageOverride( entity ent )
{
	if ( !( ent in file.reaperNukeDamageOverrides ) )
		return false // default is no overrides
	return true
}

ReaperNukeDamage function GetReaperNukeDamageOverride( entity ent )
{
	ReaperNukeDamage defaultStruct
	if ( !( ent in file.reaperNukeDamageOverrides ) )
		return defaultStruct
	return file.reaperNukeDamageOverrides[ ent ]
}

bool function ShouldDetonateMinionsOnDeath( entity ent )
{
	if ( !( ent in file.reaperMinionExplodeOwnerDeath ) ) // not modified
		return false // default is don't detonate tick on owner death
	return file.reaperMinionExplodeOwnerDeath[ ent ]
}

void function SuperSpectre_DetonateAllOwnedTicks( entity npc )
{
	if ( npc.ai.activeMinionEntArrayID > 0 )
	{
		foreach ( entity ent in GetScriptManagedEntArray( npc.ai.activeMinionEntArrayID ) )
		{
			if ( IsValid( ent ) && ent.IsNPC() ) // they may doing a deploy animation or is still a nade, which handled by WaitForFragDroneDeployThenDetonate()
			{
				if ( ent.ai.fragDroneArmed )
				{
					//print( "Signaling SuicideSpectreExploding on " + string( minion ) )
					ent.Signal( "SuicideSpectreExploding" )
				}
				else
					thread WaitForFragDroneArmThenDetonate( ent )
			}
		}
	}
}

void function WaitForFragDroneDeployThenDetonate( entity drone )
{
	drone.EndSignal( "OnDestroy" )
	waitthread FragDroneDeplyAnimation( drone )
	drone.Signal( "SuicideSpectreExploding" )
}

void function WaitForFragDroneArmThenDetonate( entity drone )
{
	drone.EndSignal( "OnDestroy" )
	while ( !drone.ai.fragDroneArmed )
		WaitFrame()
	drone.Signal( "SuicideSpectreExploding" )
}

int function GetReaperMaxMinionSpawn( entity ent )
{
	if ( !( ent in file.reaperMinionMaxCount ) )
		return MAX_TICKS // default value
	return file.reaperMinionMaxCount[ ent ]
}

bool function ShouldReaperDoNukeBeforeDeath( entity ent )
{
	if ( !( ent in file.reaperDoNukeBeforeDeath ) )
		return false // default value
	return file.reaperDoNukeBeforeDeath[ ent ]
}

// shared func
bool function SuperSpectre_IsReaperDoingNukeSequence( entity ent )
{
	return file.reaperDoingNukeSequence[ ent ]
}

bool function ShouldReaperDoDamagedBodyGroupUpdate( entity ent )
{
	if ( !( ent in file.reaperDoBodyGroupUpdateOnDamage ) )
		return false // default value
	return file.reaperDoBodyGroupUpdateOnDamage[ ent ]
}

void function AddCallback_OnReaperLaunchedFragDroneSpawned( void functionref( entity reaper, entity nade, entity fragDrone, string droneSettings ) callbackFunc )
{
	if ( !file.onReaperLaunchedFragDroneSpawnedCallbacks.contains( callbackFunc ) )
		file.onReaperLaunchedFragDroneSpawnedCallbacks.append( callbackFunc )
}
//

void function SuperSpectrejump( entity spectre , vector position)
{
// float blendTime 	= 0.5
// local animStartPos
// animStartPos = guy.Anim_GetStartForRefPoint_Old( animation, origin, angles )
// float dist = Distance( spectre.GetOrigin(), animStartPos.origin )
// float speed = Length( spectre.GetVelocity() )
// float fallTime = dist / speed
// fallTime *= 0.95
string jumpAnim = "sspec_traverse_across_512"

float jumpTime = spectre.GetSequenceDuration( jumpAnim )
//float parentBlend = blendTime + ( jumpTime * 0.75 )

vector vec = position - spectre.GetOrigin()
vector angles = VectorToAngles( vec )
spectre.SetAngles( angles )
//spectre.SetParent( rodeoTarget, attachment, false, parentBlend )
//spectre.Anim_ScriptedPlay( jumpAnim )
//SetForceDrawWhileParented( spectre, true )
spectre.Anim_ScriptedPlayWithRefPoint( "sspec_traverse_across_512", vec, angles,  jumpTime )
WaittillAnimDone( spectre )
//wait jumpTime + 2
//spectre.ClearParent()


}


