######################################################################################
Brawl Stagelist [Bird]
######################################################################################
* 20523400 00000000 # If 80523400 is equal to 0

.BA<-TABLE_STAGES
.BA->$80495D00
.BA<-TABLE_1
.BA->$80495D04
.BA<-TABLE_2
.BA->$80495D08
.BA<-TABLE_3
.BA->$80495D0C
.BA<-TABLE_4
.BA->$80495D10
.BA<-TABLE_5
.BA->$80495D14
.GOTO->SkipStageTables

TABLE_1:
	byte[31] |
0x00, | # Battlefield
0x01, | # Final Destination
0x02, | # Delfino Plaza
0x03, | # Luigi's Mansion
0x38, | # Mushroomy Kingdom
0x05, | # Mario Circuit
0x09, | # Bridge of Eldin
0x07, | # Rumble Falls
0x08, | # Pirate Ship
0x35, | # Norfair
0x0B, | # Frigate Orpheon
0x0C, | # Yoshi's Island
0x0D, | # Halberd
0x0E, | # Lylat Cruise
0x0F, | # Pokemon Stadium 2
0x10, | # Spear Pillar
0x11, | # Port Town Aero Dive
0x14, | # Castle Siege
0x15, | # Wario Land
0x16, | # Distant Planet
0x1A, | # Smashville
0x19, | # New Pork City
0x12, | # Summit
0x17, | # Skyworld
0x06, | # 75 m
0x04, | # Mario Bros
0x13, | # Flat Zone 2
0x1D, | # PictoChat
0x2F, | # Hanenbow
0x1B, | # Shadow Moses Island
0x1C  | # Green Hill Zone

TABLE_2:
	byte[10] |
0x1F, | # Temple
0x20, | # Dinosaur Land (Yoshi's Island Melee)
0x33, | # Jungle Japes
0x22, | # Onett
0x25, | # Corneria
0x24, | # Rainbow Cruise
0x23, | # Green Greens
0x26, | # Big Blue
0x27, | # Brinstar
0x28  | # Pokemon Stadium

TABLE_4:	# Unused
TABLE_5:	# Unused

TABLE_STAGES:
# Table of icon<->stage slot associations
half[61] |	# Stage Count + 2 (NOTE FOR BRAWL THEMED P+: .asls past 0x39, with the exception of 0x4C, are not used)
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino Plaza, Luigi's Mansion
0x0519, 0x0606, 0x0707, 0x0808, | # Metal Cavern, Mario Circuit, 75 m, Rumble Falls
0x0909, 0x330A, 0x492C, 0x0C0C, | # Pirate Ship, Bridge of Eldin, Metroid Lab, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island, Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Summit, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F2F, 0x201A, 0x211B, 0x221C, | # Mario Bros, New Pork City, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36, | # Dinosaur Land, Golden Temple, Onett, Green Greens
0x2F37, 0x3038, 0x3139, 0x323A, | # Rainbow Cruise, Corneria, Big Blue, Brinstar
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium 2, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Dracula's Castle, Bowser's Castle, Clock Town, Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Dead Line, Dinosaur Land, Oil Drum Alley, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Bell Tower, Norfair, Cookie Country, Venus Lighthouse
0x4C05, 0x4D30, 0x4E31, 0x4F3D, | # Mushroomy Kingdom, WarioWare, Subspace, Peach's Castle
0x503E				| # Poke Floats


SkipStageTables:
.RESET
* 20523400 00000000 # If 80523400 is equal to 0
byte 31 @ $806B929C # Page 1
byte 10 @ $806B92A4 # Page 2
byte 00 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4 (Unused)
byte 00 @ $80496004 # Page 5 (Unused)
byte 41 @ $800AF673 # Stage Count
* E0000000 80008000