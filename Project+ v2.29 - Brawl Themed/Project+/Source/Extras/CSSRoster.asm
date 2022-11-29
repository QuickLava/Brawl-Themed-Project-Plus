###############################################################################
Set Roster + Random Select based on Code Menu Roster setting [ilikepizza107]
###############################################################################
* 200017B4 00000000 # If 800017B4 is equal to 0

########################################################
CSS Fixes for Samus/ZSS and Zelda/Shiek v2.2 [spunit262]
########################################################
op li r4, 0x4	@ $80693D50	# ZSS return cursor fix
CODE @ $80693D6C
!{
  li r0, 0x0	# 0x0 Zelda CSP?, 0x1 Sheik CSP?
  li r4, 0xF	# Sheik return cursor fix
}
#op NOP			@ $806900E8	# Zelda CCS Icon fix
#op NOP			@ $80697EEC	# Prevents selecting Zelda from Sheik's CSP (beq- 0x0C)
#op NOP			@ $80697F58	# Prevents selecting Sheik from Zelda's CSP (beq- 0x0C)
op li r0, 0x0	@ $80684EE0	# Allows selecting the same Costume ID

##############################################################################
[Project+] CSS Roster Data v3&K [spunit262, order by ilikepizza107]
##############################################################################
byte[36] |
0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x08, | 
0x11, 0x12, 0x09, 0x1A, 0x0E, 0x17, 0x16, |
0x13, 0x1B, 0x21, 0x26, 0x0D, 0x05, 0x14, |
0x10, 0x1F, 0x25, 0x20, 0x0B, 0x27, 0x0C, |
0x15, 0x24, 0x22, 0x18, 0x0A, 0x23, 0x19, 0x29 |
@ $80680DE0

############################################
[Project+] CSS Random Data [ds22, dantarion]
############################################
op li r23, 35 @ $806857F0 	# Set the range random allows
byte[35] |
0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x08, | 
0x11, 0x12, 0x09, 0x1A, 0x0E, 0x17, 0x16, |
0x13, 0x1B, 0x21, 0x26, 0x0D, 0x05, 0x14, |
0x10, 0x1F, 0x25, 0x20, 0x0B, 0x27, 0x0C, |
0x15, 0x24, 0x22, 0x18, 0x0A, 0x23, 0x19  |
@ $80680E80

##############################################
Hold Shield for Special Fighter [ds22, Spigel]
##############################################
HOOK @ $806847BC
{
  cmpwi r3, 0x03;  beq- %END%	# Samus
  cmpwi r3, 0x11;  beq- %END%	# Marth
  cmpwi r3, 0x0C;  beq- %END%	# Bowser
  cmpwi r3, 0x10;  beq- %END%	# Ice Climbers
  cmpwi r3, 0x15;  beq- %END%	# Wario
  cmpwi r3, 0x20;  beq- %END%	# Lucario
  cmpwi r3, 0x27				# Sonic
}
HOOK @ $8068482C
{
  cmpwi r29, 0x03;  bne- loc_0x10
  li r29, 0x04;  b %END%
loc_0x10:
  cmpwi r29, 0x11;  bne- loc_0x20
  li r29, 0x2D;  b %END%
loc_0x20:
  cmpwi r29, 0x0C;  bne- loc_0x30
  li r29, 0x38;  b %END%
loc_0x30:
  cmpwi r29, 0x10;  bne- loc_0x40
  li r29, 0x37;  b %END%
loc_0x40:
  cmpwi r29, 0x15;  bne- loc_0x50
  li r29, 0x36;  b %END%
loc_0x50:
  cmpwi r29, 0x20;  bne- loc_0x60
  li r29, 0x2E;  b %END%
loc_0x60:
  li r29, 0x30
}
HOOK @ $80685BE4
{
  cmpwi r5, 0x04;  beq- loc_0x40
  cmpwi r5, 0x2D;  beq- loc_0x48
  cmpwi r5, 0x2E;  beq- loc_0x50
  cmpwi r5, 0x30;  beq- loc_0x58
  cmpwi r5, 0x37;  beq- loc_0x60
  cmpwi r5, 0x38;  beq- loc_0x68
  cmpwi r5, 0x36;  bne- loc_0x6C
  
  li r5, 0x15;  b loc_0x6C
loc_0x40:
  li r5, 0x03;  b loc_0x6C
loc_0x48:
  li r5, 0x11;  b loc_0x6C
loc_0x50:
  li r5, 0x20;  b loc_0x6C
loc_0x58:
  li r5, 0x27;  b loc_0x6C
loc_0x60:
  li r5, 0x10;  b loc_0x6C
loc_0x68:
  li r5, 0x0C
loc_0x6C:
  stw r5, 0x3C(r1)
}

* E0000000 80008000

###############################################################################
Set Roster + Random Select based on Code Menu Roster setting [ilikepizza107]
###############################################################################
* 200017B4 00000001 # If 800017B4 is equal to 1

########################################################
CSS Fixes for Samus/ZSS and Zelda/Shiek v2.2 [spunit262]
########################################################
op li r4, 0x4	@ $80693D50
CODE @ $80693D6C
{
  li r0, 0x0
  li r4, 0xF	
}
op NOP 			@ $806900E8
op NOP 			@ $80697F58
op NOP 			@ $80697EEC
op li r0, 0x0	@ $80684EE0

##################################
CSS Fixes for Knuckles [spunit262]
##################################
* C268DBCC 00000002
* 2C1D0028 41820008
* 2C1D0029 00000000
* 0468DBD0 4182003C
* 04693D50 38800004
* 06693D6C 00000008
* 38000000 3880000F
* 046900E8 60000000
* 04697F58 60000000
* 04697EEC 60000000
* 04684EE0 38000000

#############################################################################################
[Project+] CSS Roster Data v3&K [spunit262, order by Bird, DukeItOut, Motobug, ilikepizza107]
#############################################################################################
byte[43] |
0x00, 0x01, 0x02, 0x03, 0x06, 0x08, 0x07, 0x11, |
0x12, 0x09, 0x1A, 0x0E, 0x04, 0x16, 0x23, 0x13, |
0x2D, 0x26, 0x0D, 0x05, 0x0F, 0x0A, 0x1F, 0x2B, |
0x25, 0x21, 0x27, 0x0C, 0x15, 0x14, 0x17, 0x18, |
0x2C, 0x20, 0x0B, 0x30, 0x22, 0x24, 0x10, 0x29, |
0x2A, 0x2E, 0x19 | 
@ $80680DE0

############################################
[Project+] CSS Random Data [ds22, dantarion]
############################################
op li r23, 42 @ $806857F0 	# Set the range random allows
byte[42] |
0x15, 0x00, 0x09, 0x0D, 0x0C, 0x05, 0x01, 0x1A, |
0x0A, 0x25, 0x07, 0x13, 0x10, 0x0E, 0x0F, 0x02, |
0x24, 0x14, 0x2E, 0x20, 0x08, 0x23, 0x2B, 0x2C, |
0x2A, 0x03, 0x04, 0x19, 0x0B, 0x17, 0x06, 0x16, |
0x1F, 0x21, 0x11, 0x2D, 0x18, 0x22, 0x12, 0x26, |
0x27, 0x30 |
@ $80680E80

######################################
Hold Shield for Special Fighter [ds22]
######################################
HOOK @ $806847BC
{
  cmpwi r3, 0x10;  beq- %END%
  cmpwi r3, 0xC;   beq- %END%
  cmpwi r3, 0x15
}
HOOK @ $8068482C
{
  cmpwi r29, 0x10;  bne- loc_0x10
  li r29, 0x37;  b %END%
loc_0x10:
  cmpwi r29, 0x15;  beq- loc_0x20
  li r29, 0x38;  b %END%
loc_0x20:
  li r29, 0x36
}
HOOK @ $80685BE4
{
  cmpwi r5, 0x36;  beq- loc_0x20
  cmpwi r5, 0x37;  beq- loc_0x28
  cmpwi r5, 0x38;  bne- loc_0x2C
  
  li r5, 0xC;  b loc_0x2C
loc_0x20:
  li r5, 0x15;  b loc_0x2C
loc_0x28:
  li r5, 0x10
loc_0x2C:
  stw r5, 0x3C(r1)
}

* E0000000 80008000