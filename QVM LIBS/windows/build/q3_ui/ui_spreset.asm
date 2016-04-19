export Reset_MenuEvent
code
proc Reset_MenuEvent 0 8
file "../../../code/q3_ui/ui_spreset.c"
line 54
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
;22:/*
;23:=======================================================================
;24:
;25:RESET MENU
;26:
;27:=======================================================================
;28:*/
;29:
;30:#include "ui_local.h"
;31:
;32:
;33:#define ART_FRAME					"menu/art/cut_frame"
;34:
;35:#define ID_NO		100
;36:#define ID_YES		101
;37:
;38:typedef struct
;39:{
;40:	menuframework_s menu;
;41:	menutext_s		no;
;42:	menutext_s		yes;
;43:	int				slashX;
;44:} resetMenu_t;
;45:
;46:static resetMenu_t	s_reset;
;47:
;48:
;49:/*
;50:=================
;51:Reset_MenuEvent
;52:=================
;53:*/
;54:void Reset_MenuEvent(void* ptr, int event) {
line 55
;55:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $81
line 56
;56:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 59
;57:	}
;58:
;59:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;60:
;61:	if( ((menucommon_s*)ptr)->id == ID_NO ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 100
NEI4 $83
line 62
;62:		return;
ADDRGP4 $80
JUMPV
LABELV $83
line 66
;63:	}
;64:
;65:	// reset the game, pop the level menu and restart it so it updates
;66:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 67
;67:	trap_Cvar_SetValue( "ui_spSelection", 0 );
ADDRGP4 $85
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 68
;68:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 69
;69:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 70
;70:}
LABELV $80
endproc Reset_MenuEvent 0 8
proc Reset_MenuKey 32 8
line 78
;71:
;72:
;73:/*
;74:=================
;75:Reset_MenuKey
;76:=================
;77:*/
;78:static sfxHandle_t Reset_MenuKey( int key ) {
line 79
;79:	switch ( key ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 110
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $90
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $95
LABELV $94
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 78
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $90
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $87
LABELV $96
ADDRFP4 0
INDIRI4
CNSTI4 89
EQI4 $92
ADDRGP4 $87
JUMPV
LABELV $95
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 121
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $92
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $87
LABELV $97
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 134
EQI4 $89
ADDRLP4 24
INDIRI4
CNSTI4 135
EQI4 $89
ADDRGP4 $87
JUMPV
LABELV $89
line 82
;80:	case K_LEFTARROW:
;81:	case K_RIGHTARROW:
;82:		key = K_TAB;
ADDRFP4 0
CNSTI4 9
ASGNI4
line 83
;83:		break;
ADDRGP4 $88
JUMPV
LABELV $90
line 87
;84:
;85:	case 'n':
;86:	case 'N':
;87:		Reset_MenuEvent( &s_reset.no, QM_ACTIVATED );
ADDRGP4 s_reset+416
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Reset_MenuEvent
CALLV
pop
line 88
;88:		break;
ADDRGP4 $88
JUMPV
LABELV $92
line 92
;89:
;90:	case 'y':
;91:	case 'Y':
;92:		Reset_MenuEvent( &s_reset.yes, QM_ACTIVATED );
ADDRGP4 s_reset+488
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Reset_MenuEvent
CALLV
pop
line 93
;93:		break;
LABELV $87
LABELV $88
line 96
;94:	}
;95:
;96:	return Menu_DefaultKey( &s_reset.menu, key );
ADDRGP4 s_reset
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $86
endproc Reset_MenuKey 32 8
proc Reset_MenuDraw 0 20
line 105
;97:}
;98:
;99:
;100:/*
;101:=================
;102:Reset_MenuDraw
;103:=================
;104:*/
;105:static void Reset_MenuDraw( void ) {
line 106
;106:	UI_DrawNamedPic( 142, 118, 359, 256, ART_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $99
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 107
;107:	UI_DrawProportionalString( 320, 194 + 10, "RESET GAME?", UI_CENTER|UI_INVERSE, color_red );
CNSTI4 320
ARGI4
CNSTI4 204
ARGI4
ADDRGP4 $100
ARGP4
CNSTI4 8193
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 108
;108:	UI_DrawProportionalString( s_reset.slashX, 265, "/", UI_LEFT|UI_INVERSE, color_red );
ADDRGP4 s_reset+560
INDIRI4
ARGI4
CNSTI4 265
ARGI4
ADDRGP4 $102
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 109
;109:	Menu_Draw( &s_reset.menu );
ADDRGP4 s_reset
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 111
;110:
;111:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $103
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 112
;112:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $104
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 113
;113:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 410
ARGI4
ADDRGP4 $105
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 114
;114:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 437
ARGI4
ADDRGP4 $106
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 115
;115:}
LABELV $98
endproc Reset_MenuDraw 0 20
export Reset_Cache
proc Reset_Cache 0 4
line 123
;116:
;117:
;118:/*
;119:=================
;120:Reset_Cache
;121:=================
;122:*/
;123:void Reset_Cache( void ) {
line 124
;124:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $99
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 125
;125:}
LABELV $107
endproc Reset_Cache 0 4
export UI_ResetMenu
proc UI_ResetMenu 3120 12
line 133
;126:
;127:
;128:/*
;129:=================
;130:UI_ResetMenu
;131:=================
;132:*/
;133:void UI_ResetMenu(void) {
line 139
;134:	uiClientState_t	cstate;
;135:	int	n1, n2, n3;
;136:	int	l1, l2, l3;
;137:
;138:	// zero set all our globals
;139:	memset( &s_reset, 0, sizeof(s_reset) );
ADDRGP4 s_reset
ARGP4
CNSTI4 0
ARGI4
CNSTI4 564
ARGI4
ADDRGP4 memset
CALLP4
pop
line 141
;140:
;141:	Reset_Cache();
ADDRGP4 Reset_Cache
CALLV
pop
line 143
;142:
;143:	n1 = UI_ProportionalStringWidth( "YES/NO" );
ADDRGP4 $109
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 144
;144:	n2 = UI_ProportionalStringWidth( "YES" ) + PROP_GAP_WIDTH;
ADDRGP4 $110
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 145
;145:	n3 = UI_ProportionalStringWidth( "/" )  + PROP_GAP_WIDTH;
ADDRGP4 $102
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 146
;146:	l1 = 320 - ( n1 / 2 );
ADDRLP4 0
CNSTI4 320
ADDRLP4 3092
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 147
;147:	l2 = l1 + n2;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 3096
INDIRI4
ADDI4
ASGNI4
line 148
;148:	l3 = l2 + n3;
ADDRLP4 3104
ADDRLP4 4
INDIRI4
ADDRLP4 3100
INDIRI4
ADDI4
ASGNI4
line 149
;149:	s_reset.slashX = l2;
ADDRGP4 s_reset+560
ADDRLP4 4
INDIRI4
ASGNI4
line 151
;150:
;151:	s_reset.menu.draw       = Reset_MenuDraw;
ADDRGP4 s_reset+396
ADDRGP4 Reset_MenuDraw
ASGNP4
line 152
;152:	s_reset.menu.key        = Reset_MenuKey;
ADDRGP4 s_reset+400
ADDRGP4 Reset_MenuKey
ASGNP4
line 153
;153:	s_reset.menu.wrapAround = qtrue;
ADDRGP4 s_reset+404
CNSTI4 1
ASGNI4
line 155
;154:
;155:	trap_GetClientState( &cstate );
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 157
;156:
;157:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $115
line 159
;158:		// float on top of running game
;159:		s_reset.menu.fullscreen = qfalse;
ADDRGP4 s_reset+408
CNSTI4 0
ASGNI4
line 160
;160:	}
ADDRGP4 $116
JUMPV
LABELV $115
line 161
;161:	else {
line 163
;162:		// game not running
;163:		s_reset.menu.fullscreen = qtrue;
ADDRGP4 s_reset+408
CNSTI4 1
ASGNI4
line 164
;164:	}
LABELV $116
line 166
;165:
;166:	s_reset.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_reset+488
CNSTI4 9
ASGNI4
line 167
;167:	s_reset.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_reset+488+44
CNSTU4 260
ASGNU4
line 168
;168:	s_reset.yes.generic.callback	= Reset_MenuEvent;
ADDRGP4 s_reset+488+48
ADDRGP4 Reset_MenuEvent
ASGNP4
line 169
;169:	s_reset.yes.generic.id			= ID_YES;
ADDRGP4 s_reset+488+8
CNSTI4 101
ASGNI4
line 170
;170:	s_reset.yes.generic.x			= l1;
ADDRGP4 s_reset+488+12
ADDRLP4 0
INDIRI4
ASGNI4
line 171
;171:	s_reset.yes.generic.y			= 264;
ADDRGP4 s_reset+488+16
CNSTI4 264
ASGNI4
line 172
;172:	s_reset.yes.string				= "YES";
ADDRGP4 s_reset+488+60
ADDRGP4 $110
ASGNP4
line 173
;173:	s_reset.yes.color				= color_red;
ADDRGP4 s_reset+488+68
ADDRGP4 color_red
ASGNP4
line 174
;174:	s_reset.yes.style				= UI_LEFT;
ADDRGP4 s_reset+488+64
CNSTI4 0
ASGNI4
line 176
;175:
;176:	s_reset.no.generic.type			= MTYPE_PTEXT;      
ADDRGP4 s_reset+416
CNSTI4 9
ASGNI4
line 177
;177:	s_reset.no.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_reset+416+44
CNSTU4 260
ASGNU4
line 178
;178:	s_reset.no.generic.callback		= Reset_MenuEvent;
ADDRGP4 s_reset+416+48
ADDRGP4 Reset_MenuEvent
ASGNP4
line 179
;179:	s_reset.no.generic.id			= ID_NO;
ADDRGP4 s_reset+416+8
CNSTI4 100
ASGNI4
line 180
;180:	s_reset.no.generic.x		    = l3;
ADDRGP4 s_reset+416+12
ADDRLP4 3104
INDIRI4
ASGNI4
line 181
;181:	s_reset.no.generic.y		    = 264;
ADDRGP4 s_reset+416+16
CNSTI4 264
ASGNI4
line 182
;182:	s_reset.no.string				= "NO";
ADDRGP4 s_reset+416+60
ADDRGP4 $149
ASGNP4
line 183
;183:	s_reset.no.color			    = color_red;
ADDRGP4 s_reset+416+68
ADDRGP4 color_red
ASGNP4
line 184
;184:	s_reset.no.style			    = UI_LEFT;
ADDRGP4 s_reset+416+64
CNSTI4 0
ASGNI4
line 186
;185:
;186:	Menu_AddItem( &s_reset.menu,	&s_reset.yes );             
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 187
;187:	Menu_AddItem( &s_reset.menu,	&s_reset.no );
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 189
;188:
;189:	UI_PushMenu( &s_reset.menu );
ADDRGP4 s_reset
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 191
;190:
;191:	Menu_SetCursorToItem( &s_reset.menu, &s_reset.no );
ADDRGP4 s_reset
ARGP4
ADDRGP4 s_reset+416
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 192
;192:}
LABELV $108
endproc UI_ResetMenu 3120 12
bss
align 4
LABELV s_reset
skip 564
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
LABELV $149
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $110
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $109
byte 1 89
byte 1 69
byte 1 83
byte 1 47
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $105
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $104
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $103
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 47
byte 1 0
align 1
LABELV $100
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $99
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
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
LABELV $85
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
