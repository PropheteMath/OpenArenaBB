code
proc populatePlayerList 1040 12
file "../../../code/q3_ui/ui_votemenu_kick.c"
line 82
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
;25:
;26:#define ART_BACK0			"menu/art_blueish/back_0"
;27:#define ART_BACK1			"menu/art_blueish/back_1"
;28:#define ART_FIGHT0			"menu/art_blueish/accept_0"
;29:#define ART_FIGHT1			"menu/art_blueish/accept_1"
;30:#define ART_BACKGROUND                  "menu/art_blueish/addbotframe"
;31:#define ART_ARROWS			"menu/art_blueish/arrows_vert_0"
;32:#define ART_ARROWUP			"menu/art_blueish/arrows_vert_top"
;33:#define ART_ARROWDOWN                   "menu/art_blueish/arrows_vert_bot"
;34:
;35:#define ID_BACK				10
;36:#define ID_GO				11
;37:#define ID_LIST				12
;38:#define ID_UP				13
;39:#define ID_DOWN				14
;40:#define ID_PLAYERNAME0			20
;41:#define ID_PLAYERNAME1			21
;42:#define ID_PLAYERNAME2			22
;43:#define ID_PLAYERNAME3			23
;44:#define ID_PLAYERNAME4			24
;45:#define ID_PLAYERNAME5			25
;46:#define ID_PLAYERNAME6			26
;47:#define ID_PLAYERNAME7			27
;48:#define ID_PLAYERNAME8			28
;49:#define ID_PLAYERNAME9			29
;50:#define SIZE_OF_LIST                    10
;51://#define ID_PLAYERNAME10			30
;52:
;53:#define SIZE_OF_NAME                    32
;54:
;55:#define VOTEKICK_MENU_VERTICAL_SPACING	20
;56:
;57:typedef struct {
;58:    int id;
;59:    char name[SIZE_OF_NAME];
;60:} player;
;61:
;62:typedef struct {
;63:	menuframework_s	menu;
;64:	menubitmap_s	arrows;
;65:        menutext_s		banner;
;66:	menubitmap_s	up;
;67:	menubitmap_s	down;
;68:	menutext_s	players[SIZE_OF_LIST];
;69:	menubitmap_s	go;
;70:	menubitmap_s	back;
;71:
;72:	int		numPlayers;
;73:	int		selected;
;74:        int             startIndex;
;75:        player          players_profiles[MAX_CLIENTS];
;76:} votemenu_kick_t;
;77:
;78:static votemenu_kick_t	s_votemenu_kick;
;79:
;80:void UI_VoteKickMenuInternal( void );
;81:
;82:static void populatePlayerList( void ) {
line 85
;83:    int i;
;84:    char playerinfo[MAX_INFO_STRING];
;85:    s_votemenu_kick.numPlayers = 0;
ADDRGP4 s_votemenu_kick+1648
CNSTI4 0
ASGNI4
line 87
;86:
;87:    for(i=0;i<MAX_CLIENTS;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $83
line 88
;88:        trap_GetConfigString( CS_PLAYERS + i, playerinfo, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 89
;89:        if(strlen(playerinfo) ) {
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $87
line 90
;90:            s_votemenu_kick.players_profiles[s_votemenu_kick.numPlayers].id = i;
CNSTI4 36
ADDRGP4 s_votemenu_kick+1648
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 91
;91:            Q_strncpyz( s_votemenu_kick.players_profiles[s_votemenu_kick.numPlayers].name, Info_ValueForKey( playerinfo, "n" ), SIZE_OF_NAME - 2);
ADDRLP4 4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1648
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+4
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 92
;92:            s_votemenu_kick.numPlayers++;
ADDRLP4 1036
ADDRGP4 s_votemenu_kick+1648
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 93
;93:        }
LABELV $87
line 94
;94:    }
LABELV $84
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $83
line 95
;95:}
LABELV $81
endproc populatePlayerList 1040 12
proc VoteKickMenu_Event 12 8
line 103
;96:
;97:/*
;98:=================
;99:VoteKickMenu_Event
;100:=================
;101:*/
;102:static void VoteKickMenu_Event( void* ptr, int event )
;103:{
line 104
;104:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $103
ADDRGP4 $97
JUMPV
line 105
;105:	{
LABELV $100
line 107
;106:            case ID_BACK:
;107:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 108
;108:                    return;
ADDRGP4 $96
JUMPV
LABELV $101
line 109
;109:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 110
;110:                break;
ADDRGP4 $98
JUMPV
LABELV $103
line 112
;111:            case ID_GO:
;112:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $104
line 113
;113:                    return;
ADDRGP4 $96
JUMPV
LABELV $104
line 115
;114:                }
;115:                if(!s_votemenu_kick.selected)
ADDRGP4 s_votemenu_kick+1652
INDIRI4
CNSTI4 0
NEI4 $106
line 116
;116:                    return;
ADDRGP4 $96
JUMPV
LABELV $106
line 117
;117:                trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote clientkick %d",s_votemenu_kick.players_profiles[(s_votemenu_kick.selected-20)+s_votemenu_kick.startIndex].id) );
ADDRGP4 $109
ARGP4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1652
INDIRI4
CNSTI4 20
SUBI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
ADDI4
MULI4
ADDRGP4 s_votemenu_kick+1660
ADDP4
INDIRI4
ARGI4
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
line 118
;118:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 119
;119:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 120
;120:                break;
ADDRGP4 $98
JUMPV
LABELV $97
line 122
;121:            default:
;122:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $113
line 123
;123:                    return;
ADDRGP4 $96
JUMPV
LABELV $113
line 125
;124:                }
;125:                if(s_votemenu_kick.selected != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu_kick+1652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $98
line 126
;126:                    s_votemenu_kick.selected = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu_kick+1652
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 127
;127:                    UI_VoteKickMenuInternal();
ADDRGP4 UI_VoteKickMenuInternal
CALLV
pop
line 128
;128:                }
line 129
;129:                break;
LABELV $98
line 131
;130:         }
;131:}
LABELV $96
endproc VoteKickMenu_Event 12 8
proc UI_VoteKickMenu_UpEvent 4 0
line 138
;132:
;133:/*
;134:=================
;135:UI_VoteKickMenu_UpEvent
;136:=================
;137:*/
;138:static void UI_VoteKickMenu_UpEvent( void* ptr, int event ) {
line 139
;139:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $120
line 140
;140:		return;
ADDRGP4 $119
JUMPV
LABELV $120
line 143
;141:	}
;142:
;143:	if( s_votemenu_kick.startIndex > 0 ) {
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 0
LEI4 $122
line 144
;144:            s_votemenu_kick.startIndex--;
ADDRLP4 0
ADDRGP4 s_votemenu_kick+1656
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 145
;145:	}
LABELV $122
line 147
;146:
;147:        UI_VoteKickMenuInternal();
ADDRGP4 UI_VoteKickMenuInternal
CALLV
pop
line 148
;148:}
LABELV $119
endproc UI_VoteKickMenu_UpEvent 4 0
proc UI_VoteKickMenu_DownEvent 4 0
line 155
;149:
;150:/*
;151:=================
;152:UI_VoteKickMenu_DownEvent
;153:=================
;154:*/
;155:static void UI_VoteKickMenu_DownEvent( void* ptr, int event ) {
line 156
;156:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $127
line 157
;157:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 160
;158:	}
;159:
;160:	if( s_votemenu_kick.startIndex+SIZE_OF_LIST < s_votemenu_kick.numPlayers ) {
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 10
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $129
line 161
;161:            s_votemenu_kick.startIndex++;
ADDRLP4 0
ADDRGP4 s_votemenu_kick+1656
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 162
;162:	}
LABELV $129
line 164
;163:
;164:        UI_VoteKickMenuInternal();
ADDRGP4 UI_VoteKickMenuInternal
CALLV
pop
line 165
;165:}
LABELV $126
endproc UI_VoteKickMenu_DownEvent 4 0
proc UI_VoteKickMenu_Draw 0 20
line 172
;166:
;167:/*
;168:=================
;169:UI_VoteKickMenu_Draw
;170:=================
;171:*/
;172:static void UI_VoteKickMenu_Draw( void ) {
line 173
;173:	UI_DrawBannerString( 320, 16, "CALL VOTE KICK", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $135
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 174
;174:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $136
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 177
;175:
;176:	// standard menu drawing
;177:	Menu_Draw( &s_votemenu_kick.menu );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 178
;178:}
LABELV $134
endproc UI_VoteKickMenu_Draw 0 20
proc VoteKickMenu_Cache 0 4
line 186
;179:
;180:/*
;181:=================
;182:VoteKickMenu_Cache
;183:=================
;184:*/
;185:static void VoteKickMenu_Cache( void )
;186:{
line 187
;187:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $138
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 188
;188:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $139
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 189
;189:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $140
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 190
;190:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $141
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 191
;191:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $136
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 192
;192:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $142
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 193
;193:	trap_R_RegisterShaderNoMip( ART_ARROWUP );
ADDRGP4 $143
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 194
;194:	trap_R_RegisterShaderNoMip( ART_ARROWDOWN );
ADDRGP4 $144
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 195
;195:}
LABELV $137
endproc VoteKickMenu_Cache 0 4
proc setKickMenutext 4 0
line 197
;196:
;197:static void setKickMenutext(menutext_s *menu,int y,int id,qboolean active,char *text) {
line 198
;198:    menu->generic.type            = MTYPE_PTEXT;
ADDRFP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 199
;199:    menu->color               = color_red;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_red
ASGNP4
line 200
;200:    menu->generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTU4 264
ASGNU4
line 201
;201:    if(!active)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $146
line 202
;202:        menu->generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
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
ADDRGP4 $147
JUMPV
LABELV $146
line 204
;203:    else
;204:    if(s_votemenu_kick.selected == id)
ADDRGP4 s_votemenu_kick+1652
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $148
line 205
;205:         menu->color       = color_orange;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_orange
ASGNP4
LABELV $148
LABELV $147
line 206
;206:    menu->generic.x           = 320;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 320
ASGNI4
line 207
;207:    menu->generic.y           = y;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 208
;208:    menu->generic.id          = id;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 209
;209:    menu->generic.callback    = VoteKickMenu_Event;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 VoteKickMenu_Event
ASGNP4
line 210
;210:    menu->string              = text;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 211
;211:    menu->style               = UI_CENTER|UI_SMALLFONT;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 17
ASGNI4
line 212
;212:}
LABELV $145
endproc setKickMenutext 4 0
export UI_VoteKickMenuInternal
proc UI_VoteKickMenuInternal 44 20
line 221
;213:
;214:/*
;215:=================
;216:UI_VoteKickMenuInternal
;217: *Used then forcing a redraw
;218:=================
;219:*/
;220:void UI_VoteKickMenuInternal( void )
;221:{
line 224
;222:    int y;
;223:
;224:    s_votemenu_kick.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu_kick+404
CNSTI4 1
ASGNI4
line 225
;225:    s_votemenu_kick.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu_kick+408
CNSTI4 0
ASGNI4
line 226
;226:    s_votemenu_kick.menu.draw = UI_VoteKickMenu_Draw;
ADDRGP4 s_votemenu_kick+396
ADDRGP4 UI_VoteKickMenu_Draw
ASGNP4
line 228
;227:
;228:    s_votemenu_kick.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu_kick+504
CNSTI4 10
ASGNI4
line 229
;229:    s_votemenu_kick.banner.generic.x	  = 320;
ADDRGP4 s_votemenu_kick+504+12
CNSTI4 320
ASGNI4
line 230
;230:    s_votemenu_kick.banner.generic.y	  = 16;
ADDRGP4 s_votemenu_kick+504+16
CNSTI4 16
ASGNI4
line 231
;231:    s_votemenu_kick.banner.string		  = "CALL VOTE KICK";
ADDRGP4 s_votemenu_kick+504+60
ADDRGP4 $135
ASGNP4
line 232
;232:    s_votemenu_kick.banner.color	      = color_white;
ADDRGP4 s_votemenu_kick+504+68
ADDRGP4 color_white
ASGNP4
line 233
;233:    s_votemenu_kick.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu_kick+504+64
CNSTI4 1
ASGNI4
line 235
;234:
;235:    s_votemenu_kick.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_votemenu_kick+416
CNSTI4 6
ASGNI4
line 236
;236:    s_votemenu_kick.arrows.generic.name  = ART_ARROWS;
ADDRGP4 s_votemenu_kick+416+4
ADDRGP4 $142
ASGNP4
line 237
;237:    s_votemenu_kick.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_votemenu_kick+416+44
CNSTU4 16384
ASGNU4
line 238
;238:    s_votemenu_kick.arrows.generic.x	 = 200;
ADDRGP4 s_votemenu_kick+416+12
CNSTI4 200
ASGNI4
line 239
;239:    s_votemenu_kick.arrows.generic.y	 = 128;
ADDRGP4 s_votemenu_kick+416+16
CNSTI4 128
ASGNI4
line 240
;240:    s_votemenu_kick.arrows.width  	     = 64;
ADDRGP4 s_votemenu_kick+416+76
CNSTI4 64
ASGNI4
line 241
;241:    s_votemenu_kick.arrows.height  	     = 128;
ADDRGP4 s_votemenu_kick+416+80
CNSTI4 128
ASGNI4
line 243
;242:
;243:    y = 98;
ADDRLP4 0
CNSTI4 98
ASGNI4
line 244
;244:    setKickMenutext(&s_votemenu_kick.players[0],y,ID_PLAYERNAME0,s_votemenu_kick.startIndex<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex].name);
ADDRGP4 s_votemenu_kick+752
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $186
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $187
JUMPV
LABELV $186
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $187
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 245
;245:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 246
;246:    setKickMenutext(&s_votemenu_kick.players[1],y,ID_PLAYERNAME1,s_votemenu_kick.startIndex+1<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+1].name);
ADDRGP4 s_votemenu_kick+752+72
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $197
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $197
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $198
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+36+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 247
;247:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 248
;248:    setKickMenutext(&s_votemenu_kick.players[2],y,ID_PLAYERNAME2,s_votemenu_kick.startIndex+2<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+2].name);
ADDRGP4 s_votemenu_kick+752+144
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 2
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $208
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $208
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $209
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+72+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 249
;249:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 250
;250:    setKickMenutext(&s_votemenu_kick.players[3],y,ID_PLAYERNAME3,s_votemenu_kick.startIndex+3<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+3].name);
ADDRGP4 s_votemenu_kick+752+216
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 3
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $219
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $220
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+108+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 251
;251:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 252
;252:    setKickMenutext(&s_votemenu_kick.players[4],y,ID_PLAYERNAME4,s_votemenu_kick.startIndex+4<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+4].name);
ADDRGP4 s_votemenu_kick+752+288
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 4
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $230
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $231
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+144+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 253
;253:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 254
;254:    setKickMenutext(&s_votemenu_kick.players[5],y,ID_PLAYERNAME5,s_votemenu_kick.startIndex+5<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+5].name);
ADDRGP4 s_votemenu_kick+752+360
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 5
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $241
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $242
JUMPV
LABELV $241
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $242
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+180+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 255
;255:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 256
;256:    setKickMenutext(&s_votemenu_kick.players[6],y,ID_PLAYERNAME6,s_votemenu_kick.startIndex+6<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+6].name);
ADDRGP4 s_votemenu_kick+752+432
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 6
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $252
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $252
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $253
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+216+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 257
;257:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 258
;258:    setKickMenutext(&s_votemenu_kick.players[7],y,ID_PLAYERNAME7,s_votemenu_kick.startIndex+7<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+7].name);
ADDRGP4 s_votemenu_kick+752+504
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $263
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $264
JUMPV
LABELV $263
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $264
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+252+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 259
;259:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 260
;260:    setKickMenutext(&s_votemenu_kick.players[8],y,ID_PLAYERNAME8,s_votemenu_kick.startIndex+8<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+8].name);
ADDRGP4 s_votemenu_kick+752+576
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 8
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $274
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $275
JUMPV
LABELV $274
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $275
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+288+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 261
;261:    y+=VOTEKICK_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 262
;262:    setKickMenutext(&s_votemenu_kick.players[9],y,ID_PLAYERNAME9,s_votemenu_kick.startIndex+9<s_votemenu_kick.numPlayers,s_votemenu_kick.players_profiles[s_votemenu_kick.startIndex+9].name);
ADDRGP4 s_votemenu_kick+752+648
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 s_votemenu_kick+1656
INDIRI4
CNSTI4 9
ADDI4
ADDRGP4 s_votemenu_kick+1648
INDIRI4
GEI4 $285
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $286
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 36
ADDRGP4 s_votemenu_kick+1656
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+1660+324+4
ADDP4
ARGP4
ADDRGP4 setKickMenutext
CALLV
pop
line 264
;263:
;264:    s_votemenu_kick.up.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_votemenu_kick+576
CNSTI4 6
ASGNI4
line 265
;265:    s_votemenu_kick.up.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_kick+576+44
CNSTU4 260
ASGNU4
line 266
;266:    s_votemenu_kick.up.generic.x		= 200;
ADDRGP4 s_votemenu_kick+576+12
CNSTI4 200
ASGNI4
line 267
;267:    s_votemenu_kick.up.generic.y		= 128;
ADDRGP4 s_votemenu_kick+576+16
CNSTI4 128
ASGNI4
line 268
;268:    s_votemenu_kick.up.generic.id	    = ID_UP;
ADDRGP4 s_votemenu_kick+576+8
CNSTI4 13
ASGNI4
line 269
;269:    s_votemenu_kick.up.generic.callback = UI_VoteKickMenu_UpEvent;
ADDRGP4 s_votemenu_kick+576+48
ADDRGP4 UI_VoteKickMenu_UpEvent
ASGNP4
line 270
;270:    s_votemenu_kick.up.width  		    = 64;
ADDRGP4 s_votemenu_kick+576+76
CNSTI4 64
ASGNI4
line 271
;271:    s_votemenu_kick.up.height  		    = 64;
ADDRGP4 s_votemenu_kick+576+80
CNSTI4 64
ASGNI4
line 272
;272:    s_votemenu_kick.up.focuspic         = ART_ARROWUP;
ADDRGP4 s_votemenu_kick+576+60
ADDRGP4 $143
ASGNP4
line 274
;273:
;274:    s_votemenu_kick.down.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_votemenu_kick+664
CNSTI4 6
ASGNI4
line 275
;275:    s_votemenu_kick.down.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_kick+664+44
CNSTU4 260
ASGNU4
line 276
;276:    s_votemenu_kick.down.generic.x		  = 200;
ADDRGP4 s_votemenu_kick+664+12
CNSTI4 200
ASGNI4
line 277
;277:    s_votemenu_kick.down.generic.y		  = 128+64;
ADDRGP4 s_votemenu_kick+664+16
CNSTI4 192
ASGNI4
line 278
;278:    s_votemenu_kick.down.generic.id	      = ID_DOWN;
ADDRGP4 s_votemenu_kick+664+8
CNSTI4 14
ASGNI4
line 279
;279:    s_votemenu_kick.down.generic.callback = UI_VoteKickMenu_DownEvent;
ADDRGP4 s_votemenu_kick+664+48
ADDRGP4 UI_VoteKickMenu_DownEvent
ASGNP4
line 280
;280:    s_votemenu_kick.down.width  		  = 64;
ADDRGP4 s_votemenu_kick+664+76
CNSTI4 64
ASGNI4
line 281
;281:    s_votemenu_kick.down.height  		  = 64;
ADDRGP4 s_votemenu_kick+664+80
CNSTI4 64
ASGNI4
line 282
;282:    s_votemenu_kick.down.focuspic         = ART_ARROWDOWN;
ADDRGP4 s_votemenu_kick+664+60
ADDRGP4 $144
ASGNP4
line 284
;283:
;284:    s_votemenu_kick.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_votemenu_kick+1472
CNSTI4 6
ASGNI4
line 285
;285:    s_votemenu_kick.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_votemenu_kick+1472+4
ADDRGP4 $140
ASGNP4
line 286
;286:    s_votemenu_kick.go.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_kick+1472+44
CNSTU4 260
ASGNU4
line 287
;287:    s_votemenu_kick.go.generic.id			= ID_GO;
ADDRGP4 s_votemenu_kick+1472+8
CNSTI4 11
ASGNI4
line 288
;288:    s_votemenu_kick.go.generic.callback		= VoteKickMenu_Event;
ADDRGP4 s_votemenu_kick+1472+48
ADDRGP4 VoteKickMenu_Event
ASGNP4
line 289
;289:    s_votemenu_kick.go.generic.x			= 320+128-128;
ADDRGP4 s_votemenu_kick+1472+12
CNSTI4 320
ASGNI4
line 290
;290:    s_votemenu_kick.go.generic.y			= 256+128-64;
ADDRGP4 s_votemenu_kick+1472+16
CNSTI4 320
ASGNI4
line 291
;291:    s_votemenu_kick.go.width  				= 128;
ADDRGP4 s_votemenu_kick+1472+76
CNSTI4 128
ASGNI4
line 292
;292:    s_votemenu_kick.go.height  				= 64;
ADDRGP4 s_votemenu_kick+1472+80
CNSTI4 64
ASGNI4
line 293
;293:    s_votemenu_kick.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_votemenu_kick+1472+60
ADDRGP4 $141
ASGNP4
line 295
;294:
;295:    s_votemenu_kick.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_votemenu_kick+1560
CNSTI4 6
ASGNI4
line 296
;296:    s_votemenu_kick.back.generic.name		= ART_BACK0;
ADDRGP4 s_votemenu_kick+1560+4
ADDRGP4 $138
ASGNP4
line 297
;297:    s_votemenu_kick.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_kick+1560+44
CNSTU4 260
ASGNU4
line 298
;298:    s_votemenu_kick.back.generic.id			= ID_BACK;
ADDRGP4 s_votemenu_kick+1560+8
CNSTI4 10
ASGNI4
line 299
;299:    s_votemenu_kick.back.generic.callback	= VoteKickMenu_Event;
ADDRGP4 s_votemenu_kick+1560+48
ADDRGP4 VoteKickMenu_Event
ASGNP4
line 300
;300:    s_votemenu_kick.back.generic.x			= 320-128;
ADDRGP4 s_votemenu_kick+1560+12
CNSTI4 192
ASGNI4
line 301
;301:    s_votemenu_kick.back.generic.y			= 256+128-64;
ADDRGP4 s_votemenu_kick+1560+16
CNSTI4 320
ASGNI4
line 302
;302:    s_votemenu_kick.back.width				= 128;
ADDRGP4 s_votemenu_kick+1560+76
CNSTI4 128
ASGNI4
line 303
;303:    s_votemenu_kick.back.height				= 64;
ADDRGP4 s_votemenu_kick+1560+80
CNSTI4 64
ASGNI4
line 304
;304:    s_votemenu_kick.back.focuspic			= ART_BACK1;
ADDRGP4 s_votemenu_kick+1560+60
ADDRGP4 $139
ASGNP4
line 305
;305:}
LABELV $151
endproc UI_VoteKickMenuInternal 44 20
export UI_VoteKickMenu
proc UI_VoteKickMenu 4 12
line 313
;306:
;307:/*
;308:=================
;309:UI_VoteKickMenu
;310: *Called from outside
;311:=================
;312:*/
;313:void UI_VoteKickMenu( void ) {
line 315
;314:    int i;
;315:    VoteKickMenu_Cache();
ADDRGP4 VoteKickMenu_Cache
CALLV
pop
line 316
;316:    memset( &s_votemenu_kick, 0 ,sizeof(votemenu_kick_t) );
ADDRGP4 s_votemenu_kick
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3964
ARGI4
ADDRGP4 memset
CALLP4
pop
line 317
;317:    populatePlayerList();
ADDRGP4 populatePlayerList
CALLV
pop
line 319
;318:
;319:    UI_VoteKickMenuInternal();
ADDRGP4 UI_VoteKickMenuInternal
CALLV
pop
line 321
;320:
;321:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.banner );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 322
;322:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.back );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+1560
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 323
;323:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.go );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+1472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 324
;324:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.arrows );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 325
;325:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.down );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 326
;326:    Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.up );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 s_votemenu_kick+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 327
;327:    for(i=0;i<SIZE_OF_LIST;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $366
line 328
;328:        Menu_AddItem( &s_votemenu_kick.menu, (void*) &s_votemenu_kick.players[i] );
ADDRGP4 s_votemenu_kick
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_votemenu_kick+752
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $367
line 327
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $366
line 330
;329:
;330:    UI_PushMenu( &s_votemenu_kick.menu );
ADDRGP4 s_votemenu_kick
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 331
;331:}
LABELV $359
endproc UI_VoteKickMenu 4 12
bss
align 4
LABELV s_votemenu_kick
skip 3964
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
LABELV $143
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
LABELV $140
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
LABELV $139
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
LABELV $138
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
LABELV $136
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
LABELV $135
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
byte 1 75
byte 1 73
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $94
byte 1 110
byte 1 0
