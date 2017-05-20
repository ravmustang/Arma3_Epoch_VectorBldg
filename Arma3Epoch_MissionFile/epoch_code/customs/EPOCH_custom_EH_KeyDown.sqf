/*
	Author: Aaron Clark - EpochMod.com

    Contributors: [Ignatz] He-Man

	Description:
	Custom A3 Epoch KeyUp Eventhandler

    Licence:
    Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

    Github:
    https://github.com/EpochModTeam/Epoch/tree/release/Sources/epoch_code/custom/EPOCH_custom_EH_KeyDown.sqf
*/
params ["_display","_dikCode","_shift","_ctrl","_alt"];
_handled = false;

/* eXpoch Vector building */
	if (vehicle player == player) then {
		if (_dikCode == EPOCH_keysBuildMode1 && EPOCH_buildMode > 0) then {
			EPOCH_buildMode = 0;
			EPOCH_snapDirection = 0;
			["Build Mode: Disabled", 5] call Epoch_message;
			EPOCH_Target = objNull;
			EPOCH_Z_OFFSET = 0;
			EPOCH_X_OFFSET = 0;
			EPOCH_Y_OFFSET = 5;
			EPOCH_buildDirection = 0;
			EPOCH_buildDirectionPitch = 0;
			EPOCH_buildDirectionRoll = 0;
			EPOCH_target_attachedTo = player;
			_handled = true;
		};

		_step = 0.5;
		if(_shift)then{_step = 1.5;};
		if(_alt)then{_step = 0.01;};
		if (EPOCH_buildMode > 0) then {
			if (!_ctrl) then {
				switch (_dikCode) do {
				case EPOCH_keysBuildMovUp: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_Z_OFFSET = (EPOCH_Z_OFFSET + _adj) min 6; _handled = true };
				case EPOCH_keysBuildMovDn: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_Z_OFFSET = (EPOCH_Z_OFFSET - _adj) max - 3; _handled = true };
				case EPOCH_keysBuildMovFwd: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_Y_OFFSET = (EPOCH_Y_OFFSET + _adj) min 5; _handled = true };
				case EPOCH_keysBuildMovBak: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_Y_OFFSET = (EPOCH_Y_OFFSET - _adj) max -5; _handled = true };
				case EPOCH_keysBuildMovL: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_X_OFFSET = (EPOCH_X_OFFSET + _adj) min 5; _handled = true };
				case EPOCH_keysBuildMovR: { _adj = 0.1;if(_shift)then{_adj = 0.5};if(_alt)then{_adj = 0.01};EPOCH_X_OFFSET = (EPOCH_X_OFFSET - _adj) max - 5; _handled = true };
				case EPOCH_keysBuildRotL: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirection = (EPOCH_buildDirection + _adj) min 180; EPOCH_doRotate = true; _handled = true };
				case EPOCH_keysBuildRotR: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirection = (EPOCH_buildDirection - _adj) max -180; EPOCH_doRotate = true; _handled = true };
				//case EPOCH_keysBuildIt: { cursorTarget call EPOCH_fnc_SelectTarget; _handled = true };
				case eXpoch_keysVectorTiltL: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirectionRoll = (EPOCH_buildDirectionRoll - _adj) max -180; EPOCH_doRotate = true; _handled = true };
				case eXpoch_keysVectorTiltR: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirectionRoll = (EPOCH_buildDirectionRoll + _adj) min 180; EPOCH_doRotate = true; _handled = true };
				case eXpoch_keysVectorTiltAwy: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirectionPitch = (EPOCH_buildDirectionPitch - _adj) max -180; EPOCH_doRotate = true; _handled = true };
				case eXpoch_keysVectorTiltTwd: { _adj = 1;if(_shift)then{_adj = 2.5};if(_alt)then{_adj = 0.5};EPOCH_buildDirectionPitch = (EPOCH_buildDirectionPitch + _adj) min 180; EPOCH_doRotate = true; _handled = true };
				case eXpoch_keysVectorSnapToObject: { 
					if (EPOCH_target_attachedTo isEqualTo player) then {
						[]spawn{
							disableSerialization;
							_result = ["Do you really want to snap to this object?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
							waitUntil { !isNil "_result" };
							if (_result) then
							{
								EPOCH_X_OFFSET=0.1;EPOCH_Y_OFFSET=0.1;EPOCH_Z_OFFSET=0.5;
								EPOCH_buildDirection=0;EPOCH_buildDirectionRoll=0;EPOCH_buildDirectionPitch=0;
								EPOCH_target_attachedTo = cursorObject;
								EPOCH_doRotate = true;
								_msg = format["Object Snapping : ON  Snapped To : %1",typeOf cursorObject];
								[_msg, 5] call Epoch_message;
							};
						};
					}
					else{
						[]spawn{
							disableSerialization;
							_result = ["Do you really want to stop object snapping?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
							waitUntil { !isNil "_result" };
							if (_result) then
							{
								EPOCH_X_OFFSET=0;EPOCH_Y_OFFSET=5;EPOCH_Z_OFFSET=0;
								EPOCH_buildDirection=0;EPOCH_buildDirectionRoll=0;EPOCH_buildDirectionPitch=0;
								EPOCH_target_attachedTo = player;
								EPOCH_doRotate = true;
								_msg = format["Object Snapping : OFF  Snapped To : %1",name player];
								[_msg, 5] call Epoch_message;
							};
						};
					};
					_handled = true;
				};
				case eXpoch_keysVectorResetObject: { EPOCH_X_OFFSET = 0;EPOCH_Y_OFFSET = 5;EPOCH_Z_OFFSET = 0;EPOCH_buildDirection = 0;EPOCH_buildDirectionPitch = 0;EPOCH_buildDirectionRoll = 0;EPOCH_doRotate = true;_handled = true };
				};
			};
		};
	};
/* eXpoch Vector building */

};
_handled
