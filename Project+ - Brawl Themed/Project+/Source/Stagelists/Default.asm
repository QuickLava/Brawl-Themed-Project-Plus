######################################################################################
Default [Moto]
######################################################################################
* 286AEDF4 00000000 # If 806AEDF4 is equal to 0

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
	byte[21] |
0x20, | # Yoshi's Story
0x05, | # Bowser's Castle
0x14, | # Castle Siege
0x1E, | # Sky Sanctuary Zone
0x21, | # Golden Temple
0x0A, | # Ceres Space Colony
0x16, | # Distant Planet
0x0C, | # Yoshi's Island
0x15, | # Wario Land
0x18, | # Fountain of Dreams
0x01, | # Final Destination
0x04, | # Metal Cavern
0x23, | # Dream Land
0x0B, | # Frigate Husk
0x08, | # Temple of Time
0x1C, | # Green Hill Zone
0x1A, | # Smashville
0x00, | # Battlefield
0x28, | # Pokemon Stadium 2
0x02, | # Delfino's Secret
0x03  | # Luigi's Mansion

TABLE_2:
	byte[21] |
0x24, | # Peach's Castle
0x06, | # Kongo Jungle
0x07, | # Rumble Falls
0x09, | # Hyrule Castle
0x1F, | # Temple
0x0D, | # Halberd
0x27, | # Planet Zebes
0x0F, | # Saffron City
0x10, | # Spear Pillar
0x25, | # Corneria
0x0E, | # Lylat Cruise
0x22, | # Onett
0x19, | # Fourside
0x12, | # Infinite Glacier
0x26, | # Big Blue
0x11, | # Port Town Aero Dive
0x13, | # Flat Zone 2
0x17, | # Skyworld
0x1B, | # Shadow Moses Island
0x1D, | # PictoChat
0x2B  | # Training Room

TABLE_3:
	byte[19] |
0x31, | # Dinosaur Land
0x2D, | # Mario Circuit
0x38, | # Mushroom Kingdom
0x3B, | # Rainbow Cruise
0x32, | # Oil Drum Alley
0x33, | # Jungle Japes
0x36, | # Cookie Country
0x2E, | # Clock Town
0x3D, | # Pirate Ship
0x39, | # WarioWare, Inc.
0x3C, | # Poke Floats
0x34, | # Bell Tower
0x35, | # Norfair
0x3E, | # Venom
0x2F, | # Hanenbow
0x37, | # Venus Lighthouse
0x2C, | # Dracula's Castle
0x30, | # Dead Line
0x3A  | # Subspace

TABLE_4:	# Unused
TABLE_5:	# Unused

TABLE_STAGES:
# Table of icon<->stage slot associations
half[82] |	# Stage Count + 2
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino's Plaza, Luigi's Mansion
0x0505, 0x0606, 0x0707, 0x0808, | # Mario Bros., Bowser's Castle, 75m, Rumble Falls
0x0909, 0x330A, 0x492C, 0x0C0C, | # Temple of Time, Bridge of Eldin, Ceres Space Colony, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island, Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Summit, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F19, 0x201A, 0x211B, 0x221C, | # Fountain of Dreams, New Pork City, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36, | # Yoshi's Story, Golden Temple, Onett, Green Greens
0x2F37, 0x3038, 0x3139, 0x323A, | # Rainbow Cruise, Corneria, Big Blue, Brinstar
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Dracula's Castle, Mario Circuit, Clock Town, Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Dead Line, Dinosaur Land, Oil Drum Alley, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Bell Tower, Norfair, Cookie Country, Venus Lighthouse
0x4C2F, 0x4D30, 0x4E31, 0x4F3D, | # Mushroom Kingdom, WarioWare, Subspace, Rainbow Cruise
0x503E, 0x513F, 0x5240, 0x5341,	| # Poke Floats, Pirate Ship, Venom, Battlefield (P+)
0x5442, 0x5543, 0x5644, 0x5745,	| # Final Destination (P+), Delfino's Secret, Luigi's Mansion (P+)
0x5846, 0x5947, 0x5A48, 0x5B49,	| # Metal Cavern, Kongo Jungle, Rumble Falls (P+), Frigate Husk
0x5C4A, 0x5D4B, 0x5E4C, 0x5F4D,	| # Yoshi's Island (P+), Infinite Glacier, Skyworld (P+), Fourside
0x604E, 0x614F, 0x6250, 0x6351,	| # Green Hill Zone (P+), Hannenbow (P+), Dream Land, Pokemon Stadium 2
0x6452, 0x6553					| # Planet Zebes, Hyrule Castle


SkipStageTables:
.RESET

byte 21 @ $806B929C # Page 1
byte 21 @ $806B92A4 # Page 2
byte 19 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4 (Unused)
byte 00 @ $80496004 # Page 5 (Unused)
byte 61 @ $800AF673 # Stage Count