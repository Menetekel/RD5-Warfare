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
	if (_object isKindOf "BRDM2_TK_EP1") then {
			_object removeWeapon "KPVT";
			_object removeWeapon "PKT";
			_object addWeapon "TruckHorn2";
			_object addWeapon "SmokeLauncher";
	};
	if (_object isKindOf "M113Ambul_TK_EP1_DZ") then {
			_object addWeapon "SportCarHorn";
			_object addWeapon "BikeHorn";
	};
	if (_object isKindOf "HMMWV_Avenger_DES_EP1") then {
			_object removeWeapon "StingerLaucher";
			_object removeWeapon "M3P";
			_object addWeapon "BikeHorn";
	};
	if (_object isKindOf "Ural_ZUE23_Gue") then {
			_object removeWeapon "2A14";
	};
	if (_object isKindOf "MQ9PredatorB") then {
			_object removeWeapon "HellfireLauncher";
			_object addWeapon "M240_veh";
			_object addMagazine "100Rnd_762x51_M240";
	};
	if (_object isKindOf "Pchela1T") then {
			_object addWeapon "BikeHorn";
			_object addWeapon "TruckHorn2";
	};
	//Ende des Entfernens