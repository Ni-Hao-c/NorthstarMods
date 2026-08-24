global function Progression_Init
global function ProgressionEnabledForPlayer

#if CLIENT || UI
	global function Progression_SetPreference
	global function Progression_GetPreference
	global function UpdateCachedLoadouts_Delayed
#endif

#if SP
	void function Progression_Init()
	{
	}

	bool function ProgressionEnabledForPlayer( entity player )
	{
		return false
	}

	#if CLIENT || UI
		void function Progression_SetPreference( bool enabled )
		{
		}

		bool function Progression_GetPreference()
		{
			return false
		}

		void function UpdateCachedLoadouts_Delayed()
		{
		}
	#endif
#else
	#if SERVER
		struct
		{
			table<entity, bool> progressionEnabled
		} file
	#else
		struct
		{
			bool isUpdatingCachedLoadouts = false
		} file
	#endif

	void function Progression_Init()
	{
		#if SERVER
			AddCallback_OnClientDisconnected( Progression_OnClientDisconnected )
			AddClientCommandCallback( "ns_progression", Progression_ClientCommandSet )
			AddClientCommandCallback( "ns_resettitanaegis", Progression_ClientCommandResetTitanAegis )
			AddCallback_GameStateEnter( eGameState.Playing, Progression_OnPlaying )
		#elseif CLIENT
			AddCallback_OnClientScriptInit( Progression_OnClientScriptInit )
		#endif
	}

	bool function ProgressionEnabledForPlayer( entity player )
	{
		#if SERVER
			if ( player in file.progressionEnabled )
				return file.progressionEnabled[ player ]

			return false
		#else
			return GetConVarBool( "ns_progression_enabled" )
		#endif
	}

	#if SERVER
		void function Progression_OnPlaying()
		{
			#if !VANILLA
				SetUIVar( level, "penalizeDisconnect", false )
			#endif
		}

		void function Progression_OnClientDisconnected( entity player )
		{
			if ( player in file.progressionEnabled )
				delete file.progressionEnabled[ player ]
		}

		bool function Progression_ClientCommandSet( entity player, array<string> args )
		{
			if ( args.len() != 1 )
				return false
			if ( args[ 0 ] != "0" && args[ 0 ] != "1" )
				return false

			file.progressionEnabled[ player ] <- args[ 0 ] == "1"
			return true
		}

		bool function Progression_ClientCommandResetTitanAegis( entity player, array<string> args )
		{
			if ( !args.len() )
				return false

			string titanRef = args[ 0 ].tolower()
			if ( !PersistenceEnumValueIsValid( "titanClasses", titanRef ) )
				return false

			int suitIndex = PersistenceGetEnumIndexForItemName( "titanClasses", titanRef )
			player.SetPersistentVar( "titanFDUnlockPoints[" + suitIndex + "]", 0 )
			player.SetPersistentVar( "previousFDUnlockPoints[" + suitIndex + "]", 0 )
			player.SetPersistentVar( "fdTitanXP[" + suitIndex + "]", 0 )
			player.SetPersistentVar( "fdPreviousTitanXP[" + suitIndex + "]", 0 )
			RecalculateHighestTitanFDLevel( player )
			return true
		}
	#endif

	#if CLIENT
		void function Progression_OnClientScriptInit( entity player )
		{
			if ( player != GetLocalClientPlayer() )
				return

			Progression_SetPreference( GetConVarBool( "ns_progression_enabled" ) )
			UpdateCachedLoadouts_Delayed()
		}
	#endif

	#if CLIENT || UI
		void function Progression_SetPreference( bool enabled )
		{
			SetConVarBool( "ns_progression_enabled", enabled )

			#if !VANILLA
				#if CLIENT
					GetLocalClientPlayer().ClientCommand( "ns_progression " + enabled.tointeger() )
				#else
					ClientCommand( "ns_progression " + enabled.tointeger() )
				#endif
			#endif
		}

		bool function Progression_GetPreference()
		{
			if ( NSIsVanilla() )
				return true

			return GetConVarBool( "ns_progression_enabled" )
		}

		void function UpdateCachedLoadouts_Delayed()
		{
			if ( file.isUpdatingCachedLoadouts )
				return

			file.isUpdatingCachedLoadouts = true

			#if UI
				RunClientScript( "UpdateCachedLoadouts_Delayed" )
			#else
				RunUIScript( "UpdateCachedLoadouts_Delayed" )
			#endif

			thread Progression_UpdateCachedLoadoutsThreaded()
		}

		void function Progression_UpdateCachedLoadoutsThreaded()
		{
			wait 1.0
			UpdateCachedLoadouts()

			#if UI
				entity uiPlayer = GetUIPlayer()
				if ( IsValid( uiPlayer ) )
				{
					uiGlobal.pilotSpawnLoadoutIndex = GetPersistentSpawnLoadoutIndex( uiPlayer, "pilot" )
					uiGlobal.titanSpawnLoadoutIndex = GetPersistentSpawnLoadoutIndex( uiPlayer, "titan" )
				}
			#else
				entity player = GetLocalClientPlayer()
				if ( IsValid( player ) )
				{
					ClearAllTitanPreview( player )
					ClearAllPilotPreview( player )
					UpdateTitanModel( player, GetPersistentSpawnLoadoutIndex( player, "titan" ) )
					UpdatePilotModel( player, GetPersistentSpawnLoadoutIndex( player, "pilot" ) )
				}
			#endif

			file.isUpdatingCachedLoadouts = false
		}
	#endif
#endif
