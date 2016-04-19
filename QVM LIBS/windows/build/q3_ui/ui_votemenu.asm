data
align 4
LABELV votemenu_artlist
address $79
address $80
address $81
address $82
byte 4 0
code
proc VoteMenu_CheckVoteNames 8 4
file "../../../code/q3_ui/ui_votemenu.c"
line 102
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
;25:#define VOTEMENU_BACK0      "menu/art_blueish/back_0"
;26:#define VOTEMENU_BACK1      "menu/art_blueish/back_1"
;27:#define ART_FIGHT0          "menu/art_blueish/accept_0"
;28:#define ART_FIGHT1          "menu/art_blueish/accept_1"
;29:#define ART_BACKGROUND      "menu/art_blueish/addbotframe"
;30:
;31:static char* votemenu_artlist[] =
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
;42:#define ID_NEXTMAP  102
;43:#define ID_RESTART  103
;44:#define ID_DOWARMUP 104
;45:#define ID_MAP      105
;46:#define ID_KICK     106
;47:#define ID_FRAG     107
;48:#define ID_TIME     108
;49:#define ID_GAMETYPE 109
;50:#define ID_CUSTOM   110
;51:#define ID_SHUFFLE  111
;52:
;53://This sorta dependend on number of vote options
;54:#define VOTEMENU_MENU_VERTICAL_SPACING	22
;55:
;56:typedef struct
;57:{
;58:	menuframework_s	menu;
;59:	menutext_s		banner;
;60:	menubitmap_s	back;
;61:        menubitmap_s	go;
;62:
;63:        //Allowed votes:
;64:        qboolean        map_restart;
;65:        qboolean        nextmap;
;66:        qboolean        g_doWarmup;
;67:        qboolean        g_doWarmupEnabled;
;68:        qboolean        clientkick;
;69:        qboolean        map;
;70:        qboolean        gametype;
;71:        qboolean        fraglimit;
;72:        qboolean        timelimit;
;73:        qboolean        custom;
;74:        qboolean        shuffle;
;75:
;76:        //Buttons:
;77:        menutext_s      bMapRestart;
;78:        menutext_s      bNextmap;
;79:        menutext_s      bDoWarmup;
;80:        menutext_s      bKick;
;81:        menutext_s      bMap;
;82:        menutext_s      bGametype;
;83:        menutext_s      bTimelimit;
;84:        menutext_s      bFraglimit;
;85:        menutext_s      bShuffle;
;86:        menutext_s      bCustom;
;87:
;88:        int             selection;
;89:} votemenu_t;
;90:
;91:static votemenu_t	s_votemenu;
;92:
;93:void UI_VoteMenuMenuInternal( void );
;94:
;95:
;96:/*
;97:=================
;98:VoteMenu_CheckVoteNames
;99:=================
;100:*/
;101:
;102:static void VoteMenu_CheckVoteNames( void ) {
line 104
;103:    int voteflags;
;104:    voteflags = trap_Cvar_VariableValue("cg_voteflags");
ADDRGP4 $85
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 105
;105:    s_votemenu.map_restart = voteflags&VF_map_restart;
ADDRGP4 s_votemenu+664
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 106
;106:    s_votemenu.nextmap = voteflags&VF_nextmap;
ADDRGP4 s_votemenu+668
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 107
;107:    s_votemenu.map = voteflags&VF_map;
ADDRGP4 s_votemenu+684
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 108
;108:    s_votemenu.gametype = voteflags&VF_g_gametype;
ADDRGP4 s_votemenu+688
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
ASGNI4
line 110
;109:    //We never use "kick" in menues, always clientkick
;110:    s_votemenu.clientkick = voteflags&VF_clientkick;
ADDRGP4 s_votemenu+680
ADDRLP4 0
INDIRI4
CNSTI4 16
BANDI4
ASGNI4
line 111
;111:    s_votemenu.g_doWarmup = voteflags&VF_g_doWarmup;
ADDRGP4 s_votemenu+672
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
ASGNI4
line 112
;112:    s_votemenu.timelimit = voteflags&VF_timelimit;
ADDRGP4 s_votemenu+696
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 113
;113:    s_votemenu.fraglimit = voteflags&VF_fraglimit;
ADDRGP4 s_votemenu+692
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
ASGNI4
line 114
;114:    s_votemenu.custom = voteflags&VF_custom;
ADDRGP4 s_votemenu+700
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
ASGNI4
line 115
;115:    s_votemenu.shuffle = voteflags&VF_shuffle;
ADDRGP4 s_votemenu+704
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
ASGNI4
line 116
;116:}
LABELV $84
endproc VoteMenu_CheckVoteNames 8 4
proc VoteMenu_Event 12 8
line 124
;117:
;118:/*
;119:=================
;120:VoteMenu_Event
;121:=================
;122:*/
;123:static void VoteMenu_Event( void* ptr, int event )
;124:{
line 125
;125:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $103
ADDRGP4 $97
JUMPV
line 126
;126:	{
LABELV $100
line 128
;127:		case ID_BACK:
;128:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 129
;129:				break;
ADDRGP4 $98
JUMPV
LABELV $101
line 131
;130:
;131:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;132:			break;
ADDRGP4 $98
JUMPV
LABELV $103
line 134
;133:            case ID_GO:
;134:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $104
line 135
;135:                    return;
ADDRGP4 $96
JUMPV
LABELV $104
line 137
;136:                }
;137:                switch(s_votemenu.selection) {
ADDRLP4 8
ADDRGP4 s_votemenu+1428
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 102
LTI4 $98
ADDRLP4 8
INDIRI4
CNSTI4 111
GTI4 $98
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $127-408
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $127
address $109
address $111
address $113
address $126
address $125
address $121
address $123
address $124
address $122
address $119
code
LABELV $109
line 139
;138:                    case ID_NEXTMAP:
;139:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote nextmap" );
CNSTI4 2
ARGI4
ADDRGP4 $110
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
;141:                        break;
ADDRGP4 $98
JUMPV
LABELV $111
line 143
;142:                    case ID_RESTART:
;143:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote map_restart" );
CNSTI4 2
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 144
;144:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 145
;145:                        break;
ADDRGP4 $98
JUMPV
LABELV $113
line 147
;146:                    case ID_DOWARMUP:
;147:                        if(s_votemenu.g_doWarmupEnabled)
ADDRGP4 s_votemenu+676
INDIRI4
CNSTI4 0
EQI4 $114
line 148
;148:                            trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_doWarmup 0" );
CNSTI4 2
ARGI4
ADDRGP4 $117
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $115
JUMPV
LABELV $114
line 150
;149:                        else
;150:                            trap_Cmd_ExecuteText( EXEC_APPEND, "callvote g_doWarmup 1" );
CNSTI4 2
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $115
line 151
;151:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 152
;152:                        break;
ADDRGP4 $98
JUMPV
LABELV $119
line 154
;153:                    case ID_SHUFFLE:
;154:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote shuffle" );
CNSTI4 2
ARGI4
ADDRGP4 $120
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
;156:                        break;
ADDRGP4 $98
JUMPV
LABELV $121
line 158
;157:                    case ID_FRAG:
;158:                        UI_VoteFraglimitMenu();
ADDRGP4 UI_VoteFraglimitMenu
CALLV
pop
line 160
;159:                        //Don't pop! It will do a double pop if successfull
;160:                        break;
ADDRGP4 $98
JUMPV
LABELV $122
line 162
;161:                    case ID_CUSTOM:
;162:                        UI_VoteCustomMenu();
ADDRGP4 UI_VoteCustomMenu
CALLV
pop
line 164
;163:                        //Don't pop! It will do a double pop if successfull
;164:                        break;
ADDRGP4 $98
JUMPV
LABELV $123
line 166
;165:                    case ID_TIME:
;166:                        UI_VoteTimelimitMenu();
ADDRGP4 UI_VoteTimelimitMenu
CALLV
pop
line 168
;167:                        //Don't pop! It will do a double pop if successfull
;168:                        break;
ADDRGP4 $98
JUMPV
LABELV $124
line 170
;169:                    case ID_GAMETYPE:
;170:                        UI_VoteGametypeMenu();
ADDRGP4 UI_VoteGametypeMenu
CALLV
pop
line 172
;171:                        //Don't pop! It will do a double pop if successfull
;172:                        break;
ADDRGP4 $98
JUMPV
LABELV $125
line 174
;173:                    case ID_KICK:
;174:                        UI_VoteKickMenu();
ADDRGP4 UI_VoteKickMenu
CALLV
pop
line 176
;175:                        //Don't pop! It will do a double pop if successfull
;176:                        break;
ADDRGP4 $98
JUMPV
LABELV $126
line 178
;177:                    case ID_MAP:
;178:                        UI_VoteMapMenu();
ADDRGP4 UI_VoteMapMenu
CALLV
pop
line 180
;179:                        //Don't pop! It will do a double pop if successfull
;180:                        break;
line 181
;181:                };
line 182
;182:                break;
ADDRGP4 $98
JUMPV
LABELV $97
line 184
;183:            default:
;184:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $129
line 185
;185:                    return;
ADDRGP4 $96
JUMPV
LABELV $129
line 187
;186:                }
;187:                if(s_votemenu.selection != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu+1428
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $98
line 188
;188:                    s_votemenu.selection = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu+1428
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 189
;189:                    UI_VoteMenuMenuInternal();
ADDRGP4 UI_VoteMenuMenuInternal
CALLV
pop
line 190
;190:                }
line 191
;191:                break;
LABELV $98
line 193
;192:	}
;193:}
LABELV $96
endproc VoteMenu_Event 12 8
proc VoteMenu_Cache 4 4
line 201
;194:
;195:/*
;196:=================
;197:VoteMenu_Cache
;198:=================
;199:*/
;200:static void VoteMenu_Cache( void )
;201:{
line 205
;202:	int	i;
;203:
;204:	// touch all our pics
;205:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $136
line 206
;206:	{
line 207
;207:		if (!votemenu_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 208
;208:			break;
ADDRGP4 $138
JUMPV
LABELV $140
line 209
;209:		trap_R_RegisterShaderNoMip(votemenu_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 210
;210:	}
LABELV $137
line 205
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $138
line 213
;211:
;212:        //Check all names
;213:        VoteMenu_CheckVoteNames();
ADDRGP4 VoteMenu_CheckVoteNames
CALLV
pop
line 214
;214:}
LABELV $135
endproc VoteMenu_Cache 4 4
proc UI_VoteMenu_Draw 0 20
line 221
;215:
;216:/*
;217:=================
;218:UI_VoteMenu_Draw
;219:=================
;220:*/
;221:static void UI_VoteMenu_Draw( void ) {
line 222
;222:	UI_DrawBannerString( 320, 16, "CALL VOTE", UI_CENTER, color_white );
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
line 223
;223:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
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
line 226
;224:
;225:	// standard menu drawing
;226:	Menu_Draw( &s_votemenu.menu );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 227
;227:}
LABELV $142
endproc UI_VoteMenu_Draw 0 20
export UI_VoteMenuMenuInternal
proc UI_VoteMenuMenuInternal 44 0
line 236
;228:
;229:/*
;230:=================
;231:UI_VoteMenuMenuInternal
;232: *Used then forcing a redraw
;233:=================
;234:*/
;235:void UI_VoteMenuMenuInternal( void )
;236:{
line 239
;237:        int y;
;238:
;239:	VoteMenu_Cache();
ADDRGP4 VoteMenu_Cache
CALLV
pop
line 241
;240:
;241:	s_votemenu.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu+404
CNSTI4 1
ASGNI4
line 242
;242:	s_votemenu.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu+408
CNSTI4 0
ASGNI4
line 243
;243:        s_votemenu.menu.draw = UI_VoteMenu_Draw;
ADDRGP4 s_votemenu+396
ADDRGP4 UI_VoteMenu_Draw
ASGNP4
line 245
;244:
;245:	s_votemenu.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu+416
CNSTI4 10
ASGNI4
line 246
;246:	s_votemenu.banner.generic.x	  = 320;
ADDRGP4 s_votemenu+416+12
CNSTI4 320
ASGNI4
line 247
;247:	s_votemenu.banner.generic.y	  = 16;
ADDRGP4 s_votemenu+416+16
CNSTI4 16
ASGNI4
line 248
;248:	s_votemenu.banner.string		  = "CALL VOTE";
ADDRGP4 s_votemenu+416+60
ADDRGP4 $143
ASGNP4
line 249
;249:	s_votemenu.banner.color	      = color_white;
ADDRGP4 s_votemenu+416+68
ADDRGP4 color_white
ASGNP4
line 250
;250:	s_votemenu.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu+416+64
CNSTI4 1
ASGNI4
line 252
;251:
;252:        y = 98;
ADDRLP4 0
CNSTI4 98
ASGNI4
line 253
;253:        s_votemenu.bNextmap.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+780
CNSTI4 9
ASGNI4
line 254
;254:        s_votemenu.bNextmap.color               = color_red;
ADDRGP4 s_votemenu+780+68
ADDRGP4 color_red
ASGNP4
line 255
;255:        s_votemenu.bNextmap.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+780+44
CNSTU4 264
ASGNU4
line 256
;256:        if(!s_votemenu.nextmap)
ADDRGP4 s_votemenu+668
INDIRI4
CNSTI4 0
NEI4 $165
line 257
;257:            s_votemenu.bNextmap.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 4
ADDRGP4 s_votemenu+780+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $166
JUMPV
LABELV $165
line 259
;258:        else
;259:            if(s_votemenu.selection == ID_NEXTMAP)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 102
NEI4 $170
line 260
;260:                s_votemenu.bNextmap.color       = color_orange;
ADDRGP4 s_votemenu+780+68
ADDRGP4 color_orange
ASGNP4
LABELV $170
LABELV $166
line 261
;261:        s_votemenu.bNextmap.generic.x           = 320;
ADDRGP4 s_votemenu+780+12
CNSTI4 320
ASGNI4
line 262
;262:        s_votemenu.bNextmap.generic.y           = y;
ADDRGP4 s_votemenu+780+16
ADDRLP4 0
INDIRI4
ASGNI4
line 263
;263:        s_votemenu.bNextmap.generic.id          = ID_NEXTMAP;
ADDRGP4 s_votemenu+780+8
CNSTI4 102
ASGNI4
line 264
;264:        s_votemenu.bNextmap.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+780+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 265
;265:        s_votemenu.bNextmap.string              = "Next map";
ADDRGP4 s_votemenu+780+60
ADDRGP4 $185
ASGNP4
line 266
;266:        s_votemenu.bNextmap.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+780+64
CNSTI4 17
ASGNI4
line 268
;267:
;268:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 269
;269:        s_votemenu.bMapRestart.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_votemenu+708
CNSTI4 9
ASGNI4
line 270
;270:        s_votemenu.bMapRestart.color            = color_red;
ADDRGP4 s_votemenu+708+68
ADDRGP4 color_red
ASGNP4
line 271
;271:        s_votemenu.bMapRestart.generic.flags	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+708+44
CNSTU4 264
ASGNU4
line 272
;272:        if(!s_votemenu.map_restart)
ADDRGP4 s_votemenu+664
INDIRI4
CNSTI4 0
NEI4 $193
line 273
;273:            s_votemenu.bMapRestart.generic.flags |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 8
ADDRGP4 s_votemenu+708+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $194
JUMPV
LABELV $193
line 275
;274:        else
;275:        if(s_votemenu.selection==ID_RESTART)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 103
NEI4 $198
line 276
;276:            s_votemenu.bMapRestart.color        = color_orange;
ADDRGP4 s_votemenu+708+68
ADDRGP4 color_orange
ASGNP4
LABELV $198
LABELV $194
line 277
;277:        s_votemenu.bMapRestart.generic.x        = 320;
ADDRGP4 s_votemenu+708+12
CNSTI4 320
ASGNI4
line 278
;278:        s_votemenu.bMapRestart.generic.y        = y;
ADDRGP4 s_votemenu+708+16
ADDRLP4 0
INDIRI4
ASGNI4
line 279
;279:        s_votemenu.bMapRestart.generic.id       = ID_RESTART;
ADDRGP4 s_votemenu+708+8
CNSTI4 103
ASGNI4
line 280
;280:        s_votemenu.bMapRestart.generic.callback = VoteMenu_Event;
ADDRGP4 s_votemenu+708+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 281
;281:        s_votemenu.bMapRestart.string           = "Restart match";
ADDRGP4 s_votemenu+708+60
ADDRGP4 $213
ASGNP4
line 282
;282:        s_votemenu.bMapRestart.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+708+64
CNSTI4 17
ASGNI4
line 284
;283:
;284:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 285
;285:        s_votemenu.bShuffle.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_votemenu+1284
CNSTI4 9
ASGNI4
line 286
;286:        s_votemenu.bShuffle.color            = color_red;
ADDRGP4 s_votemenu+1284+68
ADDRGP4 color_red
ASGNP4
line 287
;287:        s_votemenu.bShuffle.generic.flags	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+1284+44
CNSTU4 264
ASGNU4
line 288
;288:        if(!s_votemenu.map_restart)
ADDRGP4 s_votemenu+664
INDIRI4
CNSTI4 0
NEI4 $221
line 289
;289:            s_votemenu.bShuffle.generic.flags |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 12
ADDRGP4 s_votemenu+1284+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $222
JUMPV
LABELV $221
line 291
;290:        else
;291:        if(s_votemenu.selection==ID_SHUFFLE)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 111
NEI4 $226
line 292
;292:            s_votemenu.bShuffle.color        = color_orange;
ADDRGP4 s_votemenu+1284+68
ADDRGP4 color_orange
ASGNP4
LABELV $226
LABELV $222
line 293
;293:        s_votemenu.bShuffle.generic.x        = 320;
ADDRGP4 s_votemenu+1284+12
CNSTI4 320
ASGNI4
line 294
;294:        s_votemenu.bShuffle.generic.y        = y;
ADDRGP4 s_votemenu+1284+16
ADDRLP4 0
INDIRI4
ASGNI4
line 295
;295:        s_votemenu.bShuffle.generic.id       = ID_SHUFFLE;
ADDRGP4 s_votemenu+1284+8
CNSTI4 111
ASGNI4
line 296
;296:        s_votemenu.bShuffle.generic.callback = VoteMenu_Event;
ADDRGP4 s_votemenu+1284+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 297
;297:        s_votemenu.bShuffle.string           = "Shuffle teams";
ADDRGP4 s_votemenu+1284+60
ADDRGP4 $241
ASGNP4
line 298
;298:        s_votemenu.bShuffle.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+1284+64
CNSTI4 17
ASGNI4
line 300
;299:
;300:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 301
;301:        s_votemenu.bMap.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+996
CNSTI4 9
ASGNI4
line 302
;302:        s_votemenu.bMap.color               = color_red;
ADDRGP4 s_votemenu+996+68
ADDRGP4 color_red
ASGNP4
line 303
;303:        s_votemenu.bMap.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+996+44
CNSTU4 264
ASGNU4
line 304
;304:        if(!s_votemenu.map)
ADDRGP4 s_votemenu+684
INDIRI4
CNSTI4 0
NEI4 $249
line 305
;305:            s_votemenu.bMap.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 16
ADDRGP4 s_votemenu+996+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $250
JUMPV
LABELV $249
line 307
;306:        else
;307:            if(s_votemenu.selection == ID_MAP)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 105
NEI4 $254
line 308
;308:                s_votemenu.bMap.color       = color_orange;
ADDRGP4 s_votemenu+996+68
ADDRGP4 color_orange
ASGNP4
LABELV $254
LABELV $250
line 309
;309:        s_votemenu.bMap.generic.x           = 320;
ADDRGP4 s_votemenu+996+12
CNSTI4 320
ASGNI4
line 310
;310:        s_votemenu.bMap.generic.y           = y;
ADDRGP4 s_votemenu+996+16
ADDRLP4 0
INDIRI4
ASGNI4
line 311
;311:        s_votemenu.bMap.generic.id          = ID_MAP;
ADDRGP4 s_votemenu+996+8
CNSTI4 105
ASGNI4
line 312
;312:        s_votemenu.bMap.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+996+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 313
;313:        s_votemenu.bMap.string              = "Change map";
ADDRGP4 s_votemenu+996+60
ADDRGP4 $269
ASGNP4
line 314
;314:        s_votemenu.bMap.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+996+64
CNSTI4 17
ASGNI4
line 316
;315:
;316:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 317
;317:        s_votemenu.bGametype.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+1068
CNSTI4 9
ASGNI4
line 318
;318:        s_votemenu.bGametype.color               = color_red;
ADDRGP4 s_votemenu+1068+68
ADDRGP4 color_red
ASGNP4
line 319
;319:        s_votemenu.bGametype.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+1068+44
CNSTU4 264
ASGNU4
line 320
;320:        if(!s_votemenu.gametype)
ADDRGP4 s_votemenu+688
INDIRI4
CNSTI4 0
NEI4 $277
line 321
;321:            s_votemenu.bGametype.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 20
ADDRGP4 s_votemenu+1068+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $278
JUMPV
LABELV $277
line 323
;322:        else
;323:            if(s_votemenu.selection == ID_GAMETYPE)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 109
NEI4 $282
line 324
;324:                s_votemenu.bGametype.color       = color_orange;
ADDRGP4 s_votemenu+1068+68
ADDRGP4 color_orange
ASGNP4
LABELV $282
LABELV $278
line 325
;325:        s_votemenu.bGametype.generic.x           = 320;
ADDRGP4 s_votemenu+1068+12
CNSTI4 320
ASGNI4
line 326
;326:        s_votemenu.bGametype.generic.y           = y;
ADDRGP4 s_votemenu+1068+16
ADDRLP4 0
INDIRI4
ASGNI4
line 327
;327:        s_votemenu.bGametype.generic.id          = ID_GAMETYPE;
ADDRGP4 s_votemenu+1068+8
CNSTI4 109
ASGNI4
line 328
;328:        s_votemenu.bGametype.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+1068+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 329
;329:        s_votemenu.bGametype.string              = "Change gametype";
ADDRGP4 s_votemenu+1068+60
ADDRGP4 $297
ASGNP4
line 330
;330:        s_votemenu.bGametype.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+1068+64
CNSTI4 17
ASGNI4
line 332
;331:
;332:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 333
;333:        s_votemenu.bKick.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+924
CNSTI4 9
ASGNI4
line 334
;334:        s_votemenu.bKick.color               = color_red;
ADDRGP4 s_votemenu+924+68
ADDRGP4 color_red
ASGNP4
line 335
;335:        s_votemenu.bKick.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+924+44
CNSTU4 264
ASGNU4
line 336
;336:        if(!s_votemenu.clientkick)
ADDRGP4 s_votemenu+680
INDIRI4
CNSTI4 0
NEI4 $305
line 337
;337:            s_votemenu.bKick.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 24
ADDRGP4 s_votemenu+924+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $306
JUMPV
LABELV $305
line 339
;338:        else
;339:            if(s_votemenu.selection == ID_KICK)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 106
NEI4 $310
line 340
;340:                s_votemenu.bKick.color       = color_orange;
ADDRGP4 s_votemenu+924+68
ADDRGP4 color_orange
ASGNP4
LABELV $310
LABELV $306
line 341
;341:        s_votemenu.bKick.generic.x           = 320;
ADDRGP4 s_votemenu+924+12
CNSTI4 320
ASGNI4
line 342
;342:        s_votemenu.bKick.generic.y           = y;
ADDRGP4 s_votemenu+924+16
ADDRLP4 0
INDIRI4
ASGNI4
line 343
;343:        s_votemenu.bKick.generic.id          = ID_KICK;
ADDRGP4 s_votemenu+924+8
CNSTI4 106
ASGNI4
line 344
;344:        s_votemenu.bKick.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+924+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 345
;345:        s_votemenu.bKick.string              = "Kick player";
ADDRGP4 s_votemenu+924+60
ADDRGP4 $325
ASGNP4
line 346
;346:        s_votemenu.bKick.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+924+64
CNSTI4 17
ASGNI4
line 348
;347:
;348:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 349
;349:        s_votemenu.bDoWarmup.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+852
CNSTI4 9
ASGNI4
line 350
;350:        s_votemenu.bDoWarmup.color               = color_red;
ADDRGP4 s_votemenu+852+68
ADDRGP4 color_red
ASGNP4
line 351
;351:        s_votemenu.bDoWarmup.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+852+44
CNSTU4 264
ASGNU4
line 352
;352:        if(!s_votemenu.g_doWarmup)
ADDRGP4 s_votemenu+672
INDIRI4
CNSTI4 0
NEI4 $333
line 353
;353:            s_votemenu.bDoWarmup.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 28
ADDRGP4 s_votemenu+852+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $334
JUMPV
LABELV $333
line 355
;354:        else
;355:            if(s_votemenu.selection == ID_DOWARMUP)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 104
NEI4 $338
line 356
;356:                s_votemenu.bDoWarmup.color       = color_orange;
ADDRGP4 s_votemenu+852+68
ADDRGP4 color_orange
ASGNP4
LABELV $338
LABELV $334
line 357
;357:        s_votemenu.bDoWarmup.generic.x           = 320;
ADDRGP4 s_votemenu+852+12
CNSTI4 320
ASGNI4
line 358
;358:        s_votemenu.bDoWarmup.generic.y           = y;
ADDRGP4 s_votemenu+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 359
;359:        s_votemenu.bDoWarmup.generic.id          = ID_DOWARMUP;
ADDRGP4 s_votemenu+852+8
CNSTI4 104
ASGNI4
line 360
;360:        s_votemenu.bDoWarmup.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+852+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 361
;361:        if(s_votemenu.g_doWarmupEnabled)
ADDRGP4 s_votemenu+676
INDIRI4
CNSTI4 0
EQI4 $351
line 362
;362:            s_votemenu.bDoWarmup.string              = "Disable warmup";
ADDRGP4 s_votemenu+852+60
ADDRGP4 $356
ASGNP4
ADDRGP4 $352
JUMPV
LABELV $351
line 364
;363:        else
;364:            s_votemenu.bDoWarmup.string              = "Enable warmup";
ADDRGP4 s_votemenu+852+60
ADDRGP4 $359
ASGNP4
LABELV $352
line 365
;365:        s_votemenu.bDoWarmup.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+852+64
CNSTI4 17
ASGNI4
line 367
;366:
;367:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 368
;368:        s_votemenu.bFraglimit.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+1212
CNSTI4 9
ASGNI4
line 369
;369:        s_votemenu.bFraglimit.color               = color_red;
ADDRGP4 s_votemenu+1212+68
ADDRGP4 color_red
ASGNP4
line 370
;370:        s_votemenu.bFraglimit.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+1212+44
CNSTU4 264
ASGNU4
line 371
;371:        if(!s_votemenu.fraglimit)
ADDRGP4 s_votemenu+692
INDIRI4
CNSTI4 0
NEI4 $367
line 372
;372:            s_votemenu.bFraglimit.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 32
ADDRGP4 s_votemenu+1212+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $368
JUMPV
LABELV $367
line 374
;373:        else
;374:            if(s_votemenu.selection == ID_FRAG)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 107
NEI4 $372
line 375
;375:                s_votemenu.bFraglimit.color       = color_orange;
ADDRGP4 s_votemenu+1212+68
ADDRGP4 color_orange
ASGNP4
LABELV $372
LABELV $368
line 376
;376:        s_votemenu.bFraglimit.generic.x           = 320;
ADDRGP4 s_votemenu+1212+12
CNSTI4 320
ASGNI4
line 377
;377:        s_votemenu.bFraglimit.generic.y           = y;
ADDRGP4 s_votemenu+1212+16
ADDRLP4 0
INDIRI4
ASGNI4
line 378
;378:        s_votemenu.bFraglimit.generic.id          = ID_FRAG;
ADDRGP4 s_votemenu+1212+8
CNSTI4 107
ASGNI4
line 379
;379:        s_votemenu.bFraglimit.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+1212+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 380
;380:        s_votemenu.bFraglimit.string              = "Change fraglimit";
ADDRGP4 s_votemenu+1212+60
ADDRGP4 $387
ASGNP4
line 381
;381:        s_votemenu.bFraglimit.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+1212+64
CNSTI4 17
ASGNI4
line 383
;382:
;383:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 384
;384:        s_votemenu.bTimelimit.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+1140
CNSTI4 9
ASGNI4
line 385
;385:        s_votemenu.bTimelimit.color               = color_red;
ADDRGP4 s_votemenu+1140+68
ADDRGP4 color_red
ASGNP4
line 386
;386:        s_votemenu.bTimelimit.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+1140+44
CNSTU4 264
ASGNU4
line 387
;387:        if(!s_votemenu.timelimit)
ADDRGP4 s_votemenu+696
INDIRI4
CNSTI4 0
NEI4 $395
line 388
;388:            s_votemenu.bTimelimit.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 36
ADDRGP4 s_votemenu+1140+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $396
JUMPV
LABELV $395
line 390
;389:        else
;390:            if(s_votemenu.selection == ID_TIME)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 108
NEI4 $400
line 391
;391:                s_votemenu.bTimelimit.color       = color_orange;
ADDRGP4 s_votemenu+1140+68
ADDRGP4 color_orange
ASGNP4
LABELV $400
LABELV $396
line 392
;392:        s_votemenu.bTimelimit.generic.x           = 320;
ADDRGP4 s_votemenu+1140+12
CNSTI4 320
ASGNI4
line 393
;393:        s_votemenu.bTimelimit.generic.y           = y;
ADDRGP4 s_votemenu+1140+16
ADDRLP4 0
INDIRI4
ASGNI4
line 394
;394:        s_votemenu.bTimelimit.generic.id          = ID_TIME;
ADDRGP4 s_votemenu+1140+8
CNSTI4 108
ASGNI4
line 395
;395:        s_votemenu.bTimelimit.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+1140+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 396
;396:        s_votemenu.bTimelimit.string              = "Change timelimit";
ADDRGP4 s_votemenu+1140+60
ADDRGP4 $415
ASGNP4
line 397
;397:        s_votemenu.bTimelimit.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+1140+64
CNSTI4 17
ASGNI4
line 399
;398:
;399:        y+=VOTEMENU_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 400
;400:        s_votemenu.bCustom.generic.type        = MTYPE_PTEXT;
ADDRGP4 s_votemenu+1356
CNSTI4 9
ASGNI4
line 401
;401:        s_votemenu.bCustom.color               = color_red;
ADDRGP4 s_votemenu+1356+68
ADDRGP4 color_red
ASGNP4
line 402
;402:        s_votemenu.bCustom.generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+1356+44
CNSTU4 264
ASGNU4
line 403
;403:        if(!s_votemenu.custom)
ADDRGP4 s_votemenu+700
INDIRI4
CNSTI4 0
NEI4 $423
line 404
;404:            s_votemenu.bCustom.generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 40
ADDRGP4 s_votemenu+1356+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $424
JUMPV
LABELV $423
line 406
;405:        else
;406:            if(s_votemenu.selection == ID_CUSTOM)
ADDRGP4 s_votemenu+1428
INDIRI4
CNSTI4 110
NEI4 $428
line 407
;407:                s_votemenu.bCustom.color       = color_orange;
ADDRGP4 s_votemenu+1356+68
ADDRGP4 color_orange
ASGNP4
LABELV $428
LABELV $424
line 408
;408:        s_votemenu.bCustom.generic.x           = 320;
ADDRGP4 s_votemenu+1356+12
CNSTI4 320
ASGNI4
line 409
;409:        s_votemenu.bCustom.generic.y           = y;
ADDRGP4 s_votemenu+1356+16
ADDRLP4 0
INDIRI4
ASGNI4
line 410
;410:        s_votemenu.bCustom.generic.id          = ID_CUSTOM;
ADDRGP4 s_votemenu+1356+8
CNSTI4 110
ASGNI4
line 411
;411:        s_votemenu.bCustom.generic.callback    = VoteMenu_Event;
ADDRGP4 s_votemenu+1356+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 412
;412:        s_votemenu.bCustom.string              = "Custom vote";
ADDRGP4 s_votemenu+1356+60
ADDRGP4 $443
ASGNP4
line 413
;413:        s_votemenu.bCustom.style               = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_votemenu+1356+64
CNSTI4 17
ASGNI4
line 415
;414:
;415:	s_votemenu.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu+488
CNSTI4 6
ASGNI4
line 416
;416:	s_votemenu.back.generic.name     = VOTEMENU_BACK0;
ADDRGP4 s_votemenu+488+4
ADDRGP4 $79
ASGNP4
line 417
;417:	s_votemenu.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+488+44
CNSTU4 260
ASGNU4
line 418
;418:	s_votemenu.back.generic.callback = VoteMenu_Event;
ADDRGP4 s_votemenu+488+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 419
;419:	s_votemenu.back.generic.id	   = ID_BACK;
ADDRGP4 s_votemenu+488+8
CNSTI4 100
ASGNI4
line 420
;420:	s_votemenu.back.generic.x		   = 320-128;
ADDRGP4 s_votemenu+488+12
CNSTI4 192
ASGNI4
line 421
;421:	s_votemenu.back.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu+488+16
CNSTI4 320
ASGNI4
line 422
;422:	s_votemenu.back.width  		   = 128;
ADDRGP4 s_votemenu+488+76
CNSTI4 128
ASGNI4
line 423
;423:	s_votemenu.back.height  		   = 64;
ADDRGP4 s_votemenu+488+80
CNSTI4 64
ASGNI4
line 424
;424:	s_votemenu.back.focuspic         = VOTEMENU_BACK1;
ADDRGP4 s_votemenu+488+60
ADDRGP4 $80
ASGNP4
line 426
;425:
;426:        s_votemenu.go.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu+576
CNSTI4 6
ASGNI4
line 427
;427:	s_votemenu.go.generic.name     = ART_FIGHT0;
ADDRGP4 s_votemenu+576+4
ADDRGP4 $81
ASGNP4
line 428
;428:	s_votemenu.go.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu+576+44
CNSTU4 260
ASGNU4
line 429
;429:	s_votemenu.go.generic.callback = VoteMenu_Event;
ADDRGP4 s_votemenu+576+48
ADDRGP4 VoteMenu_Event
ASGNP4
line 430
;430:	s_votemenu.go.generic.id	   = ID_GO;
ADDRGP4 s_votemenu+576+8
CNSTI4 101
ASGNI4
line 431
;431:	s_votemenu.go.generic.x		   = 320;
ADDRGP4 s_votemenu+576+12
CNSTI4 320
ASGNI4
line 432
;432:	s_votemenu.go.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu+576+16
CNSTI4 320
ASGNI4
line 433
;433:	s_votemenu.go.width  		   = 128;
ADDRGP4 s_votemenu+576+76
CNSTI4 128
ASGNI4
line 434
;434:	s_votemenu.go.height  		   = 64;
ADDRGP4 s_votemenu+576+80
CNSTI4 64
ASGNI4
line 435
;435:	s_votemenu.go.focuspic         = ART_FIGHT1;
ADDRGP4 s_votemenu+576+60
ADDRGP4 $82
ASGNP4
line 437
;436:
;437:}
LABELV $145
endproc UI_VoteMenuMenuInternal 44 0
export UI_VoteMenuMenu
proc UI_VoteMenuMenu 1032 12
line 445
;438:
;439:/*
;440:=================
;441:UI_VoteMenuMenu
;442: *Called from outside
;443:=================
;444:*/
;445:void UI_VoteMenuMenu( void ) {
line 448
;446:        // zero set all our globals
;447:        char serverinfo[MAX_INFO_STRING];
;448:	memset( &s_votemenu, 0 ,sizeof(votemenu_t) );
ADDRGP4 s_votemenu
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1432
ARGI4
ADDRGP4 memset
CALLP4
pop
line 449
;449:        trap_GetConfigString( CS_SERVERINFO, serverinfo, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 450
;450:        s_votemenu.g_doWarmupEnabled = atoi(Info_ValueForKey(serverinfo,"g_doWarmup"));
ADDRLP4 0
ARGP4
ADDRGP4 $486
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 s_votemenu+676
ADDRLP4 1028
INDIRI4
ASGNI4
line 451
;451:        UI_VoteMenuMenuInternal();
ADDRGP4 UI_VoteMenuMenuInternal
CALLV
pop
line 453
;452:
;453:	Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.banner );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 454
;454:	Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.back );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 455
;455:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.go );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 456
;456:	Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bNextmap );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+780
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 457
;457:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bMapRestart );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+708
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 458
;458:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bShuffle );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+1284
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 459
;459:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bMap );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 460
;460:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bGametype );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+1068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 461
;461:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bKick );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+924
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 462
;462:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bDoWarmup );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 463
;463:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bFraglimit );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+1212
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 464
;464:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bTimelimit );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+1140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 465
;465:        Menu_AddItem( &s_votemenu.menu, (void*) &s_votemenu.bCustom );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 s_votemenu+1356
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 467
;466:
;467:	UI_PushMenu( &s_votemenu.menu );
ADDRGP4 s_votemenu
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 468
;468:}
LABELV $484
endproc UI_VoteMenuMenu 1032 12
bss
align 4
LABELV s_votemenu
skip 1432
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
LABELV $486
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $443
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $387
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $359
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $356
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $325
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $297
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $269
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $241
byte 1 83
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $185
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
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
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
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
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $117
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
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 48
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
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
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
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $85
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
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
