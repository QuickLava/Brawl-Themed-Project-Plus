######################################################################################
Project+ Default [Moto]
######################################################################################
* 286AEDF4 00000005 # If 806AEDF4 is equal to 5

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
0x20,  | # Yoshis_Story
0x14,  | # Castle_Siege
0x1E,  | # Sky_Sanctuary
0x21,  | # Golden_Temple
0x0A,  | # Ceres_Space_Colony
0x49,  | # Distant_Planet
0x46,  | # Yoshis_Island
0x45,  | # Frigate_Husk
0x15,  | # Wario_Land
0x18,  | # Fountain_of_Dreams
0x42,  | # Metal_Cavern
0x3F,  | # Final_Destination
0x4E,  | # Dream_Land
0x4C,  | # Green_Hill_Zone
0x1A,  | # Smashville
0x3E,  | # Battlefield
0x4F,  | # Pokemon_Stadium_2
0x40,  | # Delfino_Secret
0x08,  | # Temple_of_Time
0x05,  | # Bowser_Castle
0x41 # Luigis_Mansion

TABLE_2:
	byte[21] |
0x52,  | # Peach_Castle
0x43,  | # Kongo_Jungle
0x44,  | # Rumble_Falls
0x51,  | # Hyrule_Castle
0x1F,  | # Temple
0x0D,  | # Halberd
0x50,  | # Planet_Zebes
0x47,  | # Saffron_City
0x10,  | # Spear_Pillar
0x25,  | # Corneria
0x0E,  | # Lylat_Cruise
0x22,  | # Onett
0x4B,  | # Fourside
0x48,  | # Infinite_Glacier
0x26,  | # Big_Blue
0x11,  | # Port_Town
0x13,  | # Flat_Zone
0x4A,  | # Skyworld
0x1B,  | # Shadow_Moses
0x1D,  | # PictoChat
0x2B # Training

TABLE_3:
	byte[19] |
0x31,  | # Dinosaur_Land
0x2D,  | # Mario_Circuit
0x53,  | # Mushroom_Kingdom
0x24,  | # Rainbow_Cruise
0x32,  | # Minecart_Madness
0x33,  | # Jungle_Japes
0x36,  | # Cookie_Country
0x2E,  | # Clock_Town
0x3C,  | # Pirate_Ship
0x39,  | # WarioWare
0x3B,  | # Poke_Floats
0x34,  | # Bell_Tower
0x35,  | # Norfair
0x3D,  | # Venom
0x4D,  | # Hanenbow
0x37,  | # Venus_Lighthouse
0x2C,  | # Draculas_Castle
0x30,  | # Dead_Line
0x3A # Subspace

TABLE_4:
TABLE_5:

TABLE_STAGES:
	half[84] |
0x0101, 0x0202, 0x0303, 0x0404,  | # Battlefield_Brawl, Final_Destination_Brawl, Delfino_Plaza, Luigis_Mansion_Brawl
0x0505, 0x0606, 0x0707, 0x0808,  | # Mario_Bros, Bowser_Castle, 75_m, Rumble_Falls_Brawl
0x0909, 0x330A, 0x492C, 0x0C0C,  | # Temple_of_Time, Bridge_of_Eldin, Ceres_Space_Colony, Frigate_Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410,  | # Yoshis_Island_Brawl, Halberd, Lylat_Cruise, Pokemon_Stadium_2_Brawl
0x1511, 0x1612, 0x1713, 0x1814,  | # Spear_Pillar, Port_Town, Summit, Flat_Zone
0x1915, 0x1C16, 0x1D17, 0x1E18,  | # Castle_Siege, Wario_Land, Distant_Planet_Brawl, Skyworld_Brawl
0x1F19, 0x201A, 0x211B, 0x221C,  | # Fountain_of_Dreams, New_Pork_City, Smashville, Shadow_Moses
0x231D, 0x241E, 0x4326, 0x2932,  | # Green_Hill_Zone_Brawl, PictoChat, Sky_Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36,  | # Yoshis_Story, Golden_Temple, Onett, Green_Greens
0x2F37, 0x3038, 0x3139, 0x323A,  | # Rainbow_Cruise, Corneria, Big_Blue, Brinstar
0x2E3B, 0xFF64, 0xFF64, 0x373C,  | # Pokemon_Stadium, NOTHING, NOTHING, Training
0x4023, 0x4124, 0x4225, 0x251F,  | # Draculas_Castle, Mario_Circuit, Clock_Town, Hanenbow_Brawl
0x4427, 0x4528, 0x4629, 0x2B34,  | # Dead_Line, Dinosaur_Land, Minecart_Madness, Jungle_Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E,  | # Bell_Tower, Norfair, Cookie_Country, Venus_Lighthouse
0x4C2F, 0x4D30, 0x4E31, 0x4F3D,  | # Mushroomy_Kingdom, WarioWare, Subspace, Poke_Floats
0x503E, 0x513F, 0x5240, 0x5341,  | # Pirate_Ship, Venom, Battlefield, Final_Destination
0x5442, 0x5543, 0x5644, 0x5745,  | # Delfino_Secret, Luigis_Mansion, Metal_Cavern, Kongo_Jungle
0x5846, 0x5947, 0x5A48, 0x5B49,  | # Rumble_Falls, Frigate_Husk, Yoshis_Island, Saffron_City
0x5C4A, 0x5D4B, 0x5E4C, 0x5F4D,  | # Infinite_Glacier, Distant_Planet, Skyworld, Fourside
0x604E, 0x614F, 0x6256, 0x6357,  | # Green_Hill_Zone, Hanenbow, Dream_Land, Pokemon_Stadium_2
0x6458, 0x6559, 0x665A, 0x675B # Planet_Zebes, Hyrule_Castle, Peach_Castle, Mushroom_Kingdom

SkipStageTables:
.RESET
* 286AEDF4 00000005 # If 806AEDF4 is equal to 5
byte 21 @ $806B929C # Page 1
byte 21 @ $806B92A4 # Page 2
byte 19 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4
byte 00 @ $80496004 # Page 5
byte 82 @ $800AF673 # Stage Count
* E0000000 80008000