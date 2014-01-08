/*_poleID = _this select 3 select 0;
_ownerID = _this select 3 select 1;
_friendP = _this select 3 select 2;*/
  _findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], 5];
  _findNearestPole = [];
 {
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
 } foreach _findNearestPoles;

_nearestPole = _findNearestPole select 0;
_poleID = _nearestPole getVariable ["ObjectID","0"];
_ownerID = _nearestPole getVariable["CharacterID","0"];
_friendP = player getVariable ["friendlies",[]];
dayz_combination = "";
_o = createDialog "SafeKeyPad";
	waitUntil{!dialog};
cutText [format["Checking Code '%2' for Plot# %1",_ownerID,dayz_combination], "PLAIN DOWN", 5];
sleep 5;
if(_poleID == dayz_combination) then {
    _friendP set [count _friendP,_ownerID];
	player setVariable ["friendlies", _friendP, true];
		titleText ["Added you to the allowed list. You are now able to build here.", "PLAIN DOWN"];
	// Tu was auch immer du tun willst. Würde eine Var am plotpole setzen und dort die UID des players appenden, diese dann in player_build l. 174 abfragen
} else {
	dayz_combination = "";
		titleText ["Wrong code was given.", "PLAIN DOWN"];
};