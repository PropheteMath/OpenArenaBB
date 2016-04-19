data
align 4
LABELV quality_items
address $79
address $80
byte 4 0
code
proc UI_SoundOptionsMenu_Event 12 8
file "../../../code/q3_ui/ui_sound.c"
line 85
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
;26:SOUND OPTIONS MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:
;34:#define ART_FRAMEL			"menu/art_blueish/frame2_l"
;35:#define ART_FRAMER			"menu/art_blueish/frame1_r"
;36:#define ART_BACK0			"menu/art_blueish/back_0"
;37:#define ART_BACK1			"menu/art_blueish/back_1"
;38:
;39:#define ID_GRAPHICS			10
;40:#define ID_DISPLAY			11
;41:#define ID_SOUND			12
;42:#define ID_NETWORK			13
;43:#define ID_EFFECTSVOLUME	14
;44:#define ID_MUSICVOLUME		15
;45:#define ID_QUALITY			16
;46://#define ID_A3D				17
;47://Sago: Here I do some stuff!
;48:#define ID_OPENAL			18
;49:#define ID_BACK				19
;50:
;51:
;52:static const char *quality_items[] = {
;53:	"Low", "High", NULL
;54:};
;55:
;56:typedef struct {
;57:	menuframework_s		menu;
;58:
;59:	menutext_s			banner;
;60:	menubitmap_s		framel;
;61:	menubitmap_s		framer;
;62:
;63:	menutext_s			graphics;
;64:	menutext_s			display;
;65:	menutext_s			sound;
;66:	menutext_s			network;
;67:
;68:	menuslider_s		sfxvolume;
;69:	menuslider_s		musicvolume;
;70:	menulist_s			quality;
;71://	menuradiobutton_s	a3d;
;72:	menuradiobutton_s	openal;
;73:
;74:	menubitmap_s		back;
;75:} soundOptionsInfo_t;
;76:
;77:static soundOptionsInfo_t	soundOptionsInfo;
;78:
;79:
;80:/*
;81:=================
;82:UI_SoundOptionsMenu_Event
;83:=================
;84:*/
;85:static void UI_SoundOptionsMenu_Event( void* ptr, int event ) {
line 86
;86:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $83
line 87
;87:		return;
ADDRGP4 $82
JUMPV
LABELV $83
line 90
;88:	}
;89:
;90:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $85
ADDRLP4 0
INDIRI4
CNSTI4 19
GTI4 $85
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $119-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $119
address $88
address $89
address $86
address $91
address $92
address $96
address $100
address $85
address $108
address $118
code
LABELV $88
line 92
;91:	case ID_GRAPHICS:
;92:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 93
;93:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 94
;94:		break;
ADDRGP4 $86
JUMPV
LABELV $89
line 97
;95:
;96:	case ID_DISPLAY:
;97:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 98
;98:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 99
;99:		break;
ADDRGP4 $86
JUMPV
line 102
;100:
;101:	case ID_SOUND:
;102:		break;
LABELV $91
line 105
;103:
;104:	case ID_NETWORK:
;105:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 106
;106:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 107
;107:		break;
ADDRGP4 $86
JUMPV
LABELV $92
line 110
;108:
;109:	case ID_EFFECTSVOLUME:
;110:		trap_Cvar_SetValue( "s_volume", soundOptionsInfo.sfxvolume.curvalue / 10 );
ADDRGP4 $93
ARGP4
ADDRGP4 soundOptionsInfo+952+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 111
;111:		break;
ADDRGP4 $86
JUMPV
LABELV $96
line 114
;112:
;113:	case ID_MUSICVOLUME:
;114:		trap_Cvar_SetValue( "s_musicvolume", soundOptionsInfo.musicvolume.curvalue / 10 );
ADDRGP4 $97
ARGP4
ADDRGP4 soundOptionsInfo+1028+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 115
;115:		break;
ADDRGP4 $86
JUMPV
LABELV $100
line 118
;116:
;117:	case ID_QUALITY:
;118:		if( soundOptionsInfo.quality.curvalue ) {
ADDRGP4 soundOptionsInfo+1104+64
INDIRI4
CNSTI4 0
EQI4 $101
line 119
;119:			trap_Cvar_SetValue( "s_khz", 22 );
ADDRGP4 $105
ARGP4
CNSTF4 1102053376
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 120
;120:			trap_Cvar_SetValue( "s_compression", 0 );
ADDRGP4 $106
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 121
;121:		}
ADDRGP4 $102
JUMPV
LABELV $101
line 122
;122:		else {
line 123
;123:			trap_Cvar_SetValue( "s_khz", 11 );
ADDRGP4 $105
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 124
;124:			trap_Cvar_SetValue( "s_compression", 1 );
ADDRGP4 $106
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 125
;125:		}
LABELV $102
line 126
;126:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 127
;127:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 128
;128:		break;
ADDRGP4 $86
JUMPV
LABELV $108
line 142
;129:/*
;130:	case ID_A3D:
;131:		if( soundOptionsInfo.a3d.curvalue ) {
;132:			trap_Cmd_ExecuteText( EXEC_NOW, "s_enable_a3d\n" );
;133:		}
;134:		else {
;135:			trap_Cmd_ExecuteText( EXEC_NOW, "s_disable_a3d\n" );
;136:		}
;137:		soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_usingA3D" );
;138:		break;
;139:*/
;140:
;141:	case ID_OPENAL:
;142:		if( soundOptionsInfo.openal.curvalue ) {
ADDRGP4 soundOptionsInfo+1200+60
INDIRI4
CNSTI4 0
EQI4 $109
line 143
;143:			trap_Cmd_ExecuteText( EXEC_NOW, "s_useopenal 1\n" );
CNSTI4 0
ARGI4
ADDRGP4 $113
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 144
;144:		}
ADDRGP4 $110
JUMPV
LABELV $109
line 145
;145:		else {
line 146
;146:			trap_Cmd_ExecuteText( EXEC_NOW, "s_useopenal 0\n" );
CNSTI4 0
ARGI4
ADDRGP4 $114
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 147
;147:		}
LABELV $110
line 148
;148:		soundOptionsInfo.openal.curvalue = (int)trap_Cvar_VariableValue( "s_useopenal" );
ADDRGP4 $117
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1200+60
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 149
;149:		break;
ADDRGP4 $86
JUMPV
LABELV $118
line 152
;150:
;151:	case ID_BACK:
;152:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 153
;153:		break;
LABELV $85
LABELV $86
line 155
;154:	}
;155:}
LABELV $82
endproc UI_SoundOptionsMenu_Event 12 8
proc UI_SoundOptionsMenu_Init 24 12
line 163
;156:
;157:
;158:/*
;159:===============
;160:UI_SoundOptionsMenu_Init
;161:===============
;162:*/
;163:static void UI_SoundOptionsMenu_Init( void ) {
line 166
;164:	int				y;
;165:
;166:	memset( &soundOptionsInfo, 0, sizeof(soundOptionsInfo) );
ADDRGP4 soundOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1352
ARGI4
ADDRGP4 memset
CALLP4
pop
line 168
;167:
;168:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 169
;169:	soundOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 soundOptionsInfo+404
CNSTI4 1
ASGNI4
line 170
;170:	soundOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 soundOptionsInfo+408
CNSTI4 1
ASGNI4
line 172
;171:
;172:	soundOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 soundOptionsInfo+416
CNSTI4 10
ASGNI4
line 173
;173:	soundOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 soundOptionsInfo+416+44
CNSTU4 8
ASGNU4
line 174
;174:	soundOptionsInfo.banner.generic.x			= 320;
ADDRGP4 soundOptionsInfo+416+12
CNSTI4 320
ASGNI4
line 175
;175:	soundOptionsInfo.banner.generic.y			= 16;
ADDRGP4 soundOptionsInfo+416+16
CNSTI4 16
ASGNI4
line 176
;176:	soundOptionsInfo.banner.string				= "SYSTEM SETUP";
ADDRGP4 soundOptionsInfo+416+60
ADDRGP4 $133
ASGNP4
line 177
;177:	soundOptionsInfo.banner.color				= color_white;
ADDRGP4 soundOptionsInfo+416+68
ADDRGP4 color_white
ASGNP4
line 178
;178:	soundOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 soundOptionsInfo+416+64
CNSTI4 1
ASGNI4
line 180
;179:
;180:	soundOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+488
CNSTI4 6
ASGNI4
line 181
;181:	soundOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 soundOptionsInfo+488+4
ADDRGP4 $141
ASGNP4
line 182
;182:	soundOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+488+44
CNSTU4 16384
ASGNU4
line 183
;183:	soundOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 soundOptionsInfo+488+12
CNSTI4 0
ASGNI4
line 184
;184:	soundOptionsInfo.framel.generic.y			= 78;
ADDRGP4 soundOptionsInfo+488+16
CNSTI4 78
ASGNI4
line 185
;185:	soundOptionsInfo.framel.width				= 256;
ADDRGP4 soundOptionsInfo+488+76
CNSTI4 256
ASGNI4
line 186
;186:	soundOptionsInfo.framel.height				= 329;
ADDRGP4 soundOptionsInfo+488+80
CNSTI4 329
ASGNI4
line 188
;187:
;188:	soundOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+576
CNSTI4 6
ASGNI4
line 189
;189:	soundOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 soundOptionsInfo+576+4
ADDRGP4 $155
ASGNP4
line 190
;190:	soundOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+576+44
CNSTU4 16384
ASGNU4
line 191
;191:	soundOptionsInfo.framer.generic.x			= 376;
ADDRGP4 soundOptionsInfo+576+12
CNSTI4 376
ASGNI4
line 192
;192:	soundOptionsInfo.framer.generic.y			= 76;
ADDRGP4 soundOptionsInfo+576+16
CNSTI4 76
ASGNI4
line 193
;193:	soundOptionsInfo.framer.width				= 256;
ADDRGP4 soundOptionsInfo+576+76
CNSTI4 256
ASGNI4
line 194
;194:	soundOptionsInfo.framer.height				= 334;
ADDRGP4 soundOptionsInfo+576+80
CNSTI4 334
ASGNI4
line 196
;195:
;196:	soundOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+664
CNSTI4 9
ASGNI4
line 197
;197:	soundOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+664+44
CNSTU4 272
ASGNU4
line 198
;198:	soundOptionsInfo.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 soundOptionsInfo+664+8
CNSTI4 10
ASGNI4
line 199
;199:	soundOptionsInfo.graphics.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+664+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 200
;200:	soundOptionsInfo.graphics.generic.x			= 216;
ADDRGP4 soundOptionsInfo+664+12
CNSTI4 216
ASGNI4
line 201
;201:	soundOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+664+16
CNSTI4 186
ASGNI4
line 202
;202:	soundOptionsInfo.graphics.string			= "GRAPHICS";
ADDRGP4 soundOptionsInfo+664+60
ADDRGP4 $179
ASGNP4
line 203
;203:	soundOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+664+64
CNSTI4 2
ASGNI4
line 204
;204:	soundOptionsInfo.graphics.color				= color_red;
ADDRGP4 soundOptionsInfo+664+68
ADDRGP4 color_red
ASGNP4
line 206
;205:
;206:	soundOptionsInfo.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+736
CNSTI4 9
ASGNI4
line 207
;207:	soundOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+736+44
CNSTU4 272
ASGNU4
line 208
;208:	soundOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 soundOptionsInfo+736+8
CNSTI4 11
ASGNI4
line 209
;209:	soundOptionsInfo.display.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+736+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 210
;210:	soundOptionsInfo.display.generic.x			= 216;
ADDRGP4 soundOptionsInfo+736+12
CNSTI4 216
ASGNI4
line 211
;211:	soundOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+736+16
CNSTI4 213
ASGNI4
line 212
;212:	soundOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 soundOptionsInfo+736+60
ADDRGP4 $197
ASGNP4
line 213
;213:	soundOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+736+64
CNSTI4 2
ASGNI4
line 214
;214:	soundOptionsInfo.display.color				= color_red;
ADDRGP4 soundOptionsInfo+736+68
ADDRGP4 color_red
ASGNP4
line 216
;215:
;216:	soundOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+808
CNSTI4 9
ASGNI4
line 217
;217:	soundOptionsInfo.sound.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 soundOptionsInfo+808+44
CNSTU4 16
ASGNU4
line 218
;218:	soundOptionsInfo.sound.generic.id			= ID_SOUND;
ADDRGP4 soundOptionsInfo+808+8
CNSTI4 12
ASGNI4
line 219
;219:	soundOptionsInfo.sound.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+808+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 220
;220:	soundOptionsInfo.sound.generic.x			= 216;
ADDRGP4 soundOptionsInfo+808+12
CNSTI4 216
ASGNI4
line 221
;221:	soundOptionsInfo.sound.generic.y			= 240;
ADDRGP4 soundOptionsInfo+808+16
CNSTI4 240
ASGNI4
line 222
;222:	soundOptionsInfo.sound.string				= "SOUND";
ADDRGP4 soundOptionsInfo+808+60
ADDRGP4 $215
ASGNP4
line 223
;223:	soundOptionsInfo.sound.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+808+64
CNSTI4 2
ASGNI4
line 224
;224:	soundOptionsInfo.sound.color				= color_red;
ADDRGP4 soundOptionsInfo+808+68
ADDRGP4 color_red
ASGNP4
line 226
;225:
;226:	soundOptionsInfo.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+880
CNSTI4 9
ASGNI4
line 227
;227:	soundOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+880+44
CNSTU4 272
ASGNU4
line 228
;228:	soundOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 soundOptionsInfo+880+8
CNSTI4 13
ASGNI4
line 229
;229:	soundOptionsInfo.network.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+880+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 230
;230:	soundOptionsInfo.network.generic.x			= 216;
ADDRGP4 soundOptionsInfo+880+12
CNSTI4 216
ASGNI4
line 231
;231:	soundOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+880+16
CNSTI4 267
ASGNI4
line 232
;232:	soundOptionsInfo.network.string				= "NETWORK";
ADDRGP4 soundOptionsInfo+880+60
ADDRGP4 $233
ASGNP4
line 233
;233:	soundOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+880+64
CNSTI4 2
ASGNI4
line 234
;234:	soundOptionsInfo.network.color				= color_red;
ADDRGP4 soundOptionsInfo+880+68
ADDRGP4 color_red
ASGNP4
line 236
;235:
;236:	y = 240 - 1.5 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 213
ASGNI4
line 237
;237:	soundOptionsInfo.sfxvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+952
CNSTI4 1
ASGNI4
line 238
;238:	soundOptionsInfo.sfxvolume.generic.name		= "Effects Volume:";
ADDRGP4 soundOptionsInfo+952+4
ADDRGP4 $241
ASGNP4
line 239
;239:	soundOptionsInfo.sfxvolume.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+952+44
CNSTU4 258
ASGNU4
line 240
;240:	soundOptionsInfo.sfxvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+952+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 241
;241:	soundOptionsInfo.sfxvolume.generic.id		= ID_EFFECTSVOLUME;
ADDRGP4 soundOptionsInfo+952+8
CNSTI4 14
ASGNI4
line 242
;242:	soundOptionsInfo.sfxvolume.generic.x		= 400;
ADDRGP4 soundOptionsInfo+952+12
CNSTI4 400
ASGNI4
line 243
;243:	soundOptionsInfo.sfxvolume.generic.y		= y;
ADDRGP4 soundOptionsInfo+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 244
;244:	soundOptionsInfo.sfxvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+952+60
CNSTF4 0
ASGNF4
line 245
;245:	soundOptionsInfo.sfxvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+952+64
CNSTF4 1092616192
ASGNF4
line 247
;246:
;247:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 248
;248:	soundOptionsInfo.musicvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+1028
CNSTI4 1
ASGNI4
line 249
;249:	soundOptionsInfo.musicvolume.generic.name		= "Music Volume:";
ADDRGP4 soundOptionsInfo+1028+4
ADDRGP4 $259
ASGNP4
line 250
;250:	soundOptionsInfo.musicvolume.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1028+44
CNSTU4 258
ASGNU4
line 251
;251:	soundOptionsInfo.musicvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1028+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 252
;252:	soundOptionsInfo.musicvolume.generic.id			= ID_MUSICVOLUME;
ADDRGP4 soundOptionsInfo+1028+8
CNSTI4 15
ASGNI4
line 253
;253:	soundOptionsInfo.musicvolume.generic.x			= 400;
ADDRGP4 soundOptionsInfo+1028+12
CNSTI4 400
ASGNI4
line 254
;254:	soundOptionsInfo.musicvolume.generic.y			= y;
ADDRGP4 soundOptionsInfo+1028+16
ADDRLP4 0
INDIRI4
ASGNI4
line 255
;255:	soundOptionsInfo.musicvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+1028+60
CNSTF4 0
ASGNF4
line 256
;256:	soundOptionsInfo.musicvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+1028+64
CNSTF4 1092616192
ASGNF4
line 258
;257:
;258:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 259
;259:	soundOptionsInfo.quality.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 soundOptionsInfo+1104
CNSTI4 3
ASGNI4
line 260
;260:	soundOptionsInfo.quality.generic.name		= "Sound Quality:";
ADDRGP4 soundOptionsInfo+1104+4
ADDRGP4 $277
ASGNP4
line 261
;261:	soundOptionsInfo.quality.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1104+44
CNSTU4 258
ASGNU4
line 262
;262:	soundOptionsInfo.quality.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1104+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 263
;263:	soundOptionsInfo.quality.generic.id			= ID_QUALITY;
ADDRGP4 soundOptionsInfo+1104+8
CNSTI4 16
ASGNI4
line 264
;264:	soundOptionsInfo.quality.generic.x			= 400;
ADDRGP4 soundOptionsInfo+1104+12
CNSTI4 400
ASGNI4
line 265
;265:	soundOptionsInfo.quality.generic.y			= y;
ADDRGP4 soundOptionsInfo+1104+16
ADDRLP4 0
INDIRI4
ASGNI4
line 266
;266:	soundOptionsInfo.quality.itemnames			= quality_items;
ADDRGP4 soundOptionsInfo+1104+76
ADDRGP4 quality_items
ASGNP4
line 277
;267:/*
;268:	y += BIGCHAR_HEIGHT+2;
;269:	soundOptionsInfo.a3d.generic.type			= MTYPE_RADIOBUTTON;
;270:	soundOptionsInfo.a3d.generic.name			= "A3D:";
;271:	soundOptionsInfo.a3d.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;272:	soundOptionsInfo.a3d.generic.callback		= UI_SoundOptionsMenu_Event;
;273:	soundOptionsInfo.a3d.generic.id				= ID_A3D;
;274:	soundOptionsInfo.a3d.generic.x				= 400;
;275:	soundOptionsInfo.a3d.generic.y				= y;
;276:*/
;277:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 278
;278:	soundOptionsInfo.openal.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 soundOptionsInfo+1200
CNSTI4 5
ASGNI4
line 279
;279:	soundOptionsInfo.openal.generic.name			= "OpenAL:";
ADDRGP4 soundOptionsInfo+1200+4
ADDRGP4 $293
ASGNP4
line 280
;280:	soundOptionsInfo.openal.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1200+44
CNSTU4 258
ASGNU4
line 281
;281:	soundOptionsInfo.openal.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1200+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 282
;282:	soundOptionsInfo.openal.generic.id				= ID_OPENAL;
ADDRGP4 soundOptionsInfo+1200+8
CNSTI4 18
ASGNI4
line 283
;283:	soundOptionsInfo.openal.generic.x				= 400;
ADDRGP4 soundOptionsInfo+1200+12
CNSTI4 400
ASGNI4
line 284
;284:	soundOptionsInfo.openal.generic.y				= y;
ADDRGP4 soundOptionsInfo+1200+16
ADDRLP4 0
INDIRI4
ASGNI4
line 286
;285:
;286:	soundOptionsInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+1264
CNSTI4 6
ASGNI4
line 287
;287:	soundOptionsInfo.back.generic.name			= ART_BACK0;
ADDRGP4 soundOptionsInfo+1264+4
ADDRGP4 $307
ASGNP4
line 288
;288:	soundOptionsInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1264+44
CNSTU4 260
ASGNU4
line 289
;289:	soundOptionsInfo.back.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1264+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 290
;290:	soundOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 soundOptionsInfo+1264+8
CNSTI4 19
ASGNI4
line 291
;291:	soundOptionsInfo.back.generic.x				= 0;
ADDRGP4 soundOptionsInfo+1264+12
CNSTI4 0
ASGNI4
line 292
;292:	soundOptionsInfo.back.generic.y				= 480-64;
ADDRGP4 soundOptionsInfo+1264+16
CNSTI4 416
ASGNI4
line 293
;293:	soundOptionsInfo.back.width					= 128;
ADDRGP4 soundOptionsInfo+1264+76
CNSTI4 128
ASGNI4
line 294
;294:	soundOptionsInfo.back.height				= 64;
ADDRGP4 soundOptionsInfo+1264+80
CNSTI4 64
ASGNI4
line 295
;295:	soundOptionsInfo.back.focuspic				= ART_BACK1;
ADDRGP4 soundOptionsInfo+1264+60
ADDRGP4 $324
ASGNP4
line 297
;296:
;297:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.banner );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 298
;298:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framel );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 299
;299:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framer );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 300
;300:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.graphics );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 301
;301:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.display );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 302
;302:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 303
;303:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.network );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 304
;304:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sfxvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 305
;305:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.musicvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1028
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 306
;306:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.quality );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 309
;307://	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.a3d );
;308://	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.openal );
;309:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.back );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1264
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 311
;310:
;311:	soundOptionsInfo.sfxvolume.curvalue = trap_Cvar_VariableValue( "s_volume" ) * 10;
ADDRGP4 $93
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+952+68
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 312
;312:	soundOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue( "s_musicvolume" ) * 10;
ADDRGP4 $97
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1028+68
CNSTF4 1092616192
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 313
;313:	soundOptionsInfo.quality.curvalue = !trap_Cvar_VariableValue( "s_compression" );
ADDRGP4 $106
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $343
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $344
ADDRGP4 soundOptionsInfo+1104+64
ADDRLP4 12
INDIRI4
ASGNI4
line 315
;314://	soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_usingA3D" );
;315:	soundOptionsInfo.openal.curvalue = (int)trap_Cvar_VariableValue( "s_useopenal" );
ADDRGP4 $117
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1200+60
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 316
;316:}
LABELV $121
endproc UI_SoundOptionsMenu_Init 24 12
export UI_SoundOptionsMenu_Cache
proc UI_SoundOptionsMenu_Cache 0 4
line 324
;317:
;318:
;319:/*
;320:===============
;321:UI_SoundOptionsMenu_Cache
;322:===============
;323:*/
;324:void UI_SoundOptionsMenu_Cache( void ) {
line 325
;325:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $141
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 326
;326:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $155
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 327
;327:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $307
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 328
;328:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $324
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 329
;329:}
LABELV $347
endproc UI_SoundOptionsMenu_Cache 0 4
export UI_SoundOptionsMenu
proc UI_SoundOptionsMenu 0 8
line 337
;330:
;331:
;332:/*
;333:===============
;334:UI_SoundOptionsMenu
;335:===============
;336:*/
;337:void UI_SoundOptionsMenu( void ) {
line 338
;338:	UI_SoundOptionsMenu_Init();
ADDRGP4 UI_SoundOptionsMenu_Init
CALLV
pop
line 339
;339:	UI_PushMenu( &soundOptionsInfo.menu );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 340
;340:	Menu_SetCursorToItem( &soundOptionsInfo.menu, &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+808
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 341
;341:}
LABELV $348
endproc UI_SoundOptionsMenu 0 8
bss
align 4
LABELV soundOptionsInfo
skip 1352
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
LABELV $324
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
LABELV $307
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
LABELV $293
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 65
byte 1 76
byte 1 58
byte 1 0
align 1
LABELV $277
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $259
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $241
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $233
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $215
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $197
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $179
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
LABELV $155
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
LABELV $141
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
LABELV $133
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
LABELV $117
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $114
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $113
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $107
byte 1 115
byte 1 110
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
LABELV $106
byte 1 115
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $105
byte 1 115
byte 1 95
byte 1 107
byte 1 104
byte 1 122
byte 1 0
align 1
LABELV $97
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $79
byte 1 76
byte 1 111
byte 1 119
byte 1 0
