global function singleNav_thread
global function droneNav_thread
global function Dev_ShowRoute
global function NPCStuckTracker

/*
  _  _  ___   ___   _  _             _              _    _              ___  _           __   __ 
 | \| || _ \ / __| | \| | __ _ __ __(_) __ _  __ _ | |_ (_) ___  _ _   / __|| |_  _  _  / _| / _|
 | .` ||  _/| (__  | .` |/ _` |\ V /| |/ _` |/ _` ||  _|| |/ _ \| ' \  \__ \|  _|| || ||  _||  _|
 |_|\_||_|   \___| |_|\_|\__,_| \_/ |_|\__, |\__,_| \__||_|\___/|_||_| |___/ \__| \_,_||_|  |_|  
                                       |___/                                                     
*/

void function singleNav_thread( entity npc, string routeName, int nodesToSkip = 1, float nextDistance = -1.0, bool shouldLoop = false )
{
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnLeeched" )

	if( !npc.IsNPC() )
		return
	
	if ( nextDistance == -1 && npc.IsTitan() )
		nextDistance = npc.GetMinGoalRadius()
	else if ( nextDistance == -1 )
		nextDistance = 160

	string npcName = npc.GetTargetName()

	WaitFrame()
	float dist = 65535
	entity targetNode
	string routetaken
	string GuySquadName = expect string( npc.kv.squadname )
	array<entity> squad
	if ( GuySquadName != "" )
		squad = GetNPCArrayBySquad( GuySquadName )
	
	if( !npc.IsTitan() )
		thread NPCStuckTracker( npc )
	
	if( !useCustomFDLoad )
	{
		if ( routeName == "" )
		{
			foreach ( entity node in routeNodes )
			{
				if( !node.HasKey( "route_name" ) )
					continue
				if( squad.len() > 0 )
				{
					if ( Distance( squad[0].GetOrigin(), node.GetOrigin() ) < dist )
					{
						dist = Distance( squad[0].GetOrigin(), node.GetOrigin() )
						targetNode = node
					}
				}
				else if ( Distance( npc.GetOrigin(), node.GetOrigin() ) < dist )
				{
					dist = Distance( npc.GetOrigin(), node.GetOrigin() )
					targetNode = node
				}
			}
			
			if( squad.len() > 0 )
			{
				if( npc == squad[0] )
					printt( "Squad entities had no route defined, using nearest node: " + targetNode.kv.route_name )
			}
			else
				printt( "Single entity had no route defined, using nearest node: " + targetNode.kv.route_name )
		}
		else
			targetNode = GetRouteStart( routeName )

		// skip nodes
		for ( int i = 0; i < nodesToSkip; i++ )
			targetNode = targetNode.GetLinkEnt()
	}
	else
	{
		if ( routeName == "" )
		{
			foreach ( routename, routeamount in routes )
			{
				if( squad.len() > 0 )
				{
					if ( Distance( squad[0].GetOrigin(), routeamount[0] ) < dist )
					{
						dist = Distance( squad[0].GetOrigin(), routeamount[0] )
						routetaken = routename
					}
				}
				else if ( Distance( npc.GetOrigin(), routeamount[0] ) < dist )
				{
					dist = Distance( npc.GetOrigin(), routeamount[0] )
					routetaken = routename
				}
			}
			if( squad.len() > 0 )
			{
				if( npc == squad[0] )
					printt( "Squad entities had no route defined, using nearest node: " + routetaken )
			}
			else
				printt( "Single entity had no route defined, using nearest node: " + routetaken )
		}
		else
			routetaken = routeName
	}

	//Do not make Ticks ignore potential targets just to charge at the Harvester
	//Arc Titans apparently also stops to fight players on place rather that fiercely push forward
	//Combat Reapers seems to be a little agressive rather than just sprint to the Harvester mindlessly
	//Elite Titans will be fighting players since they can push to the Harvester way more easily than the common titans
	if ( npc.GetClassName() == "npc_frag_drone" )
		npc.AssaultSetFightRadius( expect int( npc.Dev_GetAISettingByKeyField( "LookDistDefault_Combat" ) ) )
	else if ( npcName == "empTitan" || IsSuperSpectre( npc ) || npc.ai.bossTitanType == TITAN_MERC )
		npc.AssaultSetFightRadius( 800 )
	else
		npc.AssaultSetFightRadius( 0 )
	
	if( !useCustomFDLoad )
	{
		while ( targetNode != null )
		{
			if( !IsHarvesterAlive( fd_harvester.harvester ) )
				return
			npc.AssaultPointClamped( targetNode.GetOrigin() )
			npc.AssaultSetGoalRadius( nextDistance )
			
			table result = npc.WaitSignal( "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
			/* if( result.signal == "OnFailedToPath" && !npc.IsTitan() && !IsSuperSpectre( npc ) )
			{
				vector ornull clampedPos = NavMesh_ClampPointForAI( targetNode.GetOrigin(), npc )
				if ( clampedPos != null )
					npc.SetOrigin( expect vector( clampedPos ) )
			}
			*/
			targetNode = targetNode.GetLinkEnt()
		}
	}
	
	else
	{
		int routeindex = nodesToSkip
		vector routepoint = routes[routetaken][routeindex]
		while ( true )
		{
			if( !IsHarvesterAlive( fd_harvester.harvester ) )
				return
			npc.AssaultPointClamped( routepoint )
			npc.AssaultSetGoalRadius( nextDistance )
			
			table result = npc.WaitSignal( "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
			
			routeindex++
			if( routeindex < routes[routetaken].len() )
				routepoint = routes[routetaken][routeindex]
			else
				break
		}
	}

	if ( ( npc.GetClassName() == "npc_frag_drone" || npc.GetClassName() == "npc_stalker" ) && IsHarvesterAlive( fd_harvester.harvester ) )
	{
		npc.AssaultPointClamped( fd_harvester.harvester.GetOrigin() + < 0, 0, 16 > )
		npc.AssaultSetGoalRadius( 64 )
	}

	npc.Signal( "FD_ReachedHarvester" )
}

void function droneNav_thread( entity npc, string routeName, int nodesToSkip = 0, float nextDistance = 64.0, bool shouldLoop = false )
{
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( "OnDestroy" )
	npc.EndSignal( "OnLeeched" )

	if( !npc.IsNPC() )
		return

	WaitFrame()
	float dist = 65535
	entity targetNode
	entity firstNode
	string routetaken
	string GuySquadName = expect string( npc.kv.squadname )
	array<entity> squad
	if ( GuySquadName != "" )
		squad = GetNPCArrayBySquad( GuySquadName )
	
	if( !npc.IsTitan() )
		thread NPCStuckTracker( npc )
	
	if( !useCustomFDLoad )
	{
		if ( routeName == "" )
		{
			foreach ( entity node in routeNodes )
			{
				if( !node.HasKey( "route_name" ) )
					continue
				if( squad.len() > 0 )
				{
					if ( Distance( squad[0].GetOrigin(), node.GetOrigin() ) < dist )
					{
						dist = Distance( squad[0].GetOrigin(), node.GetOrigin() )
						targetNode = node
						firstNode = node
					}
				}
				else if ( Distance( npc.GetOrigin(), node.GetOrigin() ) < dist )
				{
					dist = Distance( npc.GetOrigin(), node.GetOrigin() )
					targetNode = node
					firstNode = node
				}
			}
			if( squad.len() > 0 )
			{
				if( npc == squad[0] )
					printt( "Squad entities had no route defined, using nearest node: " + targetNode.kv.route_name )
			}
			else
				printt( "Single entity had no route defined, using nearest node: " + targetNode.kv.route_name )
		}
		else
			targetNode = GetRouteStart( routeName )

		// skip nodes
		for ( int i = 0; i < nodesToSkip; i++ )
		{
			targetNode = targetNode.GetLinkEnt()
			firstNode = targetNode.GetLinkEnt()
		}
	}
	else
	{
		if ( routeName == "" )
		{
			foreach ( routename, routeamount in routes )
			{
				if( squad.len() > 0 )
				{
					if ( Distance( squad[0].GetOrigin(), routeamount[0] ) < dist )
					{
						dist = Distance( squad[0].GetOrigin(), routeamount[0] )
						routetaken = routename
					}
				}
				else if ( Distance( npc.GetOrigin(), routeamount[0] ) < dist )
				{
					dist = Distance( npc.GetOrigin(), routeamount[0] )
					routetaken = routename
				}
			}
			if( squad.len() > 0 )
			{
				if( npc == squad[0] )
					printt( "Squad entities had no route defined, using nearest node: " + routetaken )
			}
			else
				printt( "Single entity had no route defined, using nearest node: " + routetaken )
		}
		else
			routetaken = routeName
	}

	if( !useCustomFDLoad )
	{
		while ( targetNode != null )
		{
			if( !IsHarvesterAlive( fd_harvester.harvester ) )
				return
			npc.AssaultPoint( targetNode.GetOrigin() + < 0, 0, 192 > )
			npc.AssaultSetGoalRadius( nextDistance )
			npc.AssaultSetGoalHeight( 128 )
			npc.AssaultSetFightRadius( 0 )
			
			table result = npc.WaitSignal( "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
			
			targetNode = targetNode.GetLinkEnt()
			if ( targetNode == null )
				printt( "drone finished pathing" )
			if ( targetNode == null && shouldLoop )
			{
				printt( "drone reached end of loop, looping" )
				targetNode = firstNode
			}
		}
	}
	
	else
	{
		int routeindex = nodesToSkip
		vector routepoint = routes[routetaken][routeindex]
		while ( true )
		{
			if( !IsHarvesterAlive( fd_harvester.harvester ) )
				return
			npc.AssaultPoint( routepoint + < 0, 0, 192 > )
			npc.AssaultSetGoalRadius( nextDistance )
			npc.AssaultSetGoalHeight( 128 )
			npc.AssaultSetFightRadius( 0 )
			
			table result = npc.WaitSignal( "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
			
			routeindex++
			if( routeindex < routes[routetaken].len() )
				routepoint = routes[routetaken][routeindex]
			else
			{
				if( shouldLoop )
				{
					printt( "drone reached end of loop, looping" )
					routeindex = 0
					routepoint = routes[routetaken][routeindex]
				}
				else
				{
					printt( "drone finished pathing" )
					break
				}
			}
		}
	}

	npc.Signal( "FD_ReachedHarvester" )
}

entity function GetRouteStart( string routeName )
{
	foreach( entity node in routeNodes )
	{
		if( !node.HasKey( "route_name" ) )
			continue
		if( expect string( node.kv.route_name ) == routeName )
			return node
	}
}

void function Dev_ShowRoute( string routename, int routetype = 0 )
{
	if( !useCustomFDLoad )
	{
		if( routetype == 1 )
			thread TitanTracksPathing( routename )
		else if( routetype == 2 )
			thread DroneTracksPathing( routename )
		else
			thread GruntTracksPathing( routename )
	}
}

void function GruntTracksPathing( string route )
{
	entity guy = CreateSoldier( TEAM_MILITIA, GetRouteStart( route ).GetOrigin(), < 0, 0, 0 > )
	DispatchSpawn( guy )
	PlayLoopFXOnEntity( $"P_ar_holopilot_trail", guy, "CHESTFOCUS" )
	
	guy.NotSolid()
	guy.EnableNPCFlag( NPC_DISABLE_SENSING | NPC_IGNORE_ALL )
	guy.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	NPC_NoTarget( guy )
	
	WaitFrame()
	guy.SetTitle( route )
	while ( IsAlive( guy ) )
	{
		thread singleNav_thread( guy, route )
		table result = guy.WaitSignal( "FD_ReachedHarvester" )
		wait 5.0
		guy.SetOrigin( GetRouteStart( route ).GetOrigin() ) //restart route
	}
}

void function TitanTracksPathing( string route )
{
	entity guy = CreateNPCTitan( "titan_stryder", TEAM_MILITIA, GetRouteStart( route ).GetOrigin(), < 0, 0, 0 > )
	SetSpawnOption_AISettings( guy, "npc_titan_stryder_leadwall" )
	DispatchSpawn( guy )
	PlayLoopFXOnEntity( $"P_ar_holopilot_trail", guy, "CHESTFOCUS" )
	
	guy.NotSolid()
	guy.EnableNPCFlag( NPC_DISABLE_SENSING | NPC_IGNORE_ALL )
	guy.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	NPC_NoTarget( guy )
	
	WaitFrame()
	guy.SetTitle( route )
	ShowName( guy )
	while ( IsAlive( guy ) )
	{
		thread singleNav_thread( guy, route )
		table result = guy.WaitSignal( "FD_ReachedHarvester" )
		guy.SetOrigin( GetRouteStart( route ).GetOrigin() ) //restart route
		wait 0.5
	}
}

void function DroneTracksPathing( string route )
{
	entity guy = CreateGenericDrone( TEAM_MILITIA, GetRouteStart( route ).GetOrigin() + < 0, 0, 32 >, < 0, 0, 0 > )
	SetSpawnOption_AISettings( guy, "npc_drone_plasma_fd" )
	DispatchSpawn( guy )
	PlayLoopFXOnEntity( $"P_ar_holopilot_trail", guy )
	
	guy.NotSolid()
	guy.EnableNPCFlag( NPC_DISABLE_SENSING | NPC_IGNORE_ALL )
	guy.EnableNPCMoveFlag( NPCMF_PREFER_SPRINT )
	NPC_NoTarget( guy )
	
	WaitFrame()
	guy.SetTitle( route )
	thread droneNav_thread( guy, route )
}

void function NPCStuckTracker( entity npc ) //Track if AI is properly pathing, otherwise after one minute, it will suicide to prevent softlocking
{
	npc.EndSignal( "OnDeath" )
	npc.EndSignal( "OnDestroy" )
	
	int FailCount = 0
	while ( IsAlive( npc ) )
	{
		table result = npc.WaitSignal( "OnSeeEnemy", "OnFinishedAssault", "OnEnterGoalRadius", "OnFailedToPath" )
		if( result.signal == "OnFailedToPath" )
		{
			if( FailCount == 60 )
				npc.Die()
			FailCount++
		}
		else
			FailCount = 0
			
		wait 1
	}
}