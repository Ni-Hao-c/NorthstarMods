global function Sh_FriendlyFire_Init

void function Sh_FriendlyFire_Init()
{
    AddCallback_OnCustomGamemodesInit( FriendlyFire_Init )
}

void function FriendlyFire_Init()
{
    AddPrivateMatchModeSettingEnum( "Friendly Fire", "friendly_fire", [ "Disabled", "Enabled" ], "1" )
}