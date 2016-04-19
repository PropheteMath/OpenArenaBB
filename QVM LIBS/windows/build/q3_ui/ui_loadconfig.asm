code
proc LoadConfig_MenuEvent 12 8
file "../../../code/q3_ui/ui_loadconfig.c"
line 84
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
;26:LOAD CONFIG MENU
;27:
;28:=============================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:
;34:#define ART_BACK0			"menu/art_blueish/back_0"
;35:#define ART_BACK1			"menu/art_blueish/back_1"
;36:#define ART_FIGHT0			"menu/art_blueish/load_0"
;37:#define ART_FIGHT1			"menu/art_blueish/load_1"
;38:#define ART_FRAMEL			"menu/art_blueish/frame2_l"
;39:#define ART_FRAMER			"menu/art_blueish/frame1_r"
;40:#define ART_ARROWS			"menu/art_blueish/arrows_horz_0"
;41:#define ART_ARROWLEFT		"menu/art_blueish/arrows_horz_left"
;42:#define ART_ARROWRIGHT		"menu/art_blueish/arrows_horz_right"
;43:
;44:#define MAX_CONFIGS			128
;45:#define NAMEBUFSIZE			( MAX_CONFIGS * 16 )
;46:
;47:#define ID_BACK				10
;48:#define ID_GO				11
;49:#define ID_LIST				12
;50:#define ID_LEFT				13
;51:#define ID_RIGHT			14
;52:
;53:#define ARROWS_WIDTH		128
;54:#define ARROWS_HEIGHT		48
;55:
;56:
;57:typedef struct {
;58:	menuframework_s	menu;
;59:
;60:	menutext_s		banner;
;61:	menubitmap_s	framel;
;62:	menubitmap_s	framer;
;63:
;64:	menulist_s		list;
;65:
;66:	menubitmap_s	arrows;
;67:	menubitmap_s	left;
;68:	menubitmap_s	right;
;69:	menubitmap_s	back;
;70:	menubitmap_s	go;
;71:
;72:	char			names[NAMEBUFSIZE];
;73:	char*			configlist[MAX_CONFIGS];
;74:} configs_t;
;75:
;76:static configs_t	s_configs;
;77:
;78:
;79:/*
;80:===============
;81:LoadConfig_MenuEvent
;82:===============
;83:*/
;84:static void LoadConfig_MenuEvent( void *ptr, int event ) {
line 85
;85:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 86
;86:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 89
;87:	}
;88:
;89:	switch ( ((menucommon_s*)ptr)->id ) {
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
address $93
address $95
code
LABELV $86
line 91
;90:	case ID_GO:
;91:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "exec %s\n", s_configs.list.itemnames[s_configs.list.curvalue] ) );
ADDRGP4 $87
ARGP4
ADDRGP4 s_configs+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+664+76
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
line 92
;92:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 93
;93:		break;
ADDRGP4 $84
JUMPV
LABELV $92
line 96
;94:
;95:	case ID_BACK:
;96:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;97:		break;
ADDRGP4 $84
JUMPV
LABELV $93
line 100
;98:
;99:	case ID_LEFT:
;100:		ScrollList_Key( &s_configs.list, K_LEFTARROW );
ADDRGP4 s_configs+664
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 101
;101:		break;
ADDRGP4 $84
JUMPV
LABELV $95
line 104
;102:
;103:	case ID_RIGHT:
;104:		ScrollList_Key( &s_configs.list, K_RIGHTARROW );
ADDRGP4 s_configs+664
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 105
;105:		break;
LABELV $83
LABELV $84
line 107
;106:	}
;107:}
LABELV $80
endproc LoadConfig_MenuEvent 12 8
proc LoadConfig_MenuInit 24 16
line 115
;108:
;109:
;110:/*
;111:===============
;112:LoadConfig_MenuInit
;113:===============
;114:*/
;115:static void LoadConfig_MenuInit( void ) {
line 120
;116:	int		i;
;117:	int		len;
;118:	char	*configname;
;119:
;120:	UI_LoadConfig_Cache();
ADDRGP4 UI_LoadConfig_Cache
CALLV
pop
line 122
;121:
;122:	memset( &s_configs, 0 ,sizeof(configs_t) );
ADDRGP4 s_configs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 123
;123:	s_configs.menu.wrapAround = qtrue;
ADDRGP4 s_configs+404
CNSTI4 1
ASGNI4
line 124
;124:	s_configs.menu.fullscreen = qtrue;
ADDRGP4 s_configs+408
CNSTI4 1
ASGNI4
line 126
;125:
;126:	s_configs.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_configs+416
CNSTI4 10
ASGNI4
line 127
;127:	s_configs.banner.generic.x		= 320;
ADDRGP4 s_configs+416+12
CNSTI4 320
ASGNI4
line 128
;128:	s_configs.banner.generic.y		= 16;
ADDRGP4 s_configs+416+16
CNSTI4 16
ASGNI4
line 129
;129:	s_configs.banner.string			= "LOAD CONFIG";
ADDRGP4 s_configs+416+60
ADDRGP4 $109
ASGNP4
line 130
;130:	s_configs.banner.color			= color_white;
ADDRGP4 s_configs+416+68
ADDRGP4 color_white
ASGNP4
line 131
;131:	s_configs.banner.style			= UI_CENTER;
ADDRGP4 s_configs+416+64
CNSTI4 1
ASGNI4
line 133
;132:
;133:	s_configs.framel.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+488
CNSTI4 6
ASGNI4
line 134
;134:	s_configs.framel.generic.name	= ART_FRAMEL;
ADDRGP4 s_configs+488+4
ADDRGP4 $117
ASGNP4
line 135
;135:	s_configs.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+488+44
CNSTU4 16384
ASGNU4
line 136
;136:	s_configs.framel.generic.x		= 0;  
ADDRGP4 s_configs+488+12
CNSTI4 0
ASGNI4
line 137
;137:	s_configs.framel.generic.y		= 78;
ADDRGP4 s_configs+488+16
CNSTI4 78
ASGNI4
line 138
;138:	s_configs.framel.width			= 256;
ADDRGP4 s_configs+488+76
CNSTI4 256
ASGNI4
line 139
;139:	s_configs.framel.height			= 329;
ADDRGP4 s_configs+488+80
CNSTI4 329
ASGNI4
line 141
;140:
;141:	s_configs.framer.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+576
CNSTI4 6
ASGNI4
line 142
;142:	s_configs.framer.generic.name	= ART_FRAMER;
ADDRGP4 s_configs+576+4
ADDRGP4 $131
ASGNP4
line 143
;143:	s_configs.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+576+44
CNSTU4 16384
ASGNU4
line 144
;144:	s_configs.framer.generic.x		= 376;
ADDRGP4 s_configs+576+12
CNSTI4 376
ASGNI4
line 145
;145:	s_configs.framer.generic.y		= 76;
ADDRGP4 s_configs+576+16
CNSTI4 76
ASGNI4
line 146
;146:	s_configs.framer.width			= 256;
ADDRGP4 s_configs+576+76
CNSTI4 256
ASGNI4
line 147
;147:	s_configs.framer.height			= 334;
ADDRGP4 s_configs+576+80
CNSTI4 334
ASGNI4
line 149
;148:
;149:	s_configs.arrows.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+760
CNSTI4 6
ASGNI4
line 150
;150:	s_configs.arrows.generic.name	= ART_ARROWS;
ADDRGP4 s_configs+760+4
ADDRGP4 $145
ASGNP4
line 151
;151:	s_configs.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+760+44
CNSTU4 16384
ASGNU4
line 152
;152:	s_configs.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+760+12
CNSTI4 256
ASGNI4
line 153
;153:	s_configs.arrows.generic.y		= 400;
ADDRGP4 s_configs+760+16
CNSTI4 400
ASGNI4
line 154
;154:	s_configs.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_configs+760+76
CNSTI4 128
ASGNI4
line 155
;155:	s_configs.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+760+80
CNSTI4 48
ASGNI4
line 157
;156:
;157:	s_configs.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+848
CNSTI4 6
ASGNI4
line 158
;158:	s_configs.left.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+848+44
CNSTU4 2308
ASGNU4
line 159
;159:	s_configs.left.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+848+12
CNSTI4 256
ASGNI4
line 160
;160:	s_configs.left.generic.y		= 400;
ADDRGP4 s_configs+848+16
CNSTI4 400
ASGNI4
line 161
;161:	s_configs.left.generic.id		= ID_LEFT;
ADDRGP4 s_configs+848+8
CNSTI4 13
ASGNI4
line 162
;162:	s_configs.left.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+848+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 163
;163:	s_configs.left.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+848+76
CNSTI4 64
ASGNI4
line 164
;164:	s_configs.left.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+848+80
CNSTI4 48
ASGNI4
line 165
;165:	s_configs.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_configs+848+60
ADDRGP4 $173
ASGNP4
line 167
;166:
;167:	s_configs.right.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+936
CNSTI4 6
ASGNI4
line 168
;168:	s_configs.right.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+936+44
CNSTU4 2308
ASGNU4
line 169
;169:	s_configs.right.generic.x		= 320;
ADDRGP4 s_configs+936+12
CNSTI4 320
ASGNI4
line 170
;170:	s_configs.right.generic.y		= 400;
ADDRGP4 s_configs+936+16
CNSTI4 400
ASGNI4
line 171
;171:	s_configs.right.generic.id		= ID_RIGHT;
ADDRGP4 s_configs+936+8
CNSTI4 14
ASGNI4
line 172
;172:	s_configs.right.generic.callback = LoadConfig_MenuEvent;
ADDRGP4 s_configs+936+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 173
;173:	s_configs.right.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+936+76
CNSTI4 64
ASGNI4
line 174
;174:	s_configs.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+936+80
CNSTI4 48
ASGNI4
line 175
;175:	s_configs.right.focuspic		= ART_ARROWRIGHT;
ADDRGP4 s_configs+936+60
ADDRGP4 $191
ASGNP4
line 177
;176:
;177:	s_configs.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+1024
CNSTI4 6
ASGNI4
line 178
;178:	s_configs.back.generic.name		= ART_BACK0;
ADDRGP4 s_configs+1024+4
ADDRGP4 $195
ASGNP4
line 179
;179:	s_configs.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+1024+44
CNSTU4 260
ASGNU4
line 180
;180:	s_configs.back.generic.id		= ID_BACK;
ADDRGP4 s_configs+1024+8
CNSTI4 10
ASGNI4
line 181
;181:	s_configs.back.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+1024+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 182
;182:	s_configs.back.generic.x		= 0;
ADDRGP4 s_configs+1024+12
CNSTI4 0
ASGNI4
line 183
;183:	s_configs.back.generic.y		= 480-64;
ADDRGP4 s_configs+1024+16
CNSTI4 416
ASGNI4
line 184
;184:	s_configs.back.width			= 128;
ADDRGP4 s_configs+1024+76
CNSTI4 128
ASGNI4
line 185
;185:	s_configs.back.height			= 64;
ADDRGP4 s_configs+1024+80
CNSTI4 64
ASGNI4
line 186
;186:	s_configs.back.focuspic			= ART_BACK1;
ADDRGP4 s_configs+1024+60
ADDRGP4 $212
ASGNP4
line 188
;187:
;188:	s_configs.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+1112
CNSTI4 6
ASGNI4
line 189
;189:	s_configs.go.generic.name		= ART_FIGHT0;
ADDRGP4 s_configs+1112+4
ADDRGP4 $216
ASGNP4
line 190
;190:	s_configs.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+1112+44
CNSTU4 272
ASGNU4
line 191
;191:	s_configs.go.generic.id			= ID_GO;
ADDRGP4 s_configs+1112+8
CNSTI4 11
ASGNI4
line 192
;192:	s_configs.go.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+1112+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 193
;193:	s_configs.go.generic.x			= 640;
ADDRGP4 s_configs+1112+12
CNSTI4 640
ASGNI4
line 194
;194:	s_configs.go.generic.y			= 480-64;
ADDRGP4 s_configs+1112+16
CNSTI4 416
ASGNI4
line 195
;195:	s_configs.go.width				= 128;
ADDRGP4 s_configs+1112+76
CNSTI4 128
ASGNI4
line 196
;196:	s_configs.go.height				= 64;
ADDRGP4 s_configs+1112+80
CNSTI4 64
ASGNI4
line 197
;197:	s_configs.go.focuspic			= ART_FIGHT1;
ADDRGP4 s_configs+1112+60
ADDRGP4 $233
ASGNP4
line 200
;198:
;199:	// scan for configs
;200:	s_configs.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_configs+664
CNSTI4 8
ASGNI4
line 201
;201:	s_configs.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+664+44
CNSTU4 256
ASGNU4
line 202
;202:	s_configs.list.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+664+48
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 203
;203:	s_configs.list.generic.id		= ID_LIST;
ADDRGP4 s_configs+664+8
CNSTI4 12
ASGNI4
line 204
;204:	s_configs.list.generic.x		= 118;
ADDRGP4 s_configs+664+12
CNSTI4 118
ASGNI4
line 205
;205:	s_configs.list.generic.y		= 130;
ADDRGP4 s_configs+664+16
CNSTI4 130
ASGNI4
line 206
;206:	s_configs.list.width			= 16;
ADDRGP4 s_configs+664+80
CNSTI4 16
ASGNI4
line 207
;207:	s_configs.list.height			= 14;
ADDRGP4 s_configs+664+84
CNSTI4 14
ASGNI4
line 208
;208:	s_configs.list.numitems			= trap_FS_GetFileList( "", "cfg", s_configs.names, NAMEBUFSIZE );
ADDRGP4 $251
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 s_configs+1200
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_configs+664+68
ADDRLP4 12
INDIRI4
ASGNI4
line 209
;209:	s_configs.list.itemnames		= (const char **)s_configs.configlist;
ADDRGP4 s_configs+664+76
ADDRGP4 s_configs+3248
ASGNP4
line 210
;210:	s_configs.list.columns			= 3;
ADDRGP4 s_configs+664+88
CNSTI4 3
ASGNI4
line 212
;211:
;212:	if (!s_configs.list.numitems) {
ADDRGP4 s_configs+664+68
INDIRI4
CNSTI4 0
NEI4 $259
line 213
;213:		strcpy(s_configs.names,"No Files Found.");
ADDRGP4 s_configs+1200
ARGP4
ADDRGP4 $264
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 214
;214:		s_configs.list.numitems = 1;
ADDRGP4 s_configs+664+68
CNSTI4 1
ASGNI4
line 217
;215:
;216:		//degenerate case, not selectable
;217:		s_configs.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 s_configs+1112+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 218
;218:	}
ADDRGP4 $260
JUMPV
LABELV $259
line 219
;219:	else if (s_configs.list.numitems > MAX_CONFIGS)
ADDRGP4 s_configs+664+68
INDIRI4
CNSTI4 128
LEI4 $269
line 220
;220:		s_configs.list.numitems = MAX_CONFIGS;
ADDRGP4 s_configs+664+68
CNSTI4 128
ASGNI4
LABELV $269
LABELV $260
line 222
;221:	
;222:	configname = s_configs.names;
ADDRLP4 0
ADDRGP4 s_configs+1200
ASGNP4
line 223
;223:	for ( i = 0; i < s_configs.list.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $276
line 224
;224:		s_configs.list.itemnames[i] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+664+76
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 227
;225:		
;226:		// strip extension
;227:		len = strlen( configname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 228
;228:		if (!Q_stricmp(configname +  len - 4,".cfg"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $284
line 229
;229:			configname[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $284
line 231
;230:
;231:		Q_strupr(configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 233
;232:
;233:		configname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 234
;234:	}
LABELV $277
line 223
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $279
ADDRLP4 8
INDIRI4
ADDRGP4 s_configs+664+68
INDIRI4
LTI4 $276
line 236
;235:
;236:	Menu_AddItem( &s_configs.menu, &s_configs.banner );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 237
;237:	Menu_AddItem( &s_configs.menu, &s_configs.framel );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 238
;238:	Menu_AddItem( &s_configs.menu, &s_configs.framer );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 239
;239:	Menu_AddItem( &s_configs.menu, &s_configs.list );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 240
;240:	Menu_AddItem( &s_configs.menu, &s_configs.arrows );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 241
;241:	Menu_AddItem( &s_configs.menu, &s_configs.left );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 242
;242:	Menu_AddItem( &s_configs.menu, &s_configs.right );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+936
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 243
;243:	Menu_AddItem( &s_configs.menu, &s_configs.back );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 244
;244:	Menu_AddItem( &s_configs.menu, &s_configs.go );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 245
;245:}
LABELV $99
endproc LoadConfig_MenuInit 24 16
export UI_LoadConfig_Cache
proc UI_LoadConfig_Cache 0 4
line 252
;246:
;247:/*
;248:=================
;249:UI_LoadConfig_Cache
;250:=================
;251:*/
;252:void UI_LoadConfig_Cache( void ) {
line 253
;253:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $195
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 254
;254:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $212
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 255
;255:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 256
;256:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $233
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 257
;257:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $117
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 258
;258:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $131
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 259
;259:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $145
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 260
;260:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $173
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 261
;261:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $191
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 262
;262:}
LABELV $296
endproc UI_LoadConfig_Cache 0 4
export UI_LoadConfigMenu
proc UI_LoadConfigMenu 0 4
line 270
;263:
;264:
;265:/*
;266:===============
;267:UI_LoadConfigMenu
;268:===============
;269:*/
;270:void UI_LoadConfigMenu( void ) {
line 271
;271:	LoadConfig_MenuInit();
ADDRGP4 LoadConfig_MenuInit
CALLV
pop
line 272
;272:	UI_PushMenu( &s_configs.menu );
ADDRGP4 s_configs
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 273
;273:}
LABELV $297
endproc UI_LoadConfigMenu 0 4
bss
align 4
LABELV s_configs
skip 3760
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
LABELV $286
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $264
byte 1 78
byte 1 111
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
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
LABELV $252
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $251
byte 1 0
align 1
LABELV $233
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
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $216
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
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $212
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
LABELV $195
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
LABELV $191
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $173
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $145
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $131
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
LABELV $117
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
LABELV $109
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $87
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
