###########################################
CSS Selections Preserved in VS Mode [Magus]
###########################################
op b 0x3C @ $806DCA90

#############################
CSS Record Display Fix [ds22]
#############################
HOOK @ $8068DBCC
{
  cmpwi r29, 0x28
  beq- %END%
  cmpwi r29, 0x29
}
op beq- 0x3C @ $8068DBD0


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

#############################################
CSS Fixes for Giga and Company v2 [spunit262]
#############################################
HOOK @ $80684940
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
op li r0, 7			   @ $800AF70C
CODE @ $80685824
{
	lis r3, 0x8068		# \
	add r3, r3, r0		# | Access the table below for random.
	lbz r3, 0xE80(r3)	# /
}

############################################
[Project+] CSS Random Data [ds22, dantarion]
############################################
op li r23, 34 @ $806857F0 	# Set the range random allows
byte[34] |
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

#############################
Independent Pokemon CSS Slots
#############################
word[8] -1, -1, -1, 0, -1, -1, -1, 0 				@ $80585D80
word[4] 0x1EFF1B1C, 0x19C7, 0x80547B28, 0x80000000	@ $80585DA0
word[4] 0x20FF1B1D, 0x19C9, 0x80547B8E, 0x80000000  @ $80585DB0
word[4] 0x22FF1B1E, 0x19C6, 0x80547BF4, 0x80000000  @ $80585DC0

###################################################################
Special Fighter CSS slots + CSS HRC Fix (Modular) [ds22, DukeItOut]
###################################################################
word[4] 0x2D171114, 0x19D2, 0x8054785E, 0		    @ $80585E60
word[4] 0x11FF0E0F, 0x19B5, 0x80547660, 0			@ $80585E70
byte[4] 0xF, 0x1, 0x10, 0x11 						@ $804557C8
word 0xF 											@ $80AD836C
word[4] 0x2C0C0B30, 0x19BD, 0x805474C8, 0x80000000	@ $80585E80
