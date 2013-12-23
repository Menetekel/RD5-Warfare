if (isServer) then {
	// Mission System
		// Mission
	[] execVM "\z\addons\dayz_server\sidemissions\mission_deamon.sqf";
};

if (!isDedicated) then {
	// Custom Debug
	//[] execVM "germandayz\side\extras\debug_monitor\debug_monitor.sqf";
	
	// PublicEH for Mission Updates
	"customMissionWarning" addPublicVariableEventHandler {_this select 1 execVM "germandayz\side\mission_warning.sqf"};
};