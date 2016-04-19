data
export ui_medalNames
align 4
LABELV ui_medalNames
address $80
address $81
address $82
address $83
address $84
address $85
export ui_medalPicNames
align 4
LABELV ui_medalPicNames
address $86
address $87
address $88
address $89
address $90
address $91
export ui_medalSounds
align 4
LABELV ui_medalSounds
address $92
address $93
address $94
address $95
address $96
address $97
code
proc UI_SPPostgameMenu_AgainEvent 0 8
file "../../../code/q3_ui/ui_sppostgame.c"
line 105
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
;24:=============================================================================
;25:
;26:SINGLE PLAYER POSTGAME MENU
;27:
;28:=============================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:#define MAX_SCOREBOARD_CLIENTS		8
;34:
;35:#define AWARD_PRESENTATION_TIME		2000
;36:
;37:#define ART_MENU0		"menu/art_blueish/menu_0"
;38:#define ART_MENU1		"menu/art_blueish/menu_1"
;39:#define ART_REPLAY0		"menu/art_blueish/replay_0"
;40:#define ART_REPLAY1		"menu/art_blueish/replay_1"
;41:#define ART_NEXT0		"menu/art_blueish/next_0"
;42:#define ART_NEXT1		"menu/art_blueish/next_1"
;43:
;44:#define ID_AGAIN		10
;45:#define ID_NEXT			11
;46:#define ID_MENU			12
;47:
;48:typedef struct {
;49:	menuframework_s	menu;
;50:	menubitmap_s	item_again;
;51:	menubitmap_s	item_next;
;52:	menubitmap_s	item_menu;
;53:
;54:	int				phase;
;55:	int				ignoreKeysTime;
;56:	int				starttime;
;57:	int				scoreboardtime;
;58:	int				serverId;
;59:
;60:	int				clientNums[MAX_SCOREBOARD_CLIENTS];
;61:	int				ranks[MAX_SCOREBOARD_CLIENTS];
;62:	int				scores[MAX_SCOREBOARD_CLIENTS];
;63:
;64:	char			placeNames[3][64];
;65:
;66:	int				level;
;67:	int				numClients;
;68:	int				won;
;69:	int				numAwards;
;70:	int				awardsEarned[6];
;71:	int				awardsLevels[6];
;72:	qboolean		playedSound[6];
;73:	int				lastTier;
;74:	sfxHandle_t		winnerSound;
;75:} postgameMenuInfo_t;
;76:
;77:static postgameMenuInfo_t	postgameMenuInfo;
;78:static char					arenainfo[MAX_INFO_VALUE];
;79:
;80:char	*ui_medalNames[] = {"Accuracy", "Impressive", "Excellent", "Gauntlet", "Frags", "Perfect"};
;81:char	*ui_medalPicNames[] = {
;82:	"menu/medals/medal_accuracy",
;83:	"menu/medals/medal_impressive",
;84:	"menu/medals/medal_excellent",
;85:	"menu/medals/medal_gauntlet",
;86:	"menu/medals/medal_frags",
;87:	"menu/medals/medal_victory"
;88:};
;89:char	*ui_medalSounds[] = {
;90:	"sound/feedback/accuracy.wav",
;91:	"sound/feedback/impressive_a.wav",
;92:	"sound/feedback/excellent_a.wav",
;93:	"sound/feedback/gauntlet.wav",
;94:	"sound/feedback/frags.wav",
;95:	"sound/feedback/perfect.wav"
;96:};
;97:
;98:
;99:/*
;100:=================
;101:UI_SPPostgameMenu_AgainEvent
;102:=================
;103:*/
;104:static void UI_SPPostgameMenu_AgainEvent( void* ptr, int event )
;105:{
line 106
;106:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $99
line 107
;107:		return;
ADDRGP4 $98
JUMPV
LABELV $99
line 109
;108:	}
;109:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 110
;110:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $101
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 111
;111:}
LABELV $98
endproc UI_SPPostgameMenu_AgainEvent 0 8
proc UI_SPPostgameMenu_NextEvent 36 4
line 119
;112:
;113:
;114:/*
;115:=================
;116:UI_SPPostgameMenu_NextEvent
;117:=================
;118:*/
;119:static void UI_SPPostgameMenu_NextEvent( void* ptr, int event ) {
line 126
;120:	int			currentSet;
;121:	int			levelSet;
;122:	int			level;
;123:	int			currentLevel;
;124:	const char	*arenaInfo;
;125:
;126:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $103
line 127
;127:		return;
ADDRGP4 $102
JUMPV
LABELV $103
line 129
;128:	}
;129:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;130:
;131:	// handle specially if we just won the training map
;132:	if( postgameMenuInfo.won == 0 ) {
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 0
NEI4 $105
line 133
;133:		level = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 134
;134:	}
ADDRGP4 $106
JUMPV
LABELV $105
line 135
;135:	else {
line 136
;136:		level = postgameMenuInfo.level + 1;
ADDRLP4 4
ADDRGP4 postgameMenuInfo+988
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 137
;137:	}
LABELV $106
line 138
;138:	levelSet = level / ARENAS_PER_TIER;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 140
;139:
;140:	currentLevel = UI_GetCurrentGame();
ADDRLP4 20
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 141
;141:	if( currentLevel == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $109
line 142
;142:		currentLevel = postgameMenuInfo.level;
ADDRLP4 0
ADDRGP4 postgameMenuInfo+988
INDIRI4
ASGNI4
line 143
;143:	}
LABELV $109
line 144
;144:	currentSet = currentLevel / ARENAS_PER_TIER;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 146
;145:
;146:	if( levelSet > currentSet || levelSet == UI_GetNumSPTiers() ) {
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $114
ADDRLP4 28
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $112
LABELV $114
line 147
;147:		level = currentLevel;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 148
;148:	}
LABELV $112
line 150
;149:
;150:	arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
line 151
;151:	if ( !arenaInfo ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 152
;152:		return;
ADDRGP4 $102
JUMPV
LABELV $115
line 155
;153:	}
;154:
;155:	UI_SPArena_Start( arenaInfo );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
line 156
;156:}
LABELV $102
endproc UI_SPPostgameMenu_NextEvent 36 4
proc UI_SPPostgameMenu_MenuEvent 0 8
line 165
;157:
;158:
;159:/*
;160:=================
;161:UI_SPPostgameMenu_MenuEvent
;162:=================
;163:*/
;164:static void UI_SPPostgameMenu_MenuEvent( void* ptr, int event )
;165:{
line 166
;166:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $118
line 167
;167:		return;
ADDRGP4 $117
JUMPV
LABELV $118
line 169
;168:	}
;169:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 170
;170:        trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $120
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 171
;171:	trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; levelselect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $122
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 172
;172:}
LABELV $117
endproc UI_SPPostgameMenu_MenuEvent 0 8
proc UI_SPPostgameMenu_MenuKey 8 8
line 180
;173:
;174:
;175:/*
;176:=================
;177:UI_SPPostgameMenu_MenuKey
;178:=================
;179:*/
;180:static sfxHandle_t UI_SPPostgameMenu_MenuKey( int key ) {
line 181
;181:	if ( uis.realtime < postgameMenuInfo.ignoreKeysTime ) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+684
INDIRI4
GEI4 $124
line 182
;182:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $124
line 185
;183:	}
;184:
;185:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+680
INDIRI4
CNSTI4 1
NEI4 $128
line 186
;186:		trap_Cmd_ExecuteText( EXEC_APPEND, "abort_podium\n" );
CNSTI4 2
ARGI4
ADDRGP4 $131
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 187
;187:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+680
CNSTI4 2
ASGNI4
line 188
;188:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+688
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 189
;189:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+684
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 190
;190:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $128
line 193
;191:	}
;192:
;193:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+680
INDIRI4
CNSTI4 2
NEI4 $137
line 194
;194:		postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+680
CNSTI4 3
ASGNI4
line 195
;195:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+688
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 196
;196:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+684
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 197
;197:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $137
line 200
;198:	}
;199:
;200:	if( key == K_ESCAPE || key == K_MOUSE2 ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
EQI4 $147
ADDRLP4 0
INDIRI4
CNSTI4 179
NEI4 $145
LABELV $147
line 201
;201:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $145
line 204
;202:	}
;203:
;204:	return Menu_DefaultKey( &postgameMenuInfo.menu, key );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $123
endproc UI_SPPostgameMenu_MenuKey 8 8
data
align 4
LABELV medalLocations
byte 4 144
byte 4 448
byte 4 88
byte 4 504
byte 4 32
byte 4 560
code
proc UI_SPPostgameMenu_DrawAwardsMedals 40 20
line 210
;205:}
;206:
;207:
;208:static int medalLocations[6] = {144, 448, 88, 504, 32, 560};
;209:
;210:static void UI_SPPostgameMenu_DrawAwardsMedals( int max ) {
line 217
;211:	int		n;
;212:	int		medal;
;213:	int		amount;
;214:	int		x, y;
;215:	char	buf[16];
;216:
;217:	for( n = 0; n < max; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $149
line 218
;218:		x = medalLocations[n];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 medalLocations
ADDP4
INDIRI4
ASGNI4
line 219
;219:		y = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 220
;220:		medal = postgameMenuInfo.awardsEarned[n];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
INDIRI4
ASGNI4
line 221
;221:		amount = postgameMenuInfo.awardsLevels[n];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
INDIRI4
ASGNI4
line 223
;222:
;223:		UI_DrawNamedPic( x, y, 48, 48, ui_medalPicNames[medal] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1111490560
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 225
;224:
;225:		if( medal == AWARD_ACCURACY ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $155
line 226
;226:			Com_sprintf( buf, sizeof(buf), "%i%%", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 227
;227:		}
ADDRGP4 $156
JUMPV
LABELV $155
line 228
;228:		else {
line 229
;229:			if( amount == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $158
line 230
;230:				continue;
ADDRGP4 $150
JUMPV
LABELV $158
line 232
;231:			}
;232:			Com_sprintf( buf, sizeof(buf), "%i", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $160
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 233
;233:		}
LABELV $156
line 235
;234:
;235:		UI_DrawString( x + 24, y + 52, buf, UI_CENTER, color_yellow );
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 52
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 236
;236:	}
LABELV $150
line 217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $152
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $149
line 237
;237:}
LABELV $148
endproc UI_SPPostgameMenu_DrawAwardsMedals 40 20
proc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
line 240
;238:
;239:
;240:static void UI_SPPostgameMenu_DrawAwardsPresentation( int timer ) {
line 245
;241:	int		awardNum;
;242:	int		atimer;
;243:	vec4_t	color;
;244:
;245:	awardNum = timer / AWARD_PRESENTATION_TIME;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2000
DIVI4
ASGNI4
line 246
;246:	atimer = timer % AWARD_PRESENTATION_TIME;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 2000
MODI4
ASGNI4
line 248
;247:
;248:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 249
;249:	color[3] = (float)( AWARD_PRESENTATION_TIME - atimer ) / (float)AWARD_PRESENTATION_TIME;
ADDRLP4 4+12
CNSTI4 2000
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
line 250
;250:	UI_DrawProportionalString( 320, 64, ui_medalNames[postgameMenuInfo.awardsEarned[awardNum]], UI_CENTER, color );
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 ui_medalNames
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 252
;251:
;252:	UI_SPPostgameMenu_DrawAwardsMedals( awardNum + 1 );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 254
;253:
;254:	if( !postgameMenuInfo.playedSound[awardNum] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1052
ADDP4
INDIRI4
CNSTI4 0
NEI4 $166
line 255
;255:		postgameMenuInfo.playedSound[awardNum] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1052
ADDP4
CNSTI4 1
ASGNI4
line 256
;256:		trap_S_StartLocalSound( trap_S_RegisterSound( ui_medalSounds[postgameMenuInfo.awardsEarned[awardNum]], qfalse ), CHAN_ANNOUNCER );
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 257
;257:	}
LABELV $166
line 258
;258:}
LABELV $161
endproc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
proc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
line 266
;259:
;260:
;261:/*
;262:=================
;263:UI_SPPostgameMenu_MenuDrawScoreLine
;264:=================
;265:*/
;266:static void UI_SPPostgameMenu_MenuDrawScoreLine( int n, int y ) {
line 271
;267:	int		rank;
;268:	char	name[64];
;269:	char	info[MAX_INFO_STRING];
;270:
;271:	if( n > (postgameMenuInfo.numClients + 1) ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 1
ADDI4
LEI4 $172
line 272
;272:		n -= (postgameMenuInfo.numClients + 2);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 273
;273:	}
LABELV $172
line 275
;274:
;275:	if( n >= postgameMenuInfo.numClients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+992
INDIRI4
LTI4 $176
line 276
;276:		return;
ADDRGP4 $171
JUMPV
LABELV $176
line 279
;277:	}
;278:
;279:	rank = postgameMenuInfo.ranks[n];
ADDRLP4 64
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+732
ADDP4
INDIRI4
ASGNI4
line 280
;280:	if( rank & RANK_TIED_FLAG ) {
ADDRLP4 64
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $180
line 281
;281:		UI_DrawString( 640 - 31 * SMALLCHAR_WIDTH, y, "(tie)", UI_LEFT|UI_SMALLFONT, color_white );
CNSTI4 392
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $182
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 282
;282:		rank &= ~RANK_TIED_FLAG;
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 283
;283:	}
LABELV $180
line 284
;284:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[n], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+700
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 285
;285:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 286
;286:	Q_CleanStr( name );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 288
;287:
;288:	UI_DrawString( 640 - 25 * SMALLCHAR_WIDTH, y, va( "#%i: %-16s %2i", rank + 1, name, postgameMenuInfo.scores[n] ), UI_LEFT|UI_SMALLFONT, color_white );
ADDRGP4 $185
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+764
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 440
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 289
;289:}
LABELV $171
endproc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
proc UI_SPPostgameMenu_MenuDraw 1060 20
line 297
;290:
;291:
;292:/*
;293:=================
;294:UI_SPPostgameMenu_MenuDraw
;295:=================
;296:*/
;297:static void UI_SPPostgameMenu_MenuDraw( void ) {
line 303
;298:	int		timer;
;299:	int		serverId;
;300:	int		n;
;301:	char	info[MAX_INFO_STRING];
;302:
;303:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 304
;304:	serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 305
;305:	if( serverId != postgameMenuInfo.serverId ) {
ADDRLP4 1032
INDIRI4
ADDRGP4 postgameMenuInfo+696
INDIRI4
EQI4 $189
line 306
;306:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 307
;307:		return;
ADDRGP4 $187
JUMPV
LABELV $189
line 311
;308:	}
;309:
;310:	// phase 1
;311:	if ( postgameMenuInfo.numClients > 2 ) {
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 2
LEI4 $192
line 312
;312:		UI_DrawProportionalString( 510, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[2], UI_CENTER, color_white );
CNSTI4 510
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+796+128
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 313
;313:	}
LABELV $192
line 314
;314:	UI_DrawProportionalString( 130, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[1], UI_CENTER, color_white );
CNSTI4 130
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+796+64
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 315
;315:	UI_DrawProportionalString( 320, 480 - 64 - 2 * PROP_HEIGHT, postgameMenuInfo.placeNames[0], UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 362
ARGI4
ADDRGP4 postgameMenuInfo+796
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 317
;316:
;317:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+680
INDIRI4
CNSTI4 1
NEI4 $200
line 318
;318:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+688
INDIRI4
SUBI4
ASGNI4
line 320
;319:
;320:		if( timer >= 1000 && postgameMenuInfo.winnerSound ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $205
ADDRGP4 postgameMenuInfo+1080
INDIRI4
CNSTI4 0
EQI4 $205
line 321
;321:			trap_S_StartLocalSound( postgameMenuInfo.winnerSound, CHAN_ANNOUNCER );
ADDRGP4 postgameMenuInfo+1080
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 322
;322:			postgameMenuInfo.winnerSound = 0;
ADDRGP4 postgameMenuInfo+1080
CNSTI4 0
ASGNI4
line 323
;323:		}
LABELV $205
line 325
;324:
;325:		if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $210
line 326
;326:			return;
ADDRGP4 $187
JUMPV
LABELV $210
line 328
;327:		}
;328:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+680
CNSTI4 2
ASGNI4
line 329
;329:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+688
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 330
;330:	}
LABELV $200
line 333
;331:
;332:	// phase 2
;333:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+680
INDIRI4
CNSTI4 2
NEI4 $215
line 334
;334:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+688
INDIRI4
SUBI4
ASGNI4
line 335
;335:		if( timer >= ( postgameMenuInfo.numAwards * AWARD_PRESENTATION_TIME ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2000
ADDRGP4 postgameMenuInfo+1000
INDIRI4
MULI4
LTI4 $220
line 337
;336:
;337:			if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $223
line 338
;338:				return;
ADDRGP4 $187
JUMPV
LABELV $223
line 341
;339:			}
;340:
;341:			postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+680
CNSTI4 3
ASGNI4
line 342
;342:			postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+688
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 343
;343:		}
ADDRGP4 $221
JUMPV
LABELV $220
line 344
;344:		else {
line 345
;345:			UI_SPPostgameMenu_DrawAwardsPresentation( timer );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsPresentation
CALLV
pop
line 346
;346:		}
LABELV $221
line 347
;347:	}
LABELV $215
line 350
;348:
;349:	// phase 3
;350:	if( postgameMenuInfo.phase == 3 ) {
ADDRGP4 postgameMenuInfo+680
INDIRI4
CNSTI4 3
NEI4 $228
line 351
;351:		if( uis.demoversion ) {
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $231
line 352
;352:			if( postgameMenuInfo.won == 1 && UI_ShowTierVideo( 8 )) {
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 1
NEI4 $232
CNSTI4 8
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $232
line 353
;353:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $120
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 354
;354:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic demoEnd.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $237
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 355
;355:				return;
ADDRGP4 $187
JUMPV
line 357
;356:			}
;357:		}
LABELV $231
line 358
;358:		else if( postgameMenuInfo.won > -1 && UI_ShowTierVideo( postgameMenuInfo.won + 1 )) {
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 -1
LEI4 $238
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $238
line 359
;359:			if( postgameMenuInfo.won == postgameMenuInfo.lastTier ) {
ADDRGP4 postgameMenuInfo+996
INDIRI4
ADDRGP4 postgameMenuInfo+1076
INDIRI4
NEI4 $242
line 360
;360:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $120
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 361
;361:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic end.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 362
;362:				return;
ADDRGP4 $187
JUMPV
LABELV $242
line 365
;363:			}
;364:
;365:			trap_Cvar_SetValue( "ui_spSelection", postgameMenuInfo.won * ARENAS_PER_TIER );
ADDRGP4 $247
ARGP4
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 2
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 366
;366:			trap_Cvar_Set( "nextmap", "levelselect" );
ADDRGP4 $120
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 367
;367:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "disconnect; cinematic tier%i.RoQ\n", postgameMenuInfo.won + 1 ) );
ADDRGP4 $250
ARGP4
ADDRGP4 postgameMenuInfo+996
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 368
;368:			return;
ADDRGP4 $187
JUMPV
LABELV $238
LABELV $232
line 371
;369:		}
;370:
;371:		postgameMenuInfo.item_again.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1048
ADDRGP4 postgameMenuInfo+416+44
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 372
;372:		postgameMenuInfo.item_next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1052
ADDRGP4 postgameMenuInfo+504+44
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 373
;373:		postgameMenuInfo.item_menu.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1056
ADDRGP4 postgameMenuInfo+592+44
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 375
;374:
;375:		UI_SPPostgameMenu_DrawAwardsMedals( postgameMenuInfo.numAwards );
ADDRGP4 postgameMenuInfo+1000
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 377
;376:
;377:		Menu_Draw( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 378
;378:	}
LABELV $228
line 381
;379:
;380:	// draw the scoreboard
;381:	if( !trap_Cvar_VariableValue( "ui_spScoreboard" ) ) {
ADDRGP4 $261
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
INDIRF4
CNSTF4 0
NEF4 $259
line 382
;382:		return;
ADDRGP4 $187
JUMPV
LABELV $259
line 385
;383:	}
;384:
;385:	timer = uis.realtime - postgameMenuInfo.scoreboardtime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+692
INDIRI4
SUBI4
ASGNI4
line 386
;386:	if( postgameMenuInfo.numClients <= 3 ) {
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 3
GTI4 $264
line 387
;387:		n = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 388
;388:	}
ADDRGP4 $265
JUMPV
LABELV $264
line 389
;389:	else {
line 390
;390:		n = timer / 1500 % (postgameMenuInfo.numClients + 2);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1500
DIVI4
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 2
ADDI4
MODI4
ASGNI4
line 391
;391:	}
LABELV $265
line 392
;392:	UI_SPPostgameMenu_MenuDrawScoreLine( n, 0 );
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 393
;393:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 1, 0 + SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 394
;394:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 2, 0 + 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 395
;395:}
LABELV $187
endproc UI_SPPostgameMenu_MenuDraw 1060 20
export UI_SPPostgameMenu_Cache
proc UI_SPPostgameMenu_Cache 12 8
line 403
;396:
;397:
;398:/*
;399:=================
;400:UI_SPPostgameMenu_Cache
;401:=================
;402:*/
;403:void UI_SPPostgameMenu_Cache( void ) {
line 407
;404:	int			n;
;405:	qboolean	buildscript;
;406:
;407:	buildscript = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $269
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 409
;408:
;409:	trap_R_RegisterShaderNoMip( ART_MENU0 );
ADDRGP4 $270
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 410
;410:	trap_R_RegisterShaderNoMip( ART_MENU1 );
ADDRGP4 $271
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 411
;411:	trap_R_RegisterShaderNoMip( ART_REPLAY0 );
ADDRGP4 $272
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 412
;412:	trap_R_RegisterShaderNoMip( ART_REPLAY1 );
ADDRGP4 $273
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 413
;413:	trap_R_RegisterShaderNoMip( ART_NEXT0 );
ADDRGP4 $274
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 414
;414:	trap_R_RegisterShaderNoMip( ART_NEXT1 );
ADDRGP4 $275
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 415
;415:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 416
;416:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 417
;417:		trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 418
;418:	}
LABELV $277
line 415
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $276
line 420
;419:
;420:	if( buildscript ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $280
line 421
;421:		trap_S_RegisterSound( "music/loss.wav", qfalse );
ADDRGP4 $282
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 422
;422:		trap_S_RegisterSound( "music/win.wav", qfalse );
ADDRGP4 $283
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 423
;423:		trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $284
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 424
;424:	}
LABELV $280
line 425
;425:}
LABELV $268
endproc UI_SPPostgameMenu_Cache 12 8
proc UI_SPPostgameMenu_Init 0 8
line 433
;426:
;427:
;428:/*
;429:=================
;430:UI_SPPostgameMenu_Init
;431:=================
;432:*/
;433:static void UI_SPPostgameMenu_Init( void ) {
line 434
;434:	postgameMenuInfo.menu.wrapAround	= qtrue;
ADDRGP4 postgameMenuInfo+404
CNSTI4 1
ASGNI4
line 435
;435:	postgameMenuInfo.menu.key			= UI_SPPostgameMenu_MenuKey;
ADDRGP4 postgameMenuInfo+400
ADDRGP4 UI_SPPostgameMenu_MenuKey
ASGNP4
line 436
;436:	postgameMenuInfo.menu.draw			= UI_SPPostgameMenu_MenuDraw;
ADDRGP4 postgameMenuInfo+396
ADDRGP4 UI_SPPostgameMenu_MenuDraw
ASGNP4
line 437
;437:	postgameMenuInfo.ignoreKeysTime		= uis.realtime + 1500;
ADDRGP4 postgameMenuInfo+684
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 439
;438:
;439:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 441
;440:
;441:	postgameMenuInfo.item_menu.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+592
CNSTI4 6
ASGNI4
line 442
;442:	postgameMenuInfo.item_menu.generic.name			= ART_MENU0;
ADDRGP4 postgameMenuInfo+592+4
ADDRGP4 $270
ASGNP4
line 443
;443:	postgameMenuInfo.item_menu.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+592+44
CNSTU4 16644
ASGNU4
line 444
;444:	postgameMenuInfo.item_menu.generic.x			= 0;
ADDRGP4 postgameMenuInfo+592+12
CNSTI4 0
ASGNI4
line 445
;445:	postgameMenuInfo.item_menu.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+592+16
CNSTI4 416
ASGNI4
line 446
;446:	postgameMenuInfo.item_menu.generic.callback		= UI_SPPostgameMenu_MenuEvent;
ADDRGP4 postgameMenuInfo+592+48
ADDRGP4 UI_SPPostgameMenu_MenuEvent
ASGNP4
line 447
;447:	postgameMenuInfo.item_menu.generic.id			= ID_MENU;
ADDRGP4 postgameMenuInfo+592+8
CNSTI4 12
ASGNI4
line 448
;448:	postgameMenuInfo.item_menu.width				= 128;
ADDRGP4 postgameMenuInfo+592+76
CNSTI4 128
ASGNI4
line 449
;449:	postgameMenuInfo.item_menu.height				= 64;
ADDRGP4 postgameMenuInfo+592+80
CNSTI4 64
ASGNI4
line 450
;450:	postgameMenuInfo.item_menu.focuspic				= ART_MENU1;
ADDRGP4 postgameMenuInfo+592+60
ADDRGP4 $271
ASGNP4
line 452
;451:
;452:	postgameMenuInfo.item_again.generic.type		= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+416
CNSTI4 6
ASGNI4
line 453
;453:	postgameMenuInfo.item_again.generic.name		= ART_REPLAY0;
ADDRGP4 postgameMenuInfo+416+4
ADDRGP4 $272
ASGNP4
line 454
;454:	postgameMenuInfo.item_again.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+416+44
CNSTU4 16648
ASGNU4
line 455
;455:	postgameMenuInfo.item_again.generic.x			= 320;
ADDRGP4 postgameMenuInfo+416+12
CNSTI4 320
ASGNI4
line 456
;456:	postgameMenuInfo.item_again.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+416+16
CNSTI4 416
ASGNI4
line 457
;457:	postgameMenuInfo.item_again.generic.callback	= UI_SPPostgameMenu_AgainEvent;
ADDRGP4 postgameMenuInfo+416+48
ADDRGP4 UI_SPPostgameMenu_AgainEvent
ASGNP4
line 458
;458:	postgameMenuInfo.item_again.generic.id			= ID_AGAIN;
ADDRGP4 postgameMenuInfo+416+8
CNSTI4 10
ASGNI4
line 459
;459:	postgameMenuInfo.item_again.width				= 128;
ADDRGP4 postgameMenuInfo+416+76
CNSTI4 128
ASGNI4
line 460
;460:	postgameMenuInfo.item_again.height				= 64;
ADDRGP4 postgameMenuInfo+416+80
CNSTI4 64
ASGNI4
line 461
;461:	postgameMenuInfo.item_again.focuspic			= ART_REPLAY1;
ADDRGP4 postgameMenuInfo+416+60
ADDRGP4 $273
ASGNP4
line 463
;462:
;463:	postgameMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+504
CNSTI4 6
ASGNI4
line 464
;464:	postgameMenuInfo.item_next.generic.name			= ART_NEXT0;
ADDRGP4 postgameMenuInfo+504+4
ADDRGP4 $274
ASGNP4
line 465
;465:	postgameMenuInfo.item_next.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+504+44
CNSTU4 16656
ASGNU4
line 466
;466:	postgameMenuInfo.item_next.generic.x			= 640;
ADDRGP4 postgameMenuInfo+504+12
CNSTI4 640
ASGNI4
line 467
;467:	postgameMenuInfo.item_next.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+504+16
CNSTI4 416
ASGNI4
line 468
;468:	postgameMenuInfo.item_next.generic.callback		= UI_SPPostgameMenu_NextEvent;
ADDRGP4 postgameMenuInfo+504+48
ADDRGP4 UI_SPPostgameMenu_NextEvent
ASGNP4
line 469
;469:	postgameMenuInfo.item_next.generic.id			= ID_NEXT;
ADDRGP4 postgameMenuInfo+504+8
CNSTI4 11
ASGNI4
line 470
;470:	postgameMenuInfo.item_next.width				= 128;
ADDRGP4 postgameMenuInfo+504+76
CNSTI4 128
ASGNI4
line 471
;471:	postgameMenuInfo.item_next.height				= 64;
ADDRGP4 postgameMenuInfo+504+80
CNSTI4 64
ASGNI4
line 472
;472:	postgameMenuInfo.item_next.focuspic				= ART_NEXT1;
ADDRGP4 postgameMenuInfo+504+60
ADDRGP4 $275
ASGNP4
line 474
;473:
;474:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 475
;475:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 476
;476:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 477
;477:}
LABELV $285
endproc UI_SPPostgameMenu_Init 0 8
proc Prepname 1104 12
line 480
;478:
;479:
;480:static void Prepname( int index ) {
line 485
;481:	int		len;
;482:	char	name[64];
;483:	char	info[MAX_INFO_STRING];
;484:
;485:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[index], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+700
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 486
;486:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 487
;487:	Q_CleanStr( name );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 488
;488:	len = strlen( name );
ADDRLP4 4
ARGP4
ADDRLP4 1096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1096
INDIRI4
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $353
line 490
;489:
;490:	while( len && UI_ProportionalStringWidth( name ) > 256 ) {
line 491
;491:		len--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 492
;492:		name[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 493
;493:	}
LABELV $354
line 490
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $356
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 256
GTI4 $353
LABELV $356
line 495
;494:
;495:	Q_strncpyz( postgameMenuInfo.placeNames[index], name, sizeof(postgameMenuInfo.placeNames[index]) );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 postgameMenuInfo+796
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 496
;496:}
LABELV $351
endproc Prepname 1104 12
export UI_SPPostgameMenu_f
proc UI_SPPostgameMenu_f 1244 12
line 504
;497:
;498:
;499:/*
;500:=================
;501:UI_SPPostgameMenu_f
;502:=================
;503:*/
;504:void UI_SPPostgameMenu_f( void ) {
line 514
;505:	int			playerGameRank;
;506:	int			playerClientNum;
;507:	int			n;
;508:	int			oldFrags, newFrags;
;509:	const char	*arena;
;510:	int			awardValues[6];
;511:	char		map[MAX_QPATH];
;512:	char		info[MAX_INFO_STRING];
;513:
;514:	memset( &postgameMenuInfo, 0, sizeof(postgameMenuInfo) );
ADDRGP4 postgameMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1084
ARGI4
ADDRGP4 memset
CALLP4
pop
line 516
;515:
;516:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 517
;517:	postgameMenuInfo.serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 36
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+696
ADDRLP4 1140
INDIRI4
ASGNI4
line 519
;518:
;519:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 520
;520:	Q_strncpyz( map, Info_ValueForKey( info, "mapname" ), sizeof(map) );
ADDRLP4 36
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 521
;521:	arena = UI_GetArenaInfoByMap( map );
ADDRLP4 1064
ARGP4
ADDRLP4 1148
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1060
ADDRLP4 1148
INDIRP4
ASGNP4
line 522
;522:	if ( !arena ) {
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $362
line 523
;523:		return;
ADDRGP4 $359
JUMPV
LABELV $362
line 525
;524:	}
;525:	Q_strncpyz( arenainfo, arena, sizeof(arenainfo) );
ADDRGP4 arenainfo
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 527
;526:
;527:	postgameMenuInfo.level = atoi( Info_ValueForKey( arenainfo, "num" ) );
ADDRGP4 arenainfo
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 1152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+988
ADDRLP4 1156
INDIRI4
ASGNI4
line 529
;528:
;529:	postgameMenuInfo.numClients = atoi( UI_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+992
ADDRLP4 1164
INDIRI4
ASGNI4
line 530
;530:	playerClientNum = atoi( UI_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1172
INDIRI4
ASGNI4
line 531
;531:	playerGameRank = 8;		// in case they ended game as a spectator
ADDRLP4 32
CNSTI4 8
ASGNI4
line 533
;532:
;533:	if( postgameMenuInfo.numClients > MAX_SCOREBOARD_CLIENTS ) {
ADDRGP4 postgameMenuInfo+992
INDIRI4
CNSTI4 8
LEI4 $367
line 534
;534:		postgameMenuInfo.numClients = MAX_SCOREBOARD_CLIENTS;
ADDRGP4 postgameMenuInfo+992
CNSTI4 8
ASGNI4
line 535
;535:	}
LABELV $367
line 537
;536:
;537:	for( n = 0; n < postgameMenuInfo.numClients; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $371
line 538
;538:		postgameMenuInfo.clientNums[n] = atoi( UI_Argv( 8 + n * 3 + 1 ) );
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+700
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 539
;539:		postgameMenuInfo.ranks[n] = atoi( UI_Argv( 8 + n * 3 + 2 ) );
ADDRLP4 1192
CNSTI4 2
ASGNI4
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1192
INDIRI4
ADDI4
ARGI4
ADDRLP4 1196
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1192
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+732
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 540
;540:		postgameMenuInfo.scores[n] = atoi( UI_Argv( 8 + n * 3 + 3 ) );
ADDRLP4 1204
CNSTI4 3
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1204
INDIRI4
ADDI4
ARGI4
ADDRLP4 1212
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+764
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 542
;541:
;542:		if( postgameMenuInfo.clientNums[n] == playerClientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+700
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $379
line 543
;543:			playerGameRank = (postgameMenuInfo.ranks[n] & ~RANK_TIED_FLAG) + 1;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+732
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:		}
LABELV $379
line 545
;545:	}
LABELV $372
line 537
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $374
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+992
INDIRI4
LTI4 $371
line 547
;546:
;547:	UI_SetBestScore( postgameMenuInfo.level, playerGameRank );
ADDRGP4 postgameMenuInfo+988
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 UI_SetBestScore
CALLV
pop
line 550
;548:
;549:	// process award stats and prepare presentation data
;550:	awardValues[AWARD_ACCURACY] = atoi( UI_Argv( 3 ) );
CNSTI4 3
ARGI4
ADDRLP4 1176
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1180
INDIRI4
ASGNI4
line 551
;551:	awardValues[AWARD_IMPRESSIVE] = atoi( UI_Argv( 4 ) );
CNSTI4 4
ARGI4
ADDRLP4 1184
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 1188
INDIRI4
ASGNI4
line 552
;552:	awardValues[AWARD_EXCELLENT] = atoi( UI_Argv( 5 ) );
CNSTI4 5
ARGI4
ADDRLP4 1192
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 1196
INDIRI4
ASGNI4
line 553
;553:	awardValues[AWARD_GAUNTLET] = atoi( UI_Argv( 6 ) );
CNSTI4 6
ARGI4
ADDRLP4 1200
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 1204
INDIRI4
ASGNI4
line 554
;554:	awardValues[AWARD_FRAGS] = atoi( UI_Argv( 7 ) );
CNSTI4 7
ARGI4
ADDRLP4 1208
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 1212
INDIRI4
ASGNI4
line 555
;555:	awardValues[AWARD_PERFECT] = atoi( UI_Argv( 8 ) );
CNSTI4 8
ARGI4
ADDRLP4 1216
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+20
ADDRLP4 1220
INDIRI4
ASGNI4
line 557
;556:
;557:	postgameMenuInfo.numAwards = 0;
ADDRGP4 postgameMenuInfo+1000
CNSTI4 0
ASGNI4
line 559
;558:
;559:	if( awardValues[AWARD_ACCURACY] >= 50 ) {
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $390
line 560
;560:		UI_LogAwardData( AWARD_ACCURACY, 1 );
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 561
;561:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_ACCURACY;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
CNSTI4 0
ASGNI4
line 562
;562:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_ACCURACY];
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 563
;563:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 564
;564:	}
LABELV $390
line 566
;565:
;566:	if( awardValues[AWARD_IMPRESSIVE] ) {
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $397
line 567
;567:		UI_LogAwardData( AWARD_IMPRESSIVE, awardValues[AWARD_IMPRESSIVE] );
CNSTI4 1
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 568
;568:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_IMPRESSIVE;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
CNSTI4 1
ASGNI4
line 569
;569:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_IMPRESSIVE];
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 570
;570:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 571
;571:	}
LABELV $397
line 573
;572:
;573:	if( awardValues[AWARD_EXCELLENT] ) {
ADDRLP4 4+8
INDIRI4
CNSTI4 0
EQI4 $407
line 574
;574:		UI_LogAwardData( AWARD_EXCELLENT, awardValues[AWARD_EXCELLENT] );
CNSTI4 2
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 575
;575:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_EXCELLENT;
ADDRLP4 1224
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+1000
INDIRI4
ADDRLP4 1224
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 576
;576:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_EXCELLENT];
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
ADDRLP4 4+8
INDIRI4
ASGNI4
line 577
;577:		postgameMenuInfo.numAwards++;
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 578
;578:	}
LABELV $407
line 580
;579:
;580:	if( awardValues[AWARD_GAUNTLET] ) {
ADDRLP4 4+12
INDIRI4
CNSTI4 0
EQI4 $417
line 581
;581:		UI_LogAwardData( AWARD_GAUNTLET, awardValues[AWARD_GAUNTLET] );
CNSTI4 3
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 582
;582:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_GAUNTLET;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
CNSTI4 3
ASGNI4
line 583
;583:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_GAUNTLET];
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
ADDRLP4 4+12
INDIRI4
ASGNI4
line 584
;584:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 585
;585:	}
LABELV $417
line 587
;586:
;587:	oldFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1224
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1132
ADDRLP4 1224
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 588
;588:	UI_LogAwardData( AWARD_FRAGS, awardValues[AWARD_FRAGS] );
CNSTI4 4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 589
;589:	newFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1228
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 1228
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 590
;590:	if( newFrags > oldFrags ) {
ADDRLP4 1128
INDIRI4
ADDRLP4 1132
INDIRI4
LEI4 $428
line 591
;591:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_FRAGS;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
CNSTI4 4
ASGNI4
line 592
;592:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = newFrags * 100;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
CNSTI4 100
ADDRLP4 1128
INDIRI4
MULI4
ASGNI4
line 593
;593:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 594
;594:	}
LABELV $428
line 596
;595:
;596:	if( awardValues[AWARD_PERFECT] ) {
ADDRLP4 4+20
INDIRI4
CNSTI4 0
EQI4 $435
line 597
;597:		UI_LogAwardData( AWARD_PERFECT, 1 );
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 598
;598:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_PERFECT;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1004
ADDP4
CNSTI4 5
ASGNI4
line 599
;599:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = 1;
ADDRGP4 postgameMenuInfo+1000
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1028
ADDP4
CNSTI4 1
ASGNI4
line 600
;600:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+1000
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 601
;601:	}
LABELV $435
line 603
;602:
;603:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $443
line 604
;604:		postgameMenuInfo.won = UI_TierCompleted( postgameMenuInfo.level );
ADDRGP4 postgameMenuInfo+988
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 UI_TierCompleted
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+996
ADDRLP4 1232
INDIRI4
ASGNI4
line 605
;605:	}
ADDRGP4 $444
JUMPV
LABELV $443
line 606
;606:	else {
line 607
;607:		postgameMenuInfo.won = -1;
ADDRGP4 postgameMenuInfo+996
CNSTI4 -1
ASGNI4
line 608
;608:	}
LABELV $444
line 610
;609:
;610:	postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+688
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 611
;611:	postgameMenuInfo.scoreboardtime = uis.realtime;
ADDRGP4 postgameMenuInfo+692
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 613
;612:
;613:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 614
;614:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 616
;615:
;616:	UI_SPPostgameMenu_Init();
ADDRGP4 UI_SPPostgameMenu_Init
CALLV
pop
line 617
;617:	UI_PushMenu( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 619
;618:
;619:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $453
line 620
;620:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+504
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 621
;621:	}
ADDRGP4 $454
JUMPV
LABELV $453
line 622
;622:	else {
line 623
;623:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+416
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 624
;624:	}
LABELV $454
line 626
;625:
;626:	Prepname( 0 );
CNSTI4 0
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 627
;627:	Prepname( 1 );
CNSTI4 1
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 628
;628:	Prepname( 2 );
CNSTI4 2
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 630
;629:
;630:	if ( playerGameRank != 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $457
line 631
;631:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", postgameMenuInfo.placeNames[0] ), qfalse );
ADDRGP4 $460
ARGP4
ADDRGP4 postgameMenuInfo+796
ARGP4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1080
ADDRLP4 1236
INDIRI4
ASGNI4
line 632
;632:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/loss\n" );
CNSTI4 2
ARGI4
ADDRGP4 $462
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 633
;633:	}
ADDRGP4 $458
JUMPV
LABELV $457
line 634
;634:	else {
line 635
;635:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $284
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1232
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1080
ADDRLP4 1232
INDIRI4
ASGNI4
line 636
;636:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/win\n" );
CNSTI4 2
ARGI4
ADDRGP4 $464
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 637
;637:	}
LABELV $458
line 639
;638:
;639:	postgameMenuInfo.phase = 1;
ADDRGP4 postgameMenuInfo+680
CNSTI4 1
ASGNI4
line 641
;640:
;641:	postgameMenuInfo.lastTier = UI_GetNumSPTiers();
ADDRLP4 1232
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1076
ADDRLP4 1232
INDIRI4
ASGNI4
line 642
;642:	if ( UI_GetSpecialArenaInfo( "final" ) ) {
ADDRGP4 $469
ARGP4
ADDRLP4 1236
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
line 643
;643:		postgameMenuInfo.lastTier++;
ADDRLP4 1240
ADDRGP4 postgameMenuInfo+1076
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 644
;644:	}
LABELV $467
line 645
;645:	trap_Cvar_Set( "cl_postgame", "1" );
ADDRGP4 $471
ARGP4
ADDRGP4 $472
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 646
;646:}
LABELV $359
endproc UI_SPPostgameMenu_f 1244 12
bss
align 1
LABELV arenainfo
skip 1024
align 4
LABELV postgameMenuInfo
skip 1084
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
LABELV $472
byte 1 49
byte 1 0
align 1
LABELV $471
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $469
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $464
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $462
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $460
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $365
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $361
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $283
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $282
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $275
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
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $274
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
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $273
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
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $272
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
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $271
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
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $270
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
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $269
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $261
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $250
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $249
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $247
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
LABELV $246
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $237
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $188
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $185
byte 1 35
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $184
byte 1 110
byte 1 0
align 1
LABELV $182
byte 1 40
byte 1 116
byte 1 105
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $157
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $131
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $122
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
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $121
byte 1 0
align 1
LABELV $120
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $101
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
align 1
LABELV $97
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $96
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $94
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $92
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $90
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
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
LABELV $87
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
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
LABELV $86
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $85
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $84
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $83
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
LABELV $82
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
LABELV $81
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
LABELV $80
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
