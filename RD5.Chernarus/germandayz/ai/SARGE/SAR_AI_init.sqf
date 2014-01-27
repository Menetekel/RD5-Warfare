// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.1.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/index.php?threads/sarge-ai-framework-public-release.8391/
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
// SAR_AI_init.sqf - main init and control file of the framework 
// last modified: 1.4.2013 
// ---------------------------------------------------------------------------------------------------------

private ["_worldname","_startx","_starty","_gridsize_x","_gridsize_y","_gridwidth","_i","_ii","_markername","_triggername","_trig_act_stmnt","_trig_deact_stmnt","_trig_cond","_check","_grp","_script_handler"];

SAR_version = "1.1.0";

// establish PvEH on all clients

if (!isServer) then { // only run this on the connected clients
    
    "adjustrating" addPublicVariableEventHandler {((_this select 1) select 0) addRating ((_this select 1) select 1);	};

}; 


if (elec_stop_exec == 1) exitWith {}; // only run this on the server

diag_log "----------------------------------------";
diag_log format["Starting SAR_AI version %1",SAR_version];
diag_log "----------------------------------------";

// preprocessing relevant scripts

SAR_AI                      = compile preprocessFileLineNumbers "germandayz\ai\SARGE\SAR_setup_AI_patrol.sqf";

// activate functions library

call compile preprocessFileLineNumbers "germandayz\ai\SARGE\SAR_functions.sqf";

// Public Eventhandlers

"doMedicAnim" addPublicVariableEventHandler {((_this select 1) select 0) playActionNow ((_this select 1) select 1);	};

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//
// include user config values
//

#include "SAR_config.sqf"

//
// make some config variables public
//

publicvariable "SAR_surv_kill_value";
publicvariable "SAR_band_kill_value";
publicvariable "SAR_DEBUG";
publicvariable "SAR_EXTREME_DEBUG";
publicvariable "SAR_DETECT_HOSTILE";
publicvariable "SAR_DETECT_INTERVAL";
publicvariable "SAR_HUMANITY_HOSTILE_LIMIT";

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// side definitions
createCenter east;
createCenter resistance;

// unfriendly AI bandits
EAST setFriend [WEST, 0]; 
EAST setFriend [RESISTANCE, 0];

// Players 
WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 1];

// friendly AI 
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 1];

SAR_AI_friendly_side = resistance;
SAR_AI_unfriendly_side = east;

SAR_leader_number = 0;


diag_log format["SAR_AI: Area & Trigger definition Started"];

// Declaring AI monitor array

SAR_AI_monitor = [];

diag_log "Setting up SAR_AI for : ctc.Epoch";
#include "map_config\epoch.sqf"
[] execVM "germandayz\ai\SARGE\SAR_group_monitor.sqf";


//
// initialize the fix for sharing vehicles between survivors and bandits
//

if(SAR_FIX_VEHICLE_ISSUE) then {

    _script_handler = [] execVM "germandayz\ai\SARGE\SAR_vehicle_fix.sqf";
    waitUntil {scriptDone _script_handler};
};
