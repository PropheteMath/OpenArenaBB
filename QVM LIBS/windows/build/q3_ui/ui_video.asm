data
align 4
LABELV driverinfo_artlist
address $79
address $80
address $81
address $82
byte 4 0
code
proc DriverInfo_Event 4 0
file "../../../code/q3_ui/ui_video.c"
line 72
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
;25:void GraphicsOptions_MenuInit( void );
;26:
;27:/*
;28:=======================================================================
;29:
;30:DRIVER INFORMATION MENU
;31:
;32:=======================================================================
;33:*/
;34:
;35:
;36:#define DRIVERINFO_FRAMEL	"menu/art_blueish/frame2_l"
;37:#define DRIVERINFO_FRAMER	"menu/art_blueish/frame1_r"
;38:#define DRIVERINFO_BACK0	"menu/art_blueish/back_0"
;39:#define DRIVERINFO_BACK1	"menu/art_blueish/back_1"
;40:
;41:static char* driverinfo_artlist[] = 
;42:{
;43:	DRIVERINFO_FRAMEL,
;44:	DRIVERINFO_FRAMER,
;45:	DRIVERINFO_BACK0,
;46:	DRIVERINFO_BACK1,
;47:	NULL,
;48:};
;49:
;50:#define ID_DRIVERINFOBACK	100
;51:
;52:typedef struct
;53:{
;54:	menuframework_s	menu;
;55:	menutext_s		banner;
;56:	menubitmap_s	back;
;57:	menubitmap_s	framel;
;58:	menubitmap_s	framer;
;59:	char			stringbuff[1024];
;60:	char*			strings[64];
;61:	int				numstrings;
;62:} driverinfo_t;
;63:
;64:static driverinfo_t	s_driverinfo;
;65:
;66:/*
;67:=================
;68:DriverInfo_Event
;69:=================
;70:*/
;71:static void DriverInfo_Event( void* ptr, int event )
;72:{
line 73
;73:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $85
line 74
;74:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 76
;75:
;76:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $90
ADDRGP4 $87
JUMPV
line 77
;77:	{
LABELV $90
line 79
;78:		case ID_DRIVERINFOBACK:
;79:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 80
;80:			break;
LABELV $87
LABELV $88
line 82
;81:	}
;82:}
LABELV $84
endproc DriverInfo_Event 4 0
proc DriverInfo_MenuDraw 12 20
line 90
;83:
;84:/*
;85:=================
;86:DriverInfo_MenuDraw
;87:=================
;88:*/
;89:static void DriverInfo_MenuDraw( void )
;90:{
line 94
;91:	int	i;
;92:	int	y;
;93:
;94:	Menu_Draw( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 96
;95:
;96:	UI_DrawString( 320, 80, "VENDOR", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 $92
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 97
;97:	UI_DrawString( 320, 152, "PIXELFORMAT", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 $93
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 98
;98:	UI_DrawString( 320, 192, "EXTENSIONS", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $94
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 100
;99:
;100:	UI_DrawString( 320, 80+16, uis.glconfig.vendor_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 uis+56+1024
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 101
;101:	UI_DrawString( 320, 96+16, uis.glconfig.version_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 uis+56+2048
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 102
;102:	UI_DrawString( 320, 112+16, uis.glconfig.renderer_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 uis+56
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 103
;103:	UI_DrawString( 320, 152+16, va ("color(%d-bits) Z(%d-bits) stencil(%d-bits)", uis.glconfig.colorBits, uis.glconfig.depthBits, uis.glconfig.stencilBits), UI_CENTER|UI_SMALLFONT, text_color_normal );
ADDRGP4 $100
ARGP4
ADDRGP4 uis+56+11272
INDIRI4
ARGI4
ADDRGP4 uis+56+11276
INDIRI4
ARGI4
ADDRGP4 uis+56+11280
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 168
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 106
;104:
;105:	// double column
;106:	y = 192+16;
ADDRLP4 4
CNSTI4 208
ASGNI4
line 107
;107:	for (i=0; i<s_driverinfo.numstrings/2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 108
;108:		UI_DrawString( 320-4, y, s_driverinfo.strings[i*2], UI_RIGHT|UI_SMALLFONT, text_color_normal );
CNSTI4 316
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 109
;109:		UI_DrawString( 320+4, y, s_driverinfo.strings[i*2+1], UI_LEFT|UI_SMALLFONT, text_color_normal );
CNSTI4 324
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776+4
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 110
;110:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 111
;111:	}
LABELV $108
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
ADDRGP4 s_driverinfo+2032
INDIRI4
CNSTI4 2
DIVI4
LTI4 $107
line 113
;112:
;113:	if (s_driverinfo.numstrings & 1)
ADDRGP4 s_driverinfo+2032
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $115
line 114
;114:		UI_DrawString( 320, y, s_driverinfo.strings[s_driverinfo.numstrings-1], UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_driverinfo+2032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776-4
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $115
line 115
;115:}
LABELV $91
endproc DriverInfo_MenuDraw 12 20
export DriverInfo_Cache
proc DriverInfo_Cache 4 4
line 123
;116:
;117:/*
;118:=================
;119:DriverInfo_Cache
;120:=================
;121:*/
;122:void DriverInfo_Cache( void )
;123:{
line 127
;124:	int	i;
;125:
;126:	// touch all our pics
;127:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $122
line 128
;128:	{
line 129
;129:		if (!driverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $126
line 130
;130:			break;
ADDRGP4 $124
JUMPV
LABELV $126
line 131
;131:		trap_R_RegisterShaderNoMip(driverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 132
;132:	}
LABELV $123
line 127
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $124
line 133
;133:}
LABELV $121
endproc DriverInfo_Cache 4 4
proc UI_DriverInfo_Menu 36 12
line 141
;134:
;135:/*
;136:=================
;137:UI_DriverInfo_Menu
;138:=================
;139:*/
;140:static void UI_DriverInfo_Menu( void )
;141:{
line 147
;142:	char*	eptr;
;143:	int		i;
;144:	int		len;
;145:
;146:	// zero set all our globals
;147:	memset( &s_driverinfo, 0 ,sizeof(driverinfo_t) );
ADDRGP4 s_driverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2036
ARGI4
ADDRGP4 memset
CALLP4
pop
line 149
;148:
;149:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 151
;150:
;151:	s_driverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_driverinfo+408
CNSTI4 1
ASGNI4
line 152
;152:	s_driverinfo.menu.draw       = DriverInfo_MenuDraw;
ADDRGP4 s_driverinfo+396
ADDRGP4 DriverInfo_MenuDraw
ASGNP4
line 154
;153:
;154:	s_driverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_driverinfo+416
CNSTI4 10
ASGNI4
line 155
;155:	s_driverinfo.banner.generic.x	  = 320;
ADDRGP4 s_driverinfo+416+12
CNSTI4 320
ASGNI4
line 156
;156:	s_driverinfo.banner.generic.y	  = 16;
ADDRGP4 s_driverinfo+416+16
CNSTI4 16
ASGNI4
line 157
;157:	s_driverinfo.banner.string		  = "DRIVER INFO";
ADDRGP4 s_driverinfo+416+60
ADDRGP4 $138
ASGNP4
line 158
;158:	s_driverinfo.banner.color	      = color_white;
ADDRGP4 s_driverinfo+416+68
ADDRGP4 color_white
ASGNP4
line 159
;159:	s_driverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_driverinfo+416+64
CNSTI4 1
ASGNI4
line 161
;160:
;161:	s_driverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+576
CNSTI4 6
ASGNI4
line 162
;162:	s_driverinfo.framel.generic.name  = DRIVERINFO_FRAMEL;
ADDRGP4 s_driverinfo+576+4
ADDRGP4 $79
ASGNP4
line 163
;163:	s_driverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+576+44
CNSTU4 16384
ASGNU4
line 164
;164:	s_driverinfo.framel.generic.x	  = 0;
ADDRGP4 s_driverinfo+576+12
CNSTI4 0
ASGNI4
line 165
;165:	s_driverinfo.framel.generic.y	  = 78;
ADDRGP4 s_driverinfo+576+16
CNSTI4 78
ASGNI4
line 166
;166:	s_driverinfo.framel.width  	      = 256;
ADDRGP4 s_driverinfo+576+76
CNSTI4 256
ASGNI4
line 167
;167:	s_driverinfo.framel.height  	  = 329;
ADDRGP4 s_driverinfo+576+80
CNSTI4 329
ASGNI4
line 169
;168:
;169:	s_driverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+664
CNSTI4 6
ASGNI4
line 170
;170:	s_driverinfo.framer.generic.name  = DRIVERINFO_FRAMER;
ADDRGP4 s_driverinfo+664+4
ADDRGP4 $80
ASGNP4
line 171
;171:	s_driverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+664+44
CNSTU4 16384
ASGNU4
line 172
;172:	s_driverinfo.framer.generic.x	  = 376;
ADDRGP4 s_driverinfo+664+12
CNSTI4 376
ASGNI4
line 173
;173:	s_driverinfo.framer.generic.y	  = 76;
ADDRGP4 s_driverinfo+664+16
CNSTI4 76
ASGNI4
line 174
;174:	s_driverinfo.framer.width  	      = 256;
ADDRGP4 s_driverinfo+664+76
CNSTI4 256
ASGNI4
line 175
;175:	s_driverinfo.framer.height  	  = 334;
ADDRGP4 s_driverinfo+664+80
CNSTI4 334
ASGNI4
line 177
;176:
;177:	s_driverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+488
CNSTI4 6
ASGNI4
line 178
;178:	s_driverinfo.back.generic.name     = DRIVERINFO_BACK0;
ADDRGP4 s_driverinfo+488+4
ADDRGP4 $81
ASGNP4
line 179
;179:	s_driverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_driverinfo+488+44
CNSTU4 260
ASGNU4
line 180
;180:	s_driverinfo.back.generic.callback = DriverInfo_Event;
ADDRGP4 s_driverinfo+488+48
ADDRGP4 DriverInfo_Event
ASGNP4
line 181
;181:	s_driverinfo.back.generic.id	   = ID_DRIVERINFOBACK;
ADDRGP4 s_driverinfo+488+8
CNSTI4 100
ASGNI4
line 182
;182:	s_driverinfo.back.generic.x		   = 0;
ADDRGP4 s_driverinfo+488+12
CNSTI4 0
ASGNI4
line 183
;183:	s_driverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_driverinfo+488+16
CNSTI4 416
ASGNI4
line 184
;184:	s_driverinfo.back.width  		   = 128;
ADDRGP4 s_driverinfo+488+76
CNSTI4 128
ASGNI4
line 185
;185:	s_driverinfo.back.height  		   = 64;
ADDRGP4 s_driverinfo+488+80
CNSTI4 64
ASGNI4
line 186
;186:	s_driverinfo.back.focuspic         = DRIVERINFO_BACK1;
ADDRGP4 s_driverinfo+488+60
ADDRGP4 $82
ASGNP4
line 192
;187:
;188:  // TTimo: overflow with particularly long GL extensions (such as the gf3)
;189:  // https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;190:  // NOTE: could have pushed the size of stringbuff, but the list is already out of the screen
;191:  // (no matter what your resolution)
;192:  Q_strncpyz(s_driverinfo.stringbuff, uis.glconfig.extensions_string, 1024);
ADDRGP4 s_driverinfo+752
ARGP4
ADDRGP4 uis+56+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 195
;193:
;194:	// build null terminated extension strings
;195:	eptr = s_driverinfo.stringbuff;
ADDRLP4 0
ADDRGP4 s_driverinfo+752
ASGNP4
ADDRGP4 $193
JUMPV
line 197
;196:	while ( s_driverinfo.numstrings<40 && *eptr )
;197:	{
LABELV $196
line 199
;198:		while ( *eptr && *eptr == ' ' )
;199:			*eptr++ = '\0';
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $197
line 198
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $199
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $196
LABELV $199
line 202
;200:
;201:		// track start of valid string
;202:		if (*eptr && *eptr != ' ')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $205
ADDRLP4 20
INDIRI4
CNSTI4 32
EQI4 $205
line 203
;203:			s_driverinfo.strings[s_driverinfo.numstrings++] = eptr;
ADDRLP4 28
ADDRGP4 s_driverinfo+2032
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $205
JUMPV
LABELV $204
line 206
;204:
;205:		while ( *eptr && *eptr != ' ' )
;206:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $205
line 205
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 32
INDIRI4
CNSTI4 32
NEI4 $204
LABELV $207
line 207
;207:	}
LABELV $193
line 196
ADDRGP4 s_driverinfo+2032
INDIRI4
CNSTI4 40
GEI4 $208
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $197
LABELV $208
line 210
;208:
;209:	// safety length strings for display
;210:	for (i=0; i<s_driverinfo.numstrings; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $209
line 211
;211:		len = strlen(s_driverinfo.strings[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 212
;212:		if (len > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $215
line 213
;213:			s_driverinfo.strings[i][len-1] = '>';
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776
ADDP4
INDIRP4
ADDP4
CNSTI1 62
ASGNI1
line 214
;214:			s_driverinfo.strings[i][len]   = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1776
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 215
;215:		}
LABELV $215
line 216
;216:	}
LABELV $210
line 210
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $212
ADDRLP4 4
INDIRI4
ADDRGP4 s_driverinfo+2032
INDIRI4
LTI4 $209
line 218
;217:
;218:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.banner );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 219
;219:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framel );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 220
;220:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framer );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 221
;221:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.back );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 223
;222:
;223:	UI_PushMenu( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 224
;224:}
LABELV $128
endproc UI_DriverInfo_Menu 36 12
data
align 4
LABELV s_ivo_templates
byte 4 6
byte 4 1
byte 4 3
byte 4 0
byte 4 0
byte 4 0
byte 4 2
byte 4 2
byte 4 1
byte 4 0
byte 4 0
byte 4 1
byte 4 4
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
align 4
LABELV builtinResolutions
address $225
address $226
address $227
address $228
address $229
address $230
address $231
address $232
address $233
address $234
address $235
address $236
byte 4 0
align 4
LABELV knownRatios
address $237
address $238
address $239
address $240
address $241
address $242
address $243
address $244
address $245
address $246
address $247
address $248
address $249
address $250
byte 4 0
byte 4 0
align 4
LABELV resolutions
address builtinResolutions
align 4
LABELV resolutionsDetected
byte 4 0
code
proc GraphicsOptions_FindBuiltinResolution 12 8
line 375
;225:
;226:/*
;227:=======================================================================
;228:
;229:GRAPHICS OPTIONS MENU
;230:
;231:=======================================================================
;232:*/
;233:
;234:#define GRAPHICSOPTIONS_FRAMEL	"menu/art_blueish/frame2_l"
;235:#define GRAPHICSOPTIONS_FRAMER	"menu/art_blueish/frame1_r"
;236:#define GRAPHICSOPTIONS_BACK0	"menu/art_blueish/back_0"
;237:#define GRAPHICSOPTIONS_BACK1	"menu/art_blueish/back_1"
;238:#define GRAPHICSOPTIONS_ACCEPT0	"menu/art_blueish/accept_0"
;239:#define GRAPHICSOPTIONS_ACCEPT1	"menu/art_blueish/accept_1"
;240:
;241:#define ID_BACK2		101
;242:#define ID_FULLSCREEN	102
;243:#define ID_LIST			103
;244:#define ID_MODE			104
;245:#define ID_DRIVERINFO	105
;246:#define ID_GRAPHICS		106
;247:#define ID_DISPLAY		107
;248:#define ID_SOUND		108
;249:#define ID_NETWORK		109
;250:#define ID_RATIO                110
;251:
;252:typedef struct {
;253:	menuframework_s	menu;
;254:
;255:	menutext_s		banner;
;256:	menubitmap_s	framel;
;257:	menubitmap_s	framer;
;258:
;259:	menutext_s		graphics;
;260:	menutext_s		display;
;261:	menutext_s		sound;
;262:	menutext_s		network;
;263:
;264:	menulist_s		list;
;265:        menulist_s              ratio;
;266:	menulist_s		mode;
;267:	menulist_s		driver;
;268:	menuslider_s	tq;
;269:	menulist_s  	fs;
;270:	menulist_s  	lighting;
;271:        menulist_s  	flares;
;272:        menulist_s  	bloom;
;273:	menulist_s  	allow_extensions;
;274:	menulist_s  	texturebits;
;275:	menulist_s  	geometry;
;276:	menulist_s  	filter;
;277:        menulist_s  	aniso;
;278:	menutext_s		driverinfo;
;279:
;280:	menubitmap_s	apply;
;281:	menubitmap_s	back;
;282:} graphicsoptions_t;
;283:
;284:typedef struct
;285:{
;286:	int mode;
;287:	qboolean fullscreen;
;288:	int tq;
;289:	int lighting;
;290:        qboolean flares;
;291:        qboolean bloom;
;292:	int texturebits;
;293:	int geometry;
;294:	int filter;
;295:        int aniso;
;296:	int driver;
;297:	qboolean extensions;
;298:} InitialVideoOptions_s;
;299:
;300:static InitialVideoOptions_s	s_ivo;
;301:static graphicsoptions_t		s_graphicsoptions;	
;302:
;303:static InitialVideoOptions_s s_ivo_templates[] =
;304:{
;305:	{
;306:		6, qtrue, 3, 0, qfalse,qfalse, 2, 2, 1, 0, 0, qtrue
;307:	},
;308:	{
;309:		4, qtrue, 2, 0, qfalse,qfalse, 2, 1, 1, 0, 0, qtrue	// JDC: this was tq 3
;310:	},
;311:	{
;312:		3, qtrue, 2, 0, qfalse,qfalse, 0, 1, 0, 0, 0, qtrue
;313:	},
;314:	{
;315:		2, qtrue, 1, 0, qfalse,qfalse, 0, 0, 0, 0, 0, qtrue
;316:	},
;317:	{
;318:		2, qtrue, 1, 1, qfalse,qfalse, 0, 0, 0, 0, 0, qtrue
;319:	},
;320:	{
;321:		3, qtrue, 1, 0, qfalse,qfalse, 0, 1, 0, 0, 0, qtrue
;322:	}
;323:};
;324:
;325:#define NUM_IVO_TEMPLATES ( sizeof( s_ivo_templates ) / sizeof( s_ivo_templates[0] ) )
;326:
;327:static const char *builtinResolutions[ ] =
;328:{
;329:	"320x240",
;330:	"400x300",
;331:	"512x384",
;332:	"640x480",
;333:	"800x600",
;334:	"960x720",
;335:	"1024x768",
;336:	"1152x864",
;337:	"1280x1024",
;338:	"1600x1200",
;339:	"2048x1536",
;340:	"856x480",
;341:	NULL
;342:};
;343:
;344:static const char *knownRatios[ ][2] =
;345:{
;346:        { "1.25:1", "5:4"   },
;347:        { "1.33:1", "4:3"   },
;348:        { "1.50:1", "3:2"   },
;349:        { "1.56:1", "14:9"  },
;350:        { "1.60:1", "16:10" },
;351:        { "1.67:1", "5:3"   },
;352:        { "1.78:1", "16:9"  },
;353:        { NULL    , NULL    }
;354:};
;355:
;356:#define MAX_RESOLUTIONS 32
;357:
;358:static const char* ratios[ MAX_RESOLUTIONS ];
;359:static char ratioBuf[ MAX_RESOLUTIONS ][ 8 ];
;360:static int ratioToRes[ MAX_RESOLUTIONS ];
;361:static int resToRatio[ MAX_RESOLUTIONS ];
;362:
;363:static char resbuf[ MAX_STRING_CHARS ];
;364:static const char* detectedResolutions[ MAX_RESOLUTIONS ];
;365:
;366:static const char** resolutions = builtinResolutions;
;367:static qboolean resolutionsDetected = qfalse;
;368:
;369:/*
;370:=================
;371:GraphicsOptions_FindBuiltinResolution
;372:=================
;373:*/
;374:static int GraphicsOptions_FindBuiltinResolution( int mode )
;375:{
line 378
;376:	int i;
;377:
;378:	if( !resolutionsDetected )
ADDRGP4 resolutionsDetected
INDIRI4
CNSTI4 0
NEI4 $252
line 379
;379:		return mode;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $251
JUMPV
LABELV $252
line 381
;380:
;381:	if( mode < 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $254
line 382
;382:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $251
JUMPV
LABELV $254
line 384
;383:
;384:	for( i = 0; builtinResolutions[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $256
line 385
;385:	{
line 386
;386:		if( !Q_stricmp( builtinResolutions[ i ], detectedResolutions[ mode ] ) )
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 builtinResolutions
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $260
line 387
;387:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $251
JUMPV
LABELV $260
line 388
;388:	}
LABELV $257
line 384
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $259
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 builtinResolutions
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 390
;389:
;390:	return -1;
CNSTI4 -1
RETI4
LABELV $251
endproc GraphicsOptions_FindBuiltinResolution 12 8
proc GraphicsOptions_FindDetectedResolution 12 8
line 399
;391:}
;392:
;393:/*
;394:=================
;395:GraphicsOptions_FindDetectedResolution
;396:=================
;397:*/
;398:static int GraphicsOptions_FindDetectedResolution( int mode )
;399:{
line 402
;400:	int i;
;401:
;402:	if( !resolutionsDetected )
ADDRGP4 resolutionsDetected
INDIRI4
CNSTI4 0
NEI4 $263
line 403
;403:		return mode;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $263
line 405
;404:
;405:	if( mode < 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $265
line 406
;406:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $262
JUMPV
LABELV $265
line 408
;407:
;408:	for( i = 0; detectedResolutions[ i ]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $267
line 409
;409:	{
line 410
;410:		if( !Q_stricmp( builtinResolutions[ mode ], detectedResolutions[ i ] ) )
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 builtinResolutions
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $271
line 411
;411:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $262
JUMPV
LABELV $271
line 412
;412:	}
LABELV $268
line 408
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $270
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $267
line 414
;413:
;414:	return -1;
CNSTI4 -1
RETI4
LABELV $262
endproc GraphicsOptions_FindDetectedResolution 12 8
proc GraphicsOptions_GetAspectRatios 48 16
line 423
;415:}
;416:
;417:/*
;418:=================
;419:GraphicsOptions_GetAspectRatios
;420:=================
;421:*/
;422:static void GraphicsOptions_GetAspectRatios( void )
;423:{
line 427
;424:    int i, r;
;425:
;426:    // build ratio list from resolutions
;427:    for( r = 0; resolutions[r]; r++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $277
JUMPV
LABELV $274
line 428
;428:    {
line 434
;429:        int w, h;
;430:        char *x;
;431:        char str[ sizeof(ratioBuf[0]) ];
;432:
;433:        // calculate resolution's aspect ratio
;434:        x = strchr( resolutions[r], 'x' )+1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRLP4 28
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 437
;435:        
;436:        
;437:        Q_strncpyz( str, resolutions[r], x-resolutions[r] );
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 438
;438:        w = atoi( str );
ADDRLP4 8
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
ASGNI4
line 439
;439:        h = atoi( x );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 440
;440:        Com_sprintf( str, sizeof(str), "%.2f:1", (float)w / (float)h );
ADDRLP4 8
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 $278
ARGP4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CVIF4 4
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 443
;441:        
;442:        // rename common ratios ("1.33:1" -> "4:3")
;443:        for( i = 0; knownRatios[i][0]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $279
line 444
;444:            if( !Q_stricmp( str, knownRatios[i][0] ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $283
line 445
;445:                Q_strncpyz( str, knownRatios[i][1], sizeof( str ) );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios+4
ADDP4
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 446
;446:                break;
ADDRGP4 $281
JUMPV
LABELV $283
line 448
;447:            }
;448:        }
LABELV $280
line 443
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $282
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
LABELV $281
line 452
;449:
;450:        // add ratio to list if it is new
;451:        // establish res/ratio relationship
;452:        for( i = 0; ratioBuf[i][0]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 453
;453:        {
line 454
;454:            if( !Q_stricmp( str, ratioBuf[i] ) )
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $290
line 455
;455:                break;
ADDRGP4 $288
JUMPV
LABELV $290
line 456
;456:        }
LABELV $287
line 452
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $286
LABELV $288
line 457
;457:        if( !ratioBuf[i][0] )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $292
line 458
;458:        {
line 459
;459:            Q_strncpyz( ratioBuf[i], str, sizeof(ratioBuf[i]) );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 460
;460:            ratioToRes[i] = r;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratioToRes
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 461
;461:        }
LABELV $292
line 462
;462:        ratios[r] = ratioBuf[r];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratios
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ASGNP4
line 463
;463:        resToRatio[r] = i;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 464
;464:    }
LABELV $275
line 427
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $277
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $274
line 465
;465:    ratios[r] = NULL;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratios
ADDP4
CNSTP4 0
ASGNP4
line 466
;466:}
LABELV $273
endproc GraphicsOptions_GetAspectRatios 48 16
proc GraphicsOptions_GetInitialVideo 0 0
line 474
;467:
;468:/*
;469:=================
;470:GraphicsOptions_GetInitialVideo
;471:=================
;472:*/
;473:static void GraphicsOptions_GetInitialVideo( void )
;474:{
line 475
;475:	s_ivo.driver      = s_graphicsoptions.driver.curvalue;
ADDRGP4 s_ivo+40
ADDRGP4 s_graphicsoptions+1240+64
INDIRI4
ASGNI4
line 476
;476:	s_ivo.mode        = s_graphicsoptions.mode.curvalue;
ADDRGP4 s_ivo
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
ASGNI4
line 477
;477:	s_ivo.fullscreen  = s_graphicsoptions.fs.curvalue;
ADDRGP4 s_ivo+4
ADDRGP4 s_graphicsoptions+1412+64
INDIRI4
ASGNI4
line 478
;478:	s_ivo.extensions  = s_graphicsoptions.allow_extensions.curvalue;
ADDRGP4 s_ivo+44
ADDRGP4 s_graphicsoptions+1796+64
INDIRI4
ASGNI4
line 479
;479:	s_ivo.tq          = s_graphicsoptions.tq.curvalue;
ADDRGP4 s_ivo+8
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
CVFI4 4
ASGNI4
line 480
;480:	s_ivo.lighting    = s_graphicsoptions.lighting.curvalue;
ADDRGP4 s_ivo+12
ADDRGP4 s_graphicsoptions+1508+64
INDIRI4
ASGNI4
line 481
;481:        s_ivo.flares      = s_graphicsoptions.flares.curvalue;
ADDRGP4 s_ivo+16
ADDRGP4 s_graphicsoptions+1604+64
INDIRI4
ASGNI4
line 482
;482:        s_ivo.bloom      = s_graphicsoptions.bloom.curvalue;
ADDRGP4 s_ivo+20
ADDRGP4 s_graphicsoptions+1700+64
INDIRI4
ASGNI4
line 483
;483:	s_ivo.geometry    = s_graphicsoptions.geometry.curvalue;
ADDRGP4 s_ivo+28
ADDRGP4 s_graphicsoptions+1988+64
INDIRI4
ASGNI4
line 484
;484:	s_ivo.filter      = s_graphicsoptions.filter.curvalue;
ADDRGP4 s_ivo+32
ADDRGP4 s_graphicsoptions+2084+64
INDIRI4
ASGNI4
line 485
;485:        s_ivo.aniso      = s_graphicsoptions.aniso.curvalue;
ADDRGP4 s_ivo+36
ADDRGP4 s_graphicsoptions+2180+64
INDIRI4
ASGNI4
line 486
;486:	s_ivo.texturebits = s_graphicsoptions.texturebits.curvalue;
ADDRGP4 s_ivo+24
ADDRGP4 s_graphicsoptions+1892+64
INDIRI4
ASGNI4
line 487
;487:}
LABELV $294
endproc GraphicsOptions_GetInitialVideo 0 0
proc GraphicsOptions_GetResolutions 24 12
line 495
;488:
;489:/*
;490:=================
;491:GraphicsOptions_GetResolutions
;492:=================
;493:*/
;494:static void GraphicsOptions_GetResolutions( void )
;495:{
line 496
;496:    Q_strncpyz(resbuf, UI_Cvar_VariableString("r_availableModes"), sizeof(resbuf));
ADDRGP4 $331
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 resbuf
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 497
;497:    if(*resbuf)
ADDRGP4 resbuf
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $332
line 498
;498:    {
line 499
;499:        char* s = resbuf;
ADDRLP4 4
ADDRGP4 resbuf
ASGNP4
line 500
;500:        unsigned int i = 0;
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRGP4 $335
JUMPV
LABELV $334
line 502
;501:        while( s && i < sizeof(detectedResolutions)/sizeof(detectedResolutions[0])-1)
;502:        {
line 503
;503:            detectedResolutions[i++] = s;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
ADDRLP4 8
ADDRLP4 12
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTI4 2
LSHU4
ADDRGP4 detectedResolutions
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 504
;504:            s = strchr(s, ' ');
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 16
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 505
;505:            if( s )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $337
line 506
;506:                *s++ = '\0';
ADDRLP4 20
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI1 0
ASGNI1
LABELV $337
line 507
;507:        }
LABELV $335
line 501
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
ADDRLP4 8
INDIRU4
CNSTU4 31
LTU4 $334
LABELV $339
line 508
;508:        detectedResolutions[ i ] = NULL;
ADDRLP4 8
INDIRU4
CNSTI4 2
LSHU4
ADDRGP4 detectedResolutions
ADDP4
CNSTP4 0
ASGNP4
line 510
;509:
;510:        if( i > 0 )
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $340
line 511
;511:        {
line 512
;512:            resolutions = detectedResolutions;
ADDRGP4 resolutions
ADDRGP4 detectedResolutions
ASGNP4
line 513
;513:            resolutionsDetected = qtrue;
ADDRGP4 resolutionsDetected
CNSTI4 1
ASGNI4
line 514
;514:        }
LABELV $340
line 515
;515:    }
LABELV $332
line 516
;516:}
LABELV $330
endproc GraphicsOptions_GetResolutions 24 12
proc GraphicsOptions_CheckConfig 8 4
line 524
;517:
;518:/*
;519:=================
;520:GraphicsOptions_CheckConfig
;521:=================
;522:*/
;523:static void GraphicsOptions_CheckConfig( void )
;524:{
line 527
;525:	int i;
;526:
;527:	for ( i = 0; i < NUM_IVO_TEMPLATES-1; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 528
;528:	{
line 529
;529:		if ( s_ivo_templates[i].driver != s_graphicsoptions.driver.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+40
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1240+64
INDIRI4
EQI4 $347
line 530
;530:			continue;
ADDRGP4 $344
JUMPV
LABELV $347
line 531
;531:		if ( GraphicsOptions_FindDetectedResolution(s_ivo_templates[i].mode) != s_graphicsoptions.mode.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 GraphicsOptions_FindDetectedResolution
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
EQI4 $352
line 532
;532:			continue;
ADDRGP4 $344
JUMPV
LABELV $352
line 533
;533:		if ( s_ivo_templates[i].fullscreen != s_graphicsoptions.fs.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+4
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1412+64
INDIRI4
EQI4 $356
line 534
;534:			continue;
ADDRGP4 $344
JUMPV
LABELV $356
line 535
;535:		if ( s_ivo_templates[i].tq != s_graphicsoptions.tq.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
EQF4 $361
line 536
;536:			continue;
ADDRGP4 $344
JUMPV
LABELV $361
line 537
;537:		if ( s_ivo_templates[i].lighting != s_graphicsoptions.lighting.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+12
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1508+64
INDIRI4
EQI4 $366
line 538
;538:			continue;
ADDRGP4 $344
JUMPV
LABELV $366
line 539
;539:                if ( s_ivo_templates[i].flares != s_graphicsoptions.flares.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+16
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1604+64
INDIRI4
EQI4 $371
line 540
;540:			continue;
ADDRGP4 $344
JUMPV
LABELV $371
line 541
;541:                if ( s_ivo_templates[i].bloom != s_graphicsoptions.bloom.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+20
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1700+64
INDIRI4
EQI4 $376
line 542
;542:			continue;
ADDRGP4 $344
JUMPV
LABELV $376
line 543
;543:		if ( s_ivo_templates[i].geometry != s_graphicsoptions.geometry.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+28
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1988+64
INDIRI4
EQI4 $381
line 544
;544:			continue;
ADDRGP4 $344
JUMPV
LABELV $381
line 545
;545:		if ( s_ivo_templates[i].filter != s_graphicsoptions.filter.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+32
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2084+64
INDIRI4
EQI4 $386
line 546
;546:			continue;
ADDRGP4 $344
JUMPV
LABELV $386
line 547
;547:                if ( s_ivo_templates[i].aniso != s_graphicsoptions.aniso.curvalue )
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+36
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2180+64
INDIRI4
EQI4 $391
line 548
;548:			continue;
ADDRGP4 $344
JUMPV
LABELV $391
line 551
;549://		if ( s_ivo_templates[i].texturebits != s_graphicsoptions.texturebits.curvalue )
;550://			continue;
;551:		s_graphicsoptions.list.curvalue = i;
ADDRGP4 s_graphicsoptions+952+64
ADDRLP4 0
INDIRI4
ASGNI4
line 552
;552:		return;
ADDRGP4 $342
JUMPV
LABELV $344
line 527
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $346
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 5
LTU4 $343
line 556
;553:	}
;554:
;555:	// return 'Custom' ivo template
;556:	s_graphicsoptions.list.curvalue = NUM_IVO_TEMPLATES - 1;
ADDRGP4 s_graphicsoptions+952+64
CNSTI4 5
ASGNI4
line 557
;557:}
LABELV $342
endproc GraphicsOptions_CheckConfig 8 4
proc GraphicsOptions_UpdateMenuItems 8 0
line 565
;558:
;559:/*
;560:=================
;561:GraphicsOptions_UpdateMenuItems
;562:=================
;563:*/
;564:static void GraphicsOptions_UpdateMenuItems( void )
;565:{
line 566
;566:	if ( s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1240+64
INDIRI4
CNSTI4 1
NEI4 $401
line 567
;567:	{
line 568
;568:		s_graphicsoptions.fs.curvalue = 1;
ADDRGP4 s_graphicsoptions+1412+64
CNSTI4 1
ASGNI4
line 569
;569:		s_graphicsoptions.fs.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1412+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 570
;570:	}
ADDRGP4 $402
JUMPV
LABELV $401
line 572
;571:	else
;572:	{
line 573
;573:		s_graphicsoptions.fs.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1412+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 574
;574:	}
LABELV $402
line 576
;575:
;576:	if ( s_graphicsoptions.allow_extensions.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1796+64
INDIRI4
CNSTI4 0
NEI4 $411
line 577
;577:	{
line 578
;578:		if ( s_graphicsoptions.texturebits.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1892+64
INDIRI4
CNSTI4 0
NEI4 $415
line 579
;579:		{
line 580
;580:			s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1892+64
CNSTI4 1
ASGNI4
line 581
;581:		}
LABELV $415
line 582
;582:	}
LABELV $411
line 584
;583:
;584:	s_graphicsoptions.apply.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 586
;585:
;586:	if ( s_ivo.mode != s_graphicsoptions.mode.curvalue )
ADDRGP4 s_ivo
INDIRI4
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
EQI4 $423
line 587
;587:	{
line 588
;588:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 589
;589:	}
LABELV $423
line 590
;590:	if ( s_ivo.fullscreen != s_graphicsoptions.fs.curvalue )
ADDRGP4 s_ivo+4
INDIRI4
ADDRGP4 s_graphicsoptions+1412+64
INDIRI4
EQI4 $429
line 591
;591:	{
line 592
;592:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 593
;593:	}
LABELV $429
line 594
;594:	if ( s_ivo.extensions != s_graphicsoptions.allow_extensions.curvalue )
ADDRGP4 s_ivo+44
INDIRI4
ADDRGP4 s_graphicsoptions+1796+64
INDIRI4
EQI4 $436
line 595
;595:	{
line 596
;596:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 597
;597:	}
LABELV $436
line 598
;598:	if ( s_ivo.tq != s_graphicsoptions.tq.curvalue )
ADDRGP4 s_ivo+8
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
EQF4 $443
line 599
;599:	{
line 600
;600:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 601
;601:	}
LABELV $443
line 602
;602:	if ( s_ivo.lighting != s_graphicsoptions.lighting.curvalue )
ADDRGP4 s_ivo+12
INDIRI4
ADDRGP4 s_graphicsoptions+1508+64
INDIRI4
EQI4 $450
line 603
;603:	{
line 604
;604:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 605
;605:	}
LABELV $450
line 606
;606:        if ( s_ivo.flares != s_graphicsoptions.flares.curvalue )
ADDRGP4 s_ivo+16
INDIRI4
ADDRGP4 s_graphicsoptions+1604+64
INDIRI4
EQI4 $457
line 607
;607:	{
line 608
;608:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 609
;609:	}
LABELV $457
line 610
;610:        if ( s_ivo.bloom != s_graphicsoptions.bloom.curvalue )
ADDRGP4 s_ivo+20
INDIRI4
ADDRGP4 s_graphicsoptions+1700+64
INDIRI4
EQI4 $464
line 611
;611:	{
line 612
;612:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 613
;613:	}
LABELV $464
line 614
;614:	if ( s_ivo.driver != s_graphicsoptions.driver.curvalue )
ADDRGP4 s_ivo+40
INDIRI4
ADDRGP4 s_graphicsoptions+1240+64
INDIRI4
EQI4 $471
line 615
;615:	{
line 616
;616:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 617
;617:	}
LABELV $471
line 618
;618:	if ( s_ivo.texturebits != s_graphicsoptions.texturebits.curvalue )
ADDRGP4 s_ivo+24
INDIRI4
ADDRGP4 s_graphicsoptions+1892+64
INDIRI4
EQI4 $478
line 619
;619:	{
line 620
;620:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 621
;621:	}
LABELV $478
line 622
;622:	if ( s_ivo.geometry != s_graphicsoptions.geometry.curvalue )
ADDRGP4 s_ivo+28
INDIRI4
ADDRGP4 s_graphicsoptions+1988+64
INDIRI4
EQI4 $485
line 623
;623:	{
line 624
;624:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 625
;625:	}
LABELV $485
line 626
;626:	if ( s_ivo.filter != s_graphicsoptions.filter.curvalue )
ADDRGP4 s_ivo+32
INDIRI4
ADDRGP4 s_graphicsoptions+2084+64
INDIRI4
EQI4 $492
line 627
;627:	{
line 628
;628:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 629
;629:	}
LABELV $492
line 630
;630:        if ( s_ivo.aniso != s_graphicsoptions.aniso.curvalue )
ADDRGP4 s_ivo+36
INDIRI4
ADDRGP4 s_graphicsoptions+2180+64
INDIRI4
EQI4 $499
line 631
;631:	{
line 632
;632:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+2348+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 633
;633:	}
LABELV $499
line 635
;634:
;635:	GraphicsOptions_CheckConfig();
ADDRGP4 GraphicsOptions_CheckConfig
CALLV
pop
line 636
;636:}	
LABELV $400
endproc GraphicsOptions_UpdateMenuItems 8 0
proc GraphicsOptions_ApplyChanges 52 12
line 644
;637:
;638:/*
;639:=================
;640:GraphicsOptions_ApplyChanges
;641:=================
;642:*/
;643:static void GraphicsOptions_ApplyChanges( void *unused, int notification )
;644:{
line 645
;645:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $507
line 646
;646:		return;
ADDRGP4 $506
JUMPV
LABELV $507
line 648
;647:
;648:	switch ( s_graphicsoptions.texturebits.curvalue  )
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1892+64
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $515
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $516
ADDRGP4 $509
JUMPV
line 649
;649:	{
LABELV $513
line 651
;650:	case 0:
;651:		trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $514
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 652
;652:		break;
ADDRGP4 $510
JUMPV
LABELV $515
line 654
;653:	case 1:
;654:		trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $514
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 655
;655:		break;
ADDRGP4 $510
JUMPV
LABELV $516
line 657
;656:	case 2:
;657:		trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $514
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 658
;658:		break;
LABELV $509
LABELV $510
line 660
;659:	}
;660:	trap_Cvar_SetValue( "r_picmip", 3 - s_graphicsoptions.tq.curvalue );
ADDRGP4 $517
ARGP4
CNSTF4 1077936128
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
SUBF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 661
;661:	trap_Cvar_SetValue( "r_allowExtensions", s_graphicsoptions.allow_extensions.curvalue );
ADDRGP4 $520
ARGP4
ADDRGP4 s_graphicsoptions+1796+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 663
;662:
;663:	if( resolutionsDetected )
ADDRGP4 resolutionsDetected
INDIRI4
CNSTI4 0
EQI4 $523
line 664
;664:	{
line 667
;665:		// search for builtin mode that matches the detected mode
;666:		int mode;
;667:		if ( s_graphicsoptions.mode.curvalue == -1
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 -1
EQI4 $531
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CVIU4 4
CNSTU4 32
LTU4 $525
LABELV $531
line 669
;668:			|| s_graphicsoptions.mode.curvalue >= sizeof(detectedResolutions)/sizeof(detectedResolutions[0]) )
;669:			s_graphicsoptions.mode.curvalue = 0;
ADDRGP4 s_graphicsoptions+1144+64
CNSTI4 0
ASGNI4
LABELV $525
line 671
;670:
;671:		mode = GraphicsOptions_FindBuiltinResolution( s_graphicsoptions.mode.curvalue );
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 GraphicsOptions_FindBuiltinResolution
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 672
;672:		if( mode == -1 )
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $536
line 673
;673:		{
line 675
;674:			char w[ 16 ], h[ 16 ];
;675:			Q_strncpyz( w, detectedResolutions[ s_graphicsoptions.mode.curvalue ], sizeof( w ) );
ADDRLP4 12
ARGP4
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 676
;676:			*strchr( w, 'x' ) = 0;
ADDRLP4 12
ARGP4
CNSTI4 120
ARGI4
ADDRLP4 44
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI1 0
ASGNI1
line 677
;677:			Q_strncpyz( h,
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRLP4 48
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 28
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 679
;678:					strchr( detectedResolutions[ s_graphicsoptions.mode.curvalue ], 'x' ) + 1, sizeof( h ) );
;679:			trap_Cvar_Set( "r_customwidth", w );
ADDRGP4 $542
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 680
;680:			trap_Cvar_Set( "r_customheight", h );
ADDRGP4 $543
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 681
;681:		}
LABELV $536
line 683
;682:
;683:		trap_Cvar_SetValue( "r_mode", mode );
ADDRGP4 $544
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 684
;684:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 686
;685:	else
;686:		trap_Cvar_SetValue( "r_mode", s_graphicsoptions.mode.curvalue );
ADDRGP4 $544
ARGP4
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $524
line 688
;687:
;688:	trap_Cvar_SetValue( "r_fullscreen", s_graphicsoptions.fs.curvalue );
ADDRGP4 $547
ARGP4
ADDRGP4 s_graphicsoptions+1412+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 689
;689:	trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $550
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 690
;690:	trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $551
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 691
;691:	trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $552
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 692
;692:	trap_Cvar_SetValue( "r_vertexLight", s_graphicsoptions.lighting.curvalue );
ADDRGP4 $553
ARGP4
ADDRGP4 s_graphicsoptions+1508+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 693
;693:        trap_Cvar_SetValue( "cg_autovertex", s_graphicsoptions.lighting.curvalue );
ADDRGP4 $556
ARGP4
ADDRGP4 s_graphicsoptions+1508+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 694
;694:        trap_Cvar_SetValue( "r_flares", s_graphicsoptions.flares.curvalue );
ADDRGP4 $559
ARGP4
ADDRGP4 s_graphicsoptions+1604+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 695
;695:        trap_Cvar_SetValue( "r_bloom", s_graphicsoptions.bloom.curvalue );
ADDRGP4 $562
ARGP4
ADDRGP4 s_graphicsoptions+1700+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 698
;696:        
;697:        //r_ext_texture_filter_anisotropic is special
;698:        if(s_graphicsoptions.aniso.curvalue) {
ADDRGP4 s_graphicsoptions+2180+64
INDIRI4
CNSTI4 0
EQI4 $565
line 699
;699:            trap_Cvar_SetValue( "r_ext_max_anisotropy", s_graphicsoptions.aniso.curvalue*2 );
ADDRGP4 $569
ARGP4
ADDRGP4 s_graphicsoptions+2180+64
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 700
;700:            trap_Cvar_SetValue( "r_ext_texture_filter_anisotropic", qtrue );
ADDRGP4 $572
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 701
;701:        }
ADDRGP4 $566
JUMPV
LABELV $565
line 703
;702:        else
;703:            trap_Cvar_SetValue( "r_ext_texture_filter_anisotropic", qfalse );
ADDRGP4 $572
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
LABELV $566
line 705
;704:        
;705:        trap_Cvar_SetValue( "com_hunkmegs", 128 );
ADDRGP4 $573
ARGP4
CNSTF4 1124073472
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 708
;706:        
;707:        
;708:	if ( s_graphicsoptions.geometry.curvalue == 2 )
ADDRGP4 s_graphicsoptions+1988+64
INDIRI4
CNSTI4 2
NEI4 $574
line 709
;709:	{
line 710
;710:		trap_Cvar_SetValue( "r_lodBias", 0 );
ADDRGP4 $578
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 711
;711:		trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $579
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 712
;712:	}
ADDRGP4 $575
JUMPV
LABELV $574
line 713
;713:	else if ( s_graphicsoptions.geometry.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1988+64
INDIRI4
CNSTI4 1
NEI4 $580
line 714
;714:	{
line 715
;715:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $578
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 716
;716:		trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $579
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 717
;717:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 719
;718:	else
;719:	{
line 720
;720:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $578
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 721
;721:		trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $579
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 722
;722:	}
LABELV $581
LABELV $575
line 724
;723:
;724:	if ( s_graphicsoptions.filter.curvalue )
ADDRGP4 s_graphicsoptions+2084+64
INDIRI4
CNSTI4 0
EQI4 $584
line 725
;725:	{
line 726
;726:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $588
ARGP4
ADDRGP4 $589
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 727
;727:	}
ADDRGP4 $585
JUMPV
LABELV $584
line 729
;728:	else
;729:	{
line 730
;730:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $588
ARGP4
ADDRGP4 $590
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 731
;731:	}
LABELV $585
line 733
;732:
;733:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $591
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 734
;734:}
LABELV $506
endproc GraphicsOptions_ApplyChanges 52 12
proc GraphicsOptions_Event 16 4
line 741
;735:
;736:/*
;737:=================
;738:GraphicsOptions_Event
;739:=================
;740:*/
;741:static void GraphicsOptions_Event( void* ptr, int event ) {
line 744
;742:	InitialVideoOptions_s *ivo;
;743:
;744:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $593
line 745
;745:	 	return;
ADDRGP4 $592
JUMPV
LABELV $593
line 748
;746:	}
;747:
;748:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 101
LTI4 $595
ADDRLP4 4
INDIRI4
CNSTI4 110
GTI4 $595
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $657-404
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $657
address $652
address $595
address $624
address $603
address $651
address $596
address $654
address $655
address $656
address $598
code
LABELV $598
line 750
;749:        case ID_RATIO:
;750:            s_graphicsoptions.mode.curvalue = ratioToRes[ s_graphicsoptions.ratio.curvalue ];
ADDRGP4 s_graphicsoptions+1144+64
ADDRGP4 s_graphicsoptions+1048+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratioToRes
ADDP4
INDIRI4
ASGNI4
LABELV $603
line 754
;751:            // fall through to apply mode constraints
;752:	case ID_MODE:
;753:		// clamp 3dfx video modes
;754:		if ( s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1240+64
INDIRI4
CNSTI4 1
NEI4 $604
line 755
;755:		{
line 756
;756:			if ( s_graphicsoptions.mode.curvalue < 2 )
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 2
GEI4 $608
line 757
;757:				s_graphicsoptions.mode.curvalue = 2;
ADDRGP4 s_graphicsoptions+1144+64
CNSTI4 2
ASGNI4
ADDRGP4 $609
JUMPV
LABELV $608
line 758
;758:			else if ( s_graphicsoptions.mode.curvalue > 6 )
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 6
LEI4 $614
line 759
;759:				s_graphicsoptions.mode.curvalue = 6;
ADDRGP4 s_graphicsoptions+1144+64
CNSTI4 6
ASGNI4
LABELV $614
LABELV $609
line 760
;760:		}
LABELV $604
line 761
;761:                s_graphicsoptions.ratio.curvalue = resToRatio[ s_graphicsoptions.mode.curvalue ];
ADDRGP4 s_graphicsoptions+1048+64
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
INDIRI4
ASGNI4
line 762
;762:		break;
ADDRGP4 $596
JUMPV
LABELV $624
line 765
;763:
;764:	case ID_LIST:
;765:		ivo = &s_ivo_templates[s_graphicsoptions.list.curvalue];
ADDRLP4 0
CNSTI4 48
ADDRGP4 s_graphicsoptions+952+64
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
ASGNP4
line 767
;766:
;767:		s_graphicsoptions.mode.curvalue        = GraphicsOptions_FindDetectedResolution(ivo->mode);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 GraphicsOptions_FindDetectedResolution
CALLI4
ASGNI4
ADDRGP4 s_graphicsoptions+1144+64
ADDRLP4 12
INDIRI4
ASGNI4
line 768
;768:                s_graphicsoptions.ratio.curvalue       = resToRatio[ s_graphicsoptions.mode.curvalue ];
ADDRGP4 s_graphicsoptions+1048+64
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
INDIRI4
ASGNI4
line 769
;769:		s_graphicsoptions.tq.curvalue          = ivo->tq;
ADDRGP4 s_graphicsoptions+1336+68
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 770
;770:		s_graphicsoptions.lighting.curvalue    = ivo->lighting;
ADDRGP4 s_graphicsoptions+1508+64
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 771
;771:		s_graphicsoptions.texturebits.curvalue = ivo->texturebits;
ADDRGP4 s_graphicsoptions+1892+64
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 772
;772:		s_graphicsoptions.geometry.curvalue    = ivo->geometry;
ADDRGP4 s_graphicsoptions+1988+64
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 773
;773:		s_graphicsoptions.filter.curvalue      = ivo->filter;
ADDRGP4 s_graphicsoptions+2084+64
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 774
;774:                s_graphicsoptions.aniso.curvalue       = ivo->aniso;
ADDRGP4 s_graphicsoptions+2180+64
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 775
;775:		s_graphicsoptions.fs.curvalue          = ivo->fullscreen;
ADDRGP4 s_graphicsoptions+1412+64
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 776
;776:                s_graphicsoptions.flares.curvalue      = ivo->flares;
ADDRGP4 s_graphicsoptions+1604+64
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 777
;777:                s_graphicsoptions.bloom.curvalue      = ivo->bloom;
ADDRGP4 s_graphicsoptions+1700+64
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 778
;778:		break;
ADDRGP4 $596
JUMPV
LABELV $651
line 781
;779:
;780:	case ID_DRIVERINFO:
;781:		UI_DriverInfo_Menu();
ADDRGP4 UI_DriverInfo_Menu
CALLV
pop
line 782
;782:		break;
ADDRGP4 $596
JUMPV
LABELV $652
line 785
;783:
;784:	case ID_BACK2:
;785:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 786
;786:		break;
ADDRGP4 $596
JUMPV
line 789
;787:
;788:	case ID_GRAPHICS:
;789:		break;
LABELV $654
line 792
;790:
;791:	case ID_DISPLAY:
;792:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 793
;793:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 794
;794:		break;
ADDRGP4 $596
JUMPV
LABELV $655
line 797
;795:
;796:	case ID_SOUND:
;797:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 798
;798:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 799
;799:		break;
ADDRGP4 $596
JUMPV
LABELV $656
line 802
;800:
;801:	case ID_NETWORK:
;802:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 803
;803:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 804
;804:		break;
LABELV $595
LABELV $596
line 806
;805:	}
;806:}
LABELV $592
endproc GraphicsOptions_Event 16 4
proc GraphicsOptions_TQEvent 0 0
line 814
;807:
;808:
;809:/*
;810:================
;811:GraphicsOptions_TQEvent
;812:================
;813:*/
;814:static void GraphicsOptions_TQEvent( void *ptr, int event ) {
line 815
;815:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $660
line 816
;816:	 	return;
ADDRGP4 $659
JUMPV
LABELV $660
line 818
;817:	}
;818:	s_graphicsoptions.tq.curvalue = (int)(s_graphicsoptions.tq.curvalue + 0.5);
ADDRGP4 s_graphicsoptions+1336+68
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 819
;819:}
LABELV $659
endproc GraphicsOptions_TQEvent 0 0
export GraphicsOptions_MenuDraw
proc GraphicsOptions_MenuDraw 0 4
line 828
;820:
;821:
;822:/*
;823:================
;824:GraphicsOptions_MenuDraw
;825:================
;826:*/
;827:void GraphicsOptions_MenuDraw (void)
;828:{
line 830
;829://APSFIX - rework this
;830:	GraphicsOptions_UpdateMenuItems();
ADDRGP4 GraphicsOptions_UpdateMenuItems
CALLV
pop
line 832
;831:
;832:	Menu_Draw( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 833
;833:}
LABELV $666
endproc GraphicsOptions_MenuDraw 0 4
proc GraphicsOptions_SetMenuItems 1056 12
line 841
;834:
;835:/*
;836:=================
;837:GraphicsOptions_SetMenuItems
;838:=================
;839:*/
;840:static void GraphicsOptions_SetMenuItems( void )
;841:{
line 842
;842:	s_graphicsoptions.mode.curvalue =
ADDRGP4 $544
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 GraphicsOptions_FindDetectedResolution
CALLI4
ASGNI4
ADDRGP4 s_graphicsoptions+1144+64
ADDRLP4 4
INDIRI4
ASGNI4
line 845
;843:		GraphicsOptions_FindDetectedResolution( trap_Cvar_VariableValue( "r_mode" ) );
;844:
;845:	if ( s_graphicsoptions.mode.curvalue < 0 )
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 0
GEI4 $670
line 846
;846:	{
line 847
;847:		if( resolutionsDetected )
ADDRGP4 resolutionsDetected
INDIRI4
CNSTI4 0
EQI4 $674
line 848
;848:		{
line 851
;849:			int i;
;850:			char buf[MAX_STRING_CHARS];
;851:			trap_Cvar_VariableStringBuffer("r_customwidth", buf, sizeof(buf)-2);
ADDRGP4 $542
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1022
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 852
;852:			buf[strlen(buf)+1] = 0;
ADDRLP4 12
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 12+1
ADDP4
CNSTI1 0
ASGNI1
line 853
;853:			buf[strlen(buf)] = 'x';
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 120
ASGNI1
line 854
;854:			trap_Cvar_VariableStringBuffer("r_customheight", buf+strlen(buf), sizeof(buf)-strlen(buf));
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ARGP4
ADDRLP4 1048
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $543
ARGP4
ADDRLP4 1044
INDIRI4
ADDRLP4 12
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 1048
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 856
;855:
;856:			for(i = 0; detectedResolutions[i]; ++i)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $680
JUMPV
LABELV $677
line 857
;857:			{
line 858
;858:				if(!Q_stricmp(buf, detectedResolutions[i]))
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $681
line 859
;859:				{
line 860
;860:					s_graphicsoptions.mode.curvalue = i;
ADDRGP4 s_graphicsoptions+1144+64
ADDRLP4 8
INDIRI4
ASGNI4
line 861
;861:					break;
ADDRGP4 $679
JUMPV
LABELV $681
line 863
;862:				}
;863:			}
LABELV $678
line 856
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $680
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 detectedResolutions
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $677
LABELV $679
line 864
;864:			if ( s_graphicsoptions.mode.curvalue < 0 )
ADDRGP4 s_graphicsoptions+1144+64
INDIRI4
CNSTI4 0
GEI4 $675
line 865
;865:				s_graphicsoptions.mode.curvalue = 0;
ADDRGP4 s_graphicsoptions+1144+64
CNSTI4 0
ASGNI4
line 866
;866:		}
ADDRGP4 $675
JUMPV
LABELV $674
line 868
;867:		else
;868:		{
line 869
;869:			s_graphicsoptions.mode.curvalue = 3;
ADDRGP4 s_graphicsoptions+1144+64
CNSTI4 3
ASGNI4
line 870
;870:		}
LABELV $675
line 871
;871:	}
LABELV $670
line 872
;872:	s_graphicsoptions.fs.curvalue = trap_Cvar_VariableValue("r_fullscreen");
ADDRGP4 $547
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1412+64
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 873
;873:	s_graphicsoptions.allow_extensions.curvalue = trap_Cvar_VariableValue("r_allowExtensions");
ADDRGP4 $520
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1796+64
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 874
;874:        s_graphicsoptions.flares.curvalue = trap_Cvar_VariableValue("r_flares");
ADDRGP4 $559
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1604+64
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 875
;875:        s_graphicsoptions.bloom.curvalue = trap_Cvar_VariableValue("r_bloom");
ADDRGP4 $562
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1700+64
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 876
;876:        if(trap_Cvar_VariableValue("r_ext_texture_filter_anisotropic")) {
ADDRGP4 $572
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $701
line 877
;877:            s_graphicsoptions.aniso.curvalue = trap_Cvar_VariableValue("r_ext_max_anisotropy")/2;
ADDRGP4 $569
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2180+64
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ASGNI4
line 878
;878:        }
LABELV $701
line 879
;879:	s_graphicsoptions.tq.curvalue = 3-trap_Cvar_VariableValue( "r_picmip");
ADDRGP4 $517
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1336+68
CNSTF4 1077936128
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 880
;880:	if ( s_graphicsoptions.tq.curvalue < 0 )
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
CNSTF4 0
GEF4 $707
line 881
;881:	{
line 882
;882:		s_graphicsoptions.tq.curvalue = 0;
ADDRGP4 s_graphicsoptions+1336+68
CNSTF4 0
ASGNF4
line 883
;883:	}
ADDRGP4 $708
JUMPV
LABELV $707
line 884
;884:	else if ( s_graphicsoptions.tq.curvalue > 3 )
ADDRGP4 s_graphicsoptions+1336+68
INDIRF4
CNSTF4 1077936128
LEF4 $713
line 885
;885:	{
line 886
;886:		s_graphicsoptions.tq.curvalue = 3;
ADDRGP4 s_graphicsoptions+1336+68
CNSTF4 1077936128
ASGNF4
line 887
;887:	}
LABELV $713
LABELV $708
line 889
;888:
;889:	s_graphicsoptions.lighting.curvalue = trap_Cvar_VariableValue( "r_vertexLight" ) != 0;
ADDRGP4 $553
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $722
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $723
JUMPV
LABELV $722
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $723
ADDRGP4 s_graphicsoptions+1508+64
ADDRLP4 32
INDIRI4
ASGNI4
line 890
;890:	switch ( ( int ) trap_Cvar_VariableValue( "r_texturebits" ) )
ADDRGP4 $514
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 52
CNSTI4 16
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $730
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
GTI4 $737
LABELV $736
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $727
ADDRGP4 $724
JUMPV
LABELV $737
ADDRLP4 40
INDIRI4
CNSTI4 32
EQI4 $733
ADDRGP4 $724
JUMPV
line 891
;891:	{
LABELV $724
LABELV $727
line 894
;892:	default:
;893:	case 0:
;894:		s_graphicsoptions.texturebits.curvalue = 0;
ADDRGP4 s_graphicsoptions+1892+64
CNSTI4 0
ASGNI4
line 895
;895:		break;
ADDRGP4 $725
JUMPV
LABELV $730
line 897
;896:	case 16:
;897:		s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1892+64
CNSTI4 1
ASGNI4
line 898
;898:		break;
ADDRGP4 $725
JUMPV
LABELV $733
line 900
;899:	case 32:
;900:		s_graphicsoptions.texturebits.curvalue = 2;
ADDRGP4 s_graphicsoptions+1892+64
CNSTI4 2
ASGNI4
line 901
;901:		break;
LABELV $725
line 904
;902:	}
;903:
;904:	if ( !Q_stricmp( UI_Cvar_VariableString( "r_textureMode" ), "GL_LINEAR_MIPMAP_NEAREST" ) )
ADDRGP4 $588
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 $590
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $738
line 905
;905:	{
line 906
;906:		s_graphicsoptions.filter.curvalue = 0;
ADDRGP4 s_graphicsoptions+2084+64
CNSTI4 0
ASGNI4
line 907
;907:	}
ADDRGP4 $739
JUMPV
LABELV $738
line 909
;908:	else
;909:	{
line 910
;910:		s_graphicsoptions.filter.curvalue = 1;
ADDRGP4 s_graphicsoptions+2084+64
CNSTI4 1
ASGNI4
line 911
;911:	}
LABELV $739
line 913
;912:
;913:	if ( trap_Cvar_VariableValue( "r_lodBias" ) > 0 )
ADDRGP4 $578
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $744
line 914
;914:	{
line 915
;915:		if ( trap_Cvar_VariableValue( "r_subdivisions" ) >= 20 )
ADDRGP4 $579
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 1101004800
LTF4 $746
line 916
;916:		{
line 917
;917:			s_graphicsoptions.geometry.curvalue = 0;
ADDRGP4 s_graphicsoptions+1988+64
CNSTI4 0
ASGNI4
line 918
;918:		}
ADDRGP4 $745
JUMPV
LABELV $746
line 920
;919:		else
;920:		{
line 921
;921:			s_graphicsoptions.geometry.curvalue = 1;
ADDRGP4 s_graphicsoptions+1988+64
CNSTI4 1
ASGNI4
line 922
;922:		}
line 923
;923:	}
ADDRGP4 $745
JUMPV
LABELV $744
line 925
;924:	else
;925:	{
line 926
;926:		s_graphicsoptions.geometry.curvalue = 2;
ADDRGP4 s_graphicsoptions+1988+64
CNSTI4 2
ASGNI4
line 927
;927:	}
LABELV $745
line 928
;928:}
LABELV $667
endproc GraphicsOptions_SetMenuItems 1056 12
data
align 4
LABELV $755
address $756
address $757
byte 4 0
align 4
LABELV $758
address $756
address $759
address $760
byte 4 0
align 4
LABELV $761
address $762
address $763
address $764
address $765
address $766
address $767
byte 4 0
align 4
LABELV $768
address $769
address $770
byte 4 0
align 4
LABELV $771
address $772
address $773
byte 4 0
align 4
LABELV $774
address $775
address $776
address $777
address $778
address $779
byte 4 0
align 4
LABELV $780
address $781
address $782
address $783
byte 4 0
align 4
LABELV $784
address $775
address $785
byte 4 0
export GraphicsOptions_MenuInit
code
proc GraphicsOptions_MenuInit 8 12
line 936
;929:
;930:/*
;931:================
;932:GraphicsOptions_MenuInit
;933:================
;934:*/
;935:void GraphicsOptions_MenuInit( void )
;936:{
line 1005
;937:	static const char *s_driver_names[] =
;938:	{
;939:		"Default",
;940:		"Voodoo",
;941:		NULL
;942:	};
;943:
;944:	static const char *tq_names[] =
;945:	{
;946:		"Default",
;947:		"16 bit",
;948:		"32 bit",
;949:		NULL
;950:	};
;951:
;952:	static const char *s_graphics_options_names[] =
;953:	{
;954:		"Very High Quality",
;955:		"High Quality",
;956:		"Normal",
;957:		"Fast",
;958:		"Fastest",
;959:		"Custom",
;960:		NULL
;961:	};
;962:
;963:	static const char *lighting_names[] =
;964:	{
;965:		"Lightmap (Normal)",
;966:		"Vertex (Low)",
;967:		NULL
;968:	};
;969:
;970:
;971:	static const char *filter_names[] =
;972:	{
;973:		"Bilinear",
;974:		"Trilinear",
;975:		NULL
;976:	};
;977:        
;978:        static const char *aniso_names[] =
;979:	{
;980:		"Off",
;981:		"2x",
;982:                "4x",
;983:                "6x",
;984:                "8x",
;985:		NULL
;986:	};
;987:        
;988:	static const char *quality_names[] =
;989:	{
;990:		"Low",
;991:		"Medium",
;992:		"High",
;993:		NULL
;994:	};
;995:	static const char *enabled_names[] =
;996:	{
;997:		"Off",
;998:		"On",
;999:		NULL
;1000:	};
;1001:
;1002:	int y;
;1003:
;1004:	// zero set all our globals
;1005:	memset( &s_graphicsoptions, 0 ,sizeof(graphicsoptions_t) );
ADDRGP4 s_graphicsoptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2524
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1008
;1006:
;1007:
;1008:        GraphicsOptions_GetResolutions();
ADDRGP4 GraphicsOptions_GetResolutions
CALLV
pop
line 1009
;1009:        GraphicsOptions_GetAspectRatios();
ADDRGP4 GraphicsOptions_GetAspectRatios
CALLV
pop
line 1011
;1010:
;1011:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 1013
;1012:
;1013:	s_graphicsoptions.menu.wrapAround = qtrue;
ADDRGP4 s_graphicsoptions+404
CNSTI4 1
ASGNI4
line 1014
;1014:	s_graphicsoptions.menu.fullscreen = qtrue;
ADDRGP4 s_graphicsoptions+408
CNSTI4 1
ASGNI4
line 1015
;1015:	s_graphicsoptions.menu.draw       = GraphicsOptions_MenuDraw;
ADDRGP4 s_graphicsoptions+396
ADDRGP4 GraphicsOptions_MenuDraw
ASGNP4
line 1017
;1016:
;1017:	s_graphicsoptions.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_graphicsoptions+416
CNSTI4 10
ASGNI4
line 1018
;1018:	s_graphicsoptions.banner.generic.x	   = 320;
ADDRGP4 s_graphicsoptions+416+12
CNSTI4 320
ASGNI4
line 1019
;1019:	s_graphicsoptions.banner.generic.y	   = 16;
ADDRGP4 s_graphicsoptions+416+16
CNSTI4 16
ASGNI4
line 1020
;1020:	s_graphicsoptions.banner.string  	   = "SYSTEM SETUP";
ADDRGP4 s_graphicsoptions+416+60
ADDRGP4 $796
ASGNP4
line 1021
;1021:	s_graphicsoptions.banner.color         = color_white;
ADDRGP4 s_graphicsoptions+416+68
ADDRGP4 color_white
ASGNP4
line 1022
;1022:	s_graphicsoptions.banner.style         = UI_CENTER;
ADDRGP4 s_graphicsoptions+416+64
CNSTI4 1
ASGNI4
line 1024
;1023:
;1024:	s_graphicsoptions.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+488
CNSTI4 6
ASGNI4
line 1025
;1025:	s_graphicsoptions.framel.generic.name  = GRAPHICSOPTIONS_FRAMEL;
ADDRGP4 s_graphicsoptions+488+4
ADDRGP4 $79
ASGNP4
line 1026
;1026:	s_graphicsoptions.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+488+44
CNSTU4 16384
ASGNU4
line 1027
;1027:	s_graphicsoptions.framel.generic.x	   = 0;
ADDRGP4 s_graphicsoptions+488+12
CNSTI4 0
ASGNI4
line 1028
;1028:	s_graphicsoptions.framel.generic.y	   = 78;
ADDRGP4 s_graphicsoptions+488+16
CNSTI4 78
ASGNI4
line 1029
;1029:	s_graphicsoptions.framel.width  	   = 256;
ADDRGP4 s_graphicsoptions+488+76
CNSTI4 256
ASGNI4
line 1030
;1030:	s_graphicsoptions.framel.height  	   = 329;
ADDRGP4 s_graphicsoptions+488+80
CNSTI4 329
ASGNI4
line 1032
;1031:
;1032:	s_graphicsoptions.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+576
CNSTI4 6
ASGNI4
line 1033
;1033:	s_graphicsoptions.framer.generic.name  = GRAPHICSOPTIONS_FRAMER;
ADDRGP4 s_graphicsoptions+576+4
ADDRGP4 $80
ASGNP4
line 1034
;1034:	s_graphicsoptions.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+576+44
CNSTU4 16384
ASGNU4
line 1035
;1035:	s_graphicsoptions.framer.generic.x	   = 376;
ADDRGP4 s_graphicsoptions+576+12
CNSTI4 376
ASGNI4
line 1036
;1036:	s_graphicsoptions.framer.generic.y	   = 76;
ADDRGP4 s_graphicsoptions+576+16
CNSTI4 76
ASGNI4
line 1037
;1037:	s_graphicsoptions.framer.width  	   = 256;
ADDRGP4 s_graphicsoptions+576+76
CNSTI4 256
ASGNI4
line 1038
;1038:	s_graphicsoptions.framer.height  	   = 334;
ADDRGP4 s_graphicsoptions+576+80
CNSTI4 334
ASGNI4
line 1040
;1039:
;1040:	s_graphicsoptions.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+664
CNSTI4 9
ASGNI4
line 1041
;1041:	s_graphicsoptions.graphics.generic.flags	= QMF_RIGHT_JUSTIFY;
ADDRGP4 s_graphicsoptions+664+44
CNSTU4 16
ASGNU4
line 1042
;1042:	s_graphicsoptions.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_graphicsoptions+664+8
CNSTI4 106
ASGNI4
line 1043
;1043:	s_graphicsoptions.graphics.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+664+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1044
;1044:	s_graphicsoptions.graphics.generic.x		= 216;
ADDRGP4 s_graphicsoptions+664+12
CNSTI4 216
ASGNI4
line 1045
;1045:	s_graphicsoptions.graphics.generic.y		= 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+664+16
CNSTI4 186
ASGNI4
line 1046
;1046:	s_graphicsoptions.graphics.string			= "GRAPHICS";
ADDRGP4 s_graphicsoptions+664+60
ADDRGP4 $840
ASGNP4
line 1047
;1047:	s_graphicsoptions.graphics.style			= UI_RIGHT;
ADDRGP4 s_graphicsoptions+664+64
CNSTI4 2
ASGNI4
line 1048
;1048:	s_graphicsoptions.graphics.color			= color_red;
ADDRGP4 s_graphicsoptions+664+68
ADDRGP4 color_red
ASGNP4
line 1050
;1049:
;1050:	s_graphicsoptions.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+736
CNSTI4 9
ASGNI4
line 1051
;1051:	s_graphicsoptions.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+736+44
CNSTU4 272
ASGNU4
line 1052
;1052:	s_graphicsoptions.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_graphicsoptions+736+8
CNSTI4 107
ASGNI4
line 1053
;1053:	s_graphicsoptions.display.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+736+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1054
;1054:	s_graphicsoptions.display.generic.x			= 216;
ADDRGP4 s_graphicsoptions+736+12
CNSTI4 216
ASGNI4
line 1055
;1055:	s_graphicsoptions.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+736+16
CNSTI4 213
ASGNI4
line 1056
;1056:	s_graphicsoptions.display.string			= "DISPLAY";
ADDRGP4 s_graphicsoptions+736+60
ADDRGP4 $858
ASGNP4
line 1057
;1057:	s_graphicsoptions.display.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+736+64
CNSTI4 2
ASGNI4
line 1058
;1058:	s_graphicsoptions.display.color				= color_red;
ADDRGP4 s_graphicsoptions+736+68
ADDRGP4 color_red
ASGNP4
line 1060
;1059:
;1060:	s_graphicsoptions.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+808
CNSTI4 9
ASGNI4
line 1061
;1061:	s_graphicsoptions.sound.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+808+44
CNSTU4 272
ASGNU4
line 1062
;1062:	s_graphicsoptions.sound.generic.id			= ID_SOUND;
ADDRGP4 s_graphicsoptions+808+8
CNSTI4 108
ASGNI4
line 1063
;1063:	s_graphicsoptions.sound.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+808+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1064
;1064:	s_graphicsoptions.sound.generic.x			= 216;
ADDRGP4 s_graphicsoptions+808+12
CNSTI4 216
ASGNI4
line 1065
;1065:	s_graphicsoptions.sound.generic.y			= 240;
ADDRGP4 s_graphicsoptions+808+16
CNSTI4 240
ASGNI4
line 1066
;1066:	s_graphicsoptions.sound.string				= "SOUND";
ADDRGP4 s_graphicsoptions+808+60
ADDRGP4 $876
ASGNP4
line 1067
;1067:	s_graphicsoptions.sound.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+808+64
CNSTI4 2
ASGNI4
line 1068
;1068:	s_graphicsoptions.sound.color				= color_red;
ADDRGP4 s_graphicsoptions+808+68
ADDRGP4 color_red
ASGNP4
line 1070
;1069:
;1070:	s_graphicsoptions.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+880
CNSTI4 9
ASGNI4
line 1071
;1071:	s_graphicsoptions.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+880+44
CNSTU4 272
ASGNU4
line 1072
;1072:	s_graphicsoptions.network.generic.id		= ID_NETWORK;
ADDRGP4 s_graphicsoptions+880+8
CNSTI4 109
ASGNI4
line 1073
;1073:	s_graphicsoptions.network.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+880+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1074
;1074:	s_graphicsoptions.network.generic.x			= 216;
ADDRGP4 s_graphicsoptions+880+12
CNSTI4 216
ASGNI4
line 1075
;1075:	s_graphicsoptions.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+880+16
CNSTI4 267
ASGNI4
line 1076
;1076:	s_graphicsoptions.network.string			= "NETWORK";
ADDRGP4 s_graphicsoptions+880+60
ADDRGP4 $894
ASGNP4
line 1077
;1077:	s_graphicsoptions.network.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+880+64
CNSTI4 2
ASGNI4
line 1078
;1078:	s_graphicsoptions.network.color				= color_red;
ADDRGP4 s_graphicsoptions+880+68
ADDRGP4 color_red
ASGNP4
line 1080
;1079:
;1080:	y = 240 - 7 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 114
ASGNI4
line 1081
;1081:	s_graphicsoptions.list.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+952
CNSTI4 3
ASGNI4
line 1082
;1082:	s_graphicsoptions.list.generic.name     = "Graphics Settings:";
ADDRGP4 s_graphicsoptions+952+4
ADDRGP4 $902
ASGNP4
line 1083
;1083:	s_graphicsoptions.list.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+952+44
CNSTU4 258
ASGNU4
line 1084
;1084:	s_graphicsoptions.list.generic.x        = 400;
ADDRGP4 s_graphicsoptions+952+12
CNSTI4 400
ASGNI4
line 1085
;1085:	s_graphicsoptions.list.generic.y        = y;
ADDRGP4 s_graphicsoptions+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1086
;1086:	s_graphicsoptions.list.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+952+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1087
;1087:	s_graphicsoptions.list.generic.id       = ID_LIST;
ADDRGP4 s_graphicsoptions+952+8
CNSTI4 103
ASGNI4
line 1088
;1088:	s_graphicsoptions.list.itemnames        = s_graphics_options_names;
ADDRGP4 s_graphicsoptions+952+76
ADDRGP4 $761
ASGNP4
line 1089
;1089:	y += 2 * ( BIGCHAR_HEIGHT + 2 );
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 1141
;1090:
;1091:/*	s_graphicsoptions.driver.generic.type  = MTYPE_SPINCONTROL;
;1092:	s_graphicsoptions.driver.generic.name  = "GL Driver:";
;1093:	s_graphicsoptions.driver.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1094:	s_graphicsoptions.driver.generic.x     = 400;
;1095:	s_graphicsoptions.driver.generic.y     = y;
;1096:	s_graphicsoptions.driver.itemnames     = s_driver_names;
;1097:	s_graphicsoptions.driver.curvalue      = (uis.glconfig.driverType == GLDRV_VOODOO);
;1098:	y += BIGCHAR_HEIGHT+2;
;1099:
;1100: 	// references/modifies "r_allowExtensions"
;1101:	s_graphicsoptions.allow_extensions.generic.type     = MTYPE_SPINCONTROL;
;1102:	s_graphicsoptions.allow_extensions.generic.name	    = "GL Extensions:";
;1103:	s_graphicsoptions.allow_extensions.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1104:	s_graphicsoptions.allow_extensions.generic.x	    = 400;
;1105:	s_graphicsoptions.allow_extensions.generic.y	    = y;
;1106:	s_graphicsoptions.allow_extensions.itemnames        = enabled_names;
;1107:	y += BIGCHAR_HEIGHT+2;
;1108:
;1109:        s_graphicsoptions.ratio.generic.type     = MTYPE_SPINCONTROL;
;1110:        s_graphicsoptions.ratio.generic.name     = "Aspect Ratio:";
;1111:        s_graphicsoptions.ratio.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1112:        s_graphicsoptions.ratio.generic.x        = 400;
;1113:        s_graphicsoptions.ratio.generic.y        = y;
;1114:        s_graphicsoptions.ratio.itemnames        = ratios;
;1115:        s_graphicsoptions.ratio.generic.callback = GraphicsOptions_Event;
;1116:        s_graphicsoptions.ratio.generic.id       = ID_RATIO;
;1117:        y += BIGCHAR_HEIGHT+2;
;1118:
;1119:
;1120:	// references/modifies "r_mode"
;1121:	s_graphicsoptions.mode.generic.type     = MTYPE_SPINCONTROL;
;1122:	s_graphicsoptions.mode.generic.name     = "Resolution:";
;1123:	s_graphicsoptions.mode.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1124:	s_graphicsoptions.mode.generic.x        = 400;
;1125:	s_graphicsoptions.mode.generic.y        = y;
;1126:	s_graphicsoptions.mode.itemnames        = resolutions;
;1127:	s_graphicsoptions.mode.generic.callback = GraphicsOptions_Event;
;1128:	s_graphicsoptions.mode.generic.id       = ID_MODE;
;1129:	y += BIGCHAR_HEIGHT+2;
;1130:
;1131:	// references/modifies "r_fullscreen"
;1132:	s_graphicsoptions.fs.generic.type     = MTYPE_SPINCONTROL;
;1133:	s_graphicsoptions.fs.generic.name	  = "Fullscreen:";
;1134:	s_graphicsoptions.fs.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1135:	s_graphicsoptions.fs.generic.x	      = 400;
;1136:	s_graphicsoptions.fs.generic.y	      = y;
;1137:	s_graphicsoptions.fs.itemnames	      = enabled_names;
;1138:	y += BIGCHAR_HEIGHT+2; */
;1139:
;1140:	// references/modifies "r_vertexLight"
;1141:	s_graphicsoptions.lighting.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1508
CNSTI4 3
ASGNI4
line 1142
;1142:	s_graphicsoptions.lighting.generic.name	 = "Lighting:";
ADDRGP4 s_graphicsoptions+1508+4
ADDRGP4 $918
ASGNP4
line 1143
;1143:	s_graphicsoptions.lighting.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1508+44
CNSTU4 258
ASGNU4
line 1144
;1144:	s_graphicsoptions.lighting.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1508+12
CNSTI4 400
ASGNI4
line 1145
;1145:	s_graphicsoptions.lighting.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1508+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1146
;1146:	s_graphicsoptions.lighting.itemnames     = lighting_names;
ADDRGP4 s_graphicsoptions+1508+76
ADDRGP4 $768
ASGNP4
line 1147
;1147:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1150
;1148:        
;1149:        // references/modifies "r_flares"
;1150:	s_graphicsoptions.flares.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1604
CNSTI4 3
ASGNI4
line 1151
;1151:	s_graphicsoptions.flares.generic.name	  = "Flares:";
ADDRGP4 s_graphicsoptions+1604+4
ADDRGP4 $930
ASGNP4
line 1152
;1152:	s_graphicsoptions.flares.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1604+44
CNSTU4 258
ASGNU4
line 1153
;1153:	s_graphicsoptions.flares.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+1604+12
CNSTI4 400
ASGNI4
line 1154
;1154:	s_graphicsoptions.flares.generic.y	      = y;
ADDRGP4 s_graphicsoptions+1604+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1155
;1155:	s_graphicsoptions.flares.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+1604+76
ADDRGP4 $784
ASGNP4
line 1156
;1156:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1159
;1157:        
;1158:        // references/modifies "r_bloom"
;1159:	s_graphicsoptions.bloom.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1700
CNSTI4 3
ASGNI4
line 1160
;1160:	s_graphicsoptions.bloom.generic.name	  = "Bloom:";
ADDRGP4 s_graphicsoptions+1700+4
ADDRGP4 $942
ASGNP4
line 1161
;1161:	s_graphicsoptions.bloom.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1700+44
CNSTU4 258
ASGNU4
line 1162
;1162:	s_graphicsoptions.bloom.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+1700+12
CNSTI4 400
ASGNI4
line 1163
;1163:	s_graphicsoptions.bloom.generic.y	      = y;
ADDRGP4 s_graphicsoptions+1700+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1164
;1164:	s_graphicsoptions.bloom.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+1700+76
ADDRGP4 $784
ASGNP4
line 1165
;1165:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1168
;1166:
;1167:	// references/modifies "r_lodBias" & "subdivisions"
;1168:	s_graphicsoptions.geometry.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1988
CNSTI4 3
ASGNI4
line 1169
;1169:	s_graphicsoptions.geometry.generic.name	 = "Geometric Detail:";
ADDRGP4 s_graphicsoptions+1988+4
ADDRGP4 $954
ASGNP4
line 1170
;1170:	s_graphicsoptions.geometry.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1988+44
CNSTU4 258
ASGNU4
line 1171
;1171:	s_graphicsoptions.geometry.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1988+12
CNSTI4 400
ASGNI4
line 1172
;1172:	s_graphicsoptions.geometry.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1988+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1173
;1173:	s_graphicsoptions.geometry.itemnames     = quality_names;
ADDRGP4 s_graphicsoptions+1988+76
ADDRGP4 $780
ASGNP4
line 1174
;1174:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1177
;1175:
;1176:	// references/modifies "r_picmip"
;1177:	s_graphicsoptions.tq.generic.type	= MTYPE_SLIDER;
ADDRGP4 s_graphicsoptions+1336
CNSTI4 1
ASGNI4
line 1178
;1178:	s_graphicsoptions.tq.generic.name	= "Texture Detail:";
ADDRGP4 s_graphicsoptions+1336+4
ADDRGP4 $966
ASGNP4
line 1179
;1179:	s_graphicsoptions.tq.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1336+44
CNSTU4 258
ASGNU4
line 1180
;1180:	s_graphicsoptions.tq.generic.x		= 400;
ADDRGP4 s_graphicsoptions+1336+12
CNSTI4 400
ASGNI4
line 1181
;1181:	s_graphicsoptions.tq.generic.y		= y;
ADDRGP4 s_graphicsoptions+1336+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1182
;1182:	s_graphicsoptions.tq.minvalue       = 0;
ADDRGP4 s_graphicsoptions+1336+60
CNSTF4 0
ASGNF4
line 1183
;1183:	s_graphicsoptions.tq.maxvalue       = 3;
ADDRGP4 s_graphicsoptions+1336+64
CNSTF4 1077936128
ASGNF4
line 1184
;1184:	s_graphicsoptions.tq.generic.callback = GraphicsOptions_TQEvent;
ADDRGP4 s_graphicsoptions+1336+48
ADDRGP4 GraphicsOptions_TQEvent
ASGNP4
line 1185
;1185:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1197
;1186:
;1187:	// references/modifies "r_textureBits"
;1188:	// s_graphicsoptions.texturebits.generic.type  = MTYPE_SPINCONTROL;
;1189:	// s_graphicsoptions.texturebits.generic.name	= "Texture Quality:";
;1190:	// s_graphicsoptions.texturebits.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1191:	// s_graphicsoptions.texturebits.generic.x	    = 400;
;1192:	// s_graphicsoptions.texturebits.generic.y	    = y;
;1193:	// s_graphicsoptions.texturebits.itemnames     = tq_names;
;1194:	// y += BIGCHAR_HEIGHT+2;
;1195:
;1196:	// references/modifies "r_textureMode"
;1197:	s_graphicsoptions.filter.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2084
CNSTI4 3
ASGNI4
line 1198
;1198:	s_graphicsoptions.filter.generic.name	= "Texture Filter:";
ADDRGP4 s_graphicsoptions+2084+4
ADDRGP4 $982
ASGNP4
line 1199
;1199:	s_graphicsoptions.filter.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2084+44
CNSTU4 258
ASGNU4
line 1200
;1200:	s_graphicsoptions.filter.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+2084+12
CNSTI4 400
ASGNI4
line 1201
;1201:	s_graphicsoptions.filter.generic.y	    = y;
ADDRGP4 s_graphicsoptions+2084+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1202
;1202:	s_graphicsoptions.filter.itemnames      = filter_names;
ADDRGP4 s_graphicsoptions+2084+76
ADDRGP4 $771
ASGNP4
line 1203
;1203:	y += 2+BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1205
;1204:        
;1205:        s_graphicsoptions.aniso.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2180
CNSTI4 3
ASGNI4
line 1206
;1206:	s_graphicsoptions.aniso.generic.name	= "Anisotropy:";
ADDRGP4 s_graphicsoptions+2180+4
ADDRGP4 $994
ASGNP4
line 1207
;1207:	s_graphicsoptions.aniso.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2180+44
CNSTU4 258
ASGNU4
line 1208
;1208:	s_graphicsoptions.aniso.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+2180+12
CNSTI4 400
ASGNI4
line 1209
;1209:	s_graphicsoptions.aniso.generic.y	    = y;
ADDRGP4 s_graphicsoptions+2180+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1210
;1210:	s_graphicsoptions.aniso.itemnames      = aniso_names;
ADDRGP4 s_graphicsoptions+2180+76
ADDRGP4 $774
ASGNP4
line 1211
;1211:	y += 2*BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1213
;1212:
;1213:	s_graphicsoptions.driverinfo.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+2276
CNSTI4 9
ASGNI4
line 1214
;1214:	s_graphicsoptions.driverinfo.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+2276+44
CNSTU4 264
ASGNU4
line 1215
;1215:	s_graphicsoptions.driverinfo.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2276+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1216
;1216:	s_graphicsoptions.driverinfo.generic.id       = ID_DRIVERINFO;
ADDRGP4 s_graphicsoptions+2276+8
CNSTI4 105
ASGNI4
line 1217
;1217:	s_graphicsoptions.driverinfo.generic.x        = 320;
ADDRGP4 s_graphicsoptions+2276+12
CNSTI4 320
ASGNI4
line 1218
;1218:	s_graphicsoptions.driverinfo.generic.y        = y;
ADDRGP4 s_graphicsoptions+2276+16
ADDRLP4 0
INDIRI4
ASGNI4
line 1219
;1219:	s_graphicsoptions.driverinfo.string           = "Driver Info";
ADDRGP4 s_graphicsoptions+2276+60
ADDRGP4 $1016
ASGNP4
line 1220
;1220:	s_graphicsoptions.driverinfo.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_graphicsoptions+2276+64
CNSTI4 17
ASGNI4
line 1221
;1221:	s_graphicsoptions.driverinfo.color            = color_red;
ADDRGP4 s_graphicsoptions+2276+68
ADDRGP4 color_red
ASGNP4
line 1222
;1222:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1224
;1223:
;1224:	s_graphicsoptions.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+2436
CNSTI4 6
ASGNI4
line 1225
;1225:	s_graphicsoptions.back.generic.name     = GRAPHICSOPTIONS_BACK0;
ADDRGP4 s_graphicsoptions+2436+4
ADDRGP4 $81
ASGNP4
line 1226
;1226:	s_graphicsoptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+2436+44
CNSTU4 260
ASGNU4
line 1227
;1227:	s_graphicsoptions.back.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2436+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1228
;1228:	s_graphicsoptions.back.generic.id	    = ID_BACK2;
ADDRGP4 s_graphicsoptions+2436+8
CNSTI4 101
ASGNI4
line 1229
;1229:	s_graphicsoptions.back.generic.x		= 0;
ADDRGP4 s_graphicsoptions+2436+12
CNSTI4 0
ASGNI4
line 1230
;1230:	s_graphicsoptions.back.generic.y		= 480-64;
ADDRGP4 s_graphicsoptions+2436+16
CNSTI4 416
ASGNI4
line 1231
;1231:	s_graphicsoptions.back.width  		    = 128;
ADDRGP4 s_graphicsoptions+2436+76
CNSTI4 128
ASGNI4
line 1232
;1232:	s_graphicsoptions.back.height  		    = 64;
ADDRGP4 s_graphicsoptions+2436+80
CNSTI4 64
ASGNI4
line 1233
;1233:	s_graphicsoptions.back.focuspic         = GRAPHICSOPTIONS_BACK1;
ADDRGP4 s_graphicsoptions+2436+60
ADDRGP4 $82
ASGNP4
line 1235
;1234:
;1235:	s_graphicsoptions.apply.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+2348
CNSTI4 6
ASGNI4
line 1236
;1236:	s_graphicsoptions.apply.generic.name     = GRAPHICSOPTIONS_ACCEPT0;
ADDRGP4 s_graphicsoptions+2348+4
ADDRGP4 $1043
ASGNP4
line 1237
;1237:	s_graphicsoptions.apply.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_HIDDEN|QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+2348+44
CNSTU4 20752
ASGNU4
line 1238
;1238:	s_graphicsoptions.apply.generic.callback = GraphicsOptions_ApplyChanges;
ADDRGP4 s_graphicsoptions+2348+48
ADDRGP4 GraphicsOptions_ApplyChanges
ASGNP4
line 1239
;1239:	s_graphicsoptions.apply.generic.x        = 640;
ADDRGP4 s_graphicsoptions+2348+12
CNSTI4 640
ASGNI4
line 1240
;1240:	s_graphicsoptions.apply.generic.y        = 480-64;
ADDRGP4 s_graphicsoptions+2348+16
CNSTI4 416
ASGNI4
line 1241
;1241:	s_graphicsoptions.apply.width  		     = 128;
ADDRGP4 s_graphicsoptions+2348+76
CNSTI4 128
ASGNI4
line 1242
;1242:	s_graphicsoptions.apply.height  		 = 64;
ADDRGP4 s_graphicsoptions+2348+80
CNSTI4 64
ASGNI4
line 1243
;1243:	s_graphicsoptions.apply.focuspic         = GRAPHICSOPTIONS_ACCEPT1;
ADDRGP4 s_graphicsoptions+2348+60
ADDRGP4 $1058
ASGNP4
line 1245
;1244:
;1245:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.banner );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1246
;1246:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framel );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1247
;1247:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framer );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1249
;1248:
;1249:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1250
;1250:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.display );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1251
;1251:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.sound );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1252
;1252:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.network );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1254
;1253:
;1254:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.list );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1260
;1255:/* 	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driver );
;1256:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.allow_extensions );
;1257:        Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.ratio );
;1258:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.mode );
;1259:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.fs ); */
;1260:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.lighting );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1508
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1261
;1261:        Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.flares );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1604
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1262
;1262:        Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.bloom );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1263
;1263:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.geometry );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1988
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1264
;1264:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.tq );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1266
;1265:	// Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.texturebits );
;1266:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.filter );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2084
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1267
;1267:        Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.aniso );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1268
;1268:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driverinfo );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2276
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1270
;1269:
;1270:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.back );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2436
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1271
;1271:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.apply );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2348
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1273
;1272:
;1273:	GraphicsOptions_SetMenuItems();
ADDRGP4 GraphicsOptions_SetMenuItems
CALLV
pop
line 1274
;1274:	GraphicsOptions_GetInitialVideo();
ADDRGP4 GraphicsOptions_GetInitialVideo
CALLV
pop
line 1276
;1275:
;1276:	if ( uis.glconfig.driverType == GLDRV_ICD &&
ADDRGP4 uis+56+11284
INDIRI4
CNSTI4 0
NEI4 $1077
ADDRGP4 uis+56+11288
INDIRI4
CNSTI4 1
NEI4 $1077
line 1278
;1277:		 uis.glconfig.hardwareType == GLHW_3DFX_2D3D )
;1278:	{
line 1279
;1279:		s_graphicsoptions.driver.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1240+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1280
;1280:	}
LABELV $1077
line 1281
;1281:}
LABELV $754
endproc GraphicsOptions_MenuInit 8 12
export GraphicsOptions_Cache
proc GraphicsOptions_Cache 0 4
line 1289
;1282:
;1283:
;1284:/*
;1285:=================
;1286:GraphicsOptions_Cache
;1287:=================
;1288:*/
;1289:void GraphicsOptions_Cache( void ) {
line 1290
;1290:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMEL );
ADDRGP4 $79
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1291
;1291:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMER );
ADDRGP4 $80
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1292
;1292:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK0 );
ADDRGP4 $81
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1293
;1293:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK1 );
ADDRGP4 $82
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1294
;1294:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT0 );
ADDRGP4 $1043
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1295
;1295:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT1 );
ADDRGP4 $1058
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1296
;1296:}
LABELV $1085
endproc GraphicsOptions_Cache 0 4
export UI_GraphicsOptionsMenu
proc UI_GraphicsOptionsMenu 0 8
line 1304
;1297:
;1298:
;1299:/*
;1300:=================
;1301:UI_GraphicsOptionsMenu
;1302:=================
;1303:*/
;1304:void UI_GraphicsOptionsMenu( void ) {
line 1305
;1305:	GraphicsOptions_MenuInit();
ADDRGP4 GraphicsOptions_MenuInit
CALLV
pop
line 1306
;1306:	UI_PushMenu( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1307
;1307:	Menu_SetCursorToItem( &s_graphicsoptions.menu, &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+664
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 1308
;1308:}
LABELV $1086
endproc UI_GraphicsOptionsMenu 0 8
bss
align 4
LABELV detectedResolutions
skip 128
align 1
LABELV resbuf
skip 1024
align 4
LABELV resToRatio
skip 128
align 4
LABELV ratioToRes
skip 128
align 1
LABELV ratioBuf
skip 256
align 4
LABELV ratios
skip 128
align 4
LABELV s_graphicsoptions
skip 2524
align 4
LABELV s_ivo
skip 48
align 4
LABELV s_driverinfo
skip 2036
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
LABELV $1058
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
LABELV $1043
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
LABELV $1016
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $994
byte 1 65
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $982
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $966
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $954
byte 1 71
byte 1 101
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $942
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 58
byte 1 0
align 1
LABELV $930
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $918
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $902
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $894
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $876
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $858
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $840
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $796
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $785
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $783
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $782
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $781
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $779
byte 1 56
byte 1 120
byte 1 0
align 1
LABELV $778
byte 1 54
byte 1 120
byte 1 0
align 1
LABELV $777
byte 1 52
byte 1 120
byte 1 0
align 1
LABELV $776
byte 1 50
byte 1 120
byte 1 0
align 1
LABELV $775
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $773
byte 1 84
byte 1 114
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $772
byte 1 66
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $770
byte 1 86
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 32
byte 1 40
byte 1 76
byte 1 111
byte 1 119
byte 1 41
byte 1 0
align 1
LABELV $769
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $767
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $766
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $765
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $764
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $763
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $762
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $760
byte 1 51
byte 1 50
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $759
byte 1 49
byte 1 54
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $757
byte 1 86
byte 1 111
byte 1 111
byte 1 100
byte 1 111
byte 1 111
byte 1 0
align 1
LABELV $756
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $591
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $590
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $589
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $588
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $579
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $578
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 66
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $573
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 109
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $572
byte 1 114
byte 1 95
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $569
byte 1 114
byte 1 95
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 121
byte 1 0
align 1
LABELV $562
byte 1 114
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $559
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $556
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $553
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $552
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $551
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $550
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $547
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $544
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $543
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $542
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $520
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $517
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $514
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $331
byte 1 114
byte 1 95
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $278
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $250
byte 1 49
byte 1 54
byte 1 58
byte 1 57
byte 1 0
align 1
LABELV $249
byte 1 49
byte 1 46
byte 1 55
byte 1 56
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $248
byte 1 53
byte 1 58
byte 1 51
byte 1 0
align 1
LABELV $247
byte 1 49
byte 1 46
byte 1 54
byte 1 55
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $246
byte 1 49
byte 1 54
byte 1 58
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $245
byte 1 49
byte 1 46
byte 1 54
byte 1 48
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $244
byte 1 49
byte 1 52
byte 1 58
byte 1 57
byte 1 0
align 1
LABELV $243
byte 1 49
byte 1 46
byte 1 53
byte 1 54
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $242
byte 1 51
byte 1 58
byte 1 50
byte 1 0
align 1
LABELV $241
byte 1 49
byte 1 46
byte 1 53
byte 1 48
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $240
byte 1 52
byte 1 58
byte 1 51
byte 1 0
align 1
LABELV $239
byte 1 49
byte 1 46
byte 1 51
byte 1 51
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $238
byte 1 53
byte 1 58
byte 1 52
byte 1 0
align 1
LABELV $237
byte 1 49
byte 1 46
byte 1 50
byte 1 53
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $236
byte 1 56
byte 1 53
byte 1 54
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $235
byte 1 50
byte 1 48
byte 1 52
byte 1 56
byte 1 120
byte 1 49
byte 1 53
byte 1 51
byte 1 54
byte 1 0
align 1
LABELV $234
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $233
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $232
byte 1 49
byte 1 49
byte 1 53
byte 1 50
byte 1 120
byte 1 56
byte 1 54
byte 1 52
byte 1 0
align 1
LABELV $231
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $230
byte 1 57
byte 1 54
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $229
byte 1 56
byte 1 48
byte 1 48
byte 1 120
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $228
byte 1 54
byte 1 52
byte 1 48
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $227
byte 1 53
byte 1 49
byte 1 50
byte 1 120
byte 1 51
byte 1 56
byte 1 52
byte 1 0
align 1
LABELV $226
byte 1 52
byte 1 48
byte 1 48
byte 1 120
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $225
byte 1 51
byte 1 50
byte 1 48
byte 1 120
byte 1 50
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $138
byte 1 68
byte 1 82
byte 1 73
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
LABELV $100
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $94
byte 1 69
byte 1 88
byte 1 84
byte 1 69
byte 1 78
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $93
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $92
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
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
