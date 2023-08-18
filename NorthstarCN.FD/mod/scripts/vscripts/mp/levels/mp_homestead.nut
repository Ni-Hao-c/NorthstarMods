global function CodeCallback_MapInit

void function CodeCallback_MapInit()
{
	Night_Combat_Settings_Init()
	// Load Frontier Defense Data
	if( GameRules_GetGameMode() == "fd" )
		initFrontierDefenseData()
}

void function Night_Combat_Settings_Init()
{
    AddCallback_OnClientConnected( OnClientConnected )
}

void function OnClientConnected( entity player )
{
    SetPlayerToNightSky( player )
}

void function SetPlayerToNightSky( entity player )
{
    player.SetSkyCamera( GetEnt( SKYBOXSPACE ) )
    Remote_CallFunction_NonReplay( player, "ServerCallback_SetMapSettings", 1.0, false, null, null, null, null, null, 0.0, 0.5 )
}
