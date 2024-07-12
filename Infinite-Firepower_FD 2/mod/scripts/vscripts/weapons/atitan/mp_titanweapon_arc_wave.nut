
global function MpTitanWeaponArcWave_Init
global function OnWeaponPrimaryAttack_titanweapon_arc_wave
global function OnWeaponActivate_titanweapon_arcwave
global function OnWeaponDeactivate_titanweapon_arcwave
global function OnWeaponAttemptOffhandSwitch_titanweapon_arc_wave

#if SERVER
global function OnWeaponNpcPrimaryAttack_titanweapon_arc_wave
global function CreateDamageInflictorHelper
global function CreateOncePerTickDamageInflictorHelper
global function ArcWaveOnDamage
global function AddArcWaveDamageCallback

const float PHASE_REWIND_PATH_SNAPSHOT_INTERVAL = 0.1
const FX_EMP_FIELD						= $"P_xo_emp_field"

struct
{
	array< void functionref( entity, var ) > arcWaveDamageCallbacks = []
} file

#endif

const asset ARCWAVE_FX_SCREEN = $"P_elec_screen"

void function FindNearestSafeSpotAndPutEntity( entity ent, int severity )
{
	vector baseOrigin = ent.GetOrigin()

    if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x, baseOrigin.y+severity, baseOrigin.z >, baseOrigin ) )
        return

    if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x, baseOrigin.y-severity, baseOrigin.z >, baseOrigin ) )
        return

    if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x+severity, baseOrigin.y, baseOrigin.z >, baseOrigin ) )
        return

	if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x-severity, baseOrigin.y, baseOrigin.z >, baseOrigin ) )
        return

	if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x, baseOrigin.y, baseOrigin.z+severity >, baseOrigin ) )
        return

	if( PutEntityInSafeSpot( ent, ent, null, < baseOrigin.x, baseOrigin.y, baseOrigin.z-severity >, baseOrigin ) )
        return

    return FindNearestSafeSpotAndPutEntity( ent, severity+5 )
}

void function MpTitanWeaponArcWave_Init()
{
	PrecacheParticleSystem( $"P_arcwave_exp" )
	PrecacheParticleSystem( $"P_arcwave_exp_charged" )
	PrecacheParticleSystem( ARCWAVE_FX_SCREEN )

	#if SERVER
		AddDamageCallbackSourceID( eDamageSourceId.mp_titanweapon_arc_wave, ArcWaveOnDamage )
	#elseif CLIENT
		AddLocalPlayerTookDamageCallback( eDamageSourceId.mp_titanweapon_arc_wave, ClArcWaveOnDamage )
	#endif
}

void function OnWeaponActivate_titanweapon_arcwave( entity weapon )
{
	entity offhandWeapon = weapon.GetWeaponOwner().GetOffhandWeapon( OFFHAND_MELEE )
	if ( IsValid( offhandWeapon ) && offhandWeapon.HasMod( "super_charged" ) )
	{
		if ( weapon.HasMod( "modelset_prime" ) )
			weapon.PlayWeaponEffectNoCull( SWORD_GLOW_PRIME_FP, SWORD_GLOW_PRIME, "sword_edge" )
		else
			weapon.PlayWeaponEffectNoCull( SWORD_GLOW_FP, SWORD_GLOW, "sword_edge" )
	}
}

void function OnWeaponDeactivate_titanweapon_arcwave( entity weapon )
{
	if ( weapon.HasMod( "modelset_prime" ) )
		weapon.StopWeaponEffect( SWORD_GLOW_PRIME_FP, SWORD_GLOW_PRIME )
	else
		weapon.StopWeaponEffect( SWORD_GLOW_FP, SWORD_GLOW )
}

var function OnWeaponPrimaryAttack_titanweapon_arc_wave( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity weaponOwner = weapon.GetWeaponOwner()
	if ( weaponOwner.IsPhaseShifted() )
		return 0

	bool shouldPredict = weapon.ShouldPredictProjectiles()
	#if CLIENT
		if ( !shouldPredict )
			return 1
	#endif

	const float FUSE_TIME = 99.0

	if(weapon.HasMod("exarcwave")){
		weaponOwner.SetTitle("騙術師")
		weaponOwner.GetTitanSoul().SetTitle("騙術師")
		if ( weaponOwner in playerDecoyList ){
			CreateHoloPilotDecoys( weaponOwner, 1 )
			entity decoy = playerDecoyList[ weaponOwner ]
			thread EMPMissileThinkConstant(weaponOwner, weaponOwner)

			PlayerUsesHoloRewind(weaponOwner, decoy)
			if(weaponOwner in playerDecoyActiveFrom){
				delete playerDecoyActiveFrom[weaponOwner]
			}
			if(GetCurrentPlaylistName() == "lts"){
				if(PlayerHasBattery(weaponOwner)){
					Rodeo_TakeBatteryAwayFromPilot(weaponOwner)
				}
			}
		}
		else{
			thread EMPMissileThinkConstant(weaponOwner, weaponOwner)
		}

	}
	else{
		entity projectile = weapon.FireWeaponGrenade( attackParams.pos, attackParams.dir, < 0,0,0 >, FUSE_TIME, damageTypes.projectileImpact, damageTypes.explosive, shouldPredict, true, true )
		if ( IsValid( projectile ) )
		{
			entity owner = weapon.GetWeaponOwner()
			if ( owner.IsPlayer() && PlayerHasPassive( owner, ePassives.PAS_SHIFT_CORE ) )
			{
				#if SERVER
					projectile.proj.isChargedShot = true
				#endif
			}

			if ( owner.IsPlayer() )
				PlayerUsedOffhand( owner, weapon )

			#if SERVER
				thread BeginEmpWave( projectile, attackParams )
			#endif
		}
	}

	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_min_to_fire )
}

#if SERVER
void function AddArcWaveDamageCallback( void functionref( entity, var ) callback )
{
	file.arcWaveDamageCallbacks.append( callback )
}

void function BeginEmpWave( entity projectile, WeaponPrimaryAttackParams attackParams )
{
	projectile.EndSignal( "OnDestroy" )
	projectile.SetAbsOrigin( projectile.GetOrigin() )
	projectile.SetAbsAngles( projectile.GetAngles() )
	projectile.SetVelocity( Vector( 0, 0, 0 ) )
	projectile.StopPhysics()
	projectile.SetTakeDamageType( DAMAGE_NO )
	projectile.Hide()
	projectile.NotSolid()
	projectile.e.onlyDamageEntitiesOnce = true
	EmitSoundOnEntity( projectile, "arcwave_tail_3p" )
	waitthread WeaponAttackWave( projectile, 0, projectile, attackParams.pos, attackParams.dir, CreateEmpWaveSegment )
	StopSoundOnEntity( projectile, "arcwave_tail_3p" )
	projectile.Destroy()
}

var function OnWeaponNpcPrimaryAttack_titanweapon_arc_wave( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	const float FUSE_TIME = 99.0
	entity projectile = weapon.FireWeaponGrenade( attackParams.pos, attackParams.dir, < 0,0,0 >, FUSE_TIME, damageTypes.projectileImpact, damageTypes.explosive, false, true, true )
	if ( IsValid( projectile ) )
		thread BeginEmpWave( projectile, attackParams )

	return 1
}
#endif

#if SERVER
bool function CreateEmpWaveSegment( entity projectile, int projectileCount, entity inflictor, entity movingGeo, vector pos, vector angles, int waveCount )
{
	projectile.SetOrigin( pos )

	float damageScalar
	int fxId
	if ( !projectile.proj.isChargedShot )
	{
		damageScalar = 1.0
		fxId = GetParticleSystemIndex( $"P_arcwave_exp" )
	}
	else
	{
		damageScalar = 1.5
		fxId = GetParticleSystemIndex( $"P_arcwave_exp_charged" )
	}
	StartParticleEffectInWorld( fxId, pos, angles )
	int pilotDamage = int( float( projectile.GetProjectileWeaponSettingInt( eWeaponVar.damage_near_value ) ) * damageScalar )
	int titanDamage = int( float( projectile.GetProjectileWeaponSettingInt( eWeaponVar.damage_near_value_titanarmor ) ) * damageScalar )

	RadiusDamage(
		pos,
		projectile.GetOwner(), //attacker
		inflictor, //inflictor
		pilotDamage,
		titanDamage,
		112, // inner radius
		112, // outer radius
		SF_ENVEXPLOSION_NO_DAMAGEOWNER | SF_ENVEXPLOSION_MASK_BRUSHONLY | SF_ENVEXPLOSION_NO_NPC_SOUND_EVENT,
		0, // distanceFromAttacker
		0, // explosionForce
		DF_ELECTRICAL | DF_STOPS_TITAN_REGEN,
		eDamageSourceId.mp_titanweapon_arc_wave )

	return true
}

const FX_EMP_BODY_HUMAN			= $"P_emp_body_human"
const FX_EMP_BODY_TITAN			= $"P_emp_body_titan"

void function ArcWaveOnDamage( entity ent, var damageInfo )
{
	vector pos = DamageInfo_GetDamagePosition( damageInfo )
	entity attacker = DamageInfo_GetAttacker( damageInfo )

	EmitSoundOnEntity( ent, ARC_CANNON_TITAN_SCREEN_SFX )

	if ( ent.IsPlayer() || ent.IsNPC() )
	{
		//Run any custom callbacks for arc wave damage.
		foreach ( callback in file.arcWaveDamageCallbacks )
		{
			callback( ent, damageInfo )
		}

		entity entToSlow = ent
		entity soul = ent.GetTitanSoul()

		if ( soul != null )
			entToSlow = soul

		StatusEffect_AddTimed( entToSlow, eStatusEffect.move_slow, 0.5, 2.0, 1.0 )
		StatusEffect_AddTimed( entToSlow, eStatusEffect.dodge_speed_slow, 0.5, 2.0, 1.0 )
	}

	string tag = ""
	asset effect

	if ( ent.IsTitan() )
	{
		tag = "exp_torso_front"
		effect = FX_EMP_BODY_TITAN
	}
	else if ( ChestFocusTarget( ent ) )
	{
		tag = "CHESTFOCUS"
		effect = FX_EMP_BODY_HUMAN
	}
	else if ( IsAirDrone( ent ) )
	{
		tag = "HEADSHOT"
		effect = FX_EMP_BODY_HUMAN
	}
	else if ( IsGunship( ent ) )
	{
		tag = "ORIGIN"
		effect = FX_EMP_BODY_TITAN
	}

	if ( tag != "" )
	{
		float duration = 2.0
		thread EMP_FX( effect, ent, tag, duration )
	}

	if ( ent.IsTitan() )
	{
		if ( ent.IsPlayer() )
		{
		 	EmitSoundOnEntityOnlyToPlayer( ent, ent, "titan_energy_bulletimpact_3p_vs_1p" )
			EmitSoundOnEntityExceptToPlayer( ent, ent, "titan_energy_bulletimpact_3p_vs_3p" )
		}
		else
		{
		 	EmitSoundOnEntity( ent, "titan_energy_bulletimpact_3p_vs_3p" )
		}
	}
	else
	{
		if ( ent.IsPlayer() )
		{
		 	EmitSoundOnEntityOnlyToPlayer( ent, ent, "flesh_lavafog_deathzap_3p" )
			EmitSoundOnEntityExceptToPlayer( ent, ent, "flesh_lavafog_deathzap_1p" )
		}
		else
		{
		 	EmitSoundOnEntity( ent, "flesh_lavafog_deathzap_1p" )
		}
	}
}

bool function ChestFocusTarget( entity ent )
{
	if ( IsSpectre( ent ) )
		return true
	if ( IsStalker( ent ) )
		return true
	if ( IsSuperSpectre( ent ) )
		return true
	if ( IsGrunt( ent ) )
		return true
	if ( IsPilot( ent ) )
		return true

	return false
}

entity function CreateDamageInflictorHelper( float lifetime )
{
	entity inflictor = CreateEntity( "info_target" )
	DispatchSpawn( inflictor )
	inflictor.e.onlyDamageEntitiesOnce = true
	if ( lifetime > 0.0 )
		thread DelayedDestroyDamageInflictorHelper( inflictor, lifetime )
	return inflictor
}

entity function CreateOncePerTickDamageInflictorHelper( float lifetime )
{
	entity inflictor = CreateEntity( "info_target" )
	DispatchSpawn( inflictor )
	inflictor.e.onlyDamageEntitiesOncePerTick = true
	if ( lifetime > 0.0 )
		thread DelayedDestroyDamageInflictorHelper( inflictor, lifetime )
	return inflictor
}


void function DelayedDestroyDamageInflictorHelper( entity inflictor, float lifetime )
{
	inflictor.EndSignal( "OnDestroy" )
	wait lifetime
	inflictor.Destroy()
}
#endif

#if CLIENT
void function ClArcWaveOnDamage( float damage, vector damageOrigin, int damageType, int damageSourceId, entity attacker )
{
	entity player = GetLocalViewPlayer()
	entity cockpit = player.GetCockpit()
	if ( IsValid( cockpit ) )
		StartParticleEffectOnEntity( cockpit, GetParticleSystemIndex( ARCWAVE_FX_SCREEN ), FX_PATTACH_ABSORIGIN_FOLLOW, -1 )
}
#endif

bool function OnWeaponAttemptOffhandSwitch_titanweapon_arc_wave( entity weapon )
{
	entity weaponOwner = weapon.GetWeaponOwner()
	if ( weaponOwner.IsPhaseShifted() )
		return false

	return true
}

#if SERVER
void function PlayerUsesHoloRewind( entity player, entity decoy )
{
	thread PlayerUsesHoloRewindThreaded( player, decoy )
}

void function PlayerUsesHoloRewindThreaded( entity player, entity decoy )
{
	player.EndSignal( "OnDestroy" )
	player.EndSignal( "OnDeath" )
	decoy.EndSignal("OnDestroy")
	decoy.EndSignal("OnDeath")
	entity mover = CreateScriptMover( player.GetOrigin(), player.GetAngles() )
	player.SetParent( mover, "REF" )

	table decoyData = {}
	decoyData.forceCrouch <- TraceLine
							 ( decoy.GetOrigin(), 
							   decoy.GetOrigin() + < 0,0,80 >, // 40 is crouched pilot height! add additional 40 for better check
							   [ decoy ], 
							   TRACE_MASK_SHOT, 
							   TRACE_COLLISION_GROUP_NONE 
							 ).hitEnt != null // decoy will stuck, need to forceCrouch player

	OnThreadEnd( function() : ( player, mover, decoy, decoyData )
	{
		if ( IsValid( player ) )
		{
			player.SetOrigin(decoy.GetOrigin())
			player.SetAngles(decoy.GetAngles())
			player.SetVelocity(decoy.GetVelocity())
			CancelPhaseShift( player )
			player.DeployWeapon()
			player.SetPredictionEnabled( true )
			player.ClearParent()
			ViewConeFree( player )
			FindNearestSafeSpotAndPutEntity( player, 5 )
			if( decoyData.forceCrouch )
				thread HoloRewindForceCrouch( player ) // this will handle "UnforceCrouch()"
		}

		if ( IsValid( mover ) )
			mover.Destroy()

		if ( IsValid( decoy ) )
			CleanupExistingDecoy(decoy)
	}
	)

	vector initial_origin = player.GetOrigin()
	vector initial_angle = player.GetAngles()
	array<PhaseRewindData> positions = clone player.p.burnCardPhaseRewindStruct.phaseRetreatSavedPositions

	ViewConeZero( player )
	player.HolsterWeapon()
	player.SetPredictionEnabled( false )
	if( decoyData.forceCrouch )
		player.ForceCrouch() // avoid stucking!
	PhaseShift( player, 0.0, 7 * PHASE_REWIND_PATH_SNAPSHOT_INTERVAL * 1.5 )

	for ( float i = 7; i > 0; i-- )
	{
		initial_origin -= (initial_origin-decoy.GetOrigin())*(1/i)
		initial_angle -= (initial_angle-decoy.GetAngles())*(1/i)
		mover.NonPhysicsMoveTo( initial_origin, PHASE_REWIND_PATH_SNAPSHOT_INTERVAL, 0, 0 )
		//mover.NonPhysicsRotateTo( initial_angle, PHASE_REWIND_PATH_SNAPSHOT_INTERVAL, 0, 0 )
		wait PHASE_REWIND_PATH_SNAPSHOT_INTERVAL
	}
	/*vector safepos = TraceLine
							 ( decoy.GetOrigin(), 
							   decoy.GetOrigin() - 100*Normalize(decoy.GetAngles()), // 40 is crouched pilot height! add additional 40 for better check
							   decoy, 
							   TRACE_MASK_SHOT, 
							   TRACE_COLLISION_GROUP_NONE 
							 ).endPos // decoy will stuck, need to forceCrouch player*/
	mover.NonPhysicsMoveTo( decoy.GetOrigin(), PHASE_REWIND_PATH_SNAPSHOT_INTERVAL, 0, 0 )
	//mover.NonPhysicsRotateTo( decoy.GetAngles(), PHASE_REWIND_PATH_SNAPSHOT_INTERVAL, 0, 0 )
	player.SetVelocity( decoy.GetVelocity() )
	FindNearestSafeSpotAndPutEntity( player, 5 )
	
}

void function HoloRewindForceCrouch( entity player )
{
	// make player crouch
	player.ForceCrouch()
	wait 0.2 // magic number, player must be completely crouched to avoid auto-stand
	if( IsValid( player ) )
		player.UnforceCrouch()
}
#endif

