
global function OnProjectileCollision_ClusterRocket

const asset LASER_TRIP_EXPLODE_FX = $"wpn_grenade_TT_activate"

void function OnProjectileCollision_ClusterRocket( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical )
{	
	array<string> mods = projectile.ProjectileGetMods()
	if(!mods.contains("exdump")){
		float duration = mods.contains( "pas_northstar_cluster" ) ? PAS_NORTHSTAR_CLUSTER_ROCKET_DURATION : CLUSTER_ROCKET_DURATION

		#if SERVER
			float explosionDelay = expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "projectile_explosion_delay" ) )

			ClusterRocket_Detonate( projectile, normal )
			CreateNoSpawnArea( TEAM_INVALID, TEAM_INVALID, pos, ( duration + explosionDelay ) * 0.5 + 1.0, CLUSTER_ROCKET_BURST_RANGE + 100 )
		#endif
	}
	else if(mods.contains("exdump")){
		Explosion(pos, projectile.GetOwner(), null, 25, 800, 350, 350, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES,pos,350, damageTypes.explosive, eDamageSourceId.dumphit, ARC_CANNON_FX_TABLE)
		PlayFX( LASER_TRIP_EXPLODE_FX, pos, < -90.0, 0.0, 0.0 > )
		thread visthread(pos)
	}
	
}

void function visthread(vector location)
{
	entity ind = CreateEntity( "prop_dynamic" )
	ind.SetValueForModelKey( $"models/fx/xo_emp_field.mdl" )
	ind.SetOrigin( <location.x,location.y,location.z+50>)
	ind.kv.modelscale = 1.6
	thread indsize(ind)
	ind.kv.rendercolor = <35,225,102>
	ind.SetTakeDamageType(DAMAGE_NO)
	DispatchSpawn( ind )

	thread indicatortimeout(ind)


}

void function indsize(entity ind)
{
	for(int size = 160 ; size > 1 ; size -= 6){
		if(!IsValid(ind) )
		break

		if(IsValid(ind) && size > 0)
			ind.kv.modelscale = float(size)/100.0

		WaitFrame()

	}
	
	
}

void function indicatortimeout(entity indicator) {
	wait 2 //some number thats a bit larger than rewind window
	if (IsValid(indicator)) {
		
		indicator.Destroy()
		
	}
	
}
