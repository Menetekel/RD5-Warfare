// Adding friendlys via safe code display
_pole = nearestObjects [player, ["Plastic_Pole_EP1_DZ"], 5];
_pw = _pole getVariable ["ObjectID",str(random 10000)]; // Wir sind nicht apple!
cutText [format["Checking code you entered: %1 against %2",dayz_combination,_pw], "PLAIN DOWN", 5];

if(_pw == dayz_combination) then {
/*	_ownerID = _pole getVariable ["CharacterID",0];
	_friendlies = player getVariable ["friendlies", []];
	_friendlies set [count _friendlies, _ownerID];
	player setVariable ["friendlies", _friendlies, true];*/
		titleText ["Added you to the allowed list. You are now able to build here.", "PLAIN DOWN"];
	// Tu was auch immer du tun willst. Würde eine Var am plotpole setzen und dort die UID des players appenden, diese dann in player_build l. 174 abfragen
} else {
	dayz_combination = "";
		titleText ["Wrong code was given.", "PLAIN DOWN"];
};