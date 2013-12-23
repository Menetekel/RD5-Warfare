/*
	DZAI Server Initialization File
	
	Description: Handles startup process for DZAI. Does not contain any values intended for modification.
	
	Last updated: 2:40 AM 8/18/2013
*/
private ["_startTime"];

if (!isServer || !isNil "DZAI_isActive") exitWith {};
DZAI_isActive = true;

_startTime = diag_tickTime;

//Report DZAI version to RPT log
#include "DZAI_version.hpp"
diag_log format ["Initializing %1 version %2",DZAI_TYPE,DZAI_VERSION];

//Load DZAI variables
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\dzai_config.sqf";

//Load DZAI functions
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\dzai_functions.sqf";

//Load DZAI classname tables
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\world_classname_configs\default\default_classnames.sqf";

//Set internal-use variables
DZAI_weaponGrades = [-1,0,1,2,3];							//All possible weapon grades (does not include custom weapon grades). A "weapon grade" is a tiered classification of gear. 0: Civilian, 1: Military, 2: MilitarySpecial, 3: Heli Crash. Weapon grade also influences the general skill level of the AI unit.
DZAI_numAIUnits = 0;										//Tracks current number of currently active AI units, including dead units waiting for respawn.
DZAI_actDynTrigs = 0;										//Tracks current number of active dynamically-spawned triggers
DZAI_curDynTrigs = 0;										//Tracks current number of inactive dynamically-spawned triggers.
DZAI_actTrigs = 0;											//Tracks current number of active static triggers.	
DZAI_curHeliPatrols = 0;									//Current number of active air patrols
DZAI_curLandPatrols = 0;									//Current number of active land patrols
DZAI_dynTriggerArray = [];									//List of all generated dynamic triggers.
DZAI_respawnQueue = [];										//Queue of AI groups that require respawning. Group ID is removed from queue after it is respawned.
DZAI_gradeIndicesNewbie = [];
DZAI_gradeIndices0 = [];
DZAI_gradeIndices1 = [];
DZAI_gradeIndices2 = [];
DZAI_gradeIndices3 = [];
DZAI_gradeIndicesDyn = [];
DZAI_gradeIndicesHeli = [];
DZAI_dynEquipType = 4;
DZAI_heliEquipType = 5;
DZAI_vehEquipType = 3;

//Set side relations
createcenter east;
createcenter resistance;
if (DZAI_freeForAll) then {
	//Free For All mode - All AI groups are hostile to each other.
	east setFriend [resistance, 0];
	resistance setFriend [east, 0];	
	east setFriend [east, 0];	//East is hostile to self (static and dynamic AI)
} else {
	//Normal settings - All AI groups are friendly to each other.
	east setFriend [resistance, 1];
	resistance setFriend [east, 1];	
};
east setFriend [west, 0];	
resistance setFriend [west, 0];
west setFriend [resistance, 0];
west setFriend [east, 0];

//Detect DayZ mod variant being used.
if (DZAI_modName == "") then {
	private["_modVariant"];
	_modVariant = toLower(getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Detected mod variant %1.",_modVariant];};
	switch (_modVariant) do {
		case "@dayz_epoch":{
			DZAI_modName = "epoch"; 
		};
		case "dayzoverwatch":{DZAI_modName = "overwatch"};
		case "@dayzoverwatch":{DZAI_modName = "overwatch"};
		case "@dayzhuntinggrounds":{DZAI_modName = "huntinggrounds"};
		case "dayzlingor":{
			private["_modCheck"];
			_modCheck = getText (configFile >> "CfgMods" >> "DayZ" >> "action");
			if (_modCheck == "http://www.Skaronator.com") then {DZAI_modName = "lingorskaro"};
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Detected DayZ Lingor variant %1.",_modCheck];};
		};
	};
};

//Create reference marker for dynamic triggers and set default values. These values are modified on a per-map basis.
if ((DZAI_maxHeliPatrols > 0) or (DZAI_maxLandPatrols > 0) or DZAI_dynAISpawns) then {
	DZAI_centerMarker = createMarker ["DZAI_centerMarker", (getMarkerPos 'center')];
	DZAI_centerMarker setMarkerShape "ELLIPSE";
	DZAI_centerMarker setMarkerType "Empty";
	DZAI_centerMarker setMarkerBrush "Solid";
	DZAI_centerMarker setMarkerAlpha 0;
	DZAI_dynTriggerRadius = 600;
	DZAI_dynOverlap = 0.15;
};

//Build weighted gradechances tables
//_nul = [] call compile preprocessFile "\z\addons\dayz_server\DZAI\scripts\buildWeightedTables.sqf";

private["_worldname"];
_worldname=toLower format ["%1",worldName];
diag_log format["[DZAI] Server is running map %1. Loading static trigger and classname configs.",_worldname];

//Load map-specific configuration file. Config files contain trigger/marker information, addition and removal of items/skins, and/or other variable customizations.
//Classname files will overwrite basic settings specified in base_classnames.sqf
if (_worldname in ["chernarus","utes","zargabad","fallujah","takistan","tavi","lingor","namalsk","mbg_celle2","oring","panthera2","isladuala","sara","trinity"]) then {
	call compile preprocessFileLineNumbers format ["\z\addons\dayz_server\DZAI\init\world_classname_configs\%1_classnames.sqf",_worldname];
	[] execVM format ["\z\addons\dayz_server\DZAI\init\world_map_configs\world_%1.sqf",_worldname];
} else {
	"DZAI_centerMarker" setMarkerSize [7000, 7000];
	if (DZAI_modName == "epoch") then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\world_classname_configs\epoch\dayz_epoch.sqf";
	};
	DZAI_newMap = true;
	diag_log "[DZAI] Unrecognized worldname found. Static AI spawns will be generated automatically if enabled.";
};

//Initialize AI settings
if (DZAI_zombieEnemy) then {diag_log "[DZAI] AI to zombie hostility is enabled.";
	if (DZAI_weaponNoise > 0) then {DZAI_zAggro = true; diag_log "[DZAI] Zombie hostility to AI is enabled.";} else {DZAI_zAggro = false;diag_log "[DZAI] Zombie hostility to AI is disabled.";};
} else {diag_log "[DZAI] AI to zombie hostility is disabled.";};
if (isNil "DDOPP_taser_handleHit") then {DZAI_taserAI = false;} else {DZAI_taserAI = true;diag_log "[DZAI] DDOPP Taser Mod detected.";};
[] execVM '\z\addons\dayz_server\DZAI\scripts\DZAI_scheduler.sqf';
diag_log format ["[DZAI] DZAI settings: Debug Level: %1. DebugMarkers: %2. ModName: %3. DZAI_dynamicWeaponList: %4. VerifyTables: %5.",DZAI_debugLevel,DZAI_debugMarkers,DZAI_modName,DZAI_dynamicWeaponList,DZAI_verifyTables];
diag_log format ["[DZAI] AI spawn settings: Static: %1. Dynamic: %2. Air: %3. Land: %4.",DZAI_staticAI,DZAI_dynAISpawns,(DZAI_maxHeliPatrols>0),(DZAI_maxLandPatrols>0)];
diag_log format ["[DZAI] AI behavior settings: DZAI_findKiller: %1. DZAI_tempNVGs: %2. DZAI_weaponNoise: %3. DZAI_zombieEnemy: %4. DZAI_freeForAll: %5.",DZAI_findKiller,DZAI_tempNVGs,DZAI_weaponNoise,DZAI_zombieEnemy,DZAI_freeForAll];
diag_log format ["[DZAI] DZAI loading completed in %1 seconds.",(diag_tickTime - _startTime)];
