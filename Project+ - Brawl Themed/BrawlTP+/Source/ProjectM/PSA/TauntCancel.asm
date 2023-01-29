# 9019A500 -> 80545C10 Runstop & Taunts Go into Teeter (Taunt Canceling v2.2) [Shanus, Camelot, Wind Owl]
# 901A1000 -> 80545C30 Taunt IASA While Running/Dashing & Slide off Edges while Dashing v2.0 [Wind Owl]
##################################################################################
Runstop & Taunts Go into Teeter (Taunt Canceling v2.2) [Shanus, Camelot, Wind Owl]
##################################################################################
.alias PSA_Off = 0x80545C10
# Teeter if over ledge
CODE @ $80545C10
{
	word 2; word PSA_Off+0x08
	word 0x02010200; word 0x80FBF254	#Change Action: Requirement: Action=E, Requirement=In Air 
	word 0x02010200; word 0x80FAB64C 	#Change Action: Requirement: Action=7C, Requirement=Has Passed Over an Edge (Forward)
	word 0x00080000; word 0 			#return
}
CODE @ $80FC3708
{
	word 0x00070100; word PSA_Off 		#Sub routine: Teeter if over ledge
}
CODE @ $80FACDEC
{
	word 0x00070100; word PSA_Off 		#Sub routine: Teeter if over ledge
}

###################################################################################################
Taunt IASA While Running/Dashing & Slide off Edges while Dashing v3.0-QL [Wind Owl, Eon, QuickLava]
# Note: The original v3.0 code overwrote the commands which gave dashing the possibility to trip.
# This version restores those commands so that tripping is once again *possible* out of dash, that
# way other codes which re-enable tripping on their own can have the full effect. Importantly,
# these restored tripping commands cannot actually cause a trip if some other code which disables
# tripping (eg. by setting Trip Rate to zero) is active, so it should be completely safe to use
# in competitive evironments!
###################################################################################################
.alias PSA_Off = 0x80545C30

CODE @ $80FAC60C #0x80F9FC20+0xC9F4
{
	word 0x00070100; word 0x80545C40	# Call Subroutine Below
	word 0x08000100; word 0x80FA1520 	#Set Aerial/Onstage State: Can drop off side of stage
}

CODE @ $80545C40
{
	word 2; word 0x80545C48				# Sub Routine Pointer Arg (points to the following lines)
	word 0x02010300; word PSA_Off 		# Change Action to taunt if taunt pressed
	word 0x02000400; word 0x80FAC3F4	# Restore vBrawl Trip "Change Action Status": E=02000400:0-0000271A,0-0000008C,6-00002714,0-00000002,
	word 0x02040200; word 0x80FAC414	# Restore vBrawl Trip "Additional Requirement": E=02040200:6-80000008,5-22000013,
	word 0x00080000; word 0				# Return from Sub Routine
}

CODE @ $80FAC3FC
{
	word 0x00000000; word 0x0000008C	# Sets action that's run when tripping out of Dash. Set to 0x8C (Forward Slip) by default.
										# Note, however, that some characters (Peach, Snake, and Ganon, in my testing) have various
										# problems with this particular action in PM/P+. For that reason, picking a different one may be
										# a good idea. 0x8A (SlipFall) is a decent alternative here, though most actions should work.
}

CODE @ $80FAC974 #0x80F9FC20+0xCD54
{
	word 0x02010300; word PSA_Off 	#Change Action to taunt if taunt pressed
	word 0x00020000; word 0
	word 0x00020000; word 0
}

CODE @ $80545C30
{
	#change action to 0x10C if any taunt button pressed
	word 0; word 0x10C
	word 6; word 0x50
				
}
