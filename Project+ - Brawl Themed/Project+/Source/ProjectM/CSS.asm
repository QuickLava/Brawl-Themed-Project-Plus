###########################################
CSS Selections Preserved in VS Mode [Magus]
###########################################
op b 0x3C @ $806DCA90

#############################
CSS Record Display Fix [ds22]
#############################
HOOK @ $8068DBCC    # 0x64 bytes into symbol "updateCharHighScore/[muSelCharTask]/mu_selchar.o" @ 0x8068DB68
{
  cmpwi r29, 0x28
  beq- %END%
  cmpwi r29, 0x29
}
op beq- 0x3C @ $8068DBD0

########################################################
CSS Fixes for Samus/ZSS and Zelda/Shiek v2.2 [spunit262]
########################################################
op li r4, 0x4   @ $80693D50 # ZSS return cursor fix
op li r0, 0x0   @ $80684EE0 # Allows selecting the same Costume ID

#############################################
CSS Fixes for Giga and Company v2 [spunit262]
#############################################
HOOK @ $80684940    # 0x260 bytes into symbol "setToGlobal/[muSelCharTask]/mu_selchar.o" @ 0x806846E0
{
  stb r29, 184(r20)
  rlwinm r29, r29, 0, 26, 31
  cmpwi r29, 0x1B
}
op rlwinm r0, r3, 4, 22, 27 @ $800AF8D4
op rlwinm r0, r3, 4, 22, 27 @ $800AF964
op rlwinm r0, r3, 4, 22, 27 @ $800AF830
op rlwinm r0, r3, 4, 22, 27 @ $800AF528
op rlwinm r0, r3, 4, 22, 27 @ $800AF880
op rlwinm r0, r3, 4, 22, 27 @ $800AF848
CODE @ $8068310C
{
  addi r3, r30, 0x6C
  li r27, 0x0
  lis r4, 0x8068;  addi r4, r4, 0xDE0
loc_0x10:
  lbzx r5, r27, r4
  extsb. r5, r5;  blt- loc_0x2C
  stwu r5, 4(r3)
  addi r27, r27, 0x1
  cmpwi r27, 0x32;  blt+ loc_0x10
loc_0x2C:
  b 0x38
}
op b 0x68 @ $80690338
CODE @ $806900D8
{
  cmpwi r23, 0x28
  beq- 0x168
}
* 02680DE0 0022FFFF

##################################
CSS Fixes for Knuckles [spunit262]
##################################
HOOK @ $8068DBCC                # Address = $(ba + 0x0068DBCC) [in "updateCharHighScore/[muSelCharTask]/mu_selchar.o" @ $8068DB68]
{
    cmpwi r29, 0x28                 # 0x2C1D0028
    beq %END%                       # 0x41820008
    cmpwi r29, 0x29                 # 0x2C1D0029
}
* 0468DBD0 4182003C             # 32-Bit Write @ $(ba + 0x0068DBD0):  0x4182003C

#####################################################################################################################
[Brawl-Themed P+] CSS Roster, Random, & L-Load Data [spunit262, ds22, Bird, dantarion, DukeItOut, Motobug, QuickLava]
# Roster IDs: vBrawl == 0, Project+ == 1
# Handles Roster, Random, and L-Load Tables to ensure they all correctly switch via the Code Menu.
# Original Code Credits
# - [Project+] CSS Roster Data v3&K [spunit262, order by Bird, DukeItOut, Motobug]
# - [Project+] CSS Random Data [ds22, dantarion]
# - Hold Shield for Special Fighter [ds22]
#####################################################################################################################
* 224E02DC 00000000                             # If the Selected Roster Code Menu Line's INDEX Value is populated...
* 48000000 804E02DC                             # ... load its address into PO!
# From here, check for each roster option and execute!

* 30000008 00000000                             # If the Selected Roster Line's Value is 0, do vBrawlRoster!
op cmpwi r3,  0x0F @ $80697F54                    # Enable Zelda Check
op cmpwi r3,  0x0E @ $80697EE8                    # Enable Sheik Check
op cmpwi r23, 0x0E @ $806900E4                    # Disable Zelda Icon Fix
op li r0, 0x01 @ $80693D6C                        # Enable Sheik Return Slot Fix
op li r4, 0x0E @ $80693D70                        # Enable Sheik Return Cursor Fix
byte[36] |                                        # Roster Table
0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x08, 0x11, 0x12,  |  Mario,  DK,    Link,        Samus, Kirby,  Fox,    Pikachu, Marth, G&W
0x09, 0x1A, 0x0E, 0x17, 0x16, 0x13, 0x1B, 0x21, 0x26,  |  Luigi,  Diddy, Zelda/Shiek, Pit,   MK,     Falco,  PT,      Ike,   Snake
0x0D, 0x05, 0x14, 0x10, 0x1F, 0x25, 0x20, 0x0B, 0x27,  |  Peach,  Yoshi, Ganondorf,   ICs,   DDD,    Wolf,   Lucario, Ness,  Sonic
0x0C, 0x15, 0x24, 0x22, 0x18, 0x0A, 0x23, 0x19, 0x29   |  Bowser, Wario, Tink,        ROB,   Olimar, Falcon, Jiggs,   Lucas, Random
@ $80680DE0
op li r23, 35 @ $806857F0                         # Set Random Table Len
byte[35] |                                        # Random Table
0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x08, 0x11, 0x12,  |  Mario,  DK,    Link,        Samus, Kirby,  Fox,    Pikachu, Marth, G&W
0x09, 0x1A, 0x0E, 0x17, 0x16, 0x13, 0x1B, 0x21, 0x26,  |  Luigi,  Diddy, Zelda/Shiek, Pit,   MK,     Falco,  PT,      Ike,   Snake
0x0D, 0x05, 0x14, 0x10, 0x1F, 0x25, 0x20, 0x0B, 0x27,  |  Peach,  Yoshi, Ganondorf,   ICs,   DDD,    Wolf,   Lucario, Ness,  Sonic
0x0C, 0x15, 0x24, 0x22, 0x18, 0x0A, 0x23, 0x19         |  Bowser, Wario, Tink,        ROB,   Olimar, Falcon, Jiggs,   Lucas
@ $80680E80

* 30000009 00000001                             # Else, if the Selected Roster Line's Value is 1, do Project+ Roster!
op cmpwi r3,  0x7FFF @ $80697F54                  # Disable Zelda Check
op cmpwi r3,  0x7FFF @ $80697EE8                  # Disable Sheik Check
op cmpwi r23, 0x7FFF @ $806900E4                  # Enable Zelda Icon Fix
op li r0, 0x00 @ $80693D6C                        # Disable Sheik Return Slot Fix
op li r4, 0x0F @ $80693D70                        # Disable Sheik Return Cursor Fix
byte[43] |                                        # Roster Table
0x00, 0x01, 0x02, 0x03, 0x06, 0x08, 0x07, 0x11, 0x12,  |  Mario,  DK,    Link,      Samus,  Kirby,     Fox,      Pikachu, Marth,   G&W
0x09, 0x1A, 0x0E, 0x04, 0x16, 0x23, 0x13, 0x2D, 0x26,  |  Luigi,  Diddy, Zelda,     ZSS,    MK,        Jiggs,    Falco,   Roy,     Snake
0x0D, 0x05, 0x0F, 0x0A, 0x1F, 0x2B, 0x25, 0x21, 0x27,  |  Peach,  Yoshi, Sheik,     Falcon, DDD,       Squirtle, Wolf,    Ike,     Sonic
0x0C, 0x15, 0x14, 0x17, 0x18, 0x2C, 0x20, 0x0B, 0x30,  |  Bowser, Wario, Ganondorf, Pit,    Olimar,    Ivysaur,  Lucario, Ness,    Knuckles
0x22, 0x24, 0x10, 0x29, 0x2A, 0x2E, 0x19               |  ROB,    Tink,  ICs,       Random, Charizard, Mewtwo,   Lucas
@ $80680DE0
op li r23, 42 @ $806857F0                         # Set Random Table Len
byte[42] |                                        # Random Table
0x00, 0x01, 0x02, 0x03, 0x06, 0x08, 0x07, 0x11, 0x12,  |  Mario,  DK,    Link,      Samus,     Kirby,     Fox,      Pikachu, Marth,   G&W
0x09, 0x1A, 0x0E, 0x04, 0x16, 0x23, 0x13, 0x2D, 0x26,  |  Luigi,  Diddy, Zelda,     ZSS,       MK,        Jiggs,    Falco,   Roy,     Snake
0x0D, 0x05, 0x0F, 0x0A, 0x1F, 0x2B, 0x25, 0x21, 0x27,  |  Peach,  Yoshi, Sheik,     Falcon,    DDD,       Squirtle, Wolf,    Ike,     Sonic
0x0C, 0x15, 0x14, 0x17, 0x18, 0x2C, 0x20, 0x0B, 0x30,  |  Bowser, Wario, Ganondorf, Pit,       Olimar,    Ivysaur,  Lucario, Ness,    Knuckles
0x22, 0x24, 0x10, 0x2A, 0x2E, 0x19                     |  ROB,    Tink,  ICs,       Charizard, Mewtwo,    Lucas
@ $80680E80

* E2000001 80008000                             # Endif, BA = 0x80000000, PO = 0x80000000
# Regardless of the Roster though, since there's potential that the instructions the op@ commands overwrote
#   are currently cached, we have to deliberately uncache them to make sure we load the newly written ones!
HOOK @ $80682928    # 0x04 bytes into symbol "__ct/[muSelCharTask]/mu_selchar.o" @ 0x80682924
{
  lis r11, 0x8069               # Prep r11 to efficiently set up r12 for each of our cache block invalidates.
  addi r12, r11, 0x7F54         # \
  icbi r0, r12                  # / Flush Instruction for Zelda Check
  addi r12, r11, 0x7EE8         # \
  icbi r0, r12                  # / Flush Instruction for Sheik Check
  addi r12, r11, 0x00E4         # \
  icbi r0, r12                  # / Flush Instruction for Zelda Icon Fix
  addi r12, r11, 0x3D6C         # \
  icbi r0, r12                  # / Flush Instructions for Sheik Return Slot Fix & Sheik Return Cursor Fix
  mflr r0                       # Restore Original Instruction
}
#
# Handle L-Loads for both Roster versions. Because vBrawl Roster supports all P+ Roster L-Loads plus
#   some more, they're implemented in each code as a set of extra options, in addition to the original P+ ones.
.macro isBrawlRoster()
{
  lis r12, 0x804E                     # \
  lwz r12, 0x02DC(r12)                # / Load the address for the CSS Roster Line
  lwz r12, 0x08(r12)                  # Grab the currently selected option...
  cmplwi cr7, r12, 0x00               # ... and check if it's 0 (ie. the vBrawl Roster).
}
HOOK @ $806847BC    # 0xDC bytes into symbol "setToGlobal/[muSelCharTask]/mu_selchar.o" @ 0x806846E0
{
  cmpwi r3, 0x10; beq- %END%          # Check for     ICs -> Sopo
  cmpwi r3, 0x0C; beq- %END%          # Check for  Bowser -> Giga Bowser
  cmpwi r3, 0x15; beq- %END%          # Check for   Wario -> Warioman
  %isBrawlRoster()                    # Check if the vBrawl Roster is the selected version at the moment.
  bne cr7, %END%                      # If it isn't, then skip the following checks and exit early!
  cmpwi r3, 0x03; beq- %END%          # Check for   Samus -> ZSS
  cmpwi r3, 0x11; beq- %END%          # Check for   Marth -> Roy
  cmpwi r3, 0x20; beq- %END%          # Check for Lucario -> Mewtwo
  cmpwi r3, 0x27                      # Check for   Sonic -> Knuckles
}
HOOK @ $8068482C    # 0x14C bytes into symbol "setToGlobal/[muSelCharTask]/mu_selchar.o" @ 0x806846E0
{
  mr r0, r29                                  # Copy Char ID to r0 so we can still compare after modifying r29
  cmpwi r0, 0x10; li r29, 0x37; beq- %END%    # Check for     ICs -> Sopo
  cmpwi r0, 0x15; li r29, 0x36; beq- %END%    # Check for   Wario -> Warioman
  li r29, 0x38                                # If neither of the above, assume we're looking at Bowser -> Giga Bowser
  %isBrawlRoster()                            # Check if the vBrawl Roster is the selected version at the moment.
  bne cr7, %END%                              # If it isn't, then skip the following checks and exit early!
  cmpwi r0, 0x03; li r29, 0x04; beq- %END%    # Check for   Samus -> ZSS
  cmpwi r0, 0x11; li r29, 0x2D; beq- %END%    # Check for   Marth -> Roy
  cmpwi r0, 0x20; li r29, 0x2E; beq- %END%    # Check for Lucario -> Mewtwo
  li r29, 0x30;                               # If none of the above, then assume we're looking at Sonic -> Knuckles
}
HOOK @ $80685BE4    # 0x560 bytes into symbol "initPlayerArea/[muSelCharTask]/mu_selchar.o" @ 0x80685684
{
  cmpwi r5, 0x36; bne+ 0xC; li r5, 0x15; beq- loc_0x2C      # Check for    Warioman -> Wario
  cmpwi r5, 0x37; bne+ 0xC; li r5, 0x10; beq- loc_0x2C      # Check for        Sopo -> ICs
  cmpwi r5, 0x38; bne+ 0xC; li r5, 0x0C; beq- loc_0x2C      # Check for Giga Bowser -> Bowser
  %isBrawlRoster()                                          # Check if the vBrawl Roster is the selected version at the moment.
  bne cr7, loc_0x2C                                         # If it isn't, then skip the following checks and exit early!
  cmpwi r5, 0x04; bne+ 0xC; li r5, 0x03; beq- loc_0x2C      # Check for         ZSS -> Samus
  cmpwi r5, 0x2D; bne+ 0xC; li r5, 0x11; beq- loc_0x2C      # Check for         Roy -> Marth
  cmpwi r5, 0x2E; bne+ 0xC; li r5, 0x20; beq- loc_0x2C      # Check for      Mewtwo -> Lucario
  cmpwi r5, 0x30; bne+ loc_0x2C; li r5, 0x27;               # Check for    Knuckles -> Sonic
loc_0x2C:
  stw r5, 0x3C(r1)
}

#######
CSS ASM
#######
HOOK @ $800AF810
{
  rlwinm r0, r3, 4, 22, 27
  cmpwi r3, 0x40
  ble- %END%
  mr r3, r0
  addi r0, r3, 0x1
}

################################
Move CSS Slots [ds22, dantarion]
################################
* 80000000 80455458
* 80000001 80585B00
* 8A028001 00000000
op lis      r4, 0x8058 @ $800AF258; op addi r4, r4, 0x5B00 @ $800AF260
op lis      r4, 0x8058 @ $800AF31C; op addi r4, r4, 0x5B00 @ $800AF324
# op lis      r6, 0x8058 @ $800AF520;  # This operation is overwritten by the Unbounded Team Engine code and thus is omitted from compilation
                                    op addi r6, r6, 0x5B00 @ $800AF530
op lis      r4, 0x8058 @ $800AF708; op addi r4, r4, 0x5B00 @ $800AF710
op lis      r4, 0x8058 @ $800AF80C; op addi r4, r4, 0x5B00 @ $800AF814
op lis      r4, 0x8058 @ $800AF82C; op addi r4, r4, 0x5B00 @ $800AF834
op lis      r4, 0x8058 @ $800AF844; op addi r4, r4, 0x5B00 @ $800AF84C
op lis      r5, 0x8058 @ $800AF874; op addi r5, r5, 0x5B00 @ $800AF87C
op lis      r4, 0x8058 @ $800AF8D0; op addi r4, r4, 0x5B00 @ $800AF8D8
op lis      r5, 0x8058 @ $800AF91C; op addi r5, r5, 0x5B00 @ $800AF924
op lis      r5, 0x8058 @ $800AF93C; op addi r5, r5, 0x5B00 @ $800AF944
op lis      r5, 0x8058 @ $800AF960; op addi r5, r5, 0x5B00 @ $800AF968
op lis      r4, 0x8058 @ $800AF9C4; op addi r4, r4, 0x5B00 @ $800AF9CC
op li r0, 7            @ $800AF70C
CODE @ $80685824
{
    lis r3, 0x8068      # \
    add r3, r3, r0      # | Access the table below for random.
    lbz r3, 0xE80(r3)   # /
}

#############################
Independent Pokemon CSS Slots
#############################
word[8] -1, -1, -1, 0, -1, -1, -1, 0                @ $80585D80
word[4] 0x1EFF1B1C, 0x19C7, 0x80547B28, 0x80000000  @ $80585DA0
word[4] 0x20FF1B1D, 0x19C9, 0x80547B8E, 0x80000000  @ $80585DB0
word[4] 0x22FF1B1E, 0x19C6, 0x80547BF4, 0x80000000  @ $80585DC0

###################################################################
Special Fighter CSS slots + CSS HRC Fix (Modular) [ds22, DukeItOut]
###################################################################
word[4] 0x2DFF1135, 0x19D2, 0x8054785E, 0           @ $80585E60         #Wario-Man CSS Slot
word[4] 0x11100E0F, 0x19B5, 0x80547660, 0           @ $80585E70         #Sopo CSS Slot
byte[4] 0xF, 0x1, 0x10, 0x11                        @ $804557C8         #Sopo Cosmetics
word 0xF                                            @ $80AD836C         #IC Secondary Character
word[4] 0x2CFF0B30, 0x19BD, 0x805474C8, 0x80000000  @ $80585E80         #Giga Bowser CSS Slot
