###############################################################
Set menus based on Code Menu Stagelist setting [Bird]
###############################################################
* 204E0793 00000000 # If 804E0793 is equal to 0
string "/menu2/mu_menumain.pac"         @ $806FB248
string "mu_menumain_en.pac"             @ $817F62BC
string "/menu2/sc_selcharacter.pac"     @ $806FF2EC
string "sc_selcharacter_en.pac"         @ $817F6365
string "/menu2/sc_selcharacter2.pac"    @ $806FF308
string "sc_selcharacter2_en.pac"        @ $817F634D
string "/menu2/sc_selmap.pac"           @ $806FF3F0
string "sc_selmap_en.pac"               @ $817F637C
string "stageslot/"                     @ $80550C98 # This address might change and crash
string "stageinfo/"                     @ $80550CA8 # This address might change and crash
* E0000000 80008000

###############################################################
Set menus based on Code Menu Stagelist setting [Bird]
###############################################################
* 204E0793 00000001 # If value is equal to 1
string "/menu2/mu_menumain.pac"         @ $806FB248
string "mu_menumain_en.pac"             @ $817F62BC
string "/menu2/pp_selcharacter.pac"     @ $806FF2EC
string "pp_selcharacter_en.pac"         @ $817F6365
string "/menu2/pp_selcharacter2.pac"    @ $806FF308
string "pp_selcharacter2_en.pac"        @ $817F634D
string "/menu2/pp_selmap.pac"           @ $806FF3F0
string "pp_selmap_en.pac"               @ $817F637C
string "stageslot/"                   @ $80550C98 # This address might change and crash
string "stageinfo/"                   @ $80550CA8 # This address might change and crash
* E0000000 80008000