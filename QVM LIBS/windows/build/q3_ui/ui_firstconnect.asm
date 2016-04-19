data
align 4
LABELV art_artlist
address $79
address $80
address $81
address $82
address $83
address $84
byte 4 0
code
proc PlayerSettings_DrawName2 92 20
file "../../../code/q3_ui/ui_firstconnect.c"
line 98
;1:/*
;2:===========================================================================
;3:Copyright (C) 2009 Poul Sander
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
;22://
;23:#include "ui_local.h"
;24:
;25:/******************************************************************************
;26: * This is the menu displayed the first time the player selects "Multiplayer" *
;27: * It only has the must set or know about options!                            *
;28: * Options: Name, Network Rate, Delag, Auto Download                          *
;29: ******************************************************************************/
;30:
;31:#define ART_BACK0		"menu/art_blueish/back_0"
;32:#define ART_BACK1		"menu/art_blueish/back_1"
;33:#define ART_FRAMEL		"menu/art_blueish/frame2_l"
;34:#define ART_FRAMER		"menu/art_blueish/frame1_r"
;35:#define ART_FIGHT0              "menu/art_blueish/accept_0"
;36:#define ART_FIGHT1              "menu/art_blueish/accept_1"
;37:
;38:
;39:#define ID_NAME			10
;40:#define ID_RATE                 11
;41:#define ID_DELAGHITSCAN		12
;42:#define ID_ALLOWDOWNLOAD	13
;43:
;44:#define ID_GO                   100
;45:#define ID_BACK                 101
;46:
;47:
;48:#define MAX_NAMELENGTH	20
;49:
;50:/*static const char *rate_items[] = {
;51:	"<= 28.8K",
;52:	"33.6K",
;53:	"56K",
;54:	"ISDN",
;55:	"LAN/Cable/xDSL",
;56:	NULL
;57:};*/
;58:extern const char *rate_items[];
;59:
;60:static char* art_artlist[] =
;61:{
;62:	ART_FRAMEL,
;63:	ART_FRAMER,
;64:	ART_BACK0,
;65:	ART_BACK1,
;66:	ART_FIGHT0,
;67:	ART_FIGHT1,
;68:	NULL
;69:};
;70:
;71:typedef struct
;72:{
;73:	menuframework_s	menu;
;74:	menutext_s	banner;
;75:	menubitmap_s	framel;
;76:	menubitmap_s	framer;
;77:	menubitmap_s	go;
;78:	menubitmap_s	back;
;79:        menutext_s	info;
;80:        menutext_s	info2;
;81:
;82:        //Important options
;83:        menufield_s	name;
;84:        menulist_s	rate;
;85:
;86:        //Optional options
;87:        menuradiobutton_s	delaghitscan;
;88:	menuradiobutton_s	allowdownload;
;89:} firstconnect_t;
;90:
;91:static firstconnect_t	s_firstconnect;
;92:
;93:/*
;94:=================
;95:PlayerSettings_DrawName2
;96:=================
;97:*/
;98:static void PlayerSettings_DrawName2( void *self ) {
line 109
;99:	menufield_s		*f;
;100:	qboolean		focus;
;101:	int				style;
;102:	char			*txt;
;103:	char			c;
;104:	float			*color;
;105:	int				n;
;106:	int				basex, x, y;
;107:	char			name[32];
;108:
;109:	f = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 110
;110:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 111
;111:	y = f->generic.y;
ADDRLP4 24
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 112
;112:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $88
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $89
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 114
;113:
;114:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 115
;115:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 116
;116:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $90
line 117
;117:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 118
;118:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 119
;119:	}
LABELV $90
line 121
;120:
;121:	UI_DrawProportionalString( basex, y, "Name:", style, color );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $92
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 124
;122:
;123:	// draw the actual name
;124:	basex += 64+10;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 74
ADDI4
ASGNI4
line 126
;125:	//y += PROP_HEIGHT;
;126:        y+= 4;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 127
;127:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
line 128
;128:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 129
;129:	x = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
line 130
;130:	while ( (c = *txt) != 0 ) {
line 131
;131:		if ( !focus && Q_IsColorString( txt ) ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $97
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $97
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $97
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $97
ADDRLP4 88
INDIRI4
CNSTI4 48
LTI4 $97
ADDRLP4 88
INDIRI4
CNSTI4 56
GTI4 $97
line 132
;132:			n = ColorIndex( *(txt+1) );
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 133
;133:			if( n == 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $99
line 134
;134:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 135
;135:			}
LABELV $99
line 136
;136:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 137
;137:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 138
;138:			continue;
ADDRGP4 $95
JUMPV
LABELV $97
line 140
;139:		}
;140:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 141
;141:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 142
;142:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 143
;143:	}
LABELV $95
line 130
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 80
INDIRI1
ASGNI1
ADDRLP4 80
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $94
line 146
;144:
;145:	// draw cursor if we have focus
;146:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $101
line 147
;147:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $103
line 148
;148:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 149
;149:		} else {
ADDRGP4 $104
JUMPV
LABELV $103
line 150
;150:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 151
;151:		}
LABELV $104
line 153
;152:
;153:		style &= ~UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 154
;154:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 156
;155:
;156:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 157
;157:	}
LABELV $101
line 160
;158:
;159:	// draw at bottom also using proportional font
;160:	Q_strncpyz( name, f->field.buffer, sizeof(name) );
ADDRLP4 40
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 161
;161:	Q_CleanStr( name );
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 162
;162:}
LABELV $86
endproc PlayerSettings_DrawName2 92 20
proc FirstConnect_StatusBar_Name 0 20
line 169
;163:
;164:/*
;165:=================
;166:FirstConnect_StatusBar_Name
;167:=================
;168:*/
;169:static void FirstConnect_StatusBar_Name( void* ptr ) {
line 170
;170:		UI_DrawString( 320, 440, "Your nickname", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $106
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 171
;171:}
LABELV $105
endproc FirstConnect_StatusBar_Name 0 20
proc FirstConnect_StatusBar_Rate 0 20
line 178
;172:
;173:/*
;174:=================
;175:FirstConnect_StatusBar_Rate
;176:=================
;177:*/
;178:static void FirstConnect_StatusBar_Rate( void* ptr ) {
line 179
;179:		UI_DrawString( 320, 440, "Your connection speed", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $108
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 180
;180:}
LABELV $107
endproc FirstConnect_StatusBar_Rate 0 20
proc FirstConnect_StatusBar_Delag 0 20
line 187
;181:
;182:/*
;183:=================
;184:FirstConnect_StatusBar_Delag
;185:=================
;186:*/
;187:static void FirstConnect_StatusBar_Delag( void* ptr ) {
line 188
;188:		UI_DrawString( 320, 440, "Reliable Instanthit weapons", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $110
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 189
;189:}
LABELV $109
endproc FirstConnect_StatusBar_Delag 0 20
proc FirstConnect_StatusBar_Download 0 20
line 196
;190:
;191:/*
;192:=================
;193:FirstConnect_StatusBar_Download
;194:=================
;195:*/
;196:static void FirstConnect_StatusBar_Download( void* ptr ) {
line 197
;197:		UI_DrawString( 320, 440, "Auto download missing maps and mods", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $112
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 198
;198:}
LABELV $111
endproc FirstConnect_StatusBar_Download 0 20
proc FirstConnect_SaveChanges 0 8
line 205
;199:
;200:/*
;201:=================
;202:FirstConnect_SaveChanges
;203:=================
;204:*/
;205:static void FirstConnect_SaveChanges( void ) {
line 207
;206:	// name
;207:	trap_Cvar_Set( "name", s_firstconnect.name.field.buffer );
ADDRGP4 $114
ARGP4
ADDRGP4 s_firstconnect+984+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 208
;208:}
LABELV $113
endproc FirstConnect_SaveChanges 0 8
proc FirstConnect_Event 16 8
line 216
;209:
;210:/*
;211:=================
;212:FirstConnect_Event
;213:=================
;214:*/
;215:static void FirstConnect_Event( void* ptr, int event )
;216:{
line 217
;217:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 11
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $129
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $158
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $151
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $119
LABELV $165
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $122
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $126
ADDRGP4 $119
JUMPV
line 218
;218:	{
LABELV $122
line 220
;219:		case ID_GO:
;220:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $123
line 221
;221:				break;
ADDRGP4 $120
JUMPV
LABELV $123
line 222
;222:                        FirstConnect_SaveChanges();
ADDRGP4 FirstConnect_SaveChanges
CALLV
pop
line 223
;223:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 224
;224:                        trap_Cvar_SetValue( "ui_setupchecked", 1 );
ADDRGP4 $125
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 225
;225:                        UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
line 226
;226:			break;
ADDRGP4 $120
JUMPV
LABELV $126
line 229
;227:
;228:		case ID_BACK:
;229:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $127
line 230
;230:				break;
ADDRGP4 $120
JUMPV
LABELV $127
line 232
;231:
;232:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 233
;233:			break;
ADDRGP4 $120
JUMPV
LABELV $129
line 236
;234:
;235:                case ID_RATE:
;236:                        if( s_firstconnect.rate.curvalue == 0 ) {
ADDRGP4 s_firstconnect+1316+64
INDIRI4
CNSTI4 0
NEI4 $130
line 237
;237:                                trap_Cvar_SetValue( "rate", 2500 );
ADDRGP4 $134
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 238
;238:                        }
ADDRGP4 $120
JUMPV
LABELV $130
line 239
;239:                        else if( s_firstconnect.rate.curvalue == 1 ) {
ADDRGP4 s_firstconnect+1316+64
INDIRI4
CNSTI4 1
NEI4 $135
line 240
;240:                                trap_Cvar_SetValue( "rate", 3000 );
ADDRGP4 $134
ARGP4
CNSTF4 1161527296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 241
;241:                        }
ADDRGP4 $120
JUMPV
LABELV $135
line 242
;242:                        else if( s_firstconnect.rate.curvalue == 2 ) {
ADDRGP4 s_firstconnect+1316+64
INDIRI4
CNSTI4 2
NEI4 $139
line 243
;243:                                trap_Cvar_SetValue( "rate", 4000 );
ADDRGP4 $134
ARGP4
CNSTF4 1165623296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 244
;244:                        }
ADDRGP4 $120
JUMPV
LABELV $139
line 245
;245:                        else if( s_firstconnect.rate.curvalue == 3 ) {
ADDRGP4 s_firstconnect+1316+64
INDIRI4
CNSTI4 3
NEI4 $143
line 246
;246:                                trap_Cvar_SetValue( "rate", 5000 );
ADDRGP4 $134
ARGP4
CNSTF4 1167867904
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 247
;247:                        }
ADDRGP4 $120
JUMPV
LABELV $143
line 248
;248:                        else if( s_firstconnect.rate.curvalue == 4 ) {
ADDRGP4 s_firstconnect+1316+64
INDIRI4
CNSTI4 4
NEI4 $120
line 249
;249:                                trap_Cvar_SetValue( "rate", 25000 );
ADDRGP4 $134
ARGP4
CNSTF4 1187205120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 250
;250:                        }
line 251
;251:                        break;
ADDRGP4 $120
JUMPV
LABELV $151
line 254
;252:
;253:                case ID_ALLOWDOWNLOAD:
;254:                        trap_Cvar_SetValue( "cl_allowDownload", s_firstconnect.allowdownload.curvalue );
ADDRGP4 $152
ARGP4
ADDRGP4 s_firstconnect+1476+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 255
;255:                        trap_Cvar_SetValue( "sv_allowDownload", s_firstconnect.allowdownload.curvalue );
ADDRGP4 $155
ARGP4
ADDRGP4 s_firstconnect+1476+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 256
;256:                        break;
ADDRGP4 $120
JUMPV
LABELV $158
line 259
;257:
;258:                case ID_DELAGHITSCAN:
;259:                        trap_Cvar_SetValue( "g_delagHitscan", s_firstconnect.delaghitscan.curvalue );
ADDRGP4 $159
ARGP4
ADDRGP4 s_firstconnect+1412+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 260
;260:                        trap_Cvar_SetValue( "cg_delag", s_firstconnect.delaghitscan.curvalue );
ADDRGP4 $162
ARGP4
ADDRGP4 s_firstconnect+1412+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 261
;261:                        break;
LABELV $119
LABELV $120
line 263
;262:	}
;263:}
LABELV $118
endproc FirstConnect_Event 16 8
proc FirstConnect_SetMenuItems 28 12
line 270
;264:
;265:/*
;266:=================
;267:FirstConnect_SetMenuItems
;268:=================
;269:*/
;270:static void FirstConnect_SetMenuItems( void ) {
line 273
;271:    int rate;
;272:    // name
;273:	Q_strncpyz( s_firstconnect.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_firstconnect.name.field.buffer) );
ADDRGP4 $114
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_firstconnect+984+60+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 275
;274:
;275:        rate = trap_Cvar_VariableValue( "rate" );
ADDRGP4 $134
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 276
;276:	if( rate <= 2500 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2500
GTI4 $173
line 277
;277:		s_firstconnect.rate.curvalue = 0;
ADDRGP4 s_firstconnect+1316+64
CNSTI4 0
ASGNI4
line 278
;278:	}
ADDRGP4 $174
JUMPV
LABELV $173
line 279
;279:	else if( rate <= 3000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3000
GTI4 $177
line 280
;280:		s_firstconnect.rate.curvalue = 1;
ADDRGP4 s_firstconnect+1316+64
CNSTI4 1
ASGNI4
line 281
;281:	}
ADDRGP4 $178
JUMPV
LABELV $177
line 282
;282:	else if( rate <= 4000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4000
GTI4 $181
line 283
;283:		s_firstconnect.rate.curvalue = 2;
ADDRGP4 s_firstconnect+1316+64
CNSTI4 2
ASGNI4
line 284
;284:	}
ADDRGP4 $182
JUMPV
LABELV $181
line 285
;285:	else if( rate <= 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GTI4 $185
line 286
;286:		s_firstconnect.rate.curvalue = 3;
ADDRGP4 s_firstconnect+1316+64
CNSTI4 3
ASGNI4
line 287
;287:	}
ADDRGP4 $186
JUMPV
LABELV $185
line 288
;288:	else {
line 289
;289:		s_firstconnect.rate.curvalue = 4;
ADDRGP4 s_firstconnect+1316+64
CNSTI4 4
ASGNI4
line 290
;290:	}
LABELV $186
LABELV $182
LABELV $178
LABELV $174
line 292
;291:
;292:        s_firstconnect.allowdownload.curvalue	= trap_Cvar_VariableValue( "cl_allowDownload" ) != 0;
ADDRGP4 $152
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $194
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $195
JUMPV
LABELV $194
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $195
ADDRGP4 s_firstconnect+1476+60
ADDRLP4 12
INDIRI4
ASGNI4
line 293
;293:        s_firstconnect.delaghitscan.curvalue	= trap_Cvar_VariableValue( "cg_delag" ) != 0;
ADDRGP4 $162
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $199
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $199
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $200
ADDRGP4 s_firstconnect+1412+60
ADDRLP4 20
INDIRI4
ASGNI4
line 294
;294:}
LABELV $166
endproc FirstConnect_SetMenuItems 28 12
export FirstConnect_MenuInit
proc FirstConnect_MenuInit 4 12
line 302
;295:
;296:/*
;297:=================
;298:FirstConnect_MenuInit
;299:=================
;300:*/
;301:void FirstConnect_MenuInit( void )
;302:{
line 305
;303:    int y;
;304:	// zero set all our globals
;305:	memset( &s_firstconnect, 0 ,sizeof(firstconnect_t) );
ADDRGP4 s_firstconnect
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1540
ARGI4
ADDRGP4 memset
CALLP4
pop
line 307
;306:
;307:	FirstConnect_Cache();
ADDRGP4 FirstConnect_Cache
CALLV
pop
line 309
;308:
;309:	s_firstconnect.menu.wrapAround = qtrue;
ADDRGP4 s_firstconnect+404
CNSTI4 1
ASGNI4
line 310
;310:	s_firstconnect.menu.fullscreen = qtrue;
ADDRGP4 s_firstconnect+408
CNSTI4 1
ASGNI4
line 312
;311:
;312:	s_firstconnect.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_firstconnect+416
CNSTI4 10
ASGNI4
line 313
;313:	s_firstconnect.banner.generic.x     = 320;
ADDRGP4 s_firstconnect+416+12
CNSTI4 320
ASGNI4
line 314
;314:	s_firstconnect.banner.generic.y     = 16;
ADDRGP4 s_firstconnect+416+16
CNSTI4 16
ASGNI4
line 315
;315:	s_firstconnect.banner.string		 = "FIRST CONNECT";
ADDRGP4 s_firstconnect+416+60
ADDRGP4 $211
ASGNP4
line 316
;316:	s_firstconnect.banner.color  		 = color_white;
ADDRGP4 s_firstconnect+416+68
ADDRGP4 color_white
ASGNP4
line 317
;317:	s_firstconnect.banner.style  		 = UI_CENTER;
ADDRGP4 s_firstconnect+416+64
CNSTI4 1
ASGNI4
line 319
;318:
;319:        s_firstconnect.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_firstconnect+488
CNSTI4 6
ASGNI4
line 320
;320:	s_firstconnect.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_firstconnect+488+4
ADDRGP4 $79
ASGNP4
line 321
;321:	s_firstconnect.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_firstconnect+488+44
CNSTU4 16384
ASGNU4
line 322
;322:	s_firstconnect.framel.generic.x	 = 0;
ADDRGP4 s_firstconnect+488+12
CNSTI4 0
ASGNI4
line 323
;323:	s_firstconnect.framel.generic.y	 = 78;
ADDRGP4 s_firstconnect+488+16
CNSTI4 78
ASGNI4
line 324
;324:	s_firstconnect.framel.width  	     = 256;
ADDRGP4 s_firstconnect+488+76
CNSTI4 256
ASGNI4
line 325
;325:	s_firstconnect.framel.height  	     = 329;
ADDRGP4 s_firstconnect+488+80
CNSTI4 329
ASGNI4
line 327
;326:
;327:	s_firstconnect.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_firstconnect+576
CNSTI4 6
ASGNI4
line 328
;328:	s_firstconnect.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_firstconnect+576+4
ADDRGP4 $80
ASGNP4
line 329
;329:	s_firstconnect.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_firstconnect+576+44
CNSTU4 16384
ASGNU4
line 330
;330:	s_firstconnect.framer.generic.x	 = 376;
ADDRGP4 s_firstconnect+576+12
CNSTI4 376
ASGNI4
line 331
;331:	s_firstconnect.framer.generic.y	 = 76;
ADDRGP4 s_firstconnect+576+16
CNSTI4 76
ASGNI4
line 332
;332:	s_firstconnect.framer.width  	     = 256;
ADDRGP4 s_firstconnect+576+76
CNSTI4 256
ASGNI4
line 333
;333:	s_firstconnect.framer.height  	     = 334;
ADDRGP4 s_firstconnect+576+80
CNSTI4 334
ASGNI4
line 335
;334:
;335:        s_firstconnect.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_firstconnect+664
CNSTI4 6
ASGNI4
line 336
;336:	s_firstconnect.go.generic.name     = ART_FIGHT0;
ADDRGP4 s_firstconnect+664+4
ADDRGP4 $83
ASGNP4
line 337
;337:	s_firstconnect.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_firstconnect+664+44
CNSTU4 272
ASGNU4
line 338
;338:	s_firstconnect.go.generic.callback = FirstConnect_Event;
ADDRGP4 s_firstconnect+664+48
ADDRGP4 FirstConnect_Event
ASGNP4
line 339
;339:	s_firstconnect.go.generic.id	    = ID_GO;
ADDRGP4 s_firstconnect+664+8
CNSTI4 100
ASGNI4
line 340
;340:	s_firstconnect.go.generic.x		= 640;
ADDRGP4 s_firstconnect+664+12
CNSTI4 640
ASGNI4
line 341
;341:	s_firstconnect.go.generic.y		= 480-64;
ADDRGP4 s_firstconnect+664+16
CNSTI4 416
ASGNI4
line 342
;342:	s_firstconnect.go.width  		    = 128;
ADDRGP4 s_firstconnect+664+76
CNSTI4 128
ASGNI4
line 343
;343:	s_firstconnect.go.height  		    = 64;
ADDRGP4 s_firstconnect+664+80
CNSTI4 64
ASGNI4
line 344
;344:	s_firstconnect.go.focuspic         = ART_FIGHT1;
ADDRGP4 s_firstconnect+664+60
ADDRGP4 $84
ASGNP4
line 346
;345:
;346:	s_firstconnect.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_firstconnect+752
CNSTI4 6
ASGNI4
line 347
;347:	s_firstconnect.back.generic.name     = ART_BACK0;
ADDRGP4 s_firstconnect+752+4
ADDRGP4 $81
ASGNP4
line 348
;348:	s_firstconnect.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_firstconnect+752+44
CNSTU4 260
ASGNU4
line 349
;349:	s_firstconnect.back.generic.callback = FirstConnect_Event;
ADDRGP4 s_firstconnect+752+48
ADDRGP4 FirstConnect_Event
ASGNP4
line 350
;350:	s_firstconnect.back.generic.id	      = ID_BACK;
ADDRGP4 s_firstconnect+752+8
CNSTI4 101
ASGNI4
line 351
;351:	s_firstconnect.back.generic.x		  = 0;
ADDRGP4 s_firstconnect+752+12
CNSTI4 0
ASGNI4
line 352
;352:	s_firstconnect.back.generic.y		  = 480-64;
ADDRGP4 s_firstconnect+752+16
CNSTI4 416
ASGNI4
line 353
;353:	s_firstconnect.back.width  		  = 128;
ADDRGP4 s_firstconnect+752+76
CNSTI4 128
ASGNI4
line 354
;354:	s_firstconnect.back.height  		  = 64;
ADDRGP4 s_firstconnect+752+80
CNSTI4 64
ASGNI4
line 355
;355:	s_firstconnect.back.focuspic         = ART_BACK1;
ADDRGP4 s_firstconnect+752+60
ADDRGP4 $82
ASGNP4
line 357
;356:
;357:        y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 358
;358:	s_firstconnect.name.generic.type			= MTYPE_FIELD;
ADDRGP4 s_firstconnect+984
CNSTI4 4
ASGNI4
line 359
;359:	s_firstconnect.name.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 s_firstconnect+984+44
CNSTU4 32768
ASGNU4
line 360
;360:	s_firstconnect.name.generic.ownerdraw		= PlayerSettings_DrawName2;
ADDRGP4 s_firstconnect+984+56
ADDRGP4 PlayerSettings_DrawName2
ASGNP4
line 361
;361:	s_firstconnect.name.field.widthInChars	= MAX_NAMELENGTH;
ADDRGP4 s_firstconnect+984+60+8
CNSTI4 20
ASGNI4
line 362
;362:	s_firstconnect.name.field.maxchars		= MAX_NAMELENGTH;
ADDRGP4 s_firstconnect+984+60+268
CNSTI4 20
ASGNI4
line 363
;363:	s_firstconnect.name.generic.x				= 192;
ADDRGP4 s_firstconnect+984+12
CNSTI4 192
ASGNI4
line 364
;364:	s_firstconnect.name.generic.y				= y;
ADDRGP4 s_firstconnect+984+16
ADDRLP4 0
INDIRI4
ASGNI4
line 365
;365:	s_firstconnect.name.generic.left			= 192 - 8;
ADDRGP4 s_firstconnect+984+20
CNSTI4 184
ASGNI4
line 366
;366:	s_firstconnect.name.generic.top			= y - 8;
ADDRGP4 s_firstconnect+984+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 367
;367:	s_firstconnect.name.generic.right			= 192 + 200;
ADDRGP4 s_firstconnect+984+28
CNSTI4 392
ASGNI4
line 368
;368:	s_firstconnect.name.generic.bottom		= y + 2 * PROP_HEIGHT;
ADDRGP4 s_firstconnect+984+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 369
;369:        s_firstconnect.name.generic.statusbar  = FirstConnect_StatusBar_Name;
ADDRGP4 s_firstconnect+984+52
ADDRGP4 FirstConnect_StatusBar_Name
ASGNP4
line 371
;370:
;371:        y+= 4*PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 108
ADDI4
ASGNI4
line 372
;372:        s_firstconnect.rate.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_firstconnect+1316
CNSTI4 3
ASGNI4
line 373
;373:	s_firstconnect.rate.generic.name		= "Data Rate:";
ADDRGP4 s_firstconnect+1316+4
ADDRGP4 $308
ASGNP4
line 374
;374:	s_firstconnect.rate.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_firstconnect+1316+44
CNSTU4 258
ASGNU4
line 375
;375:	s_firstconnect.rate.generic.callback	= FirstConnect_Event;
ADDRGP4 s_firstconnect+1316+48
ADDRGP4 FirstConnect_Event
ASGNP4
line 376
;376:	s_firstconnect.rate.generic.id			= ID_RATE;
ADDRGP4 s_firstconnect+1316+8
CNSTI4 11
ASGNI4
line 377
;377:	s_firstconnect.rate.generic.x			= 320;
ADDRGP4 s_firstconnect+1316+12
CNSTI4 320
ASGNI4
line 378
;378:	s_firstconnect.rate.generic.y			= y;
ADDRGP4 s_firstconnect+1316+16
ADDRLP4 0
INDIRI4
ASGNI4
line 379
;379:	s_firstconnect.rate.itemnames			= rate_items;
ADDRGP4 s_firstconnect+1316+76
ADDRGP4 rate_items
ASGNP4
line 380
;380:        s_firstconnect.rate.generic.statusbar  = FirstConnect_StatusBar_Rate;
ADDRGP4 s_firstconnect+1316+52
ADDRGP4 FirstConnect_StatusBar_Rate
ASGNP4
line 382
;381:
;382:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 383
;383:	s_firstconnect.delaghitscan.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_firstconnect+1412
CNSTI4 5
ASGNI4
line 384
;384:	s_firstconnect.delaghitscan.generic.name	   = "Compensate latency:";
ADDRGP4 s_firstconnect+1412+4
ADDRGP4 $326
ASGNP4
line 385
;385:	s_firstconnect.delaghitscan.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_firstconnect+1412+44
CNSTU4 258
ASGNU4
line 386
;386:	s_firstconnect.delaghitscan.generic.callback = FirstConnect_Event;
ADDRGP4 s_firstconnect+1412+48
ADDRGP4 FirstConnect_Event
ASGNP4
line 387
;387:	s_firstconnect.delaghitscan.generic.id       = ID_DELAGHITSCAN;
ADDRGP4 s_firstconnect+1412+8
CNSTI4 12
ASGNI4
line 388
;388:	s_firstconnect.delaghitscan.generic.x	       = 320;
ADDRGP4 s_firstconnect+1412+12
CNSTI4 320
ASGNI4
line 389
;389:	s_firstconnect.delaghitscan.generic.y	       = y;
ADDRGP4 s_firstconnect+1412+16
ADDRLP4 0
INDIRI4
ASGNI4
line 390
;390:        s_firstconnect.delaghitscan.generic.statusbar  = FirstConnect_StatusBar_Delag;
ADDRGP4 s_firstconnect+1412+52
ADDRGP4 FirstConnect_StatusBar_Delag
ASGNP4
line 392
;391:
;392:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 393
;393:	s_firstconnect.allowdownload.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_firstconnect+1476
CNSTI4 5
ASGNI4
line 394
;394:	s_firstconnect.allowdownload.generic.name	   = "Automatic Downloading:";
ADDRGP4 s_firstconnect+1476+4
ADDRGP4 $342
ASGNP4
line 395
;395:	s_firstconnect.allowdownload.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_firstconnect+1476+44
CNSTU4 258
ASGNU4
line 396
;396:	s_firstconnect.allowdownload.generic.callback = FirstConnect_Event;
ADDRGP4 s_firstconnect+1476+48
ADDRGP4 FirstConnect_Event
ASGNP4
line 397
;397:	s_firstconnect.allowdownload.generic.id       = ID_ALLOWDOWNLOAD;
ADDRGP4 s_firstconnect+1476+8
CNSTI4 13
ASGNI4
line 398
;398:	s_firstconnect.allowdownload.generic.x	       = 320;
ADDRGP4 s_firstconnect+1476+12
CNSTI4 320
ASGNI4
line 399
;399:	s_firstconnect.allowdownload.generic.y	       = y;
ADDRGP4 s_firstconnect+1476+16
ADDRLP4 0
INDIRI4
ASGNI4
line 400
;400:        s_firstconnect.allowdownload.generic.statusbar  = FirstConnect_StatusBar_Download;
ADDRGP4 s_firstconnect+1476+52
ADDRGP4 FirstConnect_StatusBar_Download
ASGNP4
line 402
;401:
;402:        s_firstconnect.info.generic.type	 = MTYPE_TEXT;
ADDRGP4 s_firstconnect+840
CNSTI4 7
ASGNI4
line 403
;403:	s_firstconnect.info.generic.x     = 320;
ADDRGP4 s_firstconnect+840+12
CNSTI4 320
ASGNI4
line 404
;404:	s_firstconnect.info.generic.y     = 400;
ADDRGP4 s_firstconnect+840+16
CNSTI4 400
ASGNI4
line 405
;405:	s_firstconnect.info.color  		 = color_white;
ADDRGP4 s_firstconnect+840+68
ADDRGP4 color_white
ASGNP4
line 406
;406:	s_firstconnect.info.style  		 = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_firstconnect+840+64
CNSTI4 17
ASGNI4
line 407
;407:        s_firstconnect.info.string           = "Note: All settings can be changed later in SETUP";
ADDRGP4 s_firstconnect+840+60
ADDRGP4 $366
ASGNP4
line 409
;408:
;409:        s_firstconnect.info2.generic.type	 = MTYPE_TEXT;
ADDRGP4 s_firstconnect+912
CNSTI4 7
ASGNI4
line 410
;410:	s_firstconnect.info2.generic.x     = 320;
ADDRGP4 s_firstconnect+912+12
CNSTI4 320
ASGNI4
line 411
;411:	s_firstconnect.info2.generic.y     = 80;
ADDRGP4 s_firstconnect+912+16
CNSTI4 80
ASGNI4
line 412
;412:	s_firstconnect.info2.color  		 = color_white;
ADDRGP4 s_firstconnect+912+68
ADDRGP4 color_white
ASGNP4
line 413
;413:	s_firstconnect.info2.style  		 = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_firstconnect+912+64
CNSTI4 17
ASGNI4
line 414
;414:        s_firstconnect.info2.string           = "Please verify these settings";
ADDRGP4 s_firstconnect+912+60
ADDRGP4 $378
ASGNP4
line 416
;415:
;416:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.banner );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 417
;417:	Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.framel );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 418
;418:	Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.framer );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 419
;419:	Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.go );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 420
;420:	Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.back );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 422
;421:
;422:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.name );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+984
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 423
;423:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.rate );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+1316
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 425
;424:
;425:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.delaghitscan );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 426
;426:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.allowdownload );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+1476
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 428
;427:
;428:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.info );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 429
;429:        Menu_AddItem( &s_firstconnect.menu, &s_firstconnect.info2 );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 s_firstconnect+912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 431
;430:
;431:        FirstConnect_SetMenuItems();
ADDRGP4 FirstConnect_SetMenuItems
CALLV
pop
line 432
;432:}
LABELV $201
endproc FirstConnect_MenuInit 4 12
export FirstConnect_Cache
proc FirstConnect_Cache 4 4
line 440
;433:
;434:/*
;435:=================
;436:FirstConnect_Cache
;437:=================
;438:*/
;439:void FirstConnect_Cache( void )
;440:{
line 444
;441:	int	i;
;442:
;443:	// touch all our pics
;444:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $391
line 445
;445:	{
line 446
;446:		if (!art_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 art_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $395
line 447
;447:			break;
ADDRGP4 $393
JUMPV
LABELV $395
line 448
;448:		trap_R_RegisterShaderNoMip(art_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 art_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 449
;449:	}
LABELV $392
line 444
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $391
JUMPV
LABELV $393
line 450
;450:}
LABELV $390
endproc FirstConnect_Cache 4 4
export UI_FirstConnectMenu
proc UI_FirstConnectMenu 0 4
line 458
;451:
;452:/*
;453:=================
;454:UI_FirstConnectMenu
;455:=================
;456:*/
;457:void UI_FirstConnectMenu( void )
;458:{
line 459
;459:	FirstConnect_MenuInit();
ADDRGP4 FirstConnect_MenuInit
CALLV
pop
line 460
;460:	UI_PushMenu( &s_firstconnect.menu );
ADDRGP4 s_firstconnect
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 461
;461:}
LABELV $397
endproc UI_FirstConnectMenu 0 4
bss
align 4
LABELV s_firstconnect
skip 1540
import rate_items
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
LABELV $378
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $366
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $342
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $326
byte 1 67
byte 1 111
byte 1 109
byte 1 112
byte 1 101
byte 1 110
byte 1 115
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $308
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $211
byte 1 70
byte 1 73
byte 1 82
byte 1 83
byte 1 84
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 78
byte 1 69
byte 1 67
byte 1 84
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $159
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 72
byte 1 105
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $155
byte 1 115
byte 1 118
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $134
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $125
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
LABELV $114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $110
byte 1 82
byte 1 101
byte 1 108
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $106
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 110
byte 1 105
byte 1 99
byte 1 107
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
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
