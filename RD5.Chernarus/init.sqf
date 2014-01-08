startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	1;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxHeliCrashes= 2; // Default = 5
MaxVehicleLimit = 50; // Default = 50
MaxDynamicDebris = 100; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30
dayz_maxGlobalZombiesInit = 15; // Default = 15
dayz_maxGlobalZombiesIncrease = 5; // Default = 5
dayz_maxZeds = 400; // Default = 500
dayz_paraSpawn = true;

dayz_sellDistance_vehicle = 15;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 1; // Default: 8
dayz_tameDogs = false;
DynamicVehicleDamageLow = 15; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = false;
DZE_TRADER_SPAWNMODE = false; // true = vehicle will para spawn, false = normal spawn mode
DZE_BuildingLimit = 200; //Max buildings within 30m

//spawnmode
DefaultMagazines = ["ItemBandage","ItemPainkiller"]; 
DefaultWeapons = ["ItemFlashlight","ItemMap"]; 
DefaultBackpack = ""; 
DefaultBackpackWeapon = "";
//spawnmode

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "germandayz\client\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
//call compile preprocessFileLineNumbers "germandayz\client\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
// Missions
//dayz_spaceInterrupt = compile preprocessFileLineNumbers "extras\debug_monitor\dayz_spaceInterrupt.sqf";
execVM "germandayz\side\init.sqf";
if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\rd5.Chernarus\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\mission.sqf";
	_bar = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\barracks.sqf";
	_wka = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\wkamenka.sqf";
	_bike = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\bikes.sqf";
	_gm = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\greenmountain.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};
[] execVM "germandayz\safezone\safezone.sqf";
if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	player_build = compile preprocessFileLineNumbers "germandayz\client\player_build.sqf";
	fnc_usec_selfActions =		compile preprocessFileLineNumbers "germandayz\client\fn_selfActions.sqf";
	fnc_usec_damageActions =	compile preprocessFileLineNumbers "germandayz\client\fn_damageActions.sqf";
	_nul = [] execVM "germandayz\client\dzai_initclient.sqf";
	[] execVM "germandayz\client\kh_actions.sqf"; 
	//anti Hack
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
//	[0,0,true,true,true,58,280,600,[0.698, 0.556, 0.419],"Generator_DZ",0.1] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};
#include "\z\addons\dayz_code\system\REsec.sqf"
//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//RD5
//GD EDITS
dayZ_serverName = "GD-RD5";
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};