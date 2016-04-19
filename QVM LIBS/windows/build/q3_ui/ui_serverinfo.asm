data
align 4
LABELV serverinfo_artlist
address $79
address $80
address $81
address $82
byte 4 0
export Favorites_Add
code
proc Favorites_Add 276 12
file "../../../code/q3_ui/ui_serverinfo.c"
line 65
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
;25:#define SERVERINFO_FRAMEL	"menu/art_blueish/frame2_l"
;26:#define SERVERINFO_FRAMER	"menu/art_blueish/frame1_r"
;27:#define SERVERINFO_BACK0	"menu/art_blueish/back_0"
;28:#define SERVERINFO_BACK1	"menu/art_blueish/back_1"
;29:
;30:static char* serverinfo_artlist[] =
;31:{
;32:	SERVERINFO_FRAMEL,	
;33:	SERVERINFO_FRAMER,
;34:	SERVERINFO_BACK0,
;35:	SERVERINFO_BACK1,
;36:	NULL
;37:};
;38:
;39:#define ID_ADD	 100
;40:#define ID_BACK	 101
;41:
;42:typedef struct
;43:{
;44:	menuframework_s	menu;
;45:	menutext_s		banner;
;46:	menubitmap_s	framel;
;47:	menubitmap_s	framer;
;48:	menubitmap_s	back;
;49:	menutext_s		add;
;50:	char			info[MAX_INFO_STRING];
;51:	int				numlines;
;52:} serverinfo_t;
;53:
;54:static serverinfo_t	s_serverinfo;
;55:
;56:
;57:/*
;58:=================
;59:Favorites_Add
;60:
;61:Add current server to favorites
;62:=================
;63:*/
;64:void Favorites_Add( void )
;65:{
line 71
;66:	char	adrstr[128];
;67:	char	serverbuff[128];
;68:	int		i;
;69:	int		best;
;70:
;71:	trap_Cvar_VariableStringBuffer( "cl_currentServerAddress", serverbuff, sizeof(serverbuff) );
ADDRGP4 $85
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 72
;72:	if (!serverbuff[0])
ADDRLP4 136
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $86
line 73
;73:		return;
ADDRGP4 $84
JUMPV
LABELV $86
line 75
;74:
;75:	best = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 76
;76:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $88
line 77
;77:	{
line 78
;78:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, sizeof(adrstr) );
ADDRGP4 $92
ARGP4
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 79
;79:		if (!Q_stricmp(serverbuff,adrstr))
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $93
line 80
;80:		{
line 82
;81:			// already in list
;82:			return;
ADDRGP4 $84
JUMPV
LABELV $93
line 86
;83:		}
;84:		
;85:		// use first empty or non-numeric available slot
;86:		if ((adrstr[0]  < '0' || adrstr[0] > '9' ) && !best)
ADDRLP4 272
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $97
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $95
LABELV $97
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $95
line 87
;87:			best = i+1;
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
line 88
;88:	}
LABELV $89
line 76
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 16
LTI4 $88
line 90
;89:
;90:	if (best)
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $98
line 91
;91:		trap_Cvar_Set( va("server%d",best), serverbuff);
ADDRGP4 $92
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $98
line 92
;92:}
LABELV $84
endproc Favorites_Add 276 12
proc ServerInfo_Event 8 0
line 101
;93:
;94:
;95:/*
;96:=================
;97:ServerInfo_Event
;98:=================
;99:*/
;100:static void ServerInfo_Event( void* ptr, int event )
;101:{
line 102
;102:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $104
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $107
ADDRGP4 $101
JUMPV
line 103
;103:	{
LABELV $104
line 105
;104:		case ID_ADD:
;105:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $105
line 106
;106:				break;
ADDRGP4 $102
JUMPV
LABELV $105
line 108
;107:		
;108:			Favorites_Add();
ADDRGP4 Favorites_Add
CALLV
pop
line 109
;109:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 110
;110:			break;
ADDRGP4 $102
JUMPV
LABELV $107
line 113
;111:
;112:		case ID_BACK:
;113:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $108
line 114
;114:				break;
ADDRGP4 $102
JUMPV
LABELV $108
line 116
;115:
;116:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 117
;117:			break;
LABELV $101
LABELV $102
line 119
;118:	}
;119:}
LABELV $100
endproc ServerInfo_Event 8 0
proc ServerInfo_MenuDraw 2060 20
line 127
;120:
;121:/*
;122:=================
;123:ServerInfo_MenuDraw
;124:=================
;125:*/
;126:static void ServerInfo_MenuDraw( void )
;127:{
line 131
;128:	const char		*s;
;129:	char			key[MAX_INFO_KEY];
;130:	char			value[MAX_INFO_VALUE];
;131:	int			i=0,y;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 133
;132:
;133:	y = SCREEN_HEIGHT/2 - s_serverinfo.numlines*(SMALLCHAR_HEIGHT)/2 - 20;
ADDRLP4 1024
CNSTI4 240
ADDRGP4 s_serverinfo+1848
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
CNSTI4 20
SUBI4
ASGNI4
line 134
;134:	s = s_serverinfo.info;
ADDRLP4 1028
ADDRGP4 s_serverinfo+824
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 135
;135:	while ( s && i < s_serverinfo.numlines ) {
line 136
;136:		Info_NextPair( &s, key, value );
ADDRLP4 1028
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 137
;137:		if ( !key[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $117
line 138
;138:			break;
ADDRGP4 $115
JUMPV
LABELV $117
line 141
;139:		}
;140:
;141:		Q_strcat( key, MAX_INFO_KEY, ":" ); 
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $119
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 143
;142:
;143:		UI_DrawString(SCREEN_WIDTH*0.50 - 8,y,key,UI_RIGHT|UI_SMALLFONT,color_red);
CNSTI4 312
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 144
;144:		UI_DrawString(SCREEN_WIDTH*0.50 + 8,y,value,UI_LEFT|UI_SMALLFONT,text_color_normal);
CNSTI4 328
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 146
;145:
;146:		y += SMALLCHAR_HEIGHT;
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 147
;147:                i++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 148
;148:	}
LABELV $114
line 135
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
ADDRLP4 1032
INDIRI4
ADDRGP4 s_serverinfo+1848
INDIRI4
LTI4 $113
LABELV $120
LABELV $115
line 150
;149:
;150:	Menu_Draw( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 151
;151:}
LABELV $110
endproc ServerInfo_MenuDraw 2060 20
proc ServerInfo_MenuKey 4 8
line 159
;152:
;153:/*
;154:=================
;155:ServerInfo_MenuKey
;156:=================
;157:*/
;158:static sfxHandle_t ServerInfo_MenuKey( int key )
;159:{
line 160
;160:	return ( Menu_DefaultKey( &s_serverinfo.menu, key ) );
ADDRGP4 s_serverinfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $121
endproc ServerInfo_MenuKey 4 8
export ServerInfo_Cache
proc ServerInfo_Cache 4 4
line 169
;161:}
;162:
;163:/*
;164:=================
;165:ServerInfo_Cache
;166:=================
;167:*/
;168:void ServerInfo_Cache( void )
;169:{
line 173
;170:	int	i;
;171:
;172:	// touch all our pics
;173:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $123
line 174
;174:	{
line 175
;175:		if (!serverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 176
;176:			break;
ADDRGP4 $125
JUMPV
LABELV $127
line 177
;177:		trap_R_RegisterShaderNoMip(serverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 178
;178:	}
LABELV $124
line 173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $125
line 179
;179:}
LABELV $122
endproc ServerInfo_Cache 4 4
export UI_ServerInfoMenu
proc UI_ServerInfoMenu 2060 12
line 187
;180:
;181:/*
;182:=================
;183:UI_ServerInfoMenu
;184:=================
;185:*/
;186:void UI_ServerInfoMenu( void )
;187:{
line 193
;188:	const char		*s;
;189:	char			key[MAX_INFO_KEY];
;190:	char			value[MAX_INFO_VALUE];
;191:
;192:	// zero set all our globals
;193:	memset( &s_serverinfo, 0 ,sizeof(serverinfo_t) );
ADDRGP4 s_serverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1852
ARGI4
ADDRGP4 memset
CALLP4
pop
line 195
;194:
;195:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 197
;196:
;197:	s_serverinfo.menu.draw       = ServerInfo_MenuDraw;
ADDRGP4 s_serverinfo+396
ADDRGP4 ServerInfo_MenuDraw
ASGNP4
line 198
;198:	s_serverinfo.menu.key        = ServerInfo_MenuKey;
ADDRGP4 s_serverinfo+400
ADDRGP4 ServerInfo_MenuKey
ASGNP4
line 199
;199:	s_serverinfo.menu.wrapAround = qtrue;
ADDRGP4 s_serverinfo+404
CNSTI4 1
ASGNI4
line 200
;200:	s_serverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_serverinfo+408
CNSTI4 1
ASGNI4
line 202
;201:
;202:	s_serverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_serverinfo+416
CNSTI4 10
ASGNI4
line 203
;203:	s_serverinfo.banner.generic.x	  = 320;
ADDRGP4 s_serverinfo+416+12
CNSTI4 320
ASGNI4
line 204
;204:	s_serverinfo.banner.generic.y	  = 16;
ADDRGP4 s_serverinfo+416+16
CNSTI4 16
ASGNI4
line 205
;205:	s_serverinfo.banner.string		  = "SERVER INFO";
ADDRGP4 s_serverinfo+416+60
ADDRGP4 $141
ASGNP4
line 206
;206:	s_serverinfo.banner.color	      = color_white;
ADDRGP4 s_serverinfo+416+68
ADDRGP4 color_white
ASGNP4
line 207
;207:	s_serverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_serverinfo+416+64
CNSTI4 1
ASGNI4
line 209
;208:
;209:	s_serverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+488
CNSTI4 6
ASGNI4
line 210
;210:	s_serverinfo.framel.generic.name  = SERVERINFO_FRAMEL;
ADDRGP4 s_serverinfo+488+4
ADDRGP4 $79
ASGNP4
line 211
;211:	s_serverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+488+44
CNSTU4 16384
ASGNU4
line 212
;212:	s_serverinfo.framel.generic.x	  = 0;  
ADDRGP4 s_serverinfo+488+12
CNSTI4 0
ASGNI4
line 213
;213:	s_serverinfo.framel.generic.y	  = 78;
ADDRGP4 s_serverinfo+488+16
CNSTI4 78
ASGNI4
line 214
;214:	s_serverinfo.framel.width  	      = 256;
ADDRGP4 s_serverinfo+488+76
CNSTI4 256
ASGNI4
line 215
;215:	s_serverinfo.framel.height  	  = 329;
ADDRGP4 s_serverinfo+488+80
CNSTI4 329
ASGNI4
line 217
;216:
;217:	s_serverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+576
CNSTI4 6
ASGNI4
line 218
;218:	s_serverinfo.framer.generic.name  = SERVERINFO_FRAMER;
ADDRGP4 s_serverinfo+576+4
ADDRGP4 $80
ASGNP4
line 219
;219:	s_serverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+576+44
CNSTU4 16384
ASGNU4
line 220
;220:	s_serverinfo.framer.generic.x	  = 376;
ADDRGP4 s_serverinfo+576+12
CNSTI4 376
ASGNI4
line 221
;221:	s_serverinfo.framer.generic.y	  = 76;
ADDRGP4 s_serverinfo+576+16
CNSTI4 76
ASGNI4
line 222
;222:	s_serverinfo.framer.width  	      = 256;
ADDRGP4 s_serverinfo+576+76
CNSTI4 256
ASGNI4
line 223
;223:	s_serverinfo.framer.height  	  = 334;
ADDRGP4 s_serverinfo+576+80
CNSTI4 334
ASGNI4
line 225
;224:
;225:	s_serverinfo.add.generic.type	  = MTYPE_PTEXT;
ADDRGP4 s_serverinfo+752
CNSTI4 9
ASGNI4
line 226
;226:	s_serverinfo.add.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+752+44
CNSTU4 264
ASGNU4
line 227
;227:	s_serverinfo.add.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+752+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 228
;228:	s_serverinfo.add.generic.id	      = ID_ADD;
ADDRGP4 s_serverinfo+752+8
CNSTI4 100
ASGNI4
line 229
;229:	s_serverinfo.add.generic.x		  = 320;
ADDRGP4 s_serverinfo+752+12
CNSTI4 320
ASGNI4
line 230
;230:	s_serverinfo.add.generic.y		  = 371;
ADDRGP4 s_serverinfo+752+16
CNSTI4 371
ASGNI4
line 231
;231:	s_serverinfo.add.string  		  = "ADD TO FAVORITES";
ADDRGP4 s_serverinfo+752+60
ADDRGP4 $185
ASGNP4
line 232
;232:	s_serverinfo.add.style  		  = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_serverinfo+752+64
CNSTI4 17
ASGNI4
line 233
;233:	s_serverinfo.add.color			  =	color_red;
ADDRGP4 s_serverinfo+752+68
ADDRGP4 color_red
ASGNP4
line 234
;234:	if( trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $192
ARGP4
ADDRLP4 2052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2052
INDIRF4
CNSTF4 0
EQF4 $190
line 235
;235:		s_serverinfo.add.generic.flags |= QMF_GRAYED;
ADDRLP4 2056
ADDRGP4 s_serverinfo+752+44
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 236
;236:	}
LABELV $190
line 238
;237:
;238:	s_serverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+664
CNSTI4 6
ASGNI4
line 239
;239:	s_serverinfo.back.generic.name     = SERVERINFO_BACK0;
ADDRGP4 s_serverinfo+664+4
ADDRGP4 $81
ASGNP4
line 240
;240:	s_serverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+664+44
CNSTU4 260
ASGNU4
line 241
;241:	s_serverinfo.back.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+664+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 242
;242:	s_serverinfo.back.generic.id	   = ID_BACK;
ADDRGP4 s_serverinfo+664+8
CNSTI4 101
ASGNI4
line 243
;243:	s_serverinfo.back.generic.x		   = 0;
ADDRGP4 s_serverinfo+664+12
CNSTI4 0
ASGNI4
line 244
;244:	s_serverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_serverinfo+664+16
CNSTI4 416
ASGNI4
line 245
;245:	s_serverinfo.back.width  		   = 128;
ADDRGP4 s_serverinfo+664+76
CNSTI4 128
ASGNI4
line 246
;246:	s_serverinfo.back.height  		   = 64;
ADDRGP4 s_serverinfo+664+80
CNSTI4 64
ASGNI4
line 247
;247:	s_serverinfo.back.focuspic         = SERVERINFO_BACK1;
ADDRGP4 s_serverinfo+664+60
ADDRGP4 $82
ASGNP4
line 249
;248:
;249:	trap_GetConfigString( CS_SERVERINFO, s_serverinfo.info, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRGP4 s_serverinfo+824
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 251
;250:
;251:	s_serverinfo.numlines = 0;
ADDRGP4 s_serverinfo+1848
CNSTI4 0
ASGNI4
line 252
;252:	s = s_serverinfo.info;
ADDRLP4 0
ADDRGP4 s_serverinfo+824
ASGNP4
ADDRGP4 $218
JUMPV
LABELV $217
line 253
;253:	while ( s ) {
line 254
;254:		Info_NextPair( &s, key, value );
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 255
;255:		if ( !key[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $220
line 256
;256:			break;
ADDRGP4 $219
JUMPV
LABELV $220
line 258
;257:		}
;258:		s_serverinfo.numlines++;
ADDRLP4 2056
ADDRGP4 s_serverinfo+1848
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 259
;259:	}
LABELV $218
line 253
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $217
LABELV $219
line 261
;260:
;261:	if (s_serverinfo.numlines > 16)
ADDRGP4 s_serverinfo+1848
INDIRI4
CNSTI4 16
LEI4 $223
line 262
;262:		s_serverinfo.numlines = 16;
ADDRGP4 s_serverinfo+1848
CNSTI4 16
ASGNI4
LABELV $223
line 264
;263:
;264:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.banner );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 265
;265:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framel );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 266
;266:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framer );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;267:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.add );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 268
;268:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.back );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 270
;269:
;270:	UI_PushMenu( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 271
;271:}
LABELV $129
endproc UI_ServerInfoMenu 2060 12
bss
align 4
LABELV s_serverinfo
skip 1852
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
LABELV $192
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $185
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 70
byte 1 65
byte 1 86
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $141
byte 1 83
byte 1 69
byte 1 82
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
LABELV $119
byte 1 58
byte 1 0
align 1
LABELV $92
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
LABELV $85
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
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
