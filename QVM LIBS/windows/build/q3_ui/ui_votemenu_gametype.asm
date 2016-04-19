data
align 4
LABELV votemenu_Gametype_artlist
address $79
address $80
address $81
address $82
byte 4 0
code
proc VoteMenu_Gametype_Event 12 8
file "../../../code/q3_ui/ui_votemenu_gametype.c"
line 104
;1:/*
;2:===========================================================================
;3:Copyright (C) 2009 Poul Sander
;4:
;5:This file is part of the Open Arena source code.
;6:
;7:Open Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Open Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Open Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:#include "ui_local.h"
;24:
;25:#define VOTEMENU_BACK0          "menu/art_blueish/back_0"
;26:#define VOTEMENU_BACK1          "menu/art_blueish/back_1"
;27:#define ART_FIGHT0		"menu/art_blueish/accept_0"
;28:#define ART_FIGHT1		"menu/art_blueish/accept_1"
;29:#define ART_BACKGROUND          "menu/art_blueish/addbotframe"
;30:
;31:static char* votemenu_Gametype_artlist[] =
;32:{
;33:	VOTEMENU_BACK0,
;34:	VOTEMENU_BACK1,
;35:        ART_FIGHT0,
;36:        ART_FIGHT1,
;37:	NULL
;38:};
;39:
;40:#define ID_BACK     100
;41:#define ID_GO       101
;42:#define ID_FFA        102
;43:#define ID_Tourney       103
;44:#define ID_TDM       104
;45:#define ID_CTF       105
;46:#define ID_1FCTF       106
;47:#define ID_Overload       107
;48:#define ID_Harvester      108
;49:#define ID_Elimination  109
;50:#define ID_CTFe         110
;51:#define ID_LMS          111
;52:#define ID_DOUBLED      112
;53:#define ID_DOM          113
;54:
;55:#define Gametype_MENU_VERTICAL_SPACING	19
;56:
;57:typedef struct
;58:{
;59:    menuframework_s	menu;
;60:    menutext_s		banner;
;61:    menubitmap_s	back;
;62:    menubitmap_s	go;
;63:
;64:    //Buttons:
;65:    menutext_s      bFFA;
;66:    menutext_s      bTourney;
;67:    menutext_s      bTDM;
;68:    menutext_s      bCTF;
;69:    menutext_s      b1FCTF;
;70:    menutext_s      bOverload;
;71:    menutext_s      bHarvester;
;72:    menutext_s      bElimination;
;73:    menutext_s      bCTFe;
;74:    menutext_s      bLMS;
;75:    menutext_s      bDOUBLED;
;76:    menutext_s      bDOM;
;77:
;78:    //Allowed:
;79:    qboolean        FFA;
;80:    qboolean        Tourney;
;81:    qboolean        TDM;
;82:    qboolean        CTF;
;83:    qboolean        _1FCTF;
;84:    qboolean        Overload;
;85:    qboolean        Harvester;
;86:    qboolean        Elimination;
;87:    qboolean        CTFe;
;88:    qboolean        LMS;
;89:    qboolean        DOUBLED;
;90:    qboolean        DOM;
;91:    int selection;
;92:} votemenu_t;
;93:
;94:static votemenu_t	s_votemenu_Gametype;
;95:
;96:void UI_VoteGametypeMenuInternal( void );
;97:
;98:/*
;99:=================
;100:VoteMenu_Gametype_Event
;101:=================
;102:*/
;103:static void VoteMenu_Gametype_Event( void* ptr, int event )
;104:{
line 105
;105:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $88
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $91
ADDRGP4 $85
JUMPV
line 106
;106:	{
LABELV $88
line 108
;107:		case ID_BACK:
;108:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $89
line 109
;109:				break;
ADDRGP4 $86
JUMPV
LABELV $89
line 111
;110:
;111:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 112
;112:			break;
ADDRGP4 $86
JUMPV
LABELV $91
line 114
;113:            case ID_GO:
;114:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 115
;115:                    return;
ADDRGP4 $84
JUMPV
LABELV $92
line 117
;116:                }
;117:                switch(s_votemenu_Gametype.selection) {
ADDRLP4 8
ADDRGP4 s_votemenu_Gametype+1576
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 102
LTI4 $86
ADDRLP4 8
INDIRI4
CNSTI4 113
GTI4 $86
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $121-408
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $121
address $97
address $99
address $101
address $103
address $105
address $107
address $109
address $111
address $113
address $115
address $117
address $119
code
LABELV $97
line 119
;118:                    case ID_FFA:
;119:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 0" );
CNSTI4 2
ARGI4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 120
;120:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 121
;121:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 122
;122:                        break;
ADDRGP4 $86
JUMPV
LABELV $99
line 124
;123:                        case ID_Tourney:
;124:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 1" );
CNSTI4 2
ARGI4
ADDRGP4 $100
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 125
;125:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 126
;126:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 127
;127:                        break;
ADDRGP4 $86
JUMPV
LABELV $101
line 129
;128:                        case ID_TDM:
;129:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 3" );
CNSTI4 2
ARGI4
ADDRGP4 $102
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 130
;130:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 131
;131:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;132:                        break;
ADDRGP4 $86
JUMPV
LABELV $103
line 134
;133:                        case ID_CTF:
;134:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 4" );
CNSTI4 2
ARGI4
ADDRGP4 $104
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 135
;135:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 136
;136:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 137
;137:                        break;
ADDRGP4 $86
JUMPV
LABELV $105
line 139
;138:                        case ID_1FCTF:
;139:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 5" );
CNSTI4 2
ARGI4
ADDRGP4 $106
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 140
;140:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 141
;141:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 142
;142:                        break;
ADDRGP4 $86
JUMPV
LABELV $107
line 144
;143:                        case ID_Overload:
;144:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 6" );
CNSTI4 2
ARGI4
ADDRGP4 $108
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 145
;145:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 146
;146:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 147
;147:                        break;
ADDRGP4 $86
JUMPV
LABELV $109
line 149
;148:                        case ID_Harvester:
;149:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 7" );
CNSTI4 2
ARGI4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 150
;150:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 151
;151:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 152
;152:                        break;
ADDRGP4 $86
JUMPV
LABELV $111
line 154
;153:                        case ID_Elimination:
;154:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 8" );
CNSTI4 2
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 155
;155:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 156
;156:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 157
;157:                        break;
ADDRGP4 $86
JUMPV
LABELV $113
line 159
;158:                        case ID_CTFe:
;159:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 9" );
CNSTI4 2
ARGI4
ADDRGP4 $114
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 160
;160:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 161
;161:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 162
;162:                        break;
ADDRGP4 $86
JUMPV
LABELV $115
line 164
;163:                        case ID_LMS:
;164:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 10" );
CNSTI4 2
ARGI4
ADDRGP4 $116
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 165
;165:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 166
;166:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 167
;167:                        break;
ADDRGP4 $86
JUMPV
LABELV $117
line 169
;168:                        case ID_DOUBLED:
;169:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 11" );
CNSTI4 2
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 170
;170:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 171
;171:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 172
;172:                        break;
ADDRGP4 $86
JUMPV
LABELV $119
line 174
;173:                        case ID_DOM:
;174:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_gametype 12" );
CNSTI4 2
ARGI4
ADDRGP4 $120
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 175
;175:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 176
;176:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 177
;177:                        break;
line 178
;178:                };
line 179
;179:                break;
ADDRGP4 $86
JUMPV
LABELV $85
line 181
;180:            default:
;181:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $123
line 182
;182:                    return;
ADDRGP4 $84
JUMPV
LABELV $123
line 184
;183:                }
;184:                if(s_votemenu_Gametype.selection != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu_Gametype+1576
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $86
line 185
;185:                    s_votemenu_Gametype.selection = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu_Gametype+1576
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 186
;186:                    UI_VoteGametypeMenuInternal();
ADDRGP4 UI_VoteGametypeMenuInternal
CALLV
pop
line 187
;187:                }
line 188
;188:                break;
LABELV $86
line 190
;189:	}
;190:}
LABELV $84
endproc VoteMenu_Gametype_Event 12 8
proc setGametypeMenutext 4 0
line 192
;191:
;192:static void setGametypeMenutext(menutext_s *menu,int y,int id,qboolean active,char *text) {
line 193
;193:    menu->generic.type            = MTYPE_PTEXT;
ADDRFP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 194
;194:    menu->color               = color_red;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_red
ASGNP4
line 195
;195:    menu->generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTU4 264
ASGNU4
line 196
;196:    if(!active)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $130
line 197
;197:        menu->generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $131
JUMPV
LABELV $130
line 199
;198:    else
;199:    if(s_votemenu_Gametype.selection == id)
ADDRGP4 s_votemenu_Gametype+1576
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $132
line 200
;200:         menu->color       = color_orange;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_orange
ASGNP4
LABELV $132
LABELV $131
line 201
;201:    menu->generic.x           = 320;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 320
ASGNI4
line 202
;202:    menu->generic.y           = y;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 203
;203:    menu->generic.id          = id;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 204
;204:    menu->generic.callback    = VoteMenu_Gametype_Event;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 VoteMenu_Gametype_Event
ASGNP4
line 205
;205:    menu->string              = text;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 206
;206:    menu->style               = UI_CENTER|UI_SMALLFONT;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 17
ASGNI4
line 207
;207:}
LABELV $129
endproc setGametypeMenutext 4 0
proc VoteMenu_Gametype_Cache 4 4
line 225
;208:
;209:/*
;210:=================
;211:VoteMenu_Gametype_MenuKey
;212:=================
;213:*/
;214:/*static sfxHandle_t VoteMenu_Gametype_MenuKey( int key )
;215:{
;216:	return ( Menu_DefaultKey( &s_votemenu_Gametype.menu, key ) );
;217:}*/
;218:
;219:/*
;220:=================
;221:VoteMenu_Gametype_Cache
;222:=================
;223:*/
;224:static void VoteMenu_Gametype_Cache( void )
;225:{
line 229
;226:	int	i;
;227:
;228:	// touch all our pics
;229:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $136
line 230
;230:	{
line 231
;231:		if (!votemenu_Gametype_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_Gametype_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 232
;232:			break;
ADDRGP4 $138
JUMPV
LABELV $140
line 233
;233:		trap_R_RegisterShaderNoMip(votemenu_Gametype_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_Gametype_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 234
;234:	}
LABELV $137
line 229
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $138
line 235
;235:}
LABELV $135
endproc VoteMenu_Gametype_Cache 4 4
proc UI_VoteMenu_Gametype_Draw 0 20
line 242
;236:
;237:/*
;238:=================
;239:UI_VoteMenu_Gametype_Draw
;240:=================
;241:*/
;242:static void UI_VoteMenu_Gametype_Draw( void ) {
line 243
;243:	UI_DrawBannerString( 320, 16, "CALL VOTE GAMETYPE", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $143
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 244
;244:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $144
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 247
;245:
;246:	// standard menu drawing
;247:	Menu_Draw( &s_votemenu_Gametype.menu );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 248
;248:}
LABELV $142
endproc UI_VoteMenu_Gametype_Draw 0 20
export UI_VoteGametypeMenuInternal
proc UI_VoteGametypeMenuInternal 4 20
line 257
;249:
;250:/*
;251:=================
;252:UI_VoteGametypeMenuInternal
;253: *Used then forcing a redraw
;254:=================
;255:*/
;256:void UI_VoteGametypeMenuInternal( void )
;257:{
line 260
;258:    int y;
;259:
;260:    VoteMenu_Gametype_Cache();
ADDRGP4 VoteMenu_Gametype_Cache
CALLV
pop
line 262
;261:
;262:    s_votemenu_Gametype.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu_Gametype+404
CNSTI4 1
ASGNI4
line 263
;263:    s_votemenu_Gametype.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu_Gametype+408
CNSTI4 0
ASGNI4
line 264
;264:    s_votemenu_Gametype.menu.draw = UI_VoteMenu_Gametype_Draw;
ADDRGP4 s_votemenu_Gametype+396
ADDRGP4 UI_VoteMenu_Gametype_Draw
ASGNP4
line 266
;265:
;266:    s_votemenu_Gametype.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu_Gametype+416
CNSTI4 10
ASGNI4
line 267
;267:    s_votemenu_Gametype.banner.generic.x	  = 320;
ADDRGP4 s_votemenu_Gametype+416+12
CNSTI4 320
ASGNI4
line 268
;268:    s_votemenu_Gametype.banner.generic.y	  = 16;
ADDRGP4 s_votemenu_Gametype+416+16
CNSTI4 16
ASGNI4
line 269
;269:    s_votemenu_Gametype.banner.string		  = "CALL VOTE GAMETYPE";
ADDRGP4 s_votemenu_Gametype+416+60
ADDRGP4 $143
ASGNP4
line 270
;270:    s_votemenu_Gametype.banner.color	      = color_white;
ADDRGP4 s_votemenu_Gametype+416+68
ADDRGP4 color_white
ASGNP4
line 271
;271:    s_votemenu_Gametype.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu_Gametype+416+64
CNSTI4 1
ASGNI4
line 273
;272:
;273:    y = 98;
ADDRLP4 0
CNSTI4 98
ASGNI4
line 274
;274:    setGametypeMenutext(&s_votemenu_Gametype.bFFA,y,ID_FFA,s_votemenu_Gametype.FFA,"Free for all");
ADDRGP4 s_votemenu_Gametype+664
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 102
ARGI4
ADDRGP4 s_votemenu_Gametype+1528
INDIRI4
ARGI4
ADDRGP4 $162
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 275
;275:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 276
;276:    setGametypeMenutext(&s_votemenu_Gametype.bTourney,y,ID_Tourney,s_votemenu_Gametype.Tourney,"Tournament");
ADDRGP4 s_votemenu_Gametype+736
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 103
ARGI4
ADDRGP4 s_votemenu_Gametype+1532
INDIRI4
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 277
;277:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 278
;278:    setGametypeMenutext(&s_votemenu_Gametype.bTDM,y,ID_TDM,s_votemenu_Gametype.TDM,"Team Deathmatch");
ADDRGP4 s_votemenu_Gametype+808
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 104
ARGI4
ADDRGP4 s_votemenu_Gametype+1536
INDIRI4
ARGI4
ADDRGP4 $168
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 279
;279:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 280
;280:    setGametypeMenutext(&s_votemenu_Gametype.bCTF,y,ID_CTF,s_votemenu_Gametype.CTF,"Capture the flag");
ADDRGP4 s_votemenu_Gametype+880
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 105
ARGI4
ADDRGP4 s_votemenu_Gametype+1540
INDIRI4
ARGI4
ADDRGP4 $171
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 281
;281:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 282
;282:    setGametypeMenutext(&s_votemenu_Gametype.b1FCTF,y,ID_1FCTF,s_votemenu_Gametype._1FCTF,"One flag capture");
ADDRGP4 s_votemenu_Gametype+952
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 106
ARGI4
ADDRGP4 s_votemenu_Gametype+1544
INDIRI4
ARGI4
ADDRGP4 $174
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 283
;283:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 284
;284:    setGametypeMenutext(&s_votemenu_Gametype.bOverload,y,ID_Overload,s_votemenu_Gametype.Overload,"Overload");
ADDRGP4 s_votemenu_Gametype+1024
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 107
ARGI4
ADDRGP4 s_votemenu_Gametype+1548
INDIRI4
ARGI4
ADDRGP4 $177
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 285
;285:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 286
;286:    setGametypeMenutext(&s_votemenu_Gametype.bHarvester,y,ID_Harvester,s_votemenu_Gametype.Harvester,"Harvester");
ADDRGP4 s_votemenu_Gametype+1096
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 108
ARGI4
ADDRGP4 s_votemenu_Gametype+1552
INDIRI4
ARGI4
ADDRGP4 $180
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 287
;287:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 288
;288:    setGametypeMenutext(&s_votemenu_Gametype.bElimination,y,ID_Elimination,s_votemenu_Gametype.Elimination,"Elimination");
ADDRGP4 s_votemenu_Gametype+1168
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 109
ARGI4
ADDRGP4 s_votemenu_Gametype+1556
INDIRI4
ARGI4
ADDRGP4 $183
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 289
;289:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 290
;290:    setGametypeMenutext(&s_votemenu_Gametype.bCTFe,y,ID_CTFe,s_votemenu_Gametype.CTFe,"CTF Elimination");
ADDRGP4 s_votemenu_Gametype+1240
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 110
ARGI4
ADDRGP4 s_votemenu_Gametype+1560
INDIRI4
ARGI4
ADDRGP4 $186
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 291
;291:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 292
;292:    setGametypeMenutext(&s_votemenu_Gametype.bLMS,y,ID_LMS,s_votemenu_Gametype.LMS,"Last man standing");
ADDRGP4 s_votemenu_Gametype+1312
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 111
ARGI4
ADDRGP4 s_votemenu_Gametype+1564
INDIRI4
ARGI4
ADDRGP4 $189
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 293
;293:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 294
;294:    setGametypeMenutext(&s_votemenu_Gametype.bDOUBLED,y,ID_DOUBLED,s_votemenu_Gametype.DOUBLED,"Double Domination");
ADDRGP4 s_votemenu_Gametype+1384
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 s_votemenu_Gametype+1568
INDIRI4
ARGI4
ADDRGP4 $192
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 295
;295:    y+=Gametype_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 296
;296:    setGametypeMenutext(&s_votemenu_Gametype.bDOM,y,ID_DOM,s_votemenu_Gametype.DOM,"Domination");
ADDRGP4 s_votemenu_Gametype+1456
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 113
ARGI4
ADDRGP4 s_votemenu_Gametype+1572
INDIRI4
ARGI4
ADDRGP4 $195
ARGP4
ADDRGP4 setGametypeMenutext
CALLV
pop
line 298
;297:
;298:    s_votemenu_Gametype.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_Gametype+488
CNSTI4 6
ASGNI4
line 299
;299:    s_votemenu_Gametype.back.generic.name     = VOTEMENU_BACK0;
ADDRGP4 s_votemenu_Gametype+488+4
ADDRGP4 $79
ASGNP4
line 300
;300:    s_votemenu_Gametype.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_Gametype+488+44
CNSTU4 260
ASGNU4
line 301
;301:    s_votemenu_Gametype.back.generic.callback = VoteMenu_Gametype_Event;
ADDRGP4 s_votemenu_Gametype+488+48
ADDRGP4 VoteMenu_Gametype_Event
ASGNP4
line 302
;302:    s_votemenu_Gametype.back.generic.id	   = ID_BACK;
ADDRGP4 s_votemenu_Gametype+488+8
CNSTI4 100
ASGNI4
line 303
;303:    s_votemenu_Gametype.back.generic.x		   = 320-128;
ADDRGP4 s_votemenu_Gametype+488+12
CNSTI4 192
ASGNI4
line 304
;304:    s_votemenu_Gametype.back.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_Gametype+488+16
CNSTI4 320
ASGNI4
line 305
;305:    s_votemenu_Gametype.back.width  		   = 128;
ADDRGP4 s_votemenu_Gametype+488+76
CNSTI4 128
ASGNI4
line 306
;306:    s_votemenu_Gametype.back.height  		   = 64;
ADDRGP4 s_votemenu_Gametype+488+80
CNSTI4 64
ASGNI4
line 307
;307:    s_votemenu_Gametype.back.focuspic         = VOTEMENU_BACK1;
ADDRGP4 s_votemenu_Gametype+488+60
ADDRGP4 $80
ASGNP4
line 309
;308:
;309:    s_votemenu_Gametype.go.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_Gametype+576
CNSTI4 6
ASGNI4
line 310
;310:    s_votemenu_Gametype.go.generic.name     = ART_FIGHT0;
ADDRGP4 s_votemenu_Gametype+576+4
ADDRGP4 $81
ASGNP4
line 311
;311:    s_votemenu_Gametype.go.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_Gametype+576+44
CNSTU4 260
ASGNU4
line 312
;312:    s_votemenu_Gametype.go.generic.callback = VoteMenu_Gametype_Event;
ADDRGP4 s_votemenu_Gametype+576+48
ADDRGP4 VoteMenu_Gametype_Event
ASGNP4
line 313
;313:    s_votemenu_Gametype.go.generic.id	   = ID_GO;
ADDRGP4 s_votemenu_Gametype+576+8
CNSTI4 101
ASGNI4
line 314
;314:    s_votemenu_Gametype.go.generic.x		   = 320;
ADDRGP4 s_votemenu_Gametype+576+12
CNSTI4 320
ASGNI4
line 315
;315:    s_votemenu_Gametype.go.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_Gametype+576+16
CNSTI4 320
ASGNI4
line 316
;316:    s_votemenu_Gametype.go.width  		   = 128;
ADDRGP4 s_votemenu_Gametype+576+76
CNSTI4 128
ASGNI4
line 317
;317:    s_votemenu_Gametype.go.height  		   = 64;
ADDRGP4 s_votemenu_Gametype+576+80
CNSTI4 64
ASGNI4
line 318
;318:    s_votemenu_Gametype.go.focuspic         = ART_FIGHT1;
ADDRGP4 s_votemenu_Gametype+576+60
ADDRGP4 $82
ASGNP4
line 319
;319:}
LABELV $145
endproc UI_VoteGametypeMenuInternal 4 20
export UI_VoteGametypeMenu
proc UI_VoteGametypeMenu 1084 12
line 327
;320:
;321:/*
;322:=================
;323:UI_VoteGametypeMenu
;324: *Called from outside
;325:=================
;326:*/
;327:void UI_VoteGametypeMenu( void ) {
line 330
;328:        char serverinfo[MAX_INFO_STRING], *gametypeinfo;
;329:        // zero set all our globals
;330:	memset( &s_votemenu_Gametype, 0 ,sizeof(votemenu_t) );
ADDRGP4 s_votemenu_Gametype
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1580
ARGI4
ADDRGP4 memset
CALLP4
pop
line 331
;331:        trap_GetConfigString( CS_SERVERINFO, serverinfo, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 332
;332:        gametypeinfo = Info_ValueForKey(serverinfo,"g_voteGametypes");
ADDRLP4 4
ARGP4
ADDRGP4 $235
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1028
INDIRP4
ASGNP4
line 333
;333:        if(!Q_stricmp(gametypeinfo,"*")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $238
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $236
line 334
;334:            s_votemenu_Gametype.FFA = qtrue;
ADDRGP4 s_votemenu_Gametype+1528
CNSTI4 1
ASGNI4
line 335
;335:            s_votemenu_Gametype.Tourney = qtrue;
ADDRGP4 s_votemenu_Gametype+1532
CNSTI4 1
ASGNI4
line 336
;336:            s_votemenu_Gametype.TDM = qtrue;
ADDRGP4 s_votemenu_Gametype+1536
CNSTI4 1
ASGNI4
line 337
;337:            s_votemenu_Gametype.CTF = qtrue;
ADDRGP4 s_votemenu_Gametype+1540
CNSTI4 1
ASGNI4
line 338
;338:            s_votemenu_Gametype._1FCTF = qtrue;
ADDRGP4 s_votemenu_Gametype+1544
CNSTI4 1
ASGNI4
line 339
;339:            s_votemenu_Gametype.Overload = qtrue;
ADDRGP4 s_votemenu_Gametype+1548
CNSTI4 1
ASGNI4
line 340
;340:            s_votemenu_Gametype.Harvester = qtrue;
ADDRGP4 s_votemenu_Gametype+1552
CNSTI4 1
ASGNI4
line 341
;341:            s_votemenu_Gametype.Elimination = qtrue;
ADDRGP4 s_votemenu_Gametype+1556
CNSTI4 1
ASGNI4
line 342
;342:            s_votemenu_Gametype.CTFe = qtrue;
ADDRGP4 s_votemenu_Gametype+1560
CNSTI4 1
ASGNI4
line 343
;343:            s_votemenu_Gametype.LMS = qtrue;
ADDRGP4 s_votemenu_Gametype+1564
CNSTI4 1
ASGNI4
line 344
;344:            s_votemenu_Gametype.DOUBLED = qtrue;
ADDRGP4 s_votemenu_Gametype+1568
CNSTI4 1
ASGNI4
line 345
;345:            s_votemenu_Gametype.DOM = qtrue;
ADDRGP4 s_votemenu_Gametype+1572
CNSTI4 1
ASGNI4
line 346
;346:        } else {
ADDRGP4 $237
JUMPV
LABELV $236
line 347
;347:            s_votemenu_Gametype.FFA = (qboolean)Q_stristr(gametypeinfo,"/0/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $252
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1528
ADDRLP4 1036
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 348
;348:            s_votemenu_Gametype.Tourney = (qboolean)Q_stristr(gametypeinfo,"/1/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1532
ADDRLP4 1040
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 349
;349:            s_votemenu_Gametype.TDM = (qboolean)Q_stristr(gametypeinfo,"/3/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1536
ADDRLP4 1044
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 350
;350:            s_votemenu_Gametype.CTF = (qboolean)Q_stristr(gametypeinfo,"/4/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1540
ADDRLP4 1048
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 351
;351:            s_votemenu_Gametype._1FCTF = (qboolean)Q_stristr(gametypeinfo,"/5/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1544
ADDRLP4 1052
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 352
;352:            s_votemenu_Gametype.Overload = (qboolean)Q_stristr(gametypeinfo,"/6/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1548
ADDRLP4 1056
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 353
;353:            s_votemenu_Gametype.Harvester = (qboolean)Q_stristr(gametypeinfo,"/7/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1552
ADDRLP4 1060
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 354
;354:            s_votemenu_Gametype.Elimination = (qboolean)Q_stristr(gametypeinfo,"/8/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1556
ADDRLP4 1064
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 355
;355:            s_votemenu_Gametype.CTFe = (qboolean)Q_stristr(gametypeinfo,"/9/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1560
ADDRLP4 1068
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 356
;356:            s_votemenu_Gametype.LMS = (qboolean)Q_stristr(gametypeinfo,"/10/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1564
ADDRLP4 1072
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 357
;357:            s_votemenu_Gametype.DOUBLED = (qboolean)Q_stristr(gametypeinfo,"/11/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1568
ADDRLP4 1076
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 358
;358:            s_votemenu_Gametype.DOM = (qboolean)Q_stristr(gametypeinfo,"/12/");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRGP4 s_votemenu_Gametype+1572
ADDRLP4 1080
INDIRP4
CVPU4 4
CVUI4 4
ASGNI4
line 359
;359:        }
LABELV $237
line 361
;360:
;361:        UI_VoteGametypeMenuInternal();
ADDRGP4 UI_VoteGametypeMenuInternal
CALLV
pop
line 363
;362:
;363:	Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.banner );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 364
;364:	Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.back );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 365
;365:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.go );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 366
;366:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bFFA );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 367
;367:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bTourney );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 368
;368:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bTDM );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 369
;369:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bCTF );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 370
;370:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.b1FCTF );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 371
;371:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bOverload );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 372
;372:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bHarvester );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 373
;373:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bElimination );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1168
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 374
;374:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bCTFe );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1240
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 375
;375:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bLMS );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 376
;376:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bDOUBLED );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 377
;377:        Menu_AddItem( &s_votemenu_Gametype.menu, (void*) &s_votemenu_Gametype.bDOM );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 s_votemenu_Gametype+1456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 379
;378:
;379:	UI_PushMenu( &s_votemenu_Gametype.menu );
ADDRGP4 s_votemenu_Gametype
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 380
;380:}
LABELV $234
endproc UI_VoteGametypeMenu 1084 12
bss
align 4
LABELV s_votemenu_Gametype
skip 1580
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
LABELV $274
byte 1 47
byte 1 49
byte 1 50
byte 1 47
byte 1 0
align 1
LABELV $272
byte 1 47
byte 1 49
byte 1 49
byte 1 47
byte 1 0
align 1
LABELV $270
byte 1 47
byte 1 49
byte 1 48
byte 1 47
byte 1 0
align 1
LABELV $268
byte 1 47
byte 1 57
byte 1 47
byte 1 0
align 1
LABELV $266
byte 1 47
byte 1 56
byte 1 47
byte 1 0
align 1
LABELV $264
byte 1 47
byte 1 55
byte 1 47
byte 1 0
align 1
LABELV $262
byte 1 47
byte 1 54
byte 1 47
byte 1 0
align 1
LABELV $260
byte 1 47
byte 1 53
byte 1 47
byte 1 0
align 1
LABELV $258
byte 1 47
byte 1 52
byte 1 47
byte 1 0
align 1
LABELV $256
byte 1 47
byte 1 51
byte 1 47
byte 1 0
align 1
LABELV $254
byte 1 47
byte 1 49
byte 1 47
byte 1 0
align 1
LABELV $252
byte 1 47
byte 1 48
byte 1 47
byte 1 0
align 1
LABELV $238
byte 1 42
byte 1 0
align 1
LABELV $235
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $195
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $192
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $189
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $186
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $183
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $180
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $177
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $174
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $168
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $165
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $162
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $144
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
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 32
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 84
byte 1 89
byte 1 80
byte 1 69
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $116
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 57
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
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
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
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
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
