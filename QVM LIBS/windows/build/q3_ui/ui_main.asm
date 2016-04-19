export vmMain
code
proc vmMain 12 8
file "../../../code/q3_ui/ui_main.c"
line 43
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
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
;26:USER INTERFACE MAIN
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:/*
;36:================
;37:vmMain
;38:
;39:This is the only way control passes into the module.
;40:This must be the very first function compiled into the .qvm file
;41:================
;42:*/
;43:intptr_t vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 44
;44:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $93
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $93
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $92
code
LABELV $82
line 46
;45:	case UI_GETAPIVERSION:
;46:		return UI_API_VERSION;
CNSTI4 4
RETI4
ADDRGP4 $79
JUMPV
LABELV $83
line 49
;47:
;48:	case UI_INIT:
;49:		UI_Init();
ADDRGP4 UI_Init
CALLV
pop
line 50
;50:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $84
line 53
;51:
;52:	case UI_SHUTDOWN:
;53:		UI_Shutdown();
ADDRGP4 UI_Shutdown
CALLV
pop
line 54
;54:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $85
line 57
;55:
;56:	case UI_KEY_EVENT:
;57:		UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_KeyEvent
CALLV
pop
line 58
;58:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $86
line 61
;59:
;60:	case UI_MOUSE_EVENT:
;61:		UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 62
;62:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $87
line 65
;63:
;64:	case UI_REFRESH:
;65:		UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_Refresh
CALLV
pop
line 66
;66:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $88
line 69
;67:
;68:	case UI_IS_FULLSCREEN:
;69:		return UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $79
JUMPV
LABELV $89
line 72
;70:
;71:	case UI_SET_ACTIVE_MENU:
;72:		UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_SetActiveMenu
CALLV
pop
line 73
;73:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $90
line 76
;74:
;75:	case UI_CONSOLE_COMMAND:
;76:		return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $79
JUMPV
LABELV $91
line 79
;77:
;78:	case UI_DRAW_CONNECT_SCREEN:
;79:		UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 80
;80:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $92
line 82
;81:	case UI_HASUNIQUECDKEY:				// mod authors need to observe this
;82:		return qtrue;  // bk010117 - change this to qfalse for mods!
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $80
line 85
;83:	}
;84:
;85:	return -1;
CNSTI4 -1
RETI4
LABELV $79
endproc vmMain 12 8
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $95
address $96
byte 4 1
address ui_ffa_timelimit
address $97
address $98
byte 4 1
address ui_tourney_fraglimit
address $99
address $98
byte 4 1
address ui_tourney_timelimit
address $100
address $101
byte 4 1
address ui_team_fraglimit
address $102
address $98
byte 4 1
address ui_team_timelimit
address $103
address $96
byte 4 1
address ui_team_friendly
address $104
address $105
byte 4 1
address ui_ctf_capturelimit
address $106
address $107
byte 4 1
address ui_ctf_timelimit
address $108
address $109
byte 4 1
address ui_ctf_friendly
address $110
address $98
byte 4 1
address ui_1fctf_capturelimit
address $111
address $107
byte 4 1
address ui_1fctf_timelimit
address $112
address $109
byte 4 1
address ui_1fctf_friendly
address $113
address $98
byte 4 1
address ui_overload_capturelimit
address $114
address $107
byte 4 1
address ui_overload_timelimit
address $115
address $109
byte 4 1
address ui_overload_friendly
address $116
address $98
byte 4 1
address ui_harvester_capturelimit
address $117
address $96
byte 4 1
address ui_harvester_timelimit
address $118
address $109
byte 4 1
address ui_harvester_friendly
address $119
address $98
byte 4 1
address ui_elimination_capturelimit
address $120
address $107
byte 4 1
address ui_elimination_timelimit
address $121
address $96
byte 4 1
address ui_ctf_elimination_capturelimit
address $122
address $107
byte 4 1
address ui_ctf_elimination_timelimit
address $123
address $109
byte 4 1
address ui_lms_fraglimit
address $124
address $96
byte 4 1
address ui_lms_timelimit
address $125
address $98
byte 4 1
address ui_dd_capturelimit
address $126
address $107
byte 4 1
address ui_dd_timelimit
address $127
address $109
byte 4 1
address ui_dd_friendly
address $128
address $98
byte 4 1
address ui_dom_capturelimit
address $129
address $130
byte 4 1
address ui_dom_timelimit
address $131
address $109
byte 4 1
address ui_dom_friendly
address $132
address $98
byte 4 1
address ui_arenasFile
address $133
address $134
byte 4 80
address ui_botsFile
address $135
address $134
byte 4 80
address ui_spScores1
address $136
address $134
byte 4 65
address ui_spScores2
address $137
address $134
byte 4 65
address ui_spScores3
address $138
address $134
byte 4 65
address ui_spScores4
address $139
address $134
byte 4 65
address ui_spScores5
address $140
address $134
byte 4 65
address ui_spAwards
address $141
address $134
byte 4 65
address ui_spVideos
address $142
address $134
byte 4 65
address ui_spSkill
address $143
address $144
byte 4 33
address ui_spSelection
address $145
address $134
byte 4 64
address ui_browserMaster
address $146
address $98
byte 4 1
address ui_browserGameType
address $147
address $98
byte 4 1
address ui_browserSortKey
address $148
address $149
byte 4 1
address ui_browserShowFull
address $150
address $105
byte 4 1
address ui_browserShowEmpty
address $151
address $105
byte 4 1
address ui_brassTime
address $152
address $153
byte 4 1
address ui_drawCrosshair
address $154
address $149
byte 4 1
address ui_drawCrosshairNames
address $155
address $105
byte 4 1
address ui_marks
address $156
address $105
byte 4 1
address ui_server1
address $157
address $134
byte 4 1
address ui_server2
address $158
address $134
byte 4 1
address ui_server3
address $159
address $134
byte 4 1
address ui_server4
address $160
address $134
byte 4 1
address ui_server5
address $161
address $134
byte 4 1
address ui_server6
address $162
address $134
byte 4 1
address ui_server7
address $163
address $134
byte 4 1
address ui_server8
address $164
address $134
byte 4 1
address ui_server9
address $165
address $134
byte 4 1
address ui_server10
address $166
address $134
byte 4 1
address ui_server11
address $167
address $134
byte 4 1
address ui_server12
address $168
address $134
byte 4 1
address ui_server13
address $169
address $134
byte 4 1
address ui_server14
address $170
address $134
byte 4 1
address ui_server15
address $171
address $134
byte 4 1
address ui_server16
address $172
address $134
byte 4 1
address ui_browserOnlyHumans
address $173
address $98
byte 4 1
address ui_setupchecked
address $174
address $98
byte 4 1
align 4
LABELV cvarTableSize
byte 4 69
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 297
;86:}
;87:
;88:
;89:/*
;90:================
;91:cvars
;92:================
;93:*/
;94:
;95:typedef struct {
;96:	vmCvar_t	*vmCvar;
;97:	char		*cvarName;
;98:	char		*defaultString;
;99:	int			cvarFlags;
;100:} cvarTable_t;
;101:
;102:vmCvar_t	ui_ffa_fraglimit;
;103:vmCvar_t	ui_ffa_timelimit;
;104:
;105:vmCvar_t	ui_tourney_fraglimit;
;106:vmCvar_t	ui_tourney_timelimit;
;107:
;108:vmCvar_t	ui_team_fraglimit;
;109:vmCvar_t	ui_team_timelimit;
;110:vmCvar_t	ui_team_friendly;
;111:
;112:vmCvar_t	ui_ctf_capturelimit;
;113:vmCvar_t	ui_ctf_timelimit;
;114:vmCvar_t	ui_ctf_friendly;
;115:
;116:vmCvar_t	ui_1fctf_capturelimit;
;117:vmCvar_t	ui_1fctf_timelimit;
;118:vmCvar_t	ui_1fctf_friendly;
;119:
;120:vmCvar_t	ui_overload_capturelimit;
;121:vmCvar_t	ui_overload_timelimit;
;122:vmCvar_t	ui_overload_friendly;
;123:
;124:vmCvar_t	ui_harvester_capturelimit;
;125:vmCvar_t	ui_harvester_timelimit;
;126:vmCvar_t	ui_harvester_friendly;
;127:
;128:vmCvar_t	ui_elimination_capturelimit;
;129:vmCvar_t	ui_elimination_timelimit;
;130:
;131:vmCvar_t	ui_ctf_elimination_capturelimit;
;132:vmCvar_t	ui_ctf_elimination_timelimit;
;133:
;134:vmCvar_t	ui_lms_fraglimit;
;135:vmCvar_t	ui_lms_timelimit;
;136:
;137:vmCvar_t	ui_dd_capturelimit;
;138:vmCvar_t	ui_dd_timelimit;
;139:vmCvar_t	ui_dd_friendly;
;140:
;141:vmCvar_t	ui_dom_capturelimit;
;142:vmCvar_t	ui_dom_timelimit;
;143:vmCvar_t	ui_dom_friendly;
;144:
;145:vmCvar_t	ui_arenasFile;
;146:vmCvar_t	ui_botsFile;
;147:vmCvar_t	ui_spScores1;
;148:vmCvar_t	ui_spScores2;
;149:vmCvar_t	ui_spScores3;
;150:vmCvar_t	ui_spScores4;
;151:vmCvar_t	ui_spScores5;
;152:vmCvar_t	ui_spAwards;
;153:vmCvar_t	ui_spVideos;
;154:vmCvar_t	ui_spSkill;
;155:
;156:vmCvar_t	ui_spSelection;
;157:
;158:vmCvar_t	ui_browserMaster;
;159:vmCvar_t	ui_browserGameType;
;160:vmCvar_t	ui_browserSortKey;
;161:vmCvar_t	ui_browserShowFull;
;162:vmCvar_t	ui_browserShowEmpty;
;163:
;164:vmCvar_t	ui_brassTime;
;165:vmCvar_t	ui_drawCrosshair;
;166:vmCvar_t	ui_drawCrosshairNames;
;167:vmCvar_t	ui_marks;
;168:
;169:vmCvar_t	ui_server1;
;170:vmCvar_t	ui_server2;
;171:vmCvar_t	ui_server3;
;172:vmCvar_t	ui_server4;
;173:vmCvar_t	ui_server5;
;174:vmCvar_t	ui_server6;
;175:vmCvar_t	ui_server7;
;176:vmCvar_t	ui_server8;
;177:vmCvar_t	ui_server9;
;178:vmCvar_t	ui_server10;
;179:vmCvar_t	ui_server11;
;180:vmCvar_t	ui_server12;
;181:vmCvar_t	ui_server13;
;182:vmCvar_t	ui_server14;
;183:vmCvar_t	ui_server15;
;184:vmCvar_t	ui_server16;
;185:
;186://vmCvar_t	ui_cdkeychecked;
;187:
;188://new in beta 23:
;189:vmCvar_t        ui_browserOnlyHumans;
;190:
;191://new in beta 37:
;192:vmCvar_t        ui_setupchecked;
;193:
;194:// bk001129 - made static to avoid aliasing.
;195:static cvarTable_t		cvarTable[] = {
;196:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;197:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;198:
;199:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;200:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;201:
;202:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;203:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;204:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;205:
;206:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;207:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;208:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;209:        
;210:        { &ui_1fctf_capturelimit, "ui_1fctf_capturelimit", "8", CVAR_ARCHIVE },
;211:	{ &ui_1fctf_timelimit, "ui_1fctf_timelimit", "30", CVAR_ARCHIVE },
;212:	{ &ui_1fctf_friendly, "ui_1fctf_friendly",  "0", CVAR_ARCHIVE },
;213:
;214:        { &ui_overload_capturelimit, "ui_overload_capturelimit", "8", CVAR_ARCHIVE },
;215:	{ &ui_overload_timelimit, "ui_overload_timelimit", "30", CVAR_ARCHIVE },
;216:	{ &ui_overload_friendly, "ui_overload_friendly",  "0", CVAR_ARCHIVE },
;217:        
;218:        { &ui_harvester_capturelimit, "ui_harvester_capturelimit", "20", CVAR_ARCHIVE },
;219:	{ &ui_harvester_timelimit, "ui_harvester_timelimit", "30", CVAR_ARCHIVE },
;220:	{ &ui_harvester_friendly, "ui_harvester_friendly",  "0", CVAR_ARCHIVE },
;221:        
;222:	{ &ui_elimination_capturelimit, "ui_elimination_capturelimit", "8", CVAR_ARCHIVE },
;223:	{ &ui_elimination_timelimit, "ui_elimination_timelimit", "20", CVAR_ARCHIVE },
;224:
;225:	{ &ui_ctf_elimination_capturelimit, "ui_ctf_elimination_capturelimit", "8", CVAR_ARCHIVE },
;226:	{ &ui_ctf_elimination_timelimit, "ui_ctf_elimination_timelimit", "30", CVAR_ARCHIVE },
;227:
;228:	{ &ui_lms_fraglimit, "ui_lms_fraglimit", "20", CVAR_ARCHIVE },
;229:	{ &ui_lms_timelimit, "ui_lms_timelimit", "0", CVAR_ARCHIVE },
;230:        
;231:	{ &ui_dd_capturelimit, "ui_dd_capturelimit", "8", CVAR_ARCHIVE },
;232:	{ &ui_dd_timelimit, "ui_dd_timelimit", "30", CVAR_ARCHIVE },
;233:	{ &ui_dd_friendly, "ui_dd_friendly",  "0", CVAR_ARCHIVE },
;234:
;235:        { &ui_dom_capturelimit, "ui_dom_capturelimit", "500", CVAR_ARCHIVE },
;236:	{ &ui_dom_timelimit, "ui_dom_timelimit", "30", CVAR_ARCHIVE },
;237:	{ &ui_dom_friendly, "ui_dom_friendly",  "0", CVAR_ARCHIVE },
;238:        
;239:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;240:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;241:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;242:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;243:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;244:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;245:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;246:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;247:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;248:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE | CVAR_LATCH },
;249:
;250:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;251:
;252:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;253:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;254:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;255:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;256:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;257:
;258:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;259:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;260:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;261:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;262:
;263:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;264:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;265:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;266:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;267:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;268:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;269:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;270:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;271:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;272:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;273:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;274:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;275:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;276:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;277:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;278:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;279:
;280:	//{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;281:        
;282:        //new in beta 23:
;283:        { &ui_browserOnlyHumans, "ui_browserOnlyHumans", "0", CVAR_ARCHIVE },
;284:
;285:        //new in beta 37:
;286:        { &ui_setupchecked, "ui_setupchecked", "0", CVAR_ARCHIVE },
;287:};
;288:
;289:// bk001129 - made static to avoid aliasing
;290:static int cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;291:
;292:/*
;293:=================
;294:UI_RegisterCvars
;295:=================
;296:*/
;297:void UI_RegisterCvars( void ) {
line 301
;298:	int			i;
;299:	cvarTable_t	*cv;
;300:
;301:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $179
JUMPV
LABELV $176
line 302
;302:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 303
;303:	}
LABELV $177
line 301
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $179
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $176
line 304
;304:}
LABELV $175
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 311
;305:
;306:/*
;307:=================
;308:UI_UpdateCvars
;309:=================
;310:*/
;311:void UI_UpdateCvars( void ) {
line 315
;312:	int			i;
;313:	cvarTable_t	*cv;
;314:
;315:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $184
JUMPV
LABELV $181
line 316
;316:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 317
;317:	}
LABELV $182
line 315
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $184
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $181
line 318
;318:}
LABELV $180
endproc UI_UpdateCvars 8 4
export UI_SetDefaultCvar
proc UI_SetDefaultCvar 8 8
line 327
;319:
;320:/*
;321:==================
;322: * UI_SetDefaultCvar
;323: * If the cvar is blank it will be set to value
;324: * This is only good for cvars that cannot naturally be blank
;325:================== 
;326: */
;327:void UI_SetDefaultCvar(const char* cvar, const char* value) {
line 328
;328:    if(strlen(UI_Cvar_VariableString(cvar)) == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $186
line 329
;329:        trap_Cvar_Set(cvar,value);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $186
line 330
;330:}
LABELV $185
endproc UI_SetDefaultCvar 8 8
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
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
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
bss
export ui_browserOnlyHumans
align 4
LABELV ui_browserOnlyHumans
skip 272
export ui_setupchecked
align 4
LABELV ui_setupchecked
skip 272
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_dom_friendly
align 4
LABELV ui_dom_friendly
skip 272
export ui_dom_timelimit
align 4
LABELV ui_dom_timelimit
skip 272
export ui_dom_capturelimit
align 4
LABELV ui_dom_capturelimit
skip 272
export ui_dd_friendly
align 4
LABELV ui_dd_friendly
skip 272
export ui_dd_timelimit
align 4
LABELV ui_dd_timelimit
skip 272
export ui_dd_capturelimit
align 4
LABELV ui_dd_capturelimit
skip 272
export ui_lms_timelimit
align 4
LABELV ui_lms_timelimit
skip 272
export ui_lms_fraglimit
align 4
LABELV ui_lms_fraglimit
skip 272
export ui_ctf_elimination_timelimit
align 4
LABELV ui_ctf_elimination_timelimit
skip 272
export ui_ctf_elimination_capturelimit
align 4
LABELV ui_ctf_elimination_capturelimit
skip 272
export ui_elimination_timelimit
align 4
LABELV ui_elimination_timelimit
skip 272
export ui_elimination_capturelimit
align 4
LABELV ui_elimination_capturelimit
skip 272
export ui_harvester_friendly
align 4
LABELV ui_harvester_friendly
skip 272
export ui_harvester_timelimit
align 4
LABELV ui_harvester_timelimit
skip 272
export ui_harvester_capturelimit
align 4
LABELV ui_harvester_capturelimit
skip 272
export ui_overload_friendly
align 4
LABELV ui_overload_friendly
skip 272
export ui_overload_timelimit
align 4
LABELV ui_overload_timelimit
skip 272
export ui_overload_capturelimit
align 4
LABELV ui_overload_capturelimit
skip 272
export ui_1fctf_friendly
align 4
LABELV ui_1fctf_friendly
skip 272
export ui_1fctf_timelimit
align 4
LABELV ui_1fctf_timelimit
skip 272
export ui_1fctf_capturelimit
align 4
LABELV ui_1fctf_capturelimit
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $174
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $173
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $172
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $171
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $169
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $166
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $163
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $162
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $161
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $160
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $159
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $158
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $157
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $153
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $150
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $149
byte 1 52
byte 1 0
align 1
LABELV $148
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $147
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $145
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $144
byte 1 50
byte 1 0
align 1
LABELV $143
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $142
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $141
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $139
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $138
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $137
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $136
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $135
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 0
align 1
LABELV $133
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $132
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $131
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $129
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $128
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 100
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $127
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 100
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $126
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 100
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $125
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $124
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 117
byte 1 105
byte 1 95
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $120
byte 1 117
byte 1 105
byte 1 95
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 117
byte 1 105
byte 1 95
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $118
byte 1 117
byte 1 105
byte 1 95
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 117
byte 1 105
byte 1 95
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $116
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $115
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $114
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 117
byte 1 105
byte 1 95
byte 1 49
byte 1 102
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $112
byte 1 117
byte 1 105
byte 1 95
byte 1 49
byte 1 102
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $111
byte 1 117
byte 1 105
byte 1 95
byte 1 49
byte 1 102
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $109
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $108
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 56
byte 1 0
align 1
LABELV $106
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 49
byte 1 0
align 1
LABELV $104
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $103
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $102
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $100
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $99
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $98
byte 1 48
byte 1 0
align 1
LABELV $97
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $96
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $95
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
