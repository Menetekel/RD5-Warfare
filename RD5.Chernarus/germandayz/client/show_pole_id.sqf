_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], 5];
_findNearestPole = [];
{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} foreach _findNearestPoles;

_nearestPole = _findNearestPole select 0;
_ownerID = _nearestPole getVariable["CharacterID","0"];





_poleID = _nearestPole getVariable ["ObjectID","0"];
_poleUID = _nearestPole getVariable ["ObjectUID","0"];
//_pUID = _nearestPole getVariable["CharacterID","0"]; //working
_pUID = _nearestPole getVariable["CharacterID","0"];
cutText [format["The PlotPole Code is: ID %1 I UID %2 I pUID %3 I OwnerID %4 - write it down to allow other players building on plot.",_PoleID,_PoleUID,_pUID,_ownerID], "PLAIN DOWN", 5];
						