data
align 4
LABELV specifyserver_artlist
address $79
address $80
address $81
address $82
address $83
address $84
byte 4 0
code
proc SpecifyServer_Event 272 16
file "../../../code/q3_ui/ui_specifyserver.c"
line 70
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
;29:#define SPECIFYSERVER_FRAMEL	"menu/art_blueish/frame2_l"
;30:#define SPECIFYSERVER_FRAMER	"menu/art_blueish/frame1_r"
;31:#define SPECIFYSERVER_BACK0	"menu/art_blueish/back_0"
;32:#define SPECIFYSERVER_BACK1	"menu/art_blueish/back_1"
;33:#define SPECIFYSERVER_FIGHT0	"menu/art_blueish/fight_0"
;34:#define SPECIFYSERVER_FIGHT1	"menu/art_blueish/fight_1"
;35:
;36:#define ID_SPECIFYSERVERBACK	102
;37:#define ID_SPECIFYSERVERGO		103
;38:
;39:static char* specifyserver_artlist[] =
;40:{
;41:	SPECIFYSERVER_FRAMEL,
;42:	SPECIFYSERVER_FRAMER,
;43:	SPECIFYSERVER_BACK0,	
;44:	SPECIFYSERVER_BACK1,	
;45:	SPECIFYSERVER_FIGHT0,
;46:	SPECIFYSERVER_FIGHT1,
;47:	NULL
;48:};
;49:
;50:typedef struct
;51:{
;52:	menuframework_s	menu;
;53:	menutext_s		banner;
;54:	menubitmap_s	framel;
;55:	menubitmap_s	framer;
;56:	menufield_s		domain;
;57:	menufield_s		port;
;58:	menubitmap_s	go;
;59:	menubitmap_s	back;
;60:} specifyserver_t;
;61:
;62:static specifyserver_t	s_specifyserver;
;63:
;64:/*
;65:=================
;66:SpecifyServer_Event
;67:=================
;68:*/
;69:static void SpecifyServer_Event( void* ptr, int event )
;70:{
line 73
;71:	char	buff[256];
;72:
;73:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 102
EQI4 $111
ADDRLP4 256
INDIRI4
CNSTI4 103
EQI4 $90
ADDRGP4 $87
JUMPV
line 74
;74:	{
LABELV $90
line 76
;75:		case ID_SPECIFYSERVERGO:
;76:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $91
line 77
;77:				break;
ADDRGP4 $88
JUMPV
LABELV $91
line 79
;78:
;79:			if (s_specifyserver.domain.field.buffer[0])
ADDRGP4 s_specifyserver+664+60+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $88
line 80
;80:			{
line 81
;81:				strcpy(buff,s_specifyserver.domain.field.buffer);
ADDRLP4 0
ARGP4
ADDRGP4 s_specifyserver+664+60+12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 82
;82:				if (s_specifyserver.port.field.buffer[0])
ADDRGP4 s_specifyserver+996+60+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $101
line 83
;83:					Com_sprintf( buff+strlen(buff), 128, ":%s", s_specifyserver.port.field.buffer );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $106
ARGP4
ADDRGP4 s_specifyserver+996+60+12
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $101
line 85
;84:
;85:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $110
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 86
;86:			}
line 87
;87:			break;
ADDRGP4 $88
JUMPV
LABELV $111
line 90
;88:
;89:		case ID_SPECIFYSERVERBACK:
;90:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $112
line 91
;91:				break;
ADDRGP4 $88
JUMPV
LABELV $112
line 93
;92:
;93:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 94
;94:			break;
LABELV $87
LABELV $88
line 96
;95:	}
;96:}
LABELV $86
endproc SpecifyServer_Event 272 16
export SpecifyServer_MenuInit
proc SpecifyServer_MenuInit 0 16
line 104
;97:
;98:/*
;99:=================
;100:SpecifyServer_MenuInit
;101:=================
;102:*/
;103:void SpecifyServer_MenuInit( void )
;104:{
line 106
;105:	// zero set all our globals
;106:	memset( &s_specifyserver, 0 ,sizeof(specifyserver_t) );
ADDRGP4 s_specifyserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1504
ARGI4
ADDRGP4 memset
CALLP4
pop
line 108
;107:
;108:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 110
;109:
;110:	s_specifyserver.menu.wrapAround = qtrue;
ADDRGP4 s_specifyserver+404
CNSTI4 1
ASGNI4
line 111
;111:	s_specifyserver.menu.fullscreen = qtrue;
ADDRGP4 s_specifyserver+408
CNSTI4 1
ASGNI4
line 113
;112:
;113:	s_specifyserver.banner.generic.type	 = MTYPE_BTEXT;
ADDRGP4 s_specifyserver+416
CNSTI4 10
ASGNI4
line 114
;114:	s_specifyserver.banner.generic.x     = 320;
ADDRGP4 s_specifyserver+416+12
CNSTI4 320
ASGNI4
line 115
;115:	s_specifyserver.banner.generic.y     = 16;
ADDRGP4 s_specifyserver+416+16
CNSTI4 16
ASGNI4
line 116
;116:	s_specifyserver.banner.string		 = "SPECIFY SERVER";
ADDRGP4 s_specifyserver+416+60
ADDRGP4 $124
ASGNP4
line 117
;117:	s_specifyserver.banner.color  		 = color_white;
ADDRGP4 s_specifyserver+416+68
ADDRGP4 color_white
ASGNP4
line 118
;118:	s_specifyserver.banner.style  		 = UI_CENTER;
ADDRGP4 s_specifyserver+416+64
CNSTI4 1
ASGNI4
line 120
;119:
;120:	s_specifyserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+488
CNSTI4 6
ASGNI4
line 121
;121:	s_specifyserver.framel.generic.name  = SPECIFYSERVER_FRAMEL;
ADDRGP4 s_specifyserver+488+4
ADDRGP4 $79
ASGNP4
line 122
;122:	s_specifyserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+488+44
CNSTU4 16384
ASGNU4
line 123
;123:	s_specifyserver.framel.generic.x	 = 0;  
ADDRGP4 s_specifyserver+488+12
CNSTI4 0
ASGNI4
line 124
;124:	s_specifyserver.framel.generic.y	 = 78;
ADDRGP4 s_specifyserver+488+16
CNSTI4 78
ASGNI4
line 125
;125:	s_specifyserver.framel.width  	     = 256;
ADDRGP4 s_specifyserver+488+76
CNSTI4 256
ASGNI4
line 126
;126:	s_specifyserver.framel.height  	     = 329;
ADDRGP4 s_specifyserver+488+80
CNSTI4 329
ASGNI4
line 128
;127:
;128:	s_specifyserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+576
CNSTI4 6
ASGNI4
line 129
;129:	s_specifyserver.framer.generic.name  = SPECIFYSERVER_FRAMER;
ADDRGP4 s_specifyserver+576+4
ADDRGP4 $80
ASGNP4
line 130
;130:	s_specifyserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+576+44
CNSTU4 16384
ASGNU4
line 131
;131:	s_specifyserver.framer.generic.x	 = 376;
ADDRGP4 s_specifyserver+576+12
CNSTI4 376
ASGNI4
line 132
;132:	s_specifyserver.framer.generic.y	 = 76;
ADDRGP4 s_specifyserver+576+16
CNSTI4 76
ASGNI4
line 133
;133:	s_specifyserver.framer.width  	     = 256;
ADDRGP4 s_specifyserver+576+76
CNSTI4 256
ASGNI4
line 134
;134:	s_specifyserver.framer.height  	     = 334;
ADDRGP4 s_specifyserver+576+80
CNSTI4 334
ASGNI4
line 136
;135:
;136:	s_specifyserver.domain.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+664
CNSTI4 4
ASGNI4
line 137
;137:	s_specifyserver.domain.generic.name       = "Address:";
ADDRGP4 s_specifyserver+664+4
ADDRGP4 $158
ASGNP4
line 138
;138:	s_specifyserver.domain.generic.flags      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_specifyserver+664+44
CNSTU4 258
ASGNU4
line 139
;139:	s_specifyserver.domain.generic.x	      = 206;
ADDRGP4 s_specifyserver+664+12
CNSTI4 206
ASGNI4
line 140
;140:	s_specifyserver.domain.generic.y	      = 220;
ADDRGP4 s_specifyserver+664+16
CNSTI4 220
ASGNI4
line 141
;141:	s_specifyserver.domain.field.widthInChars = 38;
ADDRGP4 s_specifyserver+664+60+8
CNSTI4 38
ASGNI4
line 142
;142:	s_specifyserver.domain.field.maxchars     = 80;
ADDRGP4 s_specifyserver+664+60+268
CNSTI4 80
ASGNI4
line 144
;143:
;144:	s_specifyserver.port.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+996
CNSTI4 4
ASGNI4
line 145
;145:	s_specifyserver.port.generic.name	    = "Port:";
ADDRGP4 s_specifyserver+996+4
ADDRGP4 $174
ASGNP4
line 146
;146:	s_specifyserver.port.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_specifyserver+996+44
CNSTU4 290
ASGNU4
line 147
;147:	s_specifyserver.port.generic.x	        = 206;
ADDRGP4 s_specifyserver+996+12
CNSTI4 206
ASGNI4
line 148
;148:	s_specifyserver.port.generic.y	        = 250;
ADDRGP4 s_specifyserver+996+16
CNSTI4 250
ASGNI4
line 149
;149:	s_specifyserver.port.field.widthInChars = 6;
ADDRGP4 s_specifyserver+996+60+8
CNSTI4 6
ASGNI4
line 150
;150:	s_specifyserver.port.field.maxchars     = 5;
ADDRGP4 s_specifyserver+996+60+268
CNSTI4 5
ASGNI4
line 152
;151:
;152:	s_specifyserver.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1328
CNSTI4 6
ASGNI4
line 153
;153:	s_specifyserver.go.generic.name     = SPECIFYSERVER_FIGHT0;
ADDRGP4 s_specifyserver+1328+4
ADDRGP4 $83
ASGNP4
line 154
;154:	s_specifyserver.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+1328+44
CNSTU4 272
ASGNU4
line 155
;155:	s_specifyserver.go.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+1328+48
ADDRGP4 SpecifyServer_Event
ASGNP4
line 156
;156:	s_specifyserver.go.generic.id	    = ID_SPECIFYSERVERGO;
ADDRGP4 s_specifyserver+1328+8
CNSTI4 103
ASGNI4
line 157
;157:	s_specifyserver.go.generic.x		= 640;
ADDRGP4 s_specifyserver+1328+12
CNSTI4 640
ASGNI4
line 158
;158:	s_specifyserver.go.generic.y		= 480-64;
ADDRGP4 s_specifyserver+1328+16
CNSTI4 416
ASGNI4
line 159
;159:	s_specifyserver.go.width  		    = 128;
ADDRGP4 s_specifyserver+1328+76
CNSTI4 128
ASGNI4
line 160
;160:	s_specifyserver.go.height  		    = 64;
ADDRGP4 s_specifyserver+1328+80
CNSTI4 64
ASGNI4
line 161
;161:	s_specifyserver.go.focuspic         = SPECIFYSERVER_FIGHT1;
ADDRGP4 s_specifyserver+1328+60
ADDRGP4 $84
ASGNP4
line 163
;162:
;163:	s_specifyserver.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1416
CNSTI4 6
ASGNI4
line 164
;164:	s_specifyserver.back.generic.name     = SPECIFYSERVER_BACK0;
ADDRGP4 s_specifyserver+1416+4
ADDRGP4 $81
ASGNP4
line 165
;165:	s_specifyserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+1416+44
CNSTU4 260
ASGNU4
line 166
;166:	s_specifyserver.back.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+1416+48
ADDRGP4 SpecifyServer_Event
ASGNP4
line 167
;167:	s_specifyserver.back.generic.id	      = ID_SPECIFYSERVERBACK;
ADDRGP4 s_specifyserver+1416+8
CNSTI4 102
ASGNI4
line 168
;168:	s_specifyserver.back.generic.x		  = 0;
ADDRGP4 s_specifyserver+1416+12
CNSTI4 0
ASGNI4
line 169
;169:	s_specifyserver.back.generic.y		  = 480-64;
ADDRGP4 s_specifyserver+1416+16
CNSTI4 416
ASGNI4
line 170
;170:	s_specifyserver.back.width  		  = 128;
ADDRGP4 s_specifyserver+1416+76
CNSTI4 128
ASGNI4
line 171
;171:	s_specifyserver.back.height  		  = 64;
ADDRGP4 s_specifyserver+1416+80
CNSTI4 64
ASGNI4
line 172
;172:	s_specifyserver.back.focuspic         = SPECIFYSERVER_BACK1;
ADDRGP4 s_specifyserver+1416+60
ADDRGP4 $82
ASGNP4
line 174
;173:
;174:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.banner );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 175
;175:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.framel );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 176
;176:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.framer );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 177
;177:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.domain );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 178
;178:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.port );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 179
;179:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.go );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 180
;180:	Menu_AddItem( &s_specifyserver.menu, &s_specifyserver.back );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 182
;181:
;182:	Com_sprintf( s_specifyserver.port.field.buffer, 6, "%i", 27960 );
ADDRGP4 s_specifyserver+996+60+12
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 $235
ARGP4
CNSTI4 27960
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 183
;183:}
LABELV $114
endproc SpecifyServer_MenuInit 0 16
export SpecifyServer_Cache
proc SpecifyServer_Cache 4 4
line 191
;184:
;185:/*
;186:=================
;187:SpecifyServer_Cache
;188:=================
;189:*/
;190:void SpecifyServer_Cache( void )
;191:{
line 195
;192:	int	i;
;193:
;194:	// touch all our pics
;195:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $237
line 196
;196:	{
line 197
;197:		if (!specifyserver_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 198
;198:			break;
ADDRGP4 $239
JUMPV
LABELV $241
line 199
;199:		trap_R_RegisterShaderNoMip(specifyserver_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 200
;200:	}
LABELV $238
line 195
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $239
line 201
;201:}
LABELV $236
endproc SpecifyServer_Cache 4 4
export UI_SpecifyServerMenu
proc UI_SpecifyServerMenu 0 4
line 209
;202:
;203:/*
;204:=================
;205:UI_SpecifyServerMenu
;206:=================
;207:*/
;208:void UI_SpecifyServerMenu( void )
;209:{
line 210
;210:	SpecifyServer_MenuInit();
ADDRGP4 SpecifyServer_MenuInit
CALLV
pop
line 211
;211:	UI_PushMenu( &s_specifyserver.menu );
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 212
;212:}
LABELV $243
endproc UI_SpecifyServerMenu 0 4
bss
align 4
LABELV s_specifyserver
skip 1504
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
LABELV $235
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $174
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $158
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $124
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 73
byte 1 70
byte 1 89
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $106
byte 1 58
byte 1 37
byte 1 115
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
byte 1 102
byte 1 105
byte 1 103
byte 1 104
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
byte 1 102
byte 1 105
byte 1 103
byte 1 104
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
