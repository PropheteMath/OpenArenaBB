data
align 4
LABELV s_login_color_prompt
byte 4 1065353216
byte 4 1054615798
byte 4 0
byte 4 1065353216
code
proc Login_MenuEvent 8 8
file "../../../code/q3_ui/ui_login.c"
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
;23://
;24:// ui_login.c
;25://
;26:
;27:#include "ui_local.h"
;28:
;29:
;30:#define LOGIN_FRAME		"menu/art_blueish/cut_frame"
;31:
;32:#define ID_NAME			100
;33:#define ID_NAME_BOX		101
;34:#define ID_PASSWORD		102
;35:#define ID_PASSWORD_BOX	103
;36:#define ID_LOGIN		104
;37:#define ID_CANCEL		105
;38:
;39:
;40:typedef struct
;41:{
;42:	menuframework_s	menu;
;43:	menubitmap_s	frame;
;44:	menutext_s		name;
;45:	menufield_s		name_box;
;46:	menutext_s		password;
;47:	menufield_s		password_box;
;48:	menutext_s		login;
;49:	menutext_s		cancel;
;50:} login_t;
;51:
;52:static login_t	s_login;
;53:
;54:static menuframework_s	s_login_menu;
;55:static menuaction_s		s_login_login;
;56:static menuaction_s		s_login_cancel;
;57:
;58:static vec4_t s_login_color_prompt  = {1.00, 0.43, 0.00, 1.00};
;59:
;60:/*
;61:===============
;62:Login_MenuEvent
;63:===============
;64:*/
;65:static void Login_MenuEvent( void* ptr, int event ) {
line 66
;66:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 67
;67:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 70
;68:	}
;69:
;70:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 104
EQI4 $86
ADDRLP4 0
INDIRI4
CNSTI4 105
EQI4 $93
ADDRGP4 $83
JUMPV
LABELV $86
line 80
;71:	case ID_LOGIN:
;72:		// set name								``
;73:		//trap_Cvar_Set( "name", s_login.name_box.field.buffer );
;74:		/*
;75:		trap_Cvar_Set( "rank_name", s_login.name_box.field.buffer );
;76:		trap_Cvar_Set( "rank_pwd", s_login.password_box.field.buffer );
;77:		*/
;78:
;79:		// login
;80:		trap_CL_UI_RankUserLogin(
ADDRGP4 s_login+576+60+12
ARGP4
ADDRGP4 s_login+980+60+12
ARGP4
ADDRGP4 trap_CL_UI_RankUserLogin
CALLI4
pop
line 84
;81:			s_login.name_box.field.buffer, 
;82:			s_login.password_box.field.buffer );
;83:
;84:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 85
;85:		break;
ADDRGP4 $84
JUMPV
LABELV $93
line 88
;86:		
;87:	case ID_CANCEL:
;88:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 89
;89:		break;
LABELV $83
LABELV $84
line 91
;90:	}
;91:}
LABELV $80
endproc Login_MenuEvent 8 8
export Login_MenuInit
proc Login_MenuInit 4 12
line 99
;92:
;93:
;94:/*
;95:===============
;96:Login_MenuInit
;97:===============
;98:*/
;99:void Login_MenuInit( void ) {
line 102
;100:	int				y;
;101:
;102:	memset( &s_login, 0, sizeof(s_login) );
ADDRGP4 s_login
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1456
ARGI4
ADDRGP4 memset
CALLP4
pop
line 104
;103:
;104:	Login_Cache();
ADDRGP4 Login_Cache
CALLV
pop
line 106
;105:
;106:	s_login.menu.wrapAround = qtrue;
ADDRGP4 s_login+404
CNSTI4 1
ASGNI4
line 107
;107:	s_login.menu.fullscreen = qfalse;
ADDRGP4 s_login+408
CNSTI4 0
ASGNI4
line 109
;108:
;109:	s_login.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_login+416
CNSTI4 6
ASGNI4
line 110
;110:	s_login.frame.generic.flags			= QMF_INACTIVE;
ADDRGP4 s_login+416+44
CNSTU4 16384
ASGNU4
line 111
;111:	s_login.frame.generic.name			= LOGIN_FRAME;
ADDRGP4 s_login+416+4
ADDRGP4 $102
ASGNP4
line 112
;112:	s_login.frame.generic.x				= 142; //320-233;
ADDRGP4 s_login+416+12
CNSTI4 142
ASGNI4
line 113
;113:	s_login.frame.generic.y				= 118; //240-166;
ADDRGP4 s_login+416+16
CNSTI4 118
ASGNI4
line 114
;114:	s_login.frame.width					= 359; //466;
ADDRGP4 s_login+416+76
CNSTI4 359
ASGNI4
line 115
;115:	s_login.frame.height				= 256; //332;
ADDRGP4 s_login+416+80
CNSTI4 256
ASGNI4
line 117
;116:
;117:	y = 214;
ADDRLP4 0
CNSTI4 214
ASGNI4
line 119
;118:
;119:	s_login.name.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_login+504
CNSTI4 9
ASGNI4
line 120
;120:	s_login.name.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_login+504+44
CNSTU4 16400
ASGNU4
line 121
;121:	s_login.name.generic.id				= ID_NAME;
ADDRGP4 s_login+504+8
CNSTI4 100
ASGNI4
line 122
;122:	s_login.name.generic.x				= 310;
ADDRGP4 s_login+504+12
CNSTI4 310
ASGNI4
line 123
;123:	s_login.name.generic.y				= y;
ADDRGP4 s_login+504+16
ADDRLP4 0
INDIRI4
ASGNI4
line 124
;124:	s_login.name.string					= "NAME";
ADDRGP4 s_login+504+60
ADDRGP4 $122
ASGNP4
line 125
;125:	s_login.name.style					= UI_RIGHT|UI_SMALLFONT;
ADDRGP4 s_login+504+64
CNSTI4 18
ASGNI4
line 126
;126:	s_login.name.color					= s_login_color_prompt;
ADDRGP4 s_login+504+68
ADDRGP4 s_login_color_prompt
ASGNP4
line 128
;127:
;128:	s_login.name_box.generic.type		= MTYPE_FIELD;
ADDRGP4 s_login+576
CNSTI4 4
ASGNI4
line 129
;129:	s_login.name_box.generic.ownerdraw	= Rankings_DrawName;
ADDRGP4 s_login+576+56
ADDRGP4 Rankings_DrawName
ASGNP4
line 130
;130:	s_login.name_box.generic.name		= "";
ADDRGP4 s_login+576+4
ADDRGP4 $132
ASGNP4
line 131
;131:	s_login.name_box.generic.flags		= 0;
ADDRGP4 s_login+576+44
CNSTU4 0
ASGNU4
line 132
;132:	s_login.name_box.generic.x			= 330;
ADDRGP4 s_login+576+12
CNSTI4 330
ASGNI4
line 133
;133:	s_login.name_box.generic.y			= y;
ADDRGP4 s_login+576+16
ADDRLP4 0
INDIRI4
ASGNI4
line 134
;134:	s_login.name_box.field.widthInChars	= 16;
ADDRGP4 s_login+576+60+8
CNSTI4 16
ASGNI4
line 135
;135:	s_login.name_box.field.maxchars		= 16;
ADDRGP4 s_login+576+60+268
CNSTI4 16
ASGNI4
line 136
;136:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 138
;137:	
;138:	s_login.password.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_login+908
CNSTI4 9
ASGNI4
line 139
;139:	s_login.password.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_login+908+44
CNSTU4 16400
ASGNU4
line 140
;140:	s_login.password.generic.id			= ID_PASSWORD;
ADDRGP4 s_login+908+8
CNSTI4 102
ASGNI4
line 141
;141:	s_login.password.generic.x			= 310;
ADDRGP4 s_login+908+12
CNSTI4 310
ASGNI4
line 142
;142:	s_login.password.generic.y			= y;
ADDRGP4 s_login+908+16
ADDRLP4 0
INDIRI4
ASGNI4
line 143
;143:	s_login.password.string				= "PASSWORD";
ADDRGP4 s_login+908+60
ADDRGP4 $156
ASGNP4
line 144
;144:	s_login.password.style				= UI_RIGHT|UI_SMALLFONT;
ADDRGP4 s_login+908+64
CNSTI4 18
ASGNI4
line 145
;145:	s_login.password.color				= s_login_color_prompt;
ADDRGP4 s_login+908+68
ADDRGP4 s_login_color_prompt
ASGNP4
line 147
;146:
;147:	s_login.password_box.generic.type		= MTYPE_FIELD;
ADDRGP4 s_login+980
CNSTI4 4
ASGNI4
line 148
;148:	s_login.password_box.generic.ownerdraw	= Rankings_DrawPassword;
ADDRGP4 s_login+980+56
ADDRGP4 Rankings_DrawPassword
ASGNP4
line 149
;149:	s_login.password_box.generic.name		= "";
ADDRGP4 s_login+980+4
ADDRGP4 $132
ASGNP4
line 150
;150:	s_login.password_box.generic.flags		= 0;
ADDRGP4 s_login+980+44
CNSTU4 0
ASGNU4
line 151
;151:	s_login.password_box.generic.x			= 330;
ADDRGP4 s_login+980+12
CNSTI4 330
ASGNI4
line 152
;152:	s_login.password_box.generic.y			= y;
ADDRGP4 s_login+980+16
ADDRLP4 0
INDIRI4
ASGNI4
line 153
;153:	s_login.password_box.field.widthInChars	= 16;
ADDRGP4 s_login+980+60+8
CNSTI4 16
ASGNI4
line 154
;154:	s_login.password_box.field.maxchars		= 16;
ADDRGP4 s_login+980+60+268
CNSTI4 16
ASGNI4
line 155
;155:	y += 40;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 157
;156:
;157:	s_login.login.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_login+1312
CNSTI4 9
ASGNI4
line 158
;158:	s_login.login.generic.flags				= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_login+1312+44
CNSTU4 272
ASGNU4
line 159
;159:	s_login.login.generic.id				= ID_LOGIN;
ADDRGP4 s_login+1312+8
CNSTI4 104
ASGNI4
line 160
;160:	s_login.login.generic.callback			= Login_MenuEvent;
ADDRGP4 s_login+1312+48
ADDRGP4 Login_MenuEvent
ASGNP4
line 161
;161:	s_login.login.generic.x					= 310;
ADDRGP4 s_login+1312+12
CNSTI4 310
ASGNI4
line 162
;162:	s_login.login.generic.y					= y;
ADDRGP4 s_login+1312+16
ADDRLP4 0
INDIRI4
ASGNI4
line 163
;163:	s_login.login.string					= "LOGIN";
ADDRGP4 s_login+1312+60
ADDRGP4 $191
ASGNP4
line 164
;164:	s_login.login.style						= UI_RIGHT|UI_SMALLFONT;
ADDRGP4 s_login+1312+64
CNSTI4 18
ASGNI4
line 165
;165:	s_login.login.color						= colorRed;
ADDRGP4 s_login+1312+68
ADDRGP4 colorRed
ASGNP4
line 167
;166:
;167:	s_login.cancel.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_login+1384
CNSTI4 9
ASGNI4
line 168
;168:	s_login.cancel.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_login+1384+44
CNSTU4 260
ASGNU4
line 169
;169:	s_login.cancel.generic.id				= ID_CANCEL;
ADDRGP4 s_login+1384+8
CNSTI4 105
ASGNI4
line 170
;170:	s_login.cancel.generic.callback			= Login_MenuEvent;
ADDRGP4 s_login+1384+48
ADDRGP4 Login_MenuEvent
ASGNP4
line 171
;171:	s_login.cancel.generic.x				= 330;
ADDRGP4 s_login+1384+12
CNSTI4 330
ASGNI4
line 172
;172:	s_login.cancel.generic.y				= y;
ADDRGP4 s_login+1384+16
ADDRLP4 0
INDIRI4
ASGNI4
line 173
;173:	s_login.cancel.string					= "CANCEL";
ADDRGP4 s_login+1384+60
ADDRGP4 $209
ASGNP4
line 174
;174:	s_login.cancel.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_login+1384+64
CNSTI4 16
ASGNI4
line 175
;175:	s_login.cancel.color					= colorRed;
ADDRGP4 s_login+1384+68
ADDRGP4 colorRed
ASGNP4
line 176
;176:	y += 20;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 178
;177:
;178:	Menu_AddItem( &s_login.menu, (void*) &s_login.frame );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 179
;179:	Menu_AddItem( &s_login.menu, (void*) &s_login.name );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 180
;180:	Menu_AddItem( &s_login.menu, (void*) &s_login.name_box );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 181
;181:	Menu_AddItem( &s_login.menu, (void*) &s_login.password );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 182
;182:	Menu_AddItem( &s_login.menu, (void*) &s_login.password_box );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 183
;183:	Menu_AddItem( &s_login.menu, (void*) &s_login.login );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+1312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 184
;184:	Menu_AddItem( &s_login.menu, (void*) &s_login.cancel );
ADDRGP4 s_login
ARGP4
ADDRGP4 s_login+1384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 185
;185:}
LABELV $94
endproc Login_MenuInit 4 12
export Login_Cache
proc Login_Cache 0 4
line 193
;186:
;187:
;188:/*
;189:===============
;190:Login_Cache
;191:===============
;192:*/
;193:void Login_Cache( void ) {
line 194
;194:	trap_R_RegisterShaderNoMip( LOGIN_FRAME );
ADDRGP4 $102
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 195
;195:}
LABELV $221
endproc Login_Cache 0 4
export UI_LoginMenu
proc UI_LoginMenu 0 4
line 203
;196:
;197:
;198:/*
;199:===============
;200:UI_LoginMenu
;201:===============
;202:*/
;203:void UI_LoginMenu( void ) {
line 204
;204:	Login_MenuInit();
ADDRGP4 Login_MenuInit
CALLV
pop
line 205
;205:	UI_PushMenu ( &s_login.menu );
ADDRGP4 s_login
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 206
;206:}
LABELV $222
endproc UI_LoginMenu 0 4
import trap_CL_UI_RankUserLogin
bss
align 4
LABELV s_login_cancel
skip 60
align 4
LABELV s_login_login
skip 60
align 4
LABELV s_login_menu
skip 416
align 4
LABELV s_login
skip 1456
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
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
LABELV $209
byte 1 67
byte 1 65
byte 1 78
byte 1 67
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $191
byte 1 76
byte 1 79
byte 1 71
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $156
byte 1 80
byte 1 65
byte 1 83
byte 1 83
byte 1 87
byte 1 79
byte 1 82
byte 1 68
byte 1 0
align 1
LABELV $132
byte 1 0
align 1
LABELV $122
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $102
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
