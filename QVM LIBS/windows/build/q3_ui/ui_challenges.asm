data
align 4
LABELV challengesInitialized
byte 4 0
export challenges_init
code
proc challenges_init 16 12
file "../../../code/q3_ui/../cgame/cg_challenges.c"
line 44
;1:/*
;2:===========================================================================
;3:Copyright (C) 2008 Poul Sander
;4:
;5:This file is part of Open Arena source code.
;6:
;7:Open Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Open Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Open Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23://#include "cg_local.h"
;24:#include "../qcommon/q_shared.h"
;25:#include "../renderer/tr_types.h"
;26:#include "../game/bg_public.h"
;27:#include "../game/challenges.h"
;28:#ifdef PARTofUI
;29:#include "../q3_ui/ui_local.h"
;30:#else
;31:#include "../cgame/cg_local.h"
;32:#endif
;33:
;34:#define FILENAME    "challenges.dat"
;35:
;36://First two static variables that may only be accessed throgh functions in this file
;37://The challengeTable is of constant size so there is room for more challenges being added in the furture
;38:static unsigned int challengeTable[CHALLENGES_MAX];
;39://We have a variable to see if the system is initialized
;40:static qboolean challengesInitialized = qfalse;
;41:
;42://This function initializes the challenge system. It has no effect if the system is already intialized.
;43:void challenges_init(void)
;44:{
line 50
;45:    fileHandle_t file;
;46:    int fileLen;
;47:    int i;
;48:
;49://If already initialized then do nothing
;50:    if(challengesInitialized)
ADDRGP4 challengesInitialized
INDIRI4
CNSTI4 0
EQI4 $80
line 51
;51:        return;
ADDRGP4 $79
JUMPV
LABELV $80
line 54
;52:
;53://Else open file
;54:    fileLen = trap_FS_FOpenFile(FILENAME, &file, FS_READ);
ADDRGP4 $82
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 57
;55:
;56://If the file not is big enough to contain all challenges then initialize from zero
;57:    if(fileLen<sizeof(challengeTable))
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 8192
GEU4 $83
line 58
;58:    {
line 59
;59:	trap_FS_FCloseFile(file); //Lets remeber to close the file before all returns
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 60
;60:	for(i=0;i<CHALLENGES_MAX;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $85
line 61
;61:		challengeTable[i]=0; //Init all challenges to zero
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 challengeTable
ADDP4
CNSTU4 0
ASGNU4
LABELV $86
line 60
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2048
LTI4 $85
line 62
;62:	challengesInitialized = qtrue; //Still consider the system loaded!
ADDRGP4 challengesInitialized
CNSTI4 1
ASGNI4
line 63
;63:        return; //Not enough data to actually read
ADDRGP4 $79
JUMPV
LABELV $83
line 67
;64:    }
;65:
;66://If the file is big enough:
;67:	trap_FS_Read(challengeTable,sizeof(challengeTable),file);
ADDRGP4 challengeTable
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 69
;68:
;69:trap_FS_FCloseFile(file); //Lets remember to close the file
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 70
;70:    challengesInitialized = qtrue; //We are initialized!
ADDRGP4 challengesInitialized
CNSTI4 1
ASGNI4
line 71
;71:    return;
LABELV $79
endproc challenges_init 16 12
export challenges_save
proc challenges_save 16 12
line 76
;72:}
;73:
;74://This functions saves the challenges. It only needs to be called once for each game. It should be called from the shutdown function
;75:void challenges_save(void)
;76:{
line 80
;77:	fileHandle_t file;
;78:	int fileStatus;
;79:	int i;
;80:	if(!challengesInitialized)
ADDRGP4 challengesInitialized
INDIRI4
CNSTI4 0
NEI4 $90
line 81
;81:	{
line 84
;82:		//The challenge system has not been initialized and therefore cannot be saved
;83:		//CG_Printf("Challenge system not initialized.\n");
;84:        	return;
ADDRGP4 $89
JUMPV
LABELV $90
line 87
;85:	}
;86:	//Open the challenges file for writing:
;87:	fileStatus = trap_FS_FOpenFile(FILENAME, &file, FS_WRITE);
ADDRGP4 $82
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 88
;88:	if(fileStatus<0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $92
line 89
;89:	{
line 94
;90:		//For some reason file opening failed
;91:                #ifndef PARTofUI
;92:		CG_Printf("Failed to open challenges.dat for writing\n");
;93:                #endif
;94:		return;
ADDRGP4 $89
JUMPV
LABELV $92
line 96
;95:	}
;96:	for(i=0;i<CHALLENGES_MAX;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $94
line 97
;97:	{
line 99
;98:		//Write the table to disk
;99:		trap_FS_Write((const void*)&challengeTable[i],sizeof(unsigned int),file);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 challengeTable
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 100
;100:	}
LABELV $95
line 96
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2048
LTI4 $94
line 103
;101:
;102:	//Always close the file in id tech 3
;103:	trap_FS_FCloseFile(file);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 105
;104:	//Lets make the challenges system uninitialized since changes after this will most likely not be saved anyway.
;105:	challengesInitialized = qfalse;
ADDRGP4 challengesInitialized
CNSTI4 0
ASGNI4
line 109
;106:        #ifndef PARTofUI
;107:	CG_Printf("Wrote challenges.cfg\n");
;108:        #endif
;109:}
LABELV $89
endproc challenges_save 16 12
export getChallenge
proc getChallenge 0 0
line 113
;110:
;111://Get the number of times a given challenge has been completed
;112:unsigned int getChallenge(int challenge)
;113:{
line 114
;114:	challenges_init();
ADDRGP4 challenges_init
CALLV
pop
line 115
;115:	if(challenge>=CHALLENGES_MAX)
ADDRFP4 0
INDIRI4
CNSTI4 2048
LTI4 $99
line 116
;116:		return 0;
CNSTU4 0
RETU4
ADDRGP4 $98
JUMPV
LABELV $99
line 117
;117:	return challengeTable[challenge];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 challengeTable
ADDP4
INDIRU4
RETU4
LABELV $98
endproc getChallenge 0 0
export addChallenge
proc addChallenge 4 0
line 121
;118:}
;119:
;120:void addChallenge(int challenge)
;121:{
line 122
;122:	if(challenge>=CHALLENGES_MAX)
ADDRFP4 0
INDIRI4
CNSTI4 2048
LTI4 $102
line 123
;123:	{
line 127
;124:                #ifndef PARTofUI
;125:		CG_Printf("Challenge #%u is >=CHALLENGES_MAX\n",challenge);
;126:                #endif
;127:		return; //Maybe also print an error?	
ADDRGP4 $101
JUMPV
LABELV $102
line 129
;128:	}
;129:	challenges_init();
ADDRGP4 challenges_init
CALLV
pop
line 130
;130:	challengeTable[challenge]++;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 challengeTable
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
line 132
;131:	//CG_Printf("Increased challenge #%u by one. Is now %u\n",challenge,challengeTable[challenge]);
;132:}
LABELV $101
endproc addChallenge 4 0
proc UI_Challenges_Event 16 0
file "../../../code/q3_ui/ui_challenges.c"
line 84
;1:/*
;2:===========================================================================
;3:Copyright (C) 2008-2009 Poul Sander
;4:
;5:This file is part of the Open Arena source code.
;6:
;7:Open Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Open Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Open Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:#include "ui_local.h"
;24:#include "../game/challenges.h"
;25:
;26://This is an ugly way of syncing to cgame but it is platform compatible
;27:#define PARTofUI 1
;28:#include "../cgame/cg_challenges.c"
;29:
;30:#define ID_BACK                         1
;31:
;32://Main menu:
;33:#define ID_GENERAL			100
;34:#define ID_GAMETYPES                    101
;35:#define ID_WEAPONS                      102
;36:#define ID_AWARDS                       103
;37:#define ID_POWERUPS                     104
;38:#define ID_FFA                          105
;39:
;40:#define ART_BACK0		"menu/art_blueish/back_0"
;41:#define ART_BACK1		"menu/art_blueish/back_1"
;42:#define ART_FRAMEL		"menu/art_blueish/frame2_l"
;43:#define ART_FRAMER		"menu/art_blueish/frame1_r"
;44:
;45:#define MAX_ENTRIES                     18
;46:#define MAX_INT_AS_STRING               8
;47:
;48:typedef struct {
;49:	menuframework_s	menu;
;50:
;51:	menutext_s	banner;
;52:	menubitmap_s	framel;
;53:	menubitmap_s	framer;
;54:
;55:	menutext_s	general;
;56:	menutext_s	gametypes;
;57:	menutext_s      weapons;
;58:        menutext_s      awards;
;59:        menutext_s      powerups;
;60:
;61:        int             numberOfEntries;
;62:        menutext_s	entry[MAX_ENTRIES];
;63:        menutext_s	entryIntText[MAX_ENTRIES];
;64:        char            entryIntString[MAX_ENTRIES][MAX_INT_AS_STRING];
;65:        int             entryInt[MAX_ENTRIES];
;66:
;67:        menutext_s      notice;
;68:        menutext_s      notice2;
;69:	menubitmap_s	back;
;70:} challenges_t;
;71:
;72:static challenges_t challenges;
;73:
;74:static int             mainSelection;
;75:
;76://This should only be accessed locally
;77:void UI_ChallengesLocal( void );
;78:
;79:/*
;80:=================
;81:UI_Challenges_Event
;82:=================
;83:*/
;84:static void UI_Challenges_Event( void* ptr, int event ) {
line 85
;85:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $106
line 86
;86:		return;
ADDRGP4 $105
JUMPV
LABELV $106
line 89
;87:	}
;88:
;89:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $117
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $108
LABELV $118
ADDRLP4 0
INDIRI4
CNSTI4 100
LTI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 105
GTI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $119-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $119
address $111
address $112
address $113
address $114
address $115
address $109
code
LABELV $111
line 91
;90:	case ID_GENERAL:
;91:            mainSelection = 0;
ADDRGP4 mainSelection
CNSTI4 0
ASGNI4
line 92
;92:            UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 93
;93:            UI_ChallengesLocal();
ADDRGP4 UI_ChallengesLocal
CALLV
pop
line 94
;94:		break;
ADDRGP4 $109
JUMPV
LABELV $112
line 97
;95:
;96:	case ID_GAMETYPES:
;97:            mainSelection = 1;
ADDRGP4 mainSelection
CNSTI4 1
ASGNI4
line 98
;98:            UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 99
;99:            UI_ChallengesLocal();
ADDRGP4 UI_ChallengesLocal
CALLV
pop
line 100
;100:		break;
ADDRGP4 $109
JUMPV
LABELV $113
line 103
;101:
;102:	case ID_WEAPONS:
;103:            mainSelection = 2;
ADDRGP4 mainSelection
CNSTI4 2
ASGNI4
line 104
;104:            UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 105
;105:            UI_ChallengesLocal();
ADDRGP4 UI_ChallengesLocal
CALLV
pop
line 106
;106:		break;
ADDRGP4 $109
JUMPV
LABELV $114
line 109
;107:
;108:	case ID_AWARDS:
;109:            mainSelection = 3;
ADDRGP4 mainSelection
CNSTI4 3
ASGNI4
line 110
;110:            UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 111
;111:            UI_ChallengesLocal();
ADDRGP4 UI_ChallengesLocal
CALLV
pop
line 112
;112:		break;
ADDRGP4 $109
JUMPV
LABELV $115
line 115
;113:
;114:        case ID_POWERUPS:
;115:            mainSelection = 4;
ADDRGP4 mainSelection
CNSTI4 4
ASGNI4
line 116
;116:            UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 117
;117:            UI_ChallengesLocal();
ADDRGP4 UI_ChallengesLocal
CALLV
pop
line 118
;118:		break;
ADDRGP4 $109
JUMPV
line 121
;119:
;120:        case ID_FFA:
;121:		break;
LABELV $117
line 124
;122:
;123:	case ID_BACK:
;124:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 125
;125:		break;
LABELV $108
LABELV $109
line 127
;126:	}
;127:}
LABELV $105
endproc UI_Challenges_Event 16 0
export UI_Challenges_Cache
proc UI_Challenges_Cache 0 4
line 134
;128:
;129:/*
;130:===============
;131:UI_Challenges_Cache
;132:===============
;133:*/
;134:void UI_Challenges_Cache( void ) {
line 135
;135:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $122
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 136
;136:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $123
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 137
;137:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $124
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 138
;138:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $125
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 139
;139:}
LABELV $121
endproc UI_Challenges_Cache 0 4
proc UI_Challenges_Init 160 12
line 146
;140:
;141:/*
;142:===============
;143:UI_Challenges_Init
;144:===============
;145:*/
;146:static void UI_Challenges_Init( void ) {
line 149
;147:    int y,i;
;148:
;149:	memset( &challenges, 0, sizeof(challenges) );
ADDRGP4 challenges
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4068
ARGI4
ADDRGP4 memset
CALLP4
pop
line 151
;150:
;151:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 152
;152:	challenges.menu.wrapAround = qtrue;
ADDRGP4 challenges+404
CNSTI4 1
ASGNI4
line 153
;153:	challenges.menu.fullscreen = qtrue;
ADDRGP4 challenges+408
CNSTI4 1
ASGNI4
line 155
;154:
;155:	challenges.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 challenges+416
CNSTI4 10
ASGNI4
line 156
;156:	challenges.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 challenges+416+44
CNSTU4 8
ASGNU4
line 157
;157:	challenges.banner.generic.x			= 320;
ADDRGP4 challenges+416+12
CNSTI4 320
ASGNI4
line 158
;158:	challenges.banner.generic.y			= 16;
ADDRGP4 challenges+416+16
CNSTI4 16
ASGNI4
line 159
;159:	challenges.banner.string			= "STATISTICS";
ADDRGP4 challenges+416+60
ADDRGP4 $138
ASGNP4
line 160
;160:	challenges.banner.color				= color_white;
ADDRGP4 challenges+416+68
ADDRGP4 color_white
ASGNP4
line 161
;161:	challenges.banner.style				= UI_CENTER;
ADDRGP4 challenges+416+64
CNSTI4 1
ASGNI4
line 163
;162:
;163:	challenges.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 challenges+488
CNSTI4 6
ASGNI4
line 164
;164:	challenges.framel.generic.name		= ART_FRAMEL;
ADDRGP4 challenges+488+4
ADDRGP4 $122
ASGNP4
line 165
;165:	challenges.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 challenges+488+44
CNSTU4 16384
ASGNU4
line 166
;166:	challenges.framel.generic.x			= 0;
ADDRGP4 challenges+488+12
CNSTI4 0
ASGNI4
line 167
;167:	challenges.framel.generic.y			= 78;
ADDRGP4 challenges+488+16
CNSTI4 78
ASGNI4
line 168
;168:	challenges.framel.width				= 256;
ADDRGP4 challenges+488+76
CNSTI4 256
ASGNI4
line 169
;169:	challenges.framel.height			= 329;
ADDRGP4 challenges+488+80
CNSTI4 329
ASGNI4
line 171
;170:
;171:	challenges.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 challenges+576
CNSTI4 6
ASGNI4
line 172
;172:	challenges.framer.generic.name		= ART_FRAMER;
ADDRGP4 challenges+576+4
ADDRGP4 $123
ASGNP4
line 173
;173:	challenges.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 challenges+576+44
CNSTU4 16384
ASGNU4
line 174
;174:	challenges.framer.generic.x			= 376;
ADDRGP4 challenges+576+12
CNSTI4 376
ASGNI4
line 175
;175:	challenges.framer.generic.y			= 76;
ADDRGP4 challenges+576+16
CNSTI4 76
ASGNI4
line 176
;176:	challenges.framer.width				= 256;
ADDRGP4 challenges+576+76
CNSTI4 256
ASGNI4
line 177
;177:	challenges.framer.height			= 334;
ADDRGP4 challenges+576+80
CNSTI4 334
ASGNI4
line 179
;178:
;179:        challenges.general.generic.type		= MTYPE_PTEXT;
ADDRGP4 challenges+664
CNSTI4 9
ASGNI4
line 180
;180:	challenges.general.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 challenges+664+44
CNSTU4 272
ASGNU4
line 181
;181:	challenges.general.generic.id			= ID_GENERAL;
ADDRGP4 challenges+664+8
CNSTI4 100
ASGNI4
line 182
;182:	challenges.general.generic.callback	= UI_Challenges_Event;
ADDRGP4 challenges+664+48
ADDRGP4 UI_Challenges_Event
ASGNP4
line 183
;183:	challenges.general.generic.x			= 216;
ADDRGP4 challenges+664+12
CNSTI4 216
ASGNI4
line 184
;184:	challenges.general.generic.y			= 240 - 1 * PROP_HEIGHT;
ADDRGP4 challenges+664+16
CNSTI4 213
ASGNI4
line 185
;185:	challenges.general.string				= "GENERAL";
ADDRGP4 challenges+664+60
ADDRGP4 $182
ASGNP4
line 186
;186:	challenges.general.style				= UI_RIGHT;
ADDRGP4 challenges+664+64
CNSTI4 2
ASGNI4
line 187
;187:	challenges.general.color				= color_red;
ADDRGP4 challenges+664+68
ADDRGP4 color_red
ASGNP4
line 199
;188:
;189:	/*challenges.gametypes.generic.type			= MTYPE_PTEXT;
;190:	challenges.gametypes.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
;191:	challenges.gametypes.generic.id			= ID_GAMETYPES;
;192:	challenges.gametypes.generic.callback		= UI_Challenges_Event;
;193:	challenges.gametypes.generic.x			= 216;
;194:	challenges.gametypes.generic.y			= 240 - PROP_HEIGHT;
;195:	challenges.gametypes.string				= "GAMETYPES";
;196:	challenges.gametypes.style				= UI_RIGHT;
;197:	challenges.gametypes.color				= color_red;*/
;198:
;199:	challenges.weapons.generic.type			= MTYPE_PTEXT;
ADDRGP4 challenges+808
CNSTI4 9
ASGNI4
line 200
;200:	challenges.weapons.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 challenges+808+44
CNSTU4 272
ASGNU4
line 201
;201:	challenges.weapons.generic.id				= ID_WEAPONS;
ADDRGP4 challenges+808+8
CNSTI4 102
ASGNI4
line 202
;202:	challenges.weapons.generic.callback		= UI_Challenges_Event;
ADDRGP4 challenges+808+48
ADDRGP4 UI_Challenges_Event
ASGNP4
line 203
;203:	challenges.weapons.generic.x				= 216;
ADDRGP4 challenges+808+12
CNSTI4 216
ASGNI4
line 204
;204:	challenges.weapons.generic.y				= 240;
ADDRGP4 challenges+808+16
CNSTI4 240
ASGNI4
line 205
;205:	challenges.weapons.string					= "WEAPONS";
ADDRGP4 challenges+808+60
ADDRGP4 $200
ASGNP4
line 206
;206:	challenges.weapons.style					= UI_RIGHT;
ADDRGP4 challenges+808+64
CNSTI4 2
ASGNI4
line 207
;207:	challenges.weapons.color					= color_red;
ADDRGP4 challenges+808+68
ADDRGP4 color_red
ASGNP4
line 209
;208:
;209:	challenges.awards.generic.type			= MTYPE_PTEXT;
ADDRGP4 challenges+880
CNSTI4 9
ASGNI4
line 210
;210:	challenges.awards.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 challenges+880+44
CNSTU4 272
ASGNU4
line 211
;211:	challenges.awards.generic.id			= ID_AWARDS;
ADDRGP4 challenges+880+8
CNSTI4 103
ASGNI4
line 212
;212:	challenges.awards.generic.callback		= UI_Challenges_Event;
ADDRGP4 challenges+880+48
ADDRGP4 UI_Challenges_Event
ASGNP4
line 213
;213:	challenges.awards.generic.x			= 216;
ADDRGP4 challenges+880+12
CNSTI4 216
ASGNI4
line 214
;214:	challenges.awards.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 challenges+880+16
CNSTI4 267
ASGNI4
line 215
;215:	challenges.awards.string				= "AWARDS";
ADDRGP4 challenges+880+60
ADDRGP4 $218
ASGNP4
line 216
;216:	challenges.awards.style				= UI_RIGHT;
ADDRGP4 challenges+880+64
CNSTI4 2
ASGNI4
line 217
;217:	challenges.awards.color				= color_red;
ADDRGP4 challenges+880+68
ADDRGP4 color_red
ASGNP4
line 219
;218:
;219:        challenges.powerups.generic.type			= MTYPE_PTEXT;
ADDRGP4 challenges+952
CNSTI4 9
ASGNI4
line 220
;220:	challenges.powerups.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 challenges+952+44
CNSTU4 272
ASGNU4
line 221
;221:	challenges.powerups.generic.id			= ID_POWERUPS;
ADDRGP4 challenges+952+8
CNSTI4 104
ASGNI4
line 222
;222:	challenges.powerups.generic.callback		= UI_Challenges_Event;
ADDRGP4 challenges+952+48
ADDRGP4 UI_Challenges_Event
ASGNP4
line 223
;223:	challenges.powerups.generic.x			= 216;
ADDRGP4 challenges+952+12
CNSTI4 216
ASGNI4
line 224
;224:	challenges.powerups.generic.y			= 240 + PROP_HEIGHT*2;
ADDRGP4 challenges+952+16
CNSTI4 294
ASGNI4
line 225
;225:	challenges.powerups.string				= "POWERUPS";
ADDRGP4 challenges+952+60
ADDRGP4 $236
ASGNP4
line 226
;226:	challenges.powerups.style				= UI_RIGHT;
ADDRGP4 challenges+952+64
CNSTI4 2
ASGNI4
line 227
;227:	challenges.powerups.color				= color_red;
ADDRGP4 challenges+952+68
ADDRGP4 color_red
ASGNP4
line 229
;228:
;229:        challenges.notice.generic.type          = MTYPE_TEXT;
ADDRGP4 challenges+3836
CNSTI4 7
ASGNI4
line 230
;230:        challenges.notice.generic.flags	= QMF_CENTER_JUSTIFY|QMF_INACTIVE|QMF_SMALLFONT;
ADDRGP4 challenges+3836+44
CNSTU4 16394
ASGNU4
line 231
;231:        challenges.notice.generic.x     = 160;
ADDRGP4 challenges+3836+12
CNSTI4 160
ASGNI4
line 232
;232:        challenges.notice.generic.y     = 430;
ADDRGP4 challenges+3836+16
CNSTI4 430
ASGNI4
line 233
;233:        challenges.notice.string        = "Only results against";
ADDRGP4 challenges+3836+60
ADDRGP4 $250
ASGNP4
line 235
;234:
;235:        challenges.notice2.generic.type          = MTYPE_TEXT;
ADDRGP4 challenges+3908
CNSTI4 7
ASGNI4
line 236
;236:        challenges.notice2.generic.flags	= QMF_CENTER_JUSTIFY|QMF_INACTIVE|QMF_SMALLFONT;
ADDRGP4 challenges+3908+44
CNSTU4 16394
ASGNU4
line 237
;237:        challenges.notice2.generic.x     = 160;
ADDRGP4 challenges+3908+12
CNSTI4 160
ASGNI4
line 238
;238:        challenges.notice2.generic.y     = 430+PROP_HEIGHT-10;
ADDRGP4 challenges+3908+16
CNSTI4 447
ASGNI4
line 239
;239:        challenges.notice2.string        = "humans are counted";
ADDRGP4 challenges+3908+60
ADDRGP4 $260
ASGNP4
line 241
;240:
;241:        challenges.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 challenges+3980
CNSTI4 6
ASGNI4
line 242
;242:	challenges.back.generic.name		= ART_BACK0;
ADDRGP4 challenges+3980+4
ADDRGP4 $124
ASGNP4
line 243
;243:	challenges.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 challenges+3980+44
CNSTU4 260
ASGNU4
line 244
;244:	challenges.back.generic.callback	= UI_Challenges_Event;
ADDRGP4 challenges+3980+48
ADDRGP4 UI_Challenges_Event
ASGNP4
line 245
;245:	challenges.back.generic.id			= ID_BACK;
ADDRGP4 challenges+3980+8
CNSTI4 1
ASGNI4
line 246
;246:	challenges.back.generic.x			= 0;
ADDRGP4 challenges+3980+12
CNSTI4 0
ASGNI4
line 247
;247:	challenges.back.generic.y			= 480-64;
ADDRGP4 challenges+3980+16
CNSTI4 416
ASGNI4
line 248
;248:	challenges.back.width				= 128;
ADDRGP4 challenges+3980+76
CNSTI4 128
ASGNI4
line 249
;249:	challenges.back.height				= 64;
ADDRGP4 challenges+3980+80
CNSTI4 64
ASGNI4
line 250
;250:	challenges.back.focuspic			= ART_BACK1;
ADDRGP4 challenges+3980+60
ADDRGP4 $125
ASGNP4
line 252
;251:
;252:        switch(mainSelection)
ADDRLP4 8
ADDRGP4 mainSelection
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $280
ADDRLP4 8
INDIRI4
CNSTI4 4
GTI4 $280
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $517
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $517
address $282
address $296
address $300
address $404
address $442
code
line 253
;253:        {
LABELV $282
line 256
;254:            case 0:
;255:                //generel
;256:                challenges.entry[0].string          = "Total kills:";
ADDRGP4 challenges+1028+60
ADDRGP4 $285
ASGNP4
line 257
;257:                challenges.entry[1].string          = "Total deaths:";
ADDRGP4 challenges+1028+72+60
ADDRGP4 $289
ASGNP4
line 259
;258:                //challenges.entry[2].string          = "Total games:";
;259:                challenges.numberOfEntries = 2;
ADDRGP4 challenges+1024
CNSTI4 2
ASGNI4
line 260
;260:                challenges.entryInt[0]              = getChallenge(GENERAL_TOTALKILLS);
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764
ADDRLP4 12
INDIRU4
CVUI4 4
ASGNI4
line 261
;261:                challenges.entryInt[1]              = getChallenge(GENERAL_TOTALDEATHS);
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+4
ADDRLP4 16
INDIRU4
CVUI4 4
ASGNI4
line 263
;262:                //challenges.entryInt[2]              = getChallenge(GENERAL_TOTALGAMES);
;263:                challenges.general.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 challenges+664+44
CNSTU4 16400
ASGNU4
line 264
;264:                break;
ADDRGP4 $281
JUMPV
LABELV $296
line 267
;265:            case 1:
;266:                //gametypes
;267:                challenges.numberOfEntries = 0;
ADDRGP4 challenges+1024
CNSTI4 0
ASGNI4
line 268
;268:                challenges.gametypes.generic.flags     = QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 challenges+736+44
CNSTU4 16400
ASGNU4
line 269
;269:                break;
ADDRGP4 $281
JUMPV
LABELV $300
line 272
;270:            case 2:
;271:                //weapons
;272:                challenges.entry[0].string          = "Gauntlet kills:";
ADDRGP4 challenges+1028+60
ADDRGP4 $303
ASGNP4
line 273
;273:                challenges.entry[1].string          = "Machinegun kills:";
ADDRGP4 challenges+1028+72+60
ADDRGP4 $307
ASGNP4
line 274
;274:                challenges.entry[2].string          = "Shotgun kills:";
ADDRGP4 challenges+1028+144+60
ADDRGP4 $311
ASGNP4
line 275
;275:                challenges.entry[3].string          = "Granade kills:";
ADDRGP4 challenges+1028+216+60
ADDRGP4 $315
ASGNP4
line 276
;276:                challenges.entry[4].string          = "Rocket kills:";
ADDRGP4 challenges+1028+288+60
ADDRGP4 $319
ASGNP4
line 277
;277:                challenges.entry[5].string          = "Lightning kills:";
ADDRGP4 challenges+1028+360+60
ADDRGP4 $323
ASGNP4
line 278
;278:                challenges.entry[6].string          = "Plasmagun kills:";
ADDRGP4 challenges+1028+432+60
ADDRGP4 $327
ASGNP4
line 279
;279:                challenges.entry[7].string          = "Railgun kills:";
ADDRGP4 challenges+1028+504+60
ADDRGP4 $331
ASGNP4
line 280
;280:                challenges.entry[8].string          = "Instant rail kills:";
ADDRGP4 challenges+1028+576+60
ADDRGP4 $335
ASGNP4
line 281
;281:                challenges.entry[9].string          = "BFG kills:";
ADDRGP4 challenges+1028+648+60
ADDRGP4 $339
ASGNP4
line 282
;282:                challenges.entry[10].string          = "Grapple kills:";
ADDRGP4 challenges+1028+720+60
ADDRGP4 $343
ASGNP4
line 283
;283:                challenges.entry[11].string          = "Chaingun kills:";
ADDRGP4 challenges+1028+792+60
ADDRGP4 $347
ASGNP4
line 284
;284:                challenges.entry[12].string          = "Nailgun kills:";
ADDRGP4 challenges+1028+864+60
ADDRGP4 $351
ASGNP4
line 285
;285:                challenges.entry[13].string          = "Proxy mine kills:";
ADDRGP4 challenges+1028+936+60
ADDRGP4 $355
ASGNP4
line 286
;286:                challenges.entry[14].string          = "Telefrags:";
ADDRGP4 challenges+1028+1008+60
ADDRGP4 $359
ASGNP4
line 287
;287:                challenges.entry[15].string          = "Push kills:";
ADDRGP4 challenges+1028+1080+60
ADDRGP4 $363
ASGNP4
line 288
;288:                challenges.entry[16].string          = "Crush kills:";
ADDRGP4 challenges+1028+1152+60
ADDRGP4 $367
ASGNP4
line 289
;289:                challenges.numberOfEntries = 17;
ADDRGP4 challenges+1024
CNSTI4 17
ASGNI4
line 290
;290:                challenges.entryInt[0]              = getChallenge(WEAPON_GAUNTLET_KILLS);
CNSTI4 201
ARGI4
ADDRLP4 20
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764
ADDRLP4 20
INDIRU4
CVUI4 4
ASGNI4
line 291
;291:                challenges.entryInt[1]              = getChallenge(WEAPON_MACHINEGUN_KILLS);
CNSTI4 202
ARGI4
ADDRLP4 24
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+4
ADDRLP4 24
INDIRU4
CVUI4 4
ASGNI4
line 292
;292:                challenges.entryInt[2]              = getChallenge(WEAPON_SHOTGUN_KILLS);
CNSTI4 203
ARGI4
ADDRLP4 28
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+8
ADDRLP4 28
INDIRU4
CVUI4 4
ASGNI4
line 293
;293:                challenges.entryInt[3]              = getChallenge(WEAPON_GRANADE_KILLS);
CNSTI4 204
ARGI4
ADDRLP4 32
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+12
ADDRLP4 32
INDIRU4
CVUI4 4
ASGNI4
line 294
;294:                challenges.entryInt[4]              = getChallenge(WEAPON_ROCKET_KILLS);
CNSTI4 205
ARGI4
ADDRLP4 36
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+16
ADDRLP4 36
INDIRU4
CVUI4 4
ASGNI4
line 295
;295:                challenges.entryInt[5]              = getChallenge(WEAPON_LIGHTNING_KILLS);
CNSTI4 206
ARGI4
ADDRLP4 40
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+20
ADDRLP4 40
INDIRU4
CVUI4 4
ASGNI4
line 296
;296:                challenges.entryInt[6]              = getChallenge(WEAPON_PLASMA_KILLS);
CNSTI4 207
ARGI4
ADDRLP4 44
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+24
ADDRLP4 44
INDIRU4
CVUI4 4
ASGNI4
line 297
;297:                challenges.entryInt[7]              = getChallenge(WEAPON_RAIL_KILLS);
CNSTI4 208
ARGI4
ADDRLP4 48
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+28
ADDRLP4 48
INDIRU4
CVUI4 4
ASGNI4
line 298
;298:                challenges.entryInt[8]              = getChallenge(WEAPON_INSTANT_RAIL_KILLS);
CNSTI4 215
ARGI4
ADDRLP4 52
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+32
ADDRLP4 52
INDIRU4
CVUI4 4
ASGNI4
line 299
;299:                challenges.entryInt[9]              = getChallenge(WEAPON_BFG_KILLS);
CNSTI4 209
ARGI4
ADDRLP4 56
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+36
ADDRLP4 56
INDIRU4
CVUI4 4
ASGNI4
line 300
;300:                challenges.entryInt[10]              = getChallenge(WEAPON_GRAPPLE_KILLS);
CNSTI4 210
ARGI4
ADDRLP4 60
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+40
ADDRLP4 60
INDIRU4
CVUI4 4
ASGNI4
line 301
;301:                challenges.entryInt[11]              = getChallenge(WEAPON_CHAINGUN_KILLS);
CNSTI4 211
ARGI4
ADDRLP4 64
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+44
ADDRLP4 64
INDIRU4
CVUI4 4
ASGNI4
line 302
;302:                challenges.entryInt[12]              = getChallenge(WEAPON_NAILGUN_KILLS);
CNSTI4 212
ARGI4
ADDRLP4 68
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+48
ADDRLP4 68
INDIRU4
CVUI4 4
ASGNI4
line 303
;303:                challenges.entryInt[13]              = getChallenge(WEAPON_MINE_KILLS);
CNSTI4 213
ARGI4
ADDRLP4 72
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+52
ADDRLP4 72
INDIRU4
CVUI4 4
ASGNI4
line 304
;304:                challenges.entryInt[14]              = getChallenge(WEAPON_TELEFRAG_KILLS);
CNSTI4 216
ARGI4
ADDRLP4 76
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+56
ADDRLP4 76
INDIRU4
CVUI4 4
ASGNI4
line 305
;305:                challenges.entryInt[15]              = getChallenge(WEAPON_PUSH_KILLS);
CNSTI4 214
ARGI4
ADDRLP4 80
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+60
ADDRLP4 80
INDIRU4
CVUI4 4
ASGNI4
line 306
;306:                challenges.entryInt[16]              = getChallenge(WEAPON_CRUSH_KILLS);
CNSTI4 217
ARGI4
ADDRLP4 84
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+64
ADDRLP4 84
INDIRU4
CVUI4 4
ASGNI4
line 307
;307:                challenges.weapons.generic.flags     = QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 challenges+808+44
CNSTU4 16400
ASGNU4
line 308
;308:                break;
ADDRGP4 $281
JUMPV
LABELV $404
line 311
;309:            case 3:
;310:                //awards
;311:                challenges.entry[0].string          = "Gauntlet";
ADDRGP4 challenges+1028+60
ADDRGP4 $407
ASGNP4
line 312
;312:                challenges.entry[1].string          = "Impressive";
ADDRGP4 challenges+1028+72+60
ADDRGP4 $411
ASGNP4
line 313
;313:                challenges.entry[2].string          = "Excellent";
ADDRGP4 challenges+1028+144+60
ADDRGP4 $415
ASGNP4
line 314
;314:                challenges.entry[3].string          = "Capture";
ADDRGP4 challenges+1028+216+60
ADDRGP4 $419
ASGNP4
line 315
;315:                challenges.entry[4].string          = "Assist";
ADDRGP4 challenges+1028+288+60
ADDRGP4 $423
ASGNP4
line 316
;316:                challenges.entry[5].string          = "Defend";
ADDRGP4 challenges+1028+360+60
ADDRGP4 $427
ASGNP4
line 317
;317:                challenges.numberOfEntries = 6;
ADDRGP4 challenges+1024
CNSTI4 6
ASGNI4
line 318
;318:                challenges.entryInt[0]              = getChallenge(WEAPON_GAUNTLET_KILLS);
CNSTI4 201
ARGI4
ADDRLP4 88
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764
ADDRLP4 88
INDIRU4
CVUI4 4
ASGNI4
line 319
;319:                challenges.entryInt[1]              = getChallenge(AWARD_IMPRESSIVE);
CNSTI4 301
ARGI4
ADDRLP4 92
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+4
ADDRLP4 92
INDIRU4
CVUI4 4
ASGNI4
line 320
;320:                challenges.entryInt[2]              = getChallenge(AWARD_EXCELLENT);
CNSTI4 302
ARGI4
ADDRLP4 96
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+8
ADDRLP4 96
INDIRU4
CVUI4 4
ASGNI4
line 321
;321:                challenges.entryInt[3]              = getChallenge(AWARD_CAPTURE);
CNSTI4 303
ARGI4
ADDRLP4 100
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+12
ADDRLP4 100
INDIRU4
CVUI4 4
ASGNI4
line 322
;322:                challenges.entryInt[4]              = getChallenge(AWARD_ASSIST);
CNSTI4 304
ARGI4
ADDRLP4 104
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+16
ADDRLP4 104
INDIRU4
CVUI4 4
ASGNI4
line 323
;323:                challenges.entryInt[5]              = getChallenge(AWARD_DEFENCE);
CNSTI4 305
ARGI4
ADDRLP4 108
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+20
ADDRLP4 108
INDIRU4
CVUI4 4
ASGNI4
line 324
;324:                challenges.awards.generic.flags     = QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 challenges+880+44
CNSTU4 16400
ASGNU4
line 325
;325:                break;
ADDRGP4 $281
JUMPV
LABELV $442
line 327
;326:            case 4:
;327:                challenges.entry[0].string          = "Quad kills";
ADDRGP4 challenges+1028+60
ADDRGP4 $445
ASGNP4
line 328
;328:                challenges.entry[1].string          = "2 fast 4 U";
ADDRGP4 challenges+1028+72+60
ADDRGP4 $449
ASGNP4
line 329
;329:                challenges.entry[2].string          = "They didn't see me";
ADDRGP4 challenges+1028+144+60
ADDRGP4 $453
ASGNP4
line 330
;330:                challenges.entry[3].string          = "I'm flying";
ADDRGP4 challenges+1028+216+60
ADDRGP4 $457
ASGNP4
line 331
;331:                challenges.entry[4].string          = "Killing machine";
ADDRGP4 challenges+1028+288+60
ADDRGP4 $461
ASGNP4
line 332
;332:                challenges.entry[5].string          = "Counter Quad";
ADDRGP4 challenges+1028+360+60
ADDRGP4 $465
ASGNP4
line 333
;333:                challenges.entry[6].string          = "Not fast enough";
ADDRGP4 challenges+1028+432+60
ADDRGP4 $469
ASGNP4
line 334
;334:                challenges.entry[7].string          = "You cannot hide";
ADDRGP4 challenges+1028+504+60
ADDRGP4 $473
ASGNP4
line 335
;335:                challenges.entry[8].string          = "Fall deep";
ADDRGP4 challenges+1028+576+60
ADDRGP4 $477
ASGNP4
line 336
;336:                challenges.entry[9].string          = "Counter battlesuit";
ADDRGP4 challenges+1028+648+60
ADDRGP4 $481
ASGNP4
line 337
;337:                challenges.entry[10].string          = "Counter regen";
ADDRGP4 challenges+1028+720+60
ADDRGP4 $485
ASGNP4
line 338
;338:                challenges.entry[11].string          = "Counter multi";
ADDRGP4 challenges+1028+792+60
ADDRGP4 $489
ASGNP4
line 339
;339:                challenges.numberOfEntries  = 12;
ADDRGP4 challenges+1024
CNSTI4 12
ASGNI4
line 341
;340:
;341:                challenges.entryInt[0]              = getChallenge(POWERUP_QUAD_KILL);
CNSTI4 401
ARGI4
ADDRLP4 112
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764
ADDRLP4 112
INDIRU4
CVUI4 4
ASGNI4
line 342
;342:                challenges.entryInt[1]              = getChallenge(POWERUP_SPEED_KILL);
CNSTI4 402
ARGI4
ADDRLP4 116
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+4
ADDRLP4 116
INDIRU4
CVUI4 4
ASGNI4
line 343
;343:                challenges.entryInt[2]              = getChallenge(POWERUP_INVIS_KILL);
CNSTI4 404
ARGI4
ADDRLP4 120
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+8
ADDRLP4 120
INDIRU4
CVUI4 4
ASGNI4
line 344
;344:                challenges.entryInt[3]              = getChallenge(POWERUP_FLIGHT_KILL);
CNSTI4 403
ARGI4
ADDRLP4 124
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+12
ADDRLP4 124
INDIRU4
CVUI4 4
ASGNI4
line 345
;345:                challenges.entryInt[4]              = getChallenge(POWERUP_MULTI_KILL);
CNSTI4 405
ARGI4
ADDRLP4 128
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+16
ADDRLP4 128
INDIRU4
CVUI4 4
ASGNI4
line 346
;346:                challenges.entryInt[5]              = getChallenge(POWERUP_COUNTER_QUAD);
CNSTI4 406
ARGI4
ADDRLP4 132
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+20
ADDRLP4 132
INDIRU4
CVUI4 4
ASGNI4
line 347
;347:                challenges.entryInt[6]              = getChallenge(POWERUP_COUNTER_SPEED);
CNSTI4 407
ARGI4
ADDRLP4 136
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+24
ADDRLP4 136
INDIRU4
CVUI4 4
ASGNI4
line 348
;348:                challenges.entryInt[7]              = getChallenge(POWERUP_COUNTER_INVIS);
CNSTI4 409
ARGI4
ADDRLP4 140
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+28
ADDRLP4 140
INDIRU4
CVUI4 4
ASGNI4
line 349
;349:                challenges.entryInt[8]              = getChallenge(POWERUP_COUNTER_FLIGHT);
CNSTI4 408
ARGI4
ADDRLP4 144
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+32
ADDRLP4 144
INDIRU4
CVUI4 4
ASGNI4
line 350
;350:                challenges.entryInt[9]              = getChallenge(POWERUP_COUNTER_ENVIR);
CNSTI4 410
ARGI4
ADDRLP4 148
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+36
ADDRLP4 148
INDIRU4
CVUI4 4
ASGNI4
line 351
;351:                challenges.entryInt[10]              = getChallenge(POWERUP_COUNTER_REGEN);
CNSTI4 411
ARGI4
ADDRLP4 152
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+40
ADDRLP4 152
INDIRU4
CVUI4 4
ASGNI4
line 352
;352:                challenges.entryInt[11]              = getChallenge(POWERUP_COUNTER_MULTI);
CNSTI4 412
ARGI4
ADDRLP4 156
ADDRGP4 getChallenge
CALLU4
ASGNU4
ADDRGP4 challenges+3764+44
ADDRLP4 156
INDIRU4
CVUI4 4
ASGNI4
line 353
;353:                challenges.powerups.generic.flags     = QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 challenges+952+44
CNSTU4 16400
ASGNU4
line 354
;354:                break;
ADDRGP4 $281
JUMPV
LABELV $280
line 357
;355:
;356:            default:
;357:                challenges.numberOfEntries = 0;
ADDRGP4 challenges+1024
CNSTI4 0
ASGNI4
line 358
;358:        };
LABELV $281
line 361
;359:
;360:        //Now write the challenges
;361:        y = 240 - (int)((((float)challenges.numberOfEntries)/2.0) * (float)(BIGCHAR_HEIGHT + 2));
ADDRLP4 4
CNSTI4 240
CNSTF4 1099956224
ADDRGP4 challenges+1024
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
MULF4
CVFI4 4
SUBI4
ASGNI4
line 362
;362:        for(i=0;i<MAX_ENTRIES && i < challenges.numberOfEntries;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $519
line 363
;363:        {
line 364
;364:            challenges.entry[i].color = color_white;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+1028+68
ADDP4
ADDRGP4 color_white
ASGNP4
line 365
;365:            challenges.entry[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+1028
ADDP4
CNSTI4 7
ASGNI4
line 366
;366:            challenges.entry[i].generic.x        = 230;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+1028+12
ADDP4
CNSTI4 230
ASGNI4
line 367
;367:            challenges.entry[i].generic.y        = y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+1028+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 369
;368:
;369:            challenges.entryIntText[i].color = color_white;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324+68
ADDP4
ADDRGP4 color_white
ASGNP4
line 370
;370:            challenges.entryIntText[i].generic.type = MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324
ADDP4
CNSTI4 7
ASGNI4
line 371
;371:            challenges.entryIntText[i].generic.x        = 630;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324+12
ADDP4
CNSTI4 630
ASGNI4
line 372
;372:            challenges.entryIntText[i].generic.y        = y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 373
;373:            challenges.entryIntText[i].style = UI_RIGHT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324+64
ADDP4
CNSTI4 2
ASGNI4
line 374
;374:            challenges.entryIntText[i].string           = challenges.entryIntString[i];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 challenges+3620
ADDP4
ASGNP4
line 376
;375:
;376:            strncpy(challenges.entryIntString[i],va("%u",challenges.entryInt[i]),MAX_INT_AS_STRING);
ADDRGP4 $544
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 challenges+3764
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 challenges+3620
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 377
;377:            y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 378
;378:        }
LABELV $520
line 362
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $546
ADDRLP4 0
INDIRI4
ADDRGP4 challenges+1024
INDIRI4
LTI4 $519
LABELV $546
line 380
;379:
;380:        Menu_AddItem( &challenges.menu, ( void * ) &challenges.banner );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 381
;381:	Menu_AddItem( &challenges.menu, ( void * ) &challenges.framel );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 382
;382:	Menu_AddItem( &challenges.menu, ( void * ) &challenges.framer );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 384
;383:
;384:        Menu_AddItem( &challenges.menu, ( void * ) &challenges.general );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 386
;385:        //Menu_AddItem( &challenges.menu, ( void * ) &challenges.gametypes );
;386:        Menu_AddItem( &challenges.menu, ( void * ) &challenges.weapons );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 387
;387:        Menu_AddItem( &challenges.menu, ( void * ) &challenges.awards );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 388
;388:        Menu_AddItem( &challenges.menu, ( void * ) &challenges.powerups );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 390
;389:
;390:        for(i=0;i<MAX_ENTRIES && i<challenges.numberOfEntries;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $557
JUMPV
LABELV $554
line 391
;391:        {
line 392
;392:            Menu_AddItem( &challenges.menu, ( void * ) &challenges.entry[i] );
ADDRGP4 challenges
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+1028
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 393
;393:            Menu_AddItem( &challenges.menu, ( void * ) &challenges.entryIntText[i] );
ADDRGP4 challenges
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 challenges+2324
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 394
;394:        }
LABELV $555
line 390
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $557
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $561
ADDRLP4 0
INDIRI4
ADDRGP4 challenges+1024
INDIRI4
LTI4 $554
LABELV $561
line 395
;395:        Menu_AddItem( &challenges.menu, (void *) &challenges.notice);
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+3836
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 396
;396:        Menu_AddItem( &challenges.menu, (void *) &challenges.notice2);
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+3908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 397
;397:	Menu_AddItem( &challenges.menu, ( void * ) &challenges.back );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+3980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 398
;398:}
LABELV $126
endproc UI_Challenges_Init 160 12
export UI_Challenges
proc UI_Challenges 0 8
line 405
;399:
;400:/*
;401:===============
;402:UI_Challenges
;403:===============
;404:*/
;405:void UI_Challenges( void ) {
line 406
;406:    mainSelection = 0;
ADDRGP4 mainSelection
CNSTI4 0
ASGNI4
line 407
;407:	UI_Challenges_Init();
ADDRGP4 UI_Challenges_Init
CALLV
pop
line 408
;408:	UI_PushMenu( &challenges.menu );
ADDRGP4 challenges
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 409
;409:	Menu_SetCursorToItem( &challenges.menu, &challenges.back );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+3980
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 410
;410:}
LABELV $565
endproc UI_Challenges 0 8
export UI_ChallengesLocal
proc UI_ChallengesLocal 0 8
line 418
;411:
;412:/*
;413:===============
;414:UI_ChallengesLocal
;415: *This is only used locally. Remembers selection
;416:===============
;417:*/
;418:void UI_ChallengesLocal( void ) {
line 419
;419:	UI_Challenges_Init();
ADDRGP4 UI_Challenges_Init
CALLV
pop
line 420
;420:	UI_PushMenu( &challenges.menu );
ADDRGP4 challenges
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 421
;421:	Menu_SetCursorToItem( &challenges.menu, &challenges.back );
ADDRGP4 challenges
ARGP4
ADDRGP4 challenges+3980
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 422
;422:}
LABELV $567
endproc UI_ChallengesLocal 0 8
bss
align 4
LABELV mainSelection
skip 4
align 4
LABELV challenges
skip 4068
align 4
LABELV challengeTable
skip 8192
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import UI_VoteCustomMenu
import UI_FirstConnectMenu
import FirstConnect_Cache
import UI_SpecifyPasswordMenu
import SpecifyPassword_Cache
import UI_VoteMapMenuInternal
import UI_VoteMapMenu
import UI_VoteKickMenu
import UI_VoteGametypeMenu
import UI_VoteTimelimitMenu
import UI_VoteFraglimitMenu
import UI_VoteMenuMenu
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_SetDefaultCvar
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import mappage
import ui_browserOnlyHumans
import ui_setupchecked
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_dom_friendly
import ui_dom_timelimit
import ui_dom_capturelimit
import ui_dd_friendly
import ui_dd_timelimit
import ui_dd_capturelimit
import ui_lms_timelimit
import ui_lms_fraglimit
import ui_ctf_elimination_timelimit
import ui_ctf_elimination_capturelimit
import ui_elimination_timelimit
import ui_elimination_capturelimit
import ui_harvester_friendly
import ui_harvester_timelimit
import ui_harvester_capturelimit
import ui_overload_friendly
import ui_overload_timelimit
import ui_overload_capturelimit
import ui_1fctf_friendly
import ui_1fctf_timelimit
import ui_1fctf_capturelimit
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import BG_TeamName
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_DefragmentMemory
import BG_Free
import BG_InitMemory
import BG_Alloc
import BG_CanAlloc
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import Q_isnan
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import strtol
import _atoi
import atoi
import strtod
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $544
byte 1 37
byte 1 117
byte 1 0
align 1
LABELV $489
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 0
align 1
LABELV $485
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $481
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $477
byte 1 70
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $473
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $469
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $465
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $461
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $457
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 102
byte 1 108
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $453
byte 1 84
byte 1 104
byte 1 101
byte 1 121
byte 1 32
byte 1 100
byte 1 105
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $449
byte 1 50
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 52
byte 1 32
byte 1 85
byte 1 0
align 1
LABELV $445
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $427
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $423
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $419
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $411
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $407
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $367
byte 1 67
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $363
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $359
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $355
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 121
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $351
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $347
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $343
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $339
byte 1 66
byte 1 70
byte 1 71
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $335
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $331
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $327
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $323
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $319
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $315
byte 1 71
byte 1 114
byte 1 97
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $311
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $307
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $303
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $289
byte 1 84
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $285
byte 1 84
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $260
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $250
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $236
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $218
byte 1 65
byte 1 87
byte 1 65
byte 1 82
byte 1 68
byte 1 83
byte 1 0
align 1
LABELV $200
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $182
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $138
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 73
byte 1 83
byte 1 84
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $125
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $124
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $123
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $122
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $82
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 0
