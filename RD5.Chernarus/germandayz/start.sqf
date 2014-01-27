//GermanDayZ.de Epoch Script Config
//anything custom here is copyright by GermanDayZ.de and is not allowed to be copied, modified or otherwise distributed without prior permission

_isClient = !isDedicated && hasInterface;
_isServer = isDedicated && isServer;
_isHeadless = !isServer && !hasInterface;
//===============GENERAL CONFIG===============
[] execVM "germandayz\side\init.sqf";			//SideMissions
[] execVM "germandayz\safezone\safezone.sqf";	//SafeZone-Additions
/***** Sarge AI *****/
//call compile preprocessFileLineNumbers "germandayz\AI\UPSMON\scripts\Init_UPSMON.sqf";
//call compile preprocessfile "germandayz\AI\SHK_pos\shk_pos_init.sqf";
//[] execVM "germandayz\AI\SARGE\SAR_AI_init.sqf";
//===============SERVER CONFIG===============
if (_isServer) then {
//Trader Cities and Custom Map Additions
	_nil = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\mission.sqf";
	_bar = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\barracks.sqf";
	_wka = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\wkamenka.sqf";
	_bike = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\bikes.sqf"; //temporary bikes close to beach
	_gm = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\greenmountain.sqf";
	_church = [] execVM "\z\addons\dayz_server\missions\rd5.Chernarus\new_churches.sqf"; //replaced default churches with enterable ones
};
//===============HEADLESS CONFIG===============
if (_isHeadless) then {
};
//===============CLIENT CONFIG===============
if (_isClient) then {
	[] execVM "germandayz\client\kh_actions.sqf";	//AutoRefuel
	[] execVM "germandayz\greetings.sqf";			//LoginCredits
	[] execVM "germandayz\client\dzai_initclient.sqf"; //DZAI Client Radio Messages
	[] execVM "germandayz\client\hide_churches.sqf"; //Hide default Chernarus churches
};