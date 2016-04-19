export Main_MenuEvent
code
proc Main_MenuEvent 8 8
file "../../../code/q3_ui/ui_menu.c"
line 96
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
;26:MAIN MENU
;27:
;28:=======================================================================
;29:*/
;30:
;31:
;32:#include "ui_local.h"
;33:
;34:
;35:#define ID_SINGLEPLAYER			10
;36:#define ID_MULTIPLAYER			11
;37:#define ID_SETUP				12
;38:#define ID_DEMOS				13
;39://#define ID_CINEMATICS			14
;40:#define ID_CHALLENGES                   14
;41:#define ID_TEAMARENA		15
;42:#define ID_MODS					16
;43:#define ID_EXIT					17
;44:
;45:#define MAIN_BANNER_MODEL				"models/mapobjects/banner/banner5.md3"
;46:#define MAIN_MENU_VERTICAL_SPACING		34
;47:
;48:
;49:typedef struct {
;50:	menuframework_s	menu;
;51:
;52:	menutext_s		singleplayer;
;53:	menutext_s		multiplayer;
;54:	menutext_s		setup;
;55:	// menutext_s		demos;
;56:	//menutext_s		cinematics;
;57:        menutext_s              challenges;
;58:	menutext_s		teamArena;
;59:	// menutext_s		mods;
;60:	menutext_s		exit;
;61:
;62:	qhandle_t		bannerModel;
;63:} mainmenu_t;
;64:
;65:
;66:static mainmenu_t s_main;
;67:
;68:typedef struct {
;69:	menuframework_s menu;	
;70:	char errorMessage[4096];
;71:} errorMessage_t;
;72:
;73:static errorMessage_t s_errorMessage;
;74:
;75:/*
;76:=================
;77:MainMenu_ExitAction
;78:=================
;79:*/
;80:/*static void MainMenu_ExitAction( qboolean result ) {
;81:	if( !result ) {
;82:		return;
;83:	}
;84:	UI_PopMenu();
;85:	//UI_CreditMenu();
;86:        trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
;87:}*/
;88:
;89:
;90:
;91:/*
;92:=================
;93:Main_MenuEvent
;94:=================
;95:*/
;96:void Main_MenuEvent (void* ptr, int event) {
line 97
;97:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 98
;98:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 101
;99:	}
;100:
;101:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 17
GTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $99-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $99
address $87
address $88
address $92
address $84
address $93
address $94
address $84
address $98
code
LABELV $87
line 103
;102:	case ID_SINGLEPLAYER:
;103:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 104
;104:		break;
ADDRGP4 $85
JUMPV
LABELV $88
line 107
;105:
;106:	case ID_MULTIPLAYER:
;107:            if(ui_setupchecked.integer)
ADDRGP4 ui_setupchecked+12
INDIRI4
CNSTI4 0
EQI4 $89
line 108
;108:		UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
ADDRGP4 $85
JUMPV
LABELV $89
line 110
;109:            else
;110:                UI_FirstConnectMenu();
ADDRGP4 UI_FirstConnectMenu
CALLV
pop
line 111
;111:		break;
ADDRGP4 $85
JUMPV
LABELV $92
line 114
;112:
;113:	case ID_SETUP:
;114:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 115
;115:		break;
ADDRGP4 $85
JUMPV
LABELV $93
line 126
;116:
;117:	// case ID_DEMOS:
;118:		// UI_DemosMenu();
;119:		// break;
;120:
;121:	/*case ID_CINEMATICS:
;122:		UI_CinematicsMenu();
;123:		break;*/
;124:
;125:            case ID_CHALLENGES:
;126:                UI_Challenges();
ADDRGP4 UI_Challenges
CALLV
pop
line 127
;127:                break;
ADDRGP4 $85
JUMPV
LABELV $94
line 134
;128:
;129:	// case ID_MODS:
;130:		// UI_ModsMenu();
;131:		// break;
;132:
;133:	case ID_TEAMARENA:
;134:		trap_Cvar_Set( "fs_game", "missionpack");
ADDRGP4 $95
ARGP4
ADDRGP4 $96
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 135
;135:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $97
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 136
;136:		break;
ADDRGP4 $85
JUMPV
LABELV $98
line 140
;137:
;138:	case ID_EXIT:
;139:		//UI_ConfirmMenu( "EXIT GAME?", 0, MainMenu_ExitAction );
;140:                UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 141
;141:		break;
LABELV $84
LABELV $85
line 143
;142:	}
;143:}
LABELV $81
endproc Main_MenuEvent 8 8
export MainMenu_Cache
proc MainMenu_Cache 4 4
line 151
;144:
;145:
;146:/*
;147:===============
;148:MainMenu_Cache
;149:===============
;150:*/
;151:void MainMenu_Cache( void ) {
line 152
;152:	s_main.bannerModel = trap_R_RegisterModel( MAIN_BANNER_MODEL );
ADDRGP4 $103
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 s_main+848
ADDRLP4 0
INDIRI4
ASGNI4
line 153
;153:}
LABELV $101
endproc MainMenu_Cache 4 4
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
line 156
;154:
;155:sfxHandle_t ErrorMessage_Key(int key)
;156:{
line 157
;157:	trap_Cvar_Set( "com_errorMessage", "" );
ADDRGP4 $105
ARGP4
ADDRGP4 $106
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 158
;158:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 159
;159:	return (menu_null_sound);
ADDRGP4 menu_null_sound
INDIRI4
RETI4
LABELV $104
endproc ErrorMessage_Key 0 8
lit
align 4
LABELV $108
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
code
proc Main_MenuDraw 588 28
line 169
;160:}
;161:
;162:/*
;163:===============
;164:Main_MenuDraw
;165:TTimo: this function is common to the main menu and errorMessage menu
;166:===============
;167:*/
;168:
;169:static void Main_MenuDraw( void ) {
line 176
;170:	refdef_t		refdef;
;171:	refEntity_t		ent;
;172:	vec3_t			origin;
;173:	vec3_t			angles;
;174:	float			adjust;
;175:	float			x, y, w, h;
;176:	vec4_t			color = {0.2, 0.2, 1.0, 1};
ADDRLP4 552
ADDRGP4 $108
INDIRB
ASGNB 16
line 180
;177:
;178:	// setup the refdef
;179:
;180:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 182
;181:
;182:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 184
;183:
;184:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 186
;185:
;186:	x = 0;
ADDRLP4 536
CNSTF4 0
ASGNF4
line 187
;187:	y = 0;
ADDRLP4 540
CNSTF4 0
ASGNF4
line 188
;188:	w = 640;
ADDRLP4 544
CNSTF4 1142947840
ASGNF4
line 189
;189:	h = 120;
ADDRLP4 548
CNSTF4 1123024896
ASGNF4
line 190
;190:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 536
ARGP4
ADDRLP4 540
ARGP4
ADDRLP4 544
ARGP4
ADDRLP4 548
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 191
;191:	refdef.x = x;
ADDRLP4 0
ADDRLP4 536
INDIRF4
CVFI4 4
ASGNI4
line 192
;192:	refdef.y = y;
ADDRLP4 0+4
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 193
;193:	refdef.width = w;
ADDRLP4 0+8
ADDRLP4 544
INDIRF4
CVFI4 4
ASGNI4
line 194
;194:	refdef.height = h;
ADDRLP4 0+12
ADDRLP4 548
INDIRF4
CVFI4 4
ASGNI4
line 196
;195:
;196:	adjust = 0; // JDC: Kenneth asked me to stop this 1.0 * sin( (float)uis.realtime / 1000 );
ADDRLP4 520
CNSTF4 0
ASGNF4
line 197
;197:	refdef.fov_x = 60 + adjust;
ADDRLP4 0+16
ADDRLP4 520
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 198
;198:	refdef.fov_y = 19.6875 + adjust;
ADDRLP4 0+20
ADDRLP4 520
INDIRF4
CNSTF4 1100840960
ADDF4
ASGNF4
line 200
;199:
;200:	refdef.time = uis.realtime;
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 202
;201:
;202:	origin[0] = 300;
ADDRLP4 508
CNSTF4 1133903872
ASGNF4
line 203
;203:	origin[1] = 0;
ADDRLP4 508+4
CNSTF4 0
ASGNF4
line 204
;204:	origin[2] = -32;
ADDRLP4 508+8
CNSTF4 3254779904
ASGNF4
line 206
;205:
;206:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 210
;207:
;208:	// add the model
;209:
;210:	memset( &ent, 0, sizeof(ent) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 212
;211:
;212:	adjust = 5.0 * sin( (float)uis.realtime / 5000 );
ADDRGP4 uis+4
INDIRI4
CVIF4 4
CNSTF4 1167867904
DIVF4
ARGF4
ADDRLP4 568
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 520
CNSTF4 1084227584
ADDRLP4 568
INDIRF4
MULF4
ASGNF4
line 213
;213:	VectorSet( angles, 0, 180 + adjust, 0 );
ADDRLP4 524
CNSTF4 0
ASGNF4
ADDRLP4 524+4
ADDRLP4 520
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
ADDRLP4 524+8
CNSTF4 0
ASGNF4
line 214
;214:	AnglesToAxis( angles, ent.axis );
ADDRLP4 524
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 215
;215:	ent.hModel = s_main.bannerModel;
ADDRLP4 368+8
ADDRGP4 s_main+848
INDIRI4
ASGNI4
line 216
;216:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRLP4 508
INDIRB
ASGNB 12
line 217
;217:	VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 368+12
ADDRLP4 508
INDIRB
ASGNB 12
line 218
;218:	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 368+4
CNSTI4 192
ASGNI4
line 219
;219:	VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
line 221
;220:
;221:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 223
;222:
;223:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 225
;224:	
;225:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+416
ARGP4
ADDRLP4 572
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $131
line 226
;226:	{
line 227
;227:		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 600
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_errorMessage+416
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 228
;228:	}
ADDRGP4 $132
JUMPV
LABELV $131
line 230
;229:	else
;230:	{
line 232
;231:		// standard menu drawing
;232:		Menu_Draw( &s_main.menu );		
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 233
;233:	}
LABELV $132
line 242
;234:
;235:		// UI_DrawProportionalString( 320, 372, "", UI_CENTER|UI_SMALLFONT, color );
;236:		// UI_DrawString( 320, 400, "OpenArena(c) 2005-2012 OpenArena Team", UI_CENTER|UI_SMALLFONT, color );
;237:		// UI_DrawString( 320, 414, "OpenArena comes with ABSOLUTELY NO WARRANTY; this is free software", UI_CENTER|UI_SMALLFONT, color );
;238:		// UI_DrawString( 320, 428, "and you are welcome to redistribute it under certain conditions;", UI_CENTER|UI_SMALLFONT, color );
;239:		// UI_DrawString( 320, 444, "read COPYING for details.", UI_CENTER|UI_SMALLFONT, color );
;240:                
;241:                //Draw version.
;242:                UI_DrawString( 320, 480-14, "Version 0.8.8 for BlackBerry.", UI_CENTER|UI_SMALLFONT, color );
CNSTI4 320
ARGI4
CNSTI4 466
ARGI4
ADDRGP4 $135
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 243
;243:                if((int)trap_Cvar_VariableValue("protocol")!=71)
ADDRGP4 $138
ARGP4
ADDRLP4 576
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 576
INDIRF4
CVFI4 4
CNSTI4 71
EQI4 $136
line 244
;244:                    UI_DrawString( 0, 480-14, va("^7Protocol: %i",(int)trap_Cvar_VariableValue("protocol")), UI_SMALLFONT, color);
ADDRGP4 $138
ARGP4
ADDRLP4 580
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $139
ARGP4
ADDRLP4 580
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 584
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
CNSTI4 466
ARGI4
ADDRLP4 584
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $136
line 245
;245:}
LABELV $107
endproc Main_MenuDraw 588 28
proc UI_TeamArenaExists 2084 16
line 253
;246:
;247:
;248:/*
;249:===============
;250:UI_TeamArenaExists
;251:===============
;252:*/
;253:static qboolean UI_TeamArenaExists( void ) {
line 261
;254:	int		numdirs;
;255:	char	dirlist[2048];
;256:	char	*dirptr;
;257:  char  *descptr;
;258:	int		i;
;259:	int		dirlen;
;260:
;261:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $141
ARGP4
ADDRGP4 $106
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 262
;262:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 263
;263:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 264
;264:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 265
;265:    descptr = dirptr + dirlen;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 266
;266:		if (Q_stricmp(dirptr, "missionpack") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $146
line 267
;267:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $140
JUMPV
LABELV $146
line 269
;268:		}
;269:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
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
line 270
;270:	}
LABELV $143
line 263
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $142
line 271
;271:	return qfalse;
CNSTI4 0
RETI4
LABELV $140
endproc UI_TeamArenaExists 2084 16
export UI_MainMenu
proc UI_MainMenu 20 12
line 284
;272:}
;273:
;274:
;275:/*
;276:===============
;277:UI_MainMenu
;278:
;279:The main menu only comes up when not in a game,
;280:so make sure that the attract loop server is down
;281:and that local cinematics are killed
;282:===============
;283:*/
;284:void UI_MainMenu( void ) {
line 286
;285:	int		y;
;286:	qboolean teamArena = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 287
;287:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 289
;288:
;289:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $149
ARGP4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 290
;290:        trap_Cvar_SetValue( "handicap", 100 ); //Reset handicap during server change, it must be ser per game
ADDRGP4 $151
ARGP4
CNSTF4 1120403456
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 292
;291:
;292:	memset( &s_main, 0 ,sizeof(mainmenu_t) );
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 852
ARGI4
ADDRGP4 memset
CALLP4
pop
line 293
;293:	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4512
ARGI4
ADDRGP4 memset
CALLP4
pop
line 296
;294:
;295:	// com_errorMessage would need that too
;296:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 298
;297:	
;298:	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
ADDRGP4 $105
ARGP4
ADDRGP4 s_errorMessage+416
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 299
;299:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+416
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $154
line 300
;300:	{	
line 301
;301:		s_errorMessage.menu.draw = Main_MenuDraw;
ADDRGP4 s_errorMessage+396
ADDRGP4 Main_MenuDraw
ASGNP4
line 302
;302:		s_errorMessage.menu.key = ErrorMessage_Key;
ADDRGP4 s_errorMessage+400
ADDRGP4 ErrorMessage_Key
ASGNP4
line 303
;303:		s_errorMessage.menu.fullscreen = qtrue;
ADDRGP4 s_errorMessage+408
CNSTI4 1
ASGNI4
line 304
;304:		s_errorMessage.menu.wrapAround = qtrue;
ADDRGP4 s_errorMessage+404
CNSTI4 1
ASGNI4
line 305
;305:		s_errorMessage.menu.showlogo = qtrue;		
ADDRGP4 s_errorMessage+412
CNSTI4 1
ASGNI4
line 307
;306:
;307:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 308
;308:		uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 309
;309:		UI_PushMenu ( &s_errorMessage.menu );
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 311
;310:		
;311:		return;
ADDRGP4 $148
JUMPV
LABELV $154
line 314
;312:	}
;313:
;314:	s_main.menu.draw = Main_MenuDraw;
ADDRGP4 s_main+396
ADDRGP4 Main_MenuDraw
ASGNP4
line 315
;315:	s_main.menu.fullscreen = qtrue;
ADDRGP4 s_main+408
CNSTI4 1
ASGNI4
line 316
;316:	s_main.menu.wrapAround = qtrue;
ADDRGP4 s_main+404
CNSTI4 1
ASGNI4
line 317
;317:	s_main.menu.showlogo = qtrue;
ADDRGP4 s_main+412
CNSTI4 1
ASGNI4
line 319
;318:
;319:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 320
;320:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 321
;321:	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+416
CNSTI4 9
ASGNI4
line 322
;322:	s_main.singleplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+416+44
CNSTU4 264
ASGNU4
line 323
;323:	s_main.singleplayer.generic.x			= 320;
ADDRGP4 s_main+416+12
CNSTI4 320
ASGNI4
line 324
;324:	s_main.singleplayer.generic.y			= y;
ADDRGP4 s_main+416+16
ADDRLP4 0
INDIRI4
ASGNI4
line 325
;325:	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
ADDRGP4 s_main+416+8
CNSTI4 10
ASGNI4
line 326
;326:	s_main.singleplayer.generic.callback	= Main_MenuEvent; 
ADDRGP4 s_main+416+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 327
;327:	s_main.singleplayer.string				= "SINGLEPLAYER";
ADDRGP4 s_main+416+60
ADDRGP4 $180
ASGNP4
line 328
;328:	s_main.singleplayer.color				= color_red;
ADDRGP4 s_main+416+68
ADDRGP4 color_red
ASGNP4
line 329
;329:	s_main.singleplayer.style				= style;
ADDRGP4 s_main+416+64
ADDRLP4 4
INDIRI4
ASGNI4
line 331
;330:
;331:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 332
;332:	s_main.multiplayer.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+488
CNSTI4 9
ASGNI4
line 333
;333:	s_main.multiplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+488+44
CNSTU4 264
ASGNU4
line 334
;334:	s_main.multiplayer.generic.x			= 320;
ADDRGP4 s_main+488+12
CNSTI4 320
ASGNI4
line 335
;335:	s_main.multiplayer.generic.y			= y;
ADDRGP4 s_main+488+16
ADDRLP4 0
INDIRI4
ASGNI4
line 336
;336:	s_main.multiplayer.generic.id			= ID_MULTIPLAYER;
ADDRGP4 s_main+488+8
CNSTI4 11
ASGNI4
line 337
;337:	s_main.multiplayer.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+488+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 338
;338:	s_main.multiplayer.string				= "MULTIPLAYER";
ADDRGP4 s_main+488+60
ADDRGP4 $198
ASGNP4
line 339
;339:	s_main.multiplayer.color				= color_red;
ADDRGP4 s_main+488+68
ADDRGP4 color_red
ASGNP4
line 340
;340:	s_main.multiplayer.style				= style;
ADDRGP4 s_main+488+64
ADDRLP4 4
INDIRI4
ASGNI4
line 342
;341:
;342:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 343
;343:	s_main.setup.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+560
CNSTI4 9
ASGNI4
line 344
;344:	s_main.setup.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+560+44
CNSTU4 264
ASGNU4
line 345
;345:	s_main.setup.generic.x					= 320;
ADDRGP4 s_main+560+12
CNSTI4 320
ASGNI4
line 346
;346:	s_main.setup.generic.y					= y;
ADDRGP4 s_main+560+16
ADDRLP4 0
INDIRI4
ASGNI4
line 347
;347:	s_main.setup.generic.id					= ID_SETUP;
ADDRGP4 s_main+560+8
CNSTI4 12
ASGNI4
line 348
;348:	s_main.setup.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+560+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 349
;349:	s_main.setup.string						= "SETUP";
ADDRGP4 s_main+560+60
ADDRGP4 $216
ASGNP4
line 350
;350:	s_main.setup.color						= color_red;
ADDRGP4 s_main+560+68
ADDRGP4 color_red
ASGNP4
line 351
;351:	s_main.setup.style						= style;
ADDRGP4 s_main+560+64
ADDRLP4 4
INDIRI4
ASGNI4
line 375
;352:
;353:/*	y += MAIN_MENU_VERTICAL_SPACING;
;354: 	s_main.demos.generic.type				= MTYPE_PTEXT;
;355:	s_main.demos.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;356:	s_main.demos.generic.x					= 320;
;357:	s_main.demos.generic.y					= y;
;358:	s_main.demos.generic.id					= ID_DEMOS;
;359:	s_main.demos.generic.callback			= Main_MenuEvent; 
;360:	s_main.demos.string						= "DEMOS";
;361:	s_main.demos.color						= color_red;
;362:	s_main.demos.style						= style; */
;363:
;364:	/*y += MAIN_MENU_VERTICAL_SPACING;
;365:	s_main.cinematics.generic.type			= MTYPE_PTEXT;
;366:	s_main.cinematics.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;367:	s_main.cinematics.generic.x				= 320;
;368:	s_main.cinematics.generic.y				= y;
;369:	s_main.cinematics.generic.id			= ID_CINEMATICS;
;370:	s_main.cinematics.generic.callback		= Main_MenuEvent; 
;371:	s_main.cinematics.string				= "CINEMATICS";
;372:	s_main.cinematics.color					= color_red;
;373:	s_main.cinematics.style					= style;*/
;374:
;375:        y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 376
;376:	s_main.challenges.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+632
CNSTI4 9
ASGNI4
line 377
;377:	s_main.challenges.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+632+44
CNSTU4 264
ASGNU4
line 378
;378:	s_main.challenges.generic.x				= 320;
ADDRGP4 s_main+632+12
CNSTI4 320
ASGNI4
line 379
;379:	s_main.challenges.generic.y				= y;
ADDRGP4 s_main+632+16
ADDRLP4 0
INDIRI4
ASGNI4
line 380
;380:	s_main.challenges.generic.id			= ID_CHALLENGES;
ADDRGP4 s_main+632+8
CNSTI4 14
ASGNI4
line 381
;381:	s_main.challenges.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+632+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 382
;382:	s_main.challenges.string				= "STATISTICS";
ADDRGP4 s_main+632+60
ADDRGP4 $234
ASGNP4
line 383
;383:	s_main.challenges.color					= color_red;
ADDRGP4 s_main+632+68
ADDRGP4 color_red
ASGNP4
line 384
;384:	s_main.challenges.style					= style;
ADDRGP4 s_main+632+64
ADDRLP4 4
INDIRI4
ASGNI4
line 386
;385:
;386:	if (UI_TeamArenaExists()) {
ADDRLP4 16
ADDRGP4 UI_TeamArenaExists
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $239
line 387
;387:		teamArena = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 388
;388:		y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 389
;389:		s_main.teamArena.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+704
CNSTI4 9
ASGNI4
line 390
;390:		s_main.teamArena.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+704+44
CNSTU4 264
ASGNU4
line 391
;391:		s_main.teamArena.generic.x				= 320;
ADDRGP4 s_main+704+12
CNSTI4 320
ASGNI4
line 392
;392:		s_main.teamArena.generic.y				= y;
ADDRGP4 s_main+704+16
ADDRLP4 0
INDIRI4
ASGNI4
line 393
;393:		s_main.teamArena.generic.id				= ID_TEAMARENA;
ADDRGP4 s_main+704+8
CNSTI4 15
ASGNI4
line 394
;394:		s_main.teamArena.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+704+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 395
;395:		s_main.teamArena.string					= "MISSION PACK";
ADDRGP4 s_main+704+60
ADDRGP4 $254
ASGNP4
line 396
;396:		s_main.teamArena.color					= color_red;
ADDRGP4 s_main+704+68
ADDRGP4 color_red
ASGNP4
line 397
;397:		s_main.teamArena.style					= style;
ADDRGP4 s_main+704+64
ADDRLP4 4
INDIRI4
ASGNI4
line 398
;398:	}
LABELV $239
line 400
;399:
;400:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 411
;401:	// s_main.mods.generic.type			= MTYPE_PTEXT;
;402:	// s_main.mods.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;403:	// s_main.mods.generic.x				= 320;
;404:	// s_main.mods.generic.y				= y;
;405:	// s_main.mods.generic.id				= ID_MODS;
;406:	// s_main.mods.generic.callback		= Main_MenuEvent; 
;407:	// s_main.mods.string					= "MODS";
;408:	// s_main.mods.color					= color_red;
;409:	// s_main.mods.style					= style;
;410:
;411:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 412
;412:	s_main.exit.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+776
CNSTI4 9
ASGNI4
line 413
;413:	s_main.exit.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+776+44
CNSTU4 264
ASGNU4
line 414
;414:	s_main.exit.generic.x					= 320;
ADDRGP4 s_main+776+12
CNSTI4 320
ASGNI4
line 415
;415:	s_main.exit.generic.y					= y;
ADDRGP4 s_main+776+16
ADDRLP4 0
INDIRI4
ASGNI4
line 416
;416:	s_main.exit.generic.id					= ID_EXIT;
ADDRGP4 s_main+776+8
CNSTI4 17
ASGNI4
line 417
;417:	s_main.exit.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+776+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 418
;418:	s_main.exit.string						= "EXIT";
ADDRGP4 s_main+776+60
ADDRGP4 $272
ASGNP4
line 419
;419:	s_main.exit.color						= color_red;
ADDRGP4 s_main+776+68
ADDRGP4 color_red
ASGNP4
line 420
;420:	s_main.exit.style						= style;
ADDRGP4 s_main+776+64
ADDRLP4 4
INDIRI4
ASGNI4
line 422
;421:
;422:	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 423
;423:	Menu_AddItem( &s_main.menu,	&s_main.multiplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 424
;424:	Menu_AddItem( &s_main.menu,	&s_main.setup );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+560
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 427
;425:	// Menu_AddItem( &s_main.menu,	&s_main.demos );
;426:	//Menu_AddItem( &s_main.menu,	&s_main.cinematics );
;427:        Menu_AddItem( &s_main.menu,	&s_main.challenges );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 428
;428:	if (teamArena) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $281
line 429
;429:		Menu_AddItem( &s_main.menu,	&s_main.teamArena );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+704
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 430
;430:	}
LABELV $281
line 432
;431:	// Menu_AddItem( &s_main.menu,	&s_main.mods );
;432:	Menu_AddItem( &s_main.menu,	&s_main.exit );             
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 434
;433:
;434:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 435
;435:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 436
;436:	UI_PushMenu ( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 438
;437:		
;438:}
LABELV $148
endproc UI_MainMenu 20 12
bss
align 4
LABELV s_errorMessage
skip 4512
align 4
LABELV s_main
skip 852
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
LABELV $272
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $254
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $234
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 73
byte 1 83
byte 1 84
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $216
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $198
byte 1 77
byte 1 85
byte 1 76
byte 1 84
byte 1 73
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $180
byte 1 83
byte 1 73
byte 1 78
byte 1 71
byte 1 76
byte 1 69
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $151
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $150
byte 1 49
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $141
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
LABELV $139
byte 1 94
byte 1 55
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $138
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
LABELV $135
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 48
byte 1 46
byte 1 56
byte 1 46
byte 1 56
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 66
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 66
byte 1 101
byte 1 114
byte 1 114
byte 1 121
byte 1 46
byte 1 0
align 1
LABELV $106
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $97
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
LABELV $96
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $95
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
