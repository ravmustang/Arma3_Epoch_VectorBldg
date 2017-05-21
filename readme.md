![ArmA 1.70](https://img.shields.io/badge/Arma-1.70-blue.svg) ![Epoch 0.5.0](https://img.shields.io/badge/Epoch-0.5.x-blue.svg) ![Release](https://img.shields.io/badge/Stable-1.0-blue.svg)

# ArmA3_Epoch_VectorBuilding

## Installation
These files modify the original A3EPOCH as of May 09, 2017.
Merge these files into your mission.

## Credits
#### DonkeyPunch Community Gaming Development Team
#### DirtySanchez
#### He-Man

####.

## 1. Add to "missionFile >> epoch_code >> init >> Client_Init.sqf"

#### Line 17
#### EPOCH_buildDirectionPitch = 0; <---(This is on line 17)
#### EPOCH_buildDirectionRoll = 0;
#### EPOCH_target_attachedTo = player;
####.

## 2. Add to "missionFile >> epoch_code >> compile >> setup >> EPOCH_clientKeyMap.sqf"

#### Line 49
#### ["Build: Rotate RIGHT", "EPOCH_keysBuildRotR", 0x10], <---(This is on line 49 - Add the Comma!)
#### ["Build: Vector LEFT", "eXpoch_keysVectorTiltL", 0xCB],
#### ["Build: Vector RIGHT", "eXpoch_keysVectorTiltR", 0xCD],
#### ["Build: Vector AWAY", "eXpoch_keysVectorTiltAwy", 0xC8],
#### ["Build: Vector TOWARD", "eXpoch_keysVectorTiltTwd", 0xD0],
#### ["Build: Object SnapTo", "eXpoch_keysVectorSnapToObject", 0x52],
#### ["Build: Reset Object", "eXpoch_keysVectorResetObject", 0x4C]
####.

## 3. Add the contents of "missionFile >> epoch_code >> compile >> customs >> EPOCH_custom_EH_KeyDown.sqf"

#### This is a large edit and you will need to view the modified file included

## 4. Replace with this file "missionFile >> epoch_code >> compile >> building >> EPOCH_staticMove.sqf"

#### This is a large edit and you will need to view the modified file included

## Licensing

1. EPOCH uses and has its own licensing included in its addon mod, please refer to that for any questions concerning EPOCH

2. These modifications made for this script are licensed as APL-SA.
	- You can yank it and use it, abuse it, modify it and redistribute it with proper "Credits" of course 
	- These "Credits" will come in the fashion of either "DonkeyPunch Community Gaming" or "DirtySanchez"
	- These "Credits" will also include the website for download and support should anyone else want to use it. http://DonkeyPunch.INFO	
	- Personal feelings and emotional responses will not come from this work or its use in the public.

3. You are not allowed to sell this "Script" or provide any service to install it.
	- You are not allowed to utilize the APL-SA license on the work and add it to another named script and sell that script with this work included.
	- "WE" the authors reserve the right to disallow certain individual communities and persons from using, hosting, modifying, selling, distributing and leave this list open ended so that all aspects of disllowed usage can be added at any time.
	- "WE" will not use this aspect against anyone unless their actions in the "Arma" or internet communities displays that of a greedy, profiteering nature and not one of advancement of "Arma" or the internet communities.

4. Definitions
	- "Arma" being the product made by Bohemia Interactive and purchased through BIS Store or Steam with a valid legal License for use and ownership.
	- "WE" being any individual that is a part of DonkeyPunch Community Gaming Development Team.
	- "Script" being any work, "code", comments not a part of the original program or software. 
	- "Code" does not limit the definition to only the parts that operate within "Arma", but is a broad term used to define the entire product within including all comments and remarks made by "WE".
	- "Credits" being the author("DonkeyPunch Community Gaming" or "DirtySanchez") and website(http://DonkeyPunch.INFO)
