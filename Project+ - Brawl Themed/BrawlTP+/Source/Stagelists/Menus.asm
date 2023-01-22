###############################################################
Set menus based on Code Menu Stagelist setting [Bird]
###############################################################
* 20523400 00000000 # If 80523400 is equal to 0
string "/menu2/mu_menumain.pac"         @ $806FB248
string "mu_menumain_en.pac"             @ $817F62BC
string "/menu2/sc_selcharacter2.pac"    @ $806FF308
string "sc_selcharacter2_en.pac"        @ $817F634D
string "/menu2/sc_selmap.pac"           @ $806FF3F0
string "sc_selmap_en.pac"               @ $817F637C
string "stageslot/"                     @ $80550C58 # This address might change and crash
string "stageinfo/"                     @ $80550C68 # This address might change and crash
* E0000000 80008000

###############################################################
Set menus based on Code Menu Stagelist setting [Bird]
###############################################################
* 24523400 00000000 # If 80523400 is greater to 0
string "/menu2/br_menumain.pac"         @ $806FB248
string "br_menumain_en.pac"             @ $817F62BC
string "/menu2/br_selcharacter2.pac"    @ $806FF308
string "br_selcharacter2_en.pac"        @ $817F634D
string "/menu2/br_selmap.pac"           @ $806FF3F0
string "br_selmap_en.pac"               @ $817F637C
string "stageslotbr/"                   @ $80550C58 # This address might change and crash
string "stageinfobr/"                   @ $80550C68 # This address might change and crash
* E0000000 80008000