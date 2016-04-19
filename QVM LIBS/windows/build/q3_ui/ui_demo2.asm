code
proc Demos_MenuEvent 12 8
file "../../../code/q3_ui/ui_demo2.c"
line 86
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
;26:DEMOS MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define ART_BACK0			"menu/art_blueish/back_0"
;36:#define ART_BACK1			"menu/art_blueish/back_1"
;37:#define ART_GO0				"menu/art_blueish/play_0"
;38:#define ART_GO1				"menu/art_blueish/play_1"
;39:#define ART_FRAMEL			"menu/art_blueish/frame2_l"
;40:#define ART_FRAMER			"menu/art_blueish/frame1_r"
;41:#define ART_ARROWS			"menu/art_blueish/arrows_vert_0"
;42:#define ART_ARROWUP		"menu/art_blueish/arrows_vert_top"
;43:#define ART_ARROWDN		"menu/art_blueish/arrows_vert_bot"
;44:
;45:#define MAX_DEMOS			128
;46:#define NAMEBUFSIZE			( MAX_DEMOS * 16 )
;47:
;48:#define ID_BACK				10
;49:#define ID_GO				11
;50:#define ID_LIST				12
;51:#define ID_SCROLLDN			13
;52:#define ID_SCROLLUP				14
;53:
;54:#define ARROWS_WIDTH		128
;55:#define ARROWS_HEIGHT		48
;56:
;57:
;58:typedef struct {
;59:	menuframework_s	menu;
;60:
;61:	menutext_s		banner;
;62:	menubitmap_s	framel;
;63:	menubitmap_s	framer;
;64:
;65:	menulist_s		list;
;66:
;67:	menubitmap_s	arrows;
;68:	menubitmap_s	left;
;69:	menubitmap_s	right;
;70:	menubitmap_s	back;
;71:	menubitmap_s	go;
;72:
;73:	int				numDemos;
;74:	char			names[NAMEBUFSIZE];
;75:	char			*demolist[MAX_DEMOS];
;76:} demos_t;
;77:
;78:static demos_t	s_demos;
;79:
;80:
;81:/*
;82:===============
;83:Demos_MenuEvent
;84:===============
;85:*/
;86:static void Demos_MenuEvent( void *ptr, int event ) {
line 87
;87:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 88
;88:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 91
;89:	}
;90:
;91:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $97-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $97
address $92
address $86
address $83
address $95
address $93
code
LABELV $86
line 93
;92:	case ID_GO:
;93:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 94
;94:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "demo %s\n",
ADDRGP4 $87
ARGP4
ADDRGP4 s_demos+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+664+76
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 96
;95:								s_demos.list.itemnames[s_demos.list.curvalue]) );
;96:		break;
ADDRGP4 $84
JUMPV
LABELV $92
line 98
;97:	case ID_BACK:
;98:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 99
;99:		break;
ADDRGP4 $84
JUMPV
LABELV $93
line 102
;100:
;101:	case ID_SCROLLUP:
;102:		ScrollList_Key( &s_demos.list, K_UPARROW );
ADDRGP4 s_demos+664
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 103
;103:		break;
ADDRGP4 $84
JUMPV
LABELV $95
line 106
;104:
;105:	case ID_SCROLLDN:
;106:		ScrollList_Key( &s_demos.list, K_DOWNARROW );
ADDRGP4 s_demos+664
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 107
;107:                break;
LABELV $83
LABELV $84
line 110
;108:
;109:	}
;110:}
LABELV $80
endproc Demos_MenuEvent 12 8
proc UI_DemosMenu_Key 12 8
line 118
;111:
;112:
;113:/*
;114:=================
;115:UI_DemosMenu_Key
;116:=================
;117:*/
;118:static sfxHandle_t UI_DemosMenu_Key( int key ) {
line 121
;119:	menucommon_s	*item;
;120:
;121:        item = Menu_ItemAtCursor( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 123
;122:
;123:        if( key == K_MWHEELUP ) {
ADDRFP4 0
INDIRI4
CNSTI4 184
NEI4 $100
line 124
;124:            ScrollList_Key( &s_demos.list, K_UPARROW );
ADDRGP4 s_demos+664
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 125
;125:        }
LABELV $100
line 127
;126:
;127:        if( key == K_MWHEELDOWN ) {
ADDRFP4 0
INDIRI4
CNSTI4 183
NEI4 $103
line 128
;128:            ScrollList_Key( &s_demos.list, K_DOWNARROW );
ADDRGP4 s_demos+664
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 129
;129:        }
LABELV $103
line 131
;130:
;131:	return Menu_DefaultKey( &s_demos.menu, key );
ADDRGP4 s_demos
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $99
endproc UI_DemosMenu_Key 12 8
proc meowdrawdemo 0 4
line 135
;132:}
;133:
;134:
;135:static void meowdrawdemo( void ) {
line 136
;136:    Menu_Draw(&s_demos.menu);
ADDRGP4 s_demos
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 137
;137:}
LABELV $106
endproc meowdrawdemo 0 4
proc Demos_MenuInit 60 16
line 144
;138:
;139:/*
;140:===============
;141:Demos_MenuInit
;142:===============
;143:*/
;144:static void Demos_MenuInit( void ) {
line 149
;145:	int		i;
;146:	int		len;
;147:	char	*demoname, extension[32];
;148:
;149:	memset( &s_demos, 0 ,sizeof(demos_t) );
ADDRGP4 s_demos
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3764
ARGI4
ADDRGP4 memset
CALLP4
pop
line 150
;150:	s_demos.menu.key = UI_DemosMenu_Key;
ADDRGP4 s_demos+400
ADDRGP4 UI_DemosMenu_Key
ASGNP4
line 152
;151:
;152:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 154
;153:
;154:	s_demos.menu.fullscreen = qtrue;
ADDRGP4 s_demos+408
CNSTI4 1
ASGNI4
line 155
;155:        s_demos.menu.wrapAround = qtrue;
ADDRGP4 s_demos+404
CNSTI4 1
ASGNI4
line 156
;156:        s_demos.menu.draw = meowdrawdemo;
ADDRGP4 s_demos+396
ADDRGP4 meowdrawdemo
ASGNP4
line 158
;157:
;158:	s_demos.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_demos+416
CNSTI4 10
ASGNI4
line 159
;159:	s_demos.banner.generic.x		= 320;
ADDRGP4 s_demos+416+12
CNSTI4 320
ASGNI4
line 160
;160:	s_demos.banner.generic.y		= 16;
ADDRGP4 s_demos+416+16
CNSTI4 16
ASGNI4
line 161
;161:	s_demos.banner.string			= "DEMOS";
ADDRGP4 s_demos+416+60
ADDRGP4 $119
ASGNP4
line 162
;162:	s_demos.banner.color			= color_white;
ADDRGP4 s_demos+416+68
ADDRGP4 color_white
ASGNP4
line 163
;163:	s_demos.banner.style			= UI_CENTER;
ADDRGP4 s_demos+416+64
CNSTI4 1
ASGNI4
line 165
;164:
;165:	s_demos.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+488
CNSTI4 6
ASGNI4
line 166
;166:	s_demos.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_demos+488+4
ADDRGP4 $127
ASGNP4
line 167
;167:	s_demos.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+488+44
CNSTU4 16384
ASGNU4
line 168
;168:	s_demos.framel.generic.x		= 0;
ADDRGP4 s_demos+488+12
CNSTI4 0
ASGNI4
line 169
;169:	s_demos.framel.generic.y		= 78;
ADDRGP4 s_demos+488+16
CNSTI4 78
ASGNI4
line 170
;170:	s_demos.framel.width			= 256;
ADDRGP4 s_demos+488+76
CNSTI4 256
ASGNI4
line 171
;171:	s_demos.framel.height			= 329;
ADDRGP4 s_demos+488+80
CNSTI4 329
ASGNI4
line 173
;172:
;173:	s_demos.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+576
CNSTI4 6
ASGNI4
line 174
;174:	s_demos.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_demos+576+4
ADDRGP4 $141
ASGNP4
line 175
;175:	s_demos.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+576+44
CNSTU4 16384
ASGNU4
line 176
;176:	s_demos.framer.generic.x		= 376;
ADDRGP4 s_demos+576+12
CNSTI4 376
ASGNI4
line 177
;177:	s_demos.framer.generic.y		= 76;
ADDRGP4 s_demos+576+16
CNSTI4 76
ASGNI4
line 178
;178:	s_demos.framer.width			= 256;
ADDRGP4 s_demos+576+76
CNSTI4 256
ASGNI4
line 179
;179:	s_demos.framer.height			= 334;
ADDRGP4 s_demos+576+80
CNSTI4 334
ASGNI4
line 181
;180:
;181:	s_demos.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+760
CNSTI4 6
ASGNI4
line 182
;182:	s_demos.arrows.generic.name		= ART_ARROWS;
ADDRGP4 s_demos+760+4
ADDRGP4 $155
ASGNP4
line 183
;183:	s_demos.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+760+44
CNSTU4 16384
ASGNU4
line 184
;184:	s_demos.arrows.generic.x		= 512+48+12;
ADDRGP4 s_demos+760+12
CNSTI4 572
ASGNI4
line 185
;185:	s_demos.arrows.generic.y		= 240-64+48;
ADDRGP4 s_demos+760+16
CNSTI4 224
ASGNI4
line 186
;186:	s_demos.arrows.width			= 64;
ADDRGP4 s_demos+760+76
CNSTI4 64
ASGNI4
line 187
;187:	s_demos.arrows.height			= 128;
ADDRGP4 s_demos+760+80
CNSTI4 128
ASGNI4
line 189
;188:
;189:	s_demos.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+848
CNSTI4 6
ASGNI4
line 190
;190:	s_demos.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+848+44
CNSTU4 2308
ASGNU4
line 191
;191:	s_demos.left.generic.x			= 512+48+12;
ADDRGP4 s_demos+848+12
CNSTI4 572
ASGNI4
line 192
;192:	s_demos.left.generic.y			= 240-64+48;
ADDRGP4 s_demos+848+16
CNSTI4 224
ASGNI4
line 193
;193:	s_demos.left.generic.id			= ID_SCROLLUP;
ADDRGP4 s_demos+848+8
CNSTI4 14
ASGNI4
line 194
;194:	s_demos.left.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+848+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 195
;195:	s_demos.left.width				= 64;
ADDRGP4 s_demos+848+76
CNSTI4 64
ASGNI4
line 196
;196:	s_demos.left.height				= 64;
ADDRGP4 s_demos+848+80
CNSTI4 64
ASGNI4
line 197
;197:	s_demos.left.focuspic			= ART_ARROWUP;
ADDRGP4 s_demos+848+60
ADDRGP4 $183
ASGNP4
line 199
;198:
;199:	s_demos.right.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+936
CNSTI4 6
ASGNI4
line 200
;200:	s_demos.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+936+44
CNSTU4 2308
ASGNU4
line 201
;201:	s_demos.right.generic.x			= 512+48+12;
ADDRGP4 s_demos+936+12
CNSTI4 572
ASGNI4
line 202
;202:	s_demos.right.generic.y			= 240+48;
ADDRGP4 s_demos+936+16
CNSTI4 288
ASGNI4
line 203
;203:	s_demos.right.generic.id		= ID_SCROLLDN;
ADDRGP4 s_demos+936+8
CNSTI4 13
ASGNI4
line 204
;204:	s_demos.right.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+936+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 205
;205:	s_demos.right.width				= 64;
ADDRGP4 s_demos+936+76
CNSTI4 64
ASGNI4
line 206
;206:	s_demos.right.height			= 64;
ADDRGP4 s_demos+936+80
CNSTI4 64
ASGNI4
line 207
;207:	s_demos.right.focuspic			= ART_ARROWDN;
ADDRGP4 s_demos+936+60
ADDRGP4 $201
ASGNP4
line 209
;208:
;209:	s_demos.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1024
CNSTI4 6
ASGNI4
line 210
;210:	s_demos.back.generic.name		= ART_BACK0;
ADDRGP4 s_demos+1024+4
ADDRGP4 $205
ASGNP4
line 211
;211:	s_demos.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+1024+44
CNSTU4 260
ASGNU4
line 212
;212:	s_demos.back.generic.id			= ID_BACK;
ADDRGP4 s_demos+1024+8
CNSTI4 10
ASGNI4
line 213
;213:	s_demos.back.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1024+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 214
;214:	s_demos.back.generic.x			= 0;
ADDRGP4 s_demos+1024+12
CNSTI4 0
ASGNI4
line 215
;215:	s_demos.back.generic.y			= 480-64;
ADDRGP4 s_demos+1024+16
CNSTI4 416
ASGNI4
line 216
;216:	s_demos.back.width				= 128;
ADDRGP4 s_demos+1024+76
CNSTI4 128
ASGNI4
line 217
;217:	s_demos.back.height				= 64;
ADDRGP4 s_demos+1024+80
CNSTI4 64
ASGNI4
line 218
;218:	s_demos.back.focuspic			= ART_BACK1;
ADDRGP4 s_demos+1024+60
ADDRGP4 $222
ASGNP4
line 220
;219:
;220:	s_demos.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_demos+1112
CNSTI4 6
ASGNI4
line 221
;221:	s_demos.go.generic.name			= ART_GO0;
ADDRGP4 s_demos+1112+4
ADDRGP4 $226
ASGNP4
line 222
;222:	s_demos.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+1112+44
CNSTU4 272
ASGNU4
line 223
;223:	s_demos.go.generic.id			= ID_GO;
ADDRGP4 s_demos+1112+8
CNSTI4 11
ASGNI4
line 224
;224:	s_demos.go.generic.callback		= Demos_MenuEvent;
ADDRGP4 s_demos+1112+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 225
;225:	s_demos.go.generic.x			= 640;
ADDRGP4 s_demos+1112+12
CNSTI4 640
ASGNI4
line 226
;226:	s_demos.go.generic.y			= 480-64;
ADDRGP4 s_demos+1112+16
CNSTI4 416
ASGNI4
line 227
;227:	s_demos.go.width				= 128;
ADDRGP4 s_demos+1112+76
CNSTI4 128
ASGNI4
line 228
;228:	s_demos.go.height				= 64;
ADDRGP4 s_demos+1112+80
CNSTI4 64
ASGNI4
line 229
;229:	s_demos.go.focuspic				= ART_GO1;
ADDRGP4 s_demos+1112+60
ADDRGP4 $243
ASGNP4
line 231
;230:
;231:	s_demos.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_demos+664
CNSTI4 8
ASGNI4
line 232
;232:	s_demos.list.generic.flags		= QMF_HIGHLIGHT_IF_FOCUS|QMF_SMALLFONT;
ADDRGP4 s_demos+664+44
CNSTU4 130
ASGNU4
line 233
;233:	s_demos.list.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+664+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 234
;234:	s_demos.list.generic.id			= ID_LIST;
ADDRGP4 s_demos+664+8
CNSTI4 12
ASGNI4
line 235
;235:	s_demos.list.generic.x			= 22;
ADDRGP4 s_demos+664+12
CNSTI4 22
ASGNI4
line 236
;236:	s_demos.list.generic.y			= 50;
ADDRGP4 s_demos+664+16
CNSTI4 50
ASGNI4
line 237
;237:	s_demos.list.width				= 70;
ADDRGP4 s_demos+664+80
CNSTI4 70
ASGNI4
line 238
;238:	s_demos.list.height				= 23;
ADDRGP4 s_demos+664+84
CNSTI4 23
ASGNI4
line 239
;239:	Com_sprintf(extension, sizeof(extension), "dm_%d", (int)trap_Cvar_VariableValue( "protocol" ) );
ADDRGP4 $260
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $259
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 240
;240:	s_demos.list.numitems			= trap_FS_GetFileList( "demos", extension, s_demos.names, NAMEBUFSIZE );
ADDRGP4 $263
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 s_demos+1204
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 48
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_demos+664+68
ADDRLP4 48
INDIRI4
ASGNI4
line 241
;241:	s_demos.list.itemnames			= (const char **)s_demos.demolist;
ADDRGP4 s_demos+664+76
ADDRGP4 s_demos+3252
ASGNP4
line 244
;242:	//s_demos.list.columns			= 1;
;243:
;244:	if (!s_demos.list.numitems) {
ADDRGP4 s_demos+664+68
INDIRI4
CNSTI4 0
NEI4 $268
line 245
;245:		strcpy( s_demos.names, "No Demos Found." );
ADDRGP4 s_demos+1204
ARGP4
ADDRGP4 $273
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 246
;246:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+664+68
CNSTI4 1
ASGNI4
line 249
;247:
;248:		//degenerate case, not selectable
;249:		s_demos.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 52
ADDRGP4 s_demos+1112+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 250
;250:	}
ADDRGP4 $269
JUMPV
LABELV $268
line 251
;251:	else if (s_demos.list.numitems > MAX_DEMOS)
ADDRGP4 s_demos+664+68
INDIRI4
CNSTI4 128
LEI4 $278
line 252
;252:		s_demos.list.numitems = MAX_DEMOS;
ADDRGP4 s_demos+664+68
CNSTI4 128
ASGNI4
LABELV $278
LABELV $269
line 254
;253:
;254:	demoname = s_demos.names;
ADDRLP4 0
ADDRGP4 s_demos+1204
ASGNP4
line 255
;255:	for ( i = 0; i < s_demos.list.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 256
;256:		s_demos.list.itemnames[i] = demoname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+664+76
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 259
;257:
;258:		// strip extension
;259:		len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 260
;260:		if (!Q_stricmp(demoname +  len - 4,".dm3"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $293
line 261
;261:			demoname[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $293
line 265
;262:
;263://		Q_strupr(demoname);
;264:
;265:		demoname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 266
;266:	}
LABELV $286
line 255
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 8
INDIRI4
ADDRGP4 s_demos+664+68
INDIRI4
LTI4 $285
line 268
;267:
;268:	Menu_AddItem( &s_demos.menu, &s_demos.banner );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 269
;269:	Menu_AddItem( &s_demos.menu, &s_demos.framel );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 270
;270:	Menu_AddItem( &s_demos.menu, &s_demos.framer );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 271
;271:	Menu_AddItem( &s_demos.menu, &s_demos.list );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 272
;272:	Menu_AddItem( &s_demos.menu, &s_demos.arrows );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 273
;273:	Menu_AddItem( &s_demos.menu, &s_demos.left );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 274
;274:	Menu_AddItem( &s_demos.menu, &s_demos.right );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+936
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 275
;275:	Menu_AddItem( &s_demos.menu, &s_demos.back );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 276
;276:	Menu_AddItem( &s_demos.menu, &s_demos.go );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 277
;277:}
LABELV $107
endproc Demos_MenuInit 60 16
export Demos_Cache
proc Demos_Cache 0 4
line 284
;278:
;279:/*
;280:=================
;281:Demos_Cache
;282:=================
;283:*/
;284:void Demos_Cache( void ) {
line 285
;285:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $205
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 286
;286:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $222
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 287
;287:	trap_R_RegisterShaderNoMip( ART_GO0 );
ADDRGP4 $226
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 288
;288:	trap_R_RegisterShaderNoMip( ART_GO1 );
ADDRGP4 $243
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 289
;289:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 290
;290:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $141
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 291
;291:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $155
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 292
;292:	trap_R_RegisterShaderNoMip( ART_ARROWUP );
ADDRGP4 $183
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 293
;293:	trap_R_RegisterShaderNoMip( ART_ARROWDN );
ADDRGP4 $201
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 294
;294:}
LABELV $305
endproc Demos_Cache 0 4
export UI_DemosMenu
proc UI_DemosMenu 0 4
line 301
;295:
;296:/*
;297:===============
;298:UI_DemosMenu
;299:===============
;300:*/
;301:void UI_DemosMenu( void ) {
line 302
;302:	Demos_MenuInit();
ADDRGP4 Demos_MenuInit
CALLV
pop
line 303
;303:	UI_PushMenu( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 304
;304:}
LABELV $306
endproc UI_DemosMenu 0 4
bss
align 4
LABELV s_demos
skip 3764
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
LABELV $295
byte 1 46
byte 1 100
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $273
byte 1 78
byte 1 111
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
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
LABELV $263
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $260
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
LABELV $259
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $226
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $222
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
LABELV $205
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
LABELV $201
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
LABELV $183
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
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $127
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
LABELV $119
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 83
byte 1 0
align 1
LABELV $87
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
