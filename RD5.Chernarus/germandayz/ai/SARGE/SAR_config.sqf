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
//  UPSMon  (special version, the standard one will NOT work
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
// SAR_config.sqf - User adjustable config values
// last modified:1.4.2013  
// ---------------------------------------------------------------------------------------------------------

// -----------------------------------------------
// enable or disable dynamic grid spawning
// -----------------------------------------------
SAR_dynamic_spawning = false;

// -----------------------------------------------
// default values for dynamic grid spawning
// -----------------------------------------------

// maximum number of groups / grid
SAR_max_grps_bandits = 1;
SAR_max_grps_soldiers = 1;
SAR_max_grps_survivors = 1;

// chance for a group to spawn (1-100)
SAR_chance_bandits = 50;
SAR_chance_soldiers = 30;
SAR_chance_survivors = 50;

// maximum size of group (including Leader)
SAR_max_grpsize_bandits = 3;
SAR_max_grpsize_soldiers = 3;
SAR_max_grpsize_survivors = 3;


// -----------------------------------------------
// run fix for the issue that bandits cant travel in a vehicle with survivors EXPERIMENTAL, might not work 100% DO NOT ENABLE for the time being
// -----------------------------------------------
SAR_FIX_VEHICLE_ISSUE = true;

// -----------------------------------------------
// modify AI behaviour
// -----------------------------------------------

// disable UPSMON AI behaviour - this means there will be no evasive/flanking, AI WILL follow players around the map outside of grids etc. EXPERIMENTAL
SAR_AI_disable_UPSMON_AI = false;

// enable / disable AI stealing vehicles - if you enable this, be sure to check KRON_UPS_searchVehicledist value below
SAR_AI_STEAL_VEHICLE = true;

// -----------------------------------------------
// Humanity values 
// -----------------------------------------------

// Humanity Value that gets substracted for a survivor or soldier AI kill
SAR_surv_kill_value = 500;

// Humanity Value that gets ADDED for a bandit AI kill
SAR_band_kill_value = 25;

// the humanity value below which a player will be considered hostile
SAR_HUMANITY_HOSTILE_LIMIT = -5000;

// -----------------------------------------------
// Track and show AI kills in the debug monitor of the player 
// -----------------------------------------------

// Log AI kills
SAR_log_AI_kills = true;

// -----------------------------------------------
// Special health values for specific units
// -----------------------------------------------

// values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% -  EXPERIMENTAL
SAR_leader_health_factor = 0.5;

// -----------------------------------------------
// respawning of groups & vehicles that are dynamically spawned in the grid system
// -----------------------------------------------
SAR_dynamic_group_respawn = false;

// time after which AI are respawned if configured
SAR_respawn_waittime = 30; // default 30 seconds

// -----------------------------------------------
// Timeout values 
// -----------------------------------------------

// time after which units and groups despawn after players have left the area
SAR_DESPAWN_TIMEOUT = 180; // 3 minutes

// time after which dead AI bodies are deleted
SAR_DELETE_TIMEOUT = 300; // 5 Minutes

// -----------------------------------------------
// System performance 
// -----------------------------------------------

// the max range within AI is detecting Zombies and player bandits and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE = 400;

// the interval in seconds that an AI scans for new hostiles. The lower this value, the more accurate, but your server will see an impact. Recommended value: 15 
SAR_DETECT_INTERVAL = 10;

// -----------------------------------------------
// Debug 
// -----------------------------------------------

// Show AI hits and kills by players 
SAR_HITKILL_DEBUG = false;

// Shows extra debug info in .rpt
SAR_DEBUG = false;

// careful with setting this, this shows a LOT, including the grid properties and definitions for every spawn and despawn event
SAR_EXTREME_DEBUG = false;

//
// SET THIS TO 0 to hide the group markers on the map
//
//1=Enable or 0=disable debug. In debug could see a mark positioning de leader and another mark of the destination of movement, very useful for editing mission
KRON_UPS_Debug = 0;


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Overwriting UPSMON standard values, so they dont have to be changed in the UPSMON package. Be careful with changing these.
//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Efective distance for doing perfect ambush (max distance is this x2)
KRON_UPS_ambushdist = 100;

//Frequency for doing calculations for each squad.
KRON_UPS_Cycle = 15; //org 20 , try to adjust for server performance

//Time that leader waits until doing another movement, this time reduced dynamically under fire, and on new targets
KRON_UPS_react = 10;

//Min time to wait for doing another reaction
KRON_UPS_minreact = 25; // org 30

//Max waiting is the maximum time patrol groups will wait when arrived to target for doing another target.
KRON_UPS_maxwaiting = 30;

// how long AI units should be in alert mode after initially spotting an enemy
KRON_UPS_alerttime = 120;

// how close unit has to be to target to generate a new one target or to enter stealth mode
// SARGE DEBUG CHANGE
KRON_UPS_closeenough = 100; // if you have vast plain areas, increase this to sth around 150-300 

// if you are spotted by AI group, how close the other AI group have to be to You , to be informed about your present position. over this, will lose target
KRON_UPS_sharedist = 200;

// If enabled IA communication between them with radio defined sharedist distance, 0/2 
// (must be set to 2 in order to use reinforcement !R)
KRON_UPS_comradio = 0;

// Distance from destination for searching vehicles. (Search area is about 200m), 
// If your destination point is further than KRON_UPS_searchVehicledist, AI will try to find a vehicle to go there.
KRON_UPS_searchVehicledist = 500; // 700, 900  

//Sides that are enemies of resistance // DO NOT CHANGE THIS
KRON_UPS_Res_enemy = [east];


//
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// definition of classes and weapon loadouts
//

//
// type of soldier lists, only allowed DayZ classes listed. adjust if you run rmod or another map that allows different classes
//
// IMPORTANT: The leader types must be different to each other! So you need 3 different leader types here!

// military AI
SAR_leader_sold_list = ["Rocket_DZ"]; // the potential classes of the leader of a soldier group
SAR_sniper_sold_list = ["Sniper1_DZ"]; // the potential classes of the snipers of a soldier group
SAR_soldier_sold_list = ["Soldier1_DZ","Camo1_DZ"]; // the potential classes of the riflemen of a soldier group

// bandit AI
SAR_leader_band_list = ["TK_INS_Warlord_EP1_DZ","TK_INS_Soldier_EP1_DZ","GUE_Commander_DZ"]; // the potential classes of the leader of a bandit group
SAR_sniper_band_list = ["Sniper1_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ"]; // the potential classes of the snipers of a bandit group
SAR_soldier_band_list = ['Bandit1_DZ', 'BanditW1_DZ',"GUE_Soldier_2_DZ","Ins_Soldier_GL_DZ","FR_Rodriguez_DZ"]; // the potential classes of the bandit of a soldier group

// survivor AI
SAR_leader_surv_list = ["Camo1_DZ","Haris_Press_EP1_DZ","Priest_DZ","SurvivorWcombat_DZ","Soldier_Bodyguard_AA12_PMC_DZ"]; // the potential classes of the leaders of a survivor group
SAR_sniper_surv_list = ["Sniper1_DZ","CZ_Soldier_Sniper_EP1_DZ"]; // the potential classes of the snipers of a survivor group
SAR_soldier_surv_list = ["FR_OHara_DZ","Camo1_DZ","Rocker3_DZ","RU_Policeman_DZ"]; // the potential classes of the riflemen of a soldier group


// ---------------------------------------------------------------------------------------------------------------------
// Skills for all possible units
// ---------------------------------------------------------------------------------------------------------------------

//
// military AI
//

// Leader
SAR_leader_sold_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]

];

// rifleman
SAR_soldier_sold_skills  = [

    ["aimingAccuracy",0.25, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.25, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.55, 0.30],
    ["spotTime",      0.30, 0.20],
    ["endurance",     0.60, 0.20],
    ["courage",       0.60, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.60, 0.20],
    ["general",       0.60, 0.20]

];

// Sniper
SAR_sniper_sold_skills = [

    ["aimingAccuracy",0.80, 0.15], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.70, 0.25],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.75, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.70, 0.20],
    ["general",       0.70, 0.20]

];

//
// bandit AI
//

// Leader
SAR_leader_band_skills = [

    ["aimingAccuracy",0.85, 0.15], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.75, 0.15],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.85, 0.15],
    ["spotTime",      0.80, 0.20],
    ["endurance",     0.75, 0.25],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.75, 0.25],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];
// Rifleman
SAR_soldier_band_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.15],
    ["aimingSpeed",   0.70, 0.30],
    ["spotDistance",  0.80, 0.20],
    ["spotTime",      0.60, 0.20],
    ["endurance",     0.40, 0.40],
    ["courage",       0.40, 0.60],
    ["reloadSpeed",   0.50, 0.40],
    ["commanding",    0.40, 0.40],
    ["general",       0.40, 0.40]

];
// Sniper
SAR_sniper_band_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.85, 0.15],
    ["aimingSpeed",   0.75, 0.25],
    ["spotDistance",  0.75, 0.25],
    ["spotTime",      0.75, 0.25],
    ["endurance",     0.75, 0.20],
    ["courage",       0.75, 0.20],
    ["reloadSpeed",   0.70, 0.30],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]

];

//
// survivor AI
//

// Leader
SAR_leader_surv_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.20],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.75, 0.25],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.40, 0.40],
    ["courage",       0.50, 0.40],
    ["reloadSpeed",   0.60, 0.30],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]

];
// Rifleman
SAR_soldier_surv_skills = [

    ["aimingAccuracy",0.70, 0.25], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.40, 0.25],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.45, 0.30],
    ["spotTime",      0.20, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.40, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.40, 0.20],
    ["general",       0.40, 0.20]

];
// Sniper
SAR_sniper_surv_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.15],
    ["aimingSpeed",   0.70, 0.25],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.75, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]

];


// ---------------------------------------------------------------------------------------------------------------------
// Weapon & Item Loadout
// ---------------------------------------------------------------------------------------------------------------------

// a general note: you CAN use either rifles OR pistols. Do not use both. AI will get stuck after switching weapons.

// potential weapon list for leaders
SAR_leader_weapon_list = ["RPG7V","DMR","Mk_48_DZ","BAF_LRR_scoped","SCAR_H_LNG_Sniper_SD","FN_FAL_ANPVS4"];
SAR_leader_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for leaders -> Item / Chance 1 - 100
SAR_leader_items = [];
SAR_leader_tools =  [["Binocular_Vector",100],["NVGoggles",100]];

//potential weapon list for riflemen
SAR_rifleman_weapon_list = ["Mk_48_DZ","M240_DZ","G36_C_SD_camo","M4A1_AIM_SD_camo","FN_FAL_ANPVS4","FN_FAL","Pecheneg_DZ","M40A3","MP5SD","AKS_74_kobra","M4A3_CCO_EP1","M4A1_HWS_GL_camo","G36K_camo"];
SAR_rifleman_pistol_list = [];   // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for riflemen
SAR_rifleman_items = [];
SAR_rifleman_tools = [["Binocular_Vector",100],["NVGoggles",100]];

//potential weapon list for snipers
SAR_sniper_weapon_list = ["SVD_CAMO","M40A3","M14_EP1","huntingrifle","SVD","SVD_des_EP1","M24","M24_des_EP1","m8_sharpshooter","VSS_vintorez","SCAR_H_LNG_Sniper_SD","BAF_LRR_scoped"];
SAR_sniper_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for snipers
SAR_sniper_items = [];
SAR_sniper_tools = [["Binocular_Vector",100],["NVGoggles",100]];

// ---------------------------------------------------------------------------------------------------------------------
// heli patrol definiton
// ---------------------------------------------------------------------------------------------------------------------

// define the type of heli(s) you want to use here for the heli patrols - make sure you include helis that have minimum 2 gunner positions, anything else might fail
SAR_heli_type=["Mi17_DZE"];
