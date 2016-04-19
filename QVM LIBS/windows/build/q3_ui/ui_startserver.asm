data
align 4
LABELV gametype_items
address $80
address $81
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
byte 4 0
align 4
LABELV gametype_remap
byte 4 0
byte 4 3
byte 4 1
byte 4 4
byte 4 5
byte 4 6
byte 4 7
byte 4 8
byte 4 9
byte 4 10
byte 4 11
byte 4 12
align 4
LABELV gametype_remap2
byte 4 0
byte 4 2
byte 4 0
byte 4 1
byte 4 3
byte 4 4
byte 4 5
byte 4 6
byte 4 7
byte 4 8
byte 4 9
byte 4 10
byte 4 11
code
proc GametypeBits 68 8
file "../../../code/q3_ui/ui_startserver.c"
line 151
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
;26:START SERVER MENU *****
;27:
;28:=============================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define GAMESERVER_BACK0		"menu/art_blueish/back_0"
;36:#define GAMESERVER_BACK1		"menu/art_blueish/back_1"
;37:#define GAMESERVER_NEXT0		"menu/art_blueish/next_0"
;38:#define GAMESERVER_NEXT1		"menu/art_blueish/next_1"
;39:#define GAMESERVER_FRAMEL		"menu/art_blueish/frame2_l"
;40:#define GAMESERVER_FRAMER		"menu/art_blueish/frame1_r"
;41:#define GAMESERVER_SELECT		"menu/art_blueish/maps_select"
;42:#define GAMESERVER_SELECTED		"menu/art_blueish/maps_selected"
;43:#define GAMESERVER_FIGHT0		"menu/art_blueish/fight_0"
;44:#define GAMESERVER_FIGHT1		"menu/art_blueish/fight_1"
;45:#define GAMESERVER_UNKNOWNMAP           "menu/art/unknownmap"
;46:#define GAMESERVER_ARROWS		"menu/art_blueish/gs_arrows_0"
;47:#define GAMESERVER_ARROWSL		"menu/art_blueish/gs_arrows_l"
;48:#define GAMESERVER_ARROWSR		"menu/art_blueish/gs_arrows_r"
;49:
;50:#define MAX_MAPROWS		4
;51:#define MAX_MAPCOLS		2
;52:#define MAX_MAPSPERPAGE	(MAX_MAPROWS * MAX_MAPCOLS)
;53:
;54://#define	MAX_SERVERSTEXT	8192
;55:
;56:#define MAX_SERVERMAPS	MAX_ARENAS
;57:#define MAX_NAMELENGTH	16
;58:
;59:#define ID_GAMETYPE				10
;60:#define ID_PICTURES				11	// 12, 13, 14, 15, 16, 17, 18
;61:#define ID_PREVPAGE				19
;62:#define ID_NEXTPAGE				20
;63:#define ID_STARTSERVERBACK		21
;64:#define ID_STARTSERVERNEXT		22
;65:
;66:#define ID_AUTONEXTMAP                  23
;67:
;68:typedef struct {
;69:	menuframework_s	menu;
;70:
;71:	menutext_s		banner;
;72:	menubitmap_s	framel;
;73:	menubitmap_s	framer;
;74:
;75:	menulist_s		gametype;
;76:        menuradiobutton_s       autonextmap;
;77:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;78:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;79:	menubitmap_s	arrows;
;80:	menubitmap_s	prevpage;
;81:	menubitmap_s	nextpage;
;82:	menubitmap_s	back;
;83:	menubitmap_s	next;
;84:
;85:	menutext_s		mapname;
;86:	menubitmap_s	item_null;
;87:
;88:	qboolean		multiplayer;
;89:	int				currentmap;
;90:	int				nummaps;
;91:	int				page;
;92:	int				maxpages;
;93:	int			maplist[MAX_SERVERMAPS];
;94:} startserver_t;
;95:
;96:static startserver_t s_startserver;
;97:
;98:static const char *gametype_items[] = {
;99:	"Free For All",
;100:	"Team Deathmatch",
;101:	"Tournament",
;102:	"Capture the Flag",
;103:        "One Flag Capture",
;104:        "Overload",
;105:        "Harvester",
;106:	"Elimination",
;107:	"CTF Elimination",
;108:	"Last Man Standing",
;109:	"Double Domination",
;110:        "Domination",
;111:	NULL
;112:};
;113:
;114:static int gametype_remap[] = {
;115:		GT_FFA,			
;116:		GT_TEAM, 		
;117:		GT_TOURNAMENT, 		
;118:		GT_CTF,
;119:                GT_1FCTF,
;120:                GT_OBELISK,
;121:                GT_HARVESTER,
;122:		GT_ELIMINATION, 	
;123:		GT_CTF_ELIMINATION, 	
;124:		GT_LMS, 		
;125:		GT_DOUBLE_D,
;126:                GT_DOMINATION };		
;127:
;128:static int gametype_remap2[] = {
;129:		0, 
;130:		2, 
;131:		0, 
;132:		1, 
;133:		3, 
;134:		4,
;135:		5,
;136:		6,
;137:		7, 
;138:		8, 
;139:		9, 
;140:		10,
;141:                11 };		//this works and should increment for more gametypes
;142:
;143:static void UI_ServerOptionsMenu( qboolean multiplayer );
;144:
;145:
;146:/*
;147:=================
;148:GametypeBits from arenas.txt + .arena files
;149:=================
;150:*/
;151:static int GametypeBits( char *string ) {
line 156
;152:	int		bits;
;153:	char	*p;
;154:	char	*token;
;155:
;156:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 157
;157:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $94
JUMPV
LABELV $93
line 158
;158:	while( 1 ) {
line 159
;159:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 160
;160:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $96
line 161
;161:			break;
ADDRGP4 $95
JUMPV
LABELV $96
line 164
;162:		}
;163:
;164:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $98
line 165
;165:			bits |= 1 << GT_FFA;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 166
;166:			continue;
ADDRGP4 $94
JUMPV
LABELV $98
line 169
;167:		}
;168:
;169:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $101
line 170
;170:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 171
;171:			continue;
ADDRGP4 $94
JUMPV
LABELV $101
line 174
;172:		}
;173:
;174:		if( Q_stricmp( token, "single" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $106
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $104
line 175
;175:			bits |= 1 << GT_SINGLE_PLAYER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 176
;176:			continue;
ADDRGP4 $94
JUMPV
LABELV $104
line 179
;177:		}
;178:
;179:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $109
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $107
line 180
;180:			bits |= 1 << GT_TEAM;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 181
;181:			continue;
ADDRGP4 $94
JUMPV
LABELV $107
line 184
;182:		}
;183:
;184:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $110
line 185
;185:			bits |= 1 << GT_CTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 186
;186:			continue;
ADDRGP4 $94
JUMPV
LABELV $110
line 189
;187:		}
;188:                
;189:                if( Q_stricmp( token, "oneflag" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $113
line 190
;190:			bits |= 1 << GT_1FCTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 191
;191:			continue;
ADDRGP4 $94
JUMPV
LABELV $113
line 194
;192:		}
;193:                
;194:                if( Q_stricmp( token, "overload" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $116
line 195
;195:			bits |= 1 << GT_OBELISK;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 196
;196:			continue;
ADDRGP4 $94
JUMPV
LABELV $116
line 199
;197:		}
;198:                
;199:                if( Q_stricmp( token, "harvester" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $119
line 200
;200:			bits |= 1 << GT_HARVESTER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 201
;201:			continue;
ADDRGP4 $94
JUMPV
LABELV $119
line 204
;202:		}
;203:
;204:		if( Q_stricmp( token, "elimination" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $122
line 205
;205:			bits |= 1 << GT_ELIMINATION;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 206
;206:			continue;
ADDRGP4 $94
JUMPV
LABELV $122
line 209
;207:		}
;208:
;209:		if( Q_stricmp( token, "ctfelimination" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $125
line 210
;210:			bits |= 1 << GT_CTF_ELIMINATION;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 211
;211:			continue;
ADDRGP4 $94
JUMPV
LABELV $125
line 214
;212:		}
;213:
;214:		if( Q_stricmp( token, "lms" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $128
line 215
;215:			bits |= 1 << GT_LMS;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 216
;216:			continue;
ADDRGP4 $94
JUMPV
LABELV $128
line 218
;217:		}
;218:		if( Q_stricmp( token, "dd" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $131
line 219
;219:			bits |= 1 << GT_DOUBLE_D;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 220
;220:			continue;
ADDRGP4 $94
JUMPV
LABELV $131
line 223
;221:		}
;222:                
;223:                if( Q_stricmp( token, "dom" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $134
line 224
;224:			bits |= 1 << GT_DOMINATION;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 225
;225:			continue;
LABELV $134
line 227
;226:		}
;227:}
LABELV $94
line 158
ADDRGP4 $93
JUMPV
LABELV $95
line 228
;228:	return bits;
ADDRLP4 4
INDIRI4
RETI4
LABELV $92
endproc GametypeBits 68 8
bss
align 1
LABELV $138
skip 512
code
proc StartServer_Update 52 16
line 237
;229:}
;230:
;231:
;232:/*
;233:=================
;234:StartServer_Update
;235:=================
;236:*/
;237:static void StartServer_Update( void ) {
line 244
;238:	int				i;
;239:	int				top;
;240:	static	char	picname[MAX_MAPSPERPAGE][64];
;241:        const char		*info;
;242:	char			mapname[MAX_NAMELENGTH];
;243:
;244:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 20
ADDRGP4 s_startserver+2844
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 246
;245:
;246:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $140
line 247
;247:	{
line 248
;248:		if (top+i >= s_startserver.nummaps)
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+2840
INDIRI4
LTI4 $144
line 249
;249:			break;
ADDRGP4 $163
JUMPV
LABELV $144
line 251
;250:
;251:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ top + i ]);
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 252
;252:		Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 253
;253:		Q_strupr( mapname );
ADDRLP4 4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 255
;254:
;255:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", mapname );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $138
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $149
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 257
;256:                
;257:		s_startserver.mappics[i].generic.flags &= ~((unsigned int)QMF_HIGHLIGHT);
ADDRLP4 36
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 258
;258:		s_startserver.mappics[i].generic.name   = picname[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $138
ADDP4
ASGNP4
line 259
;259:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+68
ADDP4
CNSTI4 0
ASGNI4
line 262
;260:
;261:		// reset
;262:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 44
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 263
;263:		s_startserver.mapbuttons[i].generic.flags &= ~((unsigned int)QMF_INACTIVE);
ADDRLP4 48
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 264
;264:	}
LABELV $141
line 246
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $140
line 266
;265:
;266:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $163
JUMPV
LABELV $160
line 267
;267:	{
line 268
;268:		s_startserver.mappics[i].generic.flags &= ~((unsigned int)QMF_HIGHLIGHT);
ADDRLP4 28
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 269
;269:		s_startserver.mappics[i].generic.name   = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+4
ADDP4
CNSTP4 0
ASGNP4
line 270
;270:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+68
ADDP4
CNSTI4 0
ASGNI4
line 273
;271:
;272:		// disable
;273:		s_startserver.mapbuttons[i].generic.flags &= ~((unsigned int)QMF_PULSEIFFOCUS);
ADDRLP4 32
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 274
;274:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 275
;275:	}
LABELV $161
line 266
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $163
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $160
line 279
;276:
;277:
;278:	// no servers to start
;279:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+2840
INDIRI4
CNSTI4 0
NEI4 $174
line 280
;280:		s_startserver.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 s_startserver+2584+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 283
;281:
;282:		// set the map name
;283:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+2672+60
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 284
;284:	}
ADDRGP4 $175
JUMPV
LABELV $174
line 285
;285:	else {
line 287
;286:		// set the highlight
;287:		s_startserver.next.generic.flags &= ~((unsigned int)QMF_INACTIVE);
ADDRLP4 28
ADDRGP4 s_startserver+2584+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 288
;288:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+2836
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 289
;289:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $185
ADDRLP4 0
INDIRI4
CNSTI4 8
GEI4 $185
line 290
;290:		{
line 291
;291:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 36
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 292
;292:			s_startserver.mapbuttons[i].generic.flags &= ~((unsigned int)QMF_PULSEIFFOCUS);
ADDRLP4 40
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 293
;293:		}
LABELV $185
line 296
;294:
;295:		// set the map name
;296:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
ASGNP4
line 297
;297:		Q_strncpyz( s_startserver.mapname.string, Info_ValueForKey( info, "map" ), MAX_NAMELENGTH);
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 s_startserver+2672+60
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 298
;298:	}
LABELV $175
line 300
;299:	
;300:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+2672+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 301
;301:}
LABELV $137
endproc StartServer_Update 52 16
proc StartServer_MapEvent 0 0
line 309
;302:
;303:
;304:/*
;305:=================
;306:StartServer_MapEvent
;307:=================
;308:*/
;309:static void StartServer_MapEvent( void* ptr, int event ) {
line 310
;310:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $198
line 311
;311:		return;
ADDRGP4 $197
JUMPV
LABELV $198
line 314
;312:	}
;313:
;314:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 s_startserver+2836
ADDRGP4 s_startserver+2844
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ADDI4
ASGNI4
line 315
;315:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 316
;316:}
LABELV $197
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 40 8
line 324
;317:
;318:
;319:/*
;320:=================
;321:StartServer_GametypeEvent
;322:=================
;323:*/
;324:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 331
;325:	int			i;
;326:	int			count;
;327:	int			gamebits;
;328:	int			matchbits;
;329:	const char	*info;
;330:
;331:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $203
line 332
;332:		return;
ADDRGP4 $202
JUMPV
LABELV $203
line 335
;333:	}
;334:
;335:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 336
;336:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+2840
CNSTI4 0
ASGNI4
line 337
;337:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
ADDRLP4 12
CNSTI4 1
ADDRGP4 s_startserver+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
LSHI4
ASGNI4
line 338
;338:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 0
NEI4 $208
line 339
;339:		matchbits |= ( 1 << GT_SINGLE_PLAYER );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 340
;340:	}
LABELV $208
line 341
;341:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 342
;342:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 344
;343:
;344:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $216
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 345
;345:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $217
line 346
;346:			continue;
ADDRGP4 $213
JUMPV
LABELV $217
line 349
;347:		}
;348:
;349:		s_startserver.maplist[s_startserver.nummaps] = i;
ADDRGP4 s_startserver+2840
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 350
;350:		s_startserver.nummaps++;
ADDRLP4 36
ADDRGP4 s_startserver+2840
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 351
;351:	}
LABELV $213
line 341
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $215
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $212
line 352
;352:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRGP4 s_startserver+2848
ADDRGP4 s_startserver+2840
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 24
INDIRI4
DIVI4
ASGNI4
line 353
;353:	s_startserver.page = 0;
ADDRGP4 s_startserver+2844
CNSTI4 0
ASGNI4
line 354
;354:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+2836
CNSTI4 0
ASGNI4
line 356
;355:
;356:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 357
;357:}
LABELV $202
endproc StartServer_GametypeEvent 40 8
proc StartServer_MenuEvent 12 8
line 365
;358:
;359:
;360:/*
;361:=================
;362:StartServer_MenuEvent
;363:=================
;364:*/
;365:static void StartServer_MenuEvent( void* ptr, int event ) {
line 366
;366:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $227
line 367
;367:		return;
ADDRGP4 $226
JUMPV
LABELV $227
line 370
;368:	}
;369:
;370:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 19
LTI4 $229
ADDRLP4 0
INDIRI4
CNSTI4 23
GTI4 $229
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $253-76
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $253
address $232
address $237
address $252
address $243
address $248
code
LABELV $232
line 372
;371:	case ID_PREVPAGE:
;372:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+2844
INDIRI4
CNSTI4 0
LEI4 $230
line 373
;373:			s_startserver.page--;
ADDRLP4 8
ADDRGP4 s_startserver+2844
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 374
;374:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 375
;375:		}
line 376
;376:		break;
ADDRGP4 $230
JUMPV
LABELV $237
line 379
;377:
;378:	case ID_NEXTPAGE:
;379:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+2844
INDIRI4
ADDRGP4 s_startserver+2848
INDIRI4
CNSTI4 1
SUBI4
GEI4 $230
line 380
;380:			s_startserver.page++;
ADDRLP4 8
ADDRGP4 s_startserver+2844
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 381
;381:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 382
;382:		}
line 383
;383:		break;
ADDRGP4 $230
JUMPV
LABELV $243
line 386
;384:
;385:	case ID_STARTSERVERNEXT:
;386:		trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $244
ARGP4
ADDRGP4 s_startserver+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 387
;387:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+2832
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 388
;388:		break;
ADDRGP4 $230
JUMPV
LABELV $248
line 392
;389:
;390:            case ID_AUTONEXTMAP:
;391:                //trap_Cvar_SetValue( "cg_alwaysWeaponBar", s_preferences.alwaysweaponbar.curvalue );
;392:                trap_Cvar_SetValue( "g_autonextmap", s_startserver.autonextmap.curvalue );
ADDRGP4 $249
ARGP4
ADDRGP4 s_startserver+760+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 393
;393:                break;
ADDRGP4 $230
JUMPV
LABELV $252
line 396
;394:
;395:	case ID_STARTSERVERBACK:
;396:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 397
;397:		break;
LABELV $229
LABELV $230
line 399
;398:	}
;399:}
LABELV $226
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 52 20
line 407
;400:
;401:
;402:/*
;403:===============
;404:StartServer_LevelshotDraw
;405:===============
;406:*/
;407:static void StartServer_LevelshotDraw( void *self ) {
line 416
;408:	menubitmap_s	*b;
;409:	int				x;
;410:	int				y;
;411:	int				w;
;412:	int				h;
;413:	int				n;
;414:        const char		*info;
;415:
;416:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 418
;417:
;418:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 419
;419:		return;
ADDRGP4 $255
JUMPV
LABELV $256
line 422
;420:	}
;421:
;422:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $258
line 423
;423:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 424
;424:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $260
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
line 425
;425:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 426
;426:		}
LABELV $260
line 427
;427:	}
LABELV $258
line 429
;428:
;429:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $262
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $262
line 430
;430:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 431
;431:	}
LABELV $262
line 433
;432:
;433:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 434
;434:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 435
;435:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 436
;436:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 437
;437:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
line 438
;438:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 439
;439:	}
LABELV $264
line 441
;440:
;441:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 442
;442:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 443
;443:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 445
;444:
;445:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 446
;446:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 447
;447:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 s_startserver+2844
INDIRI4
CNSTI4 3
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 11
SUBI4
ASGNI4
line 449
;448:        
;449:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ n ]);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 40
INDIRP4
ASGNP4
line 450
;450:	UI_DrawString( x, y, Info_ValueForKey( info, "map" ), UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 452
;451:
;452:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 453
;453:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 454
;454:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 455
;455:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 456
;456:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $268
line 457
;457:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 458
;458:	}
LABELV $268
line 459
;459:}
LABELV $255
endproc StartServer_LevelshotDraw 52 20
bss
align 1
LABELV $271
skip 64
code
proc StartServer_MenuInit 28 12
line 467
;460:
;461:
;462:/*
;463:=================
;464:StartServer_MenuInit
;465:=================
;466:*/
;467:static void StartServer_MenuInit( void ) {
line 474
;468:	int	i;
;469:	int	x;
;470:	int	y;
;471:	static char mapnamebuffer[64];
;472:
;473:	// zero set all our globals
;474:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6948
ARGI4
ADDRGP4 memset
CALLP4
pop
line 476
;475:
;476:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 478
;477:
;478:        s_startserver.autonextmap.curvalue = trap_Cvar_VariableValue( "g_autonextmap" ) != 0;
ADDRGP4 $249
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $275
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $276
ADDRGP4 s_startserver+760+60
ADDRLP4 12
INDIRI4
ASGNI4
line 480
;479:
;480:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+404
CNSTI4 1
ASGNI4
line 481
;481:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+408
CNSTI4 1
ASGNI4
line 483
;482:
;483:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+416
CNSTI4 10
ASGNI4
line 484
;484:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+416+12
CNSTI4 320
ASGNI4
line 485
;485:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+416+16
CNSTI4 16
ASGNI4
line 486
;486:	s_startserver.banner.string        = "GAME SERVER";
ADDRGP4 s_startserver+416+60
ADDRGP4 $286
ASGNP4
line 487
;487:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+416+68
ADDRGP4 color_white
ASGNP4
line 488
;488:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+416+64
CNSTI4 1
ASGNI4
line 490
;489:
;490:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+488
CNSTI4 6
ASGNI4
line 491
;491:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
ADDRGP4 s_startserver+488+4
ADDRGP4 $294
ASGNP4
line 492
;492:	s_startserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+488+44
CNSTU4 16384
ASGNU4
line 493
;493:	s_startserver.framel.generic.x	   = 0;  
ADDRGP4 s_startserver+488+12
CNSTI4 0
ASGNI4
line 494
;494:	s_startserver.framel.generic.y	   = 78;
ADDRGP4 s_startserver+488+16
CNSTI4 78
ASGNI4
line 495
;495:	s_startserver.framel.width  	   = 256;
ADDRGP4 s_startserver+488+76
CNSTI4 256
ASGNI4
line 496
;496:	s_startserver.framel.height  	   = 329;
ADDRGP4 s_startserver+488+80
CNSTI4 329
ASGNI4
line 498
;497:
;498:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+576
CNSTI4 6
ASGNI4
line 499
;499:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
ADDRGP4 s_startserver+576+4
ADDRGP4 $308
ASGNP4
line 500
;500:	s_startserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+576+44
CNSTU4 16384
ASGNU4
line 501
;501:	s_startserver.framer.generic.x	   = 376;
ADDRGP4 s_startserver+576+12
CNSTI4 376
ASGNI4
line 502
;502:	s_startserver.framer.generic.y	   = 76;
ADDRGP4 s_startserver+576+16
CNSTI4 76
ASGNI4
line 503
;503:	s_startserver.framer.width  	   = 256;
ADDRGP4 s_startserver+576+76
CNSTI4 256
ASGNI4
line 504
;504:	s_startserver.framer.height  	   = 334;
ADDRGP4 s_startserver+576+80
CNSTI4 334
ASGNI4
line 506
;505:
;506:        s_startserver.autonextmap.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_startserver+760
CNSTI4 5
ASGNI4
line 507
;507:	s_startserver.autonextmap.generic.name		= "Auto change map:";
ADDRGP4 s_startserver+760+4
ADDRGP4 $322
ASGNP4
line 508
;508:	s_startserver.autonextmap.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+760+44
CNSTU4 258
ASGNU4
line 509
;509:	s_startserver.autonextmap.generic.callback	= StartServer_MenuEvent;
ADDRGP4 s_startserver+760+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 510
;510:	s_startserver.autonextmap.generic.id		= ID_AUTONEXTMAP;
ADDRGP4 s_startserver+760+8
CNSTI4 23
ASGNI4
line 511
;511:	s_startserver.autonextmap.generic.x		= 320 +24;
ADDRGP4 s_startserver+760+12
CNSTI4 344
ASGNI4
line 512
;512:	s_startserver.autonextmap.generic.y		= 368;
ADDRGP4 s_startserver+760+16
CNSTI4 368
ASGNI4
line 514
;513:
;514:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+664
CNSTI4 3
ASGNI4
line 515
;515:	s_startserver.gametype.generic.name		= "Game Type:";
ADDRGP4 s_startserver+664+4
ADDRGP4 $336
ASGNP4
line 516
;516:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+664+44
CNSTU4 258
ASGNU4
line 517
;517:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+664+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 518
;518:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+664+8
CNSTI4 10
ASGNI4
line 519
;519:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+664+12
CNSTI4 296
ASGNI4
line 520
;520:	s_startserver.gametype.generic.y		= 70;
ADDRGP4 s_startserver+664+16
CNSTI4 70
ASGNI4
line 521
;521:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+664+76
ADDRGP4 gametype_items
ASGNP4
line 523
;522:
;523:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $349
line 524
;524:	{
line 527
;525:		//x =	(i % MAX_MAPCOLS) * (128+8) + 188;
;526:		//y = (i / MAX_MAPROWS) * (128+8) + 96;
;527:                x = (640-MAX_MAPROWS*140)/2 + ( (i % MAX_MAPROWS) * 140 );
ADDRLP4 4
CNSTI4 140
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
MULI4
CNSTI4 40
ADDI4
ASGNI4
line 528
;528: 		y = 96 + ( (i / MAX_MAPROWS) * 140 );
ADDRLP4 8
CNSTI4 140
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 530
;529:
;530:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824
ADDP4
CNSTI4 6
ASGNI4
line 531
;531:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+44
ADDP4
CNSTU4 16388
ASGNU4
line 532
;532:		s_startserver.mappics[i].generic.x	    = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 533
;533:		s_startserver.mappics[i].generic.y	    = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 534
;534:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 535
;535:		s_startserver.mappics[i].width  		= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+76
ADDP4
CNSTI4 128
ASGNI4
line 536
;536:		s_startserver.mappics[i].height  	    = 96;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+80
ADDP4
CNSTI4 96
ASGNI4
line 537
;537:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+60
ADDP4
ADDRGP4 $368
ASGNP4
line 538
;538:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+64
ADDP4
ADDRGP4 $371
ASGNP4
line 539
;539:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 541
;540:
;541:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528
ADDP4
CNSTI4 6
ASGNI4
line 542
;542:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+44
ADDP4
CNSTU4 33028
ASGNU4
line 543
;543:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 544
;544:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 545
;545:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 546
;546:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 547
;547:		s_startserver.mapbuttons[i].width  		     = 256;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+76
ADDP4
CNSTI4 256
ASGNI4
line 548
;548:		s_startserver.mapbuttons[i].height  	     = 248;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+80
ADDP4
CNSTI4 248
ASGNI4
line 549
;549:		s_startserver.mapbuttons[i].generic.left     = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 550
;550:		s_startserver.mapbuttons[i].generic.top  	 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 551
;551:		s_startserver.mapbuttons[i].generic.right    = x + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 552
;552:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 553
;553:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528+60
ADDP4
ADDRGP4 $399
ASGNP4
line 554
;554:	}
LABELV $350
line 523
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $349
line 556
;555:
;556:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+2232
CNSTI4 6
ASGNI4
line 557
;557:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+2232+4
ADDRGP4 $403
ASGNP4
line 558
;558:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+2232+44
CNSTU4 16384
ASGNU4
line 559
;559:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+2232+12
CNSTI4 260
ASGNI4
line 560
;560:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+2232+16
CNSTI4 400
ASGNI4
line 561
;561:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+2232+76
CNSTI4 128
ASGNI4
line 562
;562:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+2232+80
CNSTI4 32
ASGNI4
line 564
;563:
;564:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+2320
CNSTI4 6
ASGNI4
line 565
;565:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+2320+44
CNSTU4 260
ASGNU4
line 566
;566:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+2320+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 567
;567:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+2320+8
CNSTI4 19
ASGNI4
line 568
;568:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+2320+12
CNSTI4 260
ASGNI4
line 569
;569:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+2320+16
CNSTI4 400
ASGNI4
line 570
;570:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+2320+76
CNSTI4 64
ASGNI4
line 571
;571:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+2320+80
CNSTI4 32
ASGNI4
line 572
;572:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+2320+60
ADDRGP4 $431
ASGNP4
line 574
;573:
;574:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+2408
CNSTI4 6
ASGNI4
line 575
;575:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+2408+44
CNSTU4 260
ASGNU4
line 576
;576:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+2408+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 577
;577:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+2408+8
CNSTI4 20
ASGNI4
line 578
;578:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+2408+12
CNSTI4 321
ASGNI4
line 579
;579:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+2408+16
CNSTI4 400
ASGNI4
line 580
;580:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+2408+76
CNSTI4 64
ASGNI4
line 581
;581:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+2408+80
CNSTI4 32
ASGNI4
line 582
;582:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+2408+60
ADDRGP4 $449
ASGNP4
line 584
;583:
;584:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+2672
CNSTI4 9
ASGNI4
line 585
;585:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+2672+44
CNSTU4 16392
ASGNU4
line 586
;586:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+2672+12
CNSTI4 320
ASGNI4
line 587
;587:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+2672+16
CNSTI4 440
ASGNI4
line 588
;588:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+2672+60
ADDRGP4 $271
ASGNP4
line 589
;589:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+2672+64
CNSTI4 33
ASGNI4
line 590
;590:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+2672+68
ADDRGP4 text_color_normal
ASGNP4
line 592
;591:
;592:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+2496
CNSTI4 6
ASGNI4
line 593
;593:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+2496+4
ADDRGP4 $466
ASGNP4
line 594
;594:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+2496+44
CNSTU4 260
ASGNU4
line 595
;595:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+2496+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 596
;596:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+2496+8
CNSTI4 21
ASGNI4
line 597
;597:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+2496+12
CNSTI4 0
ASGNI4
line 598
;598:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+2496+16
CNSTI4 416
ASGNI4
line 599
;599:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+2496+76
CNSTI4 128
ASGNI4
line 600
;600:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+2496+80
CNSTI4 64
ASGNI4
line 601
;601:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+2496+60
ADDRGP4 $483
ASGNP4
line 603
;602:
;603:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+2584
CNSTI4 6
ASGNI4
line 604
;604:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+2584+4
ADDRGP4 $487
ASGNP4
line 605
;605:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+2584+44
CNSTU4 272
ASGNU4
line 606
;606:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+2584+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 607
;607:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+2584+8
CNSTI4 22
ASGNI4
line 608
;608:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+2584+12
CNSTI4 640
ASGNI4
line 609
;609:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+2584+16
CNSTI4 416
ASGNI4
line 610
;610:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+2584+76
CNSTI4 128
ASGNI4
line 611
;611:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+2584+80
CNSTI4 64
ASGNI4
line 612
;612:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+2584+60
ADDRGP4 $504
ASGNP4
line 614
;613:
;614:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+2744
CNSTI4 6
ASGNI4
line 615
;615:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+2744+44
CNSTU4 1050628
ASGNU4
line 616
;616:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+2744+12
CNSTI4 0
ASGNI4
line 617
;617:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+2744+16
CNSTI4 0
ASGNI4
line 618
;618:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+2744+76
CNSTI4 640
ASGNI4
line 619
;619:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+2744+80
CNSTI4 480
ASGNI4
line 621
;620:
;621:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 622
;622:	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 623
;623:	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 625
;624:
;625:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 626
;626:        Menu_AddItem( &s_startserver.menu, &s_startserver.autonextmap );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 627
;627:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $521
line 628
;628:	{
line 629
;629:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+824
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 630
;630:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1528
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 631
;631:	}
LABELV $522
line 627
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $521
line 633
;632:
;633:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 634
;634:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 635
;635:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 636
;636:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2496
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 637
;637:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 638
;638:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 639
;639:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+2744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 641
;640:
;641:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 642
;642:}
LABELV $270
endproc StartServer_MenuInit 28 12
export StartServer_Cache
proc StartServer_Cache 104 16
line 651
;643:
;644:
;645:/*
;646:=================
;647:StartServer_Cache
;648:=================
;649:*/
;650:void StartServer_Cache( void )
;651:{
line 658
;652:	int				i;
;653:	const char		*info;
;654:	qboolean		precache;
;655:	char			picname[64];
;656:        char			mapname[ MAX_NAMELENGTH ];
;657:
;658:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $466
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 659
;659:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $483
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 660
;660:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $487
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 661
;661:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $504
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 662
;662:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
ADDRGP4 $294
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 663
;663:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
ADDRGP4 $308
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 664
;664:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 665
;665:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $368
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 666
;666:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $371
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 667
;667:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 668
;668:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $431
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 669
;669:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $449
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 671
;670:
;671:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $535
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 88
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 673
;672:
;673:        if( precache )
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $536
line 674
;674:	{
line 675
;675:		for( i = 0; i < UI_GetNumArenas(); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $541
JUMPV
LABELV $538
line 676
;676:		{
line 677
;677:			info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 96
INDIRP4
ASGNP4
line 678
;678:			Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 679
;679:			Q_strupr( mapname );
ADDRLP4 68
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 681
;680:	
;681:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", mapname );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $149
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 682
;682:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 683
;683:		}
LABELV $539
line 675
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $541
ADDRLP4 96
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $538
line 684
;684:	}
LABELV $536
line 685
;685:}
LABELV $534
endproc StartServer_Cache 104 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 693
;686:
;687:
;688:/*
;689:=================
;690:UI_StartServerMenu
;691:=================
;692:*/
;693:void UI_StartServerMenu( qboolean multiplayer ) {
line 694
;694:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 695
;695:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+2832
ADDRFP4 0
INDIRI4
ASGNI4
line 696
;696:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 697
;697:}
LABELV $542
endproc UI_StartServerMenu 0 4
data
align 4
LABELV playerType_list
address $545
address $546
address $547
byte 4 0
align 4
LABELV playerTeam_list
address $548
address $549
byte 4 0
align 4
LABELV botSkill_list
address $550
address $551
address $552
address $553
address $554
byte 4 0
align 4
LABELV lmsMode_list
address $555
address $556
address $557
address $558
byte 4 0
align 4
LABELV pmove_list
address $559
address $560
address $561
address $562
byte 4 0
code
proc BotAlreadySelected 12 8
line 816
;698:
;699:
;700:
;701:/*
;702:=============================================================================
;703:
;704:SERVER OPTIONS MENU *****
;705:
;706:=============================================================================
;707:*/
;708:
;709:#define ID_PLAYER_TYPE			25
;710:#define ID_MAXCLIENTS			26
;711://#define ID_DEDICATED			27
;712:#define ID_GO					28
;713:#define ID_BACK					29
;714:
;715:#define PLAYER_SLOTS			12
;716:
;717:
;718:typedef struct {
;719:	menuframework_s		menu;
;720:
;721:	menutext_s			banner;
;722:
;723:	menubitmap_s		mappic;
;724:	menubitmap_s		picframe;
;725:
;726://	menulist_s			dedicated;
;727:	menufield_s			timelimit;
;728:	menufield_s			fraglimit;
;729:	menufield_s			flaglimit;
;730:	menuradiobutton_s	friendlyfire;
;731:	menufield_s			hostname;
;732:	menuradiobutton_s	pure;
;733:        menuradiobutton_s	lan;
;734:        menulist_s		pmove;
;735:        //Here are the elimination stuff
;736:        menuradiobutton_s	oneway;
;737:        menuradiobutton_s	instantgib;
;738:        menuradiobutton_s	rockets;
;739:        menulist_s			lmsMode;
;740:	menulist_s			botSkill;
;741:
;742:	menutext_s			player0;
;743:	menulist_s			playerType[PLAYER_SLOTS];
;744:	menutext_s			playerName[PLAYER_SLOTS];
;745:	menulist_s			playerTeam[PLAYER_SLOTS];
;746:
;747:	menubitmap_s		go;
;748:	menubitmap_s		next;
;749:	menubitmap_s		back;
;750:
;751:	qboolean			multiplayer;
;752:	int					gametype;
;753:	char				mapnamebuffer[32];
;754:	char				playerNameBuffers[PLAYER_SLOTS][16];
;755:
;756:	qboolean			newBot;
;757:	int					newBotIndex;
;758:	char				newBotName[16];
;759:	
;760:	//menulist_s		punkbuster;
;761:} serveroptions_t;
;762:
;763:static serveroptions_t s_serveroptions;
;764:
;765:/*static const char *dedicated_list[] = {
;766:	"No",
;767:	"LAN",
;768:	"Internet",
;769:	NULL
;770:};*/
;771:
;772:static const char *playerType_list[] = {
;773:	"Open",
;774:	"Bot",
;775:	"----",
;776:	NULL
;777:};
;778:
;779:static const char *playerTeam_list[] = {
;780:	"Blue",
;781:	"Red",
;782:	NULL
;783:};
;784:
;785:static const char *botSkill_list[] = {
;786:	"I Can Win",
;787:	"Bring It On",
;788:	"Hurt Me Plenty",
;789:	"Hardcore",
;790:	"Nightmare!",
;791:	NULL
;792:};
;793:
;794://Elimiantion - LMS mode
;795:static const char *lmsMode_list[] = {
;796:	"Round+OT",
;797:	"Round-OT",
;798:	"Kill+OT",
;799:	"Kill-OT",
;800:	NULL
;801:};
;802:
;803:static const char *pmove_list[] = {
;804:	"Framerate dependent",
;805:	"Fixed framerate 125Hz",
;806:        "Fixed framerate 91Hz",
;807:	"Accurate",
;808:	NULL
;809:};
;810:
;811:/*
;812:=================
;813:BotAlreadySelected
;814:=================
;815:*/
;816:static qboolean BotAlreadySelected( const char *checkName ) {
line 819
;817:	int		n;
;818:
;819:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $564
line 820
;820:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $568
line 821
;821:			continue;
ADDRGP4 $565
JUMPV
LABELV $568
line 823
;822:		}
;823:		if( (s_serveroptions.gametype >= GT_TEAM) && s_serveroptions.gametype != GT_LMS &&
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $572
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $572
ADDRLP4 4
CNSTI4 96
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+64
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 s_serveroptions+6404
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+64
ADDP4
INDIRI4
EQI4 $572
line 824
;824:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 825
;825:			continue;
ADDRGP4 $565
JUMPV
LABELV $572
line 827
;826:		}
;827:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $581
line 828
;828:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $563
JUMPV
LABELV $581
line 830
;829:		}
;830:	}
LABELV $565
line 819
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $564
line 832
;831:
;832:	return qfalse;
CNSTI4 0
RETI4
LABELV $563
endproc BotAlreadySelected 12 8
proc ServerOptions_Start 192 24
line 841
;833:}
;834:
;835:
;836:/*
;837:=================
;838:ServerOptions_Start
;839:=================
;840:*/
;841:static void ServerOptions_Start( void ) {
line 861
;842:	int		timelimit;
;843:	int		fraglimit;
;844:	int		maxclients;
;845://	int		dedicated;
;846:	int		friendlyfire;
;847:	int		flaglimit;
;848:	int		pure;
;849:        int             pmove;
;850:        int             lan;
;851:        int             instantgib;
;852:        int             rockets;
;853:        int             oneway;
;854:        int             lmsMode;
;855:	int		skill;
;856:	int		n;
;857:        const char		*info;
;858:	char	buf[64];
;859:
;860:
;861:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+664+60+12
ARGP4
ADDRLP4 124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 124
INDIRI4
ASGNI4
line 862
;862:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+996+60+12
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 128
INDIRI4
ASGNI4
line 863
;863:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 132
INDIRI4
ASGNI4
line 865
;864://	dedicated	 = s_serveroptions.dedicated.curvalue;
;865:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 88
ADDRGP4 s_serveroptions+1660+60
INDIRI4
ASGNI4
line 866
;866:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 96
ADDRGP4 s_serveroptions+2056+60
INDIRI4
ASGNI4
line 867
;867:        lan              = s_serveroptions.lan.curvalue;
ADDRLP4 100
ADDRGP4 s_serveroptions+2120+60
INDIRI4
ASGNI4
line 868
;868:        pmove            = s_serveroptions.pmove.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+2184+64
INDIRI4
ASGNI4
line 869
;869:        instantgib       = s_serveroptions.instantgib.curvalue;
ADDRLP4 104
ADDRGP4 s_serveroptions+2344+60
INDIRI4
ASGNI4
line 870
;870:        rockets          = s_serveroptions.rockets.curvalue;
ADDRLP4 108
ADDRGP4 s_serveroptions+2408+60
INDIRI4
ASGNI4
line 871
;871:        oneway		 = s_serveroptions.oneway.curvalue;
ADDRLP4 112
ADDRGP4 s_serveroptions+2280+60
INDIRI4
ASGNI4
line 873
;872:        //Sago: For some reason you need to add 1 to curvalue to get the UI to show the right thing (fixed?)
;873:        lmsMode          = s_serveroptions.lmsMode.curvalue; //+1;
ADDRLP4 116
ADDRGP4 s_serveroptions+2472+64
INDIRI4
ASGNI4
line 874
;874:	skill		 = s_serveroptions.botSkill.curvalue + 1;
ADDRLP4 72
ADDRGP4 s_serveroptions+2568+64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 877
;875:
;876:	//set maxclients
;877:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 136
INDIRI4
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 878
;878:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $616
line 879
;879:			continue;
ADDRGP4 $613
JUMPV
LABELV $616
line 881
;880:		}
;881:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $620
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $620
line 882
;882:			continue;
ADDRGP4 $613
JUMPV
LABELV $620
line 884
;883:		}
;884:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 885
;885:	}
LABELV $613
line 877
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $615
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $612
line 887
;886:
;887:	switch( s_serveroptions.gametype ) {
ADDRLP4 140
ADDRGP4 s_serveroptions+6172
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $625
ADDRLP4 140
INDIRI4
CNSTI4 11
GTI4 $625
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $667
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $667
address $628
address $631
address $625
address $634
address $638
address $642
address $646
address $650
address $654
address $657
address $660
address $663
code
LABELV $628
LABELV $625
line 890
;888:	case GT_FFA:
;889:	default:
;890:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $629
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 891
;891:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $630
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 892
;892:		break;
ADDRGP4 $626
JUMPV
LABELV $631
line 895
;893:
;894:	case GT_TOURNAMENT:
;895:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $632
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 896
;896:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $633
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 897
;897:		break;
ADDRGP4 $626
JUMPV
LABELV $634
line 900
;898:
;899:	case GT_TEAM:
;900:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $635
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 901
;901:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $636
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 902
;902:		trap_Cvar_SetValue( "ui_team_friendlt", friendlyfire );
ADDRGP4 $637
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 903
;903:		break;
ADDRGP4 $626
JUMPV
LABELV $638
line 906
;904:
;905:	case GT_CTF:
;906:		trap_Cvar_SetValue( "ui_ctf_fraglimit", fraglimit );
ADDRGP4 $639
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 907
;907:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $640
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 908
;908:		trap_Cvar_SetValue( "ui_ctf_friendlt", friendlyfire );
ADDRGP4 $641
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 909
;909:		break;
ADDRGP4 $626
JUMPV
LABELV $642
line 912
;910:                
;911:        case GT_1FCTF:
;912:		trap_Cvar_SetValue( "ui_1fctf_capturelimit", fraglimit );
ADDRGP4 $643
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 913
;913:		trap_Cvar_SetValue( "ui_1fctf_timelimit", timelimit );
ADDRGP4 $644
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 914
;914:		trap_Cvar_SetValue( "ui_1fctf_friendlt", friendlyfire );
ADDRGP4 $645
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 915
;915:		break;
ADDRGP4 $626
JUMPV
LABELV $646
line 918
;916:                
;917:        case GT_OBELISK:
;918:		trap_Cvar_SetValue( "ui_overload_capturelimit", fraglimit );
ADDRGP4 $647
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 919
;919:		trap_Cvar_SetValue( "ui_overload_timelimit", timelimit );
ADDRGP4 $648
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 920
;920:		trap_Cvar_SetValue( "ui_overload_friendlt", friendlyfire );
ADDRGP4 $649
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 921
;921:		break;
ADDRGP4 $626
JUMPV
LABELV $650
line 924
;922:                
;923:        case GT_HARVESTER:
;924:		trap_Cvar_SetValue( "ui_harvester_capturelimit", fraglimit );
ADDRGP4 $651
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 925
;925:		trap_Cvar_SetValue( "ui_harvester_timelimit", timelimit );
ADDRGP4 $652
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 926
;926:		trap_Cvar_SetValue( "ui_harvester_friendlt", friendlyfire );
ADDRGP4 $653
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 927
;927:		break;
ADDRGP4 $626
JUMPV
LABELV $654
line 930
;928:
;929:	case GT_ELIMINATION:
;930:		trap_Cvar_SetValue( "ui_elimination_capturelimit", fraglimit );
ADDRGP4 $655
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 931
;931:		trap_Cvar_SetValue( "ui_elimination_timelimit", timelimit );
ADDRGP4 $656
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 933
;932:		//trap_Cvar_SetValue( "ui_elimination_friendlt", friendlyfire );
;933:		break;
ADDRGP4 $626
JUMPV
LABELV $657
line 936
;934:
;935:	case GT_CTF_ELIMINATION:
;936:		trap_Cvar_SetValue( "ui_ctf_elimination_capturelimit", fraglimit );
ADDRGP4 $658
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 937
;937:		trap_Cvar_SetValue( "ui_ctf_elimination_timelimit", timelimit );
ADDRGP4 $659
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 939
;938:		//trap_Cvar_SetValue( "ui_ctf_elimination_friendlt", friendlyfire );
;939:		break;
ADDRGP4 $626
JUMPV
LABELV $660
line 942
;940:
;941:	case GT_LMS:
;942:		trap_Cvar_SetValue( "ui_lms_fraglimit", fraglimit );
ADDRGP4 $661
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 943
;943:		trap_Cvar_SetValue( "ui_lms_timelimit", timelimit );
ADDRGP4 $662
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 944
;944:		break;
ADDRGP4 $626
JUMPV
LABELV $663
line 947
;945:
;946:	case GT_DOUBLE_D:
;947:		trap_Cvar_SetValue( "ui_dd_capturelimit", fraglimit );
ADDRGP4 $664
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 948
;948:		trap_Cvar_SetValue( "ui_dd_timelimit", timelimit );
ADDRGP4 $665
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 949
;949:		trap_Cvar_SetValue( "ui_dd_friendlt", friendlyfire );
ADDRGP4 $666
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 950
;950:		break;
LABELV $626
line 953
;951:	}
;952:
;953:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 144
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $668
ARGP4
ADDRLP4 144
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 955
;954://	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
;955:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 148
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $669
ARGP4
ADDRLP4 152
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 956
;956:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 156
ADDRLP4 80
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $670
ARGP4
ADDRLP4 160
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 957
;957:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 164
ADDRLP4 84
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 164
INDIRF4
ARGF4
ADDRLP4 164
INDIRF4
ARGF4
ADDRLP4 168
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $671
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 958
;958:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $672
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 959
;959:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $673
ARGP4
ADDRLP4 96
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 960
;960:        trap_Cvar_SetValue( "sv_lanForceRate", lan );
ADDRGP4 $674
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 961
;961:        trap_Cvar_SetValue( "g_instantgib", instantgib );
ADDRGP4 $675
ARGP4
ADDRLP4 104
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 962
;962:        trap_Cvar_SetValue( "g_rockets", rockets );
ADDRGP4 $676
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 963
;963:        trap_Cvar_SetValue( "g_lms_mode", lmsMode);
ADDRGP4 $677
ARGP4
ADDRLP4 116
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 964
;964:        trap_Cvar_SetValue( "elimination_ctf_oneway", oneway );
ADDRGP4 $678
ARGP4
ADDRLP4 112
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 965
;965:        switch(pmove) {
ADDRLP4 172
ADDRLP4 92
INDIRI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 1
EQI4 $681
ADDRLP4 172
INDIRI4
CNSTI4 2
EQI4 $685
ADDRLP4 172
INDIRI4
CNSTI4 3
EQI4 $686
ADDRGP4 $679
JUMPV
LABELV $681
line 968
;966:            case 1:
;967:                //Fixed framerate 125 Hz
;968:                trap_Cvar_SetValue( "pmove_fixed", 1);
ADDRGP4 $682
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 969
;969:                trap_Cvar_SetValue( "pmove_msec", 8);
ADDRGP4 $683
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 970
;970:                trap_Cvar_SetValue( "pmove_float", 0);
ADDRGP4 $684
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 971
;971:                break;
ADDRGP4 $680
JUMPV
LABELV $685
line 974
;972:            case 2:
;973:                //Fixed framerate 91 Hz
;974:                trap_Cvar_SetValue( "pmove_fixed", 1);
ADDRGP4 $682
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 975
;975:                trap_Cvar_SetValue( "pmove_msec", 11);
ADDRGP4 $683
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 976
;976:                trap_Cvar_SetValue( "pmove_float", 0);
ADDRGP4 $684
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 977
;977:                break;
ADDRGP4 $680
JUMPV
LABELV $686
line 980
;978:            case 3:
;979:                //Accurate physics
;980:                trap_Cvar_SetValue( "pmove_fixed", 0);
ADDRGP4 $682
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 981
;981:                trap_Cvar_SetValue( "pmove_float", 1);
ADDRGP4 $684
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 982
;982:                break;
ADDRGP4 $680
JUMPV
LABELV $679
line 985
;983:            default:
;984:                //Framerate dependent
;985:                trap_Cvar_SetValue( "pmove_fixed", 0);
ADDRGP4 $682
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 986
;986:                trap_Cvar_SetValue( "pmove_float", 0);
ADDRGP4 $684
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 987
;987:                break;
LABELV $680
line 988
;988:        };
line 989
;989:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );
ADDRGP4 $687
ARGP4
ADDRGP4 s_serveroptions+1724+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 992
;990:
;991:	// the wait commands will allow the dedicated to take effect
;992:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 176
INDIRP4
ASGNP4
line 993
;993:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", Info_ValueForKey( info, "map" )));
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 180
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $693
ARGP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 184
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 996
;994:	
;995:        // add bots
;996:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $694
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 997
;997:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $695
line 998
;998:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $699
line 999
;999:			continue;
ADDRGP4 $696
JUMPV
LABELV $699
line 1001
;1000:		}
;1001:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $703
line 1002
;1002:			continue;
ADDRGP4 $696
JUMPV
LABELV $703
line 1004
;1003:		}
;1004:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $706
line 1005
;1005:			continue;
ADDRGP4 $696
JUMPV
LABELV $706
line 1007
;1006:		}
;1007:		if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $709
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $709
line 1008
;1008:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n], skill,
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $713
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1010
;1009:				playerTeam_list[s_serveroptions.playerTeam[n].curvalue] );
;1010:		}
ADDRGP4 $710
JUMPV
LABELV $709
line 1011
;1011:		else {
line 1012
;1012:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n], skill );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $717
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1013
;1013:		}
LABELV $710
line 1014
;1014:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1015
;1015:	}
LABELV $696
line 997
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $695
line 1018
;1016:
;1017:	// set player's team
;1018:	if( /*dedicated == 0 &&*/ s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $719
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $719
line 1019
;1019:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait 5; team %s\n", playerTeam_list[s_serveroptions.playerTeam[0].curvalue] ) );
ADDRGP4 $723
ARGP4
ADDRGP4 s_serveroptions+4752+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1020
;1020:	}
LABELV $719
line 1021
;1021:}
LABELV $584
endproc ServerOptions_Start 192 24
proc ServerOptions_InitPlayerItems 16 12
line 1029
;1022:
;1023:
;1024:/*
;1025:=================
;1026:ServerOptions_InitPlayerItems
;1027:=================
;1028:*/
;1029:static void ServerOptions_InitPlayerItems( void ) {
line 1034
;1030:	int		n;
;1031:	int		v;
;1032:
;1033:	// init types
;1034:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6168
INDIRI4
CNSTI4 0
EQI4 $727
line 1035
;1035:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1036
;1036:	}
ADDRGP4 $728
JUMPV
LABELV $727
line 1037
;1037:	else {
line 1038
;1038:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1039
;1039:	}
LABELV $728
line 1041
;1040:	
;1041:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $730
line 1042
;1042:		s_serveroptions.playerType[n].curvalue = v;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1043
;1043:	}
LABELV $731
line 1041
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $730
line 1045
;1044:
;1045:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TEAM || s_serveroptions.gametype == GT_LMS ) ) {
ADDRGP4 s_serveroptions+6168
INDIRI4
CNSTI4 0
EQI4 $736
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $741
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $736
LABELV $741
line 1046
;1046:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $742
line 1047
;1047:			s_serveroptions.playerType[n].curvalue = 2;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
CNSTI4 2
ASGNI4
line 1048
;1048:		}
LABELV $743
line 1046
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $742
line 1049
;1049:	}
LABELV $736
line 1054
;1050:
;1051:	// if not a dedicated server, first slot is reserved for the human on the server
;1052://	if( s_serveroptions.dedicated.curvalue == 0 ) {
;1053:		// human
;1054:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2736+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1055
;1055:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2736+64
CNSTI4 0
ASGNI4
line 1056
;1056:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $752
ARGP4
ADDRGP4 s_serveroptions+6208
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1057
;1057:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+6208
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1061
;1058://	}
;1059:
;1060:	// init teams
;1061:	if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $756
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $756
line 1062
;1062:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $760
line 1063
;1063:			s_serveroptions.playerTeam[n].curvalue = 0;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+64
ADDP4
CNSTI4 0
ASGNI4
line 1064
;1064:		}
LABELV $761
line 1062
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $760
line 1065
;1065:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $769
JUMPV
LABELV $766
line 1066
;1066:			s_serveroptions.playerTeam[n].curvalue = 1;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+64
ADDP4
CNSTI4 1
ASGNI4
line 1067
;1067:		}
LABELV $767
line 1065
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $769
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $766
line 1068
;1068:	}
ADDRGP4 $757
JUMPV
LABELV $756
line 1069
;1069:	else {
line 1070
;1070:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $772
line 1071
;1071:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1072
;1072:		}
LABELV $773
line 1070
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $772
line 1073
;1073:	}
LABELV $757
line 1074
;1074:}
LABELV $726
endproc ServerOptions_InitPlayerItems 16 12
proc ServerOptions_SetPlayerItems 16 0
line 1082
;1075:
;1076:
;1077:/*
;1078:=================
;1079:ServerOptions_SetPlayerItems
;1080:=================
;1081:*/
;1082:static void ServerOptions_SetPlayerItems( void ) {
line 1095
;1083:	int		start;
;1084:	int		n;
;1085:
;1086:	// types
;1087://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;1088://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;1089://			s_serveroptions.playerType[n].curvalue = 1;
;1090://		}
;1091://	}
;1092:
;1093:	// names
;1094://	if( s_serveroptions.dedicated.curvalue == 0 ) {
;1095:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2664+60
ADDRGP4 $781
ASGNP4
line 1096
;1096:		s_serveroptions.playerName[0].generic.flags &= ~((unsigned int)QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 s_serveroptions+3888+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 1098
;1097:
;1098:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1104
;1099:/*	}
;1100:	else {
;1101:		s_serveroptions.player0.string = "Open";
;1102:		start = 0;
;1103:	}*/
;1104:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $784
line 1105
;1105:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $788
line 1106
;1106:			s_serveroptions.playerName[n].generic.flags &= ~( (unsigned int)(QMF_INACTIVE|QMF_HIDDEN));
ADDRLP4 12
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1107
;1107:		}
ADDRGP4 $789
JUMPV
LABELV $788
line 1108
;1108:		else {
line 1109
;1109:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1110
;1110:		}
LABELV $789
line 1111
;1111:	}
LABELV $785
line 1104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $787
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $784
line 1114
;1112:
;1113:	// teams
;1114:	if( s_serveroptions.gametype < GT_TEAM || s_serveroptions.gametype == GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $800
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $796
LABELV $800
line 1115
;1115:		return;
ADDRGP4 $778
JUMPV
LABELV $796
line 1117
;1116:	}
;1117:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $804
JUMPV
LABELV $801
line 1118
;1118:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $805
line 1119
;1119:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1120
;1120:		}
ADDRGP4 $806
JUMPV
LABELV $805
line 1121
;1121:		else {
line 1122
;1122:			s_serveroptions.playerTeam[n].generic.flags &= ~((unsigned int) (QMF_INACTIVE|QMF_HIDDEN));
ADDRLP4 12
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1123
;1123:		}
LABELV $806
line 1124
;1124:	}
LABELV $802
line 1117
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $804
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $801
line 1125
;1125:}
LABELV $778
endproc ServerOptions_SetPlayerItems 16 0
proc ServerOptions_Event 8 0
line 1133
;1126:
;1127:
;1128:/*
;1129:=================
;1130:ServerOptions_Event
;1131:=================
;1132:*/
;1133:static void ServerOptions_Event( void* ptr, int event ) {
line 1134
;1134:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 22
LTI4 $814
ADDRLP4 0
INDIRI4
CNSTI4 29
GTI4 $814
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $830-88
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $830
address $824
address $814
address $814
address $817
address $820
address $814
address $821
address $827
code
LABELV $817
line 1140
;1135:	
;1136:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;1137:	//	return;
;1138:	//}
;1139:	case ID_PLAYER_TYPE:
;1140:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $818
line 1141
;1141:			break;
ADDRGP4 $815
JUMPV
LABELV $818
line 1143
;1142:		}
;1143:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1144
;1144:		break;
ADDRGP4 $815
JUMPV
LABELV $820
line 1148
;1145:
;1146:	case ID_MAXCLIENTS:
;1147://	case ID_DEDICATED:
;1148:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1149
;1149:		break;
ADDRGP4 $815
JUMPV
LABELV $821
line 1151
;1150:	case ID_GO:
;1151:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $822
line 1152
;1152:			break;
ADDRGP4 $815
JUMPV
LABELV $822
line 1154
;1153:		}
;1154:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 1155
;1155:		break;
ADDRGP4 $815
JUMPV
LABELV $824
line 1158
;1156:
;1157:	case ID_STARTSERVERNEXT:
;1158:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $815
line 1159
;1159:			break;
ADDRGP4 $815
JUMPV
line 1161
;1160:		}
;1161:		break;
LABELV $827
line 1163
;1162:	case ID_BACK:
;1163:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $828
line 1164
;1164:			break;
ADDRGP4 $815
JUMPV
LABELV $828
line 1166
;1165:		}
;1166:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1167
;1167:		break;
LABELV $814
LABELV $815
line 1169
;1168:	}
;1169:}
LABELV $813
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 1172
;1170:
;1171:
;1172:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 1175
;1173:	int		n;
;1174:
;1175:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $833
line 1176
;1176:		return;
ADDRGP4 $832
JUMPV
LABELV $833
line 1178
;1177:	}
;1178:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1179
;1179:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+6404
ADDRLP4 0
INDIRI4
ASGNI4
line 1180
;1180:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 1181
;1181:}
LABELV $832
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 0 20
line 1189
;1182:
;1183:
;1184:/*
;1185:=================
;1186:ServerOptions_StatusBar
;1187:=================
;1188:*/
;1189:static void ServerOptions_StatusBar( void* ptr ) {
line 1190
;1190:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $838
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1191
;1191:}
LABELV $837
endproc ServerOptions_StatusBar 0 20
proc ServerOptions_StatusBar_Instantgib 0 20
line 1198
;1192:
;1193:/*
;1194:=================
;1195:ServerOptions_StatusBar_Instantgib
;1196:=================
;1197:*/
;1198:static void ServerOptions_StatusBar_Instantgib( void* ptr ) {
line 1199
;1199:		UI_DrawString( 320, 440, "Only railgun and instant kill", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $840
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1200
;1200:}
LABELV $839
endproc ServerOptions_StatusBar_Instantgib 0 20
proc ServerOptions_StatusBar_Allrockets 0 20
line 1207
;1201:
;1202:/*
;1203:=================
;1204:ServerOptions_StatusBar_Allrockets
;1205:=================
;1206:*/
;1207:static void ServerOptions_StatusBar_Allrockets( void* ptr ) {
line 1208
;1208:		UI_DrawString( 320, 440, "Only Rocket launcher with Inf. ammo", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $842
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1209
;1209:}
LABELV $841
endproc ServerOptions_StatusBar_Allrockets 0 20
proc ServerOptions_StatusBar_Pure 0 20
line 1216
;1210:
;1211:/*
;1212:=================
;1213:ServerOptions_StatusBar_Pure
;1214:=================
;1215:*/
;1216:static void ServerOptions_StatusBar_Pure( void* ptr ) {
line 1217
;1217:		UI_DrawString( 320, 440, "Require identical pk3 files", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $844
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1218
;1218:}
LABELV $843
endproc ServerOptions_StatusBar_Pure 0 20
proc ServerOptions_StatusBar_Oneway 0 20
line 1225
;1219:
;1220:/*
;1221:=================
;1222:ServerOptions_StatusBar_Oneway
;1223:=================
;1224:*/
;1225:static void ServerOptions_StatusBar_Oneway( void* ptr ) {
line 1226
;1226:		UI_DrawString( 320, 440, "Only one team can capture in a round", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $846
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1227
;1227:}
LABELV $845
endproc ServerOptions_StatusBar_Oneway 0 20
proc ServerOptions_StatusBar_Pmove 8 20
line 1234
;1228:
;1229:/*
;1230:=================
;1231:ServerOptions_StatusBar_Pmove
;1232:=================
;1233:*/
;1234:static void ServerOptions_StatusBar_Pmove( void* ptr ) {
line 1235
;1235:    switch( ((menulist_s*)ptr)->curvalue ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $848
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $848
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $860
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $860
address $851
address $854
address $854
address $857
code
LABELV $851
line 1237
;1236:        case 0:
;1237:            UI_DrawString( 320, 440, "Physics depends on players framerates", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $852
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1238
;1238:            UI_DrawString( 320, 460, "Not all players are equal", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $853
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1239
;1239:            break;
ADDRGP4 $849
JUMPV
LABELV $854
line 1242
;1240:        case 1:
;1241:        case 2:
;1242:            UI_DrawString( 320, 440, "Physics are calculated at fixed intervals", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $855
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1243
;1243:            UI_DrawString( 320, 460, "All players are equal", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $856
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1244
;1244:            break;
ADDRGP4 $849
JUMPV
LABELV $857
line 1246
;1245:        case 3:
;1246:            UI_DrawString( 320, 440, "Physics are calculated exactly", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $858
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1247
;1247:            UI_DrawString( 320, 460, "All players are equal", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $856
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1248
;1248:            break;
ADDRGP4 $849
JUMPV
LABELV $848
line 1250
;1249:	default:
;1250:            UI_DrawString( 320, 440, "Framerate dependent or not", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $859
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1251
;1251:            break;
LABELV $849
line 1254
;1252:    }
;1253:            
;1254:}
LABELV $847
endproc ServerOptions_StatusBar_Pmove 8 20
proc ServerOptions_LevelshotDraw 20 20
line 1262
;1255:
;1256:
;1257:/*
;1258:===============
;1259:ServerOptions_LevelshotDraw
;1260:===============
;1261:*/
;1262:static void ServerOptions_LevelshotDraw( void *self ) {
line 1268
;1263:	menubitmap_s	*b;
;1264:	int				x;
;1265:	int				y;
;1266:
;1267:	// strange place for this, but it works
;1268:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+6400
INDIRI4
CNSTI4 0
EQI4 $862
line 1269
;1269:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+6404
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 s_serveroptions+6408
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1270
;1270:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+6400
CNSTI4 0
ASGNI4
line 1271
;1271:	}
LABELV $862
line 1273
;1272:
;1273:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1275
;1274:
;1275:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 1277
;1276:
;1277:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1278
;1278:	y = b->generic.y + b->height;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1279
;1279:	UI_FillRect( x, y, b->width, 40, colorBlack );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1281
;1280:
;1281:	x += b->width / 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1282
;1282:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1283
;1283:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+6176
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1285
;1284:
;1285:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1286
;1286:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 s_serveroptions+6172
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_remap2
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1287
;1287:}
LABELV $861
endproc ServerOptions_LevelshotDraw 20 20
proc ServerOptions_InitBotNames 1076 12
line 1290
;1288:
;1289:
;1290:static void ServerOptions_InitBotNames( void ) {
line 1300
;1291:	int			count;
;1292:	int			n;
;1293:	const char	*arenaInfo;
;1294:	const char	*botInfo;
;1295:	char		*p;
;1296:	char		*bot;
;1297:	char		bots[MAX_INFO_STRING];
;1298:
;1299:	//this SHOULD work
;1300:	if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $872
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $872
line 1301
;1301:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "gargoyle", 16 );
ADDRGP4 s_serveroptions+6208+16
ARGP4
ADDRGP4 $878
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1302
;1302:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "kyonshi", 16 );
ADDRGP4 s_serveroptions+6208+32
ARGP4
ADDRGP4 $881
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1303
;1303:		Q_strncpyz( s_serveroptions.playerNameBuffers[3], "grism", 16 );
ADDRGP4 s_serveroptions+6208+48
ARGP4
ADDRGP4 $884
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1304
;1304:                if( s_serveroptions.gametype != GT_TEAM ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
EQI4 $885
line 1305
;1305:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2736+288+64
CNSTI4 2
ASGNI4
line 1306
;1306:		}
LABELV $885
line 1307
;1307:                Q_strncpyz( s_serveroptions.playerNameBuffers[4], "merman", 16 );
ADDRGP4 s_serveroptions+6208+64
ARGP4
ADDRGP4 $893
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1308
;1308:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2736+384+64
CNSTI4 2
ASGNI4
line 1309
;1309:                Q_strncpyz( s_serveroptions.playerNameBuffers[5], "skelebot", 16 );
ADDRGP4 s_serveroptions+6208+80
ARGP4
ADDRGP4 $899
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1310
;1310:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2736+480+64
CNSTI4 2
ASGNI4
line 1312
;1311:
;1312:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sergei", 16 );
ADDRGP4 s_serveroptions+6208+96
ARGP4
ADDRGP4 $905
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1313
;1313:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "assassin", 16 );
ADDRGP4 s_serveroptions+6208+112
ARGP4
ADDRGP4 $908
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1314
;1314:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "grunt", 16 );
ADDRGP4 s_serveroptions+6208+128
ARGP4
ADDRGP4 $911
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1315
;1315:                Q_strncpyz( s_serveroptions.playerNameBuffers[9], "skelebot", 16 );
ADDRGP4 s_serveroptions+6208+144
ARGP4
ADDRGP4 $899
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1316
;1316:		if( s_serveroptions.gametype != GT_TEAM ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
EQI4 $914
line 1317
;1317:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2736+864+64
CNSTI4 2
ASGNI4
line 1318
;1318:		}
LABELV $914
line 1319
;1319:                Q_strncpyz( s_serveroptions.playerNameBuffers[10], "merman", 16 );
ADDRGP4 s_serveroptions+6208+160
ARGP4
ADDRGP4 $893
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1320
;1320:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2736+960+64
CNSTI4 2
ASGNI4
line 1321
;1321:                Q_strncpyz( s_serveroptions.playerNameBuffers[11], "skelebot", 16 );
ADDRGP4 s_serveroptions+6208+176
ARGP4
ADDRGP4 $899
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1322
;1322:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2736+1056+64
CNSTI4 2
ASGNI4
line 1324
;1323:
;1324:		return;
ADDRGP4 $871
JUMPV
LABELV $872
line 1327
;1325:	}
;1326:
;1327:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1330
;1328:
;1329:	// get info for this map
;1330:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6176
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1333
;1331:
;1332:	// get the bot info - we'll seed with them if any are listed
;1333:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $931
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1334
;1334:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $933
JUMPV
line 1335
;1335:	while( *p && count < PLAYER_SLOTS ) {
LABELV $935
line 1337
;1336:		//skip spaces
;1337:		while( *p && *p == ' ' ) {
line 1338
;1338:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1339
;1339:		}
LABELV $936
line 1337
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $938
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $935
LABELV $938
line 1340
;1340:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $939
line 1341
;1341:			break;
ADDRGP4 $934
JUMPV
LABELV $939
line 1345
;1342:		}
;1343:
;1344:		// mark start of bot name
;1345:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $942
JUMPV
LABELV $941
line 1348
;1346:
;1347:		// skip until space of null
;1348:		while( *p && *p != ' ' ) {
line 1349
;1349:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1350
;1350:		}
LABELV $942
line 1348
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $944
ADDRLP4 1060
INDIRI4
CNSTI4 32
NEI4 $941
LABELV $944
line 1351
;1351:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $945
line 1352
;1352:			*p++ = 0;
ADDRLP4 1064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1064
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI1 0
ASGNI1
line 1353
;1353:		}
LABELV $945
line 1355
;1354:
;1355:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1064
INDIRP4
ASGNP4
line 1356
;1356:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1068
INDIRP4
ASGNP4
line 1358
;1357:                
;1358:                if(!Q_stricmp(bot,""))
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $949
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $947
line 1359
;1359:                    bot = "Sarge"; 
ADDRLP4 8
ADDRGP4 $950
ASGNP4
LABELV $947
line 1361
;1360:
;1361:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1362
;1362:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1363
;1363:	}
LABELV $933
line 1335
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $953
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $936
LABELV $953
LABELV $934
line 1366
;1364:
;1365:	// set the rest of the bot slots to to other bots
;1366:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $957
JUMPV
LABELV $954
line 1367
;1367:		switch(n%4){
ADDRLP4 1056
ADDRLP4 12
INDIRI4
CNSTI4 4
MODI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $961
ADDRLP4 1056
INDIRI4
CNSTI4 1
EQI4 $964
ADDRLP4 1056
INDIRI4
CNSTI4 2
EQI4 $967
ADDRGP4 $958
JUMPV
LABELV $961
line 1369
;1368:                 case 0:
;1369:                    strcpy( s_serveroptions.playerNameBuffers[n], "Grunt" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 $963
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1370
;1370:                     break;
ADDRGP4 $959
JUMPV
LABELV $964
line 1372
;1371:                 case 1:
;1372:                     strcpy( s_serveroptions.playerNameBuffers[n], "Merman" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 $966
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1373
;1373:                     break;
ADDRGP4 $959
JUMPV
LABELV $967
line 1375
;1374:                 case 2:
;1375:                     strcpy( s_serveroptions.playerNameBuffers[n], "Kyonshi" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 $969
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1376
;1376:                     break;
ADDRGP4 $959
JUMPV
LABELV $958
line 1378
;1377:                 default:
;1378:                     strcpy( s_serveroptions.playerNameBuffers[n], "Skelebot" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ARGP4
ADDRGP4 $971
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1379
;1379:             }
LABELV $959
line 1380
;1380:	}
LABELV $955
line 1366
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $957
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $954
line 1383
;1381:
;1382:	// pad up to #8 as open slots
;1383:	for( ;count < 8; count++ ) {
ADDRGP4 $975
JUMPV
LABELV $972
line 1384
;1384:		s_serveroptions.playerType[count].curvalue = 0;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
CNSTI4 0
ASGNI4
line 1385
;1385:	}
LABELV $973
line 1383
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $975
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $972
line 1388
;1386:
;1387:	// close off the rest by default
;1388:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $981
JUMPV
LABELV $978
line 1389
;1389:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $982
line 1390
;1390:			s_serveroptions.playerType[count].curvalue = 2;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+64
ADDP4
CNSTI4 2
ASGNI4
line 1391
;1391:		}
LABELV $982
line 1392
;1392:	}
LABELV $979
line 1388
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $981
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $978
line 1393
;1393:}
LABELV $871
endproc ServerOptions_InitBotNames 1076 12
bss
align 1
LABELV $989
skip 64
code
proc ServerOptions_SetMenuItems 256 16
line 1401
;1394:
;1395:
;1396:/*
;1397:=================
;1398:ServerOptions_SetMenuItems
;1399:=================
;1400:*/
;1401:static void ServerOptions_SetMenuItems( void ) {
line 1405
;1402:	static char picname[64];
;1403:        const char *info;
;1404:
;1405:	switch( s_serveroptions.gametype ) {
ADDRLP4 4
ADDRGP4 s_serveroptions+6172
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $990
ADDRLP4 4
INDIRI4
CNSTI4 12
GTI4 $990
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1102
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1102
address $993
address $1001
address $990
address $1008
address $1018
address $1029
address $1039
address $1049
address $1059
address $1066
address $1073
address $1080
address $1090
code
LABELV $993
LABELV $990
line 1408
;1406:	case GT_FFA:
;1407:	default:
;1408:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $629
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1409
;1409:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $630
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 20
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1410
;1410:		break;
ADDRGP4 $991
JUMPV
LABELV $1001
line 1413
;1411:
;1412:	case GT_TOURNAMENT:
;1413:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $632
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 28
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1414
;1414:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $633
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1415
;1415:		break;
ADDRGP4 $991
JUMPV
LABELV $1008
line 1418
;1416:
;1417:	case GT_TEAM:
;1418:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $635
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1419
;1419:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $636
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 52
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1420
;1420:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $1017
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 1421
;1421:		break;
ADDRGP4 $991
JUMPV
LABELV $1018
line 1424
;1422:
;1423:	case GT_CTF:
;1424:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $1022
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 68
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1425
;1425:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $640
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 76
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1426
;1426:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $1028
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 1427
;1427:		break;
ADDRGP4 $991
JUMPV
LABELV $1029
line 1430
;1428:                
;1429:        case GT_1FCTF:
;1430:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_1fctf_capturelimit" ) ) );
ADDRGP4 $643
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 92
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1431
;1431:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_1fctf_timelimit" ) ) );
ADDRGP4 $644
ARGP4
ADDRLP4 96
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 100
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1432
;1432:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_1fctf_friendly" ) );
ADDRGP4 $1038
ARGP4
ADDRLP4 104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 104
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 108
INDIRF4
CVFI4 4
ASGNI4
line 1433
;1433:		break;
ADDRGP4 $991
JUMPV
LABELV $1039
line 1436
;1434:                
;1435:        case GT_OBELISK:
;1436:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_overload_capturelimit" ) ) );
ADDRGP4 $647
ARGP4
ADDRLP4 112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 112
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 116
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1437
;1437:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_overload_timelimit" ) ) );
ADDRGP4 $648
ARGP4
ADDRLP4 120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 120
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 124
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1438
;1438:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_overload_friendly" ) );
ADDRGP4 $1048
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 132
INDIRF4
CVFI4 4
ASGNI4
line 1439
;1439:		break;
ADDRGP4 $991
JUMPV
LABELV $1049
line 1442
;1440:                
;1441:        case GT_HARVESTER:
;1442:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_harvester_capturelimit" ) ) );
ADDRGP4 $651
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1443
;1443:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_harvester_timelimit" ) ) );
ADDRGP4 $652
ARGP4
ADDRLP4 144
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1444
;1444:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_harvester_friendly" ) );
ADDRGP4 $1058
ARGP4
ADDRLP4 152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 156
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1445
;1445:		break;
ADDRGP4 $991
JUMPV
LABELV $1059
line 1448
;1446:
;1447:	case GT_ELIMINATION:
;1448:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_elimination_capturelimit" ) ) );
ADDRGP4 $655
ARGP4
ADDRLP4 160
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 160
INDIRF4
ARGF4
ADDRLP4 164
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 164
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1449
;1449:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_elimination_timelimit" ) ) );
ADDRGP4 $656
ARGP4
ADDRLP4 168
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 172
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 172
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1451
;1450:		//s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_elimination_friendly" ) );
;1451:		break;
ADDRGP4 $991
JUMPV
LABELV $1066
line 1454
;1452:
;1453:	case GT_CTF_ELIMINATION:
;1454:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_elimination_capturelimit" ) ) );
ADDRGP4 $658
ARGP4
ADDRLP4 176
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 176
INDIRF4
ARGF4
ADDRLP4 180
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 180
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1455
;1455:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_elimination_timelimit" ) ) );
ADDRGP4 $659
ARGP4
ADDRLP4 184
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 184
INDIRF4
ARGF4
ADDRLP4 188
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 188
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1457
;1456:		//s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_elimination_friendly" ) );
;1457:		break;
ADDRGP4 $991
JUMPV
LABELV $1073
line 1460
;1458:
;1459:	case GT_LMS:
;1460:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_lms_fraglimit" ) ) );
ADDRGP4 $661
ARGP4
ADDRLP4 192
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 192
INDIRF4
ARGF4
ADDRLP4 196
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 196
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1461
;1461:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_lms_timelimit" ) ) );
ADDRGP4 $662
ARGP4
ADDRLP4 200
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 200
INDIRF4
ARGF4
ADDRLP4 204
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 204
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1462
;1462:		break;
ADDRGP4 $991
JUMPV
LABELV $1080
line 1465
;1463:
;1464:	case GT_DOUBLE_D:
;1465:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_dd_capturelimit" ) ) );
ADDRGP4 $664
ARGP4
ADDRLP4 208
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 208
INDIRF4
ARGF4
ADDRLP4 212
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 212
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1466
;1466:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_dd_timelimit" ) ) );
ADDRGP4 $665
ARGP4
ADDRLP4 216
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 216
INDIRF4
ARGF4
ADDRLP4 220
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 220
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1467
;1467:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_dd_friendly" ) );
ADDRGP4 $1089
ARGP4
ADDRLP4 224
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 224
INDIRF4
ARGF4
ADDRLP4 228
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 228
INDIRF4
CVFI4 4
ASGNI4
line 1468
;1468:		break;
ADDRGP4 $991
JUMPV
LABELV $1090
line 1471
;1469:                
;1470:        case GT_DOMINATION:
;1471:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_dom_capturelimit" ) ) );
ADDRGP4 $1094
ARGP4
ADDRLP4 232
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 232
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1328+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 236
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1472
;1472:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_dom_timelimit" ) ) );
ADDRGP4 $1098
ARGP4
ADDRLP4 240
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 240
INDIRF4
ARGF4
ADDRLP4 244
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+664+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $997
ARGP4
ADDRLP4 244
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1473
;1473:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_dom_friendly" ) );
ADDRGP4 $1101
ARGP4
ADDRLP4 248
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 248
INDIRF4
ARGF4
ADDRLP4 252
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1660+60
ADDRLP4 252
INDIRF4
CVFI4 4
ASGNI4
line 1474
;1474:		break;
LABELV $991
line 1478
;1475:
;1476:	}
;1477:
;1478:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $687
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1724+60+12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1479
;1479:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $673
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2056+60
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1480
;1480:        s_serveroptions.lan.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_lanforcerate" ) );
ADDRGP4 $1113
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2120+60
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1481
;1481:        s_serveroptions.instantgib.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "g_instantgib" ) );
ADDRGP4 $675
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2344+60
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1482
;1482:        s_serveroptions.rockets.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "g_rockets" ) );
ADDRGP4 $676
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2408+60
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1483
;1483:        s_serveroptions.lmsMode.curvalue = Com_Clamp( 0, 3, trap_Cvar_VariableValue("g_lms_mode") );
ADDRGP4 $677
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2472+64
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 1484
;1484:        s_serveroptions.oneway.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "elimination_ctf_oneway" ) );
ADDRGP4 $678
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2280+60
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1485
;1485:        s_serveroptions.pmove.curvalue = 0;
ADDRGP4 s_serveroptions+2184+64
CNSTI4 0
ASGNI4
line 1486
;1486:        if(trap_Cvar_VariableValue( "pmove_fixed" ))
ADDRGP4 $682
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $1124
line 1487
;1487:            s_serveroptions.pmove.curvalue = 1;
ADDRGP4 s_serveroptions+2184+64
CNSTI4 1
ASGNI4
LABELV $1124
line 1488
;1488:        if(trap_Cvar_VariableValue( "pmove_fixed" ) && trap_Cvar_VariableValue( "pmove_msec" )==11)
ADDRGP4 $682
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1128
ADDRGP4 $683
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 1093664768
NEF4 $1128
line 1489
;1489:            s_serveroptions.pmove.curvalue = 2;
ADDRGP4 s_serveroptions+2184+64
CNSTI4 2
ASGNI4
LABELV $1128
line 1490
;1490:        if(trap_Cvar_VariableValue( "pmove_float" ))
ADDRGP4 $684
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 0
EQF4 $1132
line 1491
;1491:            s_serveroptions.pmove.curvalue = 3;
ADDRGP4 s_serveroptions+2184+64
CNSTI4 3
ASGNI4
LABELV $1132
line 1494
;1492:
;1493:	// set the map pic
;1494:        info = UI_GetArenaInfoByNumber(s_startserver.maplist[s_startserver.currentmap]);
ADDRGP4 s_startserver+2836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2852
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 1495
;1495:	Com_sprintf( picname, 64, "levelshots/%s", Info_ValueForKey( info, "map") );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 80
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $989
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $149
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1496
;1496:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+488+4
ADDRGP4 $989
ASGNP4
line 1499
;1497:
;1498:	// set the map name
;1499:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+6176
ARGP4
ADDRGP4 s_startserver+2672+60
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1500
;1500:	Q_strupr( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6176
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1503
;1501:
;1502:	// get the player selections initialized
;1503:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1504
;1504:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1507
;1505:
;1506:	// seed bot names
;1507:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1508
;1508:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1509
;1509:}
LABELV $988
endproc ServerOptions_SetMenuItems 256 16
proc PlayerName_Draw 48 20
line 1516
;1510:
;1511:/*
;1512:=================
;1513:PlayerName_Draw
;1514:=================
;1515:*/
;1516:static void PlayerName_Draw( void *item ) {
line 1523
;1517:	menutext_s	*s;
;1518:	float		*color;
;1519:	int			x, y;
;1520:	int			style;
;1521:	qboolean	focus;
;1522:
;1523:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1525
;1524:
;1525:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1526
;1526:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1528
;1527:
;1528:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1529
;1529:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1146
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1147
JUMPV
LABELV $1146
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1147
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1531
;1530:
;1531:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $1148
line 1532
;1532:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $1149
JUMPV
LABELV $1148
line 1533
;1533:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1150
line 1534
;1534:	{
line 1535
;1535:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1536
;1536:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1537
;1537:	}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 1538
;1538:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $1152
line 1539
;1539:	{
line 1540
;1540:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1541
;1541:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1542
;1542:	}
ADDRGP4 $1153
JUMPV
LABELV $1152
line 1544
;1543:	else
;1544:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $1153
LABELV $1151
LABELV $1149
line 1546
;1545:
;1546:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1154
line 1547
;1547:	{
line 1549
;1548:		// draw cursor
;1549:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1550
;1550:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1551
;1551:	}
LABELV $1154
line 1553
;1552:
;1553:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1554
;1554:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1555
;1555:}
LABELV $1144
endproc PlayerName_Draw 48 20
proc ServerOptions_MenuInit 44 12
line 1565
;1556:
;1557:
;1558:/*
;1559:=================
;1560:ServerOptions_MenuInit
;1561:=================
;1562:*/
;1563:#define OPTIONS_X	456
;1564:
;1565:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1569
;1566:	int		y;
;1567:	int		n;
;1568:
;1569:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6424
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1570
;1570:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+6168
ADDRFP4 0
INDIRI4
ASGNI4
line 1572
;1571:	// so the new gametypes work
;1572:	s_serveroptions.gametype = (int)Com_Clamp( 0, GT_MAX_GAME_TYPE - 1, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $244
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6172
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1574
;1573:
;1574:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1576
;1575:
;1576:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+404
CNSTI4 1
ASGNI4
line 1577
;1577:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+408
CNSTI4 1
ASGNI4
line 1579
;1578:
;1579:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+416
CNSTI4 10
ASGNI4
line 1580
;1580:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+416+12
CNSTI4 320
ASGNI4
line 1581
;1581:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+416+16
CNSTI4 16
ASGNI4
line 1582
;1582:	s_serveroptions.banner.string  				= "GAME SERVER";
ADDRGP4 s_serveroptions+416+60
ADDRGP4 $286
ASGNP4
line 1583
;1583:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+416+68
ADDRGP4 color_white
ASGNP4
line 1584
;1584:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+416+64
CNSTI4 1
ASGNI4
line 1586
;1585:
;1586:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+488
CNSTI4 6
ASGNI4
line 1587
;1587:	s_serveroptions.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+488+44
CNSTU4 16388
ASGNU4
line 1588
;1588:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+488+12
CNSTI4 352
ASGNI4
line 1589
;1589:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+488+16
CNSTI4 80
ASGNI4
line 1590
;1590:	s_serveroptions.mappic.width				= 160;
ADDRGP4 s_serveroptions+488+76
CNSTI4 160
ASGNI4
line 1591
;1591:	s_serveroptions.mappic.height				= 120;
ADDRGP4 s_serveroptions+488+80
CNSTI4 120
ASGNI4
line 1592
;1592:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+488+64
ADDRGP4 $371
ASGNP4
line 1593
;1593:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+488+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1595
;1594:
;1595:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+576
CNSTI4 6
ASGNI4
line 1596
;1596:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+576+44
CNSTU4 16452
ASGNU4
line 1597
;1597:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+576+12
CNSTI4 314
ASGNI4
line 1598
;1598:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+576+16
CNSTI4 40
ASGNI4
line 1599
;1599:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+576+76
CNSTI4 320
ASGNI4
line 1600
;1600:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+576+80
CNSTI4 320
ASGNI4
line 1601
;1601:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+576+60
ADDRGP4 $399
ASGNP4
line 1603
;1602:
;1603:	y = 268;
ADDRLP4 4
CNSTI4 268
ASGNI4
line 1604
;1604:	if( s_serveroptions.gametype < GT_CTF || s_serveroptions.gametype== GT_LMS) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 4
LTI4 $1204
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $1200
LABELV $1204
line 1605
;1605:		s_serveroptions.fraglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+996
CNSTI4 4
ASGNI4
line 1606
;1606:		s_serveroptions.fraglimit.generic.name       = "Frag Limit:";
ADDRGP4 s_serveroptions+996+4
ADDRGP4 $1208
ASGNP4
line 1607
;1607:		s_serveroptions.fraglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+996+44
CNSTU4 290
ASGNU4
line 1608
;1608:		s_serveroptions.fraglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+996+12
CNSTI4 456
ASGNI4
line 1609
;1609:		s_serveroptions.fraglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+996+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1610
;1610:		s_serveroptions.fraglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+996+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1611
;1611:		s_serveroptions.fraglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+996+60+8
CNSTI4 3
ASGNI4
line 1612
;1612:		s_serveroptions.fraglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+996+60+268
CNSTI4 3
ASGNI4
line 1613
;1613:	}
ADDRGP4 $1201
JUMPV
LABELV $1200
line 1614
;1614:	else {
line 1615
;1615:		s_serveroptions.flaglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1328
CNSTI4 4
ASGNI4
line 1616
;1616:		s_serveroptions.flaglimit.generic.name       = "Capture Limit:";
ADDRGP4 s_serveroptions+1328+4
ADDRGP4 $1226
ASGNP4
line 1617
;1617:		s_serveroptions.flaglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1328+44
CNSTU4 290
ASGNU4
line 1618
;1618:		s_serveroptions.flaglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+1328+12
CNSTI4 456
ASGNI4
line 1619
;1619:		s_serveroptions.flaglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+1328+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1620
;1620:		s_serveroptions.flaglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+1328+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1621
;1621:		s_serveroptions.flaglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+1328+60+8
CNSTI4 3
ASGNI4
line 1622
;1622:		s_serveroptions.flaglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+1328+60+268
CNSTI4 3
ASGNI4
line 1623
;1623:	}
LABELV $1201
line 1625
;1624:
;1625:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1626
;1626:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+664
CNSTI4 4
ASGNI4
line 1627
;1627:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+664+4
ADDRGP4 $1244
ASGNP4
line 1628
;1628:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+664+44
CNSTU4 290
ASGNU4
line 1629
;1629:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+664+12
CNSTI4 456
ASGNI4
line 1630
;1630:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+664+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1631
;1631:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+664+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1632
;1632:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+664+60+8
CNSTI4 3
ASGNI4
line 1633
;1633:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+664+60+268
CNSTI4 3
ASGNI4
line 1635
;1634:
;1635:	if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS && s_serveroptions.gametype != GT_ELIMINATION && s_serveroptions.gametype != GT_CTF_ELIMINATION) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $1259
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $1259
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 8
EQI4 $1259
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 9
EQI4 $1259
line 1636
;1636:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1637
;1637:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1660
CNSTI4 5
ASGNI4
line 1638
;1638:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1660+44
CNSTU4 258
ASGNU4
line 1639
;1639:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1660+12
CNSTI4 456
ASGNI4
line 1640
;1640:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1660+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1641
;1641:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1660+4
ADDRGP4 $1274
ASGNP4
line 1642
;1642:	}
LABELV $1259
line 1644
;1643:
;1644:        if( s_serveroptions.gametype == GT_CTF_ELIMINATION) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 9
NEI4 $1275
line 1645
;1645:            y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1646
;1646:            s_serveroptions.oneway.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2280
CNSTI4 5
ASGNI4
line 1647
;1647:            s_serveroptions.oneway.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2280+44
CNSTU4 258
ASGNU4
line 1648
;1648:            s_serveroptions.oneway.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2280+12
CNSTI4 456
ASGNI4
line 1649
;1649:            s_serveroptions.oneway.generic.y				= y;
ADDRGP4 s_serveroptions+2280+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1650
;1650:            s_serveroptions.oneway.generic.name			= "Oneway attack:";
ADDRGP4 s_serveroptions+2280+4
ADDRGP4 $1287
ASGNP4
line 1651
;1651:            s_serveroptions.oneway.generic.statusbar  = ServerOptions_StatusBar_Oneway;
ADDRGP4 s_serveroptions+2280+52
ADDRGP4 ServerOptions_StatusBar_Oneway
ASGNP4
line 1652
;1652:        }
LABELV $1275
line 1654
;1653:
;1654:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1655
;1655:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2056
CNSTI4 5
ASGNI4
line 1656
;1656:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2056+44
CNSTU4 258
ASGNU4
line 1657
;1657:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2056+12
CNSTI4 456
ASGNI4
line 1658
;1658:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2056+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1659
;1659:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2056+4
ADDRGP4 $1299
ASGNP4
line 1660
;1660:        s_serveroptions.pure.generic.statusbar  = ServerOptions_StatusBar_Pure;
ADDRGP4 s_serveroptions+2056+52
ADDRGP4 ServerOptions_StatusBar_Pure
ASGNP4
line 1662
;1661:
;1662:        if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6168
INDIRI4
CNSTI4 0
EQI4 $1302
line 1663
;1663:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1664
;1664:	s_serveroptions.lan.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2120
CNSTI4 5
ASGNI4
line 1665
;1665:	s_serveroptions.lan.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2120+44
CNSTU4 258
ASGNU4
line 1666
;1666:	s_serveroptions.lan.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2120+12
CNSTI4 456
ASGNI4
line 1667
;1667:	s_serveroptions.lan.generic.y				= y;
ADDRGP4 s_serveroptions+2120+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1668
;1668:	s_serveroptions.lan.generic.name			= "Optimize for LAN:";
ADDRGP4 s_serveroptions+2120+4
ADDRGP4 $1314
ASGNP4
line 1669
;1669:        }
LABELV $1302
line 1672
;1670:        
;1671:        //Insantgib option
;1672:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1673
;1673:	s_serveroptions.instantgib.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2344
CNSTI4 5
ASGNI4
line 1674
;1674:	s_serveroptions.instantgib.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2344+44
CNSTU4 258
ASGNU4
line 1675
;1675:	s_serveroptions.instantgib.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2344+12
CNSTI4 456
ASGNI4
line 1676
;1676:	s_serveroptions.instantgib.generic.y				= y;
ADDRGP4 s_serveroptions+2344+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1677
;1677:	s_serveroptions.instantgib.generic.name			= "Instantgib:";
ADDRGP4 s_serveroptions+2344+4
ADDRGP4 $1324
ASGNP4
line 1678
;1678:        s_serveroptions.instantgib.generic.statusbar  = ServerOptions_StatusBar_Instantgib; 
ADDRGP4 s_serveroptions+2344+52
ADDRGP4 ServerOptions_StatusBar_Instantgib
ASGNP4
line 1681
;1679:        
;1680:        //Rockets option
;1681:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1682
;1682:	s_serveroptions.rockets.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2408
CNSTI4 5
ASGNI4
line 1683
;1683:	s_serveroptions.rockets.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2408+44
CNSTU4 258
ASGNU4
line 1684
;1684:	s_serveroptions.rockets.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2408+12
CNSTI4 456
ASGNI4
line 1685
;1685:	s_serveroptions.rockets.generic.y				= y;
ADDRGP4 s_serveroptions+2408+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1686
;1686:	s_serveroptions.rockets.generic.name			= "All rockets:";
ADDRGP4 s_serveroptions+2408+4
ADDRGP4 $1336
ASGNP4
line 1687
;1687:        s_serveroptions.rockets.generic.statusbar  = ServerOptions_StatusBar_Allrockets;
ADDRGP4 s_serveroptions+2408+52
ADDRGP4 ServerOptions_StatusBar_Allrockets
ASGNP4
line 1689
;1688:        
;1689:        if( s_serveroptions.gametype == GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $1339
line 1690
;1690:            y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1691
;1691:            s_serveroptions.lmsMode.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2472
CNSTI4 3
ASGNI4
line 1692
;1692:            s_serveroptions.lmsMode.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2472+44
CNSTU4 258
ASGNU4
line 1693
;1693:            s_serveroptions.lmsMode.generic.name			= "Score mode:";
ADDRGP4 s_serveroptions+2472+4
ADDRGP4 $1347
ASGNP4
line 1694
;1694:            s_serveroptions.lmsMode.generic.x				=  OPTIONS_X; //32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2472+12
CNSTI4 456
ASGNI4
line 1695
;1695:            s_serveroptions.lmsMode.generic.y				= y;
ADDRGP4 s_serveroptions+2472+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1696
;1696:            s_serveroptions.lmsMode.itemnames				= lmsMode_list;
ADDRGP4 s_serveroptions+2472+76
ADDRGP4 lmsMode_list
ASGNP4
line 1699
;1697:            //s_serveroptions.lmsMode.curvalue				= 0;
;1698:            
;1699:        }
LABELV $1339
line 1701
;1700:
;1701:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1702
;1702:            s_serveroptions.pmove.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2184
CNSTI4 3
ASGNI4
line 1703
;1703:            s_serveroptions.pmove.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2184+44
CNSTU4 258
ASGNU4
line 1704
;1704:            s_serveroptions.pmove.generic.name			= "Physics:";
ADDRGP4 s_serveroptions+2184+4
ADDRGP4 $1359
ASGNP4
line 1705
;1705:            s_serveroptions.pmove.generic.x				=  OPTIONS_X; //32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2184+12
CNSTI4 456
ASGNI4
line 1706
;1706:            s_serveroptions.pmove.generic.y				= y;
ADDRGP4 s_serveroptions+2184+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1707
;1707:            s_serveroptions.pmove.itemnames				= pmove_list;
ADDRGP4 s_serveroptions+2184+76
ADDRGP4 pmove_list
ASGNP4
line 1708
;1708:            s_serveroptions.pmove.generic.statusbar  = ServerOptions_StatusBar_Pmove;
ADDRGP4 s_serveroptions+2184+52
ADDRGP4 ServerOptions_StatusBar_Pmove
ASGNP4
line 1710
;1709:
;1710:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6168
INDIRI4
CNSTI4 0
EQI4 $1368
line 1711
;1711:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1712
;1712:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1724
CNSTI4 4
ASGNI4
line 1713
;1713:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1724+4
ADDRGP4 $1374
ASGNP4
line 1714
;1714:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1724+44
CNSTU4 2
ASGNU4
line 1715
;1715:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1724+12
CNSTI4 456
ASGNI4
line 1716
;1716:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1724+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1717
;1717:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1724+60+8
CNSTI4 18
ASGNI4
line 1718
;1718:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1724+60+268
CNSTI4 64
ASGNI4
line 1719
;1719:	}
LABELV $1368
line 1721
;1720:	
;1721:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1722
;1722:	s_serveroptions.botSkill.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2568
CNSTI4 3
ASGNI4
line 1723
;1723:	s_serveroptions.botSkill.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2568+44
CNSTU4 258
ASGNU4
line 1724
;1724:	s_serveroptions.botSkill.generic.name			= "Bot Skill:";
ADDRGP4 s_serveroptions+2568+4
ADDRGP4 $1392
ASGNP4
line 1725
;1725:	s_serveroptions.botSkill.generic.x				= 32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2568+4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_serveroptions+2568+12
ADDRLP4 16
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ASGNI4
line 1726
;1726:	s_serveroptions.botSkill.generic.y				= y;
ADDRGP4 s_serveroptions+2568+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1727
;1727:	s_serveroptions.botSkill.itemnames				= botSkill_list;
ADDRGP4 s_serveroptions+2568+76
ADDRGP4 botSkill_list
ASGNP4
line 1728
;1728:	s_serveroptions.botSkill.curvalue				= 1;
ADDRGP4 s_serveroptions+2568+64
CNSTI4 1
ASGNI4
line 1730
;1729:
;1730:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1731
;1731:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2664
CNSTI4 7
ASGNI4
line 1732
;1732:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2664+44
CNSTU4 2
ASGNU4
line 1733
;1733:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2664+12
CNSTI4 40
ASGNI4
line 1734
;1734:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2664+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1735
;1735:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2664+68
ADDRGP4 color_orange
ASGNP4
line 1736
;1736:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2664+64
CNSTI4 16
ASGNI4
line 1738
;1737:
;1738:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1414
line 1739
;1739:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736
ADDP4
CNSTI4 3
ASGNI4
line 1740
;1740:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+44
ADDP4
CNSTU4 2
ASGNU4
line 1741
;1741:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+8
ADDP4
CNSTI4 25
ASGNI4
line 1742
;1742:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1743
;1743:		s_serveroptions.playerType[n].generic.x			= 32;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+12
ADDP4
CNSTI4 32
ASGNI4
line 1744
;1744:		s_serveroptions.playerType[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1745
;1745:		s_serveroptions.playerType[n].itemnames			= playerType_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736+76
ADDP4
ADDRGP4 playerType_list
ASGNP4
line 1747
;1746:
;1747:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888
ADDP4
CNSTI4 7
ASGNI4
line 1748
;1748:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+44
ADDP4
CNSTU4 2
ASGNU4
line 1749
;1749:		s_serveroptions.playerName[n].generic.x			= 96;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+12
ADDP4
CNSTI4 96
ASGNI4
line 1750
;1750:		s_serveroptions.playerName[n].generic.y			= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1751
;1751:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1752
;1752:		s_serveroptions.playerName[n].generic.id		= n;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1753
;1753:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1754
;1754:		s_serveroptions.playerName[n].color				= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1755
;1755:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+64
ADDP4
CNSTI4 16
ASGNI4
line 1756
;1756:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6208
ADDP4
ASGNP4
line 1757
;1757:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 28
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 s_serveroptions+3888+24
ADDP4
ADDRLP4 28
INDIRI4
ADDRGP4 s_serveroptions+3888+16
ADDP4
INDIRI4
ASGNI4
line 1758
;1758:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 32
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 s_serveroptions+3888+32
ADDP4
ADDRLP4 32
INDIRI4
ADDRGP4 s_serveroptions+3888+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1759
;1759:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 36
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3888+20
ADDP4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3888+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1760
;1760:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 40
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 s_serveroptions+3888+28
ADDP4
ADDRLP4 40
INDIRI4
ADDRGP4 s_serveroptions+3888+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1762
;1761:
;1762:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752
ADDP4
CNSTI4 3
ASGNI4
line 1763
;1763:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+44
ADDP4
CNSTU4 2
ASGNU4
line 1764
;1764:		s_serveroptions.playerTeam[n].generic.x			= 240;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+12
ADDP4
CNSTI4 240
ASGNI4
line 1765
;1765:		s_serveroptions.playerTeam[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1766
;1766:		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752+76
ADDP4
ADDRGP4 playerTeam_list
ASGNP4
line 1768
;1767:
;1768:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1769
;1769:	}
LABELV $1415
line 1738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1414
line 1771
;1770:
;1771:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+6080
CNSTI4 6
ASGNI4
line 1772
;1772:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+6080+4
ADDRGP4 $466
ASGNP4
line 1773
;1773:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+6080+44
CNSTU4 260
ASGNU4
line 1774
;1774:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+6080+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1775
;1775:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+6080+8
CNSTI4 29
ASGNI4
line 1776
;1776:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+6080+12
CNSTI4 0
ASGNI4
line 1777
;1777:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+6080+16
CNSTI4 416
ASGNI4
line 1778
;1778:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+6080+76
CNSTI4 128
ASGNI4
line 1779
;1779:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+6080+80
CNSTI4 64
ASGNI4
line 1780
;1780:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+6080+60
ADDRGP4 $483
ASGNP4
line 1782
;1781:
;1782:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5992
CNSTI4 6
ASGNI4
line 1783
;1783:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5992+4
ADDRGP4 $487
ASGNP4
line 1784
;1784:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5992+44
CNSTU4 28944
ASGNU4
line 1785
;1785:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5992+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1786
;1786:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5992+8
CNSTI4 22
ASGNI4
line 1787
;1787:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5992+12
CNSTI4 640
ASGNI4
line 1788
;1788:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5992+16
CNSTI4 344
ASGNI4
line 1789
;1789:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5992+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1790
;1790:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5992+76
CNSTI4 128
ASGNI4
line 1791
;1791:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5992+80
CNSTI4 64
ASGNI4
line 1792
;1792:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5992+60
ADDRGP4 $504
ASGNP4
line 1794
;1793:
;1794:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5904
CNSTI4 6
ASGNI4
line 1795
;1795:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5904+4
ADDRGP4 $1519
ASGNP4
line 1796
;1796:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5904+44
CNSTU4 272
ASGNU4
line 1797
;1797:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5904+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1798
;1798:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5904+8
CNSTI4 28
ASGNI4
line 1799
;1799:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5904+12
CNSTI4 640
ASGNI4
line 1800
;1800:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5904+16
CNSTI4 416
ASGNI4
line 1801
;1801:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5904+76
CNSTI4 128
ASGNI4
line 1802
;1802:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5904+80
CNSTI4 64
ASGNI4
line 1803
;1803:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5904+60
ADDRGP4 $1536
ASGNP4
line 1805
;1804:
;1805:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1807
;1806:
;1807:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1808
;1808:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1810
;1809:
;1810:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2568
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1811
;1811:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1812
;1812:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1542
line 1813
;1813:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1546
line 1814
;1814:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2736
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1815
;1815:		}
LABELV $1546
line 1816
;1816:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3888
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1817
;1817:		if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $1550
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $1550
line 1818
;1818:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4752
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1819
;1819:		}
LABELV $1550
line 1820
;1820:	}
LABELV $1543
line 1812
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1542
line 1822
;1821:
;1822:	if( s_serveroptions.gametype < GT_CTF || s_serveroptions.gametype == GT_LMS ) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 4
LTI4 $1559
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $1555
LABELV $1559
line 1823
;1823:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1824
;1824:	}
ADDRGP4 $1556
JUMPV
LABELV $1555
line 1825
;1825:	else {
line 1826
;1826:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1827
;1827:	}
LABELV $1556
line 1828
;1828:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1829
;1829:	if( s_serveroptions.gametype >= GT_TEAM && s_serveroptions.gametype != GT_LMS && s_serveroptions.gametype != GT_ELIMINATION && s_serveroptions.gametype != GT_CTF_ELIMINATION) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 3
LTI4 $1563
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
EQI4 $1563
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 8
EQI4 $1563
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 9
EQI4 $1563
line 1830
;1830:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1831
;1831:	}
LABELV $1563
line 1832
;1832:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1833
;1833:        Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.instantgib );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2344
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1834
;1834:        Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.rockets );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1835
;1835:        if( s_serveroptions.gametype == GT_LMS) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 10
NEI4 $1573
line 1836
;1836:            Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.lmsMode );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1837
;1837:        }
LABELV $1573
line 1838
;1838:        if( s_serveroptions.gametype == GT_CTF_ELIMINATION) {
ADDRGP4 s_serveroptions+6172
INDIRI4
CNSTI4 9
NEI4 $1577
line 1839
;1839:            Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.oneway );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2280
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1840
;1840:        }
LABELV $1577
line 1841
;1841:        Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pmove );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2184
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1842
;1842:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6168
INDIRI4
CNSTI4 0
EQI4 $1582
line 1843
;1843:                Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.lan );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2120
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1844
;1844:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1845
;1845:	}
LABELV $1582
line 1847
;1846:
;1847:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6080
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1848
;1848:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5992
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1849
;1849:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1851
;1850:	
;1851:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1852
;1852:}
LABELV $1156
endproc ServerOptions_MenuInit 44 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1859
;1853:
;1854:/*
;1855:=================
;1856:ServerOptions_Cache
;1857:=================
;1858:*/
;1859:void ServerOptions_Cache( void ) {
line 1860
;1860:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $466
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1861
;1861:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $483
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1862
;1862:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1519
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1863
;1863:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1536
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1864
;1864:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1865
;1865:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $371
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1866
;1866:}
LABELV $1590
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1874
;1867:
;1868:
;1869:/*
;1870:=================
;1871:UI_ServerOptionsMenu
;1872:=================
;1873:*/
;1874:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1875
;1875:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1876
;1876:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1877
;1877:}
LABELV $1591
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1938
;1878:
;1879:
;1880:
;1881:/*
;1882:=============================================================================
;1883:
;1884:BOT SELECT MENU *****
;1885:
;1886:=============================================================================
;1887:*/
;1888:
;1889:
;1890:#define BOTSELECT_BACK0			"menu/art_blueish/back_0"
;1891:#define BOTSELECT_BACK1			"menu/art_blueish/back_1"
;1892:#define BOTSELECT_ACCEPT0		"menu/art_blueish/accept_0"
;1893:#define BOTSELECT_ACCEPT1		"menu/art_blueish/accept_1"
;1894:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1895:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1896:#define BOTSELECT_ARROWS		"menu/art_blueish/gs_arrows_0"
;1897:#define BOTSELECT_ARROWSL		"menu/art_blueish/gs_arrows_l"
;1898:#define BOTSELECT_ARROWSR		"menu/art_blueish/gs_arrows_r"
;1899:
;1900:#define PLAYERGRID_COLS			4
;1901:#define PLAYERGRID_ROWS			4
;1902:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1903:
;1904:
;1905:typedef struct {
;1906:	menuframework_s	menu;
;1907:
;1908:	menutext_s		banner;
;1909:
;1910:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1911:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1912:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1913:
;1914:	menubitmap_s	arrows;
;1915:	menubitmap_s	left;
;1916:	menubitmap_s	right;
;1917:
;1918:	menubitmap_s	go;
;1919:	menubitmap_s	back;
;1920:
;1921:	int				numBots;
;1922:	int				modelpage;
;1923:	int				numpages;
;1924:	int				selectedmodel;
;1925:	int				sortedBotNums[MAX_BOTS];
;1926:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1927:	char			botnames[MAX_MODELSPERPAGE][16];
;1928:} botSelectInfo_t;
;1929:
;1930:static botSelectInfo_t	botSelectInfo;
;1931:
;1932:
;1933:/*
;1934:=================
;1935:UI_BotSelectMenu_SortCompare
;1936:=================
;1937:*/
;1938:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1943
;1939:	int			num1, num2;
;1940:	const char	*info1, *info2;
;1941:	const char	*name1, *name2;
;1942:
;1943:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1944
;1944:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1946
;1945:
;1946:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1947
;1947:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 1949
;1948:
;1949:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1950
;1950:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1952
;1951:
;1952:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $1593
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1961
;1953:}
;1954:
;1955:
;1956:/*
;1957:=================
;1958:UI_BotSelectMenu_BuildList
;1959:=================
;1960:*/
;1961:static void UI_BotSelectMenu_BuildList( void ) {
line 1964
;1962:	int		n;
;1963:
;1964:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4900
CNSTI4 0
ASGNI4
line 1965
;1965:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4896
ADDRLP4 4
INDIRI4
ASGNI4
line 1966
;1966:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4904
ADDRGP4 botSelectInfo+4896
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1967
;1967:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4896
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1599
line 1968
;1968:		botSelectInfo.numpages++;
ADDRLP4 8
ADDRGP4 botSelectInfo+4904
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1969
;1969:	}
LABELV $1599
line 1972
;1970:
;1971:	// initialize the array
;1972:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1606
JUMPV
LABELV $1603
line 1973
;1973:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4912
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1974
;1974:	}
LABELV $1604
line 1972
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1606
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
LTI4 $1603
line 1977
;1975:
;1976:	// now sort it
;1977:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
ADDRGP4 botSelectInfo+4912
ARGP4
ADDRGP4 botSelectInfo+4896
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelectMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1978
;1978:}
LABELV $1594
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1986
;1979:
;1980:
;1981:/*
;1982:=================
;1983:ServerPlayerIcon
;1984:=================
;1985:*/
;1986:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1990
;1987:	char	*skin;
;1988:	char	model[MAX_QPATH];
;1989:
;1990:	Q_strncpyz( model, modelAndSkin, sizeof(model));
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
line 1991
;1991:	skin = strrchr( model, '/' );
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
line 1992
;1992:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1613
line 1993
;1993:		*skin++ = '\0';
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
line 1994
;1994:	}
ADDRGP4 $1614
JUMPV
LABELV $1613
line 1995
;1995:	else {
line 1996
;1996:		skin = "default";
ADDRLP4 0
ADDRGP4 $1615
ASGNP4
line 1997
;1997:	}
LABELV $1614
line 1999
;1998:
;1999:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1616
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2001
;2000:
;2001:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
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
NEI4 $1617
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1615
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1617
line 2002
;2002:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1619
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2003
;2003:	}
LABELV $1617
line 2004
;2004:}
LABELV $1612
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 2012
;2005:
;2006:
;2007:/*
;2008:=================
;2009:UI_BotSelectMenu_UpdateGrid
;2010:=================
;2011:*/
;2012:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 2017
;2013:	const char	*info;
;2014:	int			i;
;2015:    int			j;
;2016:
;2017:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2018
;2018:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1622
line 2019
;2019:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
GEI4 $1626
line 2020
;2020:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4912
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 2021
;2021:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1630
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9008
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ServerPlayerIcon
CALLV
pop
line 2022
;2022:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2023
;2023:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2024
;2024: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9008
ADDP4
ASGNP4
line 2025
;2025:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotAlreadySelected
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1637
line 2026
;2026:				botSelectInfo.picnames[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 2027
;2027:			}
ADDRGP4 $1638
JUMPV
LABELV $1637
line 2028
;2028:			else {
line 2029
;2029:				botSelectInfo.picnames[i].color = color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 2030
;2030:			}
LABELV $1638
line 2031
;2031:			botSelectInfo.picbuttons[i].generic.flags &= ~((unsigned int)QMF_INACTIVE);
ADDRLP4 32
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 2032
;2032:		}
ADDRGP4 $1627
JUMPV
LABELV $1626
line 2033
;2033:		else {
line 2035
;2034:			// dead slot
;2035: 			botSelectInfo.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+4
ADDP4
CNSTP4 0
ASGNP4
line 2036
;2036:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 2037
;2037:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
CNSTI1 0
ASGNI1
line 2038
;2038:		}
LABELV $1627
line 2040
;2039:
;2040: 		botSelectInfo.pics[i].generic.flags       &= ~((unsigned int)QMF_HIGHLIGHT);
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 2041
;2041: 		botSelectInfo.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+68
ADDP4
CNSTI4 0
ASGNI4
line 2042
;2042: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 2043
;2043:	}
LABELV $1623
line 2018
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1622
line 2046
;2044:
;2045:	// set selected model
;2046:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4908
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 2047
;2047:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 2048
;2048:	botSelectInfo.picbuttons[i].generic.flags &= ~((unsigned int)QMF_PULSEIFFOCUS);
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 2050
;2049:
;2050:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4904
INDIRI4
CNSTI4 1
LEI4 $1662
line 2051
;2051:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 0
LEI4 $1665
line 2052
;2052:			botSelectInfo.left.generic.flags &= ~((unsigned int)QMF_INACTIVE);
ADDRLP4 24
ADDRGP4 botSelectInfo+4544+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 2053
;2053:		}
ADDRGP4 $1666
JUMPV
LABELV $1665
line 2054
;2054:		else {
line 2055
;2055:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4544+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 2056
;2056:		}
LABELV $1666
line 2058
;2057:
;2058:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4900
INDIRI4
ADDRGP4 botSelectInfo+4904
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1672
line 2059
;2059:			botSelectInfo.right.generic.flags &= ~((unsigned int)QMF_INACTIVE);
ADDRLP4 24
ADDRGP4 botSelectInfo+4632+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 2060
;2060:		}
ADDRGP4 $1663
JUMPV
LABELV $1672
line 2061
;2061:		else {
line 2062
;2062:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4632+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 2063
;2063:		}
line 2064
;2064:	}
ADDRGP4 $1663
JUMPV
LABELV $1662
line 2065
;2065:	else {
line 2067
;2066:		// hide left/right markers
;2067:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4544+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 2068
;2068:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 botSelectInfo+4632+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 2069
;2069:	}
LABELV $1663
line 2070
;2070:}
LABELV $1620
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 2078
;2071:
;2072:
;2073:/*
;2074:=================
;2075:UI_BotSelectMenu_Default
;2076:=================
;2077:*/
;2078:static void UI_BotSelectMenu_Default( char *bot ) {
line 2084
;2079:	const char	*botInfo;
;2080:	const char	*test;
;2081:	int			n;
;2082:	int			i;
;2083:
;2084:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1688
JUMPV
LABELV $1685
line 2085
;2085:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2086
;2086:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 2087
;2087:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1690
line 2088
;2088:			break;
ADDRGP4 $1687
JUMPV
LABELV $1690
line 2090
;2089:		}
;2090:	}
LABELV $1686
line 2084
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1688
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
LTI4 $1685
LABELV $1687
line 2091
;2091:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
NEI4 $1692
line 2092
;2092:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4908
CNSTI4 0
ASGNI4
line 2093
;2093:		return;
ADDRGP4 $1684
JUMPV
LABELV $1692
line 2096
;2094:	}
;2095:
;2096:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1699
JUMPV
LABELV $1696
line 2097
;2097:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4912
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1701
line 2098
;2098:			break;
ADDRGP4 $1698
JUMPV
LABELV $1701
line 2100
;2099:		}
;2100:	}
LABELV $1697
line 2096
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1699
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
LTI4 $1696
LABELV $1698
line 2101
;2101:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4896
INDIRI4
NEI4 $1704
line 2102
;2102:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4908
CNSTI4 0
ASGNI4
line 2103
;2103:		return;
ADDRGP4 $1684
JUMPV
LABELV $1704
line 2106
;2104:	}
;2105:
;2106:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4908
ADDRLP4 4
INDIRI4
ASGNI4
line 2107
;2107:}
LABELV $1684
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 2115
;2108:
;2109:
;2110:/*
;2111:=================
;2112:UI_BotSelectMenu_LeftEvent
;2113:=================
;2114:*/
;2115:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 2116
;2116:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1710
line 2117
;2117:		return;
ADDRGP4 $1709
JUMPV
LABELV $1710
line 2119
;2118:	}
;2119:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 0
LEI4 $1712
line 2120
;2120:		botSelectInfo.modelpage--;
ADDRLP4 0
ADDRGP4 botSelectInfo+4900
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2121
;2121:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4908
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2122
;2122:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 2123
;2123:	}
LABELV $1712
line 2124
;2124:}
LABELV $1709
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 2132
;2125:
;2126:
;2127:/*
;2128:=================
;2129:UI_BotSelectMenu_RightEvent
;2130:=================
;2131:*/
;2132:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 2133
;2133:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1719
line 2134
;2134:		return;
ADDRGP4 $1718
JUMPV
LABELV $1719
line 2136
;2135:	}
;2136:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4900
INDIRI4
ADDRGP4 botSelectInfo+4904
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1721
line 2137
;2137:		botSelectInfo.modelpage++;
ADDRLP4 0
ADDRGP4 botSelectInfo+4900
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2138
;2138:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4908
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 2139
;2139:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 2140
;2140:	}
LABELV $1721
line 2141
;2141:}
LABELV $1718
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 2149
;2142:
;2143:
;2144:/*
;2145:=================
;2146:UI_BotSelectMenu_BotEvent
;2147:=================
;2148:*/
;2149:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 2152
;2150:	int		i;
;2151:
;2152:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1729
line 2153
;2153:		return;
ADDRGP4 $1728
JUMPV
LABELV $1729
line 2156
;2154:	}
;2155:
;2156:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1731
line 2157
;2157: 		botSelectInfo.pics[i].generic.flags &= ~((unsigned int)QMF_HIGHLIGHT);
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 2158
;2158: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 2159
;2159:	}
LABELV $1732
line 2156
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1731
line 2162
;2160:
;2161:	// set selected
;2162:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2163
;2163:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 2164
;2164:	botSelectInfo.picbuttons[i].generic.flags &= ~((unsigned int)QMF_PULSEIFFOCUS);
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 2165
;2165:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4908
ADDRGP4 botSelectInfo+4900
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2166
;2166:}
LABELV $1728
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 2174
;2167:
;2168:
;2169:/*
;2170:=================
;2171:UI_BotSelectMenu_BackEvent
;2172:=================
;2173:*/
;2174:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 2175
;2175:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1746
line 2176
;2176:		return;
ADDRGP4 $1745
JUMPV
LABELV $1746
line 2178
;2177:	}
;2178:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 2179
;2179:}
LABELV $1745
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 4 12
line 2187
;2180:
;2181:
;2182:/*
;2183:=================
;2184:UI_BotSelectMenu_SelectEvent
;2185:=================
;2186:*/
;2187:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 2188
;2188:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1749
line 2189
;2189:		return;
ADDRGP4 $1748
JUMPV
LABELV $1749
line 2191
;2190:	}
;2191:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 2193
;2192:
;2193:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+6400
CNSTI4 1
ASGNI4
line 2194
;2194:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+6408
ARGP4
ADDRLP4 0
CNSTI4 16
ASGNI4
ADDRGP4 botSelectInfo+4908
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2195
;2195:}
LABELV $1748
endproc UI_BotSelectMenu_SelectEvent 4 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 2203
;2196:
;2197:
;2198:/*
;2199:=================
;2200:UI_BotSelectMenu_Cache
;2201:=================
;2202:*/
;2203:void UI_BotSelectMenu_Cache( void ) {
line 2204
;2204:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $466
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2205
;2205:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $483
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2206
;2206:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1756
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2207
;2207:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1757
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2208
;2208:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1758
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2209
;2209:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1759
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2210
;2210:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2211
;2211:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $431
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2212
;2212:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $449
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 2213
;2213:}
LABELV $1755
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 36 12
line 2216
;2214:
;2215:
;2216:static void UI_BotSelectMenu_Init( char *bot ) {
line 2220
;2217:	int		i, j, k;
;2218:	int		x, y;
;2219:
;2220:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2221
;2221:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+404
CNSTI4 1
ASGNI4
line 2222
;2222:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+408
CNSTI4 1
ASGNI4
line 2224
;2223:
;2224:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 2226
;2225:
;2226:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+416
CNSTI4 10
ASGNI4
line 2227
;2227:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+416+12
CNSTI4 320
ASGNI4
line 2228
;2228:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+416+16
CNSTI4 16
ASGNI4
line 2229
;2229:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+416+60
ADDRGP4 $1770
ASGNP4
line 2230
;2230:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+416+68
ADDRGP4 color_white
ASGNP4
line 2231
;2231:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+416+64
CNSTI4 1
ASGNI4
line 2233
;2232:
;2233:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 2234
;2234:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $1778
JUMPV
LABELV $1775
line 2235
;2235:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 2236
;2236:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1779
line 2237
;2237:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488
ADDP4
CNSTI4 6
ASGNI4
line 2238
;2238:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+44
ADDP4
CNSTU4 16388
ASGNU4
line 2239
;2239:			botSelectInfo.pics[k].generic.x					= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2240
;2240:			botSelectInfo.pics[k].generic.y					= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2241
;2241: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9008
ADDP4
ASGNP4
line 2242
;2242:			botSelectInfo.pics[k].width						= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+76
ADDP4
CNSTI4 64
ASGNI4
line 2243
;2243:			botSelectInfo.pics[k].height					= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+80
ADDP4
CNSTI4 64
ASGNI4
line 2244
;2244:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+60
ADDP4
ADDRGP4 $1759
ASGNP4
line 2245
;2245:			botSelectInfo.pics[k].focuscolor				= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 2247
;2246:
;2247:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896
ADDP4
CNSTI4 6
ASGNI4
line 2248
;2248:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+44
ADDP4
CNSTU4 33028
ASGNU4
line 2249
;2249:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 2250
;2250:			botSelectInfo.picbuttons[k].generic.id			= k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2251
;2251:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 2252
;2252:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 2253
;2253:			botSelectInfo.picbuttons[k].generic.left		= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2254
;2254:			botSelectInfo.picbuttons[k].generic.top			= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2255
;2255:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 2256
;2256:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 2257
;2257:			botSelectInfo.picbuttons[k].width				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+76
ADDP4
CNSTI4 128
ASGNI4
line 2258
;2258:			botSelectInfo.picbuttons[k].height				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+80
ADDP4
CNSTI4 128
ASGNI4
line 2259
;2259:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+60
ADDP4
ADDRGP4 $1758
ASGNP4
line 2260
;2260:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 2262
;2261:
;2262:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304
ADDP4
CNSTI4 7
ASGNI4
line 2263
;2263:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+44
ADDP4
CNSTU4 2
ASGNU4
line 2264
;2264:			botSelectInfo.picnames[k].generic.x				= x + 32;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 2265
;2265:			botSelectInfo.picnames[k].generic.y				= y + 64;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 2266
;2266:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10032
ADDP4
ASGNP4
line 2267
;2267:			botSelectInfo.picnames[k].color					= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 2268
;2268:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304+64
ADDP4
CNSTI4 17
ASGNI4
line 2270
;2269:
;2270:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 2271
;2271:		}
LABELV $1780
line 2236
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1779
line 2272
;2272:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 2273
;2273:	}
LABELV $1776
line 2234
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1778
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1775
line 2275
;2274:
;2275:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4456
CNSTI4 6
ASGNI4
line 2276
;2276:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4456+4
ADDRGP4 $403
ASGNP4
line 2277
;2277:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4456+44
CNSTU4 16384
ASGNU4
line 2278
;2278:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4456+12
CNSTI4 260
ASGNI4
line 2279
;2279:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4456+16
CNSTI4 440
ASGNI4
line 2280
;2280:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4456+76
CNSTI4 128
ASGNI4
line 2281
;2281:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4456+80
CNSTI4 32
ASGNI4
line 2283
;2282:
;2283:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4544
CNSTI4 6
ASGNI4
line 2284
;2284:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4544+44
CNSTU4 260
ASGNU4
line 2285
;2285:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4544+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 2286
;2286:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4544+12
CNSTI4 260
ASGNI4
line 2287
;2287:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4544+16
CNSTI4 440
ASGNI4
line 2288
;2288:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4544+76
CNSTI4 64
ASGNI4
line 2289
;2289:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4544+80
CNSTI4 32
ASGNI4
line 2290
;2290:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4544+60
ADDRGP4 $431
ASGNP4
line 2292
;2291:
;2292:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4632
CNSTI4 6
ASGNI4
line 2293
;2293:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4632+44
CNSTU4 260
ASGNU4
line 2294
;2294:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4632+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 2295
;2295:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4632+12
CNSTI4 321
ASGNI4
line 2296
;2296:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4632+16
CNSTI4 440
ASGNI4
line 2297
;2297:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4632+76
CNSTI4 64
ASGNI4
line 2298
;2298:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4632+80
CNSTI4 32
ASGNI4
line 2299
;2299:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4632+60
ADDRGP4 $449
ASGNP4
line 2301
;2300:
;2301:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4808
CNSTI4 6
ASGNI4
line 2302
;2302:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4808+4
ADDRGP4 $466
ASGNP4
line 2303
;2303:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4808+44
CNSTU4 260
ASGNU4
line 2304
;2304:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4808+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 2305
;2305:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4808+12
CNSTI4 0
ASGNI4
line 2306
;2306:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4808+16
CNSTI4 416
ASGNI4
line 2307
;2307:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4808+76
CNSTI4 128
ASGNI4
line 2308
;2308:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4808+80
CNSTI4 64
ASGNI4
line 2309
;2309:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4808+60
ADDRGP4 $483
ASGNP4
line 2311
;2310:
;2311:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4720
CNSTI4 6
ASGNI4
line 2312
;2312:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4720+4
ADDRGP4 $1756
ASGNP4
line 2313
;2313:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4720+44
CNSTU4 272
ASGNU4
line 2314
;2314:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4720+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 2315
;2315:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4720+12
CNSTI4 640
ASGNI4
line 2316
;2316:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4720+16
CNSTI4 416
ASGNI4
line 2317
;2317:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4720+76
CNSTI4 128
ASGNI4
line 2318
;2318:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4720+80
CNSTI4 64
ASGNI4
line 2319
;2319:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4720+60
ADDRGP4 $1757
ASGNP4
line 2321
;2320:
;2321:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2322
;2322:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1920
line 2323
;2323:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+488
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2324
;2324:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1896
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2325
;2325:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 72
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3304
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2326
;2326:	}
LABELV $1921
line 2322
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1920
line 2327
;2327:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2328
;2328:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2329
;2329:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2330
;2330:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2331
;2331:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2333
;2332:
;2333:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 2334
;2334:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 2335
;2335:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4900
ADDRGP4 botSelectInfo+4908
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 2336
;2336:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 2337
;2337:}
LABELV $1760
endproc UI_BotSelectMenu_Init 36 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 2345
;2338:
;2339:
;2340:/*
;2341:=================
;2342:UI_BotSelectMenu
;2343:=================
;2344:*/
;2345:void UI_BotSelectMenu( char *bot ) {
line 2346
;2346:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 2347
;2347:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 2348
;2348:}
LABELV $1934
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10288
align 4
LABELV s_serveroptions
skip 6424
align 4
LABELV s_startserver
skip 6948
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
LABELV $1770
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $1759
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
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
LABELV $1758
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
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
LABELV $1757
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1756
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1630
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1619
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
LABELV $1616
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
LABELV $1615
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1536
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
LABELV $1519
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
LABELV $1392
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1374
byte 1 72
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1359
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1347
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1336
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1324
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 103
byte 1 105
byte 1 98
byte 1 58
byte 1 0
align 1
LABELV $1314
byte 1 79
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 76
byte 1 65
byte 1 78
byte 1 58
byte 1 0
align 1
LABELV $1299
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1287
byte 1 79
byte 1 110
byte 1 101
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 58
byte 1 0
align 1
LABELV $1274
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1244
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1226
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1208
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1113
byte 1 115
byte 1 118
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1101
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
LABELV $1098
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
LABELV $1094
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
LABELV $1089
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
LABELV $1058
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
LABELV $1048
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
LABELV $1038
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
LABELV $1028
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
LABELV $1022
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
LABELV $1017
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
LABELV $997
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $971
byte 1 83
byte 1 107
byte 1 101
byte 1 108
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $969
byte 1 75
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 0
align 1
LABELV $966
byte 1 77
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $963
byte 1 71
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $950
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $949
byte 1 0
align 1
LABELV $931
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $911
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $908
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $905
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 101
byte 1 105
byte 1 0
align 1
LABELV $899
byte 1 115
byte 1 107
byte 1 101
byte 1 108
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $893
byte 1 109
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $884
byte 1 103
byte 1 114
byte 1 105
byte 1 115
byte 1 109
byte 1 0
align 1
LABELV $881
byte 1 107
byte 1 121
byte 1 111
byte 1 110
byte 1 115
byte 1 104
byte 1 105
byte 1 0
align 1
LABELV $878
byte 1 103
byte 1 97
byte 1 114
byte 1 103
byte 1 111
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $859
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $858
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 99
byte 1 117
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 120
byte 1 97
byte 1 99
byte 1 116
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $856
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 101
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $855
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 99
byte 1 117
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $853
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 101
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $852
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $846
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $844
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 112
byte 1 107
byte 1 51
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $842
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 46
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $840
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $838
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $781
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $752
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $723
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 59
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $717
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $713
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $694
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $693
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $687
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $684
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $683
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $682
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $678
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
byte 1 116
byte 1 102
byte 1 95
byte 1 111
byte 1 110
byte 1 101
byte 1 119
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $677
byte 1 103
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $676
byte 1 103
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $675
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 103
byte 1 105
byte 1 98
byte 1 0
align 1
LABELV $674
byte 1 115
byte 1 118
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $673
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $672
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $671
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
LABELV $670
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
LABELV $669
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
LABELV $668
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $666
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
byte 1 116
byte 1 0
align 1
LABELV $665
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
LABELV $664
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
LABELV $662
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
LABELV $661
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
LABELV $659
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
LABELV $658
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
LABELV $656
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
LABELV $655
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
LABELV $653
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
byte 1 116
byte 1 0
align 1
LABELV $652
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
LABELV $651
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
LABELV $649
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
byte 1 116
byte 1 0
align 1
LABELV $648
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
LABELV $647
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
LABELV $645
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
byte 1 116
byte 1 0
align 1
LABELV $644
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
LABELV $643
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
LABELV $641
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
byte 1 116
byte 1 0
align 1
LABELV $640
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
LABELV $639
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
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
LABELV $637
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
byte 1 116
byte 1 0
align 1
LABELV $636
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
LABELV $635
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
LABELV $633
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
LABELV $632
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
LABELV $630
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
LABELV $629
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
align 1
LABELV $562
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $561
byte 1 70
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 57
byte 1 49
byte 1 72
byte 1 122
byte 1 0
align 1
LABELV $560
byte 1 70
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 49
byte 1 50
byte 1 53
byte 1 72
byte 1 122
byte 1 0
align 1
LABELV $559
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $558
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 45
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $557
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 43
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $556
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 45
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $555
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 43
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $554
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $553
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $552
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $551
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $550
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $549
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $548
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $547
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $546
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $545
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $535
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
LABELV $504
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
LABELV $487
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
LABELV $483
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
LABELV $466
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
LABELV $449
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $431
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $403
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $399
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
LABELV $371
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
LABELV $368
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
LABELV $336
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $322
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 0
align 1
LABELV $308
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
LABELV $294
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
LABELV $286
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $249
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $244
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $216
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $149
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
byte 1 0
align 1
LABELV $148
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $133
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $130
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 116
byte 1 102
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
byte 1 0
align 1
LABELV $124
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
byte 1 0
align 1
LABELV $121
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $118
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $115
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $100
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $91
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $89
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $88
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
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
byte 1 0
align 1
LABELV $87
byte 1 69
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
byte 1 0
align 1
LABELV $86
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $85
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $84
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $82
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $80
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
