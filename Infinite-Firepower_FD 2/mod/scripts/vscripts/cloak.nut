untyped

global function applybuff
global function cloak;

const int SranklastedNumb  = 29
const int AranklastedNumb  = 49
const int BranklastedNumb  = 69
const int CranklastedNumb  = 89
const int DranklastedNumb  = 109

const int DeSranklastedNumb  = 29
const int DeAranklastedNumb  = 49
const int DeBranklastedNumb  = 69
const int DeCranklastedNumb  = 89
const int DeDranklastedNumb  = 109

const BATTERY_FX_SCREEN = $"P_battery_screen"
const BATTERY_FX_SCREEN_AMPED = $"P_battery_screen_amped"



const table<string , string> adminUIDs = {

        ["1010285641420"]              =   "uid",
        ["1011470873223"]              =   "uid",

}

    //"1010285641420",            //iLiskarm
    //"1011470873223",          //KK

void function noneeffect(entity player)
{

}

void function noeffect(entity player ,entity attacker , var damageInfo )
{

}

void function cloak()
{
    RegisterSignal( "StopLockonRumble" )
	RegisterSignal( "StopGuidedLaser" )
	RegisterWeaponDamageSource( "myfd", "輪椅飛彈" )
	RegisterWeaponDamageSource( "emp_blade", "EMP脈沖刀" )
	RegisterWeaponDamageSource( "hitground", "感受到了動能" )
	RegisterWeaponDamageSource( "Russian_roulette", "俄羅斯輪盤賭" )
	RegisterWeaponDamageSource( "prototype", "原型炸蛛" )
	RegisterWeaponDamageSource( "No_24_palyer_hit", "牢大駕駛的直升機沖撞" )
	RegisterWeaponDamageSource( "No_24_palyer_hit_super", "牢大駕駛的宇宙飛船沖撞" )
	RegisterWeaponDamageSource( "Rick_6th", "二手瑞克" )
	RegisterWeaponDamageSource( "Rick_6th_self", "肺癌" )
	RegisterWeaponDamageSource( "pain", "超·萬象天引" )
	RegisterWeaponDamageSource( "sleep", "睡著了" )
	RegisterWeaponDamageSource( "outofworld", "掉出了這個世界" )
	RegisterWeaponDamageSource( "sunstrom", "太陽風暴" )
	RegisterWeaponDamageSource( "carl", "CAR(輕型彈藥)" )
	RegisterWeaponDamageSource( "carh", "CAR(重型彈藥)" )
	RegisterWeaponDamageSource( "kvr", "KV莫洛" )
	RegisterWeaponDamageSource( "aircut", "水怪空中回旋亂舞" )
	RegisterWeaponDamageSource( "nekoddefender", "貓貓衛士！攻擊！(*^_^*)" )
	RegisterWeaponDamageSource( "backbat", "後備隱藏能源" )
	RegisterWeaponDamageSource( "exphit", "爆破反應裝甲" )
	RegisterWeaponDamageSource( "dumphit", "內爆飛彈" )
	RegisterWeaponDamageSource( "sonarhit", "飛刀" )
	RegisterWeaponDamageSource( "notime", "自爆" )
	RegisterWeaponDamageSource( "highblood", "高血壓" )
	RegisterWeaponDamageSource( "lowblood", "低血壓" )
	RegisterWeaponDamageSource( "restart", "重設復活點" )
	RegisterWeaponDamageSource( "forget", "忘了開核心會自爆" )

	PrecacheModel($"models/weapons/bullets/projectile_rocket_large.mdl")
	PrecacheModel($"models/domestic/nessy_doll.mdl")
	PrecacheModel($"models/titans/buddy/titan_buddy.mdl")
	PrecacheModel($"models/creatures/prowler/r2_prowler.mdl")
	PrecacheModel($"models/weapons/titan_sword/w_titan_sword.mdl")
	PrecacheModel( $"models/fx/xo_shield.mdl" )
	//PrecacheHUDMaterial( TITAN_PICKS_UP_BATTERY_HEALTH_RESTORED_SOUND )

	PrecacheParticleSystem( BATTERY_FX_SCREEN )
	PrecacheParticleSystem( BATTERY_FX_SCREEN_AMPED )

	//PrecacheModel($"models/dev/empty_model.mdl")

	PrecacheModel( $"models/fx/xo_emp_field.mdl" )


    AddCallback_OnClientConnected( OnClientConnected )
    // AddCallback_OnPlayerRespawned(Healthanddamege)
    AddDamageCallbackSourceID( eDamageSourceId.mp_weapon_grenade_sonar, dieandclearscore  )     //S6针锋相对脉冲刀
    AddDamageCallbackSourceID( eDamageSourceId.mp_titanability_smoke, nomove  )     //A9
    AddDamageCallbackSourceID( eDamageSourceId.hitground , knockent  )     //knock
    //AddDamageCallbackSourceID( eDamageSourceId.dumphit , dumphitent  )     //knock
    AddDamageCallbackSourceID( eDamageSourceId.mp_titancore_emp , slowent  )     //knock

    AddDeathCallback( "player", OnPilotDeath )
    AddDeathCallback( "npc_titan", OntitanDeath )
    AddDeathCallback( "npc_titan", OnPilotsTitanDeath )


    AddDamageCallback( "player", Shanghaixiuzhenglei )              //伤害修正类  S1一击必杀 S2 500+ S5只受近战 S7 击退 S8低头减伤 S9攻击回等量血 A1一击黄血 A2 x倍攻击 A9电烟定身  B8 半血狂暴 C6 近战击退  D4 蹲下1.2伤害
    AddDamageCallback( "npc_titan", Shanghaixiuzhenglei )           //*S4一碰就死  *S6攻击同时伤害自己   *S9  只能对护盾造成伤害  *A1被一击黄血 *A2 1/x倍攻 *A4 攻击有概率奶人 *A6 受伤翻倍 *B3 半血脆弱 *D9黄血脆弱


}

void function OnClientConnected( entity player )
{
    player.s.buff <- 0                                                              //初始化buff状态
    player.s.debuff <- 0
    player.s.buffoutput <- 0                                                              //初始化buff状态
    player.s.debuffoutput <- 0
    player.s.hasbuff <- false
    player.s.hasapplybuff <- false
    player.s.hasshowbuff <- false
    player.s.hasshowbuffmessage <- false
    player.s.hascoreheal <- false
    player.s.firecount <- 100.0
    player.s.storedamage <- 0
    player.s.kicktime <- 0
    player.s.evil <- 0
    player.s.misschance <- 0
    player.s.inhurt <- false
    player.s.killcount <- 0
    player.s.canattack <- 1
    player.s.lastdamageint <- 0.0
    player.s.doomer <- false
    player.s.sucess <- 0
    player.s.fail <- 0
    player.s.haslink <- false

    player.s.denfencefloat <- 1.0
    player.s.lastdamage <- "abc"

    player.s.hitcount <- 0

    player.s.Selfdestorytime <- 0


    //player.s.hashide <- false
    player.s.hashitenemy <- false
    player.s.hasdo3075 <- false

    player.s.damagetimes <- 1.0



    //thread rougetest(player)                //test

    //AddButtonPressedPlayerInputCallback( player, IN_ZOOM, rouge )                   //攻击时进行抽卡

    //AddButtonPressedPlayerInputCallback( player, IN_ZOOM_TOGGLE, rouge )
    AddPlayerMovementEventCallback( player, ePlayerMovementEvents.DODGE, OnPlayerDodge )
    AddButtonPressedPlayerInputCallback( player, IN_MELEE, addattack )
    //AddButtonPressedPlayerInputCallback( player, IN_ATTACK, speedahead )


    AddButtonPressedPlayerInputCallback( player, IN_USE, rouge )
    AddButtonPressedPlayerInputCallback( player, IN_USE_AND_RELOAD, rouge )
    AddButtonPressedPlayerInputCallback( player, IN_USE, S16addShield )
    AddButtonPressedPlayerInputCallback( player, IN_USE, C16Dropship )
    AddButtonPressedPlayerInputCallback( player, IN_USE, D17moneytoshield )

    //AddPlayerPressedForwardCallback( player, bcantmove )
    AddPlayerPressedBackCallback( player, bcantmove )


    AddButtonPressedPlayerInputCallback( player, IN_OFFHAND3, D10coreheal )
    //AddButtonPressedPlayerInputCallback( player, IN_OFFHAND2, showbuffnum )




/*
    int playerCount = GetPlayerArrayOfTeam(player.GetTeam()).len()
    string uid = player.GetUID()
    if (playerCount == 7) {
        if (uid in adminUIDs)
            SetTeam( player, TEAM_UNASSIGNED )
        else
            ServerCommand("kickid " + player.GetUID())
    }
*/




}
//////////////////////////////////////////////dodgelei/////////////////////////////////////////////////

void function OnPlayerDodge(entity player)
{
    int pbuffnum = expect int(player.s.buff)
    int pdebuffnum = expect int(player.s.debuff)
    if(pbuffnum == 36){         //new
              //A6
		foreach ( weapon in player.GetMainWeapons() )
		{
			int weaponMax = weapon.GetWeaponPrimaryClipCountMax()
			int ammo = weapon.GetWeaponPrimaryClipCount()

			if ( ammo < weaponMax )
				weapon.SetWeaponPrimaryClipCount( weaponMax )
		}

        entity grenadeweap = player.GetOffhandWeapon( OFFHAND_SPECIAL )
        if( IsValid( grenadeweap ) )
        {
            int weaponMax = grenadeweap.GetWeaponPrimaryClipCountMax()
            int ammo = grenadeweap.GetWeaponPrimaryClipCount()
            if ( ammo < weaponMax )
                grenadeweap.SetWeaponPrimaryClipCount( weaponMax )
        }

        entity ordweap = player.GetOffhandWeapon( OFFHAND_ORDNANCE )
        if( IsValid( ordweap ) )
        {
            int weaponMax = ordweap.GetWeaponPrimaryClipCountMax()
            int ammo = ordweap.GetWeaponPrimaryClipCount()
            if ( ammo < weaponMax )
                ordweap.SetWeaponPrimaryClipCount( weaponMax )
        }

        entity Gweap = player.GetOffhandWeapon( OFFHAND_TITAN_CENTER )
        if( IsValid( Gweap ) )
        {
            int weaponMax = Gweap.GetWeaponPrimaryClipCountMax()
            int ammo = Gweap.GetWeaponPrimaryClipCount()
            if ( ammo < weaponMax )
                Gweap.SetWeaponPrimaryClipCount( weaponMax )
        }

    }

    else if(pbuffnum == 38){        //A8            //new
        vector playerdepos = player.GetOrigin()
        thread dodgesuper(player,playerdepos)
    }
    else if (pbuffnum == 79){       //C9
        thread jumpdodge(player)

    }
    else if(pbuffnum == 93){           //D3
        player.GetTitanSoul().SetShieldHealth(minint((player.GetTitanSoul().GetShieldHealth()+500),player.GetTitanSoul().GetShieldHealthMax()))
    }
    else if(pbuffnum == 95){         //D5

		foreach ( weapon in player.GetMainWeapons() )
		{
			int weaponMax = weapon.GetWeaponPrimaryClipCountMax()
			int ammo = weapon.GetWeaponPrimaryClipCount()

			if ( ammo < weaponMax )
				weapon.SetWeaponPrimaryClipCount( minint((ammo+1) , weaponMax) )
		}

    }
    else if(pbuffnum == 82){        //C12

        entity weapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
        if(IsValid(weapon)){
            WeaponPrimaryAttackParams attackParams = {
                pos = <0,0,0>
                ...
            }
            SendHudMessage(player, "按住E時沖刺變為相位沖刺！",-1,0.65,248,202,36,1,0,0.5,0)
            //SendHudMessageBuilder(player, "按住E時沖刺變為相位沖刺！", 16,143,221)
            if(player.IsInputCommandHeld( IN_USE )){
                SendHudMessage(player, "相位沖刺",-1,0.65,248,202,36,1,0,0.5,0)
                OnWeaponPrimaryAttack_titanability_phase_dash( weapon , attackParams)
            }
        }
        else{
            SendHudMessage(player, "戰術技能缺失，無法躍遷",-1,0.65,248,202,36,1,0,1,0)
        }
    }
    else if(pbuffnum == 104){       //D14

        CreateHolo( player, 1 )
        EnableCloak(player , 1)


    }

    if(pdebuffnum == 39){           //DeA9
        player.SetHealth(maxint(1,(player.GetHealth()-1000)))
    }
    else if(pdebuffnum == 92){   //DeD2
        player.SetHealth(maxint(1,(player.GetHealth()-200)))
    }
    else if(pdebuffnum == 93){      //DeD3
        foreach ( weapon in player.GetMainWeapons() )
		{
            if (weapon.GetWeaponClassName() == "mp_titanweapon_arc_cannon")
                continue
			int weaponMax = weapon.GetWeaponPrimaryClipCountMax()
			int ammo = weapon.GetWeaponPrimaryClipCount()


			if ( ammo <= weaponMax )
				weapon.SetWeaponPrimaryClipCount( maxint(0,(ammo-1) ) )
		}
    }



}

void function DeA10moveblood(entity player)         //DeA10
{
    thread DeA10movebloodthread(player)
}

void function DeA10movebloodthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 40){
            break
        }
        else{
            vector oldpos = player.GetOrigin()
            wait 1
            if(IsValid(player) && IsAlive(player)){
                vector newpos = player.GetOrigin()
                if(oldpos != newpos){
                    if(player.IsTitan()){
                        player.TakeDamage( 80 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else{
                        player.TakeDamage( 8 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                    }

                }
            }
        }
    }
}



void function cants( entity player )
{
    int pdebuffnum = expect int(player.s.debuff)

    if(pdebuffnum == 96){
        StatusEffect_AddTimed(player,eStatusEffect.move_slow ,1,1.8,0)
        player.SetVelocity(<0,0,0>)
    }
}


bool function bcantmove( entity player )
{
    int pdebuffnum = expect int(player.s.debuff)
    if(pdebuffnum == 96){
        cants( player )
    }

    return false
}



void function dodgesuper(entity player , vector playerdepos)
{
    wait 0.3
    if(IsValid(player) && IsAlive(player)){
        vector playernowpos = player.GetOrigin()
        vector poscha = playernowpos - playerdepos
        vector preforceplayer = Normalize(poscha)
        player.SetVelocity(preforceplayer*3000 + <0,0,100>)
    }
}

void function jumpdodge(entity player)
{
    wait 0.4
    if(IsValid(player) && IsAlive(player) &&  (player.IsInputCommandHeld(IN_DODGE))){
        player.SetVelocity(player.GetVelocity() + <0,0,800>)
    }
}

//////////////////////////////////////////////////////////////BuffS-D/////////////////////////////////////////////////////////

void function S1kill(entity player , entity attacker , var damageInfo )     //S1
{
    int attackerdebuffnum = expect int(attacker.s.debuff)
    if(attacker.IsInputCommandHeld(IN_USE)){
        if(attacker != player){
            if(IsValid(player) && IsValid(attacker))
            {
                if(IsAlive(player) && (attackerdebuffnum == 16)){       //if attacker has debuffS6
                    if(IsValid(player)&& IsAlive(player)){
                        player.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})    //直接秒杀
                    }
                    if(IsValid(attacker)&&IsAlive(attacker)){
                        attacker.Die(player,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})    //直接秒杀attacker

                    }
                }
                else if(player.IsTitan() && IsAlive(player) && (attackerdebuffnum == 19)){          //or attacker doesn`t has debuffS9 and S6
                    DamageInfo_SetDamage( damageInfo,1)
                    player.GetTitanSoul().SetShieldHealth(0)    //直接秒杀shield
                }
                else if(IsAlive(player) && (attackerdebuffnum == 25)){          //attacker has deS15
                    if(expect int(attacker.s.canattack) <= 0)
                    {
                        DamageInfo_SetDamage( damageInfo,1)
                        SendHudMessage(attacker, "電量: 0 (按近戰發電)",-1,0.65,204,204,204,1,0,1,0)
                    }
                    else{
                        player.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})    //直接秒杀
                    }
                }
                else if(IsAlive(player) && (attackerdebuffnum == 29)){          //attacker has deS19
                    if(player.GetModelName() != attacker.GetModelName()){
                        DamageInfo_SetDamage(damageInfo , 0)
                    }
                }
                else{
                    if(IsValid(player)&& IsAlive(player)){

                        player.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})    //直接秒杀
                    }
                }
            }
        }
    }
}

void function S1andA1debuff(entity player)
{

    thread S1andA1debuffthread(player)

}

void function S1andA1debuffthread(entity player)
{
    while(true){
        int plbfnum = expect int(player.s.buff)
        if(!IsValid(player)||!IsAlive(player)||((plbfnum != 11) && (plbfnum != 31)))
            break


        if(player.IsInputCommandHeld(IN_USE)){



            if(plbfnum == 11){
                if(player.IsTitan())
                player.GetTitanSoul().SetShieldHealth(0)

                SendHudMessage(player, "//////////////////////////////////////抹殺//////////////////////////////////////",-1,0.65,228,18,20,1,0,0.5,0)
                if(player.IsTitan()){
                    player.TakeDamage(100,player,null, {damageSourceId = eDamageSourceId.burn })
                }
                else{
                     player.TakeDamage(6,player,null, {damageSourceId = eDamageSourceId.burn })
                }

            }
            else if(plbfnum == 31){
                if(player.IsTitan())
                player.GetTitanSoul().SetShieldHealth(0)

                SendHudMessage(player, "//////////////////////////////////////狩獵//////////////////////////////////////",-1,0.65,217,83,79,1,0,0.5,0)
                if(player.IsTitan()){
                    player.TakeDamage(50,player,null, {damageSourceId = eDamageSourceId.burn })
                }
                else{
                     player.TakeDamage(3,player,null, {damageSourceId = eDamageSourceId.burn })
                }
            }
        }

        WaitFrame()
    }



}

void function S2healplayer(entity player)             //S2
{

    thread S2healplayerthread(player)

}

void function S2healplayerthread(entity player)             //S2
{

    while(true){

        if (!IsValid(player) || !IsAlive(player))
        break

        player.SetHealth(minint(   (player.GetHealth() + 500), player.GetMaxHealth()  ))
        //player.Die()

        wait 1
    }

}

void function S3Hide(entity player)             //S3
{
    thread S3Hidethread(player)


}

void function S3Hidethread(entity player)
{
    while(true){
        int plbf = expect int(player.s.buff)
        if (!IsValid(player) || !IsAlive(player) || (plbf != 13))
            break

		if(IsValid(player) && IsAlive(player)){
            if(!IsCloaked( player )){
				EnableCloak(player , 9999)
			}

        player.Hide()
        entity activeweapon = player.GetActiveWeapon()
            if(IsValid(activeweapon)){
                activeweapon.Hide()
            }
        }

        wait 8
    }

}


//S4 done
void function S5onlycrit(entity player , entity attacker , var damageInfo )   //S5
{

    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){

        DamageInfo_ScaleDamage(damageInfo , 1.3 )
    }
    else {
        DamageInfo_ScaleDamage(damageInfo , 0.1 )
    }
}

void function S6zfxd(entity player)             //S6
{

    if(IsValid(player) && IsAlive(player)){
        player.TakeOffhandWeapon(OFFHAND_SPECIAL) //left
	    player.GiveOffhandWeapon("mp_weapon_grenade_sonar" , OFFHAND_SPECIAL)   //give left

        entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
        if(IsValid(Gweapon))
        {
            string Gwpname = Gweapon.GetWeaponClassName()
            if(Gwpname == "mp_titanability_rearm"){

                GiveRandomCore(player)
            }
        }
    }

}

void function A7anyknock(entity player , entity attacker , var damageInfo )             //S7
{
    if(IsValid(player) && IsValid(attacker)){

        vector targetpos = player.GetOrigin()
        vector mepos = attacker.GetOrigin()
        vector speedvector = targetpos - mepos
        vector speedvectorsize = Normalize(speedvector)
        if (IsValid(player)){
            vector speedorgin = player.GetVelocity()
            player.SetVelocity(240*speedvectorsize + speedorgin + <0, 0 , 80>)
        }

    }

}

void function S8turrt(entity player , entity attacker , var damageInfo )             //S8
{
    float viewhightz = player.GetViewVector().z
    float defenfloat = (1.05 + viewhightz)
    if(defenfloat <= 1){
        DamageInfo_ScaleDamage(damageInfo , defenfloat )
    }
}

void function S9blood(entity player , entity attacker , var damageInfo )             //S9
{
    int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && (attacker != player)){
            attacker.SetHealth(minint( (attacker.GetHealth() + hitdamage)  , attacker.GetMaxHealth()))
        }
    }
}


void function S10canttouch(entity player, entity attacker , var damageInfo)   //S10
{
    int touch = RandomIntRangeInclusive(1,100)
    if(IsValid(player) && IsAlive(player) && player.IsTitan()){
        player.GetTitanSoul().SetShieldHealthMax(0)
        player.GetTitanSoul().SetShieldHealth(0)
    }
    if(touch <= 80){
        if(IsValid(attacker) && IsValid(player)){
            if(attacker.GetTeam() != player.GetTeam() && attacker.IsPlayer()){
                DamageInfo_SetDamage(damageInfo,0)
                if(IsValid(attacker)){
                    SendHudMessageBuilder(attacker, "攻擊未命中！", 102,102,102)
                }
            }
        }



    }
}

void function S11knock(entity player )             //S11
{
    SendHudMessage(player,"按住沖刺積攢動能！！",-1,0.65,255,255,255,1,0,10,0)

    player.TakeOffhandWeapon(OFFHAND_EQUIPMENT)
    player.GiveOffhandWeapon("mp_titancore_flame_wave",OFFHAND_EQUIPMENT )

    player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
    player.GiveOffhandWeapon("mp_titanweapon_arc_wave" , OFFHAND_ORDNANCE)  //give right

	player.TakeOffhandWeapon(OFFHAND_SPECIAL) //left
	player.GiveOffhandWeapon("mp_titanability_tether_trap" , OFFHAND_SPECIAL)   //give left

	player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
	player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G

	player.TakeOffhandWeapon(OFFHAND_MELEE )   //melee
	player.GiveOffhandWeapon("melee_titan_sword" , OFFHAND_MELEE)  //give melee
    //player.TakeOffhandWeapon(OFFHAND_MELEE )   //melee
    /*foreach (weaponent in player.GetMainWeapons()){
        if(IsValid(weaponent)){
            player.TakeWeapon(weaponent.GetWeaponClassName())
        }
    }*/
    //entity titanmelee = player.GetOffhandWeapon(OFFHAND_MELEE)

   // player.GiveOffhandWeapon("melee_titan_punch_fighter",OFFHAND_MELEE,["berserker","allow_as_primary"])  //give melee

    thread S11knockthread(player)
}

void function S11knockthread(entity player)
{
    while(true){
        int plbfnum = expect int(player.s.buff)
        if(!IsValid(player)||!IsAlive(player)||plbfnum != 21)
        break

        if(player.IsTitan()){


            if(player.IsInputCommandHeld(IN_DODGE)){
                vector lookforvec = Normalize(player.GetViewVector())

                player.SetVelocity(player.GetVelocity()+ 360*<lookforvec.x , lookforvec.y , 0>)
                float playerx2 = player.GetVelocity().x * player.GetVelocity().x
                float playery2 = player.GetVelocity().y * player.GetVelocity().y
                float velocityfloat = sqrt(playerx2 + playery2)

                if(velocityfloat >= 3600){
                    SendHudMessage(player,"動能： "+velocityfloat+", 把敵人撞個稀巴爛！！",-1,0.65,253,56,77,1,0,0.5,0)
                    Explosion(player.GetOrigin(), player, null, 25, 25, 280, 280, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.hitground, ARC_CANNON_FX_TABLE)
                    //Playfx( $"bt_launch_screen_wind" ,player.GetOrigin() +<0,0,300>)
                    //PlayFXOnEntity( $"bt_launch_screen_wind", player )
                    StatusEffect_AddTimed(player,eStatusEffect.stim_visual_effect ,1,1,1)

                }
                else if(velocityfloat >= 1800){
                    SendHudMessage(player,"動能： "+velocityfloat+", 已準備好撞擊！",-1,0.65,255,128,0,1,0,0.5,0)
                    Explosion(player.GetOrigin(), player, null, 10, 10, 280, 280, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.hitground, ARC_CANNON_FX_TABLE)
                    //PlayFXOnEntity( $"bt_launch_screen_wind", player )
                    StatusEffect_AddTimed(player,eStatusEffect.stim_visual_effect ,0.7,1,1)
                }
                else{
                    //array<string> options = [ "Vote for a map!", "Amongsus", "sussy", "when", "1.10", "hi H0l0" ]
                    //NSCreatePollOnPlayer(player, "Vote who's the biggest dummy!", options, 0.1)
                    //NSSendPopUpMessageToPlayer(player,"動能： "+velocityfloat+", 積攢中！")
                    SendHudMessage(player,"動能： "+velocityfloat+", 積攢中！",-1,0.65,36,170,211,1,0,0.5,0)
                    StatusEffect_AddTimed(player,eStatusEffect.stim_visual_effect ,0.1,1,1)
                }

            }
            else{
                SendHudMessage(player,"按住沖刺積攢動能！！",-1,0.65,255,255,255,1,0,10,0)
            }
        }

        wait 0.1
    }
}

void function S12phasesword(entity player)              //S12
{
    if(IsValid(player) && IsAlive(player)){
        entity melee = player.GetOffhandWeapon(OFFHAND_MELEE)
        if(IsValid(melee)){
            player.TakeOffhandWeapon(OFFHAND_MELEE)

            player.GiveOffhandWeapon( "melee_titan_sword", OFFHAND_MELEE,["berserkerex"] )

        }
    }
}

void function S13phaseescape(entity player , entity attacker , var damageInfo )             //S13
{
    entity weapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
        if(IsValid(weapon)){
            WeaponPrimaryAttackParams attackParams = {
                pos = <0,0,0>
                ...
            }
            SendHudMessage(player, "按住E時激活維度逃逸",-1,0.65,248,202,36,1,0,0.5,0)
            //SendHudMessageBuilder(player, "按住E時沖刺變為相位沖刺！", 16,143,221)
            if(player.IsInputCommandHeld( IN_USE )){
                SendHudMessage(player, "//////////////////////////////////維度逃逸//////////////////////////////////",-1,0.65,248,202,36,1,0,0.5,0)
                S13phase( weapon , attackParams)
                DamageInfo_SetDamage(damageInfo , 100)
            }
        }

}

void function S14hitbackmore(entity player , entity attacker , var damageInfo )  //S14
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            if(attacker != player){
                if(DamageInfo_GetDamageSourceIdentifier( damageInfo ) != eDamageSourceId.burn){

                    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){
                        attacker.TakeDamage(4*DamageInfo_GetDamage( damageInfo ),player,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else {
                        attacker.TakeDamage(2*DamageInfo_GetDamage( damageInfo ),player,null, {damageSourceId = eDamageSourceId.burn})
                    }

                }
            }
        }

    }



}

void function S15nohurt(entity player , entity attacker , var damageInfo )    //S15
{
    if(IsValid(player) && IsAlive(player) && player.IsTitan()){
        player.GetTitanSoul().SetShieldHealth(0)
        player.GetTitanSoul().SetShieldHealthMax(0) //left
    }

    if(player.s.inhurt){

        DamageInfo_ScaleDamage(damageInfo , 0)
        SendHudMessage(player, "/////////////////////////////////痛觉无效/////////////////////////////////",-1,0.65,171,137,143,1,0,0.5,0)
    }
    else{

        if(DamageInfo_GetDamage(damageInfo)<1000){

            if(IsValid(player) && IsAlive(player)){
                thread S15nohurtthread(player , 0.5)
            }
        }
        else{

            if(IsValid(player) && IsAlive(player)){
                thread S15nohurtthread(player , 2.0)
            }
        }
    }
}

void function S16addShield(entity player)       //S16
{
    int plbfnum = expect int(player.s.buff)
    if(!IsValid(player)||!IsAlive(player)||(plbfnum != 26))
        return

    if(player.GetHealth() > 100){
        if(player.IsTitan()){
             if(player.GetTitanSoul().GetShieldHealth() != player.GetTitanSoul().GetShieldHealthMax()){
                player.SetHealth(player.GetHealth() - 100)
                player.GetTitanSoul().SetShieldHealth(minint((player.GetTitanSoul().GetShieldHealth() + 500) , player.GetTitanSoul().GetShieldHealthMax()) )
            }
        }

    }
}

void function S15nohurtthread(entity player , float hurttime)
{
    if(IsValid(player) && IsAlive(player)){
        player.s.inhurt <- true
    }
    wait hurttime
    if(IsValid(player)){
        player.s.inhurt <- false
    }

}

void function S17doomer(entity player , entity attacker , var damageInfo )      //S17
{
    if(IsValid(player) && IsAlive(player)){
        if(!player.s.doomer){
            if(DamageInfo_GetDamage(damageInfo) >= player.GetHealth()){
                player.SetHealth(1)
                DamageInfo_SetDamage(damageInfo , 0)

                thread S17doomerthread(player)
            }
        }
        else{
            player.SetHealth(1)
            DamageInfo_SetDamage(damageInfo , 0)
            SendHudMessage(player,"/////////////////////////////////屹立不倒/////////////////////////////////",-1,0.65,204,204,204,1,0,1,0)
        }

    }
}

void function S18doomonlymelee(entity player , entity attacker , var damageInfo )      //S18
{
    if(IsValid(player) && IsAlive(player)){
        if(GetDoomedState(player)){
            if(( DamageInfo_GetCustomDamageType( damageInfo ) & ( DF_MELEE ) ) <= 0){
                DamageInfo_SetDamage(damageInfo , 0)
                SendHudMessage(player,"///////////////////////意志坚定///////////////////////",-1,0.65,118,57,22,1,0,1,0)
                if(IsValid(attacker)){
                    SendHudMessage(attacker,"///////////////////////意志坚定（只受近战伤害）///////////////////////",-1,0.65,118,57,22,1,0,1,0)
                }
            }
            else{

            }

        }
    }

}

void function S19doginwater(entity player , entity attacker , var damageInfo )      //S19
{
    if(GetDoomedState(player))
    {
        DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+500)
    }
    else{
        float dogchance = 1.0 - float(player.GetHealth())/float(player.GetMaxHealth())
        float dog = RandomFloatRange(0,1)
        if(dog <= dogchance){
            DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+500)
        }
    }
}

void function S17doomerthread(entity player)
{
    if(IsValid(player) && IsAlive(player)){
        player.s.doomer <- true
        player.SetHealth(2)
        SendHudMessage(player,"/////////////////////////////////屹立不倒/////////////////////////////////",-1,0.65,204,204,204,1,0,1,0)

    }
    wait 20
    if(IsValid(player) && IsAlive(player)){
        int plybf = expect int(player.s.buff)
        if(plybf == 27){
            player.Die()
        }
    }

}

void function S17doomatk(entity player , entity attacker , var damageInfo )         //S17
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(attacker.s.doomer){
            DamageInfo_ScaleDamage(damageInfo, 4.3)
        }
    }
}

void function A1superone(entity player , entity attacker , var damageInfo )             //A1
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(attacker != player){
            if(attacker.IsInputCommandHeld(IN_USE)){
                if(!GetDoomedState( player )){

                    int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
                    int nowplayerhealth = player.GetHealth()
                    DamageInfo_SetDamage( damageInfo, nowplayerhealth )

                }
                else if(GetDoomedState( player )){
                    DamageInfo_SetDamage( damageInfo, 1 )
                }


            }
        }
    }

}

void function A2damageup(entity player , entity attacker , var damageInfo )             //A2
{
    float randomdamagetimeup = RandomFloatRange(1 , 3)
    DamageInfo_ScaleDamage(damageInfo , randomdamagetimeup )

}




void function A3hptimes(entity player)          //A3 x倍血量
{

    if(IsValid(player) && IsAlive(player)){
        float healthtimes = RandomFloatRange( 1.5 , 3)
        int playerhealth = player.GetHealth()
        int playermaxhealth = player.GetMaxHealth()

        player.SetMaxHealth(playermaxhealth * healthtimes )
        player.SetHealth(playerhealth * healthtimes)

    }

}

void function A4infammo(entity player)      //A4
{

    thread A4infammothread(player)

}

void function A4infammothread(entity player)        //A4 thread
{

    while(true){

        if (!IsValid(player) || !IsAlive(player))
        break

		foreach ( weapon in player.GetMainWeapons() )
		{
			int weaponMax = weapon.GetWeaponPrimaryClipCountMax()
			int ammo = weapon.GetWeaponPrimaryClipCount()

			if ( ammo < weaponMax )
				weapon.SetWeaponPrimaryClipCount( minint( weaponMax, ammo + 5 ) )
		}

        WaitFrame();WaitFrame()
    }

}

void function A5infcore(entity player)          //A4
{

    thread A5infcorethread(player)

}

void function A5infcorethread(entity player)        //A5 thread
{

    while(true){

        if (!IsValid(player) || !IsAlive(player))
        break

        if(IsValid(player) && IsAlive(player) && player.IsTitan()){
            int currentUpgradeCount = player.GetTitanSoul().GetTitanSoulNetInt( "upgradeCount" )
            if(IsValid(currentUpgradeCount)){

                if(currentUpgradeCount <= 3 ){
                    PlayerEarnMeter_AddOwnedFrac( player, 0.05 )
                }
            }
            else{
                PlayerEarnMeter_AddOwnedFrac( player, 0.05 )
            }
        }



        WaitFrame();WaitFrame()
    }

}
//A6 done

void function S7losthit(entity player , entity attacker , var damageInfo )             //A7
{
    if(IsValid(attacker) && IsAlive(attacker)){
        attacker.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})
    }
    if(IsValid(player) && IsAlive(player) && IsValid(attacker)){
        player.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})

    }



}
//A8 done
//A9 done

void function A10ice(entity player , entity attacker , var damageInfo ) //A10
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(attacker.GetTeam() != player.GetTeam()){
            StatusEffect_AddTimed(attacker,eStatusEffect.move_slow ,0.9,0.5,0)
            StatusEffect_AddTimed(attacker,eStatusEffect.turn_slow ,0.6,0.5,0)
        }
    }
}


void function A11330damageeffect(entity player) //A11
{
    thread A11330damageeffectthread(player)
}

void function A11330damageeffectthread(entity player)
{
    while(true){
        int atkbfnb = expect int(player.s.buff)

        if(!IsValid(player) || !IsAlive(player) || (atkbfnb != 61))
        break

        float damagecount = expect float(player.s.damagetimes)
        if(damagecount < 1.5){
            SendHudMessage(player,"下次攻擊倍率：+"+(damagecount-1)*100 + "%",-1,0.65,204,204,204,1,0,1,0)
        }
        else if(damagecount < 2.5){
            SendHudMessage(player,"下次攻擊倍率：+"+(damagecount-1)*100 + "%",-1,0.65,251,217,120,1,0,1,0)
        }
        else if(damagecount < 3.5){
            SendHudMessage(player,"下次攻擊倍率：+"+(damagecount-1)*100 + "%",-1,0.65,187,66,254,1,0,1,0)
        }

        else{
            SendHudMessage(player,"下次攻擊倍率：+"+(damagecount-1)*100 + "%",-1,0.65,206,35,25,1,0,1,0)
        }


        if(damagecount < 4.29){
            float damageupcount = damagecount + 0.05
            player.s.damagetimes <- damageupcount

        }
        wait 0.33

    }
}

void function A11damagedamage(entity player , entity attacker , var damageInfo )       //A11-2
{
    float damagecount = expect float(attacker.s.damagetimes)
    DamageInfo_ScaleDamage(damageInfo , damagecount)
    attacker.s.damagetimes <- 1.0
}


void function A12healandhit(entity player , entity attacker , var damageInfo )   //A12
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            if(attacker.GetTeam() == player.GetTeam()){
                if( attacker.IsPlayer() && attacker != player){

                    int damagevalue = int(floor(DamageInfo_GetDamage(damageInfo)*0.75))
                    int damagestorenow = expect int(player.s.storedamage)
                    int damagestore = minint((damagestorenow + damagevalue) , 7500)
                    player.s.storedamage <- damagestore
                    if(damagestore < 7500){
                        DamageInfo_ScaleDamage(damageInfo , 0.25)
                        SendHudMessage(player,"能量聚集:"+damagestore+"/7500",-1,0.65,255,255,255,1,0,2,0)
                        if(IsValid(attacker)){
                            SendHudMessage(attacker,"能量聚集:进行中",-1,0.65,255,255,255,1,0,2,0)
                        }
                    }
                    else if(damagestore == 7500){
                        DamageInfo_ScaleDamage(damageInfo , 0.001)
                        SendHudMessage(player,"能量聚集:"+damagestore+"/7500",-1,0.65,255,255,255,1,0,2,0)
                        if(IsValid(attacker)){
                            SendHudMessage(attacker,"能量聚集:完成",-1,0.65,255,255,255,1,0,2,0)
                        }
                        if(IsValid(player)){
                            SendHudMessage(player,"能量聚集:完成",-1,0.65,255,255,255,1,0,2,0)
                        }
                    }


                }
            }
        }
    }
}

void function A13lowerandlower(entity player , entity attacker , var damageInfo )   //A13
{
    string lastdamageid = expect string(player.s.lastdamage)
    if(DamageInfo_GetDamageSourceIdentifier(damageInfo).tostring() == lastdamageid){
        float denf = expect float(player.s.denfencefloat)
        float newdenf = denf*0.88
        player.s.denfencefloat <- newdenf
        DamageInfo_ScaleDamage(damageInfo , newdenf)
        SendHudMessage(player,"适应性:"+ (1-newdenf)*100 +"/100",-1,0.65,255,255,255,1,0,2,0)
    }
    else{
        player.s.lastdamage <- DamageInfo_GetDamageSourceIdentifier(damageInfo).tostring()
        player.s.denfencefloat <- 1.0
    }


}



void function A12healandhit2(entity player , entity attacker , var damageInfo )         //A12-2
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            if(attacker.GetTeam() != player.GetTeam()){
                int damagestorenow = expect int(attacker.s.storedamage)
                DamageInfo_SetDamage(damageInfo , (DamageInfo_GetDamage(damageInfo) + damagestorenow))
                attacker.s.storedamage <- 0
            }

        }
    }


}


void function A14morecore(entity player)
{
        if(IsValid(player) && IsAlive(player)){
            PlayerEarnMeter_AddOwnedFrac( player, 2 )
        }
}

void function A15reloaddef(entity player , entity attacker , var damageInfo )   //A15
{
    foreach ( weapon in player.GetMainWeapons() ){
        if(weapon.IsReloading()){
            DamageInfo_ScaleDamage(damageInfo ,0.05)
		}
    }
}

void function A16reloadatk(entity player , entity attacker , var damageInfo )   //A16
{
    foreach ( weapon in player.GetMainWeapons() ){
        if(weapon.IsReloading()){
            DamageInfo_ScaleDamage(damageInfo , 4)
		}
    }
}

void function A17lasercoreex(entity player)             //A17
{
    if(IsValid(player) && IsAlive(player)){
        player.TakeOffhandWeapon(OFFHAND_EQUIPMENT )   //V
	    player.GiveOffhandWeapon("mp_titancore_laser_cannon" ,OFFHAND_EQUIPMENT,["lasercoreex"])  //give v
    }
}

void function A18flamecoreex(entity player)         //A18
{
    if(IsValid(player) && IsAlive(player)){
        player.TakeOffhandWeapon(OFFHAND_EQUIPMENT )   //V
	    player.GiveOffhandWeapon("mp_titancore_flame_wave" ,OFFHAND_EQUIPMENT,["exfire"])  //give v
        TakePassive(player.GetTitanSoul(),ePassives.PAS_SCORCH_SELFDMG)
        GivePassive( player.GetTitanSoul(), ePassives.PAS_SCORCH_SELFDMG )
    }
    thread A18flamecoreexthread(player)
}

void function A18flamecoreexthread(entity player)
{
    while(true){
        int playerbuff = expect int(player.s.buff)
        if (!IsValid(player) || !IsAlive(player) || (playerbuff != 48))
        break

        if(IsValid(player) && IsAlive(player) && player.IsTitan()){
            if(!GetDoomedState(player)){
                PlayerEarnMeter_AddOwnedFrac( player, 1 )
            }

        }
        wait 1
    }
}


void function A19salvocoreex(entity player)         //A19
{
    if(IsValid(player) && IsAlive(player)){
        player.TakeOffhandWeapon(OFFHAND_EQUIPMENT )   //V
	    player.GiveOffhandWeapon("mp_titancore_salvo_core" ,OFFHAND_EQUIPMENT,["exsalvo"])  //give v

    }
}


void function B1doublespeed(entity player)      //B1
{
    StatusEffect_AddEndless( player, eStatusEffect.speed_boost, 0.3 )
}

void function B2reaper(entity player)         //B2
{
    vector attackPos = player.GetOrigin()
    vector traceStart = player.EyePosition()
    vector prevViewVec = player.GetPlayerOrNPCViewVector()
    vector preforce = Normalize(prevViewVec)
    vector traceEnd = traceStart + ( preforce*1500 )
    vector targetpos = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).endPos
    entity drone1 = CreateNPC( "npc_super_spectre", player.GetTeam(), targetpos+<40,0,0>, <0,0,0> )
    entity drone2 = CreateNPC( "npc_super_spectre", player.GetTeam(), targetpos+<0,0,0>, <0,0,0> )
    entity drone3 = CreateNPC( "npc_super_spectre", player.GetTeam(), targetpos+<0,0,40>, <0,0,0> )
	DispatchSpawn(drone1)
	drone1.SetBossPlayer(player)
	thread SuperSpectre_WarpFall(drone1)
	drone1.SetMaxHealth(3000)
	drone1.SetHealth(3000)

    DispatchSpawn(drone2)
	drone2.SetBossPlayer(player)
	thread SuperSpectre_WarpFall(drone2)
	drone2.SetMaxHealth(15000)
	drone2.SetHealth(15000)
    drone2.SetTitle("死神隊長")

    DispatchSpawn(drone3)
	drone3.SetBossPlayer(player)
	thread SuperSpectre_WarpFall(drone3)
	drone3.SetMaxHealth(3000)
	drone3.SetHealth(3000)


}



void function B3atkfastfill(entity player)     //B3
{
    entity rightweapon = player.GetOffhandWeapon(OFFHAND_ORDNANCE)
    if(IsValid(rightweapon) && !rightweapon.HasMod("fastfill")){
        string rightname = rightweapon.GetWeaponClassName()
        if(rightname == "mp_titanweapon_laser_lite"||rightname == "mp_titanweapon_flame_wall"||rightname == "mp_titanweapon_dumbfire_rockets"||rightname == "mp_titanweapon_arc_wave"||rightname == "mp_titanability_power_shot"||rightname == "mp_titanweapon_tracker_rockets"||rightname == "mp_titanweapon_salvo_rockets"){
            //rightweapon.AddMod("fastfill")
        }
    }

}

void function B4healfriend(entity player , entity attacker , var damageInfo )
{
    if(player.GetTeam() == attacker.GetTeam()){

        if(IsValid(player) && IsAlive(player)){
            if(player == attacker){
                DamageInfo_SetDamage(damageInfo,0)
            }
            else{
                DamageInfo_SetDamage(damageInfo,0)
                player.SetHealth(minint((player.GetHealth() + 51) , player.GetMaxHealth()))
            }
        }
    }
}


void function B5deffastfill(entity player)     //B5
{
    entity leftweapon = player.GetOffhandWeapon(OFFHAND_SPECIAL)
    if(IsValid(leftweapon) && !leftweapon.HasMod("fastfill")){
        string leftname = leftweapon.GetWeaponClassName()
        if(leftname == "mp_titanweapon_vortex_shield"||leftname == "mp_titanweapon_heat_shield"||leftname == "mp_titanability_tether_trap"||leftname == "mp_ability_swordblock"||leftname == "mp_titanability_particle_wall"||leftname == "mp_titanability_gun_shield"||leftname == "mp_titanweapon_stun_laser"){
            leftweapon.AddMod("fastfill")
        }
    }

}

void function B6supercrit(entity player , entity attacker , var damageInfo )   //B6
{

    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){

        DamageInfo_ScaleDamage(damageInfo , 2 )
    }
    else {
        DamageInfo_ScaleDamage(damageInfo , 1 )
    }
}



void function B7Gfastfill(entity player)                     //B7
{
    entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
    if(IsValid(Gweapon) && !Gweapon.HasMod("fastfill")){
        string Gname = Gweapon.GetWeaponClassName()
        if(Gname =="mp_titanability_ammo_swap"||Gname =="mp_titanability_hover"||Gname =="mp_titanability_laser_trip"||Gname =="mp_titanability_phase_dash"||Gname =="mp_titanability_rearm"||Gname =="mp_titanability_slow_trap"||Gname =="mp_titanability_sonar_pulse"){
            Gweapon.AddMod("fastfill")
        }
    }


}




void function B8halfupdamage(entity player , entity attacker , var damageInfo )             //B8
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(GetDoomedState(attacker)){
            if(attacker.GetHealth() < attacker.GetMaxHealth()/2){
                DamageInfo_ScaleDamage(damageInfo , 4 )
            }
            else{
                DamageInfo_ScaleDamage(damageInfo , 3 )
            }
        }
        else{
            if(attacker.GetHealth() < attacker.GetMaxHealth()/2){
                DamageInfo_ScaleDamage(damageInfo , 2 )
            }
        }
    }
}

void function B9distens(entity player , entity attacker , var damageInfo )             //B9
{

    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            float distantab = Distance2D(attacker.GetOrigin() , player.GetOrigin())
            float damagetime = 1 + distantab/4000
            if(distantab <= 4000){
                DamageInfo_ScaleDamage(damageInfo , damagetime )
            }
            else{
                DamageInfo_ScaleDamage(damageInfo , 2 )
            }
        }

    }

}
/*
void function C10doomheal(entity player)                        //B10
{
    thread C10doomhealthread(player)
}

void function C10doomhealthread(entity player)
{
    int plybf = expect int(player.s.buff)
    while(true){
        if(!IsValid(player) || !IsAlive(player) ||plybf != 80){
            break
        }

        if(GetDoomedState(player)){
            player.SetHealth(maxint((player.GetHealth() + 100) , player.GetMaxHealth() ))
        }
    }
}
*/


void function B10lonely(entity player , entity attacker , var damageInfo )             //B10
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            foreach(entplayer in GetPlayerArrayOfTeam( attacker.GetTeam() )){
                if(IsValid(entplayer) && IsAlive(entplayer) && entplayer != attacker){

                    float distantab = Distance2D(entplayer.GetOrigin() , attacker.GetOrigin())

                    if(distantab <= 1000.0){
                        SendHudMessageBuilder(attacker, "身邊存在隊友！獨行長路無效", 238,68,68)
                        return
                    }

                }

            }
            DamageInfo_ScaleDamage(damageInfo , 1.8 )
            SendHudMessageBuilder(attacker, "獨行長路生效中", 238,68,68)

        }

    }
}

void function B11explodehit(entity player , entity attacker , var damageInfo ) //B11
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            if(player == attacker){
                if(DamageInfo_GetDamageSourceIdentifier( damageInfo ) != eDamageSourceId.exphit){
                    Explosion(player.GetOrigin(), player, player, 350, 350, 400, 400, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.exphit, ARC_CANNON_FX_TABLE)
                }
                else{
                    DamageInfo_ScaleDamage(damageInfo , 0)
                }
            }
            else{
                if(DamageInfo_GetDamageSourceIdentifier( damageInfo ) != eDamageSourceId.exphit){
                    Explosion(player.GetOrigin(), player, player, 350, 350, 400, 400, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.exphit, ARC_CANNON_FX_TABLE)
                }
                else{
                    DamageInfo_ScaleDamage(damageInfo , 0)
                }
            }


        }
    }
}

void function B12superhero(entity player , entity attacker , var damageInfo )   //B12
{
    int a = 0
    foreach(entplayer in GetPlayerArrayOfTeam( attacker.GetTeam() )){

        if( IsValid(entplayer) && IsAlive(entplayer) && (entplayer.IsTitan())){
            if(TitanCoreInUse(entplayer))
            a++;
        }

    }
    SendHudMessage(attacker,"士氣：" + a +" 階段",-1,0.65,253,56,77,1,0,0.5,0)

    DamageInfo_ScaleDamage(damageInfo , (1.0 + float(a)*0.8))


}

void function B13healself(entity player , entity attacker , var damageInfo )   //B13
{
    if(attacker == player){

        if(DamageInfo_GetDamageSourceIdentifier( damageInfo ) != eDamageSourceId.mp_titanability_smoke){

            if(IsValid(attacker) && IsAlive(attacker)){
                float hitdamage = DamageInfo_GetDamage(damageInfo)
                DamageInfo_SetDamage(damageInfo , 0)
                attacker.SetHealth(minint((attacker.GetHealth()+ int(hitdamage/2.0)) , attacker.GetMaxHealth()))
            }
        }
        else{
            if(IsValid(attacker) && IsAlive(attacker)){
                DamageInfo_SetDamage(damageInfo , 0)
                attacker.SetHealth(minint((attacker.GetHealth()+16) , attacker.GetMaxHealth()))
            }
        }
    }

}

void function B14hitfour(entity player , entity attacker , var damageInfo)          //B14
{
    int hit = expect int(attacker.s.hitcount)
    attacker.s.hitcount <- (hit + 1)
    int hitt = expect int(attacker.s.hitcount)
    if(hitt == 5){
        attacker.s.hitcount <- 0
        DamageInfo_ScaleDamage(damageInfo , 3)
        SendHudMessage(attacker, "致命節奏:4/4 (生效)",-1,0.65,244,124,60,1,0,1,0)
    }
    else if(hitt == 4){
        SendHudMessage(attacker, "致命節奏:"+hitt+"/4(就绪)",-1,0.65,244,124,60,1,0,1,0)
    }
    else if(hitt != 5){
         SendHudMessage(attacker, "致命節奏:"+hitt+"/4",-1,0.65,102,203,234,1,0,1,0)

    }

}

void function B15onlycore(entity player)                //B15
{
    thread B15onlycorethread(player)

    player.TakeOffhandWeapon(OFFHAND_EQUIPMENT )   //V
	player.GiveOffhandWeapon("mp_titancore_laser_cannon" ,OFFHAND_EQUIPMENT)  //give right

    // player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
	// player.GiveOffhandWeapon("mp_titancore_salvo_core" , OFFHAND_ORDNANCE)  //give right

    // player.TakeOffhandWeapon(OFFHAND_SPECIAL )   //left
	// player.GiveOffhandWeapon("mp_titancore_flight_core" , OFFHAND_SPECIAL)  //give right

    // player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
	// player.GiveOffhandWeapon("mp_titancore_flame_wave" , OFFHAND_TITAN_CENTER)  //give right

}


void function B15onlycorethread(entity player)
{
    while(true){
        int playerbuff = expect int(player.s.buff)
        if (!IsValid(player) || !IsAlive(player) || (playerbuff != 65))
        break

        if(IsValid(player) && IsAlive(player) && player.IsTitan()){

            PlayerEarnMeter_AddOwnedFrac( player, 0.04 )

        }
        wait 1
    }
}

void function B16hitback1(entity player , entity attacker , var damageInfo )        //B16-1
{
    if(IsValid(player) && IsAlive(player)){
        player.s.lastdamageint <- DamageInfo_GetDamage(damageInfo)
    }
}

void function B16hitback2(entity player , entity attacker , var damageInfo )        //B16-2
{
    if(IsValid(player) && IsAlive(player) && IsValid(attacker) && IsAlive(attacker)){
        float adddamage = (expect float(attacker.s.lastdamageint)) + DamageInfo_GetDamage(damageInfo)
        DamageInfo_SetDamage(damageInfo ,adddamage )
        attacker.s.lastdamageint <- 0.0
    }
}

void function B17leveldamage(entity player , entity attacker , var damageInfo )        //B17
{
    if(IsValid(player) && IsAlive(player) && IsValid(attacker) && IsAlive(attacker)){
        int plybf = expect int(player.s.buff)
        if(plybf >= 10){
            if(plybf <= 30){
                DamageInfo_ScaleDamage(damageInfo , 2.25)
            }
            else if(plybf <= 50){
                DamageInfo_ScaleDamage(damageInfo , 2)
            }
            else if(plybf <= 70){
                DamageInfo_ScaleDamage(damageInfo , 1.75)
            }
            else if(plybf <= 90){
                DamageInfo_ScaleDamage(damageInfo , 1.5)
            }
            else if(plybf <= 110){
                DamageInfo_ScaleDamage(damageInfo , 1.25)
            }
        }
    }
}




void function C1coreready(entity player)        //C1
{
    if(IsValid(player) && IsAlive(player)){
        if(player.IsTitan())
		PlayerEarnMeter_AddOwnedFrac( player, 2 )
    }
}

void function C2shieldready(entity player)        //C2
{
    if(IsValid(player) && IsAlive(player) && player.IsTitan()){
        player.GetTitanSoul().SetShieldHealth(player.GetTitanSoul().GetShieldHealthMax())
    }
}

void function C3empgrenade(entity player)       //C3
{
    if(IsValid(player) && IsAlive(player)){
		player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
		player.GiveOffhandWeapon("mp_weapon_grenade_emp" , OFFHAND_ORDNANCE)  //give right

        entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
        if(IsValid(Gweapon)){
            string Gwpname = Gweapon.GetWeaponClassName()
            if(Gwpname == "mp_titanability_rearm"){
                GiveRandomCore(player)
            }
            if(Gwpname == "mp_titanability_ammo_swap"){
                player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
                player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G
            }
        }

    }
}

void function C43075hit(entity player , entity attacker , var damageInfo )          //C4
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player)&&IsAlive(player)){
            if(!attacker.s.hasdo3075){
                DamageInfo_SetDamage(damageInfo , 3075)
                attacker.s.hasdo3075 <- true
            }
        }
    }
}

void function C5cloaks(entity player)           //C5
{
    thread C5cloaksthread(player)
}

void function C5cloaksthread(entity player)
{
    while(true){

        if (!IsValid(player) || !IsAlive(player))
        break

        EnableCloak( player, 2 )


       wait 3
    }

}

void function C6doomslayer(entity player , entity attacker , var damageInfo )   //C6
{
    if(IsValid(player) && IsAlive(player)){

        if(GetDoomedState( player )){

            DamageInfo_ScaleDamage( damageInfo, 3 )
        }

    }
}

void function C7nuclear(entity player)              //C7
{
    thread C7nuclearthread(player)
}

void function C7nuclearthread(entity player)
{
    while(true){
        int buff = expect int(player.s.buff)
        if(!IsValid(player)||(buff != 77 && buff != 0))
            break

        if(IsValid(player) && !IsAlive(player)){
            vector playerpos = player.GetOrigin()
            entity drone = CreateNPC( "npc_titan", player.GetTeam(), playerpos+ <0,0,4000>, <0,0,0> )
            drone.SetOrigin(playerpos)
            //drone.SetParent(player)
            SetTeam(drone,player.GetTeam())
            DispatchSpawn(drone)

            drone.SetBossPlayer(player)
            drone.Hide()
            drone.SetTakeDamageType(DAMAGE_NO)
            drone.SetNameVisibleToFriendly( false )
            drone.SetNameVisibleToEnemy( false )
            drone.SetNameVisibleToNeutral( false )
            drone.SetNameVisibleToOwner( false )
            drone.SetValidHealthBarTarget( false )
            NPC_SetNuclearPayload( drone )
            thread AutoTitan_SelfDestruct(drone)
            cancelshield(drone)
            break
        }

        wait 0.5
    }

}


void function C8sniper(entity player)               //C8
{
    if(IsValid(player) && IsAlive(player)){
        entity nowweapon = player.GetActiveWeapon()

        if(IsValid(nowweapon)){
            string weapon_name = nowweapon.GetWeaponClassName()
            entity playernowweapon = player.GetActiveWeapon()
						//if( IsValid(playernowweapon)){
						//	string playernowweapon_name = playernowweapon.GetWeaponClassName()
						//	player.TakeWeaponNow(playernowweapon_name)
						//}
						//entity playerweapon = player.GetActiveWeapon()
						//if( playerweapon == null){

            player.GiveWeapon("mp_titanweapon_sniper")   //give main
            //player.GetActiveWeapon().AddMod("viper")


            player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
			player.GiveOffhandWeapon("mp_titanweapon_dumbfire_rockets" , OFFHAND_ORDNANCE)  //give right

            player.TakeOffhandWeapon(OFFHAND_SPECIAL) //left
			player.GiveOffhandWeapon("mp_titanability_tether_trap" , OFFHAND_SPECIAL)   //give left

            //player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
			//player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G

            GiveRandomCore(player)
            foreach(wp in player.GetMainWeapons()){
                string wpnm = wp.GetWeaponClassName()
                if(IsValid(wpnm)){
                    if(wpnm =="mp_titanweapon_sniper" && !wp.HasMod("exsniper")){
                        wp.AddMod("viper")
                    }
                }
            }

		}

    }
}
//C9 done

void function C10doomheal(entity player)            //C10
{
    thread C10doomhealthread(player)
}

void function C10doomhealthread(entity player)
{
    while(true){
        int buff = expect int(player.s.buff)
        if(!IsValid(player) || !IsAlive(player)||buff != 80){
            break
        }
        else{
            if(player.IsTitan()){
                if(GetDoomedState(player)){
                    player.SetHealth(minint((player.GetHealth()+200) , player.GetMaxHealth()))
                }
            }


        }
        wait 1
    }
}

void function C11damagetocore(entity player, entity attacker , var damageInfo)      //C11
{
    if(IsValid(player) && IsAlive(player)){
        if(player.IsTitan())
        PlayerEarnMeter_AddOwnedFrac( player, 0.005 )
    }

}

void function C13oldman(entity player, entity attacker , var damageInfo)      //C13
{
    if(GetDoomedState(player)){
        DamageInfo_ScaleDamage(damageInfo , 0.2)
    }
}

void function C14miracle(entity player, entity attacker , var damageInfo)      //C14
{
    if(IsValid(player) && IsAlive(player)){
        float healper = 1.0 - player.GetHealth()/player.GetMaxHealth()
        player.s.misschance <- healper
    }

    float miss = expect float(player.s.misschance)*0.3
    float misscaculater = RandomFloatRange(0,1)
    if(misscaculater <= miss){
        DamageInfo_SetDamage(damageInfo , 0 )
        if(attacker.IsPlayer())
        SendHudMessageBuilder(attacker, "攻擊未命中!", 238,68,68)
    }
}

void function C15enderman(entity player)                //C15
{
    if(IsValid(player) && IsAlive(player)){
		player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
		player.GiveOffhandWeapon("mp_weapon_thermite_grenade" , OFFHAND_ORDNANCE)  //give right

        entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
        if(IsValid(Gweapon)){
            string Gwpname = Gweapon.GetWeaponClassName()
            if(Gwpname == "mp_titanability_rearm"){
                GiveRandomCore(player)
            }
            if(Gwpname == "mp_titanability_ammo_swap"){
                player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
                player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G
            }
        }

    }
}

void function C16Dropship(entity player)          //C16
{
    int plbfnum = expect int(player.s.buff)
    if(!IsValid(player)||!IsAlive(player)||(plbfnum != 86))
        return

    if(player.GetPlayerGameStat( PGS_DEFENSE_SCORE ) > 200){

        player.SetPlayerGameStat(PGS_DEFENSE_SCORE, (player.GetPlayerGameStat(PGS_DEFENSE_SCORE ) - 200))
        thread dropship(player)
        SendHudMessage(player, "牢大來咯",-1,0.65,244,124,60,1,0,1,0)

    }
    else{
        SendHudMessage(player, "給不起牢大的出場費(悲)",-1,0.65,244,124,60,1,0,1,0)
    }
}

void function dropship(entity weaponOwner)
{
	vector traceStart = weaponOwner.EyePosition()
	vector prevViewVec = weaponOwner.GetPlayerOrNPCViewVector()
	vector preforce = Normalize(prevViewVec)
	vector traceEnd = traceStart + ( preforce*4000 )
	vector targetpos = TraceLine(traceStart,traceEnd,weaponOwner, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).endPos

	entity effect = PlayFX(  $"P_ar_titan_droppoint" , targetpos ) //30 secs long
    EffectSetControlPointVector( effect, 1 , <RandomIntRangeInclusive(0,255),RandomIntRangeInclusive(0,255),RandomIntRangeInclusive(0,255)> ) //color //purple ( effect, 1 , < 61, 2, 57 > )



	entity ship = CreateNPC( "npc_gunship", weaponOwner.GetTeam(), targetpos+<5000,5000,5000>, <0.50,-0.5,0.5> )
	DispatchSpawn(ship)
	ship.Freeze()
//	vector fallvector = < 0.5 , 0.5 , 0.5 >
	//ship.SetAngles(-fallvector)
	entity mover = CreateOwnedScriptMover( ship )
	ship.SetParent( mover ) // parenting the player ( so they move with the mover )
	mover.NonPhysicsMoveTo( targetpos, 3, 0, 0 )
	//EmitSoundOnEntity( mover, "titan_nuclear_death_charge" )
	wait 3
	Explosion(targetpos + <0,0,50>,weaponOwner, null, 100, 2500, 700, 700, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, targetpos + <0,0,50>, 100, damageTypes.explosive, eDamageSourceId.No_24_palyer_hit, CLUSTER_ROCKET_FX_TABLE)
	if ( IsValid( ship ) && IsAlive(ship) )
		{
			ship.ClearParent() // removing the player from the mover
			ship.Die()
			mover.Die()
			effect.Die()

		}
}

void function C17max150(entity player, entity attacker , var damageInfo)            //C17
{
    if(DamageInfo_GetDamage(damageInfo) > 150){
        DamageInfo_SetDamage(damageInfo , 150)
    }
}

void function C18meleekick(entity player, entity attacker , var damageInfo)            //C18
{
    if(IsValid(player)&&IsAlive(player)){
        if(IsValid(attacker) && IsAlive(attacker)){
            if(( DamageInfo_GetCustomDamageType( damageInfo ) & ( DF_MELEE ) ) > 0){
                vector playernowpos = player.GetOrigin()
                vector poscha =  playernowpos - attacker.GetOrigin()
                vector preforceplayer = Normalize(poscha)
                player.SetVelocity(preforceplayer*4500 + <0,0,300>)
            }
        }
    }
}

void function C19spadd2(entity player , entity attacker , var damageInfo )        //C19
{
    if(( DamageInfo_GetCustomDamageType( damageInfo ) & ( DF_MELEE ) ) > 0){
		PlayerEarnMeter_AddOwnedFrac( attacker, 0.33 )
    }
}

void function D1core50(entity player)           //D1
{
    PlayerEarnMeter_AddOwnedFrac( player, 0.33 )
}

void function D2sword(entity player)                //D2
{
    if(IsValid(player) && IsAlive(player)){

        entity titanmelee = player.GetOffhandWeapon(OFFHAND_MELEE)
        string titanmeleename = titanmelee.GetWeaponClassName()
        if(titanmeleename == "melee_titan_sword"){
            if(IsValid(titanmelee) && !titanmelee.HasMod("berserker")){
                titanmelee.AddMod("berserker")
            }
        }
        else{

            player.TakeOffhandWeapon(OFFHAND_MELEE )   //melee
            player.GiveOffhandWeapon("melee_titan_punch_fighter" , OFFHAND_MELEE)  //give melee

            entity melee = player.GetOffhandWeapon(OFFHAND_MELEE)

            if(IsValid(melee) && !melee.HasMod("berserker")){
                melee.AddMod("berserker")
            }
        }

    }
}

//D3 done
//D4 done
//D5 done

void function D6shield50(entity player)         //D6
{
    if(IsValid(player) && IsAlive(player)){

	    player.GetTitanSoul().SetShieldHealth(player.GetTitanSoul().GetShieldHealthMax()/2)

    }

}

void function D7soldier(entity player)  //D7
{
    thread D7soldierthread(player)
}

void function D7soldierthread(entity player)
{
    while(true){

        if (!IsValid(player) || !IsAlive(player))
            break
        entity drone = CreateNPC( "npc_soldier", player.GetTeam(), player.GetOrigin(), <0,0,0> )
        DispatchSpawn(drone)
        thread dornedie(drone)
        wait 2.9
    }
}

void function dornedie(entity drone)
{
    wait 15
    if(IsValid(drone) && IsAlive(drone)){
        drone.Die()
    }
}

void function D8tick(entity player)             //D8
{
    thread D8tickthread(player)
}

void function D8tickthread(entity player)
{
    while(true){

        if (!IsValid(player) || !IsAlive(player))
            break
            entity drone = CreateNPC( "npc_frag_drone", player.GetTeam(), player.GetOrigin(), <0,0,0> )
            vector attackPos = player.GetOrigin()
            vector traceStart = player.EyePosition()
            vector prevViewVec = player.GetPlayerOrNPCViewVector()
            vector preforce = Normalize(prevViewVec)
            vector traceEnd = traceStart + ( preforce*1500 )
            vector targetpos = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).endPos
            drone.SetOrigin(targetpos)
            DispatchSpawn(drone)
            drone.SetBossPlayer(player)
            if(IsValid(drone) && IsAlive(drone)) {
                drone.TakeDamage(1,player,null, { })
            }
            wait 2.9
    }
}

void function D9stim(entity player)         //D9
{

	StatusEffect_AddTimed( player, eStatusEffect.speed_boost, 1.0, 20, 0 )
	StatusEffect_AddTimed( player, eStatusEffect.stim_visual_effect, 1.0, 20, 20 )

}

void function D10coreheal(entity player)                //D10
{
    int plbfnum = expect int(player.s.buff)
    if(plbfnum != 100 || player.s.hascoreheal){
        return
    }


    thread D10corehealthread(player)
}

void function D10corehealthread(entity player)
{
    wait 0.4
    if(IsValid(player)&&IsAlive(player)){
        if(TitanCoreInUse(player)){

            int nowheal = player.GetHealth()
            int maxheal = player.GetMaxHealth()
            int newheal = nowheal + 2500
            player.SetHealth(minint(newheal , maxheal))
            //Chat_ServerPrivateMessage( player, "yes", false, true )
            player.s.hascoreheal <- true
        }
    }

}

void function D11coreblockdamage(entity player, entity attacker , var damageInfo)  //D11
{
    entity core = player.GetOffhandWeapon(OFFHAND_EQUIPMENT)
    if(IsValid(core)){
        if(TitanCoreInUse(player))
        {
            string corename = core.GetWeaponClassName()
            if(corename != "mp_titancore_shift_core"){
                DamageInfo_ScaleDamage(damageInfo , 0.3)
            }
            else{
                DamageInfo_ScaleDamage(damageInfo , 0.7)
            }
        }

    }
}

void function D12steelcrow(entity player)               //D12
{
    if(IsValid(player) && IsAlive(player)){
        entity melee = player.GetOffhandWeapon(OFFHAND_MELEE)
        if(IsValid(melee)){
            if(!melee.HasMod("longdistance")){
                melee.AddMod("longdistance")
            }

        }
    }
}

void function D13seven(entity player, entity attacker , var damageInfo)  //D13
{
    int hit = expect int(player.s.hitcount)
    player.s.hitcount <- (hit + 1)
    int hitt = expect int(player.s.hitcount)
    if(hitt == 7){
        player.s.hitcount <- 0
        DamageInfo_SetDamage(damageInfo , 0)
        SendHudMessage(player, "充能防禦:6/6 (生效)",-1,0.65,244,124,60,1,0,1,0)
    }
    else if(hitt == 6){
        SendHudMessage(player, "充能防禦:"+hitt+"/6(就绪)",-1,0.65,244,124,60,1,0,1,0)
    }
    else if(hitt != 7){
         SendHudMessage(player, "充能防禦:"+hitt+"/6",-1,0.65,102,203,234,1,0,1,0)

    }

}

void function D16scorethief(entity player, entity attacker , var damageInfo)  //D16
{
    if(IsValid(player) && IsAlive(player) && IsValid(attacker) && IsAlive(attacker) && (player.GetTeam() != attacker.GetTeam())){

        if(player.GetPlayerGameStat( PGS_ASSAULT_SCORE ) > 200){
            player.SetPlayerGameStat(PGS_ASSAULT_SCORE , (player.GetPlayerGameStat( PGS_ASSAULT_SCORE ) - 200))
            attacker.SetPlayerGameStat(PGS_ASSAULT_SCORE , (attacker.GetPlayerGameStat( PGS_ASSAULT_SCORE ) + 200))
        }

    }

}

void function D17moneytoshield(entity player)           //D17
{
    int plbfnum = expect int(player.s.buff)
    if(!IsValid(player)||!IsAlive(player)||(plbfnum != 107))
        return

    if((player.GetPlayerGameStat( PGS_ASSAULT_SCORE ) > 1000) && (player.GetTitanSoul().GetShieldHealth() <= 2300)){

        player.SetPlayerGameStat(PGS_ASSAULT_SCORE, (player.GetPlayerGameStat( PGS_ASSAULT_SCORE ) - 1000))
        player.GetTitanSoul().SetShieldHealth(player.GetTitanSoul().GetShieldHealth() + 200)
        //SendHudMessage(player, "牢大來咯",-1,0.65,244,124,60,1,0,1,0)

    }

    if(player.GetPlayerGameStat( PGS_ASSAULT_SCORE ) < 1000){
        SendHudMessage(player, "沒錢了",-1,0.65,244,124,60,1,0,1,0)
    }

}


void function D19fakescore(entity player , entity attacker , var damageInfo )   //D19
{
    float scorechance = RandomFloatRange(0,1)
    if(scorechance <= 0.05){
        if(IsValid(player) && IsAlive(player)){
            EmitSoundOnEntityOnlyToPlayer( player, attacker, "titan_death_explode" )
            attacker.SetPlayerGameStat( PGS_ASSAULT_SCORE, attacker.GetPlayerGameStat( PGS_ASSAULT_SCORE )+10000)
        }
    }
}


////////////////////////////////////////////////////////DeBuffS-D////////////////////////////////////////////////////////////////////


void function DES1blind(entity player)       //DeS1
{
    thread DES1blindthread(player)

}

void function DES1blindthread(entity attacker )
{
	float flash_fade_in_duration = 40
	float flash_max_duration = 900.0
	float flash_fade_out_duration = 3.0
	float extra_highlight_duration = 3.0

	if ( !attacker.IsPlayer() || !IsValid( attacker ) )
		return

	if ( !IsValid( attacker ) || !IsAlive( attacker ) )
		return
	//EmitSoundOnEntity( attacker, "UI_InGame_MarkedForDeath_PlayerMarked" )
	StatusEffect_AddTimed( attacker, eStatusEffect.maphack_detected, 1.0, flash_fade_in_duration + flash_max_duration + flash_fade_out_duration + extra_highlight_duration, 0.0 )
	EmitSoundOnEntityOnlyToPlayer( attacker, attacker, "HUD_MP_BountyHunt_BankBonusPts_Deposit_End_Unsuccessful_1P" )
	EmitSoundOnEntityExceptToPlayer( attacker, attacker, "HUD_MP_BountyHunt_BankBonusPts_Deposit_End_Unsuccessful_3P" )
	Highlight_SetEnemyHighlight( attacker, "enemy_boss_bounty" )

	if ( !IsValid( attacker ) )
		return
	ScreenFade( attacker, 0, 0, 0, 255, flash_fade_in_duration, flash_max_duration, FFADE_OUT  )
	wait( flash_fade_in_duration )


	if ( !IsValid( attacker ) )
		return
	ScreenFade( attacker, 0, 0, 0, 255, flash_fade_out_duration, flash_max_duration, FFADE_IN  )
	wait( flash_max_duration + flash_fade_out_duration )
	wait( extra_highlight_duration )

	if ( !IsValid( attacker ) )
		return
	Highlight_ClearEnemyHighlight( attacker )
}



void function DeS2rehealplayer(entity player)             //DeS2
{

    thread DeS2rehealplayerthread(player)

}

void function DeS2rehealplayerthread(entity player)             //DeS2
{

    while(true){

        if (!IsValid(player) || !IsAlive(player))
        break

        player.SetHealth(maxint(    1 , (player.GetHealth() - 300) ))
        //player.Die()

        wait 1
    }

}



void function DeS4deathone(entity player, entity attacker , var damageInfo)   //DeS4
{
    if(IsValid(player) && IsAlive(player)){
        if(attacker.GetTeam() != player.GetTeam()){
            int death = RandomIntRangeInclusive(1,100)
            if(death <= 5){
                player.Die(attacker,null, {damageSourceId = DamageInfo_GetDamageSourceIdentifier( damageInfo )})
            }
        }
    }
}

void function DeS5cantmove(entity player)               //DeS5
{
    if(IsValid(player) && IsAlive(player)){
        StatusEffect_AddEndless( player, eStatusEffect.move_slow, 1.0 )
        player.Server_TurnDodgeDisabledOn()
    }
}

void function DeS6hitself(entity player, entity attacker , var damageInfo)   //DeS6
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && player.IsPlayer() && (player != attacker)){
            attacker.TakeDamage(DamageInfo_GetDamage( damageInfo ),player,null,{damageSourceId = eDamageSourceId.burn})
        }

    }
}

void function DeS7kick(entity player)                  //DeS7
{

    thread DeS7kickthread(player)
}

void function DeS7kickthread(entity player)
{
    NSSendAnnouncementMessageToPlayer(player, "警告：連接不穩定！"," 20秒後連接丟失!（獲得擊殺重置倒計時）", <228,55,66>, 10, 5)

    while(true){
        int plbf = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (plbf != 17))
            break



        int kicktime = expect int(player.s.kicktime)
        if(kicktime < 10){
            SendHudMessage(player, "連接丢失：" + (20-kicktime) + "秒後",-1,0.35,99,140,50,1,0,1.5,0)

        }
        else if(kicktime < 15){
            SendHudMessage(player, "連接丢失：" + (20-kicktime) + "秒後",-1,0.35,237,191,130,1,0,1.5,0)
            EmitSoundOnEntity( player, "lstar_dryfire" )
        }
        else{
            SendHudMessage(player, "連接丢失：" + (20-kicktime) + "秒後",-1,0.35,222,53,113,1,0,1.5,0)
            EmitSoundOnEntity( player, "lstar_dryfire" )

        }

        int kicktimenow = expect int(player.s.kicktime)
        int t = minint( 20, (kicktimenow + 1) )
        player.s.kicktime <- t
        if(kicktime == 20){
            if(IsValid(player) && IsAlive(player)){
                //ServerCommand("kickid "+ player.GetUID())
                NSDisconnectPlayer(player , "被Debuff踢了")
            }
        }
        wait 1

    }

}

void function DeS8death(entity player)                  //DeS8
{
    thread DeS8deaththread(player)
}

void function DeS8deaththread(entity player)
{
    NSSendAnnouncementMessageToPlayer(player, "15秒後爆炸!"," 抓緊時間!!(獲得擊殺重置倒計時)", <228,55,66>, 10, 5)

    while(true){
        int plbf = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (plbf != 18))
            break



        int kicktime = expect int(player.s.kicktime)
        if(kicktime < 5){
            SendHudMessage(player, "死亡倒計時：" + (15-kicktime) + "秒",-1,0.35,99,140,50,1,0,1.5,0)

        }
        else if(kicktime < 10){
            SendHudMessage(player, "死亡倒計時：" + (15-kicktime) + "秒",-1,0.35,237,191,130,1,0,1.5,0)
            EmitSoundOnEntity( player, "lstar_dryfire" )
        }
        else{
            SendHudMessage(player, "死亡倒計時：" + (15-kicktime) + "秒",-1,0.35,222,53,113,1,0,1.5,0)
            EmitSoundOnEntity( player, "lstar_dryfire" )

        }

        int kicktimenow = expect int(player.s.kicktime)
        int t = minint( 15, (kicktimenow + 1) )
        player.s.kicktime <- t

        if(kicktime == 15){
            if(IsValid(player) && IsAlive(player)){
                Explosion(player.GetOrigin(), player, null, 1145,1145, 1000, 1000, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.burn, ARC_CANNON_FX_TABLE )
                if(IsValid(player) && IsAlive(player)){
                    player.Die()
                }
            }
        }
        wait 1

    }

}

void function DeS9onlyhitshield(entity player, entity attacker , var damageInfo)   //DeS9
{

    if(IsValid(player) && IsAlive(player)){
        if(player.IsTitan()){
            if(player.GetTitanSoul().GetShieldHealth() == 0)
            DamageInfo_SetDamage( damageInfo , 1)
        }
    }

}

void function DeS11deathfire(entity player)                         //DeS11
{
    thread DeS11deathfirethread(player)
}

void function DeS11deathfirethread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 21)
            break


        int fire = expect int(player.s.firecount)
        if(player.IsTitan())
        player.TakeDamage( fire , player ,null, {damageSourceId = eDamageSourceId.burn})

        wait 1
    }

}


void function DeS12mark(entity player)          //DeS12
{
    string playername = player.GetPlayerName()
    foreach(entplayer in GetPlayerArray()){
        NSSendAnnouncementMessageToPlayer(entplayer,  playername + "成為高價值目標！","擊殺他，獎勵S級buff!", <200,112,214>, 10, 5)
    }

    thread DeS12markthread(player)
}

void function DeS12markthread(entity player)          //DeS12
{
    int plydbf = expect int(player.s.debuff)
    while(true){
        if(!IsValid(player) || !IsAlive(player) || (plydbf != 22)){
            break
        }

        if(IsValid(player) && IsAlive(player)){
            if(player.IsTitan()){
                entity effect = PlayFX(  $"EDP_base_2" , player.GetOrigin()+<0,0,120> )
                effect.SetParent(player)
                //effect.kv.modelscale = 6  //唉，没用
                int posx = RandomIntRange(0,255)
                int posy = RandomIntRange(0,255)
                int posz = RandomIntRange(0,255)
                EffectSetControlPointVector( effect, 1 , <215,15,47> )
                wait 4
                if(IsValid(effect)){
                    effect.Die()
                }

            }

        }


    }
}

void function DeS13loweffect(entity player)     //DeS13
{
    thread DeS13loweffectthread(player)
}

void function DeS13loweffectthread(entity player)
{

    while(true){
        int plydbf = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (plydbf != 23))
            break

        if(player.IsTitan()){


            if(IsValid(player) && IsAlive(player)){
                float per = 0.8*(1 - (player.GetHealth().tofloat()/player.GetMaxHealth().tofloat()))
                if(!GetDoomedState(player)){
                    StatusEffect_AddTimed( player, eStatusEffect.move_slow, per, 3.2, 0 )
                    StatusEffect_AddTimed( player, eStatusEffect.turn_slow, per/1.2, 3.2, 0 )
                }
                else if(GetDoomedState(player)){
                    StatusEffect_AddTimed( player, eStatusEffect.move_slow, 0.8, 3.2, 0 )
                    StatusEffect_AddTimed( player, eStatusEffect.turn_slow, 0.5, 3.2, 0 )
                }


            }
        }
        wait 3

    }


}

void function DeS14nonumberanymore(entity player , entity attacker , var damageInfo )             //DeS14
{
    int s14chance = RandomIntRangeInclusive(1,100)

    if(IsValid(player) && IsAlive(player)){
        if(IsValid(attacker) && (attacker != player)){
            if(s14chance <= 2){
                DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+10000 )
            }
            else if(s14chance <= 15 ){
                DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+1000 )
            }
            else if(s14chance <= 40 ){
                DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+100 )
            }
            else if(s14chance <= 70 ){
                DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+10 )
            }
            else if(s14chance <= 100 ){
                DamageInfo_SetDamage(damageInfo , DamageInfo_GetDamage(damageInfo)+1 )
            }


        }
    }


}

void function DeS15Hand(entity player, entity attacker , var damageInfo)            //DeS15
{
    if(attacker == player)
    return

    int canattack = expect int(attacker.s.canattack)
    attacker.s.canattack <- maxint((canattack - 1) , 0)


    if(canattack == 0){
        DamageInfo_SetDamage(damageInfo ,0)
        SendHudMessage(attacker, "電量: 0 (按近戰發電)",-1,0.65,204,204,204,1,0,1,0)
    }
    else{
        //DamageInfo_SetDamage(damageInfo ,0)
        SendHudMessage(attacker, "電量: " + canattack,-1,0.65,157,81,253,1,0,1,0)
    }

}

void function DeS16randomlift(entity player)        //DeS16
{
    thread DeS16randomliftthread(player)
}

void function DeS16randomliftthread(entity player)        //DeS16
{
    while(true){
        int plbfnum = expect int(player.s.debuff)
        if(!IsValid(player)||!IsAlive(player)||plbfnum != 26)
            break

        int ran = RandomIntRangeInclusive(1,6)
        int lastran = expect int(player.s.evil)
        if(ran == lastran){
            if(IsValid(player) && IsAlive(player)){
                SendHudMessage(player, "中獎咯! |"+"骰子: " + ran + "|上次的骰子: " + lastran,-1,0.65,157,81,253,1,0,1,0)
                EmitSoundOnEntity( player, "titan_eject_dpad" )
                player.Die()

            }
        }
        else{
            player.s.evil <- ran
            SendHudMessage(player, "骰子: " + ran + "|上次的骰子: " + lastran,-1,0.65,157,81,253,1,0,1,0)
            EmitSoundOnEntity( player, "titan_damage_beep" )
        }
        wait 5
    }
}

void function DeS17doomnow(entity player)       //DeS17
{
    thread DeS17doomnowthread(player)
}

void function DeS17doomnowthread(entity player)
{

    while(true){
        int pldbfnum = expect int(player.s.debuff)
        if(!IsValid(player)||!IsAlive(player)||(pldbfnum != 27))
            break

        if(IsValid(player) && IsAlive(player) && !GetDoomedState( player )){
            player.SetHealth(1)
            player.TakeDamage( player.GetHealth() , null ,null, {damageType = DF_BYPASS_SHIELD | DF_CRITICAL | DF_MELEE , damageSourceId = eDamageSourceId.burn})
        }
        wait 1
    }

}

void function DeS18lookotherway(entity player)       //DeS18
{
    thread DeS18lookotherwaythread(player)
}

void function DeS18lookotherwaythread(entity player)
{

    while(true){
        int plbfnum = expect int(player.s.debuff)
        if(!IsValid(player)||!IsAlive(player)||plbfnum != 28)
            break

        if(IsValid(player) && IsAlive(player)){
            vector attackPos = player.GetOrigin()
            vector traceStart = player.EyePosition()
            vector prevViewVec = player.GetPlayerOrNPCViewVector()
            vector preforce = Normalize(prevViewVec)
            vector traceEnd = traceStart + ( preforce*15000 )
            entity target = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).hitEnt
            if(target != null){
                if(target.IsTitan()){
                    float look = RandomFloatRange(0,1)
                    if(look < 0.6){
                        player.SetAngles(<RandomFloatRange(-1.0 ,1.0),RandomFloatRange(-1.0 ,1.0),0>)
                    }
                }

            }
        }
        wait 0.5
    }

}

void function DeS19handfeet(entity player, entity attacker , var damageInfo)   //DeS19
{
    if((player.GetModelName() != attacker.GetModelName())&&(player.GetTeam() != attacker.GetTeam())){
        DamageInfo_SetDamage(damageInfo , 0)
    }

}


void function DeA1onehithardtodie(entity player, entity attacker , var damageInfo)   //DeA1
{
    if(!GetDoomedState( player )){
        if(attacker.GetTeam() != player.GetTeam()){
            int death = RandomIntRangeInclusive(1,100)
            if(death <=5){
                int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
                int nowplayerhealth = player.GetHealth()
                DamageInfo_SetDamage( damageInfo, nowplayerhealth )
            }
        }

    }
}

void function DeA2weak(entity player, entity attacker , var damageInfo)   //DeA2
{
    float randomdamagetimedown = RandomFloatRange(0.70 , 0.40)
    DamageInfo_ScaleDamage(damageInfo , randomdamagetimedown )
}

void function DeA3lesshealth(entity player)             //DeA3
{
    if(IsValid(player) && IsAlive(player)){
        float healthtimes = RandomFloatRange( 0.35 ,0.66)
        int playerhealth = player.GetHealth()
        int playermaxhealth = player.GetMaxHealth()
        if((playermaxhealth * healthtimes) >= 2500){
            player.SetMaxHealth(playermaxhealth * healthtimes )
            player.SetHealth(playerhealth * healthtimes)
        }
        else{
            player.SetMaxHealth(2500 )
            player.SetHealth(2500)
        }



    }

}

void function DeA4doctor(entity player, entity attacker , var damageInfo)   //DeA4
{
    float healchance = RandomFloatRange(0 , 100)
    if (healchance <= 33){
        int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
        DamageInfo_SetDamage(damageInfo , 0 )

        if(IsValid(player) && IsAlive(player)){
            player.SetHealth(minint((player.GetHealth() + hitdamage) , player.GetMaxHealth()))
        }
    }
}

void function DeA5harfspeed(entity player)      //DeA5
{
    StatusEffect_AddEndless( player, eStatusEffect.move_slow, 0.3)
}

void function DeA6weaknessbody(entity player, entity attacker , var damageInfo)   //DeA6
{
    DamageInfo_ScaleDamage(damageInfo , 2 )
}






//DeA9 done

void function DeA11tencrit(entity player, entity attacker , var damageInfo)   //DeA11
{
    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){

        DamageInfo_ScaleDamage(damageInfo , 10 )

    }
}

void function DeA12lostammo(entity player, entity attacker , var damageInfo)   //DeA12
{
    int chance = RandomIntRangeInclusive(0,100)
    if(chance <= 10){
        foreach ( weapon in attacker.GetMainWeapons() )
		{
			weapon.SetWeaponPrimaryClipCount( 0 )
		}
    }

}

void function DeA13corekill(entity player)          //DeA13
{
    thread DeA13corekillthread(player)
}

void function DeA13corekillthread(entity player)
{
    while(true){
        int plbfnum = expect int(player.s.debuff)
        if(!IsValid(player)||!IsAlive(player)||plbfnum != 43)
            break

        if(player.IsTitan()){
            if(TitanCoreInUse(player)){
                player.Die(player,null, {damageSourceId = eDamageSourceId.forget})
                Explosion(player.GetOrigin(), null, null, 1919, 1919, 1000, 1000, SF_ENVEXPLOSION_NOSOUND_FOR_ALLIES, player.GetOrigin(), 100, damageTypes.explosive, eDamageSourceId.burn, ARC_CANNON_FX_TABLE)

            }
        }
        wait 0.3
    }

}

void function DeA14damagecut80(entity player, entity attacker , var damageInfo)   //DeA14
{
    int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
    int realdamage = maxint(0, (hitdamage - 80))
    DamageInfo_SetDamage(damageInfo , realdamage )
}
/*
void function DeA15lessormore(entity player, entity attacker , var damageInfo)   //DeA15
{
    if(IsValid(attacker) && IsAlive(attacker)){
        int atGen = attacker.GetGen()
        if(IsValid(player) && IsAlive(player)){
            int plGen = player.GetGen()

            if(atGen > plGen){
                if((atGen - plGen) >= 10){
                    DamageInfo_SetDamage(damageInfo , 0 )
                    SendHudMessage(attacker, "/////////////////////////////////尊老愛幼/////////////////////////////////",-1,0.65,104,29,215,1,0,0.5,0)
                }
            }
            else if(atGen < plGen){
                if((plGen - atGen) >= 10){
                    DamageInfo_SetDamage(damageInfo , 0 )
                    SendHudMessage(attacker, "/////////////////////////////////尊老愛幼/////////////////////////////////",-1,0.65,104,29,215,1,0,0.5,0)
                }
            }
        }
    }
}
*/
void function DeA16errorpression(entity player)     //DeA16
{
    DeB6takeright(player)
    DeB7takeleft(player)
    DeB8takeG(player)
    DeB2lessammo(player)
    DeB15slowreload(player)

}

void function DeA17hurtadd(entity player, entity attacker , var damageInfo)         //DeA17
{

    if(IsValid(player) && IsAlive(player)){
        int times = expect int(player.s.evil) + 5
        player.s.evil <- times

        DamageInfo_SetDamage(damageInfo , (DamageInfo_GetDamage(damageInfo) + times))
    }
}

void function DeA18randombloodpre(entity player)                //DeA18
{
    player.s.storedamage <- 105
    thread DeA18randombloodprethread(player)
}

void function DeA18randombloodprethread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 48)
            break

        int blood = expect int(player.s.storedamage)
        if(blood >= 140){
            player.Die(player,null, {damageSourceId = eDamageSourceId.highblood})
        }

        if(blood <= 70){
            player.Die(player,null, {damageSourceId = eDamageSourceId.lowblood})
        }

        if(blood >= 105){
            player.s.storedamage--
        }
        else{
            player.s.storedamage++
        }
        int bloodnow = expect int(player.s.storedamage)
        if(bloodnow <= 90){
            SendHudMessage(player, "血压： " + bloodnow + ", 快乐死了",-1,0.65,22,138,199,1,0,1,0)
        }
        else if(bloodnow <= 105){
            SendHudMessage(player, "血压： " + bloodnow + ", 乐",-1,0.65,14,109,57,1,0,1,0)
        }
        else if(bloodnow <= 120){
            SendHudMessage(player, "血压： " + bloodnow + ", 气人",-1,0.65,196,153,69,1,0,1,0)
        }
        else{
            SendHudMessage(player, "血压： " + bloodnow + ", 红温了",-1,0.65,252,61,73,1,0,1,0)
        }
        wait 1
    }

}

void function DeA19relink(entity player)        //DeA19
{

    thread DeA19relinkthread(player)
}

void function DeA19relinkthread(entity player)
{
    SendHudMessage(player, "网络连接不稳定，即将开始重连！" ,-1,0.65,252,61,73,1,0,1,0)
    wait 3
    if(!IsValid(player) || !IsAlive(player))
        return

    int debuff = expect int(player.s.debuff)
    if(debuff != 49)
        return

    while(true){
        if(!IsValid(player) || !IsAlive(player))
            return

        StatusEffect_AddTimed( player, eStatusEffect.move_slow,1,2, 0 )
	    StatusEffect_AddTimed( player, eStatusEffect.turn_slow,1,2, 0 )
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 49)
            break


        int sucess = expect int(player.s.sucess)
        int fail = expect int(player.s.fail)
        if(fail >= 3 ){
            //ServerCommand("kickid "+ player.GetUID())
            NSDisconnectPlayer(player , "被Debuff踢了")
        }
        if(sucess >= 1){
            SendHudMessage(player,"重新连接成功!",-1,0.65,48,202,36,1,0,2,0)
            StatusEffect_AddEndless( player, eStatusEffect.turn_slow,0)
            StatusEffect_AddEndless( player, eStatusEffect.move_slow,0)
            break
        }
        int linknum = RandomIntRangeInclusive(20 , 40)
        for(int link = 1 ; link <60 ; link++){
            if(link == 1){
                player.s.haslink <- false
            }

            string linkmsg1 = ""
            string linkmsg2 = ""
            string linkmsg3 = ""
            string linkmsg4 = ""
            for(int msgtime = 1 ; msgtime < link ; msgtime++){
                linkmsg1 = linkmsg1 + "|"
            }

            for(int msgtime = 1 ; msgtime < (60-link) ; msgtime++){
                linkmsg2 = linkmsg2 + "|"
            }
            linkmsg3 += "/-}>/"
            linkmsg4 += "/o_O/"
            if(abs((link+1)-linknum) <3){
                if(IsValid(player)){
                    SendHudMessage(player, linkmsg1+linkmsg4+linkmsg2+"\n"+"重新连接!",-1,0.65,48,202,36,1,0,0.5,0)
                    if(!player.s.haslink){
                        if(player.IsInputCommandHeld(IN_USE)){
                            if(IsValid(player) &&IsAlive(player)){
                                player.s.sucess++
                                player.s.haslink <- true
                                EmitSoundOnEntityOnlyToPlayer( player,player, "EnergySyphon_ShieldRecieved" )
                            }
                        }
                    }

                }

            }
            else{
                if(IsValid(player))
                {
                    SendHudMessage(player, linkmsg1+linkmsg3+linkmsg2,-1,0.65,248,202,36,1,0,0.5,0)
                    if(!player.s.haslink){
                        if(player.IsInputCommandHeld(IN_USE)){
                            if(IsValid(player) &&IsAlive(player)){
                                player.s.fail++
                                player.s.haslink <- true
                                player.SetHealth(maxint(1, (player.GetHealth()-500)))
                                EmitSoundOnEntityOnlyToPlayer( player, player, "titan_dryfire" )
                                SendHudMessage(player, linkmsg1+linkmsg3+linkmsg2+"\n"+"失败！注意剩余次数!",-1,0.65,248,202,36,1,0,0.5,0)
                            }

                        }
                    }
                }

            }

            WaitFrame()
        }


        wait 1
    }

}



void function DeA18atk(entity player, entity attacker , var damageInfo)
{
    if(IsValid(attacker) && IsAlive(attacker)){
        attacker.s.storedamage--
    }
}

void function DeA18beatk(entity player, entity attacker , var damageInfo)
{
    if(IsValid(player) && IsAlive(player)){
        player.s.storedamage++
        if(DamageInfo_GetDamageSourceIdentifier( damageInfo ) == eDamageSourceId.mp_titanweapon_sniper){
            player.s.storedamage += 10
        }
    }
}

void function DeB1emplot(entity player)         //DeB1
{
    thread DeB1emplotthread(player)
}

void function DeB1emplotthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 51){
            break
        }
        else{
            //StatusEffect_AddTimed( player, eStatusEffect.emp, 1, 3, 3 )
			StatusEffect_AddTimed( player, eStatusEffect.move_slow, 0.8, 3, 3 )
			StatusEffect_AddTimed( player, eStatusEffect.turn_slow, 0.5, 3, 3 )
        }
        wait 10

    }
}

void function DeB2lessammo(entity player)   //DeB2
{
    if(IsValid(player) && IsAlive(player)){
        entity mainweapon = player.GetActiveWeapon()
        if(IsValid(mainweapon)){
            string weaponname = mainweapon.GetWeaponClassName()
            if(weaponname == "mp_titanweapon_xo16_vanguard"||weaponname == "mp_titanweapon_xo16_shorty"||weaponname == "mp_titanweapon_xo16"||weaponname == "mp_titanweapon_sticky_40mm"||weaponname == "mp_titanweapon_sniper"||weaponname == "mp_titanweapon_particle_accelerator"||weaponname == "mp_titanweapon_meteor"||weaponname == "mp_titanweapon_leadwall"||weaponname == "mp_titanweapon_predator_cannon"){
                mainweapon.SetWeaponPrimaryClipCount(0)
                mainweapon.AddMod("lessammo")
            }

        }

    }
}

void function DeB3weaknessbody(entity player, entity attacker , var damageInfo)   //DeB3
{
    if(IsValid(player) && IsAlive(player)){
        if(player.GetHealth() < player.GetMaxHealth()/2){
            DamageInfo_ScaleDamage(damageInfo , 2 )
        }
    }
}

void function DeB4halfhealth(entity player)         //DeB4
{
    if(IsValid(player) && IsAlive(player)){

        player.SetHealth(player.GetHealth()/2)
    }
}

void function DeB5sonar(entity player)      //DeB5
{
    StatusEffect_AddEndless( player, eStatusEffect.sonar_detected, 1)
}

void function DeB6takeright(entity player)      //DeB6
{

    entity rightweapon = player.GetOffhandWeapon(OFFHAND_ORDNANCE)
    if(IsValid(rightweapon) && !rightweapon.HasMod("unfastfill")){
        string rightname = rightweapon.GetWeaponClassName()
        if(rightname == "mp_titanweapon_laser_lite"||rightname == "mp_titanweapon_flame_wall"||rightname == "mp_titanweapon_dumbfire_rockets"||rightname == "mp_titanweapon_arc_wave"||rightname == "mp_titanability_power_shot"||rightname == "mp_titanweapon_tracker_rockets"||rightname == "mp_titanweapon_salvo_rockets"){
          //  rightweapon.AddMod("unfastfill")
        }
    }

    /*
    player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
    entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
    if(IsValid(Gweapon)){
        string Gwpname = Gweapon.GetWeaponClassName()
        if(Gwpname == "mp_titanability_rearm"){
            player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER)
            player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G

            GiveRandomCore(player)
        }
    }
    */
}

void function DeB7takeleft(entity player)         //DeB7
{
    entity leftweapon = player.GetOffhandWeapon(OFFHAND_SPECIAL)
    if(IsValid(leftweapon) && !leftweapon.HasMod("unfastfill")){
        string leftname = leftweapon.GetWeaponClassName()
        if(leftname == "mp_titanweapon_vortex_shield"||leftname == "mp_titanweapon_heat_shield"||leftname == "mp_titanability_tether_trap"||leftname == "mp_ability_swordblock"||leftname == "mp_titanability_particle_wall"||leftname == "mp_titanability_gun_shield"||leftname == "mp_titanweapon_stun_laser"){
            leftweapon.AddMod("unfastfill")
        }
    }

    /*
    player.TakeOffhandWeapon(OFFHAND_SPECIAL)       //right
    entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
    if(IsValid(Gweapon))
    {
        string Gwpname = Gweapon.GetWeaponClassName()
        if(Gwpname == "mp_titanability_rearm"){
            player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER)
            player.GiveOffhandWeapon("mp_titanability_phase_dash" , OFFHAND_TITAN_CENTER)  //give G


            GiveRandomCore(player)


        }
    }*/
}

void function DeB8takeG(entity player)         //DeB8
{
    entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
    if(IsValid(Gweapon) && !Gweapon.HasMod("unfastfill")){
        string Gname = Gweapon.GetWeaponClassName()
        if(Gname =="mp_titanability_ammo_swap"||Gname =="mp_titanability_hover"||Gname =="mp_titanability_laser_trip"||Gname =="mp_titanability_phase_dash"||Gname =="mp_titanability_rearm"||Gname =="mp_titanability_slow_trap"||Gname =="mp_titanability_sonar_pulse"){
            Gweapon.AddMod("unfastfill")
        }
    }
    /*
    player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER)       //right
    GiveRandomCore(player)
*/
}

void function DeB9decrithit(entity player, entity attacker , var damageInfo)        //DeB9
{
    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){

        DamageInfo_ScaleDamage(damageInfo , 2 )
    }

}

void function DeB10miss(entity player, entity attacker , var damageInfo)        //DeB10
{
    int misschance = RandomIntRangeInclusive(1,100)
    if(misschance <= 30){
        DamageInfo_SetDamage(damageInfo , 0 )
        SendHudMessageBuilder(attacker, "攻擊未命中!", 238,68,68)
    }

}

void function DeB11shieldslow(entity player)                        //DeB11
{
    thread DeB11shieldslowthread(player)

}

void function DeB11shieldslowthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 61)
            break

        if(player.IsTitan()){

            float slowfloat = (player.GetTitanSoul().GetShieldHealth())/4000.0
            StatusEffect_AddTimed( player, eStatusEffect.move_slow, slowfloat, 1.2, 0 )

        }
        wait 1
    }
}

void function DeB12Genlowdamage(entity player, entity attacker , var damageInfo)        //DeB12
{
    if(IsValid(attacker) && IsAlive(attacker)){
        int Gen = attacker.GetGen()
        int damagelost = 2*Gen
        int damagenow = maxint(30, (100-damagelost) )
        float b = float(damagenow)/100.0
        DamageInfo_ScaleDamage(damageInfo , b)
    }
}

void function DeB13flipman(entity player)              //DeB13
{
    player.SetGroundFrictionScale(0)
}

void function DeB14evildamageattack(entity player, entity attacker , var damageInfo)        //DeB14
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(attacker.GetHealth()*2 >= attacker.GetMaxHealth()){

            int damagevalue = int(floor(DamageInfo_GetDamage(damageInfo)))
            int damagestorenow = expect int(attacker.s.evil)
            int damagestore = damagestorenow + damagevalue
            attacker.s.evil <- damagestore
            if(IsValid(attacker)){
                SendHudMessage(attacker,"罪業: " + damagestore/100.0 ,-1,0.65,170,229,229,1,0,1,0)
            }
        }
    }
}

void function DeB14evildamagebeattack(entity player, entity attacker , var damageInfo)        //DeB14
{
    if(IsValid(player) && IsAlive(player)){
        if(player.GetHealth()*2 < player.GetMaxHealth())
        //int damagevalue = int(floor(DamageInfo_GetDamage(damageInfo)))
        //float damagetimess = 1 + (expect int(player.s.evil))/10000
        DamageInfo_ScaleDamage(damageInfo , (1 + max((expect int(player.s.evil))/10000.0 , 10)))
        if(IsValid(player)){
            SendHudMessage(player,"罪業: " + ((expect int(player.s.evil))/100),-1,0.65,150,73,89,1,0,1,0)
        }

    }


}

void function DeB15slowreload(entity player)   //DeB15
{
    if(IsValid(player) && IsAlive(player)){
        entity mainweapon = player.GetActiveWeapon()
        if(IsValid(mainweapon)){
            string weaponname = mainweapon.GetWeaponClassName()
            if(weaponname == "mp_titanweapon_xo16_vanguard"||weaponname == "mp_titanweapon_xo16_shorty"||weaponname == "mp_titanweapon_xo16"||weaponname == "mp_titanweapon_sticky_40mm"||weaponname == "mp_titanweapon_sniper"||weaponname == "mp_titanweapon_particle_accelerator"||weaponname == "mp_titanweapon_meteor"||weaponname == "mp_titanweapon_leadwall"||weaponname == "mp_titanweapon_predator_cannon"){
                mainweapon.AddMod("slowreload")
            }
        }
    }
}

void function DeB16betternobodyhere(entity player, entity attacker , var damageInfo)     //DeB16
{
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(player) && IsAlive(player)){
            foreach(entplayer in GetPlayerArrayOfTeam( attacker.GetTeam() )){
                if(IsValid(entplayer) && IsAlive(entplayer) && entplayer != attacker){

                    float distantab = Distance2D(entplayer.GetOrigin() , attacker.GetOrigin())

                    if(distantab <= 1000.0){
                        SendHudMessageBuilder(attacker, "身邊存在隊友！卓爾不群生效中", 238,68,68)
                        DamageInfo_ScaleDamage(damageInfo , 0.5 )
                        return
                    }
                }
            }
        }
    }
}

void function DeB17therecantstopcar(entity player)         //DeB17
{
    thread DeB17therecantstopcarthread(player)
}

void function DeB17therecantstopcarthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 67){
            break
        }
        else{
            vector oldpos = player.GetOrigin()
            wait 1
            if(IsValid(player) && IsAlive(player)){
                vector newpos = player.GetOrigin()
                if(oldpos == newpos){
                    if((player.GetPlayerGameStat( PGS_DETONATION_SCORE ) > 100)){
                        player.SetPlayerGameStat( PGS_DETONATION_SCORE, (player.GetPlayerGameStat( PGS_DETONATION_SCORE ) - 100))
                        SendHudMessage(player, "這裏面不讓停泰坦！",-1,0.35,243,107,39,1,0,1.5,0)
                    }
                    else{
                        if(player.IsTitan()){
                            player.TakeDamage( 1000 ,player ,null, {damageSourceId = eDamageSourceId.notime})
                        }
                        SendHudMessage(player, "這裏面不讓停泰坦！",-1,0.35,22,53,113,1,0,1.5,0)
                    }
                }
            }


        }


    }
}

void function DeB18gravity(entity player, entity attacker , var damageInfo)     //DeB18
{
    if(IsValid(player) && IsValid(attacker) && IsAlive(player) && IsAlive(attacker)){

        vector targetpos = player.GetOrigin()
        vector mepos = attacker.GetOrigin()
        vector speedvector = targetpos - mepos
        vector speedvectorsize = Normalize(speedvector)

        if(!GetDoomedState(player)){
            vector speedorgin = attacker.GetVelocity()
            attacker.SetVelocity(240*speedvectorsize + speedorgin + <0, 0 , 50>)
        }
        else{
            vector speedorgin = attacker.GetVelocity()
            attacker.SetVelocity(600*speedvectorsize + speedorgin + <0, 0 , 50>)
        }

    }
}

void function DeB19up(entity player)    //DeC8
{
    thread DeB19upthread(player)
}

void function DeB19upthread(entity player)
{
    for(;;){
        int debuffin = expect int(player.s.debuff)

        if(!IsValid(player) || !IsAlive(player) || debuffin != 69){
            break
        }
        else{

	        vector attackPos = player.GetOrigin()
	        vector traceStart = player.EyePosition()
	        vector prevViewVec = <0,0,1>
	        vector preforce = Normalize(prevViewVec)
	        vector traceEnd = traceStart + ( preforce*1000 )
	        vector targetpos = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).endPos
            float rainz = targetpos.z - attackPos.z
            if(rainz < 900 && player.GetVelocity().z <= 10000.0){

                //player.TakeDamage( 50 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                //PlayerEarnMeter_AddOwnedFrac( player, 0.01 )
                //StatusEffect_AddTimed( player, eStatusEffect.emp, 1, 2, 2 )
                //SendHudMessageBuilder(player, "警告:受太陽風暴輻射中!", 238,68,68)
                player.SetVelocity(player.GetVelocity() + <0,0,600>)

            }
        }
        WaitFrame()
    }

}

void function DeC170speed(entity player)      //DeC1
{
    StatusEffect_AddEndless( player, eStatusEffect.move_slow, 0.1)
}


void function DeC370turn(entity player)      //DeC3
{
    StatusEffect_AddEndless( player, eStatusEffect.turn_slow, 0.3)
}

void function DeC5nododge(entity player)        //DeC5
{
    player.Server_TurnDodgeDisabledOn()
}

void function DeC6doomweak(entity player, entity attacker , var damageInfo)     //DeC6
{
    if(GetDoomedState(player)){
        DamageInfo_ScaleDamage(damageInfo , 0.333)
    }
}

void function DeC7t203(entity player)               //DeC7
{
    if(IsValid(player) && IsAlive(player)){
        entity handweapon = player.GetActiveWeapon()

        if(IsValid(handweapon)){
            string handweapon_name = handweapon.GetWeaponClassName()
			player.TakeWeaponNow(handweapon_name)

			entity playerhweapon = player.GetActiveWeapon()
			if( playerhweapon == null){

                player.GiveWeapon("mp_titanweapon_meteor")   //give main


				player.TakeOffhandWeapon(OFFHAND_ORDNANCE )   //right
				player.GiveOffhandWeapon("mp_titanweapon_flame_wall" , OFFHAND_ORDNANCE)  //give right

				player.TakeOffhandWeapon(OFFHAND_SPECIAL) //left
				player.GiveOffhandWeapon("mp_titanweapon_heat_shield" , OFFHAND_SPECIAL)   //give left

				player.TakeOffhandWeapon(OFFHAND_TITAN_CENTER )   //G
				player.GiveOffhandWeapon("mp_titanability_slow_trap" , OFFHAND_TITAN_CENTER)  //give G

				GiveRandomCore(player)



			}

        }

    }
}

void function DeC8sunburn(entity player)    //DeC8
{
    thread DeC8sunburnthread(player)
}

void function DeC8sunburnthread(entity player)
{
    for(;;){
        int debuffin = expect int(player.s.debuff)

        if(!IsValid(player) || !IsAlive(player) || debuffin != 78){
            break
        }
        else{

	        vector attackPos = player.GetOrigin()
	        vector traceStart = player.EyePosition()
	        vector prevViewVec = <0,0,1>
	        vector preforce = Normalize(prevViewVec)
	        vector traceEnd = traceStart + ( preforce*6000 )
	        vector targetpos = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).endPos
            float rainz = targetpos.z - attackPos.z
            if(rainz > 5000){
                if(player.IsTitan()){
                    player.TakeDamage( 50 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                    //PlayerEarnMeter_AddOwnedFrac( player, 0.01 )
                    //StatusEffect_AddTimed( player, eStatusEffect.emp, 1, 2, 2 )
                    SendHudMessageBuilder(player, "警告:受太陽風暴輻射中!", 238,68,68)
                }
                else{
                    player.TakeDamage( 5 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                    //PlayerEarnMeter_AddOwnedFrac( player, 0.01 )
                    //StatusEffect_AddTimed( player, eStatusEffect.emp, 1, 2, 2 )
                    SendHudMessageBuilder(player, "警告:受太陽風暴輻射中!", 238,68,68)
                }


            }
        }
        wait 1
    }

}

void function DeC9emplot(entity player)         //DeC9
{
    thread DeC9emplotthread(player)
}

void function DeC9emplotthread(entity player)
{
    for(;;){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 79){
            break
        }
        else{
           // StatusEffect_AddTimed( player, eStatusEffect.emp, 1, 3, 3 )
			StatusEffect_AddTimed( player, eStatusEffect.move_slow, 0.8, 2, 2 )
			//StatusEffect_AddTimed( player, eStatusEffect.turn_slow, 0.5, 3, 3 )
        }
        wait 10

    }
}


void function DeC10doomreheal(entity player)            //DeC10
{
    thread DeC10doomrehealthread(player)
}

void function DeC10doomrehealthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 80){
            break
        }
        else{
            if(player.IsTitan()){
                if(GetDoomedState(player)){
                    player.SetHealth(maxint(1 , (player.GetHealth()-200) ))
                }
            }
        }
        wait 1
    }
}

void function DeC11nocrit(entity player , entity attacker , var damageInfo)         //DeC11
{
    if(IsCriticalHit( attacker, player, DamageInfo_GetHitBox( damageInfo ), DamageInfo_GetDamage( damageInfo ), DamageInfo_GetDamageType( damageInfo ) )){

        DamageInfo_SetDamage(damageInfo , 0)
    }
}

void function DeC12hitselfback(entity player , entity attacker , var damageInfo)         //DeC12
{
    if(IsValid(player) && IsValid(attacker) && IsAlive(attacker)){

        vector targetpos = player.GetOrigin()
        vector mepos = attacker.GetOrigin()
        vector speedvector = targetpos - mepos
        vector speedvectorsize = Normalize(speedvector)
        if (IsValid(player)){
            vector speedorgin = player.GetVelocity()
            player.SetVelocity(240*speedvectorsize + speedorgin + <0, 0 , 80>)
        }

    }
}

void function DeC13upanddown(entity player , entity attacker , var damageInfo)         //DeC13
{

    if(!GetDoomedState(attacker)){
        DamageInfo_ScaleDamage(damageInfo , 0.8)
    }


}

void function DeC14kicksobody(entity player , entity attacker , var damageInfo)           //DeC14
{
    if(IsValid(player) && IsAlive(player)){
        StatusEffect_AddTimed( player, eStatusEffect.speed_boost, 0.3, 2, 0 )
    }

}

void function DeC15tiredguy(entity player , entity attacker , var damageInfo)           //DeC15
{
    float damagetimes = expect float(attacker.s.damagetimes)
    DamageInfo_ScaleDamage(damageInfo , damagetimes)
}

void function DeC16lostfocus(entity player)                //DeC16
{
    thread DeC16lostfocusthread(player)
}

void function DeC16lostfocusthread(entity player)           //Dec16
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (debuff != 86))
            break

        if(IsValid(player) && IsAlive(player)){
            float x = RandomFloatRange(-1,1)
            float y = RandomFloatRange(-1,1)
            float z = RandomFloatRange(-1,1)
            player.SetAngles(<x,y,z>)
        }
        wait 10
    }
}

void function DeC17hightenemy(entity player , entity attacker , var damageInfo)             //DeC17
{
    if(IsValid(player) && IsAlive(player) && IsValid(attacker) && IsAlive(attacker)){
        if(attacker.GetOrigin().z  > player.GetOrigin().z){
            DamageInfo_ScaleDamage(damageInfo , 1.5)
        }
    }
}

void function DeC17hightenemyatk(entity player , entity attacker , var damageInfo)             //DeC17
{
    if(IsValid(player) && IsAlive(player) && IsValid(attacker) && IsAlive(attacker)){
        if(attacker.GetOrigin().z  < player.GetOrigin().z){
            DamageInfo_ScaleDamage(damageInfo , 0.5)
        }
    }
}

void function DeC18onlyotherguy(entity player , entity attacker , var damageInfo )   //DeC18
{
    string lastdamageid = expect string(attacker.s.lastdamage)
    if(player.IsPlayer()){
        if(lastdamageid == "abc"){
            attacker.s.lastdamage <- player.GetPlayerName()
        }
        else if(player.GetPlayerName() == lastdamageid){

            DamageInfo_ScaleDamage(damageInfo , 0.5 )
            SendHudMessage(attacker, "妳不能再繼續攻擊 " + lastdamageid + " !,傷害已減半！",-1,0.35,222,53,113,1,0,1.5,0)
        }
        else if(player.GetPlayerName() != lastdamageid){
            attacker.s.lastdamage <- player.GetPlayerName()
        }
    }

}

void function DeC19attackback(entity player)    //DeC19
{
    thread DeC19attackbackthread(player)
}

void function DeC19attackbackthread(entity player)    //DeC19
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (debuff != 89))
            break

        float pushchance = RandomFloatRange(0,1)
        if(pushchance <= 0.5){
            if(player.IsInputCommandHeld( IN_ATTACK )){
                vector lookforvec = Normalize(player.GetViewVector())
                player.SetVelocity(player.GetVelocity()-600*<lookforvec.x , lookforvec.y , lookforvec.z>+<0,0,50>)
            }
        }
        wait 1
    }
}

void function DeD1takeF(entity player)          //DeD1
{
    if(IsValid(player) && IsAlive(player)){
		player.TakeOffhandWeapon(OFFHAND_MELEE )   //right
    }
}
//DeD2 done
//DeD3 done

void function DeD4weaktoshield(entity player , entity attacker , var damageInfo)          //DeD4
{
    if(IsValid(player) && IsAlive(player)){
        if(player.IsTitan()){
            if(player.GetTitanSoul().GetShieldHealth() > 0){
                DamageInfo_ScaleDamage(damageInfo , 0.5)
            }
        }

    }
}

void function DeC4thread(entity attacker )
{
	float flash_fade_in_duration = 0.2
	float flash_max_duration = 4.0
	float flash_fade_out_duration = 3.0
	float extra_highlight_duration = 0.0

	if ( !attacker.IsPlayer() || !IsValid( attacker ) )
		return

	if ( !IsValid( attacker ) || !IsAlive( attacker ) )
		return
	//EmitSoundOnEntity( attacker, "UI_InGame_MarkedForDeath_PlayerMarked" )
	StatusEffect_AddTimed( attacker, eStatusEffect.maphack_detected, 1.0, flash_fade_in_duration + flash_max_duration + flash_fade_out_duration + extra_highlight_duration, 0.0 )
	EmitSoundOnEntityOnlyToPlayer( attacker, attacker, "HUD_MP_BountyHunt_BankBonusPts_Deposit_End_Unsuccessful_1P" )
	EmitSoundOnEntityExceptToPlayer( attacker, attacker, "HUD_MP_BountyHunt_BankBonusPts_Deposit_End_Unsuccessful_3P" )
	Highlight_SetEnemyHighlight( attacker, "enemy_boss_bounty" )

	if ( !IsValid( attacker ) )
		return
	ScreenFade( attacker, 0, 0, 0, 255, flash_fade_in_duration, flash_max_duration, FFADE_OUT  )
	wait( flash_fade_in_duration )


	if ( !IsValid( attacker ) )
		return
	ScreenFade( attacker, 0, 0, 0, 255, flash_fade_out_duration, flash_max_duration, FFADE_IN  )
	wait( flash_max_duration + flash_fade_out_duration )
	wait( extra_highlight_duration )

	if ( !IsValid( attacker ) )
		return
	Highlight_ClearEnemyHighlight( attacker )
}

//DeD5 done

void function DeD7noshield(entity player)           //DeD7
{
    if(IsValid(player) && IsAlive(player) && player.IsTitan()){
        player.GetTitanSoul().SetShieldHealth(0)
        player.GetTitanSoul().SetShieldHealthMax(0) //left
    }
}

void function DeD8standblood(entity player)         //DeD8
{
    thread DeD8standbloodthread(player)
}

void function DeD8standbloodthread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 98){
            break
        }
        else{
            vector oldpos = player.GetOrigin()
            wait 1
            if(IsValid(player) && IsAlive(player)){
                vector newpos = player.GetOrigin()
                if(oldpos == newpos){
                    if(player.IsTitan())
                    player.TakeDamage( 200 ,player ,null, {damageSourceId = eDamageSourceId.burn})
                }
            }


        }


    }
}


void function DeD9doomdie(entity player, entity attacker , var damageInfo)   //DeD9
{
    if(GetDoomedState( player )){
        int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
        int nowplayerhealth = player.GetHealth()
        DamageInfo_SetDamage( damageInfo, nowplayerhealth )
    }
}

void function DeD10reloadweak(entity player, entity attacker , var damageInfo)  //DeD10
{
    foreach ( weapon in player.GetMainWeapons() ){
        if(weapon.IsReloading()){
            DamageInfo_ScaleDamage(damageInfo ,1.5)
		}
    }
}

void function DeD11highhpdown(entity player, entity attacker , var damageInfo)  //DeD11
{
    if(IsValid(player) && IsAlive(player)){
        int playerhealth = player.GetHealth()
        if(IsValid(attacker) && IsAlive(attacker)){
            int atkhealth = attacker.GetHealth()
            if(atkhealth < playerhealth){
                DamageInfo_ScaleDamage(damageInfo , 0.7)
            }
        }
    }
}


void function DeD12slowhitself(entity player, entity attacker , var damageInfo)     //DeD12
{
    if(IsValid(player) && IsAlive(player)){
        StatusEffect_AddTimed( player, eStatusEffect.move_slow, 0.2, 1.1, 0 )
    }
}


void function DeD13drunkdrive(entity player)                //DeD13
{
    thread DeD13drunkdrivethread(player)
}

void function DeD13drunkdrivethread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player) || (debuff != 103))
            break

        if(IsValid(player) && IsAlive(player)){
            float x = RandomFloatRange(0,1)
            float y = RandomFloatRange(0,1)
            float ls = RandomFloatRange(0,1)
            if(ls <=0.5){
                player.SetVelocity(player.GetVelocity() + 1400*<x,y,0> + <0,0,220>)
            }
            else{
                player.SetVelocity(player.GetVelocity() - 1400*<x,y,0> + <0,0,220>)
            }
        }
        wait 5
    }
}

void function DeD14up30(entity player, entity attacker , var damageInfo)  //DeD14
{
    int hitdamage = int(floor(DamageInfo_GetDamage( damageInfo )))
    int realdamage = (hitdamage + 30)
    DamageInfo_SetDamage(damageInfo , realdamage )

}

void function DeD15onlyonedamage(entity player , entity attacker , var damageInfo )   //DeD15
{
    string lastdamageid = expect string(attacker.s.lastdamage)
    if(lastdamageid == "abc"){
        attacker.s.lastdamage <- DamageInfo_GetDamageSourceIdentifier(damageInfo).tostring()
    }
    else if(DamageInfo_GetDamageSourceIdentifier(damageInfo).tostring() != lastdamageid){

        DamageInfo_ScaleDamage(damageInfo , 0.5 )
        SendHudMessage(attacker, "其他種類的傷害,傷害已減半",-1,0.35,222,53,113,1,0,1.5,0)

    }
}

void function DeD16minddamage(entity player)     //Ded16
{
    StatusEffect_AddTimed(player, eStatusEffect.move_slow , 1 , 15 , 0)
    StatusEffect_AddTimed(player, eStatusEffect.turn_slow , 1 , 15 , 0)
    player.Server_TurnDodgeDisabledOn()
    thread DeD16minddamagethread(player)
}

void function DeD16minddamagethread(entity player)
{
    for(int mindtime = 0 ; mindtime < 15 ; ++mindtime){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 106){

            break
        }
        wait 1
    }

    if(IsValid(player) && player.IsTitan()){
        player.Server_TurnDodgeDisabledOff()
    }
}

void function DeD17onlyoneguy(entity player , entity attacker , var damageInfo )   //DeD17
{
    string lastdamageid = expect string(attacker.s.lastdamage)
    if(lastdamageid == "abc"){
        attacker.s.lastdamage <- player.GetPlayerName()
    }
    else if(player.GetPlayerName() != lastdamageid){

        DamageInfo_ScaleDamage(damageInfo , 0.5 )
        SendHudMessage(attacker, "妳必須先擊殺 " + lastdamageid + " ! 傷害已減半！",-1,0.35,222,53,113,1,0,1.5,0)
    }

}

void function DeD18lag(entity player)           //DeD18
{
    thread DeD18thread(player)
}

void function DeD18thread(entity player)
{
    while(true){
        int debuff = expect int(player.s.debuff)
        if(!IsValid(player) || !IsAlive(player)||debuff != 108){
            break
        }
        else{

            vector oldpos = player.GetOrigin()
            wait 2
            if(IsValid(player) && IsAlive(player)){
                int goback = RandomIntRange(10,500)
                if(goback >= 350){
                    player.SetOrigin(oldpos)
                    SendHudMessage(player, "延遲: " + goback,-1,0.35,252,61,74,1,0,1,0)
                }
                else{
                    SendHudMessage(player, "延遲: " + goback,-1,0.35,65,143,31,1,0,1,0)
                }
            }
        }
    }
}

void function DeD19warnent(entity player)       //DeD19
{
    thread  DeD19warnentthread(player)
}

void function  DeD19warnentthread(entity player)
{

    while(true){
        int plbfnum = expect int(player.s.debuff)
        if(!IsValid(player)||!IsAlive(player)||plbfnum != 109)
            break

        if(IsValid(player) && IsAlive(player)){
            vector attackPos = player.GetOrigin()
            vector traceStart = player.EyePosition()
            vector prevViewVec = player.GetPlayerOrNPCViewVector()
            vector preforce = Normalize(prevViewVec)
            vector traceEnd = traceStart + ( preforce*15000 )
            entity target = TraceLine(traceStart,traceEnd,player, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE).hitEnt
            if(target != null){
                if(target.IsTitan()&&target.IsPlayer()&&target.GetTeam() != player.GetTeam()){
                    SendHudMessage(target, "有人瞄准你了",-1,0.65,248,202,36,1,0,0.5,0)

                }

            }
        }
        wait 0.5
    }

}



void function rougeconfirm(entity player)
{
    if(IsAlive(player)){
        player.s.hasbuff <- true
        SendHudMessageBuilder(player, "buff:done!", 180,110,102)
        player.s.hasapplybuff <- true
    }
}


void function rougetest(entity player)
{
    for(;;){

        if(IsValid(player)){

            int Sbuffnum = RandomIntRange(11,19)
            int Abuffnum = RandomIntRange(21,29)
            int Bbuffnum = RandomIntRange(31,39)
            int Cbuffnum = RandomIntRange(41,49)
            int Dbuffnum = RandomIntRange(51,59)
            //SendHudMessageBuilder(player, "S"+Sbuffnum+"||"+"A"+Abuffnum+"||"+"B"+Bbuffnum+"||"+"C"+Cbuffnum+"||"+"D"+Dbuffnum+"||", 238,68,68)
			NSSendAnnouncementMessageToPlayer(player, "S"+Sbuffnum+"||"+"A"+Abuffnum+"||"+"B"+Bbuffnum+"||"+"C"+Cbuffnum+"||"+"D"+Dbuffnum,"", <41,171,224>, 10, 5)




            /*int buff = expect int(player.s.buff)
            int debuff = expect int(player.s.debuff)
            //NSSendLargeMessageToPlayer( player, "buff"+buff , "debuff"+debuff, 10, "rui/callsigns/callsign_48_col" )
            SendHudMessageBuilder(player, "buff:"+buff+"..."+"debuff:"+debuff, 80,210,102)*/
            wait 1
        }

    }




}

void function dieandclearscore (entity hitEnt , var damageInfo)             //S6 针锋相对脉冲刀效果
{
    entity attacker = DamageInfo_GetAttacker(damageInfo)

    if(!attacker.IsPlayer()){
        if(IsValid(hitEnt) && IsAlive(hitEnt))
        hitEnt.Die()
    }
    else{
        int atkdbf = expect int(attacker.s.debuff)
            if(IsValid(attacker) && IsAlive(attacker)){
                string attackerName = attacker.GetPlayerName()
                if(hitEnt.IsPlayer()){
                    if(atkdbf == 16){
                        if(IsValid(hitEnt) && IsAlive(hitEnt)){

                            hitEnt.Die(attacker,null, {damageSourceId = eDamageSourceId.mp_weapon_grenade_sonar})    //直接秒杀

                            entity grenadeweap = attacker.GetOffhandWeapon( OFFHAND_LEFT )
                            if( IsValid( grenadeweap ) )
                            {
                                int weaponMax = grenadeweap.GetWeaponPrimaryClipCountMax()
                                int ammo = grenadeweap.GetWeaponPrimaryClipCount()
                                if ( ammo < weaponMax )
                                    grenadeweap.SetWeaponPrimaryClipCount( weaponMax )
                            }

                            hitEnt.SetPlayerGameStat( PGS_ASSAULT_SCORE, 0)
                            NSSendAnnouncementMessageToPlayer(hitEnt, "破產！","妳的分數已被 "+attackerName+" 重置!", <228,55,66>, 10, 5)

                            EmitSoundOnEntityOnlyToPlayer( hitEnt, hitEnt, "UI_InGame_MarkedForDeath_PlayerMarked" )


                            if(IsValid(attacker)&&IsAlive(attacker)){
                                attacker.Die(attacker,null, {damageSourceId = eDamageSourceId.mp_weapon_grenade_sonar})    //直接秒杀
                                attacker.SetPlayerGameStat( PGS_ASSAULT_SCORE, 0)
                                NSSendAnnouncementMessageToPlayer(attacker, "破產！","妳的分數已被 妳自己 重置!", <228,55,66>, 10, 5)

                                EmitSoundOnEntityOnlyToPlayer( attacker, attacker, "UI_InGame_MarkedForDeath_PlayerMarked" )
                            }
                        }
                    }
                    else if(atkdbf == 19){
                        if(IsValid(hitEnt) && IsAlive(hitEnt)){
                            hitEnt.GetTitanSoul().SetShieldHealth(0)
                        }
                    }
                    else{
                        if(IsValid(hitEnt) && IsAlive(hitEnt)){

                            hitEnt.Die(attacker,null, {damageSourceId = eDamageSourceId.mp_weapon_grenade_sonar})    //直接秒杀
                            hitEnt.SetPlayerGameStat( PGS_ASSAULT_SCORE, 0)
                            NSSendAnnouncementMessageToPlayer(hitEnt, "破產！","妳的分數已被 "+attackerName+" 重置!", <228,55,66>, 10, 5)

                            EmitSoundOnEntityOnlyToPlayer( hitEnt, hitEnt, "UI_InGame_MarkedForDeath_PlayerMarked" )
                        }
                    }



                }
                else{
                    if(IsValid(hitEnt) && IsAlive(hitEnt))
                    hitEnt.Die(attacker,null, {damageSourceId = eDamageSourceId.mp_weapon_grenade_sonar})    //直接秒杀
                }

            }



    }



}

void function nomove(entity player ,var damageInfo)         //A8
{
    entity attacker = DamageInfo_GetAttacker(damageInfo)
    if(IsValid(attacker) && attacker.IsPlayer()){
        int atkbf = expect int(attacker.s.buff)
        if(atkbf == 39){
            if(IsValid(player)&&IsAlive(player)){
                if(player.GetTeam() != attacker.GetTeam()){
                    StatusEffect_AddTimed(player,eStatusEffect.move_slow ,1,10,0)
                    player.SetVelocity(<0,0,0>)
                }
            }
        }
    }


}

void function OnPilotDeath(entity player , var damageInfo )         //死亡清除buff和buff标记
{
    if(expect int(player.s.debuff) == 11){
        ScreenFade( player, 0, 0, 0, 255, 0.1, 0.1, FFADE_IN  )
    }
    player.kv.gravity = 1

    player.s.hasbuff <- false
    player.s.hasapplybuff <- false

    player.s.hashitenemy <- false
    player.s.hasdo3075 <- false
    player.s.damagetimes <- 1.0
    //player.s.hashide <- false
    player.Server_TurnDodgeDisabledOff()
    player.s.hasshowbuff <- false
    player.s.hasshowbuffmessage <- false
    player.s.hascoreheal <- false
    player.s.firecount <- 100.0
    player.s.storedamage <- 0
    player.s.kicktime <- 0
    player.s.evil <- 0
    player.s.misschance <- 0
    player.s.inhurt <- false
    player.s.killcount <- 0
    player.s.canattack <- 1
    player.s.lastdamageint <- 0.0
    player.s.doomer <- false
    player.s.sucess <- 0
    player.s.fail <- 0
    player.s.haslink <- false
    player.s.Selfdestorytime <- 0

    player.s.denfencefloat <- 1.0
    player.s.lastdamage <- "abc"

    player.s.hitcount <- 0
    player.SetGroundFrictionScale(1)

    entity attacker = DamageInfo_GetAttacker(damageInfo)
    int pldebuffnum = expect int(player.s.debuff)
    if(pldebuffnum == 37){      //DeA7

        NSSendAnnouncementMessageToPlayer(player, "分數已被DeBuff重置!","", <28,215,96>, 10, 5)

        player.SetPlayerGameStat( PGS_ASSAULT_SCORE,0)

    }
    else if(pldebuffnum == 22){
        if(IsValid(attacker) && attacker.IsPlayer() && (attacker != player)){
            int s = RandomIntRangeInclusive(1,8)
            if(s == 1){
                attacker.s.buff <- 25
            }
            else if(s == 2){
                attacker.s.buff <- 13
            }
            else if(s == 3){
                attacker.s.buff <- 14
            }
            else if(s == 4){
                attacker.s.buff <- 15
            }
            else if(s == 5){
                attacker.s.buff <- 17
            }
            else if(s == 6){
                attacker.s.buff <- 18
            }
            else if(s == 7){
                attacker.s.buff <- 19
            }
            else if(s == 8){
                attacker.s.buff <- 20
            }
            SendHudMessage(attacker, "獲得S級buff！",-1,0.65,251,62,28,1,0,3,0)

        }
    }

    if(attacker.IsPlayer()){
        if(IsAlive(attacker)){
            int atdebuffnum = expect int(attacker.s.debuff)
            int atbuffnum = expect int(attacker.s.buff)
            if(atbuffnum == 44){            //A14
                entity grenadeweap = attacker.GetOffhandWeapon( OFFHAND_SPECIAL )     //left
                if( IsValid( grenadeweap ) )
                {
                    int weaponMax = grenadeweap.GetWeaponPrimaryClipCountMax()
                    int ammo = grenadeweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        grenadeweap.SetWeaponPrimaryClipCount( weaponMax )
                }

                entity ordweap = attacker.GetOffhandWeapon( OFFHAND_ORDNANCE )        //Q
                if( IsValid( ordweap ) )
                {
                    int weaponMax = ordweap.GetWeaponPrimaryClipCountMax()
                    int ammo = ordweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        ordweap.SetWeaponPrimaryClipCount( weaponMax )
                }

                entity Gweap = attacker.GetOffhandWeapon( OFFHAND_TITAN_CENTER )      //G
                if( IsValid( Gweap ) )
                {
                    int weaponMax = Gweap.GetWeaponPrimaryClipCountMax()
                    int ammo = Gweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        Gweap.SetWeaponPrimaryClipCount( weaponMax )
                }
                PlayerEarnMeter_AddOwnedFrac( attacker, 1 )
                StatusEffect_AddTimed( attacker, eStatusEffect.speed_boost, 1.0, 10, 0 )
                StatusEffect_AddTimed( attacker, eStatusEffect.stim_visual_effect ,1,10,1)
            }
            else if(atbuffnum == 105){
                int killcount = (expect int(attacker.s.killcount)) + 1
                attacker.s.killcount <- killcount

                if(killcount == 1){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "一破，臥龍出山！",attacker.GetPlayerName()+" 一殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 2){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "雙連，一戰成名！",attacker.GetPlayerName()+" 雙殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 3){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "三連，舉世皆驚！",attacker.GetPlayerName()+" 三殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 4){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "四連，天下無敵！",attacker.GetPlayerName()+" 四殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount > 4){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, killcount+" 連，諸天滅地！",attacker.GetPlayerName()+" 無人能擋", <15,144,199>, 1, 6)
                        }
                    }
                }

            }


            if(atdebuffnum == 13){          //DeA3
                if(IsValid(attacker) && IsAlive(attacker)){

                    if(atbuffnum != 15){
                        attacker.TakeDamage( attacker.GetHealth()/2 , attacker ,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else{

                        if(attacker.GetHealth() >= 1000){

                            attacker.SetHealth(maxint(0,(attacker.GetHealth()/2)))
                        }
                        else{
                            if(IsValid(attacker)&& IsAlive(attacker)){

                                attacker.Die()
                            }
                        }

                    }

                }
            }
            else if((atdebuffnum == 17) || (atdebuffnum == 18)){

                if(attacker.IsPlayer()){
                    NSSendAnnouncementMessageToPlayer(attacker, "妳為自己贏得了一些時間。。。"," 繼續掙紮吧", <15,144,199>, 3, 5)

                    attacker.s.kicktime <- 0
                }

            }
            else if(atdebuffnum == 38){             //DeA8
                if(IsValid(attacker) && IsAlive(attacker)){
                    if(atbuffnum != 15){
                        attacker.TakeDamage( 1500 , attacker ,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else{
                        if(attacker.GetHealth()>=2500){
                            attacker.SetHealth(maxint(0,(attacker.GetHealth()-1500)))
                        }
                        else{
                            if(IsValid(attacker)&& IsAlive(attacker)){

                                attacker.Die()
                            }
                        }
                    }
                }
            }
            else if(atdebuffnum == 72){         //DeC2
                    if(IsValid(attacker) && IsAlive(attacker)){
			            StatusEffect_AddTimed( attacker, eStatusEffect.sonar_detected, 1.0, 20, 20 )
                }
            }
            else if(atdebuffnum == 74){         //DeC4
                thread DeC4thread(attacker)
            }
            else if(atdebuffnum == 21){
                float fire = (expect int(attacker.s.firecount))*2.0
                attacker.s.firecount <- fire
            }
            else if(atdebuffnum == 85){
                float damagetimes = expect float(attacker.s.damagetimes)
                attacker.s.damagetimes <- damagetimes*0.9
            }
            else if(atdebuffnum == 107){
                string tarname = expect string(attacker.s.lastdamage)
                if(player.GetPlayerName() == tarname){
                    attacker.s.lastdamage <- "abc"
                }
            }


        }
    }

    foreach(entplayer in GetPlayerArrayOfTeam( player.GetTeam())){          //DeS10
        if(IsValid(entplayer)&&IsAlive(entplayer)){
            int entdebuffnum = expect int(entplayer.s.debuff)
            if(entdebuffnum == 20){
                int death = RandomIntRangeInclusive(1,100)
                if(death <= 30){
                    entplayer.Die()
                }
            }
        }
    }

    foreach(entplayer in GetPlayerArray()){         //B19
        if(IsValid(entplayer)&&IsAlive(entplayer)){
            int entbuffnum = expect int(entplayer.s.buff)
            if(entbuffnum == 69){
                if(Distance2D(player.GetOrigin()  , entplayer.GetOrigin()) <= 2500){
                    entplayer.SetHealth(minint((entplayer.GetHealth() + 1000) , entplayer.GetMaxHealth() ))
                    EmitSoundOnEntityOnlyToPlayer( entplayer ,entplayer , "UI_TitanBattery_Titan_PickUp" )

                }
            }
        }
    }

    player.s.buff <- 0
    player.s.debuff <- 0

}

void function OnPilotsTitanDeath(entity titan , var damageInfo )         //死亡清除buff和buff标记
{
    if(!IsPetTitan( titan ))
        return

    entity player = titan.GetBossPlayer()
    if(!IsValid(player))
        return

    if(expect int(player.s.debuff) == 11){
        ScreenFade( player, 0, 0, 0, 255, 0.1, 0.1, FFADE_IN  )
    }
    player.kv.gravity = 1

    player.s.hasbuff <- false
    player.s.hasapplybuff <- false

    player.s.hashitenemy <- false
    player.s.hasdo3075 <- false
    player.s.damagetimes <- 1.0
    //player.s.hashide <- false
    player.Server_TurnDodgeDisabledOff()
    player.s.hasshowbuff <- false
    player.s.hasshowbuffmessage <- false
    player.s.hascoreheal <- false
    player.s.firecount <- 100.0
    player.s.storedamage <- 0
    player.s.kicktime <- 0
    player.s.evil <- 0
    player.s.misschance <- 0
    player.s.inhurt <- false
    player.s.killcount <- 0
    player.s.canattack <- 1
    player.s.lastdamageint <- 0.0
    player.s.doomer <- false
    player.s.sucess <- 0
    player.s.fail <- 0
    player.s.haslink <- false
    player.s.Selfdestorytime <- 0

    player.s.denfencefloat <- 1.0
    player.s.lastdamage <- "abc"

    player.s.hitcount <- 0
    player.SetGroundFrictionScale(1)

    entity attacker = DamageInfo_GetAttacker(damageInfo)


    int pldebuffnum = expect int(player.s.debuff)




    foreach(entplayer in GetPlayerArrayOfTeam( player.GetTeam())){          //DeS10
        if(IsValid(entplayer)&&IsAlive(entplayer)){
            int entdebuffnum = expect int(entplayer.s.debuff)
            if(entdebuffnum == 20){
                int death = RandomIntRangeInclusive(1,100)
                if(death <= 30){
                    entplayer.Die()
                }
            }
        }
    }

    foreach(entplayer in GetPlayerArray()){         //B19
        if(IsValid(entplayer)&&IsAlive(entplayer)){
            int entbuffnum = expect int(entplayer.s.buff)
            if(entbuffnum == 69){
                if(Distance2D(player.GetOrigin()  , entplayer.GetOrigin()) <= 2500){
                    entplayer.SetHealth(minint((entplayer.GetHealth() + 1000) , entplayer.GetMaxHealth() ))
                    EmitSoundOnEntityOnlyToPlayer( entplayer ,entplayer , "UI_TitanBattery_Titan_PickUp" )

                }
            }
        }
    }

    player.s.buff <- 0
    player.s.debuff <- 0

}

void function rouge( entity player )                    //抽卡
{


    if(!IsAlive(player))
        return
    if(!player.IsTitan()){
       // NSSendLargeMessageToPlayer( player, "上泰坦" , "上泰坦", 10, "rui/callsigns/callsign_48_col" )
        SendHudMessage(player, "只有泰坦才可以获得Buff",-1,0.65,248,202,36,1,0,1.0,0)
        return
    }


    entity activeweapon = player.GetActiveWeapon()
    if(IsValid(activeweapon)){
        string weaponname = activeweapon.GetWeaponClassName()
        if(weaponname == "mp_titanability_rearm"){
            return
        }
    }


    //if(player.s.hasapplybuff)
       // return

    if(!player.s.hasbuff){                              //若没有buff
        if(false){
            int buffnum = RandomIntRangeInclusive(11,SranklastedNumb)         //11-19为S级buff
            player.s.buff <- buffnum                    //赋予buff
            player.s.buffoutput <- buffnum                    //赋予buff
            GiveDebuff(player)
            EmitSoundOnEntityOnlyToPlayer( player, player, "UI_InGame_HalftimeText_Enter" )
        }
        else{
            float bufffloat = RandomFloatRange( 1 , 100 )            //测试    正式为1到100
            if(bufffloat <= 8 ){

                int buffnum = RandomIntRangeInclusive(11,SranklastedNumb)         //11-19为S级buff
                player.s.buff <- buffnum                    //赋予buff
                player.s.buffoutput <- buffnum                    //赋予buff
                GiveDebuff(player)
                EmitSoundOnEntityOnlyToPlayer( player, player, "UI_InGame_HalftimeText_Enter" )

            }
            else if(bufffloat <= 28){

                int buffnum = RandomIntRangeInclusive(31,AranklastedNumb)         //21-29为A级buff
                player.s.buff <- buffnum                    //赋予buff
                player.s.buffoutput <- buffnum                    //赋予buff
                GiveDebuff(player)
                EmitSoundOnEntityOnlyToPlayer( player,player, "EnergySyphon_ShieldRecieved" )
            }
            else if(bufffloat <= 60){

                int buffnum = RandomIntRangeInclusive(51,BranklastedNumb)         //31-39为B级buff
                player.s.buff <- buffnum                    //赋予buff
                player.s.buffoutput <- buffnum                    //赋予buff
                GiveDebuff(player)
                EmitSoundOnEntityOnlyToPlayer( player,player, "EnergySyphon_ShieldRecieved" )
            }

            //测试   不抽B以下
            else if(bufffloat <= 86){

                int buffnum = RandomIntRangeInclusive(71,CranklastedNumb)         //41-49为C级buff
                player.s.buff <- buffnum                    //赋予buff
                player.s.buffoutput <- buffnum                    //赋予buff
                GiveDebuff(player)
                EmitSoundOnEntityOnlyToPlayer( player,player, "EnergySyphon_ShieldRecieved" )
            }
            else if(bufffloat <= 100){

                int buffnum = RandomIntRangeInclusive(91,DranklastedNumb)         //41-47为D级buff
                player.s.buff <- buffnum                    //赋予buff
                player.s.buffoutput <- buffnum                    //赋予buff
                GiveDebuff(player)
                EmitSoundOnEntityOnlyToPlayer( player,player, "EnergySyphon_ShieldRecieved" )
            }
        }

    }

    player.s.hasbuff <- true


    if(!player.s.hasapplybuff){
        applybuff(player)
    }

}

void function GiveDebuff (entity player)
{
    int buffnum = expect int(player.s.buff)
    //return
    if(buffnum <= 89){
        int debuffnum = RandomIntRangeInclusive( buffnum+19 , 109)    //抽到Sdebuff         Debuff等级不再关联buff等级
        player.s.debuff <- debuffnum                //赋予buff
        player.s.debuffoutput <- debuffnum                    //赋予buff
    }
    else{
        int debuffnum = RandomIntRangeInclusive( 89 , 109)    //抽到Sdebuff         Debuff等级不再关联buff等级
        player.s.debuff <- debuffnum                //赋予buff
        player.s.debuffoutput <- debuffnum                    //赋予buff
    }



   /* if(buffnum <= 30){                                  //有Sbuff的话

        int debuffint = RandomIntRangeInclusive(1 , 100)
        if(debuffint <= 98){

            int debuffnum = RandomIntRangeInclusive( 11 , DeSranklastedNumb)    //抽到Sdebuff
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 100){

            int debuffnum = RandomIntRangeInclusive( 31 , DeAranklastedNumb)    //抽到Adebuff
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }

    }
    else if(buffnum <= 50){                             //有A级buff的话

        int debuffint = RandomIntRangeInclusive(1 , 100)
        if(debuffint <= 90){

            int debuffnum = RandomIntRangeInclusive( 31 , DeAranklastedNumb )    //抽到Adebuff  同级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 98){

            int debuffnum = RandomIntRangeInclusive( 11 , DeSranklastedNumb )    //抽到Sdebuff 更高级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 100){

            int debuffnum = RandomIntRangeInclusive( 51 , DeBranklastedNumb )    //抽到Bdebuff 更低级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }

    }
    else if(buffnum <= 70){                             //有B级buff的话

        int debuffint = RandomIntRangeInclusive(1 , 100)
        if(debuffint <= 90){

            int debuffnum = RandomIntRangeInclusive( 51 , DeBranklastedNumb )    //抽到Bdebuff  同级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 98){

            int debuffnum = RandomIntRangeInclusive( 31 , DeAranklastedNumb )    //抽到Adebuff 更高级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 100){

            int debuffnum = RandomIntRangeInclusive( 71 , DeCranklastedNumb )    //抽到Cdebuff 更低级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }

    }
    else if(buffnum <= 90){                             //有C级buff的话

        int debuffint = RandomIntRangeInclusive(1 , 100)
        if(debuffint <= 90){

            int debuffnum = RandomIntRangeInclusive( 71 , DeCranklastedNumb )    //抽到Cdebuff  同级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 98){

            int debuffnum = RandomIntRangeInclusive( 51 , DeBranklastedNumb )    //抽到Bdebuff 更高级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }
        else if(debuffint <= 100){

            int debuffnum = RandomIntRangeInclusive( 91 , DeDranklastedNumb )    //抽到Ddebuff 更低级
            player.s.debuff <- debuffnum                //赋予buff
            player.s.debuffoutput <- debuffnum                    //赋予buff

        }

    }
    else if(buffnum <= 110){                             //有D级buff的话

        int debuffnum = RandomIntRangeInclusive( 91 , DeDranklastedNumb )    //抽到Ddebuff  同级
        player.s.debuff <- debuffnum                //赋予buff
        player.s.debuffoutput <- debuffnum                    //赋予buff

    }*/

}

void function applybuff( entity player )
{
    array <void functionref(entity)> applybufflist = [          //触发类buff 含线程

        noneeffect,  //0

        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect, //10
               ///////////////////////////////////////////S(11-30)/////////////////////////////////////////
        S1andA1debuff,//11
        S2healplayer,          //S2
        S3Hide,               //S3
        noneeffect,
        noneeffect,
        S6zfxd,                //S6
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect, //20

        S11knock,   //S11
        S12phasesword,   //S12
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,             //30
  //////////////////////A(31-50)/////////////////////////////
        S1andA1debuff,
        noneeffect,
        A3hptimes,             //A3
        A4infammo,             //A4
        A5infcore,             //A5
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,     //40

        noneeffect,
        noneeffect,
        noneeffect,
        A14morecore,
        noneeffect,
        noneeffect,
        A17lasercoreex,
        A18flamecoreex,
        A19salvocoreex,

        noneeffect,             //50
            ////////////////////////////B(51-70)/////////////////////////////////
        B1doublespeed,            //B1
        B2reaper,                  //B2
        B3atkfastfill,                 //B3
        noneeffect,
        B5deffastfill,                 //B5
        noneeffect,
        B7Gfastfill,                 //B7
        noneeffect,
        noneeffect,

        noneeffect,    //60

        A11330damageeffect,   //B11
        noneeffect           //B12
        noneeffect,
        noneeffect,
        noneeffect,    //B15onlycore,         //B15   四核心  删除
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,     //70
                    //////////////////////C(71-90)//////////////////////////////////
        C1coreready,                 //C1
        C2shieldready,                 //C2
        C3empgrenade,                 //C3
        noneeffect,
        C5cloaks,                 //C5
        noneeffect,
        C7nuclear,                 //C7
        C8sniper,                 //C8
        noneeffect,

        C10doomheal,     //80   //C10

        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        C15enderman,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,     //90
            /////////////////////////////////D(91-110)//////////////////////
        D1core50,                //D1
        D2sword,                 //D2
        noneeffect,
        noneeffect,
        noneeffect,
        D6shield50,                 //D6
        D7soldier,                 //D7
        D8tick,                 //D8
        D9stim,                 //D9

        D10coreheal, //100

        noneeffect,
        D12steelcrow,           //D12
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,     //110

    ]

    array <void functionref(entity)> applydebufflist = [

        noneeffect,     //0

        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        noneeffect,     //10
            ////////////////////////////////////DeS(11-30)////////////////////////////////////
        DES1blind,                   //DeS1
        DeS2rehealplayer,          //DeS2
        noneeffect,
        noneeffect,
        DeS5cantmove,                 //DeS5
        noneeffect,
        DeS7kick,                 //DeS7
        DeS8death,                 //DeS8
        noneeffect,

        noneeffect,     //20

        DeS11deathfire,     //DeS11
        DeS12mark,      //des12
        DeS13loweffect,         //DeS13
        noneeffect,
        noneeffect,
        DeS16randomlift,            //DeS16
        DeS17doomnow,                  //DeS17
        DeS18lookotherway,
        noneeffect,

        noneeffect,//30
        ////////////////////////////////////////DeA(31-50)/////////////////////////////////////////////
        noneeffect,
        noneeffect,
        DeA3lesshealth,                 //DeA3
        noneeffect,
        DeA5harfspeed,                 //DeA5
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,

        DeA10moveblood,     //40        //DeA10

        noneeffect,
        noneeffect,
        DeA13corekill,              //DeA13
        noneeffect,
        noneeffect,
        DeA16errorpression,         //DeA16
        noneeffect,
        DeA18randombloodpre,
        DeA19relink,

        noneeffect,//50
            ////////////////////////////////////////DeB(51-70)//////////////////////////////////
        DeB1emplot,                 //DeB1
        DeB2lessammo,                 //DeB2
        noneeffect,
        DeB4halfhealth,                 //DeB4
        DeB5sonar,                 //DeB5
        DeB6takeright,                 //DeB6
        DeB7takeleft,                 //DeB7
        DeB8takeG,                 //DeB8
        noneeffect,

        noneeffect,     //60

        DeB11shieldslow,            //DeB11
        noneeffect,
        DeB13flipman,                //DeB13
        noneeffect,
        DeB15slowreload,
        noneeffect,
        DeB17therecantstopcar,       //DeB17
        noneeffect,
        DeB19up,            //DeB19

        noneeffect,     //70
        ////////////////////////////////////DeC(71-90)//////////////////////////////////
        DeC170speed,                 //DeC1
        noneeffect,
        DeC370turn,                 //DeC3
        noneeffect,
        DeC5nododge,                 //DeC5
        noneeffect,
        DeC7t203,                 //DeC7
        DeC8sunburn,                 //DeC8
        DeC9emplot,                 //DeC9

        DeC10doomreheal,     //80       //DeC10

        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        DeC16lostfocus,         //Dec16
        noneeffect,
        noneeffect,
        DeC19attackback,        //Dec19

        noneeffect,     //90
        ////////////////////////////////DeD(91-110)////////////////////////
        DeD1takeF,                 //DeD1
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        noneeffect,
        DeD7noshield,                 //DeD7
        DeD8standblood,                 //DeD8
        noneeffect,

        noneeffect, //100

        noneeffect,
        noneeffect,
        DeD13drunkdrive,            //DeD13
        noneeffect,
        noneeffect,
        DeD16minddamage,               //Ded16
        noneeffect,
        DeD18lag,               //DeD18
        DeD19warnent,           //Ded19

        noneeffect,
    ]

    int playerbuffnum = expect int(player.s.buff)
    int playerdebuffnum = expect int(player.s.debuff)
    applybufflist[playerbuffnum](player)
    applydebufflist[playerdebuffnum](player)

	EmitSoundOnEntityOnlyToPlayer( player,player, "lstar_dryfire" )



    if(IsValid(player) && IsAlive(player)){

        player.s.hasapplybuff <- true                            //标记为已有buff
    }

    if(playerdebuffnum != 13){
        player.Show()
    }


}

void function Shanghaixiuzhenglei(entity player , var damageInfo )
{
    array <void functionref(entity,entity,var)> plydamagebufflist = [       //对被攻击者的修正buff

        noeffect,//0

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//10
            ////////////////////////////S(11-30)////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        S5onlycrit,                 //S5
        noeffect,
        noeffect,
        S8turrt,                    //S8
        noeffect,

        S10canttouch,//20         //S10

        noeffect,
        noeffect,
        S13phaseescape,
        S14hitbackmore,
        S15nohurt,
        noeffect,
        S17doomer,
        S18doomonlymelee,
        noeffect,

        noeffect,   //30
            ////////////////////////A(31-50)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        A10ice,  //40       //A10

        B11explodehit,  //B11
        A12healandhit,  //A12
        A13lowerandlower,
        noeffect,
        A15reloaddef,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//50
            ////////////////////////B(51-70)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        B16hitback1,        //B16
        noeffect,
        noeffect,
        noeffect,

        noeffect,//70
        ////////////////////////C(71-90)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//80

        C11damagetocore,  //C11
        noeffect,
        C13oldman,          //C13
        C14miracle,
        noeffect,
        noeffect,
        C17max150,          //C17
        noeffect,
        noeffect,

        noeffect,//90
        ////////////////////////D(91-110)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//100

        D11coreblockdamage,  //D11
        noeffect,
        D13seven,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//110

    ]

     array <void functionref(entity,entity,var)> atkdamagebufflist = [      //攻击者的修正  buff

        noeffect,//0

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//10
            ////////////////////////////S(11-30)////////////////////////////
        S1kill,                 //S1
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        S7losthit,               //S7
        noeffect,
        S9blood,               //S9

        noeffect,

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        S17doomatk,
        noeffect,
        S19doginwater,

        noeffect,   //30
             ////////////////////////A(31-50)////////////////////////
        A1superone,             //A1
        A2damageup,             //A2
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        A7anyknock,             //A7
        noeffect,
        noeffect,

        noeffect, //40       //A10

        noeffect,
        A12healandhit2,         //A12
        noeffect,
        noeffect,
        noeffect,
        A16reloadatk,           //A16
        noeffect,
        noeffect,
        noeffect,

        noeffect,//50
        ////////////////////////B(51-70)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        B4healfriend,           //B4
        noeffect,
        B6supercrit,            //B6
        noeffect,
        B8halfupdamage,             //B8
        B9distens,                //B9

        B10lonely,//60              //B10

        A11damagedamage,  //A11
        B12superhero,           //B12
        B13healself,            //B13
        B14hitfour,             //B14
        noeffect,
        B16hitback2,            //B16
        noeffect,       //B17leveldamage,         //B17删除
        noeffect,
        noeffect,

        noeffect,//70
                ////////////////////////C(71-90)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        C43075hit,                  //C4
        noeffect,
        C6doomslayer,                       //C6
        noeffect,
        noeffect,
        noeffect,

        noeffect,//80

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        C18meleekick,
        C19spadd2,      //C19

        noeffect,//90
        ////////////////////////D(91-110)////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//100

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect ,    //D16scorethief,          //D16   偷分，删除
        noeffect,
        noeffect,
        D19fakescore,           //D19

        noeffect,//110

    ]

    array <void functionref(entity,entity,var)> plydamagedebufflist = [         //被记者的修正  debuff

        noeffect,//0

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//10
                     //////////////////////////////////DeS(11-30)/////////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        DeS4deathone,                   //DeS4
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//20

        noeffect,
        noeffect,
        noeffect,
        DeS14nonumberanymore,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//30
                /////////////////////////////////DeA(31-50)/////////////////////////////////
        DeA1onehithardtodie,            //DeA1
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeA6weaknessbody,               //DeA6
        noeffect,
        noeffect,
        noeffect,

        noeffect,//40

        DeA11tencrit,                   //DeA11
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeA17hurtadd,           //DeA17
        DeA18beatk,
        noeffect,

        noeffect,//50
            /////////////////////////////////DeB(51-70)/////////////////////////////////
        noeffect,
        noeffect,
        DeB3weaknessbody,               //DeB3
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeB9decrithit,                  //DeB9

        noeffect,

        noeffect,
        noeffect,
        noeffect,
        DeB14evildamagebeattack,        //DeB14
        noeffect,
        noeffect,
        noeffect,
        DeB18gravity,                   //DeB18
        noeffect,

        noeffect,//70
                /////////////////////////////////DeC(71-90)/////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//80

        noeffect,
        DeC12hitselfback,       //DeC12
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeC17hightenemy,        //DeC17
        noeffect,
        noeffect,

        noeffect,//90
                /////////////////////////////////DeD(90-110)/////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeD9doomdie,                //DeD9

        DeD10reloadweak,//100

        noeffect,
        DeD12slowhitself,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//110

    ]

    array <void functionref(entity,entity,var)> atkdamagedebufflist = [     //攻击者修正debuff

        noeffect,//0

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//10
        //////////////////////////////////DeS(11-30)/////////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeS6hitself,            //DeS6
        noeffect,
        noeffect,
        DeS9onlyhitshield,      //DeS9

        noeffect,//20

        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeS15Hand,
        noeffect,
        noeffect,
        noeffect,
        DeS19handfeet,      //DeS19

        noeffect,//30
                /////////////////////////////////DeA(31-50)/////////////////////////////////
        noeffect,
        DeA2weak,               //DeA2
        noeffect,
        DeA4doctor,             //DeA4
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,//40

        noeffect,
        DeA12lostammo,         //DeA12
        noeffect,
        DeA14damagecut80,       //DeA14
        noeffect,       //DeA15lessormore,    尊老爱幼  删除
        noeffect,
        noeffect,
        DeA18atk,
        noeffect,

        noeffect,//50
                /////////////////////////////////DeB(51-70)/////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        DeB10miss,//60

        noeffect,
        DeB12Genlowdamage,
        noeffect,
        DeB14evildamageattack,          //DeB14
        noeffect,
        DeB16betternobodyhere,          //DeB16
        noeffect,
        noeffect,
        noeffect,

        noeffect,//70
                /////////////////////////////////DeC(71-90)/////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        DeC6doomweak,                   //Dec6
        noeffect,
        noeffect,
        noeffect,

        noeffect,//80

        DeC11nocrit,            //DeC11
        noeffect,
        DeC13upanddown,             //DeC13
        DeC14kicksobody,
        DeC15tiredguy,
        noeffect,
        DeC17hightenemyatk,         //DeC17
        DeC18onlyotherguy,          //DeC18
        noeffect,

        noeffect,//90
                /////////////////////////////////DeD(90-110)/////////////////////////////////
        noeffect,
        noeffect,
        noeffect,
        DeD4weaktoshield,           //DeD4
        noeffect,
        noeffect,
        noeffect,
        noeffect,
        noeffect,

        noeffect,

        DeD11highhpdown,        //DeD11
        noeffect,
        noeffect,
        DeD14up30,
        DeD15onlyonedamage,
        noeffect,
        noeffect,       //DeD17onlyoneguy,    DeD17一心一意删除
        noeffect,
        noeffect,

        noeffect,//110

    ]



    entity attacker = DamageInfo_GetAttacker( damageInfo )
    if(  IsValid(attacker) && IsValid(player))
    {

       if(attacker.IsPlayer()&& !player.IsPlayer() )            //玩家攻击npc
       {
         int attackerbuffnum = expect int(attacker.s.buff)
         int attackerdebuffnum = expect int(attacker.s.debuff)
         atkdamagebufflist[attackerbuffnum](player ,attacker , damageInfo )
         atkdamagedebufflist[attackerdebuffnum](player ,attacker , damageInfo)
       }

       if(!attacker.IsPlayer() && player.IsPlayer() )           //npc攻击玩家
       {
        int playerbuffnum = expect int(player.s.buff)
        int playerdebuffnum = expect int(player.s.debuff)
        plydamagebufflist[playerbuffnum](player , attacker , damageInfo)
        plydamagedebufflist[playerdebuffnum](player ,attacker , damageInfo)
       }

        if(attacker.IsPlayer() && player.IsPlayer() )           //玩家攻击玩家
        {
        int attackerbuffnum = expect int(attacker.s.buff)
        int attackerdebuffnum = expect int(attacker.s.debuff)
        int playerbuffnum = expect int(player.s.buff)
        int playerdebuffnum = expect int(player.s.debuff)
        plydamagebufflist[playerbuffnum](player , attacker , damageInfo)
        plydamagedebufflist[playerdebuffnum](player ,attacker , damageInfo)
        atkdamagebufflist[attackerbuffnum](player ,attacker , damageInfo )
        atkdamagedebufflist[attackerdebuffnum](player ,attacker , damageInfo)
        }


    }




}

/*
void function print1(entity player)
{
   float a = GetTitanCoreActiveTime( player )
     string b = a.tostring()
   Chat_ServerPrivateMessage( player, b, false, true )


    /*
    float a = GetTitanCoreDurationFromWeapon( weapon )
    //Chat_ServerPrivateMessage( player, a, false, true )
    string b = a.tostring()
    NSSendAnnouncementMessageToPlayer(player,b,"", <41,171,224>, 10, 5)

}



void function print3(entity player)
{
       Chat_ServerPrivateMessage( player, "of2", false, true )
}

void function print4(entity player)
{
        entity weapon = player.GetOffhandWeapon(OFFHAND_EQUIPMENT)
    if(TitanCoreInUse(player)){
        Chat_ServerPrivateMessage( player, "yes", false, true )
    }
    else{
        Chat_ServerPrivateMessage( player, "oh no", false, true )
    }
}

void function print5(entity player)
{
        Chat_ServerPrivateMessage( player,  "of4", false, true )
}


*/
void function showbuffnum(entity player)
{
    int bun = expect int(player.s.buff)
    int deb = expect int(player.s.debuff)
      Chat_ServerPrivateMessage( player,  "buff"+bun+"|debuff"+deb, false, true )
}

void function GiveRandomCore(entity player )
{
    player.TakeOffhandWeapon(OFFHAND_EQUIPMENT )   //core
    int coreint = RandomIntRangeInclusive(1,4)
    if(coreint == 1){

        player.GiveOffhandWeapon("mp_titancore_flight_core",OFFHAND_EQUIPMENT )// give core

    }
    else if(coreint == 2){

        player.GiveOffhandWeapon("mp_titancore_flame_wave",OFFHAND_EQUIPMENT )// give core

    }
    else if(coreint == 3){

        player.GiveOffhandWeapon("mp_titancore_salvo_core",OFFHAND_EQUIPMENT )// give core

    }
    else if(coreint == 4){

        player.GiveOffhandWeapon("mp_titancore_laser_cannon",OFFHAND_EQUIPMENT )// give core

    }
}



void function knockent(entity hitEnt , var damageInfo)
{
    entity attacker = DamageInfo_GetAttacker(damageInfo)
    if(IsValid(attacker) && IsAlive(attacker)){
        if(IsValid(hitEnt) && IsAlive(hitEnt)){
            if(hitEnt !=attacker){
                vector forcevec = Normalize(hitEnt.GetOrigin() - attacker.GetOrigin())
                float attackerx2 = attacker.GetVelocity().x * attacker.GetVelocity().x
                float attackery2 = attacker.GetVelocity().y * attacker.GetVelocity().y
                float velocityfloat = sqrt(attackerx2 + attackery2)
                hitEnt.SetVelocity(hitEnt.GetVelocity() + 2*<attacker.GetVelocity().x,attacker.GetVelocity().y,0>)
                attacker.SetVelocity(attacker.GetVelocity()/10)

                float damagehit = DamageInfo_GetDamage(damageInfo)
                float damagecount = min(velocityfloat/1.2 , 150000)
                DamageInfo_SetDamage(damageInfo,damagecount)

                EmitSoundOnEntity(hitEnt,"ronin_sword_bullet_impacts" )
                EmitSoundOnEntity(hitEnt,"ronin_sword_bullet_impacts" )
                EmitSoundOnEntity(hitEnt,"ronin_sword_bullet_impacts" )

            }

        }


    }

}

void function OntitanDeath(entity player , var damageInfo)
{

    entity attacker = DamageInfo_GetAttacker(damageInfo)
    if(!IsValid(attacker))
    return

    if(!attacker.IsPlayer())
    return

    if(attacker.IsPlayer()){
        if(IsAlive(attacker)){
            int atdebuffnum = expect int(attacker.s.debuff)
            int atbuffnum = expect int(attacker.s.buff)
            if(atbuffnum == 44){            //A14
                entity grenadeweap = attacker.GetOffhandWeapon( OFFHAND_SPECIAL )     //left
                if( IsValid( grenadeweap ) )
                {
                    int weaponMax = grenadeweap.GetWeaponPrimaryClipCountMax()
                    int ammo = grenadeweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        grenadeweap.SetWeaponPrimaryClipCount( weaponMax )
                }

                entity ordweap = attacker.GetOffhandWeapon( OFFHAND_ORDNANCE )        //Q
                if( IsValid( ordweap ) )
                {
                    int weaponMax = ordweap.GetWeaponPrimaryClipCountMax()
                    int ammo = ordweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        ordweap.SetWeaponPrimaryClipCount( weaponMax )
                }

                entity Gweap = attacker.GetOffhandWeapon( OFFHAND_TITAN_CENTER )      //G
                if( IsValid( Gweap ) )
                {
                    int weaponMax = Gweap.GetWeaponPrimaryClipCountMax()
                    int ammo = Gweap.GetWeaponPrimaryClipCount()
                    if ( ammo < weaponMax )
                        Gweap.SetWeaponPrimaryClipCount( weaponMax )
                }
                PlayerEarnMeter_AddOwnedFrac( attacker, 1 )
                StatusEffect_AddTimed( attacker, eStatusEffect.speed_boost, 1.0, 10, 0 )
                StatusEffect_AddTimed( attacker, eStatusEffect.stim_visual_effect ,1,10,1)
            }
            else if(atbuffnum == 105){
                int killcount = (expect int(attacker.s.killcount)) + 1
                attacker.s.killcount <- killcount

                if(killcount == 1){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "一破，臥龍出山！",attacker.GetPlayerName()+" 一殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 2){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "雙連，一戰成名！",attacker.GetPlayerName()+" 雙殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 3){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "三連，舉世皆驚！",attacker.GetPlayerName()+" 三殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount == 4){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, "四連，天下無敵！",attacker.GetPlayerName()+" 四殺", <15,144,199>, 1, 6)
                        }
                    }
                }
                else if(killcount > 4){
                    foreach(entplayer in GetPlayerArray()){
                        if(IsValid(attacker)){
                            NSSendAnnouncementMessageToPlayer(entplayer, killcount+" 連，諸天滅地！",attacker.GetPlayerName()+" 無人能擋", <15,144,199>, 1, 6)
                        }
                    }
                }

            }


            if(atdebuffnum == 13){          //DeA3
                if(IsValid(attacker) && IsAlive(attacker)){

                    if(atbuffnum != 15){
                        attacker.TakeDamage( attacker.GetHealth()/2 , attacker ,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else{

                        if(attacker.GetHealth() >= 1000){

                            attacker.SetHealth(maxint(0,(attacker.GetHealth()/2)))
                        }
                        else{
                            if(IsValid(attacker)&& IsAlive(attacker)){

                                attacker.Die()
                            }
                        }

                    }

                }
            }
            else if((atdebuffnum == 17) || (atdebuffnum == 18)){

                if(attacker.IsPlayer()){
                    NSSendAnnouncementMessageToPlayer(attacker, "妳為自己贏得了一些時間。。。"," 繼續掙紮吧", <15,144,199>, 3, 5)

                    attacker.s.kicktime <- 0
                }

            }
            else if(atdebuffnum == 38){             //DeA8
                if(IsValid(attacker) && IsAlive(attacker)){
                    if(atbuffnum != 15){
                        attacker.TakeDamage( 1500 , attacker ,null, {damageSourceId = eDamageSourceId.burn})
                    }
                    else{
                        if(attacker.GetHealth()>=2500){
                            attacker.SetHealth(maxint(0,(attacker.GetHealth()-1500)))
                        }
                        else{
                            if(IsValid(attacker)&& IsAlive(attacker)){

                                attacker.Die()
                            }
                        }
                    }
                }
            }
            else if(atdebuffnum == 72){         //DeC2
                    if(IsValid(attacker) && IsAlive(attacker)){
			            StatusEffect_AddTimed( attacker, eStatusEffect.sonar_detected, 1.0, 20, 20 )
                }
            }
            else if(atdebuffnum == 74){         //DeC4
                thread DeC4thread(attacker)
            }
            else if(atdebuffnum == 21){
                float fire = (expect int(attacker.s.firecount))*1.1
                attacker.s.firecount <- fire
            }
            else if(atdebuffnum == 85){
                float damagetimes = expect float(attacker.s.damagetimes)
                attacker.s.damagetimes <- damagetimes*0.9
            }
            /*else if(atdebuffnum == 107){                  //一心一意，删除
                string tarname = expect string(attacker.s.lastdamage)
                if(player.GetPlayerName() == tarname){
                    attacker.s.lastdamage <- "abc"
                }
            }*/


        }
    }


    foreach(entplayer in GetPlayerArray()){         //B19
        if(IsValid(entplayer)&&IsAlive(entplayer)){
            int entbuffnum = expect int(entplayer.s.buff)
            if(entbuffnum == 69){
                if(Distance2D(player.GetOrigin()  , entplayer.GetOrigin()) <= 2500){
                    entplayer.SetHealth(minint((entplayer.GetHealth() + 1000) , entplayer.GetMaxHealth() ))
                    EmitSoundOnEntityOnlyToPlayer( entplayer ,entplayer , "UI_TitanBattery_Titan_PickUp" )

                }
            }
        }
    }



}


var function S13phase( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	//PlayWeaponSound( "fire" )
	entity player = weapon.GetWeaponOwner()

	float shiftTime =  0.5

	if ( IsAlive( player ) )
	{
		if ( PhaseShift( player, 0, shiftTime ) )
		{
			if ( player.IsPlayer() )
			{
				PlayerUsedOffhand( player, weapon )

				#if SERVER
					EmitSoundOnEntityExceptToPlayer( player, player, "Stryder.Dash" )
					thread PhaseDash( weapon, player )
					entity soul = player.GetTitanSoul()
					if ( soul == null )
						soul = player

					float fade = 0.5
					entity Gweapon = player.GetOffhandWeapon(OFFHAND_TITAN_CENTER)
					if(IsValid(Gweapon)){
						if(Gweapon.GetClassName() == "mp_titanability_phase_dash"){
							StatusEffect_AddTimed( soul, eStatusEffect.move_slow, 0.6, shiftTime + fade, fade )
						}
					}

				#elseif CLIENT
					float xAxis = InputGetAxis( ANALOG_LEFT_X )
					float yAxis = InputGetAxis( ANALOG_LEFT_Y ) * -1
					vector angles = player.EyeAngles()
					vector directionForward = GetDirectionFromInput( angles, xAxis, yAxis )
					if ( IsFirstTimePredicted() )
					{
						EmitSoundOnEntity( player, "Stryder.Dash" )
					}
				#endif
			}
		}

	}
	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )
}

void function CreateHolo( entity player, int numberOfDecoysToMake = 1 )
{
	Assert( numberOfDecoysToMake > 0  )
	Assert( player )

	float displacementDistance = 30.0

	bool setOriginAndAngles = numberOfDecoysToMake > 1

	float stickPercentToRun = 0.65
	if ( setOriginAndAngles )
		stickPercentToRun = 0.0

	for( int i = 0; i < numberOfDecoysToMake; ++i )
	{
		entity decoy = player.CreatePlayerDecoy( stickPercentToRun )
		decoy.SetMaxHealth( 50 )
        //decoy.kv.modelscale = 3
		decoy.SetHealth( 50 )
		decoy.EnableAttackableByAI( 50, 0, AI_AP_FLAG_NONE )
		SetObjectCanBeMeleed( decoy, true )
		decoy.SetTimeout( 1.5 )

		if ( setOriginAndAngles )
		{

			vector normalizedAngle = player.GetAngles()
			normalizedAngle.y = AngleNormalize( normalizedAngle.y ) //Only care about changing the yaw
			decoy.SetAngles( normalizedAngle )

			vector forwardVector = AnglesToForward( normalizedAngle )
			forwardVector *= displacementDistance
			decoy.SetOrigin( player.GetOrigin()-<0,0,30>) //Using player origin instead of decoy origin as defensive fix, see bug 223066
			PutEntityInSafeSpot( decoy, player, null, player.GetOrigin(), decoy.GetOrigin()  )
		}

		SetupDecoy_Common( player, decoy )
        //decoy.Freeze()


	}


}

void function addattack(entity player)
{
    if(!IsValid(player) || !IsAlive(player))
    return

    int playerdebuff = expect int(player.s.debuff)
    if(playerdebuff != 25)
    return

    int chance = RandomIntRangeInclusive(0,4)
    if(chance == 0){
        int canattack = minint(((expect int(player.s.canattack)) + 1) , 10 )
        player.s.canattack <- canattack
        SendHudMessage(player, "電量:"+ canattack,-1,0.65,102,203,234,1,0,1,0)
    }
    else{
        int canattack = minint(((expect int(player.s.canattack)) + 1) , 10 )
        SendHudMessage(player, "電量:"+ canattack,-1,0.65,102,203,234,1,0,1,0)
    }

}
/*
void function dumphitent(entity hitEnt , var damageInfo)
{
    if(IsValid(hitEnt) && IsAlive(hitEnt)){
        vector damagepos = DamageInfo_GetDamagePosition( damageInfo )
        thread dumpit(damagepos , hitEnt)
    }

}

void function dumpit(vector damagepos , entity hitEnt)
{
    for(int dumptime = 1 ; dumptime < 40 ;++dumptime){
        if(!IsValid(hitEnt) || !IsAlive(hitEnt))
            break


        vector nowpos = hitEnt.GetOrigin()
        vector vpos = Normalize(damagepos + <0,0,70> - nowpos)
        hitEnt.SetVelocity(hitEnt.GetVelocity() + 120*vpos)
        StatusEffect_AddTimed( hitEnt, eStatusEffect.stim_visual_effect ,1,0.5,0)

        WaitFrame()
    }

}*/

void function slowent(entity hitEnt , var damageInfo)
{
   if(IsValid(hitEnt) && IsAlive(hitEnt)){
        StatusEffect_AddTimed(hitEnt, eStatusEffect.move_slow , 0.6 , 1 , 0)
        //StatusEffect_AddTimed(hitEnt, eStatusEffect.emp, 1,1, 0 )
        StatusEffect_AddTimed(hitEnt, eStatusEffect.turn_slow , 0.5 ,0.5 , 0)

   }
}



