data
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
align 4
LABELV handicap_items
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
address $92
address $93
address $94
address $95
address $96
address $97
address $98
address $99
byte 4 0
code
proc PlayerSettings_DrawName 92 20
file "../../../code/q3_ui/ui_playersettings.c"
line 111
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
;25:#define ART_FRAMEL			"menu/art_blueish/frame2_l"
;26:#define ART_FRAMER			"menu/art_blueish/frame1_r"
;27:#define ART_MODEL0			"menu/art_blueish/model_0"
;28:#define ART_MODEL1			"menu/art_blueish/model_1"
;29:#define ART_BACK0			"menu/art_blueish/back_0"
;30:#define ART_BACK1			"menu/art_blueish/back_1"
;31:#define ART_FX_BASE			"menu/art/fx_base"
;32:#define ART_FX_BLUE			"menu/art/fx_blue"
;33:#define ART_FX_CYAN			"menu/art/fx_cyan"
;34:#define ART_FX_GREEN		"menu/art/fx_grn"
;35:#define ART_FX_RED			"menu/art/fx_red"
;36:#define ART_FX_TEAL			"menu/art/fx_teal"
;37:#define ART_FX_WHITE		"menu/art/fx_white"
;38:#define ART_FX_YELLOW		"menu/art/fx_yel"
;39:
;40:#define ID_NAME			10
;41:#define ID_HANDICAP		11
;42:#define ID_EFFECTS		12
;43:#define ID_EFFECTS2		13
;44:#define ID_BACK			14
;45:#define ID_MODEL		15
;46:
;47:#define MAX_NAMELENGTH	20
;48:
;49:
;50:typedef struct {
;51:	menuframework_s		menu;
;52:
;53:	menutext_s			banner;
;54:	menubitmap_s		framel;
;55:	menubitmap_s		framer;
;56:	menubitmap_s		player;
;57:
;58:	menufield_s			name;
;59:	menulist_s			handicap;
;60:	menulist_s			effects;
;61:        
;62:        //Added in beta 29
;63:        menulist_s              effects2;
;64:
;65:	menubitmap_s		back;
;66:	menubitmap_s		model;
;67:	menubitmap_s		item_null;
;68:
;69:	qhandle_t			fxBasePic;
;70:	qhandle_t			fxPic[7];
;71:	playerInfo_t		playerinfo;
;72:	int					current_fx;
;73:	char				playerModel[MAX_QPATH];
;74:} playersettings_t;
;75:
;76:static playersettings_t	s_playersettings;
;77:
;78:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;79:static int uitogamecode[] = {4,6,2,3,1,5,7};
;80:
;81:static const char *handicap_items[] = {
;82:	"100",
;83:	"95",
;84:	"90",
;85:	"85",
;86:	"80",
;87:	"75",
;88:	"70",
;89:	"65",
;90:	"60",
;91:	"55",
;92:	"50",
;93:	"45",
;94:	"40",
;95:	"35",
;96:	"30",
;97:	"25",
;98:	"20",
;99:	"15",
;100:	"10",
;101:	"5",
;102:	NULL
;103:};
;104:
;105:
;106:/*
;107:=================
;108:PlayerSettings_DrawName
;109:=================
;110:*/
;111:static void PlayerSettings_DrawName( void *self ) {
line 122
;112:	menufield_s		*f;
;113:	qboolean		focus;
;114:	int				style;
;115:	char			*txt;
;116:	char			c;
;117:	float			*color;
;118:	int				n;
;119:	int				basex, x, y;
;120:	char			name[32];
;121:
;122:	f = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 123
;123:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 124
;124:	y = f->generic.y;
ADDRLP4 24
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 125
;125:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
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
NEI4 $102
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $103
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 127
;126:
;127:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 128
;128:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 129
;129:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $104
line 130
;130:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 131
;131:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 132
;132:	}
LABELV $104
line 134
;133:
;134:	UI_DrawProportionalString( basex, y, "Name", style, color );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $106
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
line 137
;135:
;136:	// draw the actual name
;137:	basex += 64;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 138
;138:	y += PROP_HEIGHT;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 139
;139:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
line 140
;140:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 141
;141:	x = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $108
line 142
;142:	while ( (c = *txt) != 0 ) {
line 143
;143:		if ( !focus && Q_IsColorString( txt ) ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $111
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $111
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $111
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
EQI4 $111
ADDRLP4 88
INDIRI4
CNSTI4 48
LTI4 $111
ADDRLP4 88
INDIRI4
CNSTI4 56
GTI4 $111
line 144
;144:			n = ColorIndex( *(txt+1) );
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
line 145
;145:			if( n == 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $113
line 146
;146:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 147
;147:			}
LABELV $113
line 148
;148:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 149
;149:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 150
;150:			continue;
ADDRGP4 $109
JUMPV
LABELV $111
line 152
;151:		}
;152:		UI_DrawChar( x, y, c, style, color );
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
line 153
;153:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 154
;154:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 155
;155:	}
LABELV $109
line 142
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
NEI4 $108
line 158
;156:
;157:	// draw cursor if we have focus
;158:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $115
line 159
;159:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $117
line 160
;160:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 161
;161:		} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 162
;162:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 163
;163:		}
LABELV $118
line 165
;164:
;165:		style &= ~UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 166
;166:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 168
;167:
;168:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
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
line 169
;169:	}
LABELV $115
line 172
;170:
;171:	// draw at bottom also using proportional font
;172:	Q_strncpyz( name, f->field.buffer, sizeof(name) );
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
line 173
;173:	Q_CleanStr( name );
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 174
;174:	UI_DrawProportionalString( 320, 440, name, UI_CENTER|UI_BIGFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 175
;175:}
LABELV $100
endproc PlayerSettings_DrawName 92 20
proc PlayerSettings_DrawHandicap 36 20
line 183
;176:
;177:
;178:/*
;179:=================
;180:PlayerSettings_DrawHandicap
;181:=================
;182:*/
;183:static void PlayerSettings_DrawHandicap( void *self ) {
line 189
;184:	menulist_s		*item;
;185:	qboolean		focus;
;186:	int				style;
;187:	float			*color;
;188:
;189:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 190
;190:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $121
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $121
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $122
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 192
;191:
;192:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 193
;193:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 194
;194:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $123
line 195
;195:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 196
;196:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 197
;197:	}
LABELV $123
line 199
;198:
;199:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Handicap", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 200
;200:	UI_DrawProportionalString( item->generic.x + 64, item->generic.y + PROP_HEIGHT, handicap_items[item->curvalue], style, color );
ADDRLP4 32
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicap_items
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 201
;201:}
LABELV $119
endproc PlayerSettings_DrawHandicap 36 20
proc PlayerSettings_DrawEffects 44 20
line 209
;202:
;203:
;204:/*
;205:=================
;206:PlayerSettings_DrawEffects
;207:=================
;208:*/
;209:static void PlayerSettings_DrawEffects( void *self ) {
line 215
;210:	menulist_s		*item;
;211:	qboolean		focus;
;212:	int				style;
;213:	float			*color;
;214:
;215:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 216
;216:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $128
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $128
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $129
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 218
;217:
;218:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 219
;219:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 220
;220:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $130
line 221
;221:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 222
;222:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 223
;223:	}
LABELV $130
line 225
;224:
;225:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Effects", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $132
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 227
;226:
;227:	UI_DrawHandlePic( item->generic.x + 64, item->generic.y + PROP_HEIGHT + 8, 128, 8, s_playersettings.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+1636
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 228
;228:	UI_DrawHandlePic( item->generic.x + 64 + item->curvalue * 16 + 8, item->generic.y + PROP_HEIGHT + 6, 16, 12, s_playersettings.fxPic[item->curvalue] );
ADDRLP4 36
CNSTI4 64
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_playersettings+1640
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 229
;229:}
LABELV $126
endproc PlayerSettings_DrawEffects 44 20
proc PlayerSettings_DrawEffects2 32 20
line 236
;230:
;231:/*
;232:=================
;233:PlayerSettings_DrawEffects
;234:=================
;235:*/
;236:static void PlayerSettings_DrawEffects2( void *self ) {
line 240
;237:	menulist_s		*item;
;238:	qboolean		focus;
;239:
;240:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 241
;241:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $137
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $138
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 243
;242:
;243:	UI_DrawHandlePic( item->generic.x + 64, item->generic.y + 8, 128, 8, s_playersettings.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+1636
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 244
;244:	UI_DrawHandlePic( item->generic.x + 64 + item->curvalue * 16 + 8, item->generic.y + 6, 16, 12, s_playersettings.fxPic[item->curvalue] );
ADDRLP4 24
CNSTI4 64
ASGNI4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ADDRLP4 28
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_playersettings+1640
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 245
;245:}
LABELV $135
endproc PlayerSettings_DrawEffects2 32 20
proc PlayerSettings_DrawPlayer 88 28
line 253
;246:
;247:
;248:/*
;249:=================
;250:PlayerSettings_DrawPlayer
;251:=================
;252:*/
;253:static void PlayerSettings_DrawPlayer( void *self ) {
line 258
;254:	menubitmap_s	*b;
;255:	vec3_t			viewangles;
;256:	char			buf[MAX_QPATH];
;257:
;258:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof( buf ) );
ADDRGP4 $142
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 259
;259:	if ( strcmp( buf, s_playersettings.playerModel ) != 0 ) {
ADDRLP4 4
ARGP4
ADDRGP4 s_playersettings+2780
ARGP4
ADDRLP4 80
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $143
line 260
;260:		UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, buf );
ADDRGP4 s_playersettings+1668
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 261
;261:		strcpy( s_playersettings.playerModel, buf );
ADDRGP4 s_playersettings+2780
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 263
;262:
;263:		viewangles[YAW]   = 180 - 30;
ADDRLP4 68+4
CNSTF4 1125515264
ASGNF4
line 264
;264:		viewangles[PITCH] = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 265
;265:		viewangles[ROLL]  = 0;
ADDRLP4 68+8
CNSTF4 0
ASGNF4
line 266
;266:		UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1668
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 267
;267:	}
LABELV $143
line 269
;268:
;269:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 270
;270:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playersettings.playerinfo, uis.realtime/2 );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
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
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playersettings+1668
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 271
;271:}
LABELV $141
endproc PlayerSettings_DrawPlayer 88 28
proc PlayerSettings_SaveChanges 0 8
line 279
;272:
;273:
;274:/*
;275:=================
;276:PlayerSettings_SaveChanges
;277:=================
;278:*/
;279:static void PlayerSettings_SaveChanges( void ) {
line 281
;280:	// name
;281:	trap_Cvar_Set( "name", s_playersettings.name.field.buffer );
ADDRGP4 $154
ARGP4
ADDRGP4 s_playersettings+752+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 284
;282:
;283:	// handicap
;284:	trap_Cvar_SetValue( "handicap", 100 - s_playersettings.handicap.curvalue * 5 );
ADDRGP4 $158
ARGP4
CNSTI4 100
CNSTI4 5
ADDRGP4 s_playersettings+1084+64
INDIRI4
MULI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 287
;285:
;286:	// effects color
;287:	trap_Cvar_SetValue( "color1", uitogamecode[s_playersettings.effects.curvalue] );
ADDRGP4 $161
ARGP4
ADDRGP4 s_playersettings+1180+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 290
;288:        
;289:        // effects2 color
;290:	trap_Cvar_SetValue( "color2", uitogamecode[s_playersettings.effects2.curvalue] );
ADDRGP4 $164
ARGP4
ADDRGP4 s_playersettings+1276+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 291
;291:}
LABELV $153
endproc PlayerSettings_SaveChanges 0 8
proc PlayerSettings_MenuKey 8 8
line 299
;292:
;293:
;294:/*
;295:=================
;296:PlayerSettings_MenuKey
;297:=================
;298:*/
;299:static sfxHandle_t PlayerSettings_MenuKey( int key ) {
line 300
;300:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $170
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $168
LABELV $170
line 301
;301:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 302
;302:	}
LABELV $168
line 303
;303:	return Menu_DefaultKey( &s_playersettings.menu, key );
ADDRGP4 s_playersettings
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
LABELV $167
endproc PlayerSettings_MenuKey 8 8
proc PlayerSettings_SetMenuItems 52 28
line 312
;304:}
;305:
;306:
;307:/*
;308:=================
;309:PlayerSettings_SetMenuItems
;310:=================
;311:*/
;312:static void PlayerSettings_SetMenuItems( void ) {
line 318
;313:	vec3_t	viewangles;
;314:	int		c;
;315:	int		h;
;316:
;317:	// name
;318:	Q_strncpyz( s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_playersettings.name.field.buffer) );
ADDRGP4 $154
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+752+60+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 321
;319:
;320:	// effects color
;321:	c = trap_Cvar_VariableValue( "color1" ) - 1;
ADDRGP4 $161
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 322
;322:	if( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $180
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $178
LABELV $180
line 323
;323:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 324
;324:	}
LABELV $178
line 325
;325:	s_playersettings.effects.curvalue = gamecodetoui[c];
ADDRGP4 s_playersettings+1180+64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui
ADDP4
INDIRI4
ASGNI4
line 328
;326:        
;327:        // effects2 color
;328:	c = trap_Cvar_VariableValue( "color2" ) - 1;
ADDRGP4 $164
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 329
;329:	if( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $185
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $183
LABELV $185
line 330
;330:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 331
;331:	}
LABELV $183
line 332
;332:	s_playersettings.effects2.curvalue = gamecodetoui[c];
ADDRGP4 s_playersettings+1276+64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui
ADDP4
INDIRI4
ASGNI4
line 335
;333:
;334:	// model/skin
;335:	memset( &s_playersettings.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playersettings+1668
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 337
;336:	
;337:	viewangles[YAW]   = 180 - 30;
ADDRLP4 4+4
CNSTF4 1125515264
ASGNF4
line 338
;338:	viewangles[PITCH] = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 339
;339:	viewangles[ROLL]  = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 341
;340:
;341:	UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, UI_Cvar_VariableString( "model" ) );
ADDRGP4 $142
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+1668
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 342
;342:	UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1668
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 345
;343:
;344:	// handicap
;345:	h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $158
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 346
;346:	s_playersettings.handicap.curvalue = 20 - h / 5;
ADDRGP4 s_playersettings+1084+64
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 347
;347:}
LABELV $171
endproc PlayerSettings_SetMenuItems 52 28
proc PlayerSettings_MenuEvent 12 8
line 355
;348:
;349:
;350:/*
;351:=================
;352:PlayerSettings_MenuEvent
;353:=================
;354:*/
;355:static void PlayerSettings_MenuEvent( void* ptr, int event ) {
line 356
;356:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $196
line 357
;357:		return;
ADDRGP4 $195
JUMPV
LABELV $196
line 360
;358:	}
;359:
;360:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $201
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $206
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $205
ADDRGP4 $198
JUMPV
LABELV $201
line 362
;361:	case ID_HANDICAP:
;362:		trap_Cvar_Set( "handicap", va( "%i", 100 - 25 * s_playersettings.handicap.curvalue ) );
ADDRGP4 $202
ARGP4
CNSTI4 100
CNSTI4 25
ADDRGP4 s_playersettings+1084+64
INDIRI4
MULI4
SUBI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $158
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 363
;363:		break;
ADDRGP4 $199
JUMPV
LABELV $205
line 366
;364:
;365:	case ID_MODEL:
;366:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 367
;367:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 368
;368:		break;
ADDRGP4 $199
JUMPV
LABELV $206
line 371
;369:
;370:	case ID_BACK:
;371:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 372
;372:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 373
;373:		break;
LABELV $198
LABELV $199
line 375
;374:	}
;375:}
LABELV $195
endproc PlayerSettings_MenuEvent 12 8
proc PlayerSettings_StatusBar 0 20
line 382
;376:
;377:/*
;378:=================
;379:PlayerSettings_StatusBar
;380:=================
;381:*/
;382:static void PlayerSettings_StatusBar( void* ptr ) {
line 383
;383:	UI_DrawString( 320, 400, "Lower handicap makes you weaker", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 $208
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 384
;384:        UI_DrawString( 320, 420, "giving you more challenge", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 420
ARGI4
ADDRGP4 $209
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 385
;385:}
LABELV $207
endproc PlayerSettings_StatusBar 0 20
proc PlayerSettings_MenuInit 4 12
line 392
;386:
;387:/*
;388:=================
;389:PlayerSettings_MenuInit
;390:=================
;391:*/
;392:static void PlayerSettings_MenuInit( void ) {
line 395
;393:	int		y;
;394:
;395:	memset(&s_playersettings,0,sizeof(playersettings_t));
ADDRGP4 s_playersettings
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2844
ARGI4
ADDRGP4 memset
CALLP4
pop
line 397
;396:
;397:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 399
;398:
;399:	s_playersettings.menu.key        = PlayerSettings_MenuKey;
ADDRGP4 s_playersettings+400
ADDRGP4 PlayerSettings_MenuKey
ASGNP4
line 400
;400:	s_playersettings.menu.wrapAround = qtrue;
ADDRGP4 s_playersettings+404
CNSTI4 1
ASGNI4
line 401
;401:	s_playersettings.menu.fullscreen = qtrue;
ADDRGP4 s_playersettings+408
CNSTI4 1
ASGNI4
line 403
;402:
;403:	s_playersettings.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playersettings+416
CNSTI4 10
ASGNI4
line 404
;404:	s_playersettings.banner.generic.x     = 320;
ADDRGP4 s_playersettings+416+12
CNSTI4 320
ASGNI4
line 405
;405:	s_playersettings.banner.generic.y     = 16;
ADDRGP4 s_playersettings+416+16
CNSTI4 16
ASGNI4
line 406
;406:	s_playersettings.banner.string        = "PLAYER SETTINGS";
ADDRGP4 s_playersettings+416+60
ADDRGP4 $221
ASGNP4
line 407
;407:	s_playersettings.banner.color         = color_white;
ADDRGP4 s_playersettings+416+68
ADDRGP4 color_white
ASGNP4
line 408
;408:	s_playersettings.banner.style         = UI_CENTER;
ADDRGP4 s_playersettings+416+64
CNSTI4 1
ASGNI4
line 410
;409:
;410:	s_playersettings.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+488
CNSTI4 6
ASGNI4
line 411
;411:	s_playersettings.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_playersettings+488+4
ADDRGP4 $229
ASGNP4
line 412
;412:	s_playersettings.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+488+44
CNSTU4 16388
ASGNU4
line 413
;413:	s_playersettings.framel.generic.x     = 0;
ADDRGP4 s_playersettings+488+12
CNSTI4 0
ASGNI4
line 414
;414:	s_playersettings.framel.generic.y     = 78;
ADDRGP4 s_playersettings+488+16
CNSTI4 78
ASGNI4
line 415
;415:	s_playersettings.framel.width         = 256;
ADDRGP4 s_playersettings+488+76
CNSTI4 256
ASGNI4
line 416
;416:	s_playersettings.framel.height        = 329;
ADDRGP4 s_playersettings+488+80
CNSTI4 329
ASGNI4
line 418
;417:
;418:	s_playersettings.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+576
CNSTI4 6
ASGNI4
line 419
;419:	s_playersettings.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_playersettings+576+4
ADDRGP4 $243
ASGNP4
line 420
;420:	s_playersettings.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+576+44
CNSTU4 16388
ASGNU4
line 421
;421:	s_playersettings.framer.generic.x     = 376;
ADDRGP4 s_playersettings+576+12
CNSTI4 376
ASGNI4
line 422
;422:	s_playersettings.framer.generic.y     = 76;
ADDRGP4 s_playersettings+576+16
CNSTI4 76
ASGNI4
line 423
;423:	s_playersettings.framer.width         = 256;
ADDRGP4 s_playersettings+576+76
CNSTI4 256
ASGNI4
line 424
;424:	s_playersettings.framer.height        = 334;
ADDRGP4 s_playersettings+576+80
CNSTI4 334
ASGNI4
line 426
;425:
;426:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 427
;427:	s_playersettings.name.generic.type			= MTYPE_FIELD;
ADDRGP4 s_playersettings+752
CNSTI4 4
ASGNI4
line 428
;428:	s_playersettings.name.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+752+44
CNSTU4 32768
ASGNU4
line 429
;429:	s_playersettings.name.generic.ownerdraw		= PlayerSettings_DrawName;
ADDRGP4 s_playersettings+752+56
ADDRGP4 PlayerSettings_DrawName
ASGNP4
line 430
;430:	s_playersettings.name.field.widthInChars	= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+752+60+8
CNSTI4 20
ASGNI4
line 431
;431:	s_playersettings.name.field.maxchars		= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+752+60+268
CNSTI4 20
ASGNI4
line 432
;432:	s_playersettings.name.generic.x				= 192;
ADDRGP4 s_playersettings+752+12
CNSTI4 192
ASGNI4
line 433
;433:	s_playersettings.name.generic.y				= y;
ADDRGP4 s_playersettings+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 434
;434:	s_playersettings.name.generic.left			= 192 - 8;
ADDRGP4 s_playersettings+752+20
CNSTI4 184
ASGNI4
line 435
;435:	s_playersettings.name.generic.top			= y - 8;
ADDRGP4 s_playersettings+752+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 436
;436:	s_playersettings.name.generic.right			= 192 + 200;
ADDRGP4 s_playersettings+752+28
CNSTI4 392
ASGNI4
line 437
;437:	s_playersettings.name.generic.bottom		= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+752+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 439
;438:
;439:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 440
;440:	s_playersettings.handicap.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1084
CNSTI4 3
ASGNI4
line 441
;441:	s_playersettings.handicap.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1084+44
CNSTU4 32768
ASGNU4
line 442
;442:	s_playersettings.handicap.generic.id		= ID_HANDICAP;
ADDRGP4 s_playersettings+1084+8
CNSTI4 11
ASGNI4
line 443
;443:	s_playersettings.handicap.generic.ownerdraw	= PlayerSettings_DrawHandicap;
ADDRGP4 s_playersettings+1084+56
ADDRGP4 PlayerSettings_DrawHandicap
ASGNP4
line 444
;444:	s_playersettings.handicap.generic.x			= 192;
ADDRGP4 s_playersettings+1084+12
CNSTI4 192
ASGNI4
line 445
;445:	s_playersettings.handicap.generic.y			= y;
ADDRGP4 s_playersettings+1084+16
ADDRLP4 0
INDIRI4
ASGNI4
line 446
;446:	s_playersettings.handicap.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+1084+20
CNSTI4 184
ASGNI4
line 447
;447:	s_playersettings.handicap.generic.top		= y - 8;
ADDRGP4 s_playersettings+1084+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 448
;448:	s_playersettings.handicap.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+1084+28
CNSTI4 392
ASGNI4
line 449
;449:	s_playersettings.handicap.generic.bottom	= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+1084+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 450
;450:        s_playersettings.handicap.generic.statusbar     = PlayerSettings_StatusBar;
ADDRGP4 s_playersettings+1084+52
ADDRGP4 PlayerSettings_StatusBar
ASGNP4
line 451
;451:	s_playersettings.handicap.numitems			= 20;
ADDRGP4 s_playersettings+1084+68
CNSTI4 20
ASGNI4
line 453
;452:
;453:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 454
;454:	s_playersettings.effects.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1180
CNSTI4 3
ASGNI4
line 455
;455:	s_playersettings.effects.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1180+44
CNSTU4 32768
ASGNU4
line 456
;456:	s_playersettings.effects.generic.id			= ID_EFFECTS;
ADDRGP4 s_playersettings+1180+8
CNSTI4 12
ASGNI4
line 457
;457:	s_playersettings.effects.generic.ownerdraw	= PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+1180+56
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 458
;458:	s_playersettings.effects.generic.x			= 192;
ADDRGP4 s_playersettings+1180+12
CNSTI4 192
ASGNI4
line 459
;459:	s_playersettings.effects.generic.y			= y;
ADDRGP4 s_playersettings+1180+16
ADDRLP4 0
INDIRI4
ASGNI4
line 460
;460:	s_playersettings.effects.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+1180+20
CNSTI4 184
ASGNI4
line 461
;461:	s_playersettings.effects.generic.top		= y - 8;
ADDRGP4 s_playersettings+1180+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 462
;462:	s_playersettings.effects.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+1180+28
CNSTI4 392
ASGNI4
line 463
;463:	s_playersettings.effects.generic.bottom		= y + 2* PROP_HEIGHT;
ADDRGP4 s_playersettings+1180+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 464
;464:	s_playersettings.effects.numitems			= 7;
ADDRGP4 s_playersettings+1180+68
CNSTI4 7
ASGNI4
line 466
;465:        
;466:        y += 2*PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 467
;467:	s_playersettings.effects2.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1276
CNSTI4 3
ASGNI4
line 468
;468:	s_playersettings.effects2.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1276+44
CNSTU4 32768
ASGNU4
line 469
;469:	s_playersettings.effects2.generic.id			= ID_EFFECTS2;
ADDRGP4 s_playersettings+1276+8
CNSTI4 13
ASGNI4
line 470
;470:	s_playersettings.effects2.generic.ownerdraw	= PlayerSettings_DrawEffects2;
ADDRGP4 s_playersettings+1276+56
ADDRGP4 PlayerSettings_DrawEffects2
ASGNP4
line 471
;471:	s_playersettings.effects2.generic.x			= 192;
ADDRGP4 s_playersettings+1276+12
CNSTI4 192
ASGNI4
line 472
;472:	s_playersettings.effects2.generic.y			= y;
ADDRGP4 s_playersettings+1276+16
ADDRLP4 0
INDIRI4
ASGNI4
line 473
;473:	s_playersettings.effects2.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+1276+20
CNSTI4 184
ASGNI4
line 474
;474:	s_playersettings.effects2.generic.top		= y - 8;
ADDRGP4 s_playersettings+1276+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 475
;475:	s_playersettings.effects2.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+1276+28
CNSTI4 392
ASGNI4
line 476
;476:	s_playersettings.effects2.generic.bottom		= y + 2* PROP_HEIGHT;
ADDRGP4 s_playersettings+1276+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 477
;477:	s_playersettings.effects2.numitems			= 7;
ADDRGP4 s_playersettings+1276+68
CNSTI4 7
ASGNI4
line 479
;478:
;479:	s_playersettings.model.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1460
CNSTI4 6
ASGNI4
line 480
;480:	s_playersettings.model.generic.name			= ART_MODEL0;
ADDRGP4 s_playersettings+1460+4
ADDRGP4 $345
ASGNP4
line 481
;481:	s_playersettings.model.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1460+44
CNSTU4 272
ASGNU4
line 482
;482:	s_playersettings.model.generic.id			= ID_MODEL;
ADDRGP4 s_playersettings+1460+8
CNSTI4 15
ASGNI4
line 483
;483:	s_playersettings.model.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1460+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 484
;484:	s_playersettings.model.generic.x			= 640;
ADDRGP4 s_playersettings+1460+12
CNSTI4 640
ASGNI4
line 485
;485:	s_playersettings.model.generic.y			= 480-64;
ADDRGP4 s_playersettings+1460+16
CNSTI4 416
ASGNI4
line 486
;486:	s_playersettings.model.width				= 128;
ADDRGP4 s_playersettings+1460+76
CNSTI4 128
ASGNI4
line 487
;487:	s_playersettings.model.height				= 64;
ADDRGP4 s_playersettings+1460+80
CNSTI4 64
ASGNI4
line 488
;488:	s_playersettings.model.focuspic				= ART_MODEL1;
ADDRGP4 s_playersettings+1460+60
ADDRGP4 $362
ASGNP4
line 490
;489:
;490:	s_playersettings.player.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+664
CNSTI4 6
ASGNI4
line 491
;491:	s_playersettings.player.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playersettings+664+44
CNSTU4 16384
ASGNU4
line 492
;492:	s_playersettings.player.generic.ownerdraw	= PlayerSettings_DrawPlayer;
ADDRGP4 s_playersettings+664+56
ADDRGP4 PlayerSettings_DrawPlayer
ASGNP4
line 493
;493:	s_playersettings.player.generic.x			= 400;
ADDRGP4 s_playersettings+664+12
CNSTI4 400
ASGNI4
line 494
;494:	s_playersettings.player.generic.y			= -40;
ADDRGP4 s_playersettings+664+16
CNSTI4 -40
ASGNI4
line 495
;495:	s_playersettings.player.width				= 32*10;
ADDRGP4 s_playersettings+664+76
CNSTI4 320
ASGNI4
line 496
;496:	s_playersettings.player.height				= 56*10;
ADDRGP4 s_playersettings+664+80
CNSTI4 560
ASGNI4
line 498
;497:
;498:	s_playersettings.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1372
CNSTI4 6
ASGNI4
line 499
;499:	s_playersettings.back.generic.name			= ART_BACK0;
ADDRGP4 s_playersettings+1372+4
ADDRGP4 $379
ASGNP4
line 500
;500:	s_playersettings.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1372+44
CNSTU4 260
ASGNU4
line 501
;501:	s_playersettings.back.generic.id			= ID_BACK;
ADDRGP4 s_playersettings+1372+8
CNSTI4 14
ASGNI4
line 502
;502:	s_playersettings.back.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1372+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 503
;503:	s_playersettings.back.generic.x				= 0;
ADDRGP4 s_playersettings+1372+12
CNSTI4 0
ASGNI4
line 504
;504:	s_playersettings.back.generic.y				= 480-64;
ADDRGP4 s_playersettings+1372+16
CNSTI4 416
ASGNI4
line 505
;505:	s_playersettings.back.width					= 128;
ADDRGP4 s_playersettings+1372+76
CNSTI4 128
ASGNI4
line 506
;506:	s_playersettings.back.height				= 64;
ADDRGP4 s_playersettings+1372+80
CNSTI4 64
ASGNI4
line 507
;507:	s_playersettings.back.focuspic				= ART_BACK1;
ADDRGP4 s_playersettings+1372+60
ADDRGP4 $396
ASGNP4
line 509
;508:
;509:	s_playersettings.item_null.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1548
CNSTI4 6
ASGNI4
line 510
;510:	s_playersettings.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_playersettings+1548+44
CNSTU4 1050628
ASGNU4
line 511
;511:	s_playersettings.item_null.generic.x		= 0;
ADDRGP4 s_playersettings+1548+12
CNSTI4 0
ASGNI4
line 512
;512:	s_playersettings.item_null.generic.y		= 0;
ADDRGP4 s_playersettings+1548+16
CNSTI4 0
ASGNI4
line 513
;513:	s_playersettings.item_null.width			= 640;
ADDRGP4 s_playersettings+1548+76
CNSTI4 640
ASGNI4
line 514
;514:	s_playersettings.item_null.height			= 480;
ADDRGP4 s_playersettings+1548+80
CNSTI4 480
ASGNI4
line 516
;515:
;516:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.banner );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 517
;517:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framel );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 518
;518:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framer );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 520
;519:
;520:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.name );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 521
;521:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.handicap );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1084
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 522
;522:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 523
;523:        Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects2 );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1276
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 524
;524:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.model );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1460
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 525
;525:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.back );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 527
;526:
;527:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.player );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 529
;528:
;529:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.item_null );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 531
;530:
;531:	PlayerSettings_SetMenuItems();
ADDRGP4 PlayerSettings_SetMenuItems
CALLV
pop
line 532
;532:}
LABELV $210
endproc PlayerSettings_MenuInit 4 12
export PlayerSettings_Cache
proc PlayerSettings_Cache 32 4
line 540
;533:
;534:
;535:/*
;536:=================
;537:PlayerSettings_Cache
;538:=================
;539:*/
;540:void PlayerSettings_Cache( void ) {
line 541
;541:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $229
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 542
;542:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $243
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 543
;543:	trap_R_RegisterShaderNoMip( ART_MODEL0 );
ADDRGP4 $345
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 544
;544:	trap_R_RegisterShaderNoMip( ART_MODEL1 );
ADDRGP4 $362
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 545
;545:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $379
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 546
;546:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $396
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 548
;547:
;548:	s_playersettings.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $421
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1636
ADDRLP4 0
INDIRI4
ASGNI4
line 549
;549:	s_playersettings.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $423
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640
ADDRLP4 4
INDIRI4
ASGNI4
line 550
;550:	s_playersettings.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $426
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+4
ADDRLP4 8
INDIRI4
ASGNI4
line 551
;551:	s_playersettings.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $429
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+8
ADDRLP4 12
INDIRI4
ASGNI4
line 552
;552:	s_playersettings.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $432
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+12
ADDRLP4 16
INDIRI4
ASGNI4
line 553
;553:	s_playersettings.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $435
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+16
ADDRLP4 20
INDIRI4
ASGNI4
line 554
;554:	s_playersettings.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $438
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+20
ADDRLP4 24
INDIRI4
ASGNI4
line 555
;555:	s_playersettings.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $441
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1640+24
ADDRLP4 28
INDIRI4
ASGNI4
line 556
;556:}
LABELV $419
endproc PlayerSettings_Cache 32 4
export UI_PlayerSettingsMenu
proc UI_PlayerSettingsMenu 0 4
line 564
;557:
;558:
;559:/*
;560:=================
;561:UI_PlayerSettingsMenu
;562:=================
;563:*/
;564:void UI_PlayerSettingsMenu( void ) {
line 565
;565:	PlayerSettings_MenuInit();
ADDRGP4 PlayerSettings_MenuInit
CALLV
pop
line 566
;566:	UI_PushMenu( &s_playersettings.menu );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 567
;567:}
LABELV $442
endproc UI_PlayerSettingsMenu 0 4
bss
align 4
LABELV s_playersettings
skip 2844
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
LABELV $441
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $438
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $435
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $432
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $429
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
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
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
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
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
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
byte 1 47
byte 1 102
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $396
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
LABELV $379
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
LABELV $362
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
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $345
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
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $243
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
LABELV $229
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
LABELV $221
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $209
byte 1 103
byte 1 105
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $208
byte 1 76
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $202
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $158
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $154
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $132
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 53
byte 1 0
align 1
LABELV $98
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $97
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $96
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $95
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $94
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $93
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $92
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $91
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $90
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $89
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $88
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $86
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $85
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $84
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $83
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $82
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $81
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $80
byte 1 49
byte 1 48
byte 1 48
byte 1 0
