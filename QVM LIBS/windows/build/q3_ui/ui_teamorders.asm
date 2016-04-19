data
align 4
LABELV ctfOrders
address $80
address $81
address $82
address $83
address $84
address $85
address $86
byte 4 0
align 4
LABELV ctfMessages
address $87
address $88
address $89
address $90
address $91
address $92
address $93
byte 4 0
align 4
LABELV ctf1fOrders
address $80
address $81
address $82
address $94
address $84
address $85
address $86
byte 4 0
align 4
LABELV ctf1fMessages
address $87
address $88
address $89
address $95
address $91
address $92
address $93
byte 4 0
align 4
LABELV baseOrders
address $80
address $81
address $82
address $96
address $84
address $85
address $86
byte 4 0
align 4
LABELV baseMessages
address $87
address $88
address $89
address $97
address $91
address $92
address $93
byte 4 0
align 4
LABELV teamOrders
address $80
address $82
address $98
address $84
address $85
address $86
byte 4 0
align 4
LABELV teamMessages
address $87
address $89
address $99
address $91
address $92
address $93
byte 4 0
align 4
LABELV ddOrders
address $80
address $82
address $98
address $100
address $101
address $84
address $85
address $86
byte 4 0
align 4
LABELV ddMessages
address $87
address $89
address $99
address $102
address $103
address $91
address $92
address $93
byte 4 0
code
proc UI_TeamOrdersMenu_BackEvent 0 0
file "../../../code/q3_ui/ui_teamorders.c"
line 181
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
;26:TEAM ORDERS MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define ART_FRAME		"menu/art_blueish/addbotframe"
;36:#define ART_BACK0		"menu/art_blueish/back_0"
;37:#define ART_BACK1		"menu/art_blueish/back_1"
;38:
;39:#define ID_LIST_BOTS		10
;40:#define ID_LIST_CTF_ORDERS	11
;41:#define ID_LIST_CTF1F_ORDERS	12
;42:#define ID_LIST_BASE_ORDERS	13
;43:#define ID_LIST_TEAM_ORDERS	14
;44:#define ID_LIST_DD_ORDERS	15
;45:
;46:
;47:typedef struct {
;48:	menuframework_s	menu;
;49:
;50:	menutext_s		banner;
;51:	menubitmap_s	frame;
;52:
;53:	menulist_s		list;
;54:
;55:	menubitmap_s	back;
;56:
;57:	int				gametype;
;58:	int				numBots;
;59:	int				selectedBot;
;60:	char			*bots[9];
;61:	char			botNames[9][16];
;62:} teamOrdersMenuInfo_t;
;63:
;64:static teamOrdersMenuInfo_t	teamOrdersMenuInfo;
;65:
;66:#define NUM_CTF_ORDERS		7
;67:static const char *ctfOrders[] = {
;68:	"I Am the Leader",
;69:	"Defend the Base",
;70:	"Follow Me",
;71:	"Get Enemy Flag",
;72:	"Camp Here",
;73:	"Report",
;74:	"I Relinquish Command",
;75:	NULL
;76:};
;77:static const char *ctfMessages[] = {
;78:	"i am the leader",
;79:	"%s defend the base",
;80:	"%s follow me",
;81:	"%s get the enemy flag",
;82:	"%s camp here",
;83:	"%s report",
;84:	"i stop being the leader",
;85:	NULL
;86:};
;87:
;88:#define NUM_CTF1F_ORDERS		7
;89:static const char *ctf1fOrders[] = {
;90:	"I Am the Leader",
;91:	"Defend the Base",
;92:	"Follow Me",
;93:	"Get The Flag",
;94:	"Camp Here",
;95:	"Report",
;96:	"I Relinquish Command",
;97:	NULL
;98:};
;99:static const char *ctf1fMessages[] = {
;100:	"i am the leader",
;101:	"%s defend the base",
;102:	"%s follow me",
;103:	"%s get the flag",
;104:	"%s camp here",
;105:	"%s report",
;106:	"i stop being the leader",
;107:	NULL
;108:};
;109:
;110:#define NUM_BASE_ORDERS		7
;111:static const char *baseOrders[] = {
;112:	"I Am the Leader",
;113:	"Defend the Base",
;114:	"Follow Me",
;115:	"Attack the Enemy Base",
;116:	"Camp Here",
;117:	"Report",
;118:	"I Relinquish Command",
;119:	NULL
;120:};
;121:static const char *baseMessages[] = {
;122:	"i am the leader",
;123:	"%s defend the base",
;124:	"%s follow me",
;125:	"%s attack the base",
;126:	"%s camp here",
;127:	"%s report",
;128:	"i stop being the leader",
;129:	NULL
;130:};
;131:
;132:#define NUM_TEAM_ORDERS		6
;133:static const char *teamOrders[] = {
;134:	"I Am the Leader",
;135:	"Follow Me",
;136:	"Roam",
;137:	"Camp Here",
;138:	"Report",
;139:	"I Relinquish Command",
;140:	NULL
;141:};
;142:static const char *teamMessages[] = {
;143:	"i am the leader",
;144:	"%s follow me",
;145:	"%s roam",
;146:	"%s camp here",
;147:	"%s report",
;148:	"i stop being the leader",
;149:	NULL
;150:};
;151:
;152:#define NUM_DD_ORDERS		8
;153:static const char *ddOrders[] = {
;154:	"I Am the Leader",
;155:	"Follow Me",
;156:	"Roam",
;157:	"Dominate Point A",
;158:	"Dominate Point B",
;159:	"Camp Here",
;160:	"Report",
;161:	"I Relinquish Command",
;162:	NULL
;163:};
;164:static const char *ddMessages[] = {
;165:	"i am the leader",
;166:	"%s follow me",
;167:	"%s roam",
;168:	"%s dominate point A",
;169:	"%s dominate point B",
;170:	"%s camp here",
;171:	"%s report",
;172:	"i stop being the leader",
;173:	NULL
;174:};
;175:
;176:/*
;177:===============
;178:UI_TeamOrdersMenu_BackEvent
;179:===============
;180:*/
;181:static void UI_TeamOrdersMenu_BackEvent( void *ptr, int event ) {
line 182
;182:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $105
line 183
;183:		return;
ADDRGP4 $104
JUMPV
LABELV $105
line 185
;184:	}
;185:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 186
;186:}
LABELV $104
endproc UI_TeamOrdersMenu_BackEvent 0 0
proc UI_TeamOrdersMenu_SetList 4 0
line 194
;187:
;188:
;189:/*
;190:===============
;191:UI_TeamOrdersMenu_SetList
;192:===============
;193:*/
;194:static void UI_TeamOrdersMenu_SetList( int id ) {
line 195
;195:	switch( id ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $154-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $154
address $110
address $119
address $126
address $133
address $140
address $147
code
LABELV $108
LABELV $110
line 198
;196:	default:
;197:	case ID_LIST_BOTS:
;198:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 199
;199:		teamOrdersMenuInfo.list.numitems = teamOrdersMenuInfo.numBots;
ADDRGP4 teamOrdersMenuInfo+576+68
ADDRGP4 teamOrdersMenuInfo+764
INDIRI4
ASGNI4
line 200
;200:		teamOrdersMenuInfo.list.itemnames = (const char **)teamOrdersMenuInfo.bots;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 teamOrdersMenuInfo+772
ASGNP4
line 201
;201:		 break;
ADDRGP4 $109
JUMPV
LABELV $119
line 204
;202:
;203:	case ID_LIST_CTF_ORDERS:
;204:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 205
;205:		teamOrdersMenuInfo.list.numitems = NUM_CTF_ORDERS;
ADDRGP4 teamOrdersMenuInfo+576+68
CNSTI4 7
ASGNI4
line 206
;206:		teamOrdersMenuInfo.list.itemnames = ctfOrders;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 ctfOrders
ASGNP4
line 207
;207:		break;
ADDRGP4 $109
JUMPV
LABELV $126
line 210
;208:
;209:        case ID_LIST_CTF1F_ORDERS:
;210:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 211
;211:		teamOrdersMenuInfo.list.numitems = NUM_CTF1F_ORDERS;
ADDRGP4 teamOrdersMenuInfo+576+68
CNSTI4 7
ASGNI4
line 212
;212:		teamOrdersMenuInfo.list.itemnames = ctf1fOrders;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 ctf1fOrders
ASGNP4
line 213
;213:		break;
ADDRGP4 $109
JUMPV
LABELV $133
line 216
;214:
;215:        case ID_LIST_BASE_ORDERS:
;216:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 217
;217:		teamOrdersMenuInfo.list.numitems = NUM_BASE_ORDERS;
ADDRGP4 teamOrdersMenuInfo+576+68
CNSTI4 7
ASGNI4
line 218
;218:		teamOrdersMenuInfo.list.itemnames = baseOrders;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 baseOrders
ASGNP4
line 219
;219:		break;
ADDRGP4 $109
JUMPV
LABELV $140
line 222
;220:
;221:	case ID_LIST_TEAM_ORDERS:
;222:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 223
;223:		teamOrdersMenuInfo.list.numitems = NUM_TEAM_ORDERS;
ADDRGP4 teamOrdersMenuInfo+576+68
CNSTI4 6
ASGNI4
line 224
;224:		teamOrdersMenuInfo.list.itemnames = teamOrders;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 teamOrders
ASGNP4
line 225
;225:		break;
ADDRGP4 $109
JUMPV
LABELV $147
line 228
;226:
;227:	case ID_LIST_DD_ORDERS:
;228:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+576+8
ADDRFP4 0
INDIRI4
ASGNI4
line 229
;229:		teamOrdersMenuInfo.list.numitems = NUM_DD_ORDERS;
ADDRGP4 teamOrdersMenuInfo+576+68
CNSTI4 8
ASGNI4
line 230
;230:		teamOrdersMenuInfo.list.itemnames = ddOrders;
ADDRGP4 teamOrdersMenuInfo+576+76
ADDRGP4 ddOrders
ASGNP4
line 231
;231:		break;
LABELV $109
line 234
;232:	}
;233:
;234:	teamOrdersMenuInfo.list.generic.bottom = teamOrdersMenuInfo.list.generic.top + teamOrdersMenuInfo.list.numitems * PROP_HEIGHT;
ADDRGP4 teamOrdersMenuInfo+576+32
ADDRGP4 teamOrdersMenuInfo+576+24
INDIRI4
CNSTI4 27
ADDRGP4 teamOrdersMenuInfo+576+68
INDIRI4
MULI4
ADDI4
ASGNI4
line 235
;235:}
LABELV $107
endproc UI_TeamOrdersMenu_SetList 4 0
export UI_TeamOrdersMenu_Key
proc UI_TeamOrdersMenu_Key 72 16
line 243
;236:
;237:
;238:/*
;239:=================
;240:UI_TeamOrdersMenu_Key
;241:=================
;242:*/
;243:sfxHandle_t UI_TeamOrdersMenu_Key( int key ) {
line 249
;244:	menulist_s	*l;
;245:	int	x;
;246:	int	y;
;247:	int	index;
;248:
;249:	l = (menulist_s	*)Menu_ItemAtCursor( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRLP4 16
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 250
;250:	if( l != &teamOrdersMenuInfo.list ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 teamOrdersMenuInfo+576
CVPU4 4
EQU4 $163
line 251
;251:		return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $162
JUMPV
LABELV $163
line 254
;252:	}
;253:
;254:	switch( key ) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 161
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $174
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $181
LABELV $180
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 132
EQI4 $174
ADDRLP4 28
INDIRI4
CNSTI4 133
EQI4 $177
ADDRGP4 $166
JUMPV
LABELV $181
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
CNSTI4 167
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $177
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $166
LABELV $182
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $168
ADDRGP4 $166
JUMPV
LABELV $168
line 256
;255:		case K_MOUSE1:
;256:			x = l->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 257
;257:			y = l->generic.top;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 258
;258:			if( UI_CursorInRect( x, y, l->generic.right - x, l->generic.bottom - y ) ) {
ADDRLP4 40
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $169
line 259
;259:				index = (uis.cursory - y) / PROP_HEIGHT;
ADDRLP4 12
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 27
DIVI4
ASGNI4
line 260
;260:				l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 261
;261:				l->curvalue = index;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 263
;262:
;263:				if( l->generic.callback ) {
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $172
line 264
;264:					l->generic.callback( l, QM_ACTIVATED );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 265
;265:					return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $162
JUMPV
LABELV $172
line 267
;266:				}
;267:			}
LABELV $169
line 268
;268:			return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $162
JUMPV
LABELV $174
line 272
;269:
;270:		case K_KP_UPARROW:
;271:		case K_UPARROW:
;272:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 274
;273:
;274:			if( l->curvalue == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $175
line 275
;275:				l->curvalue = l->numitems - 1;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 276
;276:			}
ADDRGP4 $176
JUMPV
LABELV $175
line 277
;277:			else {
line 278
;278:				l->curvalue--;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 279
;279:			}
LABELV $176
line 280
;280:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $162
JUMPV
LABELV $177
line 284
;281:
;282:		case K_KP_DOWNARROW:
;283:		case K_DOWNARROW:
;284:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 286
;285:
;286:			if( l->curvalue == l->numitems - 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $178
line 287
;287:				l->curvalue = 0;;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 288
;288:			}
ADDRGP4 $179
JUMPV
LABELV $178
line 289
;289:			else {
line 290
;290:				l->curvalue++;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 291
;291:			}
LABELV $179
line 292
;292:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $162
JUMPV
LABELV $166
line 295
;293:	}
;294:
;295:	return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $162
endproc UI_TeamOrdersMenu_Key 72 16
proc UI_TeamOrdersMenu_ListDraw 36 20
line 304
;296:}
;297:
;298:
;299:/*
;300:=================
;301:UI_TeamOrdersMenu_ListDraw
;302:=================
;303:*/
;304:static void UI_TeamOrdersMenu_ListDraw( void *self ) {
line 313
;305:	menulist_s	*l;
;306:	int			x;
;307:	int			y;
;308:	int			i;
;309:	float		*color;
;310:	qboolean	hasfocus;
;311:	int			style;
;312:
;313:	l = (menulist_s *)self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 315
;314:
;315:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $185
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $186
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 317
;316:
;317:	x =	320;//l->generic.x;
ADDRLP4 20
CNSTI4 320
ASGNI4
line 318
;318:	y =	l->generic.y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 319
;319:	for( i = 0; i < l->numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $190
JUMPV
LABELV $187
line 320
;320:		style = UI_LEFT|UI_SMALLFONT|UI_CENTER;
ADDRLP4 8
CNSTI4 17
ASGNI4
line 321
;321:		if( i == l->curvalue ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
NEI4 $191
line 322
;322:			color = color_yellow;
ADDRLP4 16
ADDRGP4 color_yellow
ASGNP4
line 323
;323:			if( hasfocus ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $192
line 324
;324:				style |= UI_PULSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 325
;325:			}
line 326
;326:		}
ADDRGP4 $192
JUMPV
LABELV $191
line 327
;327:		else {
line 328
;328:			color = color_orange;
ADDRLP4 16
ADDRGP4 color_orange
ASGNP4
line 329
;329:		}
LABELV $192
line 331
;330:
;331:		UI_DrawProportionalString( x, y, l->itemnames[i], style, color );
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 332
;332:		y += PROP_HEIGHT;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 333
;333:	}
LABELV $188
line 319
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $190
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
LTI4 $187
line 334
;334:}
LABELV $183
endproc UI_TeamOrdersMenu_ListDraw 36 20
proc UI_TeamOrdersMenu_ListEvent 268 16
line 342
;335:
;336:
;337:/*
;338:===============
;339:UI_TeamOrdersMenu_ListEvent
;340:===============
;341:*/
;342:static void UI_TeamOrdersMenu_ListEvent( void *ptr, int event ) {
line 347
;343:	int		id;
;344:	int		selection;
;345:	char	message[256];
;346:
;347:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $196
line 348
;348:		return;
ADDRGP4 $195
JUMPV
LABELV $196
line 350
;349:
;350:	id = ((menulist_s *)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 351
;351:	selection = ((menulist_s *)ptr)->curvalue;
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 353
;352:
;353:	if( id == ID_LIST_BOTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $198
line 354
;354:		teamOrdersMenuInfo.selectedBot = selection;
ADDRGP4 teamOrdersMenuInfo+768
ADDRLP4 260
INDIRI4
ASGNI4
line 355
;355:		if( teamOrdersMenuInfo.gametype == GT_CTF || teamOrdersMenuInfo.gametype == GT_CTF_ELIMINATION ) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 4
EQI4 $205
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 9
NEI4 $201
LABELV $205
line 356
;356:			UI_TeamOrdersMenu_SetList( ID_LIST_CTF_ORDERS );
CNSTI4 11
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 357
;357:		}
LABELV $201
line 358
;358:                if( teamOrdersMenuInfo.gametype == GT_1FCTF ) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 5
NEI4 $206
line 359
;359:			UI_TeamOrdersMenu_SetList( ID_LIST_CTF1F_ORDERS );
CNSTI4 12
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 360
;360:		}
LABELV $206
line 361
;361:                if( teamOrdersMenuInfo.gametype == GT_OBELISK || teamOrdersMenuInfo.gametype == GT_HARVESTER ) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 6
EQI4 $213
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 7
NEI4 $209
LABELV $213
line 362
;362:			UI_TeamOrdersMenu_SetList( ID_LIST_BASE_ORDERS );
CNSTI4 13
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 363
;363:		}
LABELV $209
line 364
;364:		if( teamOrdersMenuInfo.gametype == GT_TEAM || teamOrdersMenuInfo.gametype == GT_ELIMINATION || teamOrdersMenuInfo.gametype == GT_DOMINATION ) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 3
EQI4 $220
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 8
EQI4 $220
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 12
NEI4 $214
LABELV $220
line 365
;365:			UI_TeamOrdersMenu_SetList( ID_LIST_TEAM_ORDERS );
CNSTI4 14
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 366
;366:		}
LABELV $214
line 367
;367:		if( teamOrdersMenuInfo.gametype == GT_DOUBLE_D ) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 11
NEI4 $195
line 368
;368:			UI_TeamOrdersMenu_SetList( ID_LIST_DD_ORDERS );
CNSTI4 15
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 369
;369:		}
line 371
;370:
;371:		return;
ADDRGP4 $195
JUMPV
LABELV $198
line 374
;372:	}
;373:
;374:	if( id == ID_LIST_CTF_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $224
line 375
;375:		Com_sprintf( message, sizeof(message), ctfMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 376
;376:	}
LABELV $224
line 377
;377:        if( id == ID_LIST_CTF1F_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 12
NEI4 $228
line 378
;378:		Com_sprintf( message, sizeof(message), ctf1fMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctf1fMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 379
;379:	}
LABELV $228
line 380
;380:        if( id == ID_LIST_BASE_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $232
line 381
;381:		Com_sprintf( message, sizeof(message), baseMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 baseMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 382
;382:	}
LABELV $232
line 383
;383:	if( id == ID_LIST_TEAM_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 14
NEI4 $236
line 384
;384:		Com_sprintf( message, sizeof(message), teamMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 385
;385:	}
LABELV $236
line 386
;386:	if( id == ID_LIST_DD_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $240
line 387
;387:		Com_sprintf( message, sizeof(message), ddMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ddMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 388
;388:	}
LABELV $240
line 390
;389:
;390:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "say_team \"%s\"\n", message ) );
ADDRGP4 $244
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 391
;391:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 392
;392:}
LABELV $195
endproc UI_TeamOrdersMenu_ListEvent 268 16
proc UI_TeamOrdersMenu_BuildBotList 4160 12
line 400
;393:
;394:
;395:/*
;396:===============
;397:UI_TeamOrdersMenu_BuildBotList
;398:===============
;399:*/
;400:static void UI_TeamOrdersMenu_BuildBotList( void ) {
line 405
;401:	uiClientState_t	cs;
;402:	int		numPlayers;
;403:	int		isBot;
;404:	int		n;
;405:	char	playerTeam = '3';
ADDRLP4 1033
CNSTI1 51
ASGNI1
line 409
;406:	char	botTeam;
;407:	char	info[MAX_INFO_STRING];
;408:
;409:	for( n = 0; n < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $246
line 410
;410:		teamOrdersMenuInfo.bots[n] = teamOrdersMenuInfo.botNames[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamOrdersMenuInfo+772
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ASGNP4
line 411
;411:	}
LABELV $247
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $246
line 413
;412:
;413:	trap_GetClientState( &cs );
ADDRLP4 1036
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 415
;414:
;415:	Q_strncpyz( teamOrdersMenuInfo.botNames[0], "Everyone", 16 );
ADDRGP4 teamOrdersMenuInfo+808
ARGP4
ADDRGP4 $253
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 416
;416:	teamOrdersMenuInfo.numBots = 1;
ADDRGP4 teamOrdersMenuInfo+764
CNSTI4 1
ASGNI4
line 418
;417:
;418:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 419
;419:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 4124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4124
INDIRP4
ARGP4
ADDRLP4 4128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4128
INDIRI4
ASGNI4
line 420
;420:	teamOrdersMenuInfo.gametype = atoi( Info_ValueForKey( info, "g_gametype" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 4132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4132
INDIRP4
ARGP4
ADDRLP4 4136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 teamOrdersMenuInfo+760
ADDRLP4 4136
INDIRI4
ASGNI4
line 422
;421:
;422:	for( n = 0; n < numPlayers && teamOrdersMenuInfo.numBots < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 423
;423:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
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
line 425
;424:
;425:		if( n == cs.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1036+8
INDIRI4
NEI4 $263
line 426
;426:			playerTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 4140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1033
ADDRLP4 4140
INDIRP4
INDIRI1
ASGNI1
line 427
;427:			continue;
ADDRGP4 $259
JUMPV
LABELV $263
line 430
;428:		}
;429:
;430:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 4140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4140
INDIRP4
ARGP4
ADDRLP4 4144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4144
INDIRI4
ASGNI4
line 431
;431:		if( !isBot ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $268
line 432
;432:			continue;
ADDRGP4 $259
JUMPV
LABELV $268
line 435
;433:		}
;434:
;435:		botTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 4148
INDIRP4
INDIRI1
ASGNI1
line 436
;436:		if( botTeam != playerTeam ) {
ADDRLP4 1032
INDIRI1
CVII4 1
ADDRLP4 1033
INDIRI1
CVII4 1
EQI4 $270
line 437
;437:			continue;
ADDRGP4 $259
JUMPV
LABELV $270
line 440
;438:		}
;439:
;440:		Q_strncpyz( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots], Info_ValueForKey( info, "n" ), 16 );
ADDRLP4 4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 teamOrdersMenuInfo+764
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 441
;441:		Q_CleanStr( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots] );
ADDRGP4 teamOrdersMenuInfo+764
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+808
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 442
;442:		teamOrdersMenuInfo.numBots++;
ADDRLP4 4156
ADDRGP4 teamOrdersMenuInfo+764
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 443
;443:	}
LABELV $259
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $261
ADDRLP4 0
INDIRI4
ADDRLP4 4120
INDIRI4
GEI4 $278
ADDRGP4 teamOrdersMenuInfo+764
INDIRI4
CNSTI4 9
LTI4 $258
LABELV $278
line 444
;444:}
LABELV $245
endproc UI_TeamOrdersMenu_BuildBotList 4160 12
proc UI_TeamOrdersMenu_Init 0 12
line 452
;445:
;446:
;447:/*
;448:===============
;449:UI_TeamOrdersMenu_Init
;450:===============
;451:*/
;452:static void UI_TeamOrdersMenu_Init( void ) {
line 453
;453:	UI_TeamOrdersMenu_Cache();
ADDRGP4 UI_TeamOrdersMenu_Cache
CALLV
pop
line 455
;454:
;455:	memset( &teamOrdersMenuInfo, 0, sizeof(teamOrdersMenuInfo) );
ADDRGP4 teamOrdersMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 952
ARGI4
ADDRGP4 memset
CALLP4
pop
line 456
;456:	teamOrdersMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 teamOrdersMenuInfo+408
CNSTI4 0
ASGNI4
line 457
;457:	teamOrdersMenuInfo.menu.key = UI_TeamOrdersMenu_Key;
ADDRGP4 teamOrdersMenuInfo+400
ADDRGP4 UI_TeamOrdersMenu_Key
ASGNP4
line 459
;458:
;459:	UI_TeamOrdersMenu_BuildBotList();
ADDRGP4 UI_TeamOrdersMenu_BuildBotList
CALLV
pop
line 461
;460:
;461:	teamOrdersMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 teamOrdersMenuInfo+416
CNSTI4 10
ASGNI4
line 462
;462:	teamOrdersMenuInfo.banner.generic.x			= 320;
ADDRGP4 teamOrdersMenuInfo+416+12
CNSTI4 320
ASGNI4
line 463
;463:	teamOrdersMenuInfo.banner.generic.y			= 16;
ADDRGP4 teamOrdersMenuInfo+416+16
CNSTI4 16
ASGNI4
line 464
;464:	teamOrdersMenuInfo.banner.string			= "TEAM ORDERS";
ADDRGP4 teamOrdersMenuInfo+416+60
ADDRGP4 $289
ASGNP4
line 465
;465:	teamOrdersMenuInfo.banner.color				= color_white;
ADDRGP4 teamOrdersMenuInfo+416+68
ADDRGP4 color_white
ASGNP4
line 466
;466:	teamOrdersMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 teamOrdersMenuInfo+416+64
CNSTI4 1
ASGNI4
line 468
;467:
;468:	teamOrdersMenuInfo.frame.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+488
CNSTI4 6
ASGNI4
line 469
;469:	teamOrdersMenuInfo.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 teamOrdersMenuInfo+488+44
CNSTU4 16384
ASGNU4
line 470
;470:	teamOrdersMenuInfo.frame.generic.name		= ART_FRAME;
ADDRGP4 teamOrdersMenuInfo+488+4
ADDRGP4 $299
ASGNP4
line 471
;471:	teamOrdersMenuInfo.frame.generic.x			= 320-233;
ADDRGP4 teamOrdersMenuInfo+488+12
CNSTI4 87
ASGNI4
line 472
;472:	teamOrdersMenuInfo.frame.generic.y			= 240-166;
ADDRGP4 teamOrdersMenuInfo+488+16
CNSTI4 74
ASGNI4
line 473
;473:	teamOrdersMenuInfo.frame.width				= 466;
ADDRGP4 teamOrdersMenuInfo+488+76
CNSTI4 466
ASGNI4
line 474
;474:	teamOrdersMenuInfo.frame.height				= 332;
ADDRGP4 teamOrdersMenuInfo+488+80
CNSTI4 332
ASGNI4
line 476
;475:
;476:	teamOrdersMenuInfo.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 teamOrdersMenuInfo+576
CNSTI4 8
ASGNI4
line 477
;477:	teamOrdersMenuInfo.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+576+44
CNSTU4 256
ASGNU4
line 478
;478:	teamOrdersMenuInfo.list.generic.ownerdraw	= UI_TeamOrdersMenu_ListDraw;
ADDRGP4 teamOrdersMenuInfo+576+56
ADDRGP4 UI_TeamOrdersMenu_ListDraw
ASGNP4
line 479
;479:	teamOrdersMenuInfo.list.generic.callback	= UI_TeamOrdersMenu_ListEvent;
ADDRGP4 teamOrdersMenuInfo+576+48
ADDRGP4 UI_TeamOrdersMenu_ListEvent
ASGNP4
line 480
;480:	teamOrdersMenuInfo.list.generic.x			= 320-64;
ADDRGP4 teamOrdersMenuInfo+576+12
CNSTI4 256
ASGNI4
line 481
;481:	teamOrdersMenuInfo.list.generic.y			= 120;
ADDRGP4 teamOrdersMenuInfo+576+16
CNSTI4 120
ASGNI4
line 483
;482:
;483:	teamOrdersMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+672
CNSTI4 6
ASGNI4
line 484
;484:	teamOrdersMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 teamOrdersMenuInfo+672+4
ADDRGP4 $322
ASGNP4
line 485
;485:	teamOrdersMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+672+44
CNSTU4 260
ASGNU4
line 486
;486:	teamOrdersMenuInfo.back.generic.callback	= UI_TeamOrdersMenu_BackEvent;
ADDRGP4 teamOrdersMenuInfo+672+48
ADDRGP4 UI_TeamOrdersMenu_BackEvent
ASGNP4
line 487
;487:	teamOrdersMenuInfo.back.generic.x			= 0;
ADDRGP4 teamOrdersMenuInfo+672+12
CNSTI4 0
ASGNI4
line 488
;488:	teamOrdersMenuInfo.back.generic.y			= 480-64;
ADDRGP4 teamOrdersMenuInfo+672+16
CNSTI4 416
ASGNI4
line 489
;489:	teamOrdersMenuInfo.back.width				= 128;
ADDRGP4 teamOrdersMenuInfo+672+76
CNSTI4 128
ASGNI4
line 490
;490:	teamOrdersMenuInfo.back.height				= 64;
ADDRGP4 teamOrdersMenuInfo+672+80
CNSTI4 64
ASGNI4
line 491
;491:	teamOrdersMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 teamOrdersMenuInfo+672+60
ADDRGP4 $337
ASGNP4
line 493
;492:
;493:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.banner );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 494
;494:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.frame );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 495
;495:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.list );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 496
;496:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.back );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 498
;497:
;498:	teamOrdersMenuInfo.list.generic.left = 220;
ADDRGP4 teamOrdersMenuInfo+576+20
CNSTI4 220
ASGNI4
line 499
;499:	teamOrdersMenuInfo.list.generic.top = teamOrdersMenuInfo.list.generic.y;
ADDRGP4 teamOrdersMenuInfo+576+24
ADDRGP4 teamOrdersMenuInfo+576+16
INDIRI4
ASGNI4
line 500
;500:	teamOrdersMenuInfo.list.generic.right = 420;
ADDRGP4 teamOrdersMenuInfo+576+28
CNSTI4 420
ASGNI4
line 501
;501:	UI_TeamOrdersMenu_SetList( ID_LIST_BOTS );
CNSTI4 10
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 502
;502:}
LABELV $279
endproc UI_TeamOrdersMenu_Init 0 12
export UI_TeamOrdersMenu_Cache
proc UI_TeamOrdersMenu_Cache 0 4
line 510
;503:
;504:
;505:/*
;506:=================
;507:UI_TeamOrdersMenu_Cache
;508:=================
;509:*/
;510:void UI_TeamOrdersMenu_Cache( void ) {
line 511
;511:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $299
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 512
;512:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $322
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 513
;513:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $337
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 514
;514:}
LABELV $350
endproc UI_TeamOrdersMenu_Cache 0 4
export UI_TeamOrdersMenu
proc UI_TeamOrdersMenu 0 4
line 522
;515:
;516:
;517:/*
;518:===============
;519:UI_TeamOrdersMenu
;520:===============
;521:*/
;522:void UI_TeamOrdersMenu( void ) {
line 523
;523:	UI_TeamOrdersMenu_Init();
ADDRGP4 UI_TeamOrdersMenu_Init
CALLV
pop
line 524
;524:	UI_PushMenu( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 525
;525:}
LABELV $351
endproc UI_TeamOrdersMenu 0 4
export UI_TeamOrdersMenu_f
proc UI_TeamOrdersMenu_f 4128 12
line 533
;526:
;527:
;528:/*
;529:===============
;530:UI_TeamOrdersMenu_f
;531:===============
;532:*/
;533:void UI_TeamOrdersMenu_f( void ) {
line 539
;534:	uiClientState_t	cs;
;535:	char	info[MAX_INFO_STRING];
;536:	int		team;
;537:
;538:	// make sure it's a team game
;539:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 540
;540:	teamOrdersMenuInfo.gametype = atoi( Info_ValueForKey( info, "g_gametype" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 teamOrdersMenuInfo+760
ADDRLP4 4116
INDIRI4
ASGNI4
line 541
;541:	if( teamOrdersMenuInfo.gametype < GT_TEAM || teamOrdersMenuInfo.gametype!=GT_LMS) {
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 3
LTI4 $358
ADDRGP4 teamOrdersMenuInfo+760
INDIRI4
CNSTI4 10
EQI4 $354
LABELV $358
line 542
;542:		return;
ADDRGP4 $352
JUMPV
LABELV $354
line 546
;543:	}
;544:
;545:	// not available to spectators
;546:	trap_GetClientState( &cs );
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 547
;547:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1024+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 548
;548:	team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 4120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4120
INDIRP4
ARGP4
ADDRLP4 4124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4124
INDIRI4
ASGNI4
line 549
;549:	if( team == TEAM_SPECTATOR ) {
ADDRLP4 4108
INDIRI4
CNSTI4 3
NEI4 $360
line 550
;550:		return;
ADDRGP4 $352
JUMPV
LABELV $360
line 553
;551:	}
;552:
;553:	UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 554
;554:}
LABELV $352
endproc UI_TeamOrdersMenu_f 4128 12
bss
align 4
LABELV teamOrdersMenuInfo
skip 952
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
LABELV $337
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
LABELV $322
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
LABELV $299
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
LABELV $289
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
LABELV $274
byte 1 110
byte 1 0
align 1
LABELV $267
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $266
byte 1 116
byte 1 0
align 1
LABELV $257
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
LABELV $255
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
LABELV $253
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $244
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 0
align 1
LABELV $101
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $100
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $98
byte 1 82
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $97
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $96
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $94
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $93
byte 1 105
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $92
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $91
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $89
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $87
byte 1 105
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $86
byte 1 73
byte 1 32
byte 1 82
byte 1 101
byte 1 108
byte 1 105
byte 1 110
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $85
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $84
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $82
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 77
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 73
byte 1 32
byte 1 65
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
