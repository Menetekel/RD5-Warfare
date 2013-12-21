// If you want more messages remove the // from line  10-15
if (isNil "music") then {
music = false;
};

while {true} do {
waitUntil { music };
titleText [format["Betretten des Weihnachtsmarktes ! "],"PLAIN DOWN"]; titleFadeOut 4;
playsound "introSong";
//sleep 4;
//cutText ["Editable Text", "PLAIN DOWN"];
//sleep 4;
//cutText ["Editable Text", "PLAIN DOWN"];
//sleep 4;
//cutText ["Editable Text", "PLAIN DOWN"];
sleep 1000; // time in sec. to start again while in trader city
}; 