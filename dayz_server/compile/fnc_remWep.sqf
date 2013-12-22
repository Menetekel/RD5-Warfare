	//Jedes Vehicle eintragen welches Waffen entfernt haben soll und welche Waffe - Entfernt Waffe beim Traderspawn/Randomspawn/Serverneustart
    if (_object isKindOf "GAZ_Vodnik_HMG") then {
            _object removeWeapon "2A42";
            _object removeMagazine "1500Rnd_762x54_PKT";
            };
	if (_object isKindOf "BMP2_INS") then {
	_object removeWeapon "2A42";
	_object removeWeapon "AT5LauncherSingle";
	_object removeWeapon "PKT";
	_object addWeapon "M2";
	_object addMagazine "100Rnd_127x99_M2";
	};
	//Ende des Entfernens