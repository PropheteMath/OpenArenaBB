export Rankings_DrawText
code
proc Rankings_DrawText 52 20
file "../../../code/q3_ui/ui_rankings.c"
line 69
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
;23://
;24:// ui_rankings.c
;25://
;26:
;27:#include "ui_local.h"
;28:
;29:
;30:#define RANKINGS_FRAME	"menu/art_blueish/cut_frame"
;31:
;32:#define ID_LOGIN		100
;33:#define ID_LOGOUT		101
;34:#define ID_CREATE		102
;35:#define ID_SPECTATE		103
;36:#define ID_SETUP		104
;37:#define ID_LEAVE		105
;38:
;39:
;40:typedef struct
;41:{
;42:	menuframework_s	menu;
;43:	menubitmap_s	frame;
;44:	menutext_s		login;
;45:	menutext_s		logout;
;46:	menutext_s		create;
;47:	menutext_s		spectate;
;48:	menutext_s		setup;
;49:	menutext_s		leave;
;50:} rankings_t;
;51:
;52:static rankings_t	s_rankings;
;53:
;54:static menuframework_s	s_rankings_menu;
;55:static menuaction_s		s_rankings_login;
;56:static menuaction_s		s_rankings_logout;
;57:static menuaction_s		s_rankings_create;
;58:static menuaction_s		s_rankings_spectate;
;59:static menuaction_s		s_rankings_setup;
;60:static menuaction_s		s_rankings_leave;
;61:
;62:
;63:/*
;64:===============
;65:Rankings_DrawText
;66:===============
;67:*/
;68:void Rankings_DrawText( void* self )
;69:{
line 78
;70:	menufield_s		*f;
;71:	qboolean		focus;
;72:	int				style;
;73:	char			*txt;
;74:	char			c;
;75:	float			*color;
;76:	int				basex, x, y;
;77:
;78:	f = (menufield_s*)self;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 79
;79:	basex = f->generic.x;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 80
;80:	y = f->generic.y + 4;
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 81
;81:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $82
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $83
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 83
;82:
;83:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 84
;84:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 85
;85:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $84
line 86
;86:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 87
;87:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 88
;88:	}
LABELV $84
line 91
;89:
;90:	// draw the actual text
;91:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
line 92
;92:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 16
ADDRGP4 g_color_table+112
ASGNP4
line 93
;93:	x = basex;
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
line 94
;94:	while ( (c = *txt) != 0 ) {
line 95
;95:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 96
;96:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 97
;97:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 98
;98:	}
LABELV $88
line 94
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 44
INDIRI1
ASGNI1
ADDRLP4 44
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
line 101
;99:
;100:	// draw cursor if we have focus
;101:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $90
line 102
;102:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 48
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $92
line 103
;103:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 104
;104:		} else {
ADDRGP4 $93
JUMPV
LABELV $92
line 105
;105:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 106
;106:		}
LABELV $93
line 108
;107:
;108:		style &= ~UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 109
;109:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 111
;110:
;111:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 112
;112:	}
LABELV $90
line 113
;113:}
LABELV $80
endproc Rankings_DrawText 52 20
export Rankings_DrawName
proc Rankings_DrawName 20 4
line 121
;114:
;115:/*
;116:===============
;117:Rankings_DrawName
;118:===============
;119:*/
;120:void Rankings_DrawName( void* self )
;121:{
line 126
;122:	menufield_s		*f;
;123:	int				length;
;124:	char*			p;
;125:	
;126:	f = (menufield_s*)self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 129
;127:
;128:	// GRANK_FIXME - enforce valid characters
;129:	for( p = f->field.buffer; *p != '\0'; p++ )
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRGP4 $98
JUMPV
LABELV $95
line 130
;130:	{
line 132
;131:		//if( ispunct(*p) || isspace(*p) )
;132:		if( !( ( (*p) >= '0' && (*p) <= '9') || Q_isalpha(*p)) )
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $101
ADDRLP4 12
INDIRI4
CNSTI4 57
LEI4 $99
LABELV $101
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $99
line 133
;133:		{
line 134
;134:			*p = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 135
;135:		}
LABELV $99
line 136
;136:	}
LABELV $96
line 129
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $98
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $95
line 139
;137:	
;138:	// strip color codes
;139:	Q_CleanStr( f->field.buffer );
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 140
;140:	length = strlen( f->field.buffer );
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 141
;141:	if( f->field.cursor > length )
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $102
line 142
;142:	{
line 143
;143:		f->field.cursor = length;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 144
;144:	}	
LABELV $102
line 146
;145:
;146:	Rankings_DrawText( f );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Rankings_DrawText
CALLV
pop
line 147
;147:}
LABELV $94
endproc Rankings_DrawName 20 4
export Rankings_DrawPassword
proc Rankings_DrawPassword 280 12
line 192
;148:
;149:#if 0 // old version
;150:/*
;151:===============
;152:Rankings_DrawName
;153:===============
;154:*/
;155:void Rankings_DrawName( void* self )
;156:{
;157:	menufield_s*	f;
;158:	int				length;
;159:	
;160:	f = (menufield_s*)self;
;161:
;162:	// strip color codes
;163:	Q_CleanStr( f->field.buffer );
;164:	length = strlen( f->field.buffer );
;165:	if( f->field.cursor > length )
;166:	{
;167:		f->field.cursor = length;
;168:	}
;169:	
;170:	// show beginning of long names
;171:	/*
;172:	if( Menu_ItemAtCursor( f->generic.parent ) != f )
;173:	{
;174:		if( f->field.scroll > 0 )
;175:		{
;176:			f->field.cursor = 0;
;177:			f->field.scroll = 0;
;178:		}
;179:	}
;180:	*/
;181:	
;182:	MenuField_Draw( f );
;183:}
;184:#endif
;185:
;186:/*
;187:===============
;188:Rankings_DrawPassword
;189:===============
;190:*/
;191:void Rankings_DrawPassword( void* self )
;192:{
line 199
;193:	menufield_s*	f;
;194:	char			password[MAX_EDIT_LINE];
;195:	int				length;
;196:	int				i;
;197:	char*			p;
;198:
;199:	f = (menufield_s*)self;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 202
;200:	
;201:	// GRANK_FIXME - enforce valid characters
;202:	for( p = f->field.buffer; *p != '\0'; p++ )
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRGP4 $108
JUMPV
LABELV $105
line 203
;203:	{
line 205
;204:		//if( ispunct(*p) || isspace(*p) )
;205:		if( !( ( (*p) >= '0' && (*p) <= '9') || Q_isalpha(*p)) )
ADDRLP4 272
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $111
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $109
LABELV $111
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 276
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $109
line 206
;206:		{
line 207
;207:			*p = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 208
;208:		}
LABELV $109
line 209
;209:	}
LABELV $106
line 202
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $108
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $105
line 211
;210:	
;211:	length = strlen( f->field.buffer );
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 272
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 272
INDIRI4
ASGNI4
line 212
;212:	if( f->field.cursor > length )
ADDRLP4 8
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $112
line 213
;213:	{
line 214
;214:		f->field.cursor = length;
ADDRLP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 215
;215:	}
LABELV $112
line 218
;216:	
;217:	// save password
;218:	Q_strncpyz( password, f->field.buffer, sizeof(password) );
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 221
;219:
;220:	// mask password with *
;221:	for( i = 0; i < length; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 222
;222:	{
line 223
;223:		f->field.buffer[i] = '*';
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ADDP4
CNSTI1 42
ASGNI1
line 224
;224:	}
LABELV $115
line 221
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $114
line 227
;225:
;226:	// draw masked password
;227:	Rankings_DrawText( f );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Rankings_DrawText
CALLV
pop
line 231
;228:	//MenuField_Draw( f );
;229:
;230:	// restore password
;231:	Q_strncpyz( f->field.buffer, password, sizeof(f->field.buffer) );
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 232
;232:}
LABELV $104
endproc Rankings_DrawPassword 280 12
proc Rankings_MenuEvent 8 8
line 239
;233:
;234:/*
;235:===============
;236:Rankings_MenuEvent
;237:===============
;238:*/
;239:static void Rankings_MenuEvent( void* ptr, int event ) {
line 240
;240:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $119
line 241
;241:		return;
ADDRGP4 $118
JUMPV
LABELV $119
line 244
;242:	}
;243:
;244:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $121
ADDRLP4 0
INDIRI4
CNSTI4 105
GTI4 $121
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $132-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $132
address $124
address $125
address $126
address $127
address $129
address $130
code
LABELV $124
line 246
;245:	case ID_LOGIN:
;246:		UI_LoginMenu();
ADDRGP4 UI_LoginMenu
CALLV
pop
line 247
;247:		break;
ADDRGP4 $122
JUMPV
LABELV $125
line 251
;248:
;249:	case ID_LOGOUT:
;250:		// server side masqueraded player logout first
;251:		trap_CL_UI_RankUserRequestLogout();
ADDRGP4 trap_CL_UI_RankUserRequestLogout
CALLI4
pop
line 252
;252:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 253
;253:		break;
ADDRGP4 $122
JUMPV
LABELV $126
line 256
;254:		
;255:	case ID_CREATE:
;256:		UI_SignupMenu();
ADDRGP4 UI_SignupMenu
CALLV
pop
line 257
;257:		break;
ADDRGP4 $122
JUMPV
LABELV $127
line 260
;258:
;259:	case ID_SPECTATE:
;260:		trap_Cmd_ExecuteText( EXEC_APPEND, "cmd rank_spectate\n" );
CNSTI4 2
ARGI4
ADDRGP4 $128
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 261
;261:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 262
;262:		break;
ADDRGP4 $122
JUMPV
LABELV $129
line 265
;263:
;264:	case ID_SETUP:
;265:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 266
;266:		break;
ADDRGP4 $122
JUMPV
LABELV $130
line 269
;267:		
;268:	case ID_LEAVE:
;269:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $131
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 270
;270:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 271
;271:		break;
LABELV $121
LABELV $122
line 274
;272:
;273:	}
;274:}
LABELV $118
endproc Rankings_MenuEvent 8 8
export Rankings_MenuInit
proc Rankings_MenuInit 0 0
endproc Rankings_MenuInit 0 0
export Rankings_Cache
proc Rankings_Cache 0 0
endproc Rankings_Cache 0 0
export UI_RankingsMenu
proc UI_RankingsMenu 0 0
endproc UI_RankingsMenu 0 0
import trap_CL_UI_RankUserRequestLogout
bss
align 4
LABELV s_rankings_leave
skip 60
align 4
LABELV s_rankings_setup
skip 60
align 4
LABELV s_rankings_spectate
skip 60
align 4
LABELV s_rankings_create
skip 60
align 4
LABELV s_rankings_logout
skip 60
align 4
LABELV s_rankings_login
skip 60
align 4
LABELV s_rankings_menu
skip 416
align 4
LABELV s_rankings
skip 936
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
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
LABELV $259
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $254
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $236
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $218
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $200
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 32
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $182
byte 1 76
byte 1 79
byte 1 71
byte 1 79
byte 1 85
byte 1 84
byte 1 0
align 1
LABELV $164
byte 1 76
byte 1 79
byte 1 71
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $142
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
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $131
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 10
byte 1 0
