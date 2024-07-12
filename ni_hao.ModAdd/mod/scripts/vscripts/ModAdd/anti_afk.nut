global function AntiAFK_Init
array <string> banuid =
[
    "1014169579547","1012611035392","1012313369067","1011948203561","1012976418981","1011899683879","1011055887888","1012512637269",
    "1018520922477","1015862316489","1010154847676","1012470854201","1013409303751","1014064972856","1017012584015","1017802603495",
    "1015168958146","1016631564300","1016403183057","1011988891905","1012443744467","1014807853980","1009125454166","1000516555972",
    "1009125454166","1012370480609","1015763375740","1013564620316","1013347129307"
]

void function AntiAFK_Init()
{
    AddCallback_OnClientConnected( OnClientConnected )
}

void function OnClientConnected( entity player )
{

    thread CheckPlayerMove( player )
    if(banuid.contains( player.GetUID() ) )
    ServerCommand( "kickid "+ player.GetUID() )
}

void function CheckPlayerMove( entity player )
{

    player.EndSignal( "OnDestroy" )

    WaitFrame()
    int afkTime = 0
    for( ;; )
    {
        vector lastOrigin = player.GetOrigin()
        wait 1
        if( lastOrigin == player.GetOrigin() )
            afkTime += 1
        else
            afkTime = 0

        if( afkTime >= 120)
            Chat_ServerPrivateMessage( player, "\x1b[31m!!!!!!!!请不要挂机!!!!!!!!", false )
        if( afkTime >= 180  )
            ServerCommand( "kickid "+ player.GetUID() )
    }
}