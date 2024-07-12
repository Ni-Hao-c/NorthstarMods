untyped
global function HugemapInit


float MinimapZoomScale = 3
float MinimapSizeScale = 4

bool isHuge = false;

table < string, float > zooms = {
	fd =  3.0
}

table < string, float > sizes = {
	fd = 1.5
}

void function HugemapInit(){
    thread Monitor()
}

void function Monitor(){
    WaitFrame()


	RegisterButtonPressedCallback( KEY_M, SwitchHugeMap )
	// RegisterButtonReleasedCallback( KEY_M, SetMinimapToDefault )
}

void function SetMinimapToDefault(entity player) {
	string gamemode = GameRules_GetGameMode();
	float zoom = 1.0;
	float size = 1.0;
	if (gamemode in zooms) {
		zoom = zooms[gamemode]
	}
	if (gamemode in sizes) {
		size = sizes[gamemode]
	}

	Minimap_SetZoomScale( zoom )
	Minimap_SetSizeScale( size )
	Minimap_DisableDraw()
	Minimap_EnableDraw()
}

void function SetHugeMap(entity player) {
	Minimap_SetZoomScale(  MinimapZoomScale )
	Minimap_SetSizeScale(  MinimapSizeScale )
	Minimap_DisableDraw()
	Minimap_EnableDraw()
}

void function SwitchHugeMap(entity player) {
	isHuge = !isHuge;
	if (isHuge) {
		SetHugeMap(player)
	}
	else
	{
		SetMinimapToDefault(player)
	}
}
