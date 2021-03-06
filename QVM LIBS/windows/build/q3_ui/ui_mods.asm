code
proc UI_Mods_MenuEvent 8 8
file "../../../code/q3_ui/ui_mods.c"
line 71
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
;25:#define ART_BACK0			"menu/art_blueish/back_0"
;26:#define ART_BACK1			"menu/art_blueish/back_1"
;27:#define ART_FIGHT0			"menu/art_blueish/load_0"
;28:#define ART_FIGHT1			"menu/art_blueish/load_1"
;29:#define ART_FRAMEL			"menu/art_blueish/frame2_l"
;30:#define ART_FRAMER			"menu/art_blueish/frame1_r"
;31:
;32:#define MAX_MODS			64
;33:#define NAMEBUFSIZE			( MAX_MODS * 48 )
;34:#define GAMEBUFSIZE			( MAX_MODS * 16 )
;35:
;36:#define ID_BACK				10
;37:#define ID_GO				11
;38:#define ID_LIST				12
;39:
;40:
;41:typedef struct {
;42:	menuframework_s	menu;
;43:
;44:	menutext_s		banner;
;45:	menubitmap_s	framel;
;46:	menubitmap_s	framer;
;47:
;48:	menulist_s		list;
;49:
;50:	menubitmap_s	back;
;51:	menubitmap_s	go;
;52:
;53:	char			description[NAMEBUFSIZE];
;54:	char			fs_game[GAMEBUFSIZE];
;55:
;56:	char			*descriptionPtr;
;57:	char			*fs_gamePtr;
;58:
;59:	char			*descriptionList[MAX_MODS];
;60:	char			*fs_gameList[MAX_MODS];
;61:} mods_t;
;62:
;63:static mods_t	s_mods;
;64:
;65:
;66:/*
;67:===============
;68:UI_Mods_MenuEvent
;69:===============
;70:*/
;71:static void UI_Mods_MenuEvent( void *ptr, int event ) {
line 72
;72:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 73
;73:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 76
;74:	}
;75:
;76:	switch ( ((menucommon_s*)ptr)->id ) {
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
EQI4 $92
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $86
ADDRGP4 $83
JUMPV
LABELV $86
line 78
;77:	case ID_GO:
;78:		trap_Cvar_Set( "fs_game", s_mods.fs_gameList[s_mods.list.curvalue] );
ADDRGP4 $87
ARGP4
ADDRGP4 s_mods+664+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+5296
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 79
;79:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $91
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 80
;80:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 81
;81:		break;
ADDRGP4 $84
JUMPV
LABELV $92
line 84
;82:
;83:	case ID_BACK:
;84:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 85
;85:		break;
LABELV $83
LABELV $84
line 87
;86:	}
;87:}
LABELV $80
endproc UI_Mods_MenuEvent 8 8
proc UI_Mods_ParseInfos 20 12
line 95
;88:
;89:
;90:/*
;91:===============
;92:UI_Mods_ParseInfos
;93:===============
;94:*/
;95:static void UI_Mods_ParseInfos( char *modDir, char *modDesc ) {
line 96
;96:	s_mods.fs_gameList[s_mods.list.numitems] = s_mods.fs_gamePtr;
ADDRGP4 s_mods+664+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+5296
ADDP4
ADDRGP4 s_mods+5036
INDIRP4
ASGNP4
line 97
;97:	Q_strncpyz( s_mods.fs_gamePtr, modDir, 16 );
ADDRGP4 s_mods+5036
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 99
;98:
;99:	s_mods.descriptionList[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+664+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+5040
ADDP4
ADDRGP4 s_mods+5032
INDIRP4
ASGNP4
line 100
;100:	Q_strncpyz( s_mods.descriptionPtr, modDesc, 48 );
ADDRGP4 s_mods+5032
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 102
;101:
;102:	s_mods.list.itemnames[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+664+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+664+76
INDIRP4
ADDP4
ADDRGP4 s_mods+5032
INDIRP4
ASGNP4
line 103
;103:	s_mods.descriptionPtr += strlen( s_mods.descriptionPtr ) + 1;
ADDRGP4 s_mods+5032
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRGP4 s_mods+5032
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 104
;104:	s_mods.fs_gamePtr += strlen( s_mods.fs_gamePtr ) + 1;
ADDRGP4 s_mods+5036
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRGP4 s_mods+5036
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 105
;105:	s_mods.list.numitems++;
ADDRLP4 16
ADDRGP4 s_mods+664+68
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 106
;106:}
LABELV $93
endproc UI_Mods_ParseInfos 20 12
proc UI_Mods_LoadMods 2084 16
line 150
;107:
;108:
;109:#if 0 // bk001204 - unused
;110:/*
;111:===============
;112:UI_Mods_LoadModsFromFile
;113:===============
;114:*/
;115:static void UI_Mods_LoadModsFromFile( char *filename ) {
;116:	int				len;
;117:	fileHandle_t	f;
;118:	char			buf[1024];
;119:
;120:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;121:	if ( !f ) {
;122:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
;123:		return;
;124:	}
;125:	if ( len >= sizeof(buf) ) {
;126:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, sizeof(buf) ) );
;127:		trap_FS_FCloseFile( f );
;128:		return;
;129:	}
;130:
;131:	trap_FS_Read( buf, len, f );
;132:	buf[len] = 0;
;133:	trap_FS_FCloseFile( f );
;134:
;135:	len = strlen( filename );
;136:	if( !Q_stricmp(filename +  len - 4,".mod") ) {
;137:		filename[len-4] = '\0';
;138:	}
;139:
;140:	UI_Mods_ParseInfos( filename, buf );
;141:}
;142:#endif
;143:
;144:
;145:/*
;146:===============
;147:UI_Mods_LoadMods
;148:===============
;149:*/
;150:static void UI_Mods_LoadMods( void ) {
line 158
;151:	int		numdirs;
;152:	char	dirlist[2048];
;153:	char	*dirptr;
;154:  char  *descptr;
;155:	int		i;
;156:	int		dirlen;
;157:
;158:	s_mods.list.itemnames = (const char **)s_mods.descriptionList;
ADDRGP4 s_mods+664+76
ADDRGP4 s_mods+5040
ASGNP4
line 159
;159:	s_mods.descriptionPtr = s_mods.description;
ADDRGP4 s_mods+5032
ADDRGP4 s_mods+936
ASGNP4
line 160
;160:	s_mods.fs_gamePtr = s_mods.fs_game;
ADDRGP4 s_mods+5036
ADDRGP4 s_mods+4008
ASGNP4
line 163
;161:
;162:	// always start off with baseoa
;163:	s_mods.list.numitems = 1;
ADDRGP4 s_mods+664+68
CNSTI4 1
ASGNI4
line 164
;164:	s_mods.list.itemnames[0] = s_mods.descriptionList[0] = "OpenArena";
ADDRLP4 2068
ADDRGP4 $128
ASGNP4
ADDRGP4 s_mods+5040
ADDRLP4 2068
INDIRP4
ASGNP4
ADDRGP4 s_mods+664+76
INDIRP4
ADDRLP4 2068
INDIRP4
ASGNP4
line 165
;165:	s_mods.fs_gameList[0] = "";
ADDRGP4 s_mods+5296
ADDRGP4 $130
ASGNP4
line 167
;166:
;167:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $131
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2072
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2072
INDIRI4
ASGNI4
line 168
;168:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 169
;169:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $132
line 170
;170:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2076
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 171
;171:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 172
;172:  	UI_Mods_ParseInfos( dirptr, descptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_Mods_ParseInfos
CALLV
pop
line 173
;173:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 174
;174:	}
LABELV $133
line 169
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $135
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $132
line 176
;175:
;176:	trap_Print( va( "%i mods parsed\n", s_mods.list.numitems ) );
ADDRGP4 $136
ARGP4
ADDRGP4 s_mods+664+68
INDIRI4
ARGI4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 177
;177:	if (s_mods.list.numitems > MAX_MODS) {
ADDRGP4 s_mods+664+68
INDIRI4
CNSTI4 64
LEI4 $139
line 178
;178:		s_mods.list.numitems = MAX_MODS;
ADDRGP4 s_mods+664+68
CNSTI4 64
ASGNI4
line 179
;179:	}
LABELV $139
line 180
;180:}
LABELV $115
endproc UI_Mods_LoadMods 2084 16
proc UI_ModsMenu_Key 12 8
line 187
;181:
;182:/*
;183:=================
;184:UI_ModsMenu_Key
;185:=================
;186:*/
;187:static sfxHandle_t UI_ModsMenu_Key( int key ) {
line 190
;188:	menucommon_s	*item;
;189:
;190:        item = Menu_ItemAtCursor( &s_mods.menu );
ADDRGP4 s_mods
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 192
;191:
;192:        if( key == K_MWHEELUP ) {
ADDRFP4 0
INDIRI4
CNSTI4 184
NEI4 $146
line 193
;193:            ScrollList_Key( &s_mods.list, K_UPARROW );
ADDRGP4 s_mods+664
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 194
;194:        }
LABELV $146
line 196
;195:
;196:        if( key == K_MWHEELDOWN ) {
ADDRFP4 0
INDIRI4
CNSTI4 183
NEI4 $149
line 197
;197:            ScrollList_Key( &s_mods.list, K_DOWNARROW );
ADDRGP4 s_mods+664
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 198
;198:        }
LABELV $149
line 200
;199:
;200:	return Menu_DefaultKey( &s_mods.menu, key );
ADDRGP4 s_mods
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
LABELV $145
endproc UI_ModsMenu_Key 12 8
proc UI_Mods_MenuInit 0 12
line 208
;201:}
;202:
;203:/*
;204:===============
;205:UI_Mods_MenuInit
;206:===============
;207:*/
;208:static void UI_Mods_MenuInit( void ) {
line 209
;209:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 211
;210:
;211:	memset( &s_mods, 0 ,sizeof(mods_t) );
ADDRGP4 s_mods
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5552
ARGI4
ADDRGP4 memset
CALLP4
pop
line 213
;212:
;213:        s_mods.menu.key = UI_ModsMenu_Key;
ADDRGP4 s_mods+400
ADDRGP4 UI_ModsMenu_Key
ASGNP4
line 215
;214:
;215:	s_mods.menu.wrapAround = qtrue;
ADDRGP4 s_mods+404
CNSTI4 1
ASGNI4
line 216
;216:	s_mods.menu.fullscreen = qtrue;
ADDRGP4 s_mods+408
CNSTI4 1
ASGNI4
line 218
;217:
;218:	s_mods.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_mods+416
CNSTI4 10
ASGNI4
line 219
;219:	s_mods.banner.generic.x			= 320;
ADDRGP4 s_mods+416+12
CNSTI4 320
ASGNI4
line 220
;220:	s_mods.banner.generic.y			= 16;
ADDRGP4 s_mods+416+16
CNSTI4 16
ASGNI4
line 221
;221:	s_mods.banner.string			= "MODS";
ADDRGP4 s_mods+416+60
ADDRGP4 $163
ASGNP4
line 222
;222:	s_mods.banner.color				= color_white;
ADDRGP4 s_mods+416+68
ADDRGP4 color_white
ASGNP4
line 223
;223:	s_mods.banner.style				= UI_CENTER;
ADDRGP4 s_mods+416+64
CNSTI4 1
ASGNI4
line 225
;224:
;225:	s_mods.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+488
CNSTI4 6
ASGNI4
line 226
;226:	s_mods.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_mods+488+4
ADDRGP4 $171
ASGNP4
line 227
;227:	s_mods.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+488+44
CNSTU4 16384
ASGNU4
line 228
;228:	s_mods.framel.generic.x			= 0;  
ADDRGP4 s_mods+488+12
CNSTI4 0
ASGNI4
line 229
;229:	s_mods.framel.generic.y			= 78;
ADDRGP4 s_mods+488+16
CNSTI4 78
ASGNI4
line 230
;230:	s_mods.framel.width				= 256;
ADDRGP4 s_mods+488+76
CNSTI4 256
ASGNI4
line 231
;231:	s_mods.framel.height			= 329;
ADDRGP4 s_mods+488+80
CNSTI4 329
ASGNI4
line 233
;232:
;233:	s_mods.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+576
CNSTI4 6
ASGNI4
line 234
;234:	s_mods.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_mods+576+4
ADDRGP4 $185
ASGNP4
line 235
;235:	s_mods.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+576+44
CNSTU4 16384
ASGNU4
line 236
;236:	s_mods.framer.generic.x			= 376;
ADDRGP4 s_mods+576+12
CNSTI4 376
ASGNI4
line 237
;237:	s_mods.framer.generic.y			= 76;
ADDRGP4 s_mods+576+16
CNSTI4 76
ASGNI4
line 238
;238:	s_mods.framer.width				= 256;
ADDRGP4 s_mods+576+76
CNSTI4 256
ASGNI4
line 239
;239:	s_mods.framer.height			= 334;
ADDRGP4 s_mods+576+80
CNSTI4 334
ASGNI4
line 241
;240:
;241:	s_mods.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+760
CNSTI4 6
ASGNI4
line 242
;242:	s_mods.back.generic.name		= ART_BACK0;
ADDRGP4 s_mods+760+4
ADDRGP4 $199
ASGNP4
line 243
;243:	s_mods.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+760+44
CNSTU4 260
ASGNU4
line 244
;244:	s_mods.back.generic.id			= ID_BACK;
ADDRGP4 s_mods+760+8
CNSTI4 10
ASGNI4
line 245
;245:	s_mods.back.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+760+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 246
;246:	s_mods.back.generic.x			= 0;
ADDRGP4 s_mods+760+12
CNSTI4 0
ASGNI4
line 247
;247:	s_mods.back.generic.y			= 480-64;
ADDRGP4 s_mods+760+16
CNSTI4 416
ASGNI4
line 248
;248:	s_mods.back.width				= 128;
ADDRGP4 s_mods+760+76
CNSTI4 128
ASGNI4
line 249
;249:	s_mods.back.height				= 64;
ADDRGP4 s_mods+760+80
CNSTI4 64
ASGNI4
line 250
;250:	s_mods.back.focuspic			= ART_BACK1;
ADDRGP4 s_mods+760+60
ADDRGP4 $216
ASGNP4
line 252
;251:
;252:	s_mods.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mods+848
CNSTI4 6
ASGNI4
line 253
;253:	s_mods.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_mods+848+4
ADDRGP4 $220
ASGNP4
line 254
;254:	s_mods.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+848+44
CNSTU4 272
ASGNU4
line 255
;255:	s_mods.go.generic.id			= ID_GO;
ADDRGP4 s_mods+848+8
CNSTI4 11
ASGNI4
line 256
;256:	s_mods.go.generic.callback		= UI_Mods_MenuEvent;
ADDRGP4 s_mods+848+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 257
;257:	s_mods.go.generic.x				= 640;
ADDRGP4 s_mods+848+12
CNSTI4 640
ASGNI4
line 258
;258:	s_mods.go.generic.y				= 480-64;
ADDRGP4 s_mods+848+16
CNSTI4 416
ASGNI4
line 259
;259:	s_mods.go.width					= 128;
ADDRGP4 s_mods+848+76
CNSTI4 128
ASGNI4
line 260
;260:	s_mods.go.height				= 64;
ADDRGP4 s_mods+848+80
CNSTI4 64
ASGNI4
line 261
;261:	s_mods.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_mods+848+60
ADDRGP4 $237
ASGNP4
line 264
;262:
;263:	// scan for mods
;264:	s_mods.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_mods+664
CNSTI4 8
ASGNI4
line 265
;265:	s_mods.list.generic.flags		= QMF_PULSEIFFOCUS|QMF_CENTER_JUSTIFY;
ADDRGP4 s_mods+664+44
CNSTU4 264
ASGNU4
line 266
;266:	s_mods.list.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+664+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 267
;267:	s_mods.list.generic.id			= ID_LIST;
ADDRGP4 s_mods+664+8
CNSTI4 12
ASGNI4
line 268
;268:	s_mods.list.generic.x			= 320;
ADDRGP4 s_mods+664+12
CNSTI4 320
ASGNI4
line 269
;269:	s_mods.list.generic.y			= 130;
ADDRGP4 s_mods+664+16
CNSTI4 130
ASGNI4
line 270
;270:	s_mods.list.width				= 48;
ADDRGP4 s_mods+664+80
CNSTI4 48
ASGNI4
line 271
;271:	s_mods.list.height				= 14;
ADDRGP4 s_mods+664+84
CNSTI4 14
ASGNI4
line 273
;272:
;273:	UI_Mods_LoadMods();
ADDRGP4 UI_Mods_LoadMods
CALLV
pop
line 275
;274:
;275:	Menu_AddItem( &s_mods.menu, &s_mods.banner );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 276
;276:	Menu_AddItem( &s_mods.menu, &s_mods.framel );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 277
;277:	Menu_AddItem( &s_mods.menu, &s_mods.framer );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 278
;278:	Menu_AddItem( &s_mods.menu, &s_mods.list );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 279
;279:	Menu_AddItem( &s_mods.menu, &s_mods.back );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 280
;280:	Menu_AddItem( &s_mods.menu, &s_mods.go );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 281
;281:}
LABELV $152
endproc UI_Mods_MenuInit 0 12
export UI_ModsMenu_Cache
proc UI_ModsMenu_Cache 0 4
line 288
;282:
;283:/*
;284:=================
;285:UI_Mods_Cache
;286:=================
;287:*/
;288:void UI_ModsMenu_Cache( void ) {
line 289
;289:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $199
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 290
;290:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 291
;291:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $220
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 292
;292:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $237
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 293
;293:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $171
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 294
;294:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $185
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 295
;295:}
LABELV $259
endproc UI_ModsMenu_Cache 0 4
export UI_ModsMenu
proc UI_ModsMenu 0 4
line 303
;296:
;297:
;298:/*
;299:===============
;300:UI_ModsMenu
;301:===============
;302:*/
;303:void UI_ModsMenu( void ) {
line 304
;304:	UI_Mods_MenuInit();
ADDRGP4 UI_Mods_MenuInit
CALLV
pop
line 305
;305:	UI_PushMenu( &s_mods.menu );
ADDRGP4 s_mods
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 306
;306:}
LABELV $260
endproc UI_ModsMenu 0 4
bss
align 4
LABELV s_mods
skip 5552
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
LABELV $237
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
LABELV $220
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $199
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
LABELV $185
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
LABELV $171
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
LABELV $163
byte 1 77
byte 1 79
byte 1 68
byte 1 83
byte 1 0
align 1
LABELV $136
byte 1 37
byte 1 105
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $131
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 0
align 1
LABELV $128
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $91
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
byte 1 59
byte 1 0
align 1
LABELV $87
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
