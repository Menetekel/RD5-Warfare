// ======= SCRIPT VERSION: v1.1 =======
// SERVER WELCOME MESSAGE IN CREDITS STYLE edited for DayZ by IT07
// ORIGINAL SCRIPT BY: Bohemia Interactive, British Armed Forces Campaign Mission 1
// IT07 does NOT take credit for original script, he only modified it so it works for DayZ
// ==================

// ======= Customization =======
// ADDING MORE MESSAGES:
// if you add more messages than already here, add a _role that is named +1 more than the last one.
// Be careful, if you add a role here below, also add it to the } forEach [ list that's on the bottom.
// CHANGING TRANSITION TIMES:
// where it says: _onScreenTime = 1 + (((count _memberNames) - 1) * 0.5); change the 0.5 to whatever value you want.
// 1.0 for example is already a lot slower, so be careful changing this.
// when you have changed this value, enter the same value where it says:
// _onScreenTime, 0.5
// =============================
// SCRIPT START
waituntil {!isnull (finddisplay 46)}; // Makes the script start when player is ingame

sleep 15; // wait 15 before the welcome message starts (in seconds)

_role1 = "Welcome to:";
_role1names = ["GermandayZ.de RedDiamond 5"];
_role2 = "TEAMSPEAK";
_role2names = ["ts.germandayz.de"];
_role3 = "Languages in Sidechat:";
_role3names = ["english and german"];
_role4 = "Most Important:";
_role4names = ["NO VOICE ON SIDE, NO STEALING IN TRADEZONES"];

{
  sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.45' color='#ffffff' align='left'>%1<br /><br/></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.5' color='#ffffff' align='left'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime = 1 + (((count _memberNames) - 1) * 0.75);
	[
		_finalText,
		[safezoneX + safezoneW - 0.5,0.35],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.75
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names]
];