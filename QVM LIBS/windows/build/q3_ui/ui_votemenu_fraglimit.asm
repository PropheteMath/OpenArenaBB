data
align 4
LABELV votemenu_fraglmit_artlist
address $79
address $80
address $81
address $82
byte 4 0
code
proc VoteMenu_Fraglimit_Event 12 8
file "../../../code/q3_ui/ui_votemenu_fraglimit.c"
line 83
;1:
;2:/*
;3:===========================================================================
;4:Copyright (C) 2009 Poul Sander
;5:
;6:This file is part of the Open Arena source code.
;7:
;8:Open Arena source code is free software; you can redistribute it
;9:and/or modify it under the terms of the GNU General Public License as
;10:published by the Free Software Foundation; either version 2 of the License,
;11:or (at your option) any later version.
;12:
;13:Open Arena source code is distributed in the hope that it will be
;14:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16:GNU General Public License for more details.
;17:
;18:You should have received a copy of the GNU General Public License
;19:along with Open Arena source code; if not, write to the Free Software
;20:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21:===========================================================================
;22:*/
;23:
;24:#include "ui_local.h"
;25:
;26:#define VOTEMENU_BACK0          "menu/art_blueish/back_0"
;27:#define VOTEMENU_BACK1          "menu/art_blueish/back_1"
;28:#define ART_FIGHT0		"menu/art_blueish/accept_0"
;29:#define ART_FIGHT1		"menu/art_blueish/accept_1"
;30:#define ART_BACKGROUND          "menu/art_blueish/addbotframe"
;31:
;32:static char* votemenu_fraglmit_artlist[] =
;33:{
;34:	VOTEMENU_BACK0,
;35:	VOTEMENU_BACK1,
;36:        ART_FIGHT0,
;37:        ART_FIGHT1,
;38:	NULL
;39:};
;40:
;41:#define ID_BACK     100
;42:#define ID_GO       101
;43:#define ID_50        102
;44:#define ID_10       103
;45:#define ID_15       104
;46:#define ID_20       105
;47:#define ID_30       106
;48:#define ID_40       107
;49:#define ID_INF      108
;50:
;51:#define FRAGLIMIT_MENU_VERTICAL_SPACING	28
;52:
;53:typedef struct
;54:{
;55:    menuframework_s	menu;
;56:    menutext_s		banner;
;57:    menubitmap_s	back;
;58:    menubitmap_s	go;
;59:
;60:    //Buttons:
;61:    menutext_s      bLimit50;
;62:    menutext_s      bLimit10;
;63:    menutext_s      bLimit15;
;64:    menutext_s      bLimit20;
;65:    menutext_s      bLimit30;
;66:    menutext_s      bLimit40;
;67:    menutext_s      bLimitInf;
;68:
;69:    int min, max; //Values restricted by server
;70:    int selection;
;71:} votemenu_t;
;72:
;73:static votemenu_t	s_votemenu_fraglmit;
;74:
;75:void UI_VoteFraglimitMenuInternal( void );
;76:
;77:/*
;78:=================
;79:VoteMenu_Fraglimit_Event
;80:=================
;81:*/
;82:static void VoteMenu_Fraglimit_Event( void* ptr, int event )
;83:{
line 84
;84:	switch (((menucommon_s*)ptr)->id)
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
line 85
;85:	{
LABELV $88
line 87
;86:		case ID_BACK:
;87:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $89
line 88
;88:				break;
ADDRGP4 $86
JUMPV
LABELV $89
line 90
;89:
;90:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 91
;91:			break;
ADDRGP4 $86
JUMPV
LABELV $91
line 93
;92:            case ID_GO:
;93:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 94
;94:                    return;
ADDRGP4 $84
JUMPV
LABELV $92
line 96
;95:                }
;96:                switch(s_votemenu_fraglmit.selection) {
ADDRLP4 8
ADDRGP4 s_votemenu_fraglmit+1176
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 102
LTI4 $86
ADDRLP4 8
INDIRI4
CNSTI4 108
GTI4 $86
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $111-408
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $111
address $107
address $97
address $99
address $101
address $103
address $105
address $109
code
LABELV $97
line 98
;97:                    case ID_10:
;98:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 10" );
CNSTI4 2
ARGI4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 99
;99:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 100
;100:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 101
;101:                        break;
ADDRGP4 $86
JUMPV
LABELV $99
line 103
;102:                    case ID_15:
;103:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 15" );
CNSTI4 2
ARGI4
ADDRGP4 $100
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 104
;104:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 105
;105:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 106
;106:                        break;
ADDRGP4 $86
JUMPV
LABELV $101
line 108
;107:                    case ID_20:
;108:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 20" );
CNSTI4 2
ARGI4
ADDRGP4 $102
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 109
;109:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 110
;110:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 111
;111:                        break;
ADDRGP4 $86
JUMPV
LABELV $103
line 113
;112:                    case ID_30:
;113:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 30" );
CNSTI4 2
ARGI4
ADDRGP4 $104
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 114
;114:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 115
;115:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 116
;116:                        break;
ADDRGP4 $86
JUMPV
LABELV $105
line 118
;117:                    case ID_40:
;118:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 40" );
CNSTI4 2
ARGI4
ADDRGP4 $106
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 119
;119:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 120
;120:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 121
;121:                        break;
ADDRGP4 $86
JUMPV
LABELV $107
line 123
;122:                    case ID_50:
;123:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 50" );
CNSTI4 2
ARGI4
ADDRGP4 $108
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 124
;124:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 125
;125:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 126
;126:                        break;
ADDRGP4 $86
JUMPV
LABELV $109
line 128
;127:                    case ID_INF:
;128:                        trap_Cmd_ExecuteText( EXEC_APPEND, "callvote fraglimit 0" );
CNSTI4 2
ARGI4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 129
;129:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 130
;130:                        UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 131
;131:                        break;
line 132
;132:                };
line 133
;133:                break;
ADDRGP4 $86
JUMPV
LABELV $85
line 135
;134:            default:
;135:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $113
line 136
;136:                    return;
ADDRGP4 $84
JUMPV
LABELV $113
line 138
;137:                }
;138:                if(s_votemenu_fraglmit.selection != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu_fraglmit+1176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $86
line 139
;139:                    s_votemenu_fraglmit.selection = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu_fraglmit+1176
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 140
;140:                    UI_VoteFraglimitMenuInternal();
ADDRGP4 UI_VoteFraglimitMenuInternal
CALLV
pop
line 141
;141:                }
line 142
;142:                break;
LABELV $86
line 144
;143:	}
;144:}
LABELV $84
endproc VoteMenu_Fraglimit_Event 12 8
proc setMenutext 12 0
line 146
;145:
;146:static void setMenutext(menutext_s *menu,int y,int id,int value,char *text) {
line 147
;147:    menu->generic.type            = MTYPE_PTEXT;
ADDRFP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 148
;148:    menu->color               = color_red;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_red
ASGNP4
line 149
;149:    menu->generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTU4 264
ASGNU4
line 150
;150:    if((s_votemenu_fraglmit.min > value && value!=0) || 
ADDRLP4 0
ADDRFP4 12
INDIRI4
ASGNI4
ADDRGP4 s_votemenu_fraglmit+1168
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $127
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $128
LABELV $127
ADDRGP4 s_votemenu_fraglmit+1172
INDIRI4
ADDRFP4 12
INDIRI4
GEI4 $129
ADDRGP4 s_votemenu_fraglmit+1172
INDIRI4
CNSTI4 0
NEI4 $128
LABELV $129
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 s_votemenu_fraglmit+1172
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $120
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $120
LABELV $128
line 153
;151:            (s_votemenu_fraglmit.max < value && s_votemenu_fraglmit.max!=0) ||
;152:            (s_votemenu_fraglmit.max != 0 && value==0))
;153:        menu->generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $121
JUMPV
LABELV $120
line 155
;154:    else
;155:    if(s_votemenu_fraglmit.selection == id)
ADDRGP4 s_votemenu_fraglmit+1176
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $130
line 156
;156:         menu->color       = color_orange;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_orange
ASGNP4
LABELV $130
LABELV $121
line 157
;157:    menu->generic.x           = 320;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 320
ASGNI4
line 158
;158:    menu->generic.y           = y;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 159
;159:    menu->generic.id          = id;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 160
;160:    menu->generic.callback    = VoteMenu_Fraglimit_Event;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 VoteMenu_Fraglimit_Event
ASGNP4
line 161
;161:    menu->string              = text;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 162
;162:    menu->style               = UI_CENTER|UI_SMALLFONT;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 17
ASGNI4
line 163
;163:}
LABELV $119
endproc setMenutext 12 0
proc VoteMenu_Fraglimit_Cache 4 4
line 171
;164:
;165:/*
;166:=================
;167:VoteMenu_Fraglimit_Cache
;168:=================
;169:*/
;170:static void VoteMenu_Fraglimit_Cache( void )
;171:{
line 175
;172:	int	i;
;173:
;174:	// touch all our pics
;175:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $134
line 176
;176:	{
line 177
;177:		if (!votemenu_fraglmit_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_fraglmit_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $138
line 178
;178:			break;
ADDRGP4 $136
JUMPV
LABELV $138
line 179
;179:		trap_R_RegisterShaderNoMip(votemenu_fraglmit_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_fraglmit_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 180
;180:	}
LABELV $135
line 175
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $136
line 181
;181:}
LABELV $133
endproc VoteMenu_Fraglimit_Cache 4 4
proc UI_VoteMenu_Fraglimit_Draw 0 20
line 188
;182:
;183:/*
;184:=================
;185:UI_VoteMenu_Fraglimit_Draw
;186:=================
;187:*/
;188:static void UI_VoteMenu_Fraglimit_Draw( void ) {
line 189
;189:	UI_DrawBannerString( 320, 16, "CALL VOTE - FRAGLIMIT", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $141
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 190
;190:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $142
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 193
;191:
;192:	// standard menu drawing
;193:	Menu_Draw( &s_votemenu_fraglmit.menu );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 194
;194:}
LABELV $140
endproc UI_VoteMenu_Fraglimit_Draw 0 20
export UI_VoteFraglimitMenuInternal
proc UI_VoteFraglimitMenuInternal 4 20
line 203
;195:
;196:/*
;197:=================
;198:UI_VoteFraglimitMenuInternal
;199: *Used then forcing a redraw
;200:=================
;201:*/
;202:void UI_VoteFraglimitMenuInternal( void )
;203:{
line 206
;204:    int y;
;205:
;206:    VoteMenu_Fraglimit_Cache();
ADDRGP4 VoteMenu_Fraglimit_Cache
CALLV
pop
line 208
;207:
;208:    s_votemenu_fraglmit.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu_fraglmit+404
CNSTI4 1
ASGNI4
line 209
;209:    s_votemenu_fraglmit.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu_fraglmit+408
CNSTI4 0
ASGNI4
line 210
;210:    s_votemenu_fraglmit.menu.draw = UI_VoteMenu_Fraglimit_Draw;
ADDRGP4 s_votemenu_fraglmit+396
ADDRGP4 UI_VoteMenu_Fraglimit_Draw
ASGNP4
line 212
;211:
;212:    s_votemenu_fraglmit.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu_fraglmit+416
CNSTI4 10
ASGNI4
line 213
;213:    s_votemenu_fraglmit.banner.generic.x	  = 320;
ADDRGP4 s_votemenu_fraglmit+416+12
CNSTI4 320
ASGNI4
line 214
;214:    s_votemenu_fraglmit.banner.generic.y	  = 16;
ADDRGP4 s_votemenu_fraglmit+416+16
CNSTI4 16
ASGNI4
line 215
;215:    s_votemenu_fraglmit.banner.string		  = "CALL VOTE - FRAGLIMIT";
ADDRGP4 s_votemenu_fraglmit+416+60
ADDRGP4 $141
ASGNP4
line 216
;216:    s_votemenu_fraglmit.banner.color	      = color_white;
ADDRGP4 s_votemenu_fraglmit+416+68
ADDRGP4 color_white
ASGNP4
line 217
;217:    s_votemenu_fraglmit.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu_fraglmit+416+64
CNSTI4 1
ASGNI4
line 219
;218:
;219:    y = 98;
ADDRLP4 0
CNSTI4 98
ASGNI4
line 220
;220:    setMenutext(&s_votemenu_fraglmit.bLimit10,y,ID_10,10,"10");
ADDRGP4 s_votemenu_fraglmit+736
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 103
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 $159
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 221
;221:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 222
;222:    setMenutext(&s_votemenu_fraglmit.bLimit15,y,ID_15,15,"15");
ADDRGP4 s_votemenu_fraglmit+808
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 104
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 $161
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 223
;223:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 224
;224:    setMenutext(&s_votemenu_fraglmit.bLimit20,y,ID_20,20,"20");
ADDRGP4 s_votemenu_fraglmit+880
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 105
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 $163
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 225
;225:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 226
;226:    setMenutext(&s_votemenu_fraglmit.bLimit30,y,ID_30,30,"30");
ADDRGP4 s_votemenu_fraglmit+952
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 106
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 227
;227:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 228
;228:    setMenutext(&s_votemenu_fraglmit.bLimit40,y,ID_40,40,"40");
ADDRGP4 s_votemenu_fraglmit+1024
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 107
ARGI4
CNSTI4 40
ARGI4
ADDRGP4 $167
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 229
;229:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 230
;230:    setMenutext(&s_votemenu_fraglmit.bLimit50,y,ID_50,50,"50");
ADDRGP4 s_votemenu_fraglmit+664
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 102
ARGI4
CNSTI4 50
ARGI4
ADDRGP4 $169
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 231
;231:    y+=FRAGLIMIT_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 232
;232:    setMenutext(&s_votemenu_fraglmit.bLimitInf,y,ID_INF,0,"No limit");
ADDRGP4 s_votemenu_fraglmit+1096
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 108
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $171
ARGP4
ADDRGP4 setMenutext
CALLV
pop
line 234
;233:
;234:    s_votemenu_fraglmit.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_fraglmit+488
CNSTI4 6
ASGNI4
line 235
;235:    s_votemenu_fraglmit.back.generic.name     = VOTEMENU_BACK0;
ADDRGP4 s_votemenu_fraglmit+488+4
ADDRGP4 $79
ASGNP4
line 236
;236:    s_votemenu_fraglmit.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_fraglmit+488+44
CNSTU4 260
ASGNU4
line 237
;237:    s_votemenu_fraglmit.back.generic.callback = VoteMenu_Fraglimit_Event;
ADDRGP4 s_votemenu_fraglmit+488+48
ADDRGP4 VoteMenu_Fraglimit_Event
ASGNP4
line 238
;238:    s_votemenu_fraglmit.back.generic.id	   = ID_BACK;
ADDRGP4 s_votemenu_fraglmit+488+8
CNSTI4 100
ASGNI4
line 239
;239:    s_votemenu_fraglmit.back.generic.x		   = 320-128;
ADDRGP4 s_votemenu_fraglmit+488+12
CNSTI4 192
ASGNI4
line 240
;240:    s_votemenu_fraglmit.back.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_fraglmit+488+16
CNSTI4 320
ASGNI4
line 241
;241:    s_votemenu_fraglmit.back.width  		   = 128;
ADDRGP4 s_votemenu_fraglmit+488+76
CNSTI4 128
ASGNI4
line 242
;242:    s_votemenu_fraglmit.back.height  		   = 64;
ADDRGP4 s_votemenu_fraglmit+488+80
CNSTI4 64
ASGNI4
line 243
;243:    s_votemenu_fraglmit.back.focuspic         = VOTEMENU_BACK1;
ADDRGP4 s_votemenu_fraglmit+488+60
ADDRGP4 $80
ASGNP4
line 245
;244:
;245:    s_votemenu_fraglmit.go.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_fraglmit+576
CNSTI4 6
ASGNI4
line 246
;246:    s_votemenu_fraglmit.go.generic.name     = ART_FIGHT0;
ADDRGP4 s_votemenu_fraglmit+576+4
ADDRGP4 $81
ASGNP4
line 247
;247:    s_votemenu_fraglmit.go.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_fraglmit+576+44
CNSTU4 260
ASGNU4
line 248
;248:    s_votemenu_fraglmit.go.generic.callback = VoteMenu_Fraglimit_Event;
ADDRGP4 s_votemenu_fraglmit+576+48
ADDRGP4 VoteMenu_Fraglimit_Event
ASGNP4
line 249
;249:    s_votemenu_fraglmit.go.generic.id	   = ID_GO;
ADDRGP4 s_votemenu_fraglmit+576+8
CNSTI4 101
ASGNI4
line 250
;250:    s_votemenu_fraglmit.go.generic.x		   = 320;
ADDRGP4 s_votemenu_fraglmit+576+12
CNSTI4 320
ASGNI4
line 251
;251:    s_votemenu_fraglmit.go.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_fraglmit+576+16
CNSTI4 320
ASGNI4
line 252
;252:    s_votemenu_fraglmit.go.width  		   = 128;
ADDRGP4 s_votemenu_fraglmit+576+76
CNSTI4 128
ASGNI4
line 253
;253:    s_votemenu_fraglmit.go.height  		   = 64;
ADDRGP4 s_votemenu_fraglmit+576+80
CNSTI4 64
ASGNI4
line 254
;254:    s_votemenu_fraglmit.go.focuspic         = ART_FIGHT1;
ADDRGP4 s_votemenu_fraglmit+576+60
ADDRGP4 $82
ASGNP4
line 255
;255:}
LABELV $143
endproc UI_VoteFraglimitMenuInternal 4 20
export UI_VoteFraglimitMenu
proc UI_VoteFraglimitMenu 1040 12
line 263
;256:
;257:/*
;258:=================
;259:UI_VoteFraglimitMenu
;260: *Called from outside
;261:=================
;262:*/
;263:void UI_VoteFraglimitMenu( void ) {
line 266
;264:        char serverinfo[MAX_INFO_STRING];
;265:        // zero set all our globals
;266:	memset( &s_votemenu_fraglmit, 0 ,sizeof(votemenu_t) );
ADDRGP4 s_votemenu_fraglmit
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1180
ARGI4
ADDRGP4 memset
CALLP4
pop
line 267
;267:        trap_GetConfigString( CS_SERVERINFO, serverinfo, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 268
;268:        s_votemenu_fraglmit.min = atoi(Info_ValueForKey(serverinfo,"g_voteMinFraglimit"));
ADDRLP4 0
ARGP4
ADDRGP4 $212
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
ADDRGP4 s_votemenu_fraglmit+1168
ADDRLP4 1028
INDIRI4
ASGNI4
line 269
;269:        s_votemenu_fraglmit.max = atoi(Info_ValueForKey(serverinfo,"g_voteMaxFraglimit"));
ADDRLP4 0
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 s_votemenu_fraglmit+1172
ADDRLP4 1036
INDIRI4
ASGNI4
line 270
;270:        UI_VoteFraglimitMenuInternal();
ADDRGP4 UI_VoteFraglimitMenuInternal
CALLV
pop
line 272
;271:
;272:	Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.banner );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 273
;273:	Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.back );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 274
;274:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.go );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 275
;275:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit10 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 276
;276:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit15 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 277
;277:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit20 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 278
;278:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit30 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 279
;279:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit40 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 280
;280:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimit50 );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 281
;281:        Menu_AddItem( &s_votemenu_fraglmit.menu, (void*) &s_votemenu_fraglmit.bLimitInf );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 s_votemenu_fraglmit+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 283
;282:
;283:	UI_PushMenu( &s_votemenu_fraglmit.menu );
ADDRGP4 s_votemenu_fraglmit
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 284
;284:}
LABELV $210
endproc UI_VoteFraglimitMenu 1040 12
bss
align 4
LABELV s_votemenu_fraglmit
skip 1180
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
LABELV $214
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 120
byte 1 70
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
LABELV $212
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 105
byte 1 110
byte 1 70
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
LABELV $171
byte 1 78
byte 1 111
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $169
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $167
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $165
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $163
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $161
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $159
byte 1 49
byte 1 48
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
LABELV $141
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
byte 1 45
byte 1 32
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 48
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 48
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 52
byte 1 48
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 48
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 50
byte 1 48
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 49
byte 1 53
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 49
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
