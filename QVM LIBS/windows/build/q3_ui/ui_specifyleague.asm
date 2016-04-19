data
align 4
LABELV specifyleague_artlist
address $79
address $80
address $81
address $82
address $83
address $84
address $85
address $86
address $87
byte 4 0
code
proc SpecifyLeague_GetList 104 12
file "../../../code/q3_ui/ui_specifyleague.c"
line 94
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
;23:#include "ui_local.h"
;24:
;25:/*********************************************************************************
;26:	SPECIFY SERVER
;27:*********************************************************************************/
;28:
;29:#define MAX_LISTBOXITEMS		128
;30:#define MAX_LISTBOXWIDTH		40
;31:#define MAX_LEAGUENAME			80
;32:
;33:#define SPECIFYLEAGUE_FRAMEL	"menu/art_blueish/frame2_l"
;34:#define SPECIFYLEAGUE_FRAMER	"menu/art_blueish/frame1_r"
;35:#define SPECIFYLEAGUE_BACK0		"menu/art_blueish/back_0"
;36:#define SPECIFYLEAGUE_BACK1		"menu/art_blueish/back_1"
;37:#define SPECIFYLEAGUE_ARROWS0	"menu/art_blueish/arrows_vert_0"
;38:#define SPECIFYLEAGUE_UP		"menu/art_blueish/arrows_vert_top"
;39:#define SPECIFYLEAGUE_DOWN		"menu/art_blueish/arrows_vert_bot"
;40:#define GLOBALRANKINGS_LOGO		"menu/art/gr/grlogo"
;41:#define GLOBALRANKINGS_LETTERS	"menu/art/gr/grletters"
;42:
;43:#define ID_SPECIFYLEAGUENAME	100
;44:#define ID_SPECIFYLEAGUELIST	101
;45:#define ID_SPECIFYLEAGUEUP		102
;46:#define ID_SPECIFYLEAGUEDOWN	103
;47:#define ID_SPECIFYLEAGUEBACK	104
;48:
;49:static char* specifyleague_artlist[] =
;50:{
;51:	SPECIFYLEAGUE_FRAMEL,
;52:	SPECIFYLEAGUE_FRAMER,
;53:	SPECIFYLEAGUE_ARROWS0,	
;54:	SPECIFYLEAGUE_UP,	
;55:	SPECIFYLEAGUE_DOWN,	
;56:	SPECIFYLEAGUE_BACK0,	
;57:	SPECIFYLEAGUE_BACK1,
;58:	GLOBALRANKINGS_LOGO,
;59:	GLOBALRANKINGS_LETTERS,
;60:	NULL
;61:};
;62:
;63:static char playername[80];
;64:
;65:typedef struct
;66:{
;67:	menuframework_s	menu;
;68:	menutext_s		banner;
;69:	menubitmap_s	framel;
;70:	menubitmap_s	framer;
;71:	menufield_s		rankname;
;72:	menulist_s		list;
;73:	menubitmap_s	arrows;
;74:	menubitmap_s	up;
;75:	menubitmap_s	down;
;76:	menubitmap_s	back;
;77:	menubitmap_s	grlogo;
;78:	menubitmap_s	grletters;
;79:} specifyleague_t;
;80:
;81:static specifyleague_t	s_specifyleague;
;82:
;83:
;84:typedef struct {
;85:	char			buff[MAX_LISTBOXWIDTH];
;86:	char			leaguename[MAX_LEAGUENAME];
;87:} table_t;
;88:
;89:table_t league_table[MAX_LISTBOXITEMS];
;90:char *leaguename_items[MAX_LISTBOXITEMS];
;91:
;92:
;93:static void SpecifyLeague_GetList()
;94:{
line 95
;95:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 98
;96:	int i;
;97:	/* The Player Name has changed. We need to perform another search */
;98:	Q_strncpyz( playername,
ADDRGP4 playername
ARGP4
ADDRGP4 s_specifyleague+664+60+12
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 102
;99:		s_specifyleague.rankname.field.buffer, 
;100:		sizeof(playername) );
;101:
;102:	count = trap_CL_UI_RankGetLeauges( playername );
ADDRGP4 playername
ARGP4
ADDRLP4 8
ADDRGP4 trap_CL_UI_RankGetLeauges
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 104
;103:
;104:	for(i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $94
line 105
;105:	{
line 108
;106:		char	s[MAX_LEAGUENAME];
;107:		const char	*var;
;108:		var = va( "leaguename%i", i+1 );
ADDRGP4 $98
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 96
INDIRP4
ASGNP4
line 109
;109:		trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 110
;110:		Q_strncpyz(league_table[i].leaguename, s, sizeof(league_table[i].leaguename) );
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 111
;111:		Q_strncpyz(league_table[i].buff, league_table[i].leaguename, sizeof(league_table[i].buff) );
ADDRLP4 100
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 league_table
ADDP4
ARGP4
ADDRLP4 100
INDIRI4
ADDRGP4 league_table+40
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 112
;112:	}
LABELV $95
line 104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $97
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $94
line 114
;113:
;114:	s_specifyleague.list.numitems = count;
ADDRGP4 s_specifyleague+996+68
ADDRLP4 4
INDIRI4
ASGNI4
line 115
;115:}
LABELV $90
endproc SpecifyLeague_GetList 104 12
proc SpecifyLeague_Event 16 12
line 123
;116:
;117:/*
;118:=================
;119:SpecifyLeague_Event
;120:=================
;121:*/
;122:static void SpecifyLeague_Event( void* ptr, int event )
;123:{
line 125
;124:	int		id;
;125:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 130
;126:	//if( event != QM_ACTIVATED && id != ID_SPECIFYLEAGUELIST ) {
;127:	//	return;
;128:	//}
;129:
;130:	switch (id)
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 100
LTI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 104
GTI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $134-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $134
address $118
address $107
address $110
address $114
address $127
code
line 131
;131:	{
LABELV $107
line 133
;132:		case ID_SPECIFYLEAGUELIST:
;133:			if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $106
line 135
;134:				//ArenaServers_UpdatePicture();
;135:			}
line 136
;136:		break;
ADDRGP4 $106
JUMPV
LABELV $110
line 139
;137:
;138:		case ID_SPECIFYLEAGUEUP:
;139:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $106
line 140
;140:				ScrollList_Key( &s_specifyleague.list, K_UPARROW );
ADDRGP4 s_specifyleague+996
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 141
;141:		break;		
ADDRGP4 $106
JUMPV
LABELV $114
line 144
;142:	
;143:		case ID_SPECIFYLEAGUEDOWN:
;144:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $106
line 145
;145:				ScrollList_Key( &s_specifyleague.list, K_DOWNARROW );
ADDRGP4 s_specifyleague+996
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 146
;146:		break;
ADDRGP4 $106
JUMPV
LABELV $118
line 149
;147:			
;148:		case ID_SPECIFYLEAGUENAME:
;149:			if( (event == QM_LOSTFOCUS) && 
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $106
ADDRGP4 s_specifyleague+664+60+12
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 playername
ARGP4
ADDRGP4 s_specifyleague+664+60+12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $106
line 153
;150:				(Q_strncmp(playername, 
;151:					s_specifyleague.rankname.field.buffer, 
;152:					strlen(s_specifyleague.rankname.field.buffer)) != 0))
;153:			{
line 154
;154:				SpecifyLeague_GetList();
ADDRGP4 SpecifyLeague_GetList
CALLV
pop
line 155
;155:			}
line 156
;156:		break;
ADDRGP4 $106
JUMPV
LABELV $127
line 159
;157:
;158:		case ID_SPECIFYLEAGUEBACK:
;159:			if( event == QM_ACTIVATED )
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $106
line 160
;160:			{
line 161
;161:				trap_Cvar_Set( "sv_leagueName", league_table[s_specifyleague.list.curvalue].leaguename);
ADDRGP4 $130
ARGP4
CNSTI4 120
ADDRGP4 s_specifyleague+996+64
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 162
;162:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 163
;163:			}
line 164
;164:		break;
LABELV $105
LABELV $106
line 166
;165:	}
;166:}
LABELV $104
endproc SpecifyLeague_Event 16 12
export SpecifyLeague_MenuInit
proc SpecifyLeague_MenuInit 12 12
line 174
;167:
;168:/*
;169:=================
;170:SpecifyLeague_MenuInit
;171:=================
;172:*/
;173:void SpecifyLeague_MenuInit( void )
;174:{
line 177
;175:	int i;
;176:	// zero set all our globals
;177:	memset( &s_specifyleague, 0 ,sizeof(specifyleague_t) );
ADDRGP4 s_specifyleague
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1620
ARGI4
ADDRGP4 memset
CALLP4
pop
line 179
;178:
;179:	SpecifyLeague_Cache();
ADDRGP4 SpecifyLeague_Cache
CALLV
pop
line 181
;180:
;181:	s_specifyleague.menu.wrapAround = qtrue;
ADDRGP4 s_specifyleague+404
CNSTI4 1
ASGNI4
line 182
;182:	s_specifyleague.menu.fullscreen = qtrue;
ADDRGP4 s_specifyleague+408
CNSTI4 1
ASGNI4
line 184
;183:
;184:	s_specifyleague.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_specifyleague+416
CNSTI4 10
ASGNI4
line 185
;185:	s_specifyleague.banner.generic.x     = 320;
ADDRGP4 s_specifyleague+416+12
CNSTI4 320
ASGNI4
line 186
;186:	s_specifyleague.banner.generic.y     = 16;
ADDRGP4 s_specifyleague+416+16
CNSTI4 16
ASGNI4
line 187
;187:	s_specifyleague.banner.string		 = "CHOOSE LEAGUE";
ADDRGP4 s_specifyleague+416+60
ADDRGP4 $146
ASGNP4
line 188
;188:	s_specifyleague.banner.color  		 = color_white;
ADDRGP4 s_specifyleague+416+68
ADDRGP4 color_white
ASGNP4
line 189
;189:	s_specifyleague.banner.style  		 = UI_CENTER;
ADDRGP4 s_specifyleague+416+64
CNSTI4 1
ASGNI4
line 191
;190:
;191:	s_specifyleague.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+488
CNSTI4 6
ASGNI4
line 192
;192:	s_specifyleague.framel.generic.name  = SPECIFYLEAGUE_FRAMEL;
ADDRGP4 s_specifyleague+488+4
ADDRGP4 $79
ASGNP4
line 193
;193:	s_specifyleague.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+488+44
CNSTU4 16384
ASGNU4
line 194
;194:	s_specifyleague.framel.generic.x	 = 0;  
ADDRGP4 s_specifyleague+488+12
CNSTI4 0
ASGNI4
line 195
;195:	s_specifyleague.framel.generic.y	 = 78;
ADDRGP4 s_specifyleague+488+16
CNSTI4 78
ASGNI4
line 196
;196:	s_specifyleague.framel.width  	     = 256;
ADDRGP4 s_specifyleague+488+76
CNSTI4 256
ASGNI4
line 197
;197:	s_specifyleague.framel.height  	     = 334;
ADDRGP4 s_specifyleague+488+80
CNSTI4 334
ASGNI4
line 199
;198:
;199:	s_specifyleague.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+576
CNSTI4 6
ASGNI4
line 200
;200:	s_specifyleague.framer.generic.name  = SPECIFYLEAGUE_FRAMER;
ADDRGP4 s_specifyleague+576+4
ADDRGP4 $80
ASGNP4
line 201
;201:	s_specifyleague.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+576+44
CNSTU4 16384
ASGNU4
line 202
;202:	s_specifyleague.framer.generic.x	 = 376;
ADDRGP4 s_specifyleague+576+12
CNSTI4 376
ASGNI4
line 203
;203:	s_specifyleague.framer.generic.y	 = 76;
ADDRGP4 s_specifyleague+576+16
CNSTI4 76
ASGNI4
line 204
;204:	s_specifyleague.framer.width  	     = 256;
ADDRGP4 s_specifyleague+576+76
CNSTI4 256
ASGNI4
line 205
;205:	s_specifyleague.framer.height  	     = 334;
ADDRGP4 s_specifyleague+576+80
CNSTI4 334
ASGNI4
line 207
;206:
;207:	s_specifyleague.grlogo.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1444
CNSTI4 6
ASGNI4
line 208
;208:	s_specifyleague.grlogo.generic.name  = GLOBALRANKINGS_LOGO;
ADDRGP4 s_specifyleague+1444+4
ADDRGP4 $86
ASGNP4
line 209
;209:	s_specifyleague.grlogo.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyleague+1444+44
CNSTU4 16384
ASGNU4
line 210
;210:	s_specifyleague.grlogo.generic.x	 = 0;
ADDRGP4 s_specifyleague+1444+12
CNSTI4 0
ASGNI4
line 211
;211:	s_specifyleague.grlogo.generic.y	 = 0;
ADDRGP4 s_specifyleague+1444+16
CNSTI4 0
ASGNI4
line 212
;212:	s_specifyleague.grlogo.width		 = 64;
ADDRGP4 s_specifyleague+1444+76
CNSTI4 64
ASGNI4
line 213
;213:	s_specifyleague.grlogo.height		 = 128;
ADDRGP4 s_specifyleague+1444+80
CNSTI4 128
ASGNI4
line 215
;214:
;215:	s_specifyleague.rankname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyleague+664
CNSTI4 4
ASGNI4
line 216
;216:	s_specifyleague.rankname.generic.name       = "Player Name:";
ADDRGP4 s_specifyleague+664+4
ADDRGP4 $193
ASGNP4
line 217
;217:	s_specifyleague.rankname.generic.flags      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_specifyleague+664+44
CNSTU4 258
ASGNU4
line 218
;218:	s_specifyleague.rankname.generic.callback   = SpecifyLeague_Event;
ADDRGP4 s_specifyleague+664+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 219
;219:	s_specifyleague.rankname.generic.id	        = ID_SPECIFYLEAGUENAME;
ADDRGP4 s_specifyleague+664+8
CNSTI4 100
ASGNI4
line 220
;220:	s_specifyleague.rankname.generic.x	        = 226;
ADDRGP4 s_specifyleague+664+12
CNSTI4 226
ASGNI4
line 221
;221:	s_specifyleague.rankname.generic.y	        = 128;
ADDRGP4 s_specifyleague+664+16
CNSTI4 128
ASGNI4
line 222
;222:	s_specifyleague.rankname.field.widthInChars = 32;
ADDRGP4 s_specifyleague+664+60+8
CNSTI4 32
ASGNI4
line 223
;223:	s_specifyleague.rankname.field.maxchars     = 80;
ADDRGP4 s_specifyleague+664+60+268
CNSTI4 80
ASGNI4
line 225
;224:
;225:	s_specifyleague.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 s_specifyleague+996
CNSTI4 8
ASGNI4
line 226
;226:	s_specifyleague.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_specifyleague+996+44
CNSTU4 128
ASGNU4
line 227
;227:	s_specifyleague.list.generic.id				= ID_SPECIFYLEAGUELIST;
ADDRGP4 s_specifyleague+996+8
CNSTI4 101
ASGNI4
line 228
;228:	s_specifyleague.list.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+996+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 229
;229:	s_specifyleague.list.generic.x				= 160;
ADDRGP4 s_specifyleague+996+12
CNSTI4 160
ASGNI4
line 230
;230:	s_specifyleague.list.generic.y				= 200;
ADDRGP4 s_specifyleague+996+16
CNSTI4 200
ASGNI4
line 231
;231:	s_specifyleague.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 s_specifyleague+996+80
CNSTI4 40
ASGNI4
line 232
;232:	s_specifyleague.list.height					= 8;
ADDRGP4 s_specifyleague+996+84
CNSTI4 8
ASGNI4
line 233
;233:	s_specifyleague.list.itemnames				= (const char **)leaguename_items;
ADDRGP4 s_specifyleague+996+76
ADDRGP4 leaguename_items
ASGNP4
line 234
;234:	s_specifyleague.list.numitems               = 0;
ADDRGP4 s_specifyleague+996+68
CNSTI4 0
ASGNI4
line 235
;235:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $229
line 236
;236:		league_table[i].buff[0] = 0;
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table
ADDP4
CNSTI1 0
ASGNI1
line 237
;237:		league_table[i].leaguename[0] = 0;
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table+40
ADDP4
CNSTI1 0
ASGNI1
line 238
;238:		leaguename_items[i] = league_table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaguename_items
ADDP4
CNSTI4 120
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 league_table
ADDP4
ASGNP4
line 239
;239:	}
LABELV $230
line 235
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $229
line 241
;240:	
;241:	s_specifyleague.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1092
CNSTI4 6
ASGNI4
line 242
;242:	s_specifyleague.arrows.generic.name			= SPECIFYLEAGUE_ARROWS0;
ADDRGP4 s_specifyleague+1092+4
ADDRGP4 $81
ASGNP4
line 243
;243:	s_specifyleague.arrows.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_specifyleague+1092+44
CNSTU4 16388
ASGNU4
line 244
;244:	s_specifyleague.arrows.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1092+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 245
;245:	s_specifyleague.arrows.generic.x			= 512;
ADDRGP4 s_specifyleague+1092+12
CNSTI4 512
ASGNI4
line 246
;246:	s_specifyleague.arrows.generic.y			= 240-64+16;
ADDRGP4 s_specifyleague+1092+16
CNSTI4 192
ASGNI4
line 247
;247:	s_specifyleague.arrows.width				= 64;
ADDRGP4 s_specifyleague+1092+76
CNSTI4 64
ASGNI4
line 248
;248:	s_specifyleague.arrows.height				= 128;
ADDRGP4 s_specifyleague+1092+80
CNSTI4 128
ASGNI4
line 250
;249:
;250:	s_specifyleague.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1180
CNSTI4 6
ASGNI4
line 251
;251:	s_specifyleague.up.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_specifyleague+1180+44
CNSTU4 2308
ASGNU4
line 252
;252:	s_specifyleague.up.generic.callback			= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1180+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 253
;253:	s_specifyleague.up.generic.id				= ID_SPECIFYLEAGUEUP;
ADDRGP4 s_specifyleague+1180+8
CNSTI4 102
ASGNI4
line 254
;254:	s_specifyleague.up.generic.x				= 512;
ADDRGP4 s_specifyleague+1180+12
CNSTI4 512
ASGNI4
line 255
;255:	s_specifyleague.up.generic.y				= 240-64+16;
ADDRGP4 s_specifyleague+1180+16
CNSTI4 192
ASGNI4
line 256
;256:	s_specifyleague.up.width					= 64;
ADDRGP4 s_specifyleague+1180+76
CNSTI4 64
ASGNI4
line 257
;257:	s_specifyleague.up.height					= 64;
ADDRGP4 s_specifyleague+1180+80
CNSTI4 64
ASGNI4
line 258
;258:	s_specifyleague.up.focuspic					= SPECIFYLEAGUE_UP;
ADDRGP4 s_specifyleague+1180+60
ADDRGP4 $82
ASGNP4
line 260
;259:
;260:	s_specifyleague.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1268
CNSTI4 6
ASGNI4
line 261
;261:	s_specifyleague.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_specifyleague+1268+44
CNSTU4 2308
ASGNU4
line 262
;262:	s_specifyleague.down.generic.callback		= SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1268+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 263
;263:	s_specifyleague.down.generic.id				= ID_SPECIFYLEAGUEDOWN;
ADDRGP4 s_specifyleague+1268+8
CNSTI4 103
ASGNI4
line 264
;264:	s_specifyleague.down.generic.x				= 512;
ADDRGP4 s_specifyleague+1268+12
CNSTI4 512
ASGNI4
line 265
;265:	s_specifyleague.down.generic.y				= 240+16;
ADDRGP4 s_specifyleague+1268+16
CNSTI4 256
ASGNI4
line 266
;266:	s_specifyleague.down.width					= 64;
ADDRGP4 s_specifyleague+1268+76
CNSTI4 64
ASGNI4
line 267
;267:	s_specifyleague.down.height					= 64;
ADDRGP4 s_specifyleague+1268+80
CNSTI4 64
ASGNI4
line 268
;268:	s_specifyleague.down.focuspic				= SPECIFYLEAGUE_DOWN;
ADDRGP4 s_specifyleague+1268+60
ADDRGP4 $83
ASGNP4
line 270
;269:
;270:	s_specifyleague.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_specifyleague+1356
CNSTI4 6
ASGNI4
line 271
;271:	s_specifyleague.back.generic.name     = SPECIFYLEAGUE_BACK0;
ADDRGP4 s_specifyleague+1356+4
ADDRGP4 $84
ASGNP4
line 272
;272:	s_specifyleague.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyleague+1356+44
CNSTU4 260
ASGNU4
line 273
;273:	s_specifyleague.back.generic.callback = SpecifyLeague_Event;
ADDRGP4 s_specifyleague+1356+48
ADDRGP4 SpecifyLeague_Event
ASGNP4
line 274
;274:	s_specifyleague.back.generic.id	      = ID_SPECIFYLEAGUEBACK;
ADDRGP4 s_specifyleague+1356+8
CNSTI4 104
ASGNI4
line 275
;275:	s_specifyleague.back.generic.x		  = 0;
ADDRGP4 s_specifyleague+1356+12
CNSTI4 0
ASGNI4
line 276
;276:	s_specifyleague.back.generic.y		  = 480-64;
ADDRGP4 s_specifyleague+1356+16
CNSTI4 416
ASGNI4
line 277
;277:	s_specifyleague.back.width  		  = 128;
ADDRGP4 s_specifyleague+1356+76
CNSTI4 128
ASGNI4
line 278
;278:	s_specifyleague.back.height  		  = 64;
ADDRGP4 s_specifyleague+1356+80
CNSTI4 64
ASGNI4
line 279
;279:	s_specifyleague.back.focuspic         = SPECIFYLEAGUE_BACK1;
ADDRGP4 s_specifyleague+1356+60
ADDRGP4 $85
ASGNP4
line 281
;280:
;281:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.banner );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 282
;282:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.framel );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 283
;283:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.framer );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 284
;284:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.grlogo );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1444
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 285
;285:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.rankname );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.list );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 287
;287:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.arrows );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1092
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 288
;288:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.up );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;289:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.down );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1268
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	Menu_AddItem( &s_specifyleague.menu, &s_specifyleague.back );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 s_specifyleague+1356
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;291:
;292:
;293:	// initialize any menu variables
;294:	Q_strncpyz( s_specifyleague.rankname.field.buffer, 
ADDRGP4 $315
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_specifyleague+664+60+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 298
;295:		UI_Cvar_VariableString("name"), 
;296:		sizeof(s_specifyleague.rankname.field.buffer) );
;297:
;298:	Q_strncpyz( playername,
ADDRGP4 $315
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 playername
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 302
;299:		UI_Cvar_VariableString("name"), 
;300:		sizeof(playername) );
;301:
;302:	SpecifyLeague_GetList();
ADDRGP4 SpecifyLeague_GetList
CALLV
pop
line 303
;303:}
LABELV $136
endproc SpecifyLeague_MenuInit 12 12
export SpecifyLeague_Cache
proc SpecifyLeague_Cache 4 4
line 311
;304:
;305:/*
;306:=================
;307:SpecifyLeague_Cache
;308:=================
;309:*/
;310:void SpecifyLeague_Cache( void )
;311:{
line 315
;312:	int	i;
;313:
;314:	// touch all our pics
;315:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $320
line 316
;316:	{
line 317
;317:		if (!specifyleague_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyleague_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $324
line 318
;318:			break;
ADDRGP4 $322
JUMPV
LABELV $324
line 319
;319:		trap_R_RegisterShaderNoMip(specifyleague_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyleague_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 320
;320:	}
LABELV $321
line 315
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $322
line 321
;321:}
LABELV $319
endproc SpecifyLeague_Cache 4 4
export UI_SpecifyLeagueMenu
proc UI_SpecifyLeagueMenu 0 4
line 329
;322:
;323:/*
;324:=================
;325:UI_SpecifyLeagueMenu
;326:=================
;327:*/
;328:void UI_SpecifyLeagueMenu( void )
;329:{
line 330
;330:	SpecifyLeague_MenuInit();
ADDRGP4 SpecifyLeague_MenuInit
CALLV
pop
line 331
;331:	UI_PushMenu( &s_specifyleague.menu );
ADDRGP4 s_specifyleague
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 332
;332:}
LABELV $326
endproc UI_SpecifyLeagueMenu 0 4
import trap_CL_UI_RankGetLeauges
bss
export leaguename_items
align 4
LABELV leaguename_items
skip 512
export league_table
align 4
LABELV league_table
skip 15360
align 4
LABELV s_specifyleague
skip 1620
align 1
LABELV playername
skip 80
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
LABELV $315
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $193
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $146
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 65
byte 1 71
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $130
byte 1 115
byte 1 118
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 103
byte 1 117
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $98
byte 1 108
byte 1 101
byte 1 97
byte 1 103
byte 1 117
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $87
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 114
byte 1 47
byte 1 103
byte 1 114
byte 1 108
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $86
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 114
byte 1 47
byte 1 103
byte 1 114
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $85
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
LABELV $84
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
LABELV $83
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
LABELV $82
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
LABELV $81
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
LABELV $80
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
LABELV $79
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
