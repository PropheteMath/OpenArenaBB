code
proc InGame_RestartAction 0 8
file "../../../code/q3_ui/ui_ingame.c"
line 77
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.SERVER
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:/*
;24:=======================================================================
;25:
;26:INGAME MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define INGAME_FRAME					"menu/art_blueish/addbotframe"
;36://#define INGAME_FRAME					"menu/art_blueish/cut_frame"
;37:#define INGAME_MENU_VERTICAL_SPACING	28
;38:
;39:#define ID_TEAM					10
;40:#define ID_ADDBOTS				11
;41:#define ID_REMOVEBOTS			12
;42:#define ID_SETUP				13
;43:#define ID_SERVERINFO			14
;44:#define ID_LEAVEARENA			15
;45:#define ID_RESTART				16
;46:#define ID_QUIT					17
;47:#define ID_RESUME				18
;48:#define ID_TEAMORDERS			19
;49:#define ID_VOTE                         20
;50:
;51:
;52:typedef struct {
;53:	menuframework_s	menu;
;54:
;55:	menubitmap_s	frame;
;56:	menutext_s		team;
;57:	menutext_s		setup;
;58:	menutext_s		server;
;59:	menutext_s		leave;
;60:	menutext_s		restart;
;61:	menutext_s		addbots;
;62:	menutext_s		removebots;
;63:	menutext_s		teamorders;
;64:	menutext_s		quit;
;65:	menutext_s		resume;
;66:        menutext_s              vote;
;67:} ingamemenu_t;
;68:
;69:static ingamemenu_t	s_ingame;
;70:
;71:
;72:/*
;73:=================
;74:InGame_RestartAction
;75:=================
;76:*/
;77:static void InGame_RestartAction( qboolean result ) {
line 78
;78:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $81
line 79
;79:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 82
;80:	}
;81:
;82:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 83
;83:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $83
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 84
;84:}
LABELV $80
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 8
line 92
;85:
;86:
;87:/*
;88:=================
;89:InGame_QuitAction
;90:=================
;91:*/
;92:static void InGame_QuitAction( qboolean result ) {
line 93
;93:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $85
line 94
;94:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 96
;95:	}
;96:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 98
;97:	//UI_CreditMenu();
;98:        trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $87
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 99
;99:}
LABELV $84
endproc InGame_QuitAction 0 8
export InGame_Event
proc InGame_Event 8 12
line 107
;100:
;101:
;102:/*
;103:=================
;104:InGame_Event
;105:=================
;106:*/
;107:void InGame_Event( void *ptr, int notification ) {
line 108
;108:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $89
line 109
;109:		return;
ADDRGP4 $88
JUMPV
LABELV $89
line 112
;110:	}
;111:
;112:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 20
GTI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $108-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $108
address $94
address $103
address $104
address $95
address $102
address $96
address $98
address $100
address $106
address $105
address $107
code
LABELV $94
line 114
;113:	case ID_TEAM:
;114:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 115
;115:		break;
ADDRGP4 $92
JUMPV
LABELV $95
line 118
;116:
;117:	case ID_SETUP:
;118:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 119
;119:		break;
ADDRGP4 $92
JUMPV
LABELV $96
line 122
;120:
;121:	case ID_LEAVEARENA:
;122:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $97
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 123
;123:		break;
ADDRGP4 $92
JUMPV
LABELV $98
line 126
;124:
;125:	case ID_RESTART:
;126:		UI_ConfirmMenu( "RESTART ARENA?", 0, InGame_RestartAction );
ADDRGP4 $99
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 127
;127:		break;
ADDRGP4 $92
JUMPV
LABELV $100
line 130
;128:
;129:	case ID_QUIT:
;130:		UI_ConfirmMenu( "EXIT GAME?",  0, InGame_QuitAction );
ADDRGP4 $101
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 131
;131:		break;
ADDRGP4 $92
JUMPV
LABELV $102
line 134
;132:
;133:	case ID_SERVERINFO:
;134:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 135
;135:		break;
ADDRGP4 $92
JUMPV
LABELV $103
line 138
;136:
;137:	case ID_ADDBOTS:
;138:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 139
;139:		break;
ADDRGP4 $92
JUMPV
LABELV $104
line 142
;140:
;141:	case ID_REMOVEBOTS:
;142:		UI_RemoveBotsMenu();
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 143
;143:		break;
ADDRGP4 $92
JUMPV
LABELV $105
line 146
;144:
;145:	case ID_TEAMORDERS:
;146:		UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 147
;147:		break;
ADDRGP4 $92
JUMPV
LABELV $106
line 150
;148:
;149:	case ID_RESUME:
;150:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 151
;151:		break;
ADDRGP4 $92
JUMPV
LABELV $107
line 154
;152:                
;153:        case ID_VOTE:
;154:                UI_VoteMenuMenu();
ADDRGP4 UI_VoteMenuMenu
CALLV
pop
line 155
;155:                break;
LABELV $91
LABELV $92
line 157
;156:	}
;157:}
LABELV $88
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4168 12
line 165
;158:
;159:
;160:/*
;161:=================
;162:InGame_MenuInit
;163:=================
;164:*/
;165:void InGame_MenuInit( void ) {
line 171
;166:	int		y;
;167:	uiClientState_t	cs;
;168:	char	info[MAX_INFO_STRING];
;169:	int		team;
;170:
;171:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 173
;172:
;173:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 175
;174:
;175:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+404
CNSTI4 1
ASGNI4
line 176
;176:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+408
CNSTI4 0
ASGNI4
line 178
;177:
;178:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+416
CNSTI4 6
ASGNI4
line 179
;179:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+416+44
CNSTU4 16384
ASGNU4
line 180
;180:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+416+4
ADDRGP4 $118
ASGNP4
line 181
;181:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+416+12
CNSTI4 87
ASGNI4
line 182
;182:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+416+16
CNSTI4 74
ASGNI4
line 183
;183:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+416+76
CNSTI4 466
ASGNI4
line 184
;184:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+416+80
CNSTI4 332
ASGNI4
line 187
;185:
;186:	//y = 96;
;187:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 188
;188:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+504
CNSTI4 9
ASGNI4
line 189
;189:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+504+44
CNSTU4 264
ASGNU4
line 190
;190:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+504+12
CNSTI4 320
ASGNI4
line 191
;191:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+504+16
ADDRLP4 0
INDIRI4
ASGNI4
line 192
;192:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+504+8
CNSTI4 10
ASGNI4
line 193
;193:	s_ingame.team.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+504+48
ADDRGP4 InGame_Event
ASGNP4
line 194
;194:	s_ingame.team.string				= "START";
ADDRGP4 s_ingame+504+60
ADDRGP4 $140
ASGNP4
line 195
;195:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+504+68
ADDRGP4 color_red
ASGNP4
line 196
;196:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+504+64
CNSTI4 17
ASGNI4
line 198
;197:
;198:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 199
;199:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+864
CNSTI4 9
ASGNI4
line 200
;200:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+864+44
CNSTU4 264
ASGNU4
line 201
;201:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+864+12
CNSTI4 320
ASGNI4
line 202
;202:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+864+16
ADDRLP4 0
INDIRI4
ASGNI4
line 203
;203:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+864+8
CNSTI4 11
ASGNI4
line 204
;204:	s_ingame.addbots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+864+48
ADDRGP4 InGame_Event
ASGNP4
line 205
;205:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+864+60
ADDRGP4 $158
ASGNP4
line 206
;206:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+864+68
ADDRGP4 color_red
ASGNP4
line 207
;207:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+864+64
CNSTI4 17
ASGNI4
line 208
;208:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $165
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
EQF4 $169
ADDRGP4 $166
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4120
INDIRF4
CNSTF4 0
EQF4 $169
ADDRGP4 $167
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 1073741824
NEF4 $163
LABELV $169
line 209
;209:		s_ingame.addbots.generic.flags |= QMF_GRAYED;
ADDRLP4 4128
ADDRGP4 s_ingame+864+44
ASGNP4
ADDRLP4 4128
INDIRP4
ADDRLP4 4128
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 210
;210:	}
LABELV $163
line 212
;211:
;212:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 213
;213:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+936
CNSTI4 9
ASGNI4
line 214
;214:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+936+44
CNSTU4 264
ASGNU4
line 215
;215:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+936+12
CNSTI4 320
ASGNI4
line 216
;216:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+936+16
ADDRLP4 0
INDIRI4
ASGNI4
line 217
;217:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+936+8
CNSTI4 12
ASGNI4
line 218
;218:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+936+48
ADDRGP4 InGame_Event
ASGNP4
line 219
;219:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+936+60
ADDRGP4 $185
ASGNP4
line 220
;220:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+936+68
ADDRGP4 color_red
ASGNP4
line 221
;221:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+936+64
CNSTI4 17
ASGNI4
line 222
;222:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $165
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 0
EQF4 $193
ADDRGP4 $166
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4132
INDIRF4
CNSTF4 0
EQF4 $193
ADDRGP4 $167
ARGP4
ADDRLP4 4136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4136
INDIRF4
CNSTF4 1073741824
NEF4 $190
LABELV $193
line 223
;223:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
ADDRLP4 4140
ADDRGP4 s_ingame+936+44
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 4140
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 224
;224:	}
LABELV $190
line 226
;225:
;226:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 227
;227:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1008
CNSTI4 9
ASGNI4
line 228
;228:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1008+44
CNSTU4 264
ASGNU4
line 229
;229:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+1008+12
CNSTI4 320
ASGNI4
line 230
;230:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+1008+16
ADDRLP4 0
INDIRI4
ASGNI4
line 231
;231:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+1008+8
CNSTI4 19
ASGNI4
line 232
;232:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+1008+48
ADDRGP4 InGame_Event
ASGNP4
line 233
;233:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+1008+60
ADDRGP4 $209
ASGNP4
line 234
;234:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+1008+68
ADDRGP4 color_red
ASGNP4
line 235
;235:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1008+64
CNSTI4 17
ASGNI4
line 236
;236:	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_LMS ) ) {
ADDRGP4 $167
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4140
INDIRF4
CNSTF4 1077936128
LTF4 $216
ADDRGP4 $167
ARGP4
ADDRLP4 4144
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4144
INDIRF4
CNSTF4 1092616192
NEF4 $214
LABELV $216
line 237
;237:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4148
ADDRGP4 s_ingame+1008+44
ASGNP4
ADDRLP4 4148
INDIRP4
ADDRLP4 4148
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 238
;238:	}
ADDRGP4 $215
JUMPV
LABELV $214
line 239
;239:	else {
line 240
;240:		trap_GetClientState( &cs );
ADDRLP4 1028
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 241
;241:		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1028+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 242
;242:		team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4112
ADDRLP4 4152
INDIRI4
ASGNI4
line 243
;243:		if( team == TEAM_SPECTATOR ) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $221
line 244
;244:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4156
ADDRGP4 s_ingame+1008+44
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 245
;245:		}
LABELV $221
line 246
;246:	}
LABELV $215
line 248
;247:
;248:        y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 249
;249:	s_ingame.vote.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1224
CNSTI4 9
ASGNI4
line 250
;250:	s_ingame.vote.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1224+44
CNSTU4 264
ASGNU4
line 251
;251:	s_ingame.vote.generic.x			= 320;
ADDRGP4 s_ingame+1224+12
CNSTI4 320
ASGNI4
line 252
;252:	s_ingame.vote.generic.y			= y;
ADDRGP4 s_ingame+1224+16
ADDRLP4 0
INDIRI4
ASGNI4
line 253
;253:	s_ingame.vote.generic.id			= ID_VOTE;
ADDRGP4 s_ingame+1224+8
CNSTI4 20
ASGNI4
line 254
;254:	s_ingame.vote.generic.callback	= InGame_Event;
ADDRGP4 s_ingame+1224+48
ADDRGP4 InGame_Event
ASGNP4
line 255
;255:	s_ingame.vote.string				= "CALL VOTE";
ADDRGP4 s_ingame+1224+60
ADDRGP4 $238
ASGNP4
line 256
;256:	s_ingame.vote.color				= color_red;
ADDRGP4 s_ingame+1224+68
ADDRGP4 color_red
ASGNP4
line 257
;257:	s_ingame.vote.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1224+64
CNSTI4 17
ASGNI4
line 258
;258:        trap_GetConfigString( CS_SERVERINFO, info, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 259
;259:        if( atoi( Info_ValueForKey(info,"g_allowVote") )==0 || trap_Cvar_VariableValue("g_gametype")==GT_SINGLE_PLAYER ) {
ADDRLP4 4
ARGP4
ADDRGP4 $245
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4148
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
EQI4 $246
ADDRGP4 $167
ARGP4
ADDRLP4 4156
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4156
INDIRF4
CNSTF4 1073741824
NEF4 $243
LABELV $246
line 260
;260:		s_ingame.vote.generic.flags |= QMF_GRAYED;
ADDRLP4 4160
ADDRGP4 s_ingame+1224+44
ASGNP4
ADDRLP4 4160
INDIRP4
ADDRLP4 4160
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 261
;261:	}
LABELV $243
line 263
;262:
;263:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 264
;264:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+576
CNSTI4 9
ASGNI4
line 265
;265:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+576+44
CNSTU4 264
ASGNU4
line 266
;266:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+576+12
CNSTI4 320
ASGNI4
line 267
;267:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+576+16
ADDRLP4 0
INDIRI4
ASGNI4
line 268
;268:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+576+8
CNSTI4 13
ASGNI4
line 269
;269:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+576+48
ADDRGP4 InGame_Event
ASGNP4
line 270
;270:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+576+60
ADDRGP4 $262
ASGNP4
line 271
;271:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+576+68
ADDRGP4 color_red
ASGNP4
line 272
;272:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+576+64
CNSTI4 17
ASGNI4
line 274
;273:
;274:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 275
;275:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+648
CNSTI4 9
ASGNI4
line 276
;276:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+648+44
CNSTU4 264
ASGNU4
line 277
;277:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+648+12
CNSTI4 320
ASGNI4
line 278
;278:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+648+16
ADDRLP4 0
INDIRI4
ASGNI4
line 279
;279:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+648+8
CNSTI4 14
ASGNI4
line 280
;280:	s_ingame.server.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+648+48
ADDRGP4 InGame_Event
ASGNP4
line 281
;281:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+648+60
ADDRGP4 $280
ASGNP4
line 282
;282:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+648+68
ADDRGP4 color_red
ASGNP4
line 283
;283:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+648+64
CNSTI4 17
ASGNI4
line 285
;284:
;285:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 286
;286:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+792
CNSTI4 9
ASGNI4
line 287
;287:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+792+44
CNSTU4 264
ASGNU4
line 288
;288:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+792+12
CNSTI4 320
ASGNI4
line 289
;289:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+792+16
ADDRLP4 0
INDIRI4
ASGNI4
line 290
;290:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+792+8
CNSTI4 16
ASGNI4
line 291
;291:	s_ingame.restart.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+792+48
ADDRGP4 InGame_Event
ASGNP4
line 292
;292:	s_ingame.restart.string				= "RESTART ARENA";
ADDRGP4 s_ingame+792+60
ADDRGP4 $298
ASGNP4
line 293
;293:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+792+68
ADDRGP4 color_red
ASGNP4
line 294
;294:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+792+64
CNSTI4 17
ASGNI4
line 295
;295:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $165
ARGP4
ADDRLP4 4160
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4160
INDIRF4
CNSTF4 0
NEF4 $303
line 296
;296:		s_ingame.restart.generic.flags |= QMF_GRAYED;
ADDRLP4 4164
ADDRGP4 s_ingame+792+44
ASGNP4
ADDRLP4 4164
INDIRP4
ADDRLP4 4164
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 297
;297:	}
LABELV $303
line 299
;298:
;299:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 300
;300:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1152
CNSTI4 9
ASGNI4
line 301
;301:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1152+44
CNSTU4 264
ASGNU4
line 302
;302:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+1152+12
CNSTI4 320
ASGNI4
line 303
;303:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+1152+16
ADDRLP4 0
INDIRI4
ASGNI4
line 304
;304:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+1152+8
CNSTI4 18
ASGNI4
line 305
;305:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1152+48
ADDRGP4 InGame_Event
ASGNP4
line 306
;306:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+1152+60
ADDRGP4 $320
ASGNP4
line 307
;307:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+1152+68
ADDRGP4 color_red
ASGNP4
line 308
;308:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1152+64
CNSTI4 17
ASGNI4
line 310
;309:
;310:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 311
;311:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+720
CNSTI4 9
ASGNI4
line 312
;312:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+720+44
CNSTU4 264
ASGNU4
line 313
;313:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+720+12
CNSTI4 320
ASGNI4
line 314
;314:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+720+16
ADDRLP4 0
INDIRI4
ASGNI4
line 315
;315:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+720+8
CNSTI4 15
ASGNI4
line 316
;316:	s_ingame.leave.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+720+48
ADDRGP4 InGame_Event
ASGNP4
line 317
;317:	s_ingame.leave.string				= "LEAVE ARENA";
ADDRGP4 s_ingame+720+60
ADDRGP4 $338
ASGNP4
line 318
;318:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+720+68
ADDRGP4 color_red
ASGNP4
line 319
;319:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+720+64
CNSTI4 17
ASGNI4
line 321
;320:
;321:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 322
;322:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1080
CNSTI4 9
ASGNI4
line 323
;323:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1080+44
CNSTU4 264
ASGNU4
line 324
;324:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+1080+12
CNSTI4 320
ASGNI4
line 325
;325:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+1080+16
ADDRLP4 0
INDIRI4
ASGNI4
line 326
;326:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+1080+8
CNSTI4 17
ASGNI4
line 327
;327:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1080+48
ADDRGP4 InGame_Event
ASGNP4
line 328
;328:	s_ingame.quit.string				= "EXIT GAME";
ADDRGP4 s_ingame+1080+60
ADDRGP4 $356
ASGNP4
line 329
;329:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+1080+68
ADDRGP4 color_red
ASGNP4
line 330
;330:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1080+64
CNSTI4 17
ASGNI4
line 332
;331:
;332:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 333
;333:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 334
;334:	Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+864
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 335
;335:	Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+936
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 336
;336:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1008
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 337
;337:        Menu_AddItem( &s_ingame.menu, &s_ingame.vote );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1224
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 338
;338:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 339
;339:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 340
;340:	Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 341
;341:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 342
;342:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 343
;343:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1080
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 344
;344:}
LABELV $110
endproc InGame_MenuInit 4168 12
export InGame_Cache
proc InGame_Cache 0 4
line 352
;345:
;346:
;347:/*
;348:=================
;349:InGame_Cache
;350:=================
;351:*/
;352:void InGame_Cache( void ) {
line 353
;353:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $118
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 354
;354:}
LABELV $373
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 362
;355:
;356:
;357:/*
;358:=================
;359:UI_InGameMenu
;360:=================
;361:*/
;362:void UI_InGameMenu( void ) {
line 364
;363:	// force as top level menu
;364:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 367
;365:
;366:	// set menu cursor to a nice location
;367:	uis.cursorx = 0;
ADDRGP4 uis+8
CNSTI4 0
ASGNI4
line 368
;368:	uis.cursory = 0;
ADDRGP4 uis+12
CNSTI4 0
ASGNI4
line 370
;369:
;370:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 371
;371:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 372
;372:}
LABELV $374
endproc UI_InGameMenu 0 4
bss
align 4
LABELV s_ingame
skip 1296
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
import UI_Challenges
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
LABELV $356
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $338
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $320
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 77
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $298
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $280
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $262
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $245
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $238
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 32
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $220
byte 1 116
byte 1 0
align 1
LABELV $209
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $185
byte 1 82
byte 1 69
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $167
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $158
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $140
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $118
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
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $99
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 63
byte 1 0
align 1
LABELV $97
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $87
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $83
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
