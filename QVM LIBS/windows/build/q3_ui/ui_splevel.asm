code
proc PlayerIcon 80 20
file "../../../code/q3_ui/ui_splevel.c"
line 128
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
;26:SINGLE PLAYER LEVEL SELECT MENU
;27:
;28:=============================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:
;34:#define ART_LEVELFRAME_FOCUS		"menu/art_blueish/maps_select"
;35:#define ART_LEVELFRAME_SELECTED		"menu/art_blueish/maps_selected"
;36:#define ART_ARROW			"menu/art_blueish/narrow_0"
;37:#define ART_ARROW_FOCUS			"menu/art_blueish/narrow_1"
;38:#define ART_MAP_UNKNOWN			"menu/art/unknownmap"
;39:#define ART_MAP_COMPLETE1		"menu/art/level_complete1"
;40:#define ART_MAP_COMPLETE2		"menu/art/level_complete2"
;41:#define ART_MAP_COMPLETE3		"menu/art/level_complete3"
;42:#define ART_MAP_COMPLETE4		"menu/art/level_complete4"
;43:#define ART_MAP_COMPLETE5		"menu/art/level_complete5"
;44:#define ART_BACK0			"menu/art_blueish/back_0"
;45:#define ART_BACK1			"menu/art_blueish/back_1"
;46:#define ART_FIGHT0			"menu/art_blueish/fight_0"
;47:#define ART_FIGHT1			"menu/art_blueish/fight_1"
;48:#define ART_RESET0			"menu/art_blueish/reset_0"
;49:#define ART_RESET1			"menu/art_blueish/reset_1"
;50:#define ART_CUSTOM0			"menu/art_blueish/skirmish_0"
;51:#define ART_CUSTOM1			"menu/art_blueish/skirmish_1"
;52:
;53:#define ID_LEFTARROW		10
;54:#define ID_PICTURE0			11
;55:#define ID_PICTURE1			12
;56:#define ID_PICTURE2			13
;57:#define ID_PICTURE3			14
;58:#define ID_RIGHTARROW		15
;59:#define ID_PLAYERPIC		16
;60:#define ID_AWARD1			17
;61:#define ID_AWARD2			18
;62:#define ID_AWARD3			19
;63:#define ID_AWARD4			20
;64:#define ID_AWARD5			21
;65:#define ID_AWARD6			22
;66:#define ID_BACK				23
;67:#define ID_RESET			24
;68:#define ID_CUSTOM			25
;69:#define ID_NEXT				26
;70:
;71:#define PLAYER_Y			314
;72:#define AWARDS_Y			(PLAYER_Y + 26)
;73:
;74:
;75:typedef struct {
;76:	menuframework_s	menu;
;77:	menutext_s		item_banner;
;78:	menubitmap_s	item_leftarrow;
;79:	menubitmap_s	item_maps[4];
;80:	menubitmap_s	item_rightarrow;
;81:	menubitmap_s	item_player;
;82:	menubitmap_s	item_awards[6];
;83:	menubitmap_s	item_back;
;84:	menubitmap_s	item_reset;
;85:	menubitmap_s	item_custom;
;86:	menubitmap_s	item_next;
;87:	menubitmap_s	item_null;
;88:
;89:	qboolean		reinit;
;90:
;91:	const char *	selectedArenaInfo;
;92:	int				numMaps;
;93:	char			levelPicNames[4][MAX_QPATH];
;94:	char			levelNames[4][16];
;95:	int				levelScores[4];
;96:	int				levelScoresSkill[4];
;97:	qhandle_t		levelSelectedPic;
;98:	qhandle_t		levelFocusPic;
;99:	qhandle_t		levelCompletePic[5];
;100:
;101:	char			playerModel[MAX_QPATH];
;102:	char			playerPicName[MAX_QPATH];
;103:	int				awardLevels[6];
;104:	sfxHandle_t		awardSounds[6];
;105:
;106:	int				numBots;
;107:	qhandle_t		botPics[7];
;108:	char			botNames[7][10];
;109:} levelMenuInfo_t;
;110:
;111:static levelMenuInfo_t	levelMenuInfo;
;112:
;113:static int	selectedArenaSet;
;114:static int	selectedArena;
;115:static int	currentSet;
;116:static int	currentGame;
;117:static int	trainingTier;
;118:static int	finalTier;
;119:static int	minTier;
;120:static int	maxTier;
;121:
;122:
;123:/*
;124:=================
;125:PlayerIcon
;126:=================
;127:*/
;128:static void PlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 132
;129:	char	*skin;
;130:	char	model[MAX_QPATH];
;131:
;132:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 133
;133:	skin = strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 134
;134:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 135
;135:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 136
;136:	}
ADDRGP4 $82
JUMPV
LABELV $81
line 137
;137:	else {
line 138
;138:		skin = "default";
ADDRLP4 0
ADDRGP4 $83
ASGNP4
line 139
;139:	}
LABELV $82
line 141
;140:
;141:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $84
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 143
;142:
;143:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $85
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $83
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $85
line 144
;144:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 145
;145:	}
LABELV $85
line 146
;146:}
LABELV $80
endproc PlayerIcon 80 20
proc PlayerIconHandle 68 12
line 154
;147:
;148:
;149:/*
;150:=================
;151:PlayerIconhandle
;152:=================
;153:*/
;154:static qhandle_t PlayerIconHandle( const char *modelAndSkin ) {
line 157
;155:	char	iconName[MAX_QPATH];
;156:
;157:	PlayerIcon( modelAndSkin, iconName, sizeof(iconName) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 158
;158:	return trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $88
endproc PlayerIconHandle 68 12
proc UI_SPLevelMenu_SetBots 1068 12
line 167
;159:}
;160:
;161:
;162:/*
;163:=================
;164:UI_SPLevelMenu_SetBots
;165:=================
;166:*/
;167:static void UI_SPLevelMenu_SetBots( void ) {
line 173
;168:	char	*p;
;169:	char	*bot;
;170:	char	*botInfo;
;171:	char	bots[MAX_INFO_STRING];
;172:
;173:	levelMenuInfo.numBots = 0;
ADDRGP4 levelMenuInfo+2640
CNSTI4 0
ASGNI4
line 174
;174:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $91
line 175
;175:		return;
ADDRGP4 $89
JUMPV
LABELV $91
line 178
;176:	}
;177:
;178:	Q_strncpyz( bots, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "bots" ), sizeof(bots) );
ADDRGP4 levelMenuInfo+2076
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 180
;179:
;180:	p = &bots[0];
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $96
JUMPV
line 181
;181:	while( *p && levelMenuInfo.numBots < 7 ) {
LABELV $99
line 183
;182:		//skip spaces
;183:		while( *p && *p == ' ' ) {
line 184
;184:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 185
;185:		}
LABELV $100
line 183
ADDRLP4 1040
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 1040
INDIRI4
CNSTI4 32
EQI4 $99
LABELV $102
line 186
;186:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
line 187
;187:			break;
ADDRGP4 $97
JUMPV
LABELV $103
line 191
;188:		}
;189:
;190:		// mark start of bot name
;191:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $106
JUMPV
LABELV $105
line 194
;192:
;193:		// skip until space of null
;194:		while( *p && *p != ' ' ) {
line 195
;195:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 196
;196:		}
LABELV $106
line 194
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $108
ADDRLP4 1044
INDIRI4
CNSTI4 32
NEI4 $105
LABELV $108
line 197
;197:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $109
line 198
;198:			*p++ = 0;
ADDRLP4 1048
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI1 0
ASGNI1
line 199
;199:		}
LABELV $109
line 201
;200:
;201:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 202
;202:                if( !botInfo )	{
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 203
;203:                     botInfo = UI_GetBotInfoByNumber( levelMenuInfo.numBots );
ADDRGP4 levelMenuInfo+2640
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1052
INDIRP4
ASGNP4
line 204
;204:                }
LABELV $111
line 205
;205:		if( botInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $114
line 206
;206:			levelMenuInfo.botPics[levelMenuInfo.numBots] = PlayerIconHandle( Info_ValueForKey( botInfo, "model" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 PlayerIconHandle
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2640
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2644
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 207
;207:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], Info_ValueForKey( botInfo, "name" ), 10 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
CNSTI4 10
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRGP4 levelMenuInfo+2640
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2672
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 208
;208:		}
ADDRGP4 $115
JUMPV
LABELV $114
line 209
;209:		else {
line 210
;210:			levelMenuInfo.botPics[levelMenuInfo.numBots] = 0;
ADDRGP4 levelMenuInfo+2640
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2644
ADDP4
CNSTI4 0
ASGNI4
line 211
;211:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], bot, 10 );
ADDRLP4 1052
CNSTI4 10
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 levelMenuInfo+2640
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2672
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 212
;212:		}
LABELV $115
line 213
;213:		Q_CleanStr( levelMenuInfo.botNames[levelMenuInfo.numBots] );
CNSTI4 10
ADDRGP4 levelMenuInfo+2640
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2672
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 214
;214:		levelMenuInfo.numBots++;
ADDRLP4 1052
ADDRGP4 levelMenuInfo+2640
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 215
;215:	}
LABELV $96
line 181
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $129
ADDRGP4 levelMenuInfo+2640
INDIRI4
CNSTI4 7
LTI4 $100
LABELV $129
LABELV $97
line 216
;216:}
LABELV $89
endproc UI_SPLevelMenu_SetBots 1068 12
proc UI_SPLevelMenu_SetMenuArena 84 12
line 224
;217:
;218:
;219:/*
;220:=================
;221:UI_SPLevelMenu_SetMenuItems
;222:=================
;223:*/
;224:static void UI_SPLevelMenu_SetMenuArena( int n, int level, const char *arenaInfo ) {
line 227
;225:	char		map[MAX_QPATH];
;226:
;227:	Q_strncpyz( map, Info_ValueForKey( arenaInfo, "map" ), sizeof(map) );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 229
;228:
;229:	Q_strncpyz( levelMenuInfo.levelNames[n], map, sizeof(levelMenuInfo.levelNames[n]) );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2340
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 230
;230:	Q_strupr( levelMenuInfo.levelNames[n] );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2340
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 232
;231:
;232:	UI_GetBestScore( level, &levelMenuInfo.levelScores[n], &levelMenuInfo.levelScoresSkill[n] );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2404
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2420
ADDP4
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 233
;233:	if( levelMenuInfo.levelScores[n] > 8 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2404
ADDP4
INDIRI4
CNSTI4 8
LEI4 $137
line 234
;234:		levelMenuInfo.levelScores[n] = 8;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2404
ADDP4
CNSTI4 8
ASGNI4
line 235
;235:	}
LABELV $137
line 237
;236:
;237:	strcpy( levelMenuInfo.levelPicNames[n], va( "levelshots/%s.tga", map ) );
ADDRGP4 $142
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2084
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 238
;238:	if( !trap_R_RegisterShaderNoMip( levelMenuInfo.levelPicNames[n] ) ) {
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2084
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $143
line 239
;239:		strcpy( levelMenuInfo.levelPicNames[n], ART_MAP_UNKNOWN );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2084
ADDP4
ARGP4
ADDRGP4 $147
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 240
;240:	}
LABELV $143
line 241
;241:	levelMenuInfo.item_maps[n].shader = 0;
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+68
ADDP4
CNSTI4 0
ASGNI4
line 242
;242:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $150
line 243
;243:		levelMenuInfo.item_maps[n].generic.flags |= QMF_GRAYED;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 244
;244:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 245
;245:	else {
line 246
;246:		levelMenuInfo.item_maps[n].generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 247
;247:	}
LABELV $151
line 249
;248:
;249:	levelMenuInfo.item_maps[n].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 250
;250:}
LABELV $130
endproc UI_SPLevelMenu_SetMenuArena 84 12
proc UI_SPLevelMenu_SetMenuItems 44 12
line 252
;251:
;252:static void UI_SPLevelMenu_SetMenuItems( void ) {
line 257
;253:	int			n;
;254:	int			level;
;255:	const char	*arenaInfo;
;256:
;257:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $159
line 258
;258:		selectedArena = -1;
ADDRGP4 selectedArena
CNSTI4 -1
ASGNI4
line 259
;259:	}
ADDRGP4 $160
JUMPV
LABELV $159
line 260
;260:	else if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $161
line 261
;261:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 262
;262:	}
LABELV $161
LABELV $160
line 264
;263:
;264:	if( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 12
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $165
ADDRLP4 12
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $163
LABELV $165
line 265
;265:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 266
;266:	}
LABELV $163
line 268
;267:
;268:	if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $166
line 269
;269:		trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $168
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 270
;270:	}
LABELV $166
line 272
;271:
;272:	if( selectedArenaSet == trainingTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 trainingTier
INDIRI4
NEI4 $169
line 273
;273:		arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $171
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 274
;274:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 275
;275:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 276
;276:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2076
ADDRLP4 8
INDIRP4
ASGNP4
line 278
;277:
;278:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+576+12
CNSTI4 256
ASGNI4
line 279
;279:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+576
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 280
;280:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+576+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 281
;281:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2080
CNSTI4 1
ASGNI4
line 283
;282:
;283:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+576+88+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 284
;284:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+576+176+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 285
;285:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+576+264+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 286
;286:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2084+64
CNSTI1 0
ASGNI1
line 287
;287:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2084+128
CNSTI1 0
ASGNI1
line 288
;288:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2084+192
CNSTI1 0
ASGNI1
line 289
;289:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+576+88+68
CNSTI4 0
ASGNI4
line 290
;290:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+576+176+68
CNSTI4 0
ASGNI4
line 291
;291:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+576+264+68
CNSTI4 0
ASGNI4
line 292
;292:	}
ADDRGP4 $170
JUMPV
LABELV $169
line 293
;293:	else if( selectedArenaSet == finalTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $204
line 294
;294:		arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $206
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 295
;295:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 296
;296:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 297
;297:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2076
ADDRLP4 8
INDIRP4
ASGNP4
line 299
;298:
;299:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+576+12
CNSTI4 256
ASGNI4
line 300
;300:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+576
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 301
;301:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+576+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 302
;302:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2080
CNSTI4 1
ASGNI4
line 304
;303:
;304:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+576+88+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 305
;305:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+576+176+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 306
;306:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+576+264+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 307
;307:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2084+64
CNSTI1 0
ASGNI1
line 308
;308:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2084+128
CNSTI1 0
ASGNI1
line 309
;309:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2084+192
CNSTI1 0
ASGNI1
line 310
;310:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+576+88+68
CNSTI4 0
ASGNI4
line 311
;311:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+576+176+68
CNSTI4 0
ASGNI4
line 312
;312:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+576+264+68
CNSTI4 0
ASGNI4
line 313
;313:	}
ADDRGP4 $205
JUMPV
LABELV $204
line 314
;314:	else {
line 315
;315:		levelMenuInfo.item_maps[0].generic.x = 46;
ADDRGP4 levelMenuInfo+576+12
CNSTI4 46
ASGNI4
line 316
;316:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+576
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 317
;317:		levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 16
ADDRGP4 levelMenuInfo+576+32
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 318
;318:		levelMenuInfo.numMaps = 4;
ADDRGP4 levelMenuInfo+2080
CNSTI4 4
ASGNI4
line 320
;319:
;320:		for ( n = 0; n < 4; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $244
line 321
;321:			level = selectedArenaSet * ARENAS_PER_TIER + n;
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 322
;322:			arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 323
;323:			UI_SPLevelMenu_SetMenuArena( n, level, arenaInfo );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 324
;324:		}
LABELV $245
line 320
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $244
line 326
;325:
;326:		if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $248
line 327
;327:			levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2076
ADDRLP4 20
INDIRP4
ASGNP4
line 328
;328:		}
LABELV $248
line 329
;329:	}
LABELV $205
LABELV $170
line 332
;330:
;331:	// enable/disable arrows when they are valid/invalid
;332:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $251
line 333
;333:		levelMenuInfo.item_leftarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+488+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 334
;334:	}
ADDRGP4 $252
JUMPV
LABELV $251
line 335
;335:	else {
line 336
;336:		levelMenuInfo.item_leftarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+488+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 337
;337:	}
LABELV $252
line 339
;338:
;339:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $257
line 340
;340:		levelMenuInfo.item_rightarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+928+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 341
;341:	}
ADDRGP4 $258
JUMPV
LABELV $257
line 342
;342:	else {
line 343
;343:		levelMenuInfo.item_rightarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+928+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 344
;344:	}
LABELV $258
line 346
;345:
;346:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 347
;347:}
LABELV $158
endproc UI_SPLevelMenu_SetMenuItems 44 12
proc UI_SPLevelMenu_ResetDraw 0 20
line 355
;348:
;349:
;350:/*
;351:=================
;352:UI_SPLevelMenu_ResetEvent
;353:=================
;354:*/
;355:static void UI_SPLevelMenu_ResetDraw( void ) {
line 356
;356:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $264
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 357
;357:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $265
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 358
;358:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 410
ARGI4
ADDRGP4 $266
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 359
;359:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 437
ARGI4
ADDRGP4 $267
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 360
;360:}
LABELV $263
endproc UI_SPLevelMenu_ResetDraw 0 20
proc UI_SPLevelMenu_ResetAction 0 8
line 362
;361:
;362:static void UI_SPLevelMenu_ResetAction( qboolean result ) {
line 363
;363:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $269
line 364
;364:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 368
;365:	}
;366:
;367:	// clear game variables
;368:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 369
;369:	trap_Cvar_SetValue( "ui_spSelection", -4 );
ADDRGP4 $168
ARGP4
CNSTF4 3229614080
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 372
;370:
;371:	// make the level select menu re-initialize
;372:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 373
;373:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 374
;374:}
LABELV $268
endproc UI_SPLevelMenu_ResetAction 0 8
proc UI_SPLevelMenu_ResetEvent 0 12
line 377
;375:
;376:static void UI_SPLevelMenu_ResetEvent( void* ptr, int event )
;377:{
line 378
;378:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $272
line 379
;379:		return;
ADDRGP4 $271
JUMPV
LABELV $272
line 382
;380:	}
;381:
;382:	UI_ConfirmMenu( "RESET GAME?", UI_SPLevelMenu_ResetDraw, UI_SPLevelMenu_ResetAction );
ADDRGP4 $274
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetDraw
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 383
;383:}
LABELV $271
endproc UI_SPLevelMenu_ResetEvent 0 12
proc UI_SPLevelMenu_LevelEvent 8 8
line 391
;384:
;385:
;386:/*
;387:=================
;388:UI_SPLevelMenu_LevelEvent
;389:=================
;390:*/
;391:static void UI_SPLevelMenu_LevelEvent( void* ptr, int notification ) {
line 392
;392:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $276
line 393
;393:		return;
ADDRGP4 $275
JUMPV
LABELV $276
line 396
;394:	}
;395:
;396:	if ( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 0
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $280
ADDRLP4 0
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $278
LABELV $280
line 397
;397:		return;
ADDRGP4 $275
JUMPV
LABELV $278
line 400
;398:	}
;399:
;400:	selectedArena = ((menucommon_s*)ptr)->id - ID_PICTURE0;
ADDRGP4 selectedArena
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 401
;401:	levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2076
ADDRLP4 4
INDIRP4
ASGNP4
line 402
;402:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 404
;403:
;404:	trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $168
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 405
;405:}
LABELV $275
endproc UI_SPLevelMenu_LevelEvent 8 8
proc UI_SPLevelMenu_LeftArrowEvent 4 0
line 413
;406:
;407:
;408:/*
;409:=================
;410:UI_SPLevelMenu_LeftArrowEvent
;411:=================
;412:*/
;413:static void UI_SPLevelMenu_LeftArrowEvent( void* ptr, int notification ) {
line 414
;414:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $283
line 415
;415:		return;
ADDRGP4 $282
JUMPV
LABELV $283
line 418
;416:	}
;417:
;418:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $285
line 419
;419:		return;
ADDRGP4 $282
JUMPV
LABELV $285
line 422
;420:	}
;421:
;422:	selectedArenaSet--;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 423
;423:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 424
;424:}
LABELV $282
endproc UI_SPLevelMenu_LeftArrowEvent 4 0
proc UI_SPLevelMenu_RightArrowEvent 4 0
line 432
;425:
;426:
;427:/*
;428:=================
;429:UI_SPLevelMenu_RightArrowEvent
;430:=================
;431:*/
;432:static void UI_SPLevelMenu_RightArrowEvent( void* ptr, int notification ) {
line 433
;433:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $288
line 434
;434:		return;
ADDRGP4 $287
JUMPV
LABELV $288
line 437
;435:	}
;436:
;437:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $290
line 438
;438:		return;
ADDRGP4 $287
JUMPV
LABELV $290
line 441
;439:	}
;440:
;441:	selectedArenaSet++;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 442
;442:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 443
;443:}
LABELV $287
endproc UI_SPLevelMenu_RightArrowEvent 4 0
proc UI_SPLevelMenu_PlayerEvent 0 0
line 451
;444:
;445:
;446:/*
;447:=================
;448:UI_SPLevelMenu_PlayerEvent
;449:=================
;450:*/
;451:static void UI_SPLevelMenu_PlayerEvent( void* ptr, int notification ) {
line 452
;452:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $293
line 453
;453:		return;
ADDRGP4 $292
JUMPV
LABELV $293
line 456
;454:	}
;455:
;456:	UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 457
;457:}
LABELV $292
endproc UI_SPLevelMenu_PlayerEvent 0 0
proc UI_SPLevelMenu_AwardEvent 4 8
line 465
;458:
;459:
;460:/*
;461:=================
;462:UI_SPLevelMenu_AwardEvent
;463:=================
;464:*/
;465:static void UI_SPLevelMenu_AwardEvent( void* ptr, int notification ) {
line 468
;466:	int		n;
;467:
;468:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $296
line 469
;469:		return;
ADDRGP4 $295
JUMPV
LABELV $296
line 472
;470:	}
;471:
;472:	n = ((menucommon_s*)ptr)->id - ID_AWARD1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 17
SUBI4
ASGNI4
line 473
;473:	trap_S_StartLocalSound( levelMenuInfo.awardSounds[n], CHAN_ANNOUNCER );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2616
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 474
;474:}
LABELV $295
endproc UI_SPLevelMenu_AwardEvent 4 8
proc UI_SPLevelMenu_NextEvent 0 4
line 482
;475:
;476:
;477:/*
;478:=================
;479:UI_SPLevelMenu_NextEvent
;480:=================
;481:*/
;482:static void UI_SPLevelMenu_NextEvent( void* ptr, int notification ) {
line 483
;483:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $300
line 484
;484:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 487
;485:	}
;486:
;487:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $302
line 488
;488:		return;
ADDRGP4 $299
JUMPV
LABELV $302
line 491
;489:	}
;490:
;491:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $304
line 492
;492:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 493
;493:	}
LABELV $304
line 495
;494:
;495:	UI_SPSkillMenu( levelMenuInfo.selectedArenaInfo );
ADDRGP4 levelMenuInfo+2076
INDIRP4
ARGP4
ADDRGP4 UI_SPSkillMenu
CALLV
pop
line 496
;496:}
LABELV $299
endproc UI_SPLevelMenu_NextEvent 0 4
proc UI_SPLevelMenu_BackEvent 0 0
line 504
;497:
;498:
;499:/*
;500:=================
;501:UI_SPLevelMenu_BackEvent
;502:=================
;503:*/
;504:static void UI_SPLevelMenu_BackEvent( void* ptr, int notification ) {
line 505
;505:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $308
line 506
;506:		return;
ADDRGP4 $307
JUMPV
LABELV $308
line 509
;507:	}
;508:
;509:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $310
line 510
;510:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 511
;511:	}
LABELV $310
line 513
;512:
;513:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 514
;514:}
LABELV $307
endproc UI_SPLevelMenu_BackEvent 0 0
proc UI_SPLevelMenu_CustomEvent 0 4
line 522
;515:
;516:
;517:/*
;518:=================
;519:UI_SPLevelMenu_CustomEvent
;520:=================
;521:*/
;522:static void UI_SPLevelMenu_CustomEvent( void* ptr, int notification ) {
line 523
;523:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $313
line 524
;524:		return;
ADDRGP4 $312
JUMPV
LABELV $313
line 527
;525:	}
;526:
;527:	UI_StartServerMenu( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 528
;528:}
LABELV $312
endproc UI_SPLevelMenu_CustomEvent 0 4
proc UI_SPLevelMenu_MenuDraw 1152 20
line 538
;529:
;530:
;531:/*
;532:=================
;533:UI_SPLevelMenu_MenuDraw
;534:=================
;535:*/
;536:#define LEVEL_DESC_LEFT_MARGIN		332
;537:
;538:static void UI_SPLevelMenu_MenuDraw( void ) {
line 548
;539:	int				n, i;
;540:	int				x, y;
;541:	vec4_t			color;
;542:	int				level;
;543://	int				fraglimit;
;544:	int				pad;
;545:	char			buf[MAX_INFO_VALUE];
;546:	char			string[64];
;547:
;548:	if(	levelMenuInfo.reinit ) {
ADDRGP4 levelMenuInfo+2072
INDIRI4
CNSTI4 0
EQI4 $316
line 549
;549:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 550
;550:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 551
;551:		return;
ADDRGP4 $315
JUMPV
LABELV $316
line 555
;552:	}
;553:
;554:	// draw player name
;555:	trap_Cvar_VariableStringBuffer( "name", string, 32 );
ADDRGP4 $121
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 556
;556:	Q_CleanStr( string );
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 557
;557:	UI_DrawProportionalString( 320, PLAYER_Y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 314
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 560
;558:
;559:	// check for model changes
;560:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof(buf) );
ADDRGP4 $118
ARGP4
ADDRLP4 104
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 561
;561:	if( Q_stricmp( buf, levelMenuInfo.playerModel ) != 0 ) {
ADDRLP4 104
ARGP4
ADDRGP4 levelMenuInfo+2464
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $319
line 562
;562:		Q_strncpyz( levelMenuInfo.playerModel, buf, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 levelMenuInfo+2464
ARGP4
ADDRLP4 104
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 563
;563:		PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2464
ARGP4
ADDRGP4 levelMenuInfo+2528
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 564
;564:		levelMenuInfo.item_player.shader = 0;
ADDRGP4 levelMenuInfo+1016+68
CNSTI4 0
ASGNI4
line 565
;565:	}
LABELV $319
line 568
;566:
;567:	// standard menu drawing
;568:	Menu_Draw( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 571
;569:
;570:	// draw player award levels
;571:	y = AWARDS_Y;
ADDRLP4 8
CNSTI4 340
ASGNI4
line 572
;572:	i = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 573
;573:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $329
line 574
;574:		level = levelMenuInfo.awardLevels[n];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
ASGNI4
line 575
;575:		if( level > 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $334
line 576
;576:			if( i & 1 ) {
ADDRLP4 80
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $336
line 577
;577:				x = 224 - (i - 1 ) / 2 * (48 + 16);
ADDRLP4 4
CNSTI4 224
ADDRLP4 80
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 578
;578:			}
ADDRGP4 $337
JUMPV
LABELV $336
line 579
;579:			else {
line 580
;580:				x = 368 + i / 2 * (48 + 16);
ADDRLP4 4
ADDRLP4 80
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 581
;581:			}
LABELV $337
line 582
;582:			i++;
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 584
;583:
;584:			if( level == 1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $338
line 585
;585:				continue;
ADDRGP4 $330
JUMPV
LABELV $338
line 588
;586:			}
;587:
;588:			if( level >= 1000000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000000
LTI4 $340
line 589
;589:				Com_sprintf( string, sizeof(string), "%im", level / 1000000 );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $342
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 590
;590:			}
ADDRGP4 $341
JUMPV
LABELV $340
line 591
;591:			else if( level >= 1000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000
LTI4 $343
line 592
;592:				Com_sprintf( string, sizeof(string), "%ik", level / 1000 );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $345
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 593
;593:			}
ADDRGP4 $344
JUMPV
LABELV $343
line 594
;594:			else {
line 595
;595:				Com_sprintf( string, sizeof(string), "%i", level );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $346
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 596
;596:			}
LABELV $344
LABELV $341
line 598
;597:
;598:			UI_DrawString( x + 24, y + 48, string, UI_CENTER, color_yellow );
ADDRLP4 4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 48
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
line 599
;599:		}
LABELV $334
line 600
;600:	}
LABELV $330
line 573
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $329
line 602
;601:
;602:	UI_DrawProportionalString( 18, 38, va( "Tier %i", selectedArenaSet + 1 ), UI_LEFT|UI_SMALLFONT, color_orange );
ADDRGP4 $347
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 18
ARGI4
CNSTI4 38
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 604
;603:
;604:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $348
line 605
;605:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+12
ADDP4
INDIRI4
ASGNI4
line 606
;606:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+16
ADDP4
INDIRI4
ASGNI4
line 607
;607:		UI_FillRect( x, y + 96, 128, 18, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 608
;608:	}
LABELV $349
line 604
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2080
INDIRI4
LTI4 $348
line 610
;609:
;610:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $357
line 611
;611:		UI_DrawProportionalString( 320, 216, "ACCESS DENIED", UI_CENTER|UI_BIGFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 216
ARGI4
ADDRGP4 $359
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 612
;612:		return;
ADDRGP4 $315
JUMPV
LABELV $357
line 616
;613:	}
;614:
;615:	// show levelshots for levels of current tier
;616:	Vector4Copy( color_white, color );
ADDRLP4 88
ADDRGP4 color_white
INDIRF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 color_white+4
INDIRF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 color_white+8
INDIRF4
ASGNF4
ADDRLP4 88+12
ADDRGP4 color_white+12
INDIRF4
ASGNF4
line 617
;617:	color[3] = 0.5+0.5*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1136
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 88+12
CNSTF4 1056964608
ADDRLP4 1136
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 618
;618:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $368
line 619
;619:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+12
ADDP4
INDIRI4
ASGNI4
line 620
;620:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576+16
ADDP4
INDIRI4
ASGNI4
line 622
;621:
;622:		UI_DrawString( x + 64, y + 96, levelMenuInfo.levelNames[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2340
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 624
;623:
;624:		if( levelMenuInfo.levelScores[n] == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2404
ADDP4
INDIRI4
CNSTI4 1
NEI4 $378
line 625
;625:			UI_DrawHandlePic( x, y, 128, 96, levelMenuInfo.levelCompletePic[levelMenuInfo.levelScoresSkill[n] - 1] ); 
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1119879168
ARGF4
ADDRLP4 1140
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2420
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2444-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 626
;626:		}
LABELV $378
line 628
;627:
;628:		if ( n == selectedArena ) {
ADDRLP4 0
INDIRI4
ADDRGP4 selectedArena
INDIRI4
NEI4 $384
line 629
;629:			if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $386
line 630
;630:				trap_R_SetColor( color );
ADDRLP4 88
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 631
;631:			}
LABELV $386
line 632
;632:			UI_DrawHandlePic( x-1, y-1, 130, 130 - 14, levelMenuInfo.levelSelectedPic ); 
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1124204544
ARGF4
CNSTF4 1122500608
ARGF4
ADDRGP4 levelMenuInfo+2436
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 633
;633:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 634
;634:		}
ADDRGP4 $385
JUMPV
LABELV $384
line 635
;635:		else if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+576
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $390
line 636
;636:			trap_R_SetColor( color );
ADDRLP4 88
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 637
;637:			UI_DrawHandlePic( x-31, y-30, 256, 256-27, levelMenuInfo.levelFocusPic); 
ADDRLP4 4
INDIRI4
CNSTI4 31
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1130692608
ARGF4
ADDRGP4 levelMenuInfo+2440
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 638
;638:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 639
;639:		}
LABELV $390
LABELV $385
line 640
;640:	}
LABELV $369
line 618
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $371
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2080
INDIRI4
LTI4 $368
line 643
;641:
;642:	// show map name and long name of selected level
;643:	y = 192;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 644
;644:	Q_strncpyz( buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "map" ), 20 );
ADDRGP4 levelMenuInfo+2076
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 1140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 104
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 645
;645:	Q_strupr( buf );
ADDRLP4 104
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 646
;646:	Com_sprintf( string, sizeof(string), "%s: %s", buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "longname" ) );
ADDRGP4 levelMenuInfo+2076
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $395
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 647
;647:	UI_DrawProportionalString( 320, y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 653
;648:
;649://	fraglimit = atoi( Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "fraglimit" ) );
;650://	UI_DrawString( 18, 212, va("Frags %i", fraglimit) , UI_LEFT|UI_SMALLFONT, color_orange );
;651:
;652:	// draw bot opponents
;653:	y += 24;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 654
;654:	pad = (7 - levelMenuInfo.numBots) * (64 + 26) / 2;
ADDRLP4 84
CNSTI4 90
CNSTI4 7
ADDRGP4 levelMenuInfo+2640
INDIRI4
SUBI4
MULI4
CNSTI4 2
DIVI4
ASGNI4
line 655
;655:	for( n = 0; n < levelMenuInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $402
JUMPV
LABELV $399
line 656
;656:		x = 18 + pad + (64 + 26) * n;
ADDRLP4 4
ADDRLP4 84
INDIRI4
CNSTI4 18
ADDI4
CNSTI4 90
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 657
;657:		if( levelMenuInfo.botPics[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $404
line 658
;658:			UI_DrawHandlePic( x, y, 64, 64, levelMenuInfo.botPics[n]);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1148
CNSTF4 1115684864
ASGNF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2644
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 659
;659:		}
ADDRGP4 $405
JUMPV
LABELV $404
line 660
;660:		else {
line 661
;661:			UI_FillRect( x, y, 64, 64, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1148
CNSTF4 1115684864
ASGNF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 662
;662:			UI_DrawProportionalString( x+22, y+18, "?", UI_BIGFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 22
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRGP4 $408
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 663
;663:		}
LABELV $405
line 664
;664:		UI_DrawString( x, y + 64, levelMenuInfo.botNames[n], UI_SMALLFONT|UI_LEFT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ARGI4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2672
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 665
;665:	}
LABELV $400
line 655
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $402
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2640
INDIRI4
LTI4 $399
line 666
;666:}
LABELV $315
endproc UI_SPLevelMenu_MenuDraw 1152 20
export UI_SPLevelMenu_Cache
proc UI_SPLevelMenu_Cache 32 8
line 674
;667:
;668:
;669:/*
;670:=================
;671:UI_SPLevelMenu_Cache
;672:=================
;673:*/
;674:void UI_SPLevelMenu_Cache( void ) {
line 677
;675:	int				n;
;676:
;677:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $411
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 678
;678:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $412
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 679
;679:	trap_R_RegisterShaderNoMip( ART_ARROW );
ADDRGP4 $413
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 680
;680:	trap_R_RegisterShaderNoMip( ART_ARROW_FOCUS );
ADDRGP4 $414
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 681
;681:	trap_R_RegisterShaderNoMip( ART_MAP_UNKNOWN );
ADDRGP4 $147
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 682
;682:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $415
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 683
;683:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $416
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 684
;684:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $417
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 685
;685:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $418
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 686
;686:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $419
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 687
;687:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $420
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 688
;688:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $421
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 689
;689:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $422
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 690
;690:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $423
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 691
;691:	trap_R_RegisterShaderNoMip( ART_RESET0 );
ADDRGP4 $424
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 692
;692:	trap_R_RegisterShaderNoMip( ART_RESET1 );
ADDRGP4 $425
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 693
;693:	trap_R_RegisterShaderNoMip( ART_CUSTOM0 );
ADDRGP4 $426
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 694
;694:	trap_R_RegisterShaderNoMip( ART_CUSTOM1 );
ADDRGP4 $427
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 696
;695:
;696:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $428
line 697
;697:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
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
line 698
;698:		levelMenuInfo.awardSounds[n] = trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 levelMenuInfo+2616
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 699
;699:	}
LABELV $429
line 696
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $428
line 701
;700:
;701:	levelMenuInfo.levelSelectedPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $412
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2436
ADDRLP4 4
INDIRI4
ASGNI4
line 702
;702:	levelMenuInfo.levelFocusPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $411
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2440
ADDRLP4 8
INDIRI4
ASGNI4
line 703
;703:	levelMenuInfo.levelCompletePic[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $415
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2444
ADDRLP4 12
INDIRI4
ASGNI4
line 704
;704:	levelMenuInfo.levelCompletePic[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $416
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2444+4
ADDRLP4 16
INDIRI4
ASGNI4
line 705
;705:	levelMenuInfo.levelCompletePic[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $417
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2444+8
ADDRLP4 20
INDIRI4
ASGNI4
line 706
;706:	levelMenuInfo.levelCompletePic[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $418
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2444+12
ADDRLP4 24
INDIRI4
ASGNI4
line 707
;707:	levelMenuInfo.levelCompletePic[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $419
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2444+16
ADDRLP4 28
INDIRI4
ASGNI4
line 708
;708:}
LABELV $410
endproc UI_SPLevelMenu_Cache 32 8
proc UI_SPLevelMenu_Init 116 12
line 716
;709:
;710:
;711:/*
;712:=================
;713:UI_SPLevelMenu_Init
;714:=================
;715:*/
;716:static void UI_SPLevelMenu_Init( void ) {
line 723
;717:	int		skill;
;718:	int		n;
;719:	int		x, y;
;720:	int		count;
;721:	char	buf[MAX_QPATH];
;722:
;723:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $445
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 724
;724:	if( skill < 1 || skill > 5 ) {
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $448
ADDRLP4 16
INDIRI4
CNSTI4 5
LEI4 $446
LABELV $448
line 725
;725:		trap_Cvar_Set( "g_spSkill", "2" );
ADDRGP4 $445
ARGP4
ADDRGP4 $449
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 726
;726:		skill = 2;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 727
;727:	}
LABELV $446
line 729
;728:
;729:	memset( &levelMenuInfo, 0, sizeof(levelMenuInfo) );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2744
ARGI4
ADDRGP4 memset
CALLP4
pop
line 730
;730:	levelMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 levelMenuInfo+408
CNSTI4 1
ASGNI4
line 731
;731:	levelMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 levelMenuInfo+404
CNSTI4 1
ASGNI4
line 732
;732:	levelMenuInfo.menu.draw = UI_SPLevelMenu_MenuDraw;
ADDRGP4 levelMenuInfo+396
ADDRGP4 UI_SPLevelMenu_MenuDraw
ASGNP4
line 734
;733:
;734:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 736
;735:
;736:	levelMenuInfo.item_banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 levelMenuInfo+416
CNSTI4 10
ASGNI4
line 737
;737:	levelMenuInfo.item_banner.generic.x				= 320;
ADDRGP4 levelMenuInfo+416+12
CNSTI4 320
ASGNI4
line 738
;738:	levelMenuInfo.item_banner.generic.y				= 16;
ADDRGP4 levelMenuInfo+416+16
CNSTI4 16
ASGNI4
line 739
;739:	levelMenuInfo.item_banner.string				= "CHOOSE LEVEL";
ADDRGP4 levelMenuInfo+416+60
ADDRGP4 $460
ASGNP4
line 740
;740:	levelMenuInfo.item_banner.color					= color_red;
ADDRGP4 levelMenuInfo+416+68
ADDRGP4 color_red
ASGNP4
line 741
;741:	levelMenuInfo.item_banner.style					= UI_CENTER;
ADDRGP4 levelMenuInfo+416+64
CNSTI4 1
ASGNI4
line 743
;742:
;743:	levelMenuInfo.item_leftarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+488
CNSTI4 6
ASGNI4
line 744
;744:	levelMenuInfo.item_leftarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+488+4
ADDRGP4 $413
ASGNP4
line 745
;745:	levelMenuInfo.item_leftarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+488+44
CNSTU4 260
ASGNU4
line 746
;746:	levelMenuInfo.item_leftarrow.generic.x			= 18;
ADDRGP4 levelMenuInfo+488+12
CNSTI4 18
ASGNI4
line 747
;747:	levelMenuInfo.item_leftarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+488+16
CNSTI4 64
ASGNI4
line 748
;748:	levelMenuInfo.item_leftarrow.generic.callback	= UI_SPLevelMenu_LeftArrowEvent;
ADDRGP4 levelMenuInfo+488+48
ADDRGP4 UI_SPLevelMenu_LeftArrowEvent
ASGNP4
line 749
;749:	levelMenuInfo.item_leftarrow.generic.id			= ID_LEFTARROW;
ADDRGP4 levelMenuInfo+488+8
CNSTI4 10
ASGNI4
line 750
;750:	levelMenuInfo.item_leftarrow.width				= 16;
ADDRGP4 levelMenuInfo+488+76
CNSTI4 16
ASGNI4
line 751
;751:	levelMenuInfo.item_leftarrow.height				= 114;
ADDRGP4 levelMenuInfo+488+80
CNSTI4 114
ASGNI4
line 752
;752:	levelMenuInfo.item_leftarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+488+60
ADDRGP4 $414
ASGNP4
line 754
;753:
;754:	levelMenuInfo.item_maps[0].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+576
CNSTI4 6
ASGNI4
line 755
;755:	levelMenuInfo.item_maps[0].generic.name			= levelMenuInfo.levelPicNames[0];
ADDRGP4 levelMenuInfo+576+4
ADDRGP4 levelMenuInfo+2084
ASGNP4
line 756
;756:	levelMenuInfo.item_maps[0].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+576+44
CNSTU4 4
ASGNU4
line 757
;757:	levelMenuInfo.item_maps[0].generic.x			= 46;
ADDRGP4 levelMenuInfo+576+12
CNSTI4 46
ASGNI4
line 758
;758:	levelMenuInfo.item_maps[0].generic.y			= 64;
ADDRGP4 levelMenuInfo+576+16
CNSTI4 64
ASGNI4
line 759
;759:	levelMenuInfo.item_maps[0].generic.id			= ID_PICTURE0;
ADDRGP4 levelMenuInfo+576+8
CNSTI4 11
ASGNI4
line 760
;760:	levelMenuInfo.item_maps[0].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+576+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 761
;761:	levelMenuInfo.item_maps[0].width				= 128;
ADDRGP4 levelMenuInfo+576+76
CNSTI4 128
ASGNI4
line 762
;762:	levelMenuInfo.item_maps[0].height				= 96;
ADDRGP4 levelMenuInfo+576+80
CNSTI4 96
ASGNI4
line 764
;763:
;764:	levelMenuInfo.item_maps[1].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+576+88
CNSTI4 6
ASGNI4
line 765
;765:	levelMenuInfo.item_maps[1].generic.name			= levelMenuInfo.levelPicNames[1];
ADDRGP4 levelMenuInfo+576+88+4
ADDRGP4 levelMenuInfo+2084+64
ASGNP4
line 766
;766:	levelMenuInfo.item_maps[1].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+576+88+44
CNSTU4 4
ASGNU4
line 767
;767:	levelMenuInfo.item_maps[1].generic.x			= 186;
ADDRGP4 levelMenuInfo+576+88+12
CNSTI4 186
ASGNI4
line 768
;768:	levelMenuInfo.item_maps[1].generic.y			= 64;
ADDRGP4 levelMenuInfo+576+88+16
CNSTI4 64
ASGNI4
line 769
;769:	levelMenuInfo.item_maps[1].generic.id			= ID_PICTURE1;
ADDRGP4 levelMenuInfo+576+88+8
CNSTI4 12
ASGNI4
line 770
;770:	levelMenuInfo.item_maps[1].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+576+88+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 771
;771:	levelMenuInfo.item_maps[1].width				= 128;
ADDRGP4 levelMenuInfo+576+88+76
CNSTI4 128
ASGNI4
line 772
;772:	levelMenuInfo.item_maps[1].height				= 96;
ADDRGP4 levelMenuInfo+576+88+80
CNSTI4 96
ASGNI4
line 774
;773:
;774:	levelMenuInfo.item_maps[2].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+576+176
CNSTI4 6
ASGNI4
line 775
;775:	levelMenuInfo.item_maps[2].generic.name			= levelMenuInfo.levelPicNames[2];
ADDRGP4 levelMenuInfo+576+176+4
ADDRGP4 levelMenuInfo+2084+128
ASGNP4
line 776
;776:	levelMenuInfo.item_maps[2].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+576+176+44
CNSTU4 4
ASGNU4
line 777
;777:	levelMenuInfo.item_maps[2].generic.x			= 326;
ADDRGP4 levelMenuInfo+576+176+12
CNSTI4 326
ASGNI4
line 778
;778:	levelMenuInfo.item_maps[2].generic.y			= 64;
ADDRGP4 levelMenuInfo+576+176+16
CNSTI4 64
ASGNI4
line 779
;779:	levelMenuInfo.item_maps[2].generic.id			= ID_PICTURE2;
ADDRGP4 levelMenuInfo+576+176+8
CNSTI4 13
ASGNI4
line 780
;780:	levelMenuInfo.item_maps[2].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+576+176+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 781
;781:	levelMenuInfo.item_maps[2].width				= 128;
ADDRGP4 levelMenuInfo+576+176+76
CNSTI4 128
ASGNI4
line 782
;782:	levelMenuInfo.item_maps[2].height				= 96;
ADDRGP4 levelMenuInfo+576+176+80
CNSTI4 96
ASGNI4
line 784
;783:
;784:	levelMenuInfo.item_maps[3].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+576+264
CNSTI4 6
ASGNI4
line 785
;785:	levelMenuInfo.item_maps[3].generic.name			= levelMenuInfo.levelPicNames[3];
ADDRGP4 levelMenuInfo+576+264+4
ADDRGP4 levelMenuInfo+2084+192
ASGNP4
line 786
;786:	levelMenuInfo.item_maps[3].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+576+264+44
CNSTU4 4
ASGNU4
line 787
;787:	levelMenuInfo.item_maps[3].generic.x			= 466;
ADDRGP4 levelMenuInfo+576+264+12
CNSTI4 466
ASGNI4
line 788
;788:	levelMenuInfo.item_maps[3].generic.y			= 64;
ADDRGP4 levelMenuInfo+576+264+16
CNSTI4 64
ASGNI4
line 789
;789:	levelMenuInfo.item_maps[3].generic.id			= ID_PICTURE3;
ADDRGP4 levelMenuInfo+576+264+8
CNSTI4 14
ASGNI4
line 790
;790:	levelMenuInfo.item_maps[3].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+576+264+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 791
;791:	levelMenuInfo.item_maps[3].width				= 128;
ADDRGP4 levelMenuInfo+576+264+76
CNSTI4 128
ASGNI4
line 792
;792:	levelMenuInfo.item_maps[3].height				= 96;
ADDRGP4 levelMenuInfo+576+264+80
CNSTI4 96
ASGNI4
line 794
;793:
;794:	levelMenuInfo.item_rightarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+928
CNSTI4 6
ASGNI4
line 795
;795:	levelMenuInfo.item_rightarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+928+4
ADDRGP4 $413
ASGNP4
line 796
;796:	levelMenuInfo.item_rightarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+928+44
CNSTU4 260
ASGNU4
line 797
;797:	levelMenuInfo.item_rightarrow.generic.x			= 606;
ADDRGP4 levelMenuInfo+928+12
CNSTI4 606
ASGNI4
line 798
;798:	levelMenuInfo.item_rightarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+928+16
CNSTI4 64
ASGNI4
line 799
;799:	levelMenuInfo.item_rightarrow.generic.callback	= UI_SPLevelMenu_RightArrowEvent;
ADDRGP4 levelMenuInfo+928+48
ADDRGP4 UI_SPLevelMenu_RightArrowEvent
ASGNP4
line 800
;800:	levelMenuInfo.item_rightarrow.generic.id		= ID_RIGHTARROW;
ADDRGP4 levelMenuInfo+928+8
CNSTI4 15
ASGNI4
line 801
;801:	levelMenuInfo.item_rightarrow.width				= -16;
ADDRGP4 levelMenuInfo+928+76
CNSTI4 -16
ASGNI4
line 802
;802:	levelMenuInfo.item_rightarrow.height			= 114;
ADDRGP4 levelMenuInfo+928+80
CNSTI4 114
ASGNI4
line 803
;803:	levelMenuInfo.item_rightarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+928+60
ADDRGP4 $414
ASGNP4
line 805
;804:
;805:	trap_Cvar_VariableStringBuffer( "model", levelMenuInfo.playerModel, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 $118
ARGP4
ADDRGP4 levelMenuInfo+2464
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 806
;806:	PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2464
ARGP4
ADDRGP4 levelMenuInfo+2528
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 807
;807:	levelMenuInfo.item_player.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1016
CNSTI4 6
ASGNI4
line 808
;808:	levelMenuInfo.item_player.generic.name			= levelMenuInfo.playerPicName;
ADDRGP4 levelMenuInfo+1016+4
ADDRGP4 levelMenuInfo+2528
ASGNP4
line 809
;809:	levelMenuInfo.item_player.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY;
ADDRGP4 levelMenuInfo+1016+44
CNSTU4 2052
ASGNU4
line 810
;810:	levelMenuInfo.item_player.generic.x				= 288;
ADDRGP4 levelMenuInfo+1016+12
CNSTI4 288
ASGNI4
line 811
;811:	levelMenuInfo.item_player.generic.y				= AWARDS_Y;
ADDRGP4 levelMenuInfo+1016+16
CNSTI4 340
ASGNI4
line 812
;812:	levelMenuInfo.item_player.generic.id			= ID_PLAYERPIC;
ADDRGP4 levelMenuInfo+1016+8
CNSTI4 16
ASGNI4
line 813
;813:	levelMenuInfo.item_player.generic.callback		= UI_SPLevelMenu_PlayerEvent;
ADDRGP4 levelMenuInfo+1016+48
ADDRGP4 UI_SPLevelMenu_PlayerEvent
ASGNP4
line 814
;814:	levelMenuInfo.item_player.width					= 64;
ADDRGP4 levelMenuInfo+1016+76
CNSTI4 64
ASGNI4
line 815
;815:	levelMenuInfo.item_player.height				= 64;
ADDRGP4 levelMenuInfo+1016+80
CNSTI4 64
ASGNI4
line 817
;816:
;817:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $628
line 818
;818:		levelMenuInfo.awardLevels[n] = UI_GetAwardLevel( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 819
;819:	}
LABELV $629
line 817
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $628
line 820
;820:	levelMenuInfo.awardLevels[AWARD_FRAGS] = 100 * (levelMenuInfo.awardLevels[AWARD_FRAGS] / 100);
ADDRLP4 92
CNSTI4 100
ASGNI4
ADDRGP4 levelMenuInfo+2592+16
ADDRLP4 92
INDIRI4
ADDRGP4 levelMenuInfo+2592+16
INDIRI4
ADDRLP4 92
INDIRI4
DIVI4
MULI4
ASGNI4
line 822
;821:
;822:	y = AWARDS_Y;
ADDRLP4 12
CNSTI4 340
ASGNI4
line 823
;823:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 824
;824:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $637
line 825
;825:		if( levelMenuInfo.awardLevels[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $641
line 826
;826:			if( count & 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $644
line 827
;827:				x = 224 - (count - 1 ) / 2 * (48 + 16);
ADDRLP4 8
CNSTI4 224
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 828
;828:			}
ADDRGP4 $645
JUMPV
LABELV $644
line 829
;829:			else {
line 830
;830:				x = 368 + count / 2 * (48 + 16);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 831
;831:			}
LABELV $645
line 833
;832:
;833:			levelMenuInfo.item_awards[count].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104
ADDP4
CNSTI4 6
ASGNI4
line 834
;834:			levelMenuInfo.item_awards[count].generic.name		= ui_medalPicNames[n];
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ASGNP4
line 835
;835:			levelMenuInfo.item_awards[count].generic.flags		= QMF_LEFT_JUSTIFY|QMF_SILENT|QMF_MOUSEONLY;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+44
ADDP4
CNSTU4 1050628
ASGNU4
line 836
;836:			levelMenuInfo.item_awards[count].generic.x			= x;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+12
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 837
;837:			levelMenuInfo.item_awards[count].generic.y			= y;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+16
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 838
;838:			levelMenuInfo.item_awards[count].generic.id			= ID_AWARD1 + n;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 17
ADDI4
ASGNI4
line 839
;839:			levelMenuInfo.item_awards[count].generic.callback	= UI_SPLevelMenu_AwardEvent;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+48
ADDP4
ADDRGP4 UI_SPLevelMenu_AwardEvent
ASGNP4
line 840
;840:			levelMenuInfo.item_awards[count].width				= 48;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+76
ADDP4
CNSTI4 48
ASGNI4
line 841
;841:			levelMenuInfo.item_awards[count].height				= 48;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104+80
ADDP4
CNSTI4 48
ASGNI4
line 842
;842:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 843
;843:		}
LABELV $641
line 844
;844:	}
LABELV $638
line 824
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $637
line 846
;845:
;846:	levelMenuInfo.item_back.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1632
CNSTI4 6
ASGNI4
line 847
;847:	levelMenuInfo.item_back.generic.name			= ART_BACK0;
ADDRGP4 levelMenuInfo+1632+4
ADDRGP4 $420
ASGNP4
line 848
;848:	levelMenuInfo.item_back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1632+44
CNSTU4 260
ASGNU4
line 849
;849:	levelMenuInfo.item_back.generic.x				= 0;
ADDRGP4 levelMenuInfo+1632+12
CNSTI4 0
ASGNI4
line 850
;850:	levelMenuInfo.item_back.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1632+16
CNSTI4 416
ASGNI4
line 851
;851:	levelMenuInfo.item_back.generic.callback		= UI_SPLevelMenu_BackEvent;
ADDRGP4 levelMenuInfo+1632+48
ADDRGP4 UI_SPLevelMenu_BackEvent
ASGNP4
line 852
;852:	levelMenuInfo.item_back.generic.id				= ID_BACK;
ADDRGP4 levelMenuInfo+1632+8
CNSTI4 23
ASGNI4
line 853
;853:	levelMenuInfo.item_back.width					= 128;
ADDRGP4 levelMenuInfo+1632+76
CNSTI4 128
ASGNI4
line 854
;854:	levelMenuInfo.item_back.height					= 64;
ADDRGP4 levelMenuInfo+1632+80
CNSTI4 64
ASGNI4
line 855
;855:	levelMenuInfo.item_back.focuspic				= ART_BACK1;
ADDRGP4 levelMenuInfo+1632+60
ADDRGP4 $421
ASGNP4
line 857
;856:
;857:	levelMenuInfo.item_reset.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1720
CNSTI4 6
ASGNI4
line 858
;858:	levelMenuInfo.item_reset.generic.name			= ART_RESET0;
ADDRGP4 levelMenuInfo+1720+4
ADDRGP4 $424
ASGNP4
line 859
;859:	levelMenuInfo.item_reset.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1720+44
CNSTU4 260
ASGNU4
line 860
;860:	levelMenuInfo.item_reset.generic.x				= 170;
ADDRGP4 levelMenuInfo+1720+12
CNSTI4 170
ASGNI4
line 861
;861:	levelMenuInfo.item_reset.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1720+16
CNSTI4 416
ASGNI4
line 862
;862:	levelMenuInfo.item_reset.generic.callback		= UI_SPLevelMenu_ResetEvent;
ADDRGP4 levelMenuInfo+1720+48
ADDRGP4 UI_SPLevelMenu_ResetEvent
ASGNP4
line 863
;863:	levelMenuInfo.item_reset.generic.id				= ID_RESET;
ADDRGP4 levelMenuInfo+1720+8
CNSTI4 24
ASGNI4
line 864
;864:	levelMenuInfo.item_reset.width					= 128;
ADDRGP4 levelMenuInfo+1720+76
CNSTI4 128
ASGNI4
line 865
;865:	levelMenuInfo.item_reset.height					= 64;
ADDRGP4 levelMenuInfo+1720+80
CNSTI4 64
ASGNI4
line 866
;866:	levelMenuInfo.item_reset.focuspic				= ART_RESET1;
ADDRGP4 levelMenuInfo+1720+60
ADDRGP4 $425
ASGNP4
line 868
;867:
;868:	levelMenuInfo.item_custom.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1808
CNSTI4 6
ASGNI4
line 869
;869:	levelMenuInfo.item_custom.generic.name			= ART_CUSTOM0;
ADDRGP4 levelMenuInfo+1808+4
ADDRGP4 $426
ASGNP4
line 870
;870:	levelMenuInfo.item_custom.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1808+44
CNSTU4 260
ASGNU4
line 871
;871:	levelMenuInfo.item_custom.generic.x				= 342;
ADDRGP4 levelMenuInfo+1808+12
CNSTI4 342
ASGNI4
line 872
;872:	levelMenuInfo.item_custom.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1808+16
CNSTI4 416
ASGNI4
line 873
;873:	levelMenuInfo.item_custom.generic.callback		= UI_SPLevelMenu_CustomEvent;
ADDRGP4 levelMenuInfo+1808+48
ADDRGP4 UI_SPLevelMenu_CustomEvent
ASGNP4
line 874
;874:	levelMenuInfo.item_custom.generic.id			= ID_CUSTOM;
ADDRGP4 levelMenuInfo+1808+8
CNSTI4 25
ASGNI4
line 875
;875:	levelMenuInfo.item_custom.width					= 128;
ADDRGP4 levelMenuInfo+1808+76
CNSTI4 128
ASGNI4
line 876
;876:	levelMenuInfo.item_custom.height				= 64;
ADDRGP4 levelMenuInfo+1808+80
CNSTI4 64
ASGNI4
line 877
;877:	levelMenuInfo.item_custom.focuspic				= ART_CUSTOM1;
ADDRGP4 levelMenuInfo+1808+60
ADDRGP4 $427
ASGNP4
line 879
;878:
;879:	levelMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1896
CNSTI4 6
ASGNI4
line 880
;880:	levelMenuInfo.item_next.generic.name			= ART_FIGHT0;
ADDRGP4 levelMenuInfo+1896+4
ADDRGP4 $422
ASGNP4
line 881
;881:	levelMenuInfo.item_next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1896+44
CNSTU4 272
ASGNU4
line 882
;882:	levelMenuInfo.item_next.generic.x				= 640;
ADDRGP4 levelMenuInfo+1896+12
CNSTI4 640
ASGNI4
line 883
;883:	levelMenuInfo.item_next.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1896+16
CNSTI4 416
ASGNI4
line 884
;884:	levelMenuInfo.item_next.generic.callback		= UI_SPLevelMenu_NextEvent;
ADDRGP4 levelMenuInfo+1896+48
ADDRGP4 UI_SPLevelMenu_NextEvent
ASGNP4
line 885
;885:	levelMenuInfo.item_next.generic.id				= ID_NEXT;
ADDRGP4 levelMenuInfo+1896+8
CNSTI4 26
ASGNI4
line 886
;886:	levelMenuInfo.item_next.width					= 128;
ADDRGP4 levelMenuInfo+1896+76
CNSTI4 128
ASGNI4
line 887
;887:	levelMenuInfo.item_next.height					= 64;
ADDRGP4 levelMenuInfo+1896+80
CNSTI4 64
ASGNI4
line 888
;888:	levelMenuInfo.item_next.focuspic				= ART_FIGHT1;
ADDRGP4 levelMenuInfo+1896+60
ADDRGP4 $423
ASGNP4
line 890
;889:
;890:	levelMenuInfo.item_null.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1984
CNSTI4 6
ASGNI4
line 891
;891:	levelMenuInfo.item_null.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 levelMenuInfo+1984+44
CNSTU4 1050628
ASGNU4
line 892
;892:	levelMenuInfo.item_null.generic.x				= 0;
ADDRGP4 levelMenuInfo+1984+12
CNSTI4 0
ASGNI4
line 893
;893:	levelMenuInfo.item_null.generic.y				= 0;
ADDRGP4 levelMenuInfo+1984+16
CNSTI4 0
ASGNI4
line 894
;894:	levelMenuInfo.item_null.width					= 640;
ADDRGP4 levelMenuInfo+1984+76
CNSTI4 640
ASGNI4
line 895
;895:	levelMenuInfo.item_null.height					= 480;
ADDRGP4 levelMenuInfo+1984+80
CNSTI4 480
ASGNI4
line 897
;896:
;897:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_banner );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 899
;898:
;899:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_leftarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 900
;900:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 901
;901:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[1] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+576+88
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 902
;902:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[2] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+576+176
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 903
;903:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[3] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+576+264
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 904
;904:	levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 96
ADDRGP4 levelMenuInfo+576+32
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 905
;905:	levelMenuInfo.item_maps[1].generic.bottom += 18;
ADDRLP4 100
ADDRGP4 levelMenuInfo+576+88+32
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 906
;906:	levelMenuInfo.item_maps[2].generic.bottom += 18;
ADDRLP4 104
ADDRGP4 levelMenuInfo+576+176+32
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 907
;907:	levelMenuInfo.item_maps[3].generic.bottom += 18;
ADDRLP4 108
ADDRGP4 levelMenuInfo+576+264+32
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 908
;908:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_rightarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 910
;909:
;910:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_player );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 912
;911:
;912:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $775
JUMPV
LABELV $772
line 913
;913:		Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_awards[n] );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1104
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 914
;914:	}
LABELV $773
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $775
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $772
line 915
;915:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_back );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 916
;916:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_reset );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 917
;917:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_custom );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 918
;918:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 919
;919:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_null );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1984
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 921
;920:
;921:	trap_Cvar_VariableStringBuffer( "ui_spSelection", buf, sizeof(buf) );
ADDRGP4 $168
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 922
;922:	if( *buf ) {
ADDRLP4 20
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $782
line 923
;923:		n = atoi( buf );
ADDRLP4 20
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 112
INDIRI4
ASGNI4
line 924
;924:		selectedArenaSet = n / ARENAS_PER_TIER;
ADDRGP4 selectedArenaSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 925
;925:		selectedArena = n % ARENAS_PER_TIER;
ADDRGP4 selectedArena
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 926
;926:	}
ADDRGP4 $783
JUMPV
LABELV $782
line 927
;927:	else {
line 928
;928:		selectedArenaSet = currentSet;
ADDRGP4 selectedArenaSet
ADDRGP4 currentSet
INDIRI4
ASGNI4
line 929
;929:		selectedArena = currentGame;
ADDRGP4 selectedArena
ADDRGP4 currentGame
INDIRI4
ASGNI4
line 930
;930:	}
LABELV $783
line 932
;931:
;932:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 933
;933:}
LABELV $444
endproc UI_SPLevelMenu_Init 116 12
export UI_SPLevelMenu
proc UI_SPLevelMenu 32 8
line 941
;934:
;935:
;936:/*
;937:=================
;938:UI_SPLevelMenu
;939:=================
;940:*/
;941:void UI_SPLevelMenu( void ) {
line 946
;942:	int			level;
;943:	int			trainingLevel;
;944:	const char	*arenaInfo;
;945:
;946:	trainingTier = -1;
ADDRGP4 trainingTier
CNSTI4 -1
ASGNI4
line 947
;947:	arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $171
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 948
;948:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $785
line 949
;949:		minTier = trainingTier;
ADDRGP4 minTier
ADDRGP4 trainingTier
INDIRI4
ASGNI4
line 950
;950:		trainingLevel = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 951
;951:	}
ADDRGP4 $786
JUMPV
LABELV $785
line 952
;952:	else {
line 953
;953:		minTier = 0;
ADDRGP4 minTier
CNSTI4 0
ASGNI4
line 954
;954:		trainingLevel = -2;
ADDRLP4 8
CNSTI4 -2
ASGNI4
line 955
;955:	}
LABELV $786
line 957
;956:
;957:	finalTier = UI_GetNumSPTiers();
ADDRLP4 16
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 finalTier
ADDRLP4 16
INDIRI4
ASGNI4
line 958
;958:	arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $206
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 959
;959:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $787
line 960
;960:		maxTier = finalTier;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
ASGNI4
line 961
;961:	}
ADDRGP4 $788
JUMPV
LABELV $787
line 962
;962:	else {
line 963
;963:		maxTier = finalTier - 1;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 964
;964:		if( maxTier < minTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 minTier
INDIRI4
GEI4 $789
line 965
;965:			maxTier = minTier;
ADDRGP4 maxTier
ADDRGP4 minTier
INDIRI4
ASGNI4
line 966
;966:		}
LABELV $789
line 967
;967:	}
LABELV $788
line 969
;968:
;969:	level = UI_GetCurrentGame();
ADDRLP4 24
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 970
;970:	if ( level == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $791
line 971
;971:		level = UI_GetNumSPArenas() - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumSPArenas
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 972
;972:		if( maxTier == finalTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $793
line 973
;973:			level++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 974
;974:		}
LABELV $793
line 975
;975:	}
LABELV $791
line 977
;976:
;977:	if( level == trainingLevel ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $795
line 978
;978:		currentSet = -1;
ADDRGP4 currentSet
CNSTI4 -1
ASGNI4
line 979
;979:		currentGame = 0;
ADDRGP4 currentGame
CNSTI4 0
ASGNI4
line 980
;980:	}
ADDRGP4 $796
JUMPV
LABELV $795
line 981
;981:	else {
line 982
;982:		currentSet = level / ARENAS_PER_TIER;
ADDRGP4 currentSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 983
;983:		currentGame = level % ARENAS_PER_TIER;
ADDRGP4 currentGame
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 984
;984:	}
LABELV $796
line 986
;985:
;986:	UI_SPLevelMenu_Init();
ADDRGP4 UI_SPLevelMenu_Init
CALLV
pop
line 987
;987:	UI_PushMenu( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 988
;988:	Menu_SetCursorToItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1896
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 989
;989:}
LABELV $784
endproc UI_SPLevelMenu 32 8
export UI_SPLevelMenu_f
proc UI_SPLevelMenu_f 0 4
line 997
;990:
;991:
;992:/*
;993:=================
;994:UI_SPLevelMenu_f
;995:=================
;996:*/
;997:void UI_SPLevelMenu_f( void ) {
line 998
;998:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 999
;999:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1000
;1000:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 1001
;1001:}
LABELV $798
endproc UI_SPLevelMenu_f 0 4
export UI_SPLevelMenu_ReInit
proc UI_SPLevelMenu_ReInit 0 0
line 1009
;1002:
;1003:
;1004:/*
;1005:=================
;1006:UI_SPLevelMenu_ReInit
;1007:=================
;1008:*/
;1009:void UI_SPLevelMenu_ReInit( void ) {
line 1010
;1010:	levelMenuInfo.reinit = qtrue;
ADDRGP4 levelMenuInfo+2072
CNSTI4 1
ASGNI4
line 1011
;1011:}
LABELV $800
endproc UI_SPLevelMenu_ReInit 0 0
bss
align 4
LABELV maxTier
skip 4
align 4
LABELV minTier
skip 4
align 4
LABELV finalTier
skip 4
align 4
LABELV trainingTier
skip 4
align 4
LABELV currentGame
skip 4
align 4
LABELV currentSet
skip 4
align 4
LABELV selectedArena
skip 4
align 4
LABELV selectedArenaSet
skip 4
align 4
LABELV levelMenuInfo
skip 2744
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
LABELV $460
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 86
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $449
byte 1 50
byte 1 0
align 1
LABELV $445
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
LABELV $427
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
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $426
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
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $425
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
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $424
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
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $423
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $422
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $421
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
LABELV $420
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
LABELV $419
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $418
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $417
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $416
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $415
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $414
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
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $413
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
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $412
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $411
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $408
byte 1 63
byte 1 0
align 1
LABELV $397
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $395
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $359
byte 1 65
byte 1 67
byte 1 67
byte 1 69
byte 1 83
byte 1 83
byte 1 32
byte 1 68
byte 1 69
byte 1 78
byte 1 73
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $347
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $346
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $345
byte 1 37
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $342
byte 1 37
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $274
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $267
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $266
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $265
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $264
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $206
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $172
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $171
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $168
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
LABELV $147
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $142
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $121
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $118
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $94
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $87
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $84
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $83
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
