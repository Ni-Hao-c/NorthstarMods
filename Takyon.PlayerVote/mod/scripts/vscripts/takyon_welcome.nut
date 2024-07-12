global function WelcomeInit
global function ShowWelcomeMessage
global function ShowChatWelcomeMessage
global function OnPlayerSpawnedWelcome
global function OnPlayerDisconnectedWelcome

global bool welcomeEnabled = true
global array<string> welcomeSpawnedPlayers = []

// ADD YOUR FUCKING SERVER NAME IN mod.json I BEG YOU
string serverName = ""

//Add your discord server link or website in mod.json
string groupLink = "kaihei.co/wsZVnX"

// TODO maybe make convar
string welcomeMsg = ""
string welcomeMsgChat = ""

const string ANSI_COLOR_END = "\x1b[0m"
const string ANSI_COLOR_YELLOW = "\x1b[38;5;11m"
const string ANSI_COLOR_RED = "\x1b[38;5;196m"
const string ANSI_COLOR_BLUE = "\x1b[38;5;81m"
const string ANSI_COLOR_ORANGE = "\x1b[38;5;208m"

void function WelcomeInit(){
    // ConVar
    welcomeEnabled = GetConVarBool( "pv_welcome_enabled" )
    serverName = GetConVarString( "pv_servername" )

    if(GetConVarString( "pv_group" ) != "" && GetConVarString( "pv_group" ) != "YOUR QQGROUP NUM"){
        groupLink = GetConVarString("pv_group")
    }
    // change your welcome msg hered
    welcomeMsg =     "大改，可能会闪退！请见谅！！\n 你可以更换至尊皮肤来体验！"

    welcomeMsgChat = "如果你在本服务遇到问题："+ "\n"  +
                    ANSI_COLOR_YELLOW +"请在在北极星cn的频道@sl丶你丶好 反馈给我" + ANSI_COLOR_END + "\n" +
                    ANSI_COLOR_ORANGE + "您可以在聊天框用英语输入 !skip 投票跳过本次地图" + ANSI_COLOR_END
}

/*
 *  WELCOME MESSAGE LOGIC
 */

void function OnPlayerSpawnedWelcome(entity player){
    if(!mapsHaveBeenProposed && welcomeEnabled && welcomeSpawnedPlayers.find(player.GetPlayerName()) == -1){ // prioritizing the vote instead of showing help
        //ShowWelcomeMessage(player)
        welcomeSpawnedPlayers.append(player.GetPlayerName())
    }
}

void function OnPlayerDisconnectedWelcome(entity player){
    // remove player from list so on reconnect they get the message again
    while(welcomeSpawnedPlayers.find(player.GetPlayerName()) != -1){
        try{
            welcomeSpawnedPlayers.remove(welcomeSpawnedPlayers.find(player.GetPlayerName()))
        } catch(exception){} // idc abt error handling
    }
}

/*
 *  HELPER FUNCTIONS
 */

void function ShowWelcomeMessage(entity player){
    SendHudMessageBuilder(player, WelcomeMsgBuilder(welcomeMsg, player), 255, 255, 255) // Message that gets displayed on respawn
}

void function ShowChatWelcomeMessage( entity player )
{
    Chat_ServerPrivateMessage( player, WelcomeMsgBuilder( welcomeMsgChat, player ), false ) // message player on connection
}

string function WelcomeMsgBuilder(string msg, entity player){
    string playerName = "%playername%"
    string finMsg = StringReplace(msg, playerName, player.GetPlayerName())
    return finMsg
}