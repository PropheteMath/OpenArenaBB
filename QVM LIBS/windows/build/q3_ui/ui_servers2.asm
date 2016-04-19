data
align 4
LABELV master_items
address $79
address $80
address $81
address $82
address $83
address $84
address $85
byte 4 0
align 4
LABELV servertype_items
address $86
address $87
address $88
address $89
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
byte 4 0
align 4
LABELV sortkey_items
address $99
address $100
address $101
address $102
address $103
address $104
byte 4 0
align 4
LABELV gamenames
address $105
address $106
address $107
address $108
address $109
address $110
address $111
address $93
address $94
address $95
address $96
address $97
address $98
address $112
address $113
address $114
address $115
byte 4 0
align 4
LABELV netnames
address $115
address $116
address $117
byte 4 0
align 1
LABELV quake3worldMessage
byte 1 0
export Q_CleanStrWithColor
code
proc Q_CleanStrWithColor 28 0
file "../../../code/q3_ui/ui_servers2.c"
line 278
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
;26:MULTIPLAYER MENU (SERVER BROWSER)
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define MAX_GLOBALSERVERS		256
;36:#define MAX_PINGREQUESTS		32
;37:#define MAX_ADDRESSLENGTH		64
;38:#define MAX_HOSTNAMELENGTH		31
;39:#define MAX_MAPNAMELENGTH		20
;40:#define MAX_LISTBOXITEMS		256
;41:#define MAX_LOCALSERVERS		124
;42:#define MAX_STATUSLENGTH		64
;43:#define MAX_LEAGUELENGTH		28
;44:#define MAX_LISTBOXWIDTH		70
;45:
;46:#define ART_BACK0			"menu/art_blueish/back_0"
;47:#define ART_BACK1			"menu/art_blueish/back_1"
;48:#define ART_CREATE0			"menu/art_blueish/create_0"
;49:#define ART_CREATE1			"menu/art_blueish/create_1"
;50:#define ART_SPECIFY0			"menu/art_blueish/specify_0"
;51:#define ART_SPECIFY1			"menu/art_blueish/specify_1"
;52:#define ART_REFRESH0			"menu/art_blueish/refresh_0"
;53:#define ART_REFRESH1			"menu/art_blueish/refresh_1"
;54:#define ART_CONNECT0			"menu/art_blueish/fight_0"
;55:#define ART_CONNECT1			"menu/art_blueish/fight_1"
;56:#define ART_ARROWS0			"menu/art_blueish/arrows_vert_0"
;57:#define ART_ARROWS_UP			"menu/art_blueish/arrows_vert_top"
;58:#define ART_ARROWS_DOWN			"menu/art_blueish/arrows_vert_bot"
;59:#define ART_UNKNOWNMAP			"menu/art_blueish/unknownmap"
;60:#define ART_REMOVE0			"menu/art_blueish/delete_0"
;61:#define ART_REMOVE1			"menu/art_blueish/delete_1"
;62:
;63:#define ID_MASTER			10
;64:#define ID_GAMETYPE			11
;65:#define ID_SORTKEY			12
;66:#define ID_SHOW_FULL                    13
;67:#define ID_SHOW_EMPTY                   14
;68:
;69:#define ID_LIST				15
;70:#define ID_SCROLL_UP                    16
;71:#define ID_SCROLL_DOWN                  17
;72:#define ID_BACK				18
;73:#define ID_REFRESH			19
;74:#define ID_SPECIFY			20
;75:#define ID_CREATE			21
;76:#define ID_CONNECT			22
;77:#define ID_REMOVE			23
;78:
;79://Beta 23
;80:#define ID_ONLY_HUMANS                  24
;81:#define ID_HIDE_PRIVATE                 25
;82:
;83:#define GR_LOGO				30
;84:#define GR_LETTERS			31
;85:
;86:#define UIAS_LOCAL			0
;87:#define UIAS_GLOBAL1			1
;88:#define UIAS_GLOBAL2			2
;89:#define UIAS_GLOBAL3			3
;90:#define UIAS_GLOBAL4			4
;91:#define UIAS_GLOBAL5			5
;92:#define UIAS_FAVORITES			6
;93:
;94:#define SORT_HOST			0
;95:#define SORT_MAP			1
;96:#define SORT_CLIENTS                    2
;97:#define SORT_GAME			3
;98:#define SORT_PING			4
;99:#define SORT_HUMANS                     5
;100:
;101:#define GAMES_ALL			0
;102:#define GAMES_FFA			1
;103:#define GAMES_TEAMPLAY                  2
;104:#define GAMES_TOURNEY                   3
;105:#define GAMES_CTF			4
;106:#define GAMES_1FCTF                     5
;107:#define GAMES_OBELISK                   6
;108:#define GAMES_HARVESTER                 7
;109:#define GAMES_ELIMINATION		8
;110:#define GAMES_CTF_ELIMINATION		9
;111:#define GAMES_LMS			10
;112:#define GAMES_DOUBLE_D			11
;113:#define GAMES_DOM                       12
;114:
;115:
;116:static const char *master_items[] = {
;117:	"Local",
;118:	"Internet",
;119:	"Internet(2)",
;120:	"Internet(3)",
;121:	"Internet(4)",
;122:	"Internet(5)",
;123:	"Favorites",
;124:	NULL
;125:};
;126:
;127:static const char *servertype_items[] = {
;128:	"All",
;129:	"Free For All",
;130:	"Team Deathmatch",
;131:	"Tournament",
;132:	"Capture the Flag",
;133:        "One Flag Capture",
;134:        "Overload",
;135:        "Harvester",
;136:	"Elimination",
;137:	"CTF Elimination",
;138:	"Last Man Standing",
;139:	"Double Domination",
;140:        "Domination",
;141:	NULL
;142:};
;143:
;144:static const char *sortkey_items[] = {
;145:	"Server Name",
;146:	"Map Name",
;147:	"Open Player Spots",
;148:	"Game Type",
;149:	"Ping Time",
;150:        "Human Players",
;151:	NULL
;152:};
;153:
;154:static char* gamenames[] = {
;155:	"DM ",	// deathmatch
;156:	"1v1",	// tournament
;157:	"SP ",	// single player
;158:	"Team DM",	// team deathmatch
;159:	"CTF",	// capture the flag
;160:	"One Flag CTF",		// one flag ctf
;161:	"OverLoad",				// Overload
;162:	"Harvester",			// Harvester
;163:	"Elimination",
;164:	"CTF Elimination",
;165:	"Last Man Standing",
;166:	"Double Domination",
;167:        "Domination",	// Dom replaces Rocket Arena 3
;168:	"Q3F",						// Q3F
;169:	"Urban Terror",		// Urban Terror
;170:	"OSP",						// Orange Smoothie Productions
;171:	"???",			// unknown
;172:	NULL
;173:};
;174:
;175:static char* netnames[] = {
;176:	"???",
;177:	"IP4",
;178:        "IP6",
;179:	NULL
;180:};
;181:
;182:static char quake3worldMessage[] = "";
;183:
;184:
;185:typedef struct {
;186:	char	adrstr[MAX_ADDRESSLENGTH];
;187:	int		start;
;188:} pinglist_t;
;189:
;190:typedef struct servernode_s {
;191:	char	adrstr[MAX_ADDRESSLENGTH];
;192:	char	hostname[MAX_HOSTNAMELENGTH+3];
;193:	char	mapname[MAX_MAPNAMELENGTH];
;194:	int		numclients;
;195:        int             humanclients;
;196:        qboolean        needPass;
;197:	int		maxclients;
;198:	int		pingtime;
;199:	int		gametype;
;200:	char	gamename[16];
;201:	int		nettype;
;202:	int		minPing;
;203:	int		maxPing;
;204:	//qboolean bPB;
;205:
;206:} servernode_t; 
;207:
;208:typedef struct {
;209:	char			buff[MAX_LISTBOXWIDTH+64]; //	+60 gives room for color codes... Sago: I need four more
;210:	servernode_t*	servernode;
;211:} table_t;
;212:
;213:typedef struct {
;214:	menuframework_s		menu;
;215:
;216:	menutext_s			banner;
;217:
;218:	menulist_s			master;
;219:	menulist_s			gametype;
;220:	menulist_s			sortkey;
;221:	menuradiobutton_s	showfull;
;222:	menuradiobutton_s	showempty;
;223:        
;224:        menuradiobutton_s	onlyhumans;
;225:        menuradiobutton_s	hideprivate;
;226:
;227:	menulist_s			list;
;228:	menubitmap_s		mappic;
;229:	menubitmap_s		arrows;
;230:	menubitmap_s		up;
;231:	menubitmap_s		down;
;232:	menutext_s			status;
;233:	menutext_s			statusbar;
;234:
;235:	menubitmap_s		remove;
;236:	menubitmap_s		back;
;237:	menubitmap_s		refresh;
;238:	menubitmap_s		specify;
;239:	menubitmap_s		create;
;240:	menubitmap_s		go;
;241:
;242:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;243:	table_t				table[MAX_LISTBOXITEMS];
;244:	char*				items[MAX_LISTBOXITEMS];
;245:	int					numqueriedservers;
;246:	int					*numservers;
;247:	servernode_t		*serverlist;	
;248:	int					currentping;
;249:	qboolean			refreshservers;
;250:	int					nextpingtime;
;251:	int					maxservers;
;252:	int					refreshtime;
;253:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;254:	int					numfavoriteaddresses;
;255:} arenaservers_t;
;256:
;257:static arenaservers_t	g_arenaservers;
;258:
;259:
;260:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;261:static int				g_numglobalservers;
;262:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;263:static int				g_numlocalservers;
;264:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;265:static int				g_numfavoriteservers;
;266:static int				g_servertype;
;267:static int				g_gametype;
;268:static int				g_sortkey;
;269:static int				g_emptyservers;
;270:static int				g_fullservers;
;271:
;272:static int				g_onlyhumans;
;273:static int                              g_hideprivate;
;274:
;275:/*
;276: *Removes illigal chars but keeps colors
;277: */
;278:char *Q_CleanStrWithColor( char *string ) {
line 283
;279:	char*	d;
;280:	char*	s;
;281:	int		c;
;282:
;283:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 284
;284:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $123
JUMPV
LABELV $122
line 285
;285:	while ((c = *s) != 0 ) {
line 286
;286:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $125
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $125
ADDRLP4 16
INDIRI4
CNSTI4 56
GTI4 $125
line 287
;287:			*d++ = c;
ADDRLP4 20
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 288
;288:		}
ADDRGP4 $126
JUMPV
LABELV $125
line 289
;289:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $127
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $127
line 290
;290:			*d++ = c;
ADDRLP4 24
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 291
;291:		}
LABELV $127
LABELV $126
line 292
;292:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 293
;293:	}
LABELV $123
line 285
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $122
line 294
;294:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 296
;295:
;296:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $121
endproc Q_CleanStrWithColor 28 0
proc ArenaServers_MaxPing 8 4
line 305
;297:}
;298:
;299:
;300:/*
;301:=================
;302:ArenaServers_MaxPing
;303:=================
;304:*/
;305:static int ArenaServers_MaxPing( void ) {
line 308
;306:	int		maxPing;
;307:
;308:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $130
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 309
;309:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $131
line 310
;310:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 311
;311:	}
LABELV $131
line 312
;312:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $129
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 321
;313:}
;314:
;315:
;316:/*
;317:=================
;318:ArenaServers_Compare
;319:=================
;320:*/
;321:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 327
;322:	float			f1;
;323:	float			f2;
;324:	servernode_t*	t1;
;325:	servernode_t*	t2;
;326:
;327:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 328
;328:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 330
;329:
;330:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $134
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $134
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $162
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $162
address $136
address $137
address $138
address $152
address $157
address $147
code
LABELV $136
line 332
;331:	case SORT_HOST:
;332:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $137
line 335
;333:
;334:	case SORT_MAP:
;335:		return Q_stricmp( t1->mapname, t2->mapname );
ADDRLP4 28
CNSTI4 98
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $138
line 338
;336:
;337:	case SORT_CLIENTS:
;338:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 339
;339:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $139
line 340
;340:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 341
;341:		}
LABELV $139
line 343
;342:
;343:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 40
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 344
;344:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $141
line 345
;345:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 346
;346:		}
LABELV $141
line 348
;347:
;348:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $143
line 349
;349:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $143
line 351
;350:		}
;351:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $145
line 352
;352:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $145
line 354
;353:		}
;354:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $133
JUMPV
LABELV $147
line 357
;355:
;356:        case SORT_HUMANS:
;357:                f1 = t1->humanclients;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 358
;358:                f2 = t2->humanclients;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 360
;359:
;360:                if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $148
line 361
;361:                    return 1;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $148
line 363
;362:                }
;363:                if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $150
line 364
;364:                    return 0;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $150
line 366
;365:                }
;366:                return -1;
CNSTI4 -1
RETI4
ADDRGP4 $133
JUMPV
LABELV $152
line 369
;367:
;368:	case SORT_GAME:
;369:		if( t1->gametype < t2->gametype ) {
ADDRLP4 44
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
GEI4 $153
line 370
;370:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $133
JUMPV
LABELV $153
line 372
;371:		}
;372:		if( t1->gametype == t2->gametype ) {
ADDRLP4 48
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $155
line 373
;373:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $155
line 375
;374:		}
;375:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $157
line 378
;376:
;377:	case SORT_PING:
;378:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 52
CNSTI4 136
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
GEI4 $158
line 379
;379:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $133
JUMPV
LABELV $158
line 381
;380:		}
;381:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 56
CNSTI4 136
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
LEI4 $160
line 382
;382:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $160
line 384
;383:		}
;384:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 60
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $134
line 387
;385:	}
;386:
;387:	return 0;
CNSTI4 0
RETI4
LABELV $133
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 396
;388:}
;389:
;390:
;391:/*
;392:=================
;393:ArenaServers_Go
;394:=================
;395:*/
;396:static void ArenaServers_Go( void ) {
line 399
;397:	servernode_t*	servernode;
;398:
;399:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 140
ADDRGP4 g_arenaservers+1032+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4328+136
ADDP4
INDIRP4
ASGNP4
line 400
;400:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $168
line 401
;401:		if(servernode->needPass) {
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
line 402
;402:			UI_SpecifyPasswordMenu( va( "connect %s\n", servernode->adrstr ), servernode->hostname );
ADDRGP4 $172
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 UI_SpecifyPasswordMenu
CALLV
pop
line 403
;403:		}
ADDRGP4 $171
JUMPV
LABELV $170
line 405
;404:		else
;405:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $172
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $171
line 406
;406:	}
LABELV $168
line 407
;407:}
LABELV $163
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $174
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 415
;408:
;409:
;410:/*
;411:=================
;412:ArenaServers_UpdatePicture
;413:=================
;414:*/
;415:static void ArenaServers_UpdatePicture( void ) {
line 419
;416:	static char		picname[64];
;417:	servernode_t*	servernodeptr;
;418:
;419:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+1032+68
INDIRI4
CNSTI4 0
NEI4 $175
line 420
;420:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+1128+4
CNSTP4 0
ASGNP4
line 421
;421:	}
ADDRGP4 $176
JUMPV
LABELV $175
line 422
;422:	else {
line 423
;423:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 140
ADDRGP4 g_arenaservers+1032+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4328+136
ADDP4
INDIRP4
ASGNP4
line 424
;424:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $174
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $185
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 98
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 425
;425:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+1128+4
ADDRGP4 $174
ASGNP4
line 427
;426:	
;427:	}
LABELV $176
line 430
;428:
;429:	// force shader update during draw
;430:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+1128+68
CNSTI4 0
ASGNI4
line 431
;431:}
LABELV $173
endproc ArenaServers_UpdatePicture 4 16
export Q_strcpyColor
proc Q_strcpyColor 56 0
line 442
;432:
;433:/*
;434:=================
;435:	Q_strcpyColor - This function will return the real length of the string if numChars
;436:		len of character data is desired. It looks for color codes and adds 2 to the length
;437:		for each combo found. This is used to make color strings show up correctly in column
;438:		formatted environments. Otherwise, the columns will be off 2 * num of color codes.
;439:=================
;440:*/
;441:int Q_strcpyColor( const char *src, char *dest, int numChars )
;442:{
line 447
;443:int count, len;
;444:char *d;
;445:const char *s;
;446:
;447:	if( !src || !dest )
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $193
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $191
LABELV $193
line 448
;448:	{
line 449
;449:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $190
JUMPV
LABELV $191
line 452
;450:	}
;451:
;452:	count = len = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 453
;453:	s = src;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 454
;454:	d = dest;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 457
;455:
;456:	while( *s && count < numChars )
;457:	{
line 458
;458:		if( Q_IsColorString( s ))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $197
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $197
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $197
ADDRLP4 28
INDIRI4
CNSTI4 48
LTI4 $197
ADDRLP4 28
INDIRI4
CNSTI4 56
GTI4 $197
line 459
;459:		{
line 460
;460:			*d++ = *s++;
ADDRLP4 32
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI1
ASGNI1
line 461
;461:			*d++ = *s++;
ADDRLP4 44
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI1
ASGNI1
line 462
;462:			len += 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 463
;463:			continue;
ADDRGP4 $195
JUMPV
LABELV $197
line 465
;464:		}
;465:		*d = *s;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 466
;466:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 467
;467:		d++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 468
;468:		count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 469
;469:		len++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 470
;470:	}
LABELV $195
line 456
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $199
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $194
LABELV $199
ADDRGP4 $201
JUMPV
LABELV $200
line 474
;471:
;472:	// Now fill up the end of the string with space characters if needed...
;473:	while( count < numChars )
;474:	{
line 475
;475:		*d = ' ';
ADDRLP4 4
INDIRP4
CNSTI1 32
ASGNI1
line 477
;476:                //d[len] = ' ';
;477:		d++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 478
;478:		len++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 479
;479:		count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 480
;480:	}
LABELV $201
line 473
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $200
line 481
;481:	return len;
ADDRLP4 12
INDIRI4
RETI4
LABELV $190
endproc Q_strcpyColor 56 0
proc ArenaServers_UpdateMenu 128 20
line 490
;482:}
;483:
;484:
;485:/*
;486:=================
;487:ArenaServers_UpdateMenu
;488:=================
;489:*/
;490:static void ArenaServers_UpdateMenu( void ) {
line 499
;491:	int				i;
;492:	int				j;
;493:	int				count, bufAddr;
;494:	char*			buff;
;495:	servernode_t*	servernodeptr;
;496:	table_t*		tableptr;
;497:	char			*b, *pingColor;
;498:
;499:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+41192
INDIRI4
CNSTI4 0
LEI4 $204
line 501
;500:		// servers found
;501:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+41208
INDIRI4
CNSTI4 0
EQI4 $207
ADDRGP4 g_arenaservers+41204
INDIRI4
ADDRGP4 g_arenaservers+41192
INDIRI4
GTI4 $207
line 503
;502:			// show progress
;503:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Arena Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1480+60
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $214
ARGP4
ADDRGP4 g_arenaservers+41204
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+41192
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 504
;504:			g_arenaservers.statusbar.string  = "Refreshing servers...";
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $219
ASGNP4
line 505
;505:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+41200
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ARGI4
CNSTI4 172
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 506
;506:		}
ADDRGP4 $205
JUMPV
LABELV $207
line 507
;507:		else {
line 509
;508:			// all servers pinged - enable controls
;509:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED; 
ADDRLP4 36
ADDRGP4 g_arenaservers+488+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 510
;510:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+584+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 511
;511:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+680+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 512
;512:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+840+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 513
;513:                        g_arenaservers.onlyhumans.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+904+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 514
;514:                        g_arenaservers.hideprivate.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+968+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 515
;515:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 516
;516:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+1032+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 517
;517:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 68
ADDRGP4 g_arenaservers+1800+44
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 518
;518:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 72
ADDRGP4 g_arenaservers+2064+44
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 521
;519:
;520:			// update status bar
;521:			if( g_servertype >= UIAS_GLOBAL1 && g_servertype <= UIAS_GLOBAL5 ) {
ADDRLP4 76
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $242
ADDRLP4 76
INDIRI4
CNSTI4 5
GTI4 $242
line 522
;522:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 quake3worldMessage
ASGNP4
line 523
;523:			}
ADDRGP4 $205
JUMPV
LABELV $242
line 524
;524:			else {
line 525
;525:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $248
ASGNP4
line 526
;526:			}
line 528
;527:
;528:		}
line 529
;529:	}
ADDRGP4 $205
JUMPV
LABELV $204
line 530
;530:	else {
line 532
;531:		// no servers found
;532:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+41208
INDIRI4
CNSTI4 0
EQI4 $249
line 533
;533:			strcpy( g_arenaservers.status.string,"Scanning For Servers." );
ADDRGP4 g_arenaservers+1480+60
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 534
;534:			g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $248
ASGNP4
line 537
;535:
;536:			// disable controls during refresh
;537:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+488+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 538
;538:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+584+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 539
;539:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+680+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 540
;540:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+840+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 541
;541:                        g_arenaservers.onlyhumans.generic.flags	|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+904+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 542
;542:                        g_arenaservers.hideprivate.generic.flags	|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+968+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 543
;543:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 544
;544:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+1032+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 545
;545:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 68
ADDRGP4 g_arenaservers+1800+44
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 546
;546:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 72
ADDRGP4 g_arenaservers+2064+44
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 547
;547:		}
ADDRGP4 $250
JUMPV
LABELV $249
line 548
;548:		else {
line 549
;549:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+41192
INDIRI4
CNSTI4 0
GEI4 $277
line 550
;550:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1480+60
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 551
;551:			}
ADDRGP4 $278
JUMPV
LABELV $277
line 552
;552:			else {
line 553
;553:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1480+60
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 554
;554:			}
LABELV $278
line 557
;555:
;556:			// update status bar
;557:			if( g_servertype >= UIAS_GLOBAL1 && g_servertype <= UIAS_GLOBAL5 ) {
ADDRLP4 36
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
LTI4 $286
ADDRLP4 36
INDIRI4
CNSTI4 5
GTI4 $286
line 558
;558:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 quake3worldMessage
ASGNP4
line 559
;559:			}
ADDRGP4 $287
JUMPV
LABELV $286
line 560
;560:			else {
line 561
;561:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $248
ASGNP4
line 562
;562:			}
LABELV $287
line 565
;563:
;564:			// end of refresh - set control state
;565:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+488+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 566
;566:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+584+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 567
;567:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+680+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 568
;568:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+840+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 569
;569:                        g_arenaservers.onlyhumans.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+904+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 570
;570:                        g_arenaservers.hideprivate.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+968+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 571
;571:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 572
;572:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 68
ADDRGP4 g_arenaservers+1032+44
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 573
;573:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 72
ADDRGP4 g_arenaservers+1800+44
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 574
;574:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 76
ADDRGP4 g_arenaservers+2064+44
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 575
;575:		}
LABELV $250
line 578
;576:
;577:		// zero out list box
;578:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+1032+68
CNSTI4 0
ASGNI4
line 579
;579:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+1032+64
CNSTI4 0
ASGNI4
line 580
;580:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+1032+72
CNSTI4 0
ASGNI4
line 583
;581:
;582:		// update picture
;583:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 584
;584:		return;
ADDRGP4 $203
JUMPV
LABELV $205
line 588
;585:	}
;586:
;587:	// build list box strings - apply culling filters
;588:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 4
ADDRGP4 g_arenaservers+41200
INDIRP4
ASGNP4
line 589
;589:	count         = *g_arenaservers.numservers;
ADDRLP4 32
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ASGNI4
line 590
;590:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $323
JUMPV
LABELV $320
line 591
;591:		tableptr = &g_arenaservers.table[j];
ADDRLP4 12
CNSTI4 140
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4328
ADDP4
ASGNP4
line 592
;592:		tableptr->servernode = servernodeptr;
ADDRLP4 12
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 593
;593:		buff = tableptr->buff;
ADDRLP4 24
ADDRLP4 12
INDIRP4
ASGNP4
line 596
;594:
;595:		// can only cull valid results
;596:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $325
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $325
line 597
;597:			continue;
ADDRGP4 $321
JUMPV
LABELV $325
line 601
;598:		}
;599:
;600:                //If "Show only humans" and "Hide empty server" are enabled hide servers that only have bots
;601:                if( !g_emptyservers && g_onlyhumans && !servernodeptr->humanclients ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $327
ADDRGP4 g_onlyhumans
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $327
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $327
line 602
;602:			continue;
ADDRGP4 $321
JUMPV
LABELV $327
line 605
;603:		}
;604:
;605:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $329
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
NEI4 $329
line 606
;606:			continue;
ADDRGP4 $321
JUMPV
LABELV $329
line 609
;607:		}
;608:
;609:		switch( g_gametype ) {
ADDRLP4 52
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $331
ADDRLP4 52
INDIRI4
CNSTI4 12
GTI4 $331
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $370
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $370
address $332
address $334
address $337
address $340
address $343
address $346
address $349
address $352
address $355
address $358
address $361
address $364
address $367
code
line 611
;610:		case GAMES_ALL:
;611:			break;
LABELV $334
line 614
;612:
;613:		case GAMES_FFA:
;614:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $332
line 615
;615:				continue;
ADDRGP4 $321
JUMPV
line 617
;616:			}
;617:			break;
LABELV $337
line 620
;618:
;619:		case GAMES_TEAMPLAY:
;620:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 3
EQI4 $332
line 621
;621:				continue;
ADDRGP4 $321
JUMPV
line 623
;622:			}
;623:			break;
LABELV $340
line 626
;624:
;625:		case GAMES_TOURNEY:
;626:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1
EQI4 $332
line 627
;627:				continue;
ADDRGP4 $321
JUMPV
line 629
;628:			}
;629:			break;
LABELV $343
line 632
;630:
;631:		case GAMES_CTF:
;632:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 4
EQI4 $332
line 633
;633:				continue;
ADDRGP4 $321
JUMPV
line 635
;634:			}
;635:			break;
LABELV $346
line 638
;636:
;637:                case GAMES_1FCTF:
;638:			if( servernodeptr->gametype != GT_1FCTF ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 5
EQI4 $332
line 639
;639:				continue;
ADDRGP4 $321
JUMPV
line 641
;640:			}
;641:			break;
LABELV $349
line 644
;642:
;643:                case GAMES_OBELISK:
;644:			if( servernodeptr->gametype != GT_OBELISK ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 6
EQI4 $332
line 645
;645:				continue;
ADDRGP4 $321
JUMPV
line 647
;646:			}
;647:			break;
LABELV $352
line 650
;648:
;649:                case GAMES_HARVESTER:
;650:			if( servernodeptr->gametype != GT_HARVESTER ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 7
EQI4 $332
line 651
;651:				continue;
ADDRGP4 $321
JUMPV
line 653
;652:			}
;653:			break;
LABELV $355
line 656
;654:
;655:		case GAMES_ELIMINATION:
;656:			if( servernodeptr->gametype != GT_ELIMINATION ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 8
EQI4 $332
line 657
;657:				continue;
ADDRGP4 $321
JUMPV
line 659
;658:			}
;659:			break;
LABELV $358
line 662
;660:		
;661:		case GAMES_CTF_ELIMINATION:
;662:			if( servernodeptr->gametype != GT_CTF_ELIMINATION ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 9
EQI4 $332
line 663
;663:				continue;
ADDRGP4 $321
JUMPV
line 665
;664:			}
;665:			break;
LABELV $361
line 668
;666:
;667:		case GAMES_LMS:
;668:			if( servernodeptr->gametype != GT_LMS ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 10
EQI4 $332
line 669
;669:				continue;
ADDRGP4 $321
JUMPV
line 671
;670:			}
;671:			break;
LABELV $364
line 674
;672:
;673:		case GAMES_DOUBLE_D:
;674:			if( servernodeptr->gametype != GT_DOUBLE_D ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 11
EQI4 $332
line 675
;675:				continue;
ADDRGP4 $321
JUMPV
line 677
;676:			}
;677:			break;
LABELV $367
line 680
;678:
;679:                case GAMES_DOM:
;680:			if( servernodeptr->gametype != GT_DOMINATION ) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 12
EQI4 $332
line 681
;681:				continue;
ADDRGP4 $321
JUMPV
line 683
;682:			}
;683:			break;
LABELV $331
LABELV $332
line 686
;684:		}
;685:                
;686:                if(g_hideprivate && servernodeptr->needPass)
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 g_hideprivate
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $371
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $371
line 687
;687:                    continue;
ADDRGP4 $321
JUMPV
LABELV $371
line 689
;688:
;689:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
GEI4 $373
line 690
;690:			pingColor = S_COLOR_BLUE;
ADDRLP4 28
ADDRGP4 $375
ASGNP4
line 691
;691:		}
ADDRGP4 $374
JUMPV
LABELV $373
line 692
;692:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 68
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $376
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $376
line 693
;693:			pingColor = S_COLOR_BLUE;
ADDRLP4 28
ADDRGP4 $375
ASGNP4
line 694
;694:		}
ADDRGP4 $377
JUMPV
LABELV $376
line 695
;695:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 200
GEI4 $378
line 696
;696:			pingColor = S_COLOR_GREEN;
ADDRLP4 28
ADDRGP4 $380
ASGNP4
line 697
;697:		}
ADDRGP4 $379
JUMPV
LABELV $378
line 698
;698:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 400
GEI4 $381
line 699
;699:			pingColor = S_COLOR_YELLOW;
ADDRLP4 28
ADDRGP4 $383
ASGNP4
line 700
;700:		}
ADDRGP4 $382
JUMPV
LABELV $381
line 701
;701:		else {
line 702
;702:			pingColor = S_COLOR_RED;
ADDRLP4 28
ADDRGP4 $384
ASGNP4
line 703
;703:		}
LABELV $382
LABELV $379
LABELV $377
LABELV $374
line 711
;704:
;705:                /*
;706:		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d ", 
;707:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;708: 			servernodeptr->maxclients, servernodeptr->gamename,
;709:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime ); //, servernodeptr->bPB ? "Yes" : "No"
;710:                 */
;711:                b = buff;
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 712
;712:                *b++ = '^';
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
CNSTI1 94
ASGNI1
line 713
;713:                *b++ = '7';
ADDRLP4 76
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI1 55
ASGNI1
line 714
;714:		bufAddr = Q_strcpyColor( servernodeptr->hostname, b, 30 );
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRLP4 80
ADDRGP4 Q_strcpyColor
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 715
;715:		b += bufAddr; 
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 716
;716:		*b++ = ' ';
ADDRLP4 84
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI1 32
ASGNI1
line 717
;717:                *b++ = '^';
ADDRLP4 88
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI1 94
ASGNI1
line 718
;718:                *b++ = '7';
ADDRLP4 92
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI1 55
ASGNI1
line 720
;719:	
;720:		bufAddr = Q_strcpyColor( servernodeptr->mapname, b, 16 );
ADDRLP4 4
INDIRP4
CNSTI4 98
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 96
ADDRGP4 Q_strcpyColor
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 721
;721:		b += bufAddr;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 722
;722:		*b++ = ' ';
ADDRLP4 100
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 100
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI1 32
ASGNI1
line 724
;723:	
;724:                if(g_onlyhumans == 0)
ADDRGP4 g_onlyhumans
INDIRI4
CNSTI4 0
NEI4 $385
line 725
;725:                    Com_sprintf( b, 8, "%2d/%2d ", servernodeptr->numclients, servernodeptr->maxclients );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 $387
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $386
JUMPV
LABELV $385
line 727
;726:                else
;727:                    Com_sprintf( b, 8, "%2d/%2d ", servernodeptr->humanclients, servernodeptr->maxclients );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 $387
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $386
line 728
;728:		b += 6;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 6
ADDP4
ASGNP4
line 730
;729:	
;730:		bufAddr = Q_strcpyColor( servernodeptr->gamename, b, 8 );
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 112
ADDRGP4 Q_strcpyColor
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 112
INDIRI4
ASGNI4
line 731
;731:		b += bufAddr;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 732
;732:		*b++ = ' ';
ADDRLP4 116
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI1 32
ASGNI1
line 734
;733:                
;734:                bufAddr = Q_strcpyColor( netnames[servernodeptr->nettype], b, 3 );
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 120
ADDRGP4 Q_strcpyColor
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 120
INDIRI4
ASGNI4
line 735
;735:                b += bufAddr;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 736
;736:                *b++ = ' ';
ADDRLP4 124
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 124
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI1 32
ASGNI1
line 738
;737:                
;738:		Com_sprintf( b, 12, "%s%3d ", 	pingColor, servernodeptr->pingtime );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 $388
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 739
;739:		j++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 740
;740:	}
LABELV $321
line 590
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
ASGNP4
LABELV $323
ADDRLP4 20
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $320
line 742
;741:
;742:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+1032+68
ADDRLP4 16
INDIRI4
ASGNI4
line 743
;743:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+1032+64
CNSTI4 0
ASGNI4
line 744
;744:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+1032+72
CNSTI4 0
ASGNI4
line 747
;745:        
;746:	// update picture
;747:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 748
;748:}
LABELV $203
endproc ArenaServers_UpdateMenu 128 20
proc ArenaServers_Remove 28 12
line 757
;749:
;750:
;751:/*
;752:=================
;753:ArenaServers_Remove
;754:=================
;755:*/
;756:static void ArenaServers_Remove( void )
;757:{
line 762
;758:	int				i;
;759:	servernode_t*	servernodeptr;
;760:	table_t*		tableptr;
;761:
;762:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+1032+68
INDIRI4
CNSTI4 0
NEI4 $396
line 763
;763:		return;
ADDRGP4 $395
JUMPV
LABELV $396
line 769
;764:
;765:	// remove selected item from display list
;766:	// items are in scattered order due to sort and cull
;767:	// perform delete on list box contents, resync all lists
;768:
;769:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 140
ADDRGP4 g_arenaservers+1032+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4328
ADDP4
ASGNP4
line 770
;770:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 136
ADDP4
INDIRP4
ASGNP4
line 773
;771:
;772:        // find address in master list
;773:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $406
JUMPV
LABELV $403
line 774
;774:	{
line 775
;775:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $408
line 776
;776:		{
line 778
;777:			// delete address from master list
;778: 			if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+42248
INDIRI4
CNSTI4 1
SUBI4
GEI4 $411
line 779
;779: 			{
line 781
;780: 				// shift items up
;781: 				memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)* MAX_ADDRESSLENGTH );
ADDRLP4 20
CNSTI4 6
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 g_arenaservers+41224+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+42248
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
LSHI4
CNSTI4 64
SUBI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 782
;782:			}
LABELV $411
line 783
;783: 			g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+42248
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 784
;784: 			memset( &g_arenaservers.favoriteaddresses[g_arenaservers.numfavoriteaddresses], 0, MAX_ADDRESSLENGTH );
ADDRGP4 g_arenaservers+42248
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 785
;785: 			break;
ADDRGP4 $405
JUMPV
LABELV $408
line 787
;786:                }
;787:	}	
LABELV $404
line 773
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $406
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+42248
INDIRI4
LTI4 $403
LABELV $405
line 790
;788:
;789:	// find address in server list
;790:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $421
line 791
;791:	{
line 792
;792:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 172
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $425
line 793
;793:		{
line 795
;794:			// delete address from server list
;795: 			if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $427
line 796
;796: 			{
line 798
;797: 				// shift items up
;798: 				memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 16
CNSTI4 172
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ADDRGP4 g_favoriteserverlist+172
ADDP4
ARGP4
CNSTU4 172
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 799
;799: 			}
LABELV $427
line 800
;800: 			g_numfavoriteservers--;
ADDRLP4 12
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 801
;801: 			memset( &g_favoriteserverlist[ g_numfavoriteservers ], 0, sizeof(servernode_t));
ADDRLP4 16
CNSTI4 172
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 802
;802: 			break;
ADDRGP4 $423
JUMPV
LABELV $425
line 804
;803:                }
;804:	}	
LABELV $422
line 790
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $421
LABELV $423
line 806
;805:
;806:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+41192
ADDRGP4 g_arenaservers+42248
INDIRI4
ASGNI4
line 807
;807:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+41204
ADDRGP4 g_arenaservers+42248
INDIRI4
ASGNI4
line 808
;808:}
LABELV $395
endproc ArenaServers_Remove 28 12
proc ArenaServers_Insert 96 12
line 817
;809:
;810:
;811:/*
;812:=================
;813:ArenaServers_Insert
;814:=================
;815:*/
;816:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;817:{
line 823
;818:	servernode_t*	servernodeptr;
;819:	char*			s;
;820:	int				i;
;821:
;822:
;823:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != UIAS_FAVORITES))
ADDRLP4 12
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $435
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
EQI4 $435
line 824
;824:	{
line 826
;825:		// slow global or local servers do not get entered
;826:		return;
ADDRGP4 $434
JUMPV
LABELV $435
line 829
;827:	}
;828:
;829:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+41216
INDIRI4
LTI4 $437
line 831
;830:		// list full;
;831:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 4
CNSTI4 172
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+41200
INDIRP4
ADDP4
CNSTI4 -172
ADDP4
ASGNP4
line 832
;832:	} else {
ADDRGP4 $438
JUMPV
LABELV $437
line 834
;833:		// next slot
;834:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 4
CNSTI4 172
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+41200
INDIRP4
ADDP4
ASGNP4
line 835
;835:		(*g_arenaservers.numservers)++;
ADDRLP4 16
ADDRGP4 g_arenaservers+41196
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 836
;836:	}
LABELV $438
line 838
;837:
;838:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 840
;839:
;840:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 31
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 841
;841:	Q_CleanStrWithColor( servernodeptr->hostname );
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStrWithColor
CALLP4
pop
line 842
;842:	Q_strupr( servernodeptr->hostname );
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 844
;843:
;844:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 98
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 845
;845:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 4
INDIRP4
CNSTI4 98
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 846
;846:	Q_strupr( servernodeptr->mapname );
ADDRLP4 4
INDIRP4
CNSTI4 98
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 848
;847:
;848:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $448
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 849
;849:        servernodeptr->humanclients = atoi( Info_ValueForKey( info, "g_humanplayers") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 850
;850:        servernodeptr->needPass = atoi( Info_ValueForKey( info, "g_needpass") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 851
;851:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 852
;852:	servernodeptr->pingtime   = pingtime;
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 853
;853:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 854
;854:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 857
;855:
;856:	
;857:	s = Info_ValueForKey( info, "nettype" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 858
;858:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $455
line 859
;859:	{
line 860
;860:		if (!netnames[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $459
line 861
;861:		{
line 862
;862:			servernodeptr->nettype = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 863
;863:			break;
ADDRGP4 $457
JUMPV
LABELV $459
line 865
;864:		}
;865:		else if (!Q_stricmp( netnames[i], s ))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $461
line 866
;866:		{
line 867
;867:			servernodeptr->nettype = i;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 868
;868:			break;
ADDRGP4 $457
JUMPV
LABELV $461
line 870
;869:		}
;870:	}
LABELV $456
line 858
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $457
line 872
;871:	
;872:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 874
;873:
;874:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 84
INDIRP4
ASGNP4
line 875
;875:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 88
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 92
INDIRI4
ASGNI4
line 876
;876:	if( i < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $465
line 877
;877:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 878
;878:	}
ADDRGP4 $466
JUMPV
LABELV $465
line 879
;879:	else if( i > 11 ) {
ADDRLP4 0
INDIRI4
CNSTI4 11
LEI4 $467
line 880
;880:		i = 12;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 881
;881:	}
LABELV $467
LABELV $466
line 882
;882:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $469
line 883
;883:		servernodeptr->gametype = i;//-1;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 884
;884:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
ADDRLP4 4
INDIRP4
CNSTI4 144
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
line 885
;885:	}
ADDRGP4 $470
JUMPV
LABELV $469
line 886
;886:	else {
line 887
;887:		servernodeptr->gametype = i;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 888
;888:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamenames
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 889
;889:	}
LABELV $470
line 890
;890:}
LABELV $434
endproc ArenaServers_Insert 96 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 901
;891:
;892:
;893:/*
;894:=================
;895:ArenaServers_InsertFavorites
;896:
;897:Insert nonresponsive address book entries into display lists.
;898:=================
;899:*/
;900:void ArenaServers_InsertFavorites( void )
;901:{
line 907
;902:	int		i;
;903:	int		j;
;904:	char	info[MAX_INFO_STRING];
;905:
;906:	// resync existing results with new or deleted cvars
;907:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 908
;908:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $446
ARGP4
ADDRGP4 $472
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 909
;909:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $473
line 910
;910:	{
line 912
;911:		// find favorite address in refresh list
;912:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $478
line 913
;913:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
CNSTI4 172
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $482
line 914
;914:				break;
ADDRGP4 $480
JUMPV
LABELV $482
LABELV $479
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $481
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $478
LABELV $480
line 916
;915:
;916:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $485
line 917
;917:		{
line 919
;918:			// not in list, add it
;919:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
ADDRLP4 1036
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 920
;920:		}
LABELV $485
line 921
;921:	}
LABELV $474
line 909
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+42248
INDIRI4
LTI4 $473
line 922
;922:}
LABELV $471
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 3872 12
line 933
;923:
;924:
;925:/*
;926:=================
;927:ArenaServers_LoadFavorites
;928:
;929:Load cvar address book entries into local lists.
;930:=================
;931:*/
;932:void ArenaServers_LoadFavorites( void )
;933:{
line 942
;934:	int				i;
;935:	int				j;
;936:	int				numtempitems;
;937:	char			emptyinfo[MAX_INFO_STRING];
;938:	char			adrstr[MAX_ADDRESSLENGTH];
;939:	servernode_t	templist[MAX_FAVORITESERVERS];
;940:	qboolean		found;
;941:
;942:	found        = qfalse;
ADDRLP4 2828
CNSTI4 0
ASGNI4
line 943
;943:	emptyinfo[0] = '\0';
ADDRLP4 2832
CNSTI1 0
ASGNI1
line 946
;944:
;945:	// copy the old
;946:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 2752
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 947
;947:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 950
;948:
;949:	// clear the current for sync
;950:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2752
ARGI4
ADDRGP4 memset
CALLP4
pop
line 951
;951:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 954
;952:
;953:	// resync existing results with new or deleted cvars
;954:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 2824
CNSTI4 0
ASGNI4
LABELV $489
line 955
;955:	{
line 956
;956:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $493
ARGP4
ADDRLP4 2824
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 3856
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3856
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 957
;957:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $494
line 958
;958:			continue;
ADDRGP4 $490
JUMPV
LABELV $494
line 962
;959:
;960:		// quick sanity check to avoid slow domain name resolving
;961:		// first character must be numeric
;962:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 3860
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3860
INDIRI4
CNSTI4 48
LTI4 $498
ADDRLP4 3860
INDIRI4
CNSTI4 57
LEI4 $496
LABELV $498
line 963
;963:			continue;
ADDRGP4 $490
JUMPV
LABELV $496
line 968
;964:
;965:		// favorite server addresses must be maintained outside refresh list
;966:		// this mimics local and global netadr's stored in client
;967:		// these can be fetched to fill ping list
;968:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 971
;969:
;970:		// find this server in the old list
;971:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $503
JUMPV
LABELV $500
line 972
;972:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 172
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3864
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3864
INDIRI4
CNSTI4 0
NEI4 $504
line 973
;973:				break;
ADDRGP4 $502
JUMPV
LABELV $504
LABELV $501
line 971
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $503
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $500
LABELV $502
line 975
;974:
;975:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $506
line 976
;976:		{
line 978
;977:			// found server - add exisiting results
;978:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 3868
CNSTI4 172
ASGNI4
ADDRLP4 3868
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 3868
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 3868
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 979
;979:			found = qtrue;
ADDRLP4 2828
CNSTI4 1
ASGNI4
line 980
;980:		}
ADDRGP4 $507
JUMPV
LABELV $506
line 982
;981:		else
;982:		{
line 984
;983:			// add new server
;984:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 172
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 985
;985:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 3868
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 172
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+136
ADDP4
ADDRLP4 3868
INDIRI4
ASGNI4
line 986
;986:		}
LABELV $507
line 988
;987:
;988:		g_numfavoriteservers++;
ADDRLP4 3868
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 3868
INDIRP4
ADDRLP4 3868
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 989
;989:	}
LABELV $490
line 954
ADDRLP4 2824
ADDRLP4 2824
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2824
INDIRI4
CNSTI4 16
LTI4 $489
line 991
;990:
;991:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+42248
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 993
;992:
;993:	if (!found)
ADDRLP4 2828
INDIRI4
CNSTI4 0
NEI4 $510
line 994
;994:	{
line 997
;995:		// no results were found, reset server list
;996:		// list will be automatically refreshed when selected
;997:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 998
;998:	}
LABELV $510
line 999
;999:}
LABELV $488
endproc ArenaServers_LoadFavorites 3872 12
proc ArenaServers_StopRefresh 0 16
line 1008
;1000:
;1001:
;1002:/*
;1003:=================
;1004:ArenaServers_StopRefresh
;1005:=================
;1006:*/
;1007:static void ArenaServers_StopRefresh( void )
;1008:{
line 1009
;1009:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+41208
INDIRI4
CNSTI4 0
NEI4 $513
line 1011
;1010:		// not currently refreshing
;1011:		return;
ADDRGP4 $512
JUMPV
LABELV $513
line 1013
;1012:
;1013:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+41208
CNSTI4 0
ASGNI4
line 1015
;1014:
;1015:	if (g_servertype == UIAS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
NEI4 $517
line 1016
;1016:	{
line 1018
;1017:		// nonresponsive favorites must be shown
;1018:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 1019
;1019:	}
LABELV $517
line 1022
;1020:
;1021:	// final tally
;1022:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+41192
INDIRI4
CNSTI4 0
LTI4 $519
line 1023
;1023:	{
line 1024
;1024:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+41204
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ASGNI4
line 1025
;1025:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+41192
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ASGNI4
line 1026
;1026:	}
LABELV $519
line 1029
;1027:	
;1028:	// sort
;1029:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+41200
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ARGI4
CNSTI4 172
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1031
;1030:
;1031:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1032
;1032:}
LABELV $512
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 1041
;1033:
;1034:
;1035:/*
;1036:=================
;1037:ArenaServers_DoRefresh
;1038:=================
;1039:*/
;1040:static void ArenaServers_DoRefresh( void )
;1041:{
line 1049
;1042:	int		i;
;1043:	int		j;
;1044:	int		time;
;1045:	int		maxPing;
;1046:	char	adrstr[MAX_ADDRESSLENGTH];
;1047:	char	info[MAX_INFO_STRING];
;1048:
;1049:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+41220
INDIRI4
GEI4 $529
line 1050
;1050:	{
line 1051
;1051:	  if (g_servertype != UIAS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
EQI4 $533
line 1052
;1052:			if (g_servertype == UIAS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $535
line 1053
;1053:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $537
line 1054
;1054:					return;
ADDRGP4 $528
JUMPV
LABELV $537
line 1056
;1055:				}
;1056:			}
LABELV $535
line 1057
;1057:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $539
line 1059
;1058:			  // still waiting for response
;1059:			  return;
ADDRGP4 $528
JUMPV
LABELV $539
line 1061
;1060:			}
;1061:	  }
LABELV $533
line 1062
;1062:	}
LABELV $529
line 1064
;1063:
;1064:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+41212
INDIRI4
GEI4 $541
line 1065
;1065:	{
line 1067
;1066:		// wait for time trigger
;1067:		return;
ADDRGP4 $528
JUMPV
LABELV $541
line 1071
;1068:	}
;1069:
;1070:	// trigger at 10Hz intervals
;1071:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+41212
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1074
;1072:
;1073:	// process ping results
;1074:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 1075
;1075:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $547
line 1076
;1076:	{
line 1077
;1077:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 1078
;1078:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $551
line 1079
;1079:		{
line 1081
;1080:			// ignore empty or pending pings
;1081:			continue;
ADDRGP4 $548
JUMPV
LABELV $551
line 1085
;1082:		}
;1083:
;1084:		// find ping result in our local list
;1085:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $553
line 1086
;1086:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $557
line 1087
;1087:				break;
ADDRGP4 $555
JUMPV
LABELV $557
LABELV $554
line 1085
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $553
LABELV $555
line 1089
;1088:
;1089:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $560
line 1090
;1090:		{
line 1092
;1091:			// found it
;1092:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $562
line 1093
;1093:			{
line 1094
;1094:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1095
;1095:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $567
line 1096
;1096:				{
line 1098
;1097:					// still waiting
;1098:					continue;
ADDRGP4 $548
JUMPV
LABELV $567
line 1100
;1099:				}
;1100:			}
LABELV $562
line 1102
;1101:
;1102:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $569
line 1103
;1103:			{
line 1105
;1104:				// stale it out
;1105:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 1106
;1106:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 1107
;1107:			}
ADDRGP4 $570
JUMPV
LABELV $569
line 1109
;1108:			else
;1109:			{
line 1110
;1110:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 1111
;1111:			}
LABELV $570
line 1114
;1112:
;1113:			// insert ping results
;1114:			ArenaServers_Insert( adrstr, info, time );
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 1117
;1115:
;1116:			// clear this query from internal list
;1117:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152
ADDP4
CNSTI1 0
ASGNI1
line 1118
;1118:   		}
LABELV $560
line 1121
;1119:
;1120:		// clear this query from external list
;1121:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1122
;1122:	}
LABELV $548
line 1075
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $547
line 1126
;1123:
;1124:	// get results of servers query
;1125:	// counts can increase as servers respond
;1126:	if (g_servertype == UIAS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
NEI4 $572
line 1127
;1127:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+41192
ADDRGP4 g_arenaservers+42248
INDIRI4
ASGNI4
line 1128
;1128:	} else {
ADDRGP4 $573
JUMPV
LABELV $572
line 1129
;1129:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+41192
ADDRLP4 1108
INDIRI4
ASGNI4
line 1130
;1130:	}
LABELV $573
line 1137
;1131:
;1132://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;1133://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;1134:
;1135:	// send ping requests in reasonable bursts
;1136:	// iterate ping through all found servers
;1137:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $580
JUMPV
LABELV $577
line 1138
;1138:	{
line 1139
;1139:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $583
line 1140
;1140:		{
line 1142
;1141:			// ping queue is full
;1142:			break;
ADDRGP4 $579
JUMPV
LABELV $583
line 1146
;1143:		}
;1144:
;1145:		// find empty slot
;1146:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $585
line 1147
;1147:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $589
line 1148
;1148:				break;
ADDRGP4 $587
JUMPV
LABELV $589
LABELV $586
line 1146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $585
LABELV $587
line 1150
;1149:
;1150:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $592
line 1152
;1151:			// no empty slots available yet - wait for timeout
;1152:			break;
ADDRGP4 $579
JUMPV
LABELV $592
line 1156
;1153:
;1154:		// get an address to ping
;1155:
;1156:		if (g_servertype == UIAS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
NEI4 $594
line 1157
;1157:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+41204
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1158
;1158:		} else {
ADDRGP4 $595
JUMPV
LABELV $594
line 1159
;1159:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+41204
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 1160
;1160:		}
LABELV $595
line 1162
;1161:
;1162:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1163
;1163:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1165
;1164:
;1165:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $603
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1168
;1166:		
;1167:		// advance to next server
;1168:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+41204
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1169
;1169:	}
LABELV $578
line 1137
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $580
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $605
ADDRGP4 g_arenaservers+41204
INDIRI4
ADDRGP4 g_arenaservers+41192
INDIRI4
LTI4 $577
LABELV $605
LABELV $579
line 1171
;1170:
;1171:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $606
line 1172
;1172:	{
line 1174
;1173:		// all pings completed
;1174:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1175
;1175:		return;
ADDRGP4 $528
JUMPV
LABELV $606
line 1179
;1176:	}
;1177:
;1178:	// update the user interface with ping status
;1179:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1180
;1180:}
LABELV $528
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 1189
;1181:
;1182:
;1183:/*
;1184:=================
;1185:ArenaServers_StartRefresh
;1186:=================
;1187:*/
;1188:static void ArenaServers_StartRefresh( void )
;1189:{
line 1193
;1190:	int		i;
;1191:	char	myargs[32], protocol[32];
;1192:
;1193:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+41200
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 140
ADDRGP4 g_arenaservers+41216
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1195
;1194:
;1195:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $611
line 1196
;1196:	{
line 1197
;1197:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+2152
ADDP4
CNSTI1 0
ASGNI1
line 1198
;1198:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1199
;1199:	}
LABELV $612
line 1195
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $611
line 1201
;1200:
;1201:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+41208
CNSTI4 1
ASGNI4
line 1202
;1202:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+41204
CNSTI4 0
ASGNI4
line 1203
;1203:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+41212
CNSTI4 0
ASGNI4
line 1204
;1204:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+41196
INDIRP4
CNSTI4 0
ASGNI4
line 1205
;1205:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+41192
CNSTI4 0
ASGNI4
line 1208
;1206:
;1207:	// allow max 5 seconds for responses
;1208:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+41220
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1211
;1209:
;1210:	// place menu in zeroed state
;1211:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1213
;1212:
;1213:	if( g_servertype == UIAS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $623
line 1214
;1214:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $625
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1215
;1215:		return;
ADDRGP4 $608
JUMPV
LABELV $623
line 1218
;1216:	}
;1217:
;1218:	if( g_servertype >= UIAS_GLOBAL1 && g_servertype <= UIAS_GLOBAL5 ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $626
ADDRLP4 68
INDIRI4
CNSTI4 5
GTI4 $626
line 1219
;1219:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+584+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $628
ADDRLP4 72
INDIRI4
CNSTI4 12
GTI4 $628
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $651
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $651
address $632
address $633
address $635
address $637
address $639
address $628
address $628
address $628
address $641
address $643
address $645
address $647
address $649
code
LABELV $628
LABELV $632
line 1222
;1220:		default:
;1221:		case GAMES_ALL:
;1222:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1223
;1223:			break;
ADDRGP4 $629
JUMPV
LABELV $633
line 1226
;1224:
;1225:		case GAMES_FFA:
;1226:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $634
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1227
;1227:			break;
ADDRGP4 $629
JUMPV
LABELV $635
line 1230
;1228:
;1229:		case GAMES_TEAMPLAY:
;1230:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1231
;1231:			break;
ADDRGP4 $629
JUMPV
LABELV $637
line 1234
;1232:
;1233:		case GAMES_TOURNEY:
;1234:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $638
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1235
;1235:			break;
ADDRGP4 $629
JUMPV
LABELV $639
line 1238
;1236:
;1237:		case GAMES_CTF:
;1238:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $640
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1239
;1239:			break;
ADDRGP4 $629
JUMPV
LABELV $641
line 1242
;1240:
;1241:		case GAMES_ELIMINATION:
;1242:			strcpy( myargs, " elimination" );
ADDRLP4 36
ARGP4
ADDRGP4 $642
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1243
;1243:			break;
ADDRGP4 $629
JUMPV
LABELV $643
line 1246
;1244:
;1245:		case GAMES_CTF_ELIMINATION:
;1246:			strcpy( myargs, " ctfelimination" );
ADDRLP4 36
ARGP4
ADDRGP4 $644
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1247
;1247:			break;
ADDRGP4 $629
JUMPV
LABELV $645
line 1250
;1248:
;1249:		case GAMES_LMS:
;1250:			strcpy( myargs, " lms" );
ADDRLP4 36
ARGP4
ADDRGP4 $646
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1251
;1251:			break;
ADDRGP4 $629
JUMPV
LABELV $647
line 1254
;1252:		
;1253:		case GAMES_DOUBLE_D:
;1254:			strcpy( myargs, " dd" );
ADDRLP4 36
ARGP4
ADDRGP4 $648
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1255
;1255:			break;
ADDRGP4 $629
JUMPV
LABELV $649
line 1258
;1256:
;1257:                case GAMES_DOM:
;1258:                    strcpy( myargs, " dom" );
ADDRLP4 36
ARGP4
ADDRGP4 $650
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1259
;1259:                    break;
LABELV $629
line 1263
;1260:		}
;1261:
;1262:
;1263:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $652
line 1264
;1264:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $654
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1265
;1265:		}
LABELV $652
line 1267
;1266:
;1267:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $655
line 1268
;1268:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $657
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1269
;1269:		}
LABELV $655
line 1271
;1270:
;1271:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1272
;1272:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $658
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1273
;1273:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $659
line 1274
;1274:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", g_servertype - 1, protocol, myargs ));
ADDRGP4 $661
ARGP4
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1275
;1275:		}
ADDRGP4 $660
JUMPV
LABELV $659
line 1276
;1276:		else {
line 1277
;1277:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", g_servertype - 1, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $663
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $662
ARGP4
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 80
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1278
;1278:		}
LABELV $660
line 1279
;1279:	}
LABELV $626
line 1280
;1280:}
LABELV $608
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1289
;1281:
;1282:
;1283:/*
;1284:=================
;1285:ArenaServers_SaveChanges
;1286:=================
;1287:*/
;1288:void ArenaServers_SaveChanges( void )
;1289:{
line 1292
;1290:	int	i;
;1291:
;1292:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $668
JUMPV
LABELV $665
line 1293
;1293:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $493
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+41224
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $666
line 1292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $668
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+42248
INDIRI4
LTI4 $665
line 1295
;1294:
;1295:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $674
JUMPV
LABELV $671
line 1296
;1296:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $493
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $672
line 1295
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $674
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $671
line 1297
;1297:}
LABELV $664
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1305
;1298:
;1299:
;1300:/*
;1301:=================
;1302:ArenaServers_Sort
;1303:=================
;1304:*/
;1305:void ArenaServers_Sort( int type ) {
line 1306
;1306:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $676
line 1307
;1307:		return;
ADDRGP4 $675
JUMPV
LABELV $676
line 1310
;1308:	}
;1309:
;1310:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1311
;1311:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+41200
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ARGI4
CNSTI4 172
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1312
;1312:}
LABELV $675
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 16
line 1321
;1313:
;1314:
;1315:/*
;1316:=================
;1317:ArenaServers_SetType
;1318:=================
;1319:*/
;1320:int ArenaServers_SetType( int type )
;1321:{
line 1322
;1322:	if(type >= UIAS_GLOBAL1 && type <= UIAS_GLOBAL5)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $681
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $681
line 1323
;1323:	{
ADDRGP4 $685
JUMPV
LABELV $684
line 1327
;1324:		char masterstr[2], cvarname[sizeof("sv_master1")];
;1325:		
;1326:		while(type <= UIAS_GLOBAL5)
;1327:		{
line 1328
;1328:			Com_sprintf(cvarname, sizeof(cvarname), "sv_master%d", type);
ADDRLP4 6
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 $687
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1329
;1329:			trap_Cvar_VariableStringBuffer(cvarname, masterstr, sizeof(masterstr));
ADDRLP4 6
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1330
;1330:			if(*masterstr)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $688
line 1331
;1331:				break;
ADDRGP4 $686
JUMPV
LABELV $688
line 1333
;1332:			
;1333:			type++;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1334
;1334:		}
LABELV $685
line 1326
ADDRFP4 0
INDIRI4
CNSTI4 5
LEI4 $684
LABELV $686
line 1335
;1335:	}
LABELV $681
line 1337
;1336:
;1337:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1339
;1338:
;1339:	switch( type ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $690
ADDRLP4 4
INDIRI4
CNSTI4 6
GTI4 $690
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $710
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $710
address $692
address $698
address $698
address $698
address $698
address $698
address $704
code
LABELV $690
LABELV $692
line 1342
;1340:	default:
;1341:	case UIAS_LOCAL:
;1342:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1624+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1343
;1343:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+41200
ADDRGP4 g_localserverlist
ASGNP4
line 1344
;1344:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+41196
ADDRGP4 g_numlocalservers
ASGNP4
line 1345
;1345:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+41216
CNSTI4 124
ASGNI4
line 1346
;1346:		break;
ADDRGP4 $691
JUMPV
LABELV $698
line 1353
;1347:
;1348:	case UIAS_GLOBAL1:
;1349:	case UIAS_GLOBAL2:
;1350:	case UIAS_GLOBAL3:
;1351:	case UIAS_GLOBAL4:
;1352:	case UIAS_GLOBAL5:
;1353:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1624+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1354
;1354:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+41200
ADDRGP4 g_globalserverlist
ASGNP4
line 1355
;1355:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+41196
ADDRGP4 g_numglobalservers
ASGNP4
line 1356
;1356:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+41216
CNSTI4 256
ASGNI4
line 1357
;1357:		break;
ADDRGP4 $691
JUMPV
LABELV $704
line 1360
;1358:
;1359:	case UIAS_FAVORITES:
;1360:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 g_arenaservers+1624+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1361
;1361:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+41200
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1362
;1362:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+41196
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1363
;1363:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+41216
CNSTI4 16
ASGNI4
line 1364
;1364:		break;
LABELV $691
line 1368
;1365:
;1366:	}
;1367:
;1368:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $711
line 1369
;1369:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1370
;1370:	}
ADDRGP4 $712
JUMPV
LABELV $711
line 1371
;1371:	else {
line 1373
;1372:		// avoid slow operation, use existing results
;1373:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+41204
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ASGNI4
line 1374
;1374:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+41192
ADDRGP4 g_arenaservers+41196
INDIRP4
INDIRI4
ASGNI4
line 1375
;1375:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1376
;1376:		strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1480+60
INDIRP4
ARGP4
ADDRGP4 $720
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1377
;1377:	}
LABELV $712
line 1379
;1378:	
;1379:	return type;
ADDRFP4 0
INDIRI4
RETI4
LABELV $680
endproc ArenaServers_SetType 20 16
proc ArenaServers_Event 12 8
line 1387
;1380:}
;1381:
;1382:/*
;1383:=================
;1384:ArenaServers_Event
;1385:=================
;1386:*/
;1387:static void ArenaServers_Event( void* ptr, int event ) {
line 1390
;1388:	int		id;
;1389:
;1390:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1392
;1391:
;1392:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $722
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $722
line 1393
;1393:		return;
ADDRGP4 $721
JUMPV
LABELV $722
line 1396
;1394:	}
;1395:
;1396:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $724
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $724
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $780-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $780
address $726
address $734
address $740
address $746
address $752
address $767
address $770
address $772
address $774
address $775
address $776
address $777
address $778
address $779
address $758
address $764
code
LABELV $726
line 1398
;1397:	case ID_MASTER:
;1398:		g_arenaservers.master.curvalue = ArenaServers_SetType(g_arenaservers.master.curvalue);
ADDRGP4 g_arenaservers+488+64
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 ArenaServers_SetType
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+488+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1399
;1399:		trap_Cvar_SetValue( "ui_browserMaster", g_arenaservers.master.curvalue);
ADDRGP4 $731
ARGP4
ADDRGP4 g_arenaservers+488+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1400
;1400:		break;
ADDRGP4 $725
JUMPV
LABELV $734
line 1403
;1401:
;1402:	case ID_GAMETYPE:
;1403:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $735
ARGP4
ADDRGP4 g_arenaservers+584+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1404
;1404:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+584+64
INDIRI4
ASGNI4
line 1405
;1405:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1406
;1406:		break;
ADDRGP4 $725
JUMPV
LABELV $740
line 1409
;1407:
;1408:	case ID_SORTKEY:
;1409:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $741
ARGP4
ADDRGP4 g_arenaservers+680+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1410
;1410:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+680+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1411
;1411:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1412
;1412:		break;
ADDRGP4 $725
JUMPV
LABELV $746
line 1415
;1413:
;1414:	case ID_SHOW_FULL:
;1415:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $747
ARGP4
ADDRGP4 g_arenaservers+776+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1416
;1416:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+776+60
INDIRI4
ASGNI4
line 1417
;1417:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1418
;1418:		break;
ADDRGP4 $725
JUMPV
LABELV $752
line 1421
;1419:
;1420:	case ID_SHOW_EMPTY:
;1421:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $753
ARGP4
ADDRGP4 g_arenaservers+840+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1422
;1422:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+840+60
INDIRI4
ASGNI4
line 1423
;1423:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1424
;1424:		break;
ADDRGP4 $725
JUMPV
LABELV $758
line 1427
;1425:                
;1426:        case ID_ONLY_HUMANS:
;1427:		trap_Cvar_SetValue( "ui_browserOnlyHumans", g_arenaservers.onlyhumans.curvalue );
ADDRGP4 $759
ARGP4
ADDRGP4 g_arenaservers+904+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1428
;1428:                g_onlyhumans = g_arenaservers.onlyhumans.curvalue;
ADDRGP4 g_onlyhumans
ADDRGP4 g_arenaservers+904+60
INDIRI4
ASGNI4
line 1429
;1429:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1430
;1430:		break;
ADDRGP4 $725
JUMPV
LABELV $764
line 1434
;1431:                
;1432:        case ID_HIDE_PRIVATE:
;1433:		//trap_Cvar_SetValue( "ui_browserHidePrivate", g_arenaservers.hideprivate.curvalue );
;1434:                g_hideprivate = g_arenaservers.hideprivate.curvalue;
ADDRGP4 g_hideprivate
ADDRGP4 g_arenaservers+968+60
INDIRI4
ASGNI4
line 1435
;1435:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1436
;1436:		break;
ADDRGP4 $725
JUMPV
LABELV $767
line 1439
;1437:
;1438:	case ID_LIST:
;1439:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $725
line 1440
;1440:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1441
;1441:		}
line 1442
;1442:		break;
ADDRGP4 $725
JUMPV
LABELV $770
line 1445
;1443:
;1444:	case ID_SCROLL_UP:
;1445:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+1032
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1446
;1446:		break;
ADDRGP4 $725
JUMPV
LABELV $772
line 1449
;1447:
;1448:	case ID_SCROLL_DOWN:
;1449:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+1032
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1450
;1450:		break;
ADDRGP4 $725
JUMPV
LABELV $774
line 1453
;1451:
;1452:	case ID_BACK:
;1453:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1454
;1454:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1455
;1455:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1456
;1456:		break;
ADDRGP4 $725
JUMPV
LABELV $775
line 1459
;1457:
;1458:	case ID_REFRESH:
;1459:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1460
;1460:		break;
ADDRGP4 $725
JUMPV
LABELV $776
line 1463
;1461:
;1462:	case ID_SPECIFY:
;1463:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1464
;1464:		break;
ADDRGP4 $725
JUMPV
LABELV $777
line 1467
;1465:
;1466:	case ID_CREATE:
;1467:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1468
;1468:		break;
ADDRGP4 $725
JUMPV
LABELV $778
line 1471
;1469:
;1470:	case ID_CONNECT:
;1471:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1472
;1472:		break;
ADDRGP4 $725
JUMPV
LABELV $779
line 1475
;1473:
;1474:	case ID_REMOVE:
;1475:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1476
;1476:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1477
;1477:		break;
LABELV $724
LABELV $725
line 1479
;1478:	}
;1479:}
LABELV $721
endproc ArenaServers_Event 12 8
proc ArenaServers_MenuDraw 0 4
line 1488
;1480:
;1481:
;1482:/*
;1483:=================
;1484:ArenaServers_MenuDraw
;1485:=================
;1486:*/
;1487:static void ArenaServers_MenuDraw( void )
;1488:{
line 1489
;1489:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+41208
INDIRI4
CNSTI4 0
EQI4 $783
line 1490
;1490:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $783
line 1492
;1491:
;1492:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1493
;1493:}
LABELV $782
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1501
;1494:
;1495:
;1496:/*
;1497:=================
;1498:ArenaServers_MenuKey
;1499:=================
;1500:*/
;1501:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1502
;1502:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $787
ADDRGP4 g_arenaservers+41208
INDIRI4
CNSTI4 0
EQI4 $787
line 1503
;1503:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1504
;1504:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $786
JUMPV
LABELV $787
line 1507
;1505:	}
;1506:
;1507:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == UIAS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $793
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $790
LABELV $793
ADDRGP4 g_servertype
INDIRI4
CNSTI4 6
NEI4 $790
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+1032
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $790
line 1508
;1508:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1509
;1509:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1510
;1510:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1511
;1511:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $786
JUMPV
LABELV $790
line 1514
;1512:	}
;1513:
;1514:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $796
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $794
LABELV $796
line 1515
;1515:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1516
;1516:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1517
;1517:	}
LABELV $794
line 1519
;1518:        
;1519:        if( key == K_MWHEELUP ) {
ADDRFP4 0
INDIRI4
CNSTI4 184
NEI4 $797
line 1520
;1520:            ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+1032
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1521
;1521:        }
LABELV $797
line 1523
;1522:        
;1523:        if( key == K_MWHEELDOWN ) {
ADDRFP4 0
INDIRI4
CNSTI4 183
NEI4 $800
line 1524
;1524:            ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+1032
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1525
;1525:        }
LABELV $800
line 1528
;1526:
;1527:
;1528:	return Menu_DefaultKey( &g_arenaservers.menu, key );
ADDRGP4 g_arenaservers
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $786
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $804
skip 64
code
proc ArenaServers_MenuInit 44 16
line 1537
;1529:}
;1530:
;1531:
;1532:/*
;1533:=================
;1534:ArenaServers_MenuInit
;1535:=================
;1536:*/
;1537:static void ArenaServers_MenuInit( void ) {
line 1544
;1538:	int			i;
;1539:	int			y;
;1540:	int			value;
;1541:	static char	statusbuffer[MAX_STATUSLENGTH];
;1542:
;1543:	// zero set all our globals
;1544:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 42252
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1546
;1545:
;1546:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1548
;1547:
;1548:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+408
CNSTI4 1
ASGNI4
line 1549
;1549:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+404
CNSTI4 1
ASGNI4
line 1550
;1550:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+396
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1551
;1551:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+400
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1553
;1552:
;1553:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+416
CNSTI4 10
ASGNI4
line 1554
;1554:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+416+44
CNSTU4 8
ASGNU4
line 1555
;1555:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+416+12
CNSTI4 320
ASGNI4
line 1556
;1556:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+416+16
CNSTI4 16
ASGNI4
line 1557
;1557:	g_arenaservers.banner.string  		= "ARENA SERVERS";
ADDRGP4 g_arenaservers+416+60
ADDRGP4 $818
ASGNP4
line 1558
;1558:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+416+64
CNSTI4 1
ASGNI4
line 1559
;1559:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+416+68
ADDRGP4 color_white
ASGNP4
line 1561
;1560:
;1561:	y = 80-SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 64
ASGNI4
line 1562
;1562:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+488
CNSTI4 3
ASGNI4
line 1563
;1563:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+488+4
ADDRGP4 $826
ASGNP4
line 1564
;1564:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+488+44
CNSTU4 258
ASGNU4
line 1565
;1565:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+488+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1566
;1566:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+488+8
CNSTI4 10
ASGNI4
line 1567
;1567:	g_arenaservers.master.generic.x				= 320;
ADDRGP4 g_arenaservers+488+12
CNSTI4 320
ASGNI4
line 1568
;1568:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+488+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1569
;1569:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+488+76
ADDRGP4 master_items
ASGNP4
line 1571
;1570:
;1571:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1572
;1572:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+584
CNSTI4 3
ASGNI4
line 1573
;1573:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+584+4
ADDRGP4 $842
ASGNP4
line 1574
;1574:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+584+44
CNSTU4 258
ASGNU4
line 1575
;1575:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+584+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1576
;1576:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+584+8
CNSTI4 11
ASGNI4
line 1577
;1577:	g_arenaservers.gametype.generic.x			= 320;
ADDRGP4 g_arenaservers+584+12
CNSTI4 320
ASGNI4
line 1578
;1578:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+584+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1579
;1579:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+584+76
ADDRGP4 servertype_items
ASGNP4
line 1581
;1580:
;1581:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1582
;1582:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+680
CNSTI4 3
ASGNI4
line 1583
;1583:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+680+4
ADDRGP4 $858
ASGNP4
line 1584
;1584:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+680+44
CNSTU4 258
ASGNU4
line 1585
;1585:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+680+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1586
;1586:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+680+8
CNSTI4 12
ASGNI4
line 1587
;1587:	g_arenaservers.sortkey.generic.x			= 320;
ADDRGP4 g_arenaservers+680+12
CNSTI4 320
ASGNI4
line 1588
;1588:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+680+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1589
;1589:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+680+76
ADDRGP4 sortkey_items
ASGNP4
line 1591
;1590:
;1591:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1592
;1592:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+776
CNSTI4 5
ASGNI4
line 1593
;1593:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+776+4
ADDRGP4 $874
ASGNP4
line 1594
;1594:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+776+44
CNSTU4 258
ASGNU4
line 1595
;1595:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+776+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1596
;1596:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+776+8
CNSTI4 13
ASGNI4
line 1597
;1597:	g_arenaservers.showfull.generic.x			= 320;
ADDRGP4 g_arenaservers+776+12
CNSTI4 320
ASGNI4
line 1598
;1598:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+776+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1600
;1599:
;1600:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1601
;1601:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+840
CNSTI4 5
ASGNI4
line 1602
;1602:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+840+4
ADDRGP4 $888
ASGNP4
line 1603
;1603:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+840+44
CNSTU4 258
ASGNU4
line 1604
;1604:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+840+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1605
;1605:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+840+8
CNSTI4 14
ASGNI4
line 1606
;1606:	g_arenaservers.showempty.generic.x			= 320;
ADDRGP4 g_arenaservers+840+12
CNSTI4 320
ASGNI4
line 1607
;1607:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+840+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1609
;1608:        
;1609:        y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1610
;1610:	g_arenaservers.onlyhumans.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+904
CNSTI4 5
ASGNI4
line 1611
;1611:	g_arenaservers.onlyhumans.generic.name		= "Only humans:";
ADDRGP4 g_arenaservers+904+4
ADDRGP4 $902
ASGNP4
line 1612
;1612:	g_arenaservers.onlyhumans.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+904+44
CNSTU4 258
ASGNU4
line 1613
;1613:	g_arenaservers.onlyhumans.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+904+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1614
;1614:	g_arenaservers.onlyhumans.generic.id			= ID_ONLY_HUMANS;
ADDRGP4 g_arenaservers+904+8
CNSTI4 24
ASGNI4
line 1615
;1615:	g_arenaservers.onlyhumans.generic.x			= 320;
ADDRGP4 g_arenaservers+904+12
CNSTI4 320
ASGNI4
line 1616
;1616:	g_arenaservers.onlyhumans.generic.y			= y;
ADDRGP4 g_arenaservers+904+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1618
;1617:        
;1618:        y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1619
;1619:	g_arenaservers.hideprivate.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+968
CNSTI4 5
ASGNI4
line 1620
;1620:	g_arenaservers.hideprivate.generic.name		= "Hide private:";
ADDRGP4 g_arenaservers+968+4
ADDRGP4 $916
ASGNP4
line 1621
;1621:	g_arenaservers.hideprivate.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+968+44
CNSTU4 258
ASGNU4
line 1622
;1622:	g_arenaservers.hideprivate.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+968+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1623
;1623:	g_arenaservers.hideprivate.generic.id			= ID_HIDE_PRIVATE;
ADDRGP4 g_arenaservers+968+8
CNSTI4 25
ASGNI4
line 1624
;1624:	g_arenaservers.hideprivate.generic.x			= 320;
ADDRGP4 g_arenaservers+968+12
CNSTI4 320
ASGNI4
line 1625
;1625:	g_arenaservers.hideprivate.generic.y			= y;
ADDRGP4 g_arenaservers+968+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1627
;1626:
;1627:	y += 2 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1628
;1628:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+1032
CNSTI4 8
ASGNI4
line 1629
;1629:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+1032+44
CNSTU4 128
ASGNU4
line 1630
;1630:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+1032+8
CNSTI4 15
ASGNI4
line 1631
;1631:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1032+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1632
;1632:	g_arenaservers.list.generic.x				= 22;
ADDRGP4 g_arenaservers+1032+12
CNSTI4 22
ASGNI4
line 1633
;1633:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+1032+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1634
;1634:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+1032+80
CNSTI4 70
ASGNI4
line 1635
;1635:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+1032+84
CNSTI4 11
ASGNI4
line 1636
;1636:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+1032+76
ADDRGP4 g_arenaservers+40168
ASGNP4
line 1637
;1637:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $945
line 1638
;1638:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+40168
ADDP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4328
ADDP4
ASGNP4
line 1639
;1639:	}
LABELV $946
line 1637
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $945
line 1641
;1640:
;1641:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1128
CNSTI4 6
ASGNI4
line 1642
;1642:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1128+44
CNSTU4 16388
ASGNU4
line 1643
;1643:	g_arenaservers.mappic.generic.x				= 72;
ADDRGP4 g_arenaservers+1128+12
CNSTI4 72
ASGNI4
line 1644
;1644:	g_arenaservers.mappic.generic.y				= 80;
ADDRGP4 g_arenaservers+1128+16
CNSTI4 80
ASGNI4
line 1645
;1645:	g_arenaservers.mappic.width					= 128;
ADDRGP4 g_arenaservers+1128+76
CNSTI4 128
ASGNI4
line 1646
;1646:	g_arenaservers.mappic.height				= 96;
ADDRGP4 g_arenaservers+1128+80
CNSTI4 96
ASGNI4
line 1647
;1647:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+1128+64
ADDRGP4 $964
ASGNP4
line 1649
;1648:
;1649:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1216
CNSTI4 6
ASGNI4
line 1650
;1650:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+1216+4
ADDRGP4 $968
ASGNP4
line 1651
;1651:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1216+44
CNSTU4 16388
ASGNU4
line 1652
;1652:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1216+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1653
;1653:	g_arenaservers.arrows.generic.x				= 512+48+12;
ADDRGP4 g_arenaservers+1216+12
CNSTI4 572
ASGNI4
line 1654
;1654:	g_arenaservers.arrows.generic.y				= 240-64+48;
ADDRGP4 g_arenaservers+1216+16
CNSTI4 224
ASGNI4
line 1655
;1655:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+1216+76
CNSTI4 64
ASGNI4
line 1656
;1656:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+1216+80
CNSTI4 128
ASGNI4
line 1658
;1657:
;1658:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1304
CNSTI4 6
ASGNI4
line 1659
;1659:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1304+44
CNSTU4 2308
ASGNU4
line 1660
;1660:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1304+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1661
;1661:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1304+8
CNSTI4 16
ASGNI4
line 1662
;1662:	g_arenaservers.up.generic.x					= 512+48+12;
ADDRGP4 g_arenaservers+1304+12
CNSTI4 572
ASGNI4
line 1663
;1663:	g_arenaservers.up.generic.y					= 240-64+48;
ADDRGP4 g_arenaservers+1304+16
CNSTI4 224
ASGNI4
line 1664
;1664:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1304+76
CNSTI4 64
ASGNI4
line 1665
;1665:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1304+80
CNSTI4 64
ASGNI4
line 1666
;1666:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1304+60
ADDRGP4 $998
ASGNP4
line 1668
;1667:
;1668:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1392
CNSTI4 6
ASGNI4
line 1669
;1669:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1392+44
CNSTU4 2308
ASGNU4
line 1670
;1670:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1392+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1671
;1671:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1392+8
CNSTI4 17
ASGNI4
line 1672
;1672:	g_arenaservers.down.generic.x				= 512+48+12;
ADDRGP4 g_arenaservers+1392+12
CNSTI4 572
ASGNI4
line 1673
;1673:	g_arenaservers.down.generic.y				= 240+48;
ADDRGP4 g_arenaservers+1392+16
CNSTI4 288
ASGNI4
line 1674
;1674:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1392+76
CNSTI4 64
ASGNI4
line 1675
;1675:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1392+80
CNSTI4 64
ASGNI4
line 1676
;1676:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $1016
ASGNP4
line 1678
;1677:
;1678:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1679
;1679:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1480
CNSTI4 7
ASGNI4
line 1680
;1680:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1480+12
CNSTI4 320
ASGNI4
line 1681
;1681:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1480+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1682
;1682:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1480+60
ADDRGP4 $804
ASGNP4
line 1683
;1683:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1480+64
CNSTI4 17
ASGNI4
line 1684
;1684:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1480+68
ADDRGP4 menu_text_color
ASGNP4
line 1686
;1685:
;1686:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1687
;1687:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1552
CNSTI4 7
ASGNI4
line 1688
;1688:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1552+12
CNSTI4 320
ASGNI4
line 1689
;1689:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1690
;1690:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $248
ASGNP4
line 1691
;1691:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1552+64
CNSTI4 17
ASGNI4
line 1692
;1692:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1552+68
ADDRGP4 text_color_normal
ASGNP4
line 1694
;1693:
;1694:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1624
CNSTI4 6
ASGNI4
line 1695
;1695:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1624+4
ADDRGP4 $1042
ASGNP4
line 1696
;1696:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1624+44
CNSTU4 260
ASGNU4
line 1697
;1697:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1624+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1698
;1698:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1624+8
CNSTI4 23
ASGNI4
line 1699
;1699:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1624+12
CNSTI4 450
ASGNI4
line 1700
;1700:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1624+16
CNSTI4 86
ASGNI4
line 1701
;1701:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1624+76
CNSTI4 96
ASGNI4
line 1702
;1702:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1624+80
CNSTI4 48
ASGNI4
line 1703
;1703:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1624+60
ADDRGP4 $1059
ASGNP4
line 1705
;1704:
;1705:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1712
CNSTI4 6
ASGNI4
line 1706
;1706:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1712+4
ADDRGP4 $1063
ASGNP4
line 1707
;1707:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1712+44
CNSTU4 260
ASGNU4
line 1708
;1708:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1712+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1709
;1709:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1712+8
CNSTI4 18
ASGNI4
line 1710
;1710:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1712+12
CNSTI4 0
ASGNI4
line 1711
;1711:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1712+16
CNSTI4 416
ASGNI4
line 1712
;1712:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1712+76
CNSTI4 128
ASGNI4
line 1713
;1713:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1712+80
CNSTI4 64
ASGNI4
line 1714
;1714:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1712+60
ADDRGP4 $1080
ASGNP4
line 1716
;1715:
;1716:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1888
CNSTI4 6
ASGNI4
line 1717
;1717:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1888+4
ADDRGP4 $1084
ASGNP4
line 1718
;1718:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1888+44
CNSTU4 260
ASGNU4
line 1719
;1719:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1888+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1720
;1720:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1888+8
CNSTI4 20
ASGNI4
line 1721
;1721:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1888+12
CNSTI4 128
ASGNI4
line 1722
;1722:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1888+16
CNSTI4 416
ASGNI4
line 1723
;1723:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1888+76
CNSTI4 128
ASGNI4
line 1724
;1724:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1888+80
CNSTI4 64
ASGNI4
line 1725
;1725:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1888+60
ADDRGP4 $1101
ASGNP4
line 1727
;1726:
;1727:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1800
CNSTI4 6
ASGNI4
line 1728
;1728:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1800+4
ADDRGP4 $1105
ASGNP4
line 1729
;1729:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1800+44
CNSTU4 260
ASGNU4
line 1730
;1730:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1800+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1731
;1731:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1800+8
CNSTI4 19
ASGNI4
line 1732
;1732:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1800+12
CNSTI4 256
ASGNI4
line 1733
;1733:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1800+16
CNSTI4 416
ASGNI4
line 1734
;1734:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1800+76
CNSTI4 128
ASGNI4
line 1735
;1735:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1800+80
CNSTI4 64
ASGNI4
line 1736
;1736:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1800+60
ADDRGP4 $1122
ASGNP4
line 1738
;1737:
;1738:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1976
CNSTI4 6
ASGNI4
line 1739
;1739:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1976+4
ADDRGP4 $1126
ASGNP4
line 1740
;1740:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1976+44
CNSTU4 260
ASGNU4
line 1741
;1741:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1976+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1742
;1742:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1976+8
CNSTI4 21
ASGNI4
line 1743
;1743:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1976+12
CNSTI4 384
ASGNI4
line 1744
;1744:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1976+16
CNSTI4 416
ASGNI4
line 1745
;1745:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1976+76
CNSTI4 128
ASGNI4
line 1746
;1746:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1976+80
CNSTI4 64
ASGNI4
line 1747
;1747:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1976+60
ADDRGP4 $1143
ASGNP4
line 1749
;1748:
;1749:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2064
CNSTI4 6
ASGNI4
line 1750
;1750:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+2064+4
ADDRGP4 $1147
ASGNP4
line 1751
;1751:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+2064+44
CNSTU4 272
ASGNU4
line 1752
;1752:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+2064+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1753
;1753:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+2064+8
CNSTI4 22
ASGNI4
line 1754
;1754:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+2064+12
CNSTI4 640
ASGNI4
line 1755
;1755:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+2064+16
CNSTI4 416
ASGNI4
line 1756
;1756:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+2064+76
CNSTI4 128
ASGNI4
line 1757
;1757:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+2064+80
CNSTI4 64
ASGNI4
line 1758
;1758:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+2064+60
ADDRGP4 $1164
ASGNP4
line 1760
;1759:	
;1760:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1762
;1761:
;1762:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1763
;1763:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1764
;1764:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1765
;1765:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1766
;1766:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1767
;1767:        Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.onlyhumans );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1768
;1768:        Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.hideprivate );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1770
;1769:
;1770:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1128
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1771
;1771:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1032
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1772
;1772:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1480
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1773
;1773:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1774
;1774:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1216
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1775
;1775:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1304
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1776
;1776:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1778
;1777:
;1778:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1779
;1779:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1780
;1780:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1888
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1781
;1781:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1800
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1782
;1782:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1976
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1783
;1783:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2064
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1785
;1784:	
;1785:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1787
;1786:
;1787:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRGP4 ui_browserMaster+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_servertype
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1789
;1788:	// hack to get rid of MPlayer stuff
;1789:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1790
;1790:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1187
line 1791
;1791:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1187
line 1792
;1792:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+488+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1794
;1793:
;1794:	g_gametype = Com_Clamp( 0, 12, ui_browserGameType.integer );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1795
;1795:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+584+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1797
;1796:
;1797:	g_sortkey = Com_Clamp( 0, 5, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1084227584
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1798
;1798:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+680+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1800
;1799:
;1800:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1801
;1801:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+776+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1803
;1802:
;1803:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1804
;1804:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+840+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1806
;1805:	
;1806:        g_arenaservers.onlyhumans.curvalue = Com_Clamp( 0, 1, ui_browserOnlyHumans.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserOnlyHumans+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+904+60
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1807
;1807:        g_onlyhumans = ui_browserOnlyHumans.integer;
ADDRGP4 g_onlyhumans
ADDRGP4 ui_browserOnlyHumans+12
INDIRI4
ASGNI4
line 1809
;1808:        
;1809:        g_arenaservers.hideprivate.curvalue = 1; //Com_Clamp( 0, 1, ui_browserOnlyHumans.integer );
ADDRGP4 g_arenaservers+968+60
CNSTI4 1
ASGNI4
line 1810
;1810:        g_hideprivate = 1; //ui_browserOnlyHumans.integer;
ADDRGP4 g_hideprivate
CNSTI4 1
ASGNI4
line 1813
;1811:
;1812:	// force to initial state and refresh
;1813:	g_arenaservers.master.curvalue = g_servertype = ArenaServers_SetType(g_servertype);
ADDRLP4 36
ADDRGP4 g_servertype
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 ArenaServers_SetType
CALLI4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 g_arenaservers+488+64
ADDRLP4 40
INDIRI4
ASGNI4
line 1815
;1814:
;1815:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $658
ARGP4
ADDRGP4 $248
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1816
;1816:}
LABELV $803
endproc ArenaServers_MenuInit 44 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1824
;1817:
;1818:
;1819:/*
;1820:=================
;1821:ArenaServers_Cache
;1822:=================
;1823:*/
;1824:void ArenaServers_Cache( void ) {
line 1825
;1825:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $1063
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1826
;1826:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1080
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1827
;1827:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1126
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1828
;1828:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1143
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1829
;1829:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1084
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1830
;1830:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1101
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1831
;1831:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1105
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1832
;1832:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1122
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1833
;1833:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1147
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1834
;1834:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1164
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1835
;1835:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $968
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1836
;1836:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $998
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1837
;1837:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $1016
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1838
;1838:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $964
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1839
;1839:}
LABELV $1211
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1847
;1840:
;1841:
;1842:/*
;1843:=================
;1844:UI_ArenaServersMenu
;1845:=================
;1846:*/
;1847:void UI_ArenaServersMenu( void ) {
line 1848
;1848:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1849
;1849:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1850
;1850:}						  
LABELV $1212
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_hideprivate
skip 4
align 4
LABELV g_onlyhumans
skip 4
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 2752
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 21328
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 44032
align 4
LABELV g_arenaservers
skip 42252
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
LABELV $1164
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
LABELV $1147
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
LABELV $1143
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
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1126
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
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1122
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1105
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1101
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1084
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1080
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
LABELV $1063
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
LABELV $1059
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
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1042
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
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1016
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $998
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $968
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $964
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
LABELV $916
byte 1 72
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $902
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $888
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $874
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $858
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $842
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
LABELV $826
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $818
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $759
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
LABELV $753
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
LABELV $747
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
LABELV $741
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
LABELV $735
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
LABELV $731
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
LABELV $720
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $687
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $683
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $663
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $662
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $661
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $657
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $654
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $650
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $648
byte 1 32
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $646
byte 1 32
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $644
byte 1 32
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
LABELV $642
byte 1 32
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
LABELV $640
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $638
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $636
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $634
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $625
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $603
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $493
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $472
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $464
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
LABELV $463
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $454
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $453
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $452
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $451
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
LABELV $450
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $449
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $448
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $447
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $446
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
LABELV $388
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $387
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $384
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $383
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $380
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $375
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $285
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $282
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $254
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $248
byte 1 0
align 1
LABELV $219
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $214
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $185
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
LABELV $172
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $117
byte 1 73
byte 1 80
byte 1 54
byte 1 0
align 1
LABELV $116
byte 1 73
byte 1 80
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $114
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $113
byte 1 85
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 84
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $112
byte 1 81
byte 1 51
byte 1 70
byte 1 0
align 1
LABELV $111
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $110
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
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $108
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $107
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $106
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $105
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $104
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $98
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
LABELV $97
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
LABELV $96
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
LABELV $95
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
LABELV $94
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
LABELV $93
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
LABELV $92
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
LABELV $91
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
LABELV $90
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
LABELV $89
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
LABELV $88
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
LABELV $87
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
align 1
LABELV $86
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $85
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $84
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 40
byte 1 53
byte 1 41
byte 1 0
align 1
LABELV $83
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 40
byte 1 52
byte 1 41
byte 1 0
align 1
LABELV $82
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 40
byte 1 51
byte 1 41
byte 1 0
align 1
LABELV $81
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 40
byte 1 50
byte 1 41
byte 1 0
align 1
LABELV $80
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $79
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
