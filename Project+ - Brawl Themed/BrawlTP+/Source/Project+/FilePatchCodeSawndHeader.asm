##############################################################################################################################
SAWND File's Can Change Group Header Lengths [QuickLava]
##############################################################################################################################                                 
# Description:                                                  
#		A cut down and modified version of the SAWND Portion of the File Patch Code, meant to serve as a companion to said code.
#		Implements a system for preloading a small portion of each incoming SAWND in order to calculate its Group Header Length.
#		We then use this calculated length to overwrite the value stored in the BRSAR before the SAWND is loaded proper.
#		Specifically, the first 0x10 bytes of each SAWND are loaded to 0x800001D0. An additional 0x20 bytes following that range
#		are also used for getting the SAWND file's length.
##############################################################################################################################
HOOK @ $801C81B8																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
{
  li r6, 512				# Restore Original Instruction
  stwu r1, -0x80(r1)
  stmw r3, 8(r1)
  lis r3, 0x805A
  ori r3, r3, 0x7000
  stwu r1, 8(r3)		# place r1 in 805A7008
  mr r1, r3
  
  cmplwi r26, 0x0144		# Check if this is a custom soundbank, if so we need to patch the ID in
  blt- skipIDPatch
  lis r3, 0x9043
  ori r3, r3, 0x2134
  addi r27, r26, 0x07		# Add 7 to the soundbank ID
  stw r27, 0x00(r3)			# Store it for later.
skipIDPatch:

  addi r26, r26, 0x7	# add 7 to the soundbank ID for who knows what reason.
  lis r3, 0x805A
  ori r3, r3, 0x7D00
  stw r26, -0x20(r3)	# place r26 in 805A7CE0 after adding 7 to it. This will be the soundbank.
  
  lis r27, 0x8000			# \
  ori r27, r27, 0x01D0		# / Set r27 to our SAWND Header Destination

  li r4, 0x0
  stw r4, 0xC(r1)		# zero 805A700C, 805A7010 and 805A7018
  stw r4, 0x10(r1)		#\
  stw r27, 0x14(r1)		# | save r27 to 805A7014 
  stw r4, 0x18(r1)		#/
  li r4, 0xFFFF			#\-1 at 805A701C
  stw r4, 0x1C(r1)		#/
  addi r3, r1, 0x24		#\
  stw r3, 8(r1)			#/store 805A7020 to 805A7008 #points to "/private/wii/app/RSBE/pf/sfx/%03X."
  lis r4, 0x805A		#\set r4 to 805A7D18
  ori r4, r4, 0x7D18	#/
  subi r5, r26, 7		#move the soundbank to r5, but remove the 7 that wasn't needed before
  lis r12, 0x803F		#\
  ori r12, r12, 0x89FC	# |
  mtctr r12				# |branch to 803F89FC (sprintf/printf.o)
  bctrl 				#/
  cmpwi r26, 0x53		#\ Skip if not a normal stage soundbank
  blt+ NormalBank		# |
  cmpwi r26, 0x77		# |Stage soundbanks are range 0x53-0x77	(really 0x4C-70)
  bgt+ NormalBank		#/
  
  mr r4, r5				#
  lis r5, 0x5F00		# \ Concatenate "_"
  stw r5, 0x20(r1)		# /
  addi r4, r1, 0x20		#
  addi r3, r1, 0x24		# place the string character in r1+0x24
  lis r12, 0x803F		#
  ori r12, r12, 0xA384	# strcat
  mtctr r12				#
  bctrl 				#
  addi r3, r1, 0x24
  
  lis r12, 0x8053		# \ STEX pointer
  ori r12, r12, 0xF000	# /
  lwz r4, 0x1C(r12)		# Pointer to offset in string block for filename
  lwz r5, 0x4(r12)		# Pointer to string block
  add r4, r4, r12		# \ Obtain address for string of stage filename
  add r4, r4, r5		# /
  addi r3, r1, 0x24
  bctrl					# strcat again
  
  lis r4, 0x805A		# ".sawnd"	
  ori r4, r4, 0x7D2E	# 
  bctrl 				# strcat, yet again!
  addi r4, r1, 0x24		# r4 contains string containing the offset
  mr r3, r27				# Load SAWND header location
  li r6, 0x10				# Load SAWND Header Peek Length
  li r5, 0x0
  lis r12, 0x805A		# \ use file patch code to retrieve file 
  ori r12, r12, 0x7900	# |
  mtctr r12				# |
  bctrl 				# /
  cmpwi r3, 0x0			# \ but if it exists . . . . 
  beq+ gotSawnd			# /
  addi r3, r1, 0x24 	# \
  stw r3, 8(r1)			# / store the pointer to the string to r1+0x8 
  lis r4, 0x805A		# \	
  ori r4, r4, 0x7D18	# / get the pointer to "/legacyte/pf/sfx/%03X"
  subi r5, r26, 7		# r5 contains the decimal value of the soundbank ID . . . . which was given 7 earlier
  lis r12, 0x803F		# \
  ori r12, r12, 0x89FC	# | sprintf
  mtctr r12				# |
  bctrl 				# / 

NormalBank:
  addi r3, r1, 0x24		# r3 contains the pointer to where the string should be written  
  lis r12, 0x803F		# \
  ori r12, r12, 0xA384	# | move strcat to the count register 
  mtctr r12				# /
  lis r4, 0x805A		
  ori r4, r4, 0x7D2E	# ".sawnd"
  bctrl 				# strcat! 
  addi r4, r1, 0x24		# retrieve the string 
  mr r3, r27				# Load SAWND header location
  li r6, 0x10				# Load SAWND Header Peek Length
  li r5, 0x0
  lis r12, 0x805A		#\
  ori r12, r12, 0x7900	# | File Patch Code	
  mtctr r12				# |
  bctrl 				#/
  cmpwi r3, 0x0			#\
  bne- noSawnd			#/ If this file doesn't exist, load from the BRSAR.

gotSawnd:

							# Beginning of Sawnd Header Len Calc
							# Header Len = 1 (Tag) + 4 (Group) + 4 (Data Len)
							#				+ Num Files * 0xC (Length of Trips)
  lis r9, 0x90E6
  ori r9, r9, 0xF10
  lwz r9, 0(r9)				# Load pointer to BRSAR INFO Section?
  mr r4, r9
  mr r6, r4
  addi r6, r6, 0x8
  lwz r5, 0x2C(r4)			# Get offset of Groups Section Ref Vector
  add r4, r4, r5			# Add that to r4 to get address of Ref Vec
  addi r4, r4, 0x8			# (also add 8 afterwards to account for tag and size in header)
							# At this point, we have address of group vec in r4
					
  subi r8, r26, 0x7			# Store Group Info ID					
  cmplwi r8, 0x0144			# Check if this is a custom soundbank, if so we need to patch the ID in
  blt- notCustomBank
  lis r3, 0x9043			# Store address of Group Obj for Custom Bank
  ori r3, r3, 0x2134
  b sawndHeaderLenCalc
notCustomBank:
  mulli r8, r8, 0x8			# Multiply Info ID by 8 to index into vec
  add r3, r4, r8			# \ Add this offset to r4 (start of off vec)...
  addi r3, r3, 0x8			# / ... then add another 8 to get to offset of group obj
  lwz r8, 0x0(r3)			# Load the offset stored there
  add r3, r6, r8			# Add that offset to r6 to get group obj addr
							# At this point, r3 is group obj addr
sawndHeaderLenCalc:
	
  lwz r7, 0x28(r3)			# Get number of files in group
  mulli r7, r7, 0xC			# Multiply file count by length of file triplet
  addi r7, r7, 0x09			# Add 0x09 to account for Tag, Group ID, and Data Len
  stw r7, 0x10(r27)			# Store SAWND Header Length just past the preload line
  stw r3, 0x14(r27)			# Store the calculated Group Obj address as well
							# End of Sawnd Calc, r7 is now Sawnd Header Size
  							
  
  addi r3, r1, 0x24			# Load String ptr into r3
  addi r4, r27, 0x20		# Store destination pointer in r4
  lis r12, 0x803E			#\
  ori r12, r12, 0xBF6C		# | Load FAFSTAT func ptr into r12
  mtctr r12					# | We use this to grab the size of our SAWND file
  bctrl 					#/
  lwz r12, 0x20(r27)		# Recover our file size.
  lwz r5, 0x10(r27)			# Grab Sawnd Header Length again
  sub r12, r12, r5			# Subtract it from Total Length
  lwz r5, 0x5(r27)			# Grab Sawnd Data Length
  sub r12, r12, r5			# Subtract it from Total Length. r12 is now header length

  lwz r5, 0x14(r27)			# Recover Group Obj Address
  lwz r11, 0x10(r5)			# Get stored header address from group header
  stw r12, 0x14(r5)			# Store calculated header length in group header
  add r11, r11, r12			# Add calc'd header length to header addr to get data addr
  stw r11, 0x18(r5)			# Store updated data address in group header
  lwz r12, 0x5(r27)			# Grab Sawnd Data Length
  stw r12, 0x1C(r5)			# Store updated data length in group header

noSawnd:
  lis r1, 0x805A		# \
  ori r1, r1, 0x7000	#  | Retrieve old registers 
  lwz r1, 8(r1)			#  |
  lmw r3, 8(r1)			#  |
  addi r1, r1, 0x80		# /
  b %END%
}