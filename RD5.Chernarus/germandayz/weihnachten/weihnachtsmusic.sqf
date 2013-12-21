/*
Name: Wihnachtsmusik in Trader city
Date: 06/11/2013
Mod: Dayz Epoch
Map: Chernarus
*/

// Trader City Stary
_this = createTrigger ["EmptyDetector", [6325.6772, 7807.7412, 0]];
_this setTriggerArea [150, 150, 0, false];
_this setTriggerActivation ["NONE", "PRESENT", true];
_this setTriggerStatements ["(player distance trading_post1) < 100;", "music = true; canbuild = false;", "music = false; canbuild = true;"];
trading_post1 = _this;
_trigger_0 = _this;


// Trader City Bash
_this = createTrigger ["EmptyDetector", [4063.4226, 11664.19, 0]];
_this setTriggerArea [150, 150, 0, false];
_this setTriggerActivation ["NONE", "PRESENT", true];
_this setTriggerStatements ["(player distance trading_post2) < 100;", "music = true; canbuild = false;", "music = false; canbuild = true;"];
trading_post2 = _this;
_trigger_1 = _this;


// Trader City Klen
_this = createTrigger ["EmptyDetector", [11447.472, 11364.504, 0]];
_this setTriggerArea [150, 150, 0, false];
_this setTriggerActivation ["NONE", "PRESENT", true];
_this setTriggerStatements ["(player distance trading_post3) < 100;", "music = true; canbuild = false;", "music = false; canbuild = true;"];
trading_post3 = _this;
_trigger_2 = _this;


// Trader Airport
_this = createTrigger ["EmptyDetector", [12072.707, 12672.13, 0]];
_this setTriggerArea [150, 150, 0, false];
_this setTriggerActivation ["NONE", "PRESENT", true];
_this setTriggerStatements ["(player distance trading_post4) < 100;", "music = true; canbuild = false;", "music = false; canbuild = true;"];
trading_post4 = _this;
_trigger_3 = _this;


// Trader Hero
_this = createTrigger ["EmptyDetector", [12910.84, 12760.42, 0]];
_this setTriggerArea [150, 150, 0, false];
_this setTriggerActivation ["NONE", "PRESENT", true];
_this setTriggerStatements ["(player distance trading_post5) < 100;", "music = true; canbuild = false;", "music = false; canbuild = true;"];
trading_post5 = _this;
_trigger_4 = _this;
