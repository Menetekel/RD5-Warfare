// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.0.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: to come
//		
/************************** Safezone Klen ********************************/


_this = createMarker ["SAR_marker_SZKlen1", [11551.543, 11281.805]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [35, 35];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen2", [11580.415, 11339.666]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [35, 35];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen3", [11454.274, 11216.608]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen4", [11363.356, 11280.794]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen5", [11400.548, 11364.671]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen6", [11429.872, 11403.261]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
[_this,2,1,2,"fortify",true] call SAR_AI;

_this = createMarker ["SAR_marker_SZKlen7", [11461.033, 11347.62]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 1;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
[_this,2,1,300,"patrol",true] call SAR_AI;

/************************** End of Safezone Klen ********************************/
// SAR_marker_DEBUG = areaname (must have been defined further up, and MUST NOT BE similar to SAR_area_ ! THIS IS IMPORTANT!
// 1 = type of group (1 = soldiers, 2 = survivors, 3 = bandits)
// 0 = amount of snipers in the group
// 1 = amount of rifleman in the group
// "" = action, possible values: "noupsmon","fortify","ambush","patrol"
// true = respawning group, true or false

// ---- end of configuration area ----

diag_log format["SAR_AI: Static Spawning for infantry and heli patrols finished"];