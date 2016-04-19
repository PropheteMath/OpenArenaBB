code
proc VoteMapMenu_Event 20 8
file "../../../code/q3_ui/ui_votemenu_map.c"
line 78
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
;25:#define ART_BACK0			"menu/art_blueish/back_0"
;26:#define ART_BACK1			"menu/art_blueish/back_1"
;27:#define ART_FIGHT0			"menu/art_blueish/accept_0"
;28:#define ART_FIGHT1			"menu/art_blueish/accept_1"
;29:#define ART_BACKGROUND                  "menu/art_blueish/addbotframe"
;30:#define ART_ARROWS			"menu/art_blueish/arrows_vert_0"
;31:#define ART_ARROWUP			"menu/art_blueish/arrows_vert_top"
;32:#define ART_ARROWDOWN                   "menu/art_blueish/arrows_vert_bot"
;33:
;34:#define ID_BACK				10
;35:#define ID_GO				11
;36:#define ID_LIST				12
;37:#define ID_UP				13
;38:#define ID_DOWN				14
;39:#define ID_MAPNAME0			20
;40:#define ID_MAPNAME1			21
;41:#define ID_MAPNAME2			22
;42:#define ID_MAPNAME3			23
;43:#define ID_MAPNAME4			24
;44:#define ID_MAPNAME5			25
;45:#define ID_MAPNAME6			26
;46:#define ID_MAPNAME7			27
;47:#define ID_MAPNAME8			28
;48:#define ID_MAPNAME9			29
;49:#define SIZE_OF_LIST                    10
;50:
;51:#define SIZE_OF_NAME                    32
;52:
;53:#define VOTEMAP_MENU_VERTICAL_SPACING	20
;54:
;55:typedef struct {
;56:	menuframework_s	menu;
;57:	menubitmap_s	arrows;
;58:        menutext_s		banner;
;59:        menutext_s		info;
;60:	menubitmap_s	up;
;61:	menubitmap_s	down;
;62:	menubitmap_s	go;
;63:	menubitmap_s	back;
;64:
;65:	menutext_s	maps[SIZE_OF_LIST];
;66:
;67:	int		selected;
;68:} votemenu_map_t;
;69:
;70:static votemenu_map_t	s_votemenu_map;
;71:
;72:/*
;73:=================
;74:VoteMapMenu_Event
;75:=================
;76:*/
;77:static void VoteMapMenu_Event( void* ptr, int event )
;78:{
line 79
;79:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $87
ADDRGP4 $81
JUMPV
line 80
;80:	{
LABELV $84
line 82
;81:            case ID_BACK:
;82:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $85
line 83
;83:                    return;
ADDRGP4 $80
JUMPV
LABELV $85
line 84
;84:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 85
;85:                break;
ADDRGP4 $82
JUMPV
LABELV $87
line 87
;86:            case ID_GO:
;87:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $88
line 88
;88:                    return;
ADDRGP4 $80
JUMPV
LABELV $88
line 90
;89:                }
;90:                if(!s_votemenu_map.selected || mappage.mapname[s_votemenu_map.selected-ID_MAPNAME0][0] == 0)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 s_votemenu_map+1720
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $96
ADDRGP4 s_votemenu_map+1720
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 mappage+4-640
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $90
LABELV $96
line 91
;91:                    return;
ADDRGP4 $80
JUMPV
LABELV $90
line 92
;92:                if(!Q_stricmp(mappage.mapname[s_votemenu_map.selected-ID_MAPNAME0],"---"))
ADDRGP4 s_votemenu_map+1720
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 mappage+4-640
ADDP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $97
line 93
;93:                    return; //Blank spaces have string "---"
ADDRGP4 $80
JUMPV
LABELV $97
line 94
;94:                trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s", mappage.mapname[s_votemenu_map.selected-ID_MAPNAME0]) );
ADDRGP4 $103
ARGP4
ADDRGP4 s_votemenu_map+1720
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 mappage+4-640
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 95
;95:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 96
;96:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;97:                break;
ADDRGP4 $82
JUMPV
LABELV $81
line 99
;98:            default:
;99:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $107
line 100
;100:                    return;
ADDRGP4 $80
JUMPV
LABELV $107
line 102
;101:                }
;102:                if(s_votemenu_map.selected != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu_map+1720
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $82
line 103
;103:                    s_votemenu_map.selected = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu_map+1720
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 104
;104:                    UI_VoteMapMenuInternal();
ADDRGP4 UI_VoteMapMenuInternal
CALLV
pop
line 105
;105:                }
line 106
;106:                break;
LABELV $82
line 108
;107:         }
;108:}
LABELV $80
endproc VoteMapMenu_Event 20 8
proc UI_VoteMapMenu_UpEvent 4 8
line 115
;109:
;110:/*
;111:=================
;112:UI_VoteMapMenu_UpEvent
;113:=================
;114:*/
;115:static void UI_VoteMapMenu_UpEvent( void* ptr, int event ) {
line 116
;116:	if (event != QM_ACTIVATED  || mappage.pagenumber<1) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $116
ADDRGP4 mappage
INDIRI4
CNSTI4 1
GEI4 $114
LABELV $116
line 117
;117:		return;
ADDRGP4 $113
JUMPV
LABELV $114
line 120
;118:	}
;119:
;120:        trap_Cmd_ExecuteText( EXEC_APPEND,va("getmappage %d",mappage.pagenumber-1) );
ADDRGP4 $117
ARGP4
ADDRGP4 mappage
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 121
;121:}
LABELV $113
endproc UI_VoteMapMenu_UpEvent 4 8
proc UI_VoteMapMenu_DownEvent 4 8
line 128
;122:
;123:/*
;124:=================
;125:UI_VoteMapMenu_DownEvent
;126:=================
;127:*/
;128:static void UI_VoteMapMenu_DownEvent( void* ptr, int event ) {
line 129
;129:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $119
line 130
;130:		return;
ADDRGP4 $118
JUMPV
LABELV $119
line 133
;131:	}
;132:
;133:        trap_Cmd_ExecuteText( EXEC_APPEND,va("getmappage %d",mappage.pagenumber+1) );
ADDRGP4 $117
ARGP4
ADDRGP4 mappage
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 134
;134:}
LABELV $118
endproc UI_VoteMapMenu_DownEvent 4 8
proc UI_VoteMapMenu_Draw 0 20
line 141
;135:
;136:/*
;137:=================
;138:UI_VoteMapMenu_Draw
;139:=================
;140:*/
;141:static void UI_VoteMapMenu_Draw( void ) {
line 142
;142:	UI_DrawBannerString( 320, 16, "CALL VOTE MAP", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $122
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 143
;143:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $123
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 146
;144:
;145:	// standard menu drawing
;146:	Menu_Draw( &s_votemenu_map.menu );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 147
;147:}
LABELV $121
endproc UI_VoteMapMenu_Draw 0 20
proc VoteMapMenu_Cache 0 4
line 155
;148:
;149:/*
;150:=================
;151:VoteMapMenu_Cache
;152:=================
;153:*/
;154:static void VoteMapMenu_Cache( void )
;155:{
line 156
;156:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $125
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 157
;157:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $126
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 158
;158:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 159
;159:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $128
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 160
;160:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $123
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 161
;161:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $129
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 162
;162:	trap_R_RegisterShaderNoMip( ART_ARROWUP );
ADDRGP4 $130
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 163
;163:	trap_R_RegisterShaderNoMip( ART_ARROWDOWN );
ADDRGP4 $131
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 164
;164:}
LABELV $124
endproc VoteMapMenu_Cache 0 4
proc setMapMenutext 0 0
line 166
;165:
;166:static void setMapMenutext(menutext_s *menu,int y,int id,char * text) {
line 167
;167:    menu->generic.type            = MTYPE_PTEXT;
ADDRFP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 168
;168:    menu->color               = color_red;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_red
ASGNP4
line 169
;169:    menu->generic.flags       = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTU4 260
ASGNU4
line 170
;170:    if(s_votemenu_map.selected == id)
ADDRGP4 s_votemenu_map+1720
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $133
line 171
;171:         menu->color       = color_orange;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_orange
ASGNP4
LABELV $133
line 172
;172:    menu->generic.x           = 320-80;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 240
ASGNI4
line 173
;173:    menu->generic.y           = y;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 174
;174:    menu->generic.id          = id;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 175
;175:    menu->generic.callback    = VoteMapMenu_Event;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 VoteMapMenu_Event
ASGNP4
line 176
;176:    menu->string              = text;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 177
;177:    menu->style               = UI_LEFT|UI_SMALLFONT;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 16
ASGNI4
line 178
;178:}
LABELV $132
endproc setMapMenutext 0 0
export UI_VoteMapMenuInternal
proc UI_VoteMapMenuInternal 16 16
line 187
;179:
;180:/*
;181:=================
;182:UI_VoteMapMenuInternal
;183: *Used then forcing a redraw
;184:=================
;185:*/
;186:void UI_VoteMapMenuInternal( void )
;187:{
line 190
;188:    int y,i;
;189:
;190:    s_votemenu_map.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu_map+404
CNSTI4 1
ASGNI4
line 191
;191:    s_votemenu_map.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu_map+408
CNSTI4 0
ASGNI4
line 192
;192:    s_votemenu_map.menu.draw = UI_VoteMapMenu_Draw;
ADDRGP4 s_votemenu_map+396
ADDRGP4 UI_VoteMapMenu_Draw
ASGNP4
line 194
;193:
;194:    s_votemenu_map.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu_map+504
CNSTI4 10
ASGNI4
line 195
;195:    s_votemenu_map.banner.generic.x	  = 320;
ADDRGP4 s_votemenu_map+504+12
CNSTI4 320
ASGNI4
line 196
;196:    s_votemenu_map.banner.generic.y	  = 16;
ADDRGP4 s_votemenu_map+504+16
CNSTI4 16
ASGNI4
line 197
;197:    s_votemenu_map.banner.string		  = "CALL VOTE MAP";
ADDRGP4 s_votemenu_map+504+60
ADDRGP4 $122
ASGNP4
line 198
;198:    s_votemenu_map.banner.color	      = color_white;
ADDRGP4 s_votemenu_map+504+68
ADDRGP4 color_white
ASGNP4
line 199
;199:    s_votemenu_map.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu_map+504+64
CNSTI4 1
ASGNI4
line 201
;200:
;201:    s_votemenu_map.info.generic.type  = MTYPE_TEXT;
ADDRGP4 s_votemenu_map+576
CNSTI4 7
ASGNI4
line 202
;202:    s_votemenu_map.info.generic.x	  = 320;
ADDRGP4 s_votemenu_map+576+12
CNSTI4 320
ASGNI4
line 203
;203:    s_votemenu_map.info.generic.y	  = 48;
ADDRGP4 s_votemenu_map+576+16
CNSTI4 48
ASGNI4
line 204
;204:    s_votemenu_map.info.string		  = va("Page %d",mappage.pagenumber+1);
ADDRGP4 $158
ARGP4
ADDRGP4 mappage
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_votemenu_map+576+60
ADDRLP4 8
INDIRP4
ASGNP4
line 205
;205:    s_votemenu_map.info.color	      = color_white;
ADDRGP4 s_votemenu_map+576+68
ADDRGP4 color_white
ASGNP4
line 206
;206:    s_votemenu_map.info.style	      = UI_CENTER;
ADDRGP4 s_votemenu_map+576+64
CNSTI4 1
ASGNI4
line 208
;207:
;208:    s_votemenu_map.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_votemenu_map+416
CNSTI4 6
ASGNI4
line 209
;209:    s_votemenu_map.arrows.generic.name  = ART_ARROWS;
ADDRGP4 s_votemenu_map+416+4
ADDRGP4 $129
ASGNP4
line 210
;210:    s_votemenu_map.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_votemenu_map+416+44
CNSTU4 16384
ASGNU4
line 211
;211:    s_votemenu_map.arrows.generic.x	 = 200-40;
ADDRGP4 s_votemenu_map+416+12
CNSTI4 160
ASGNI4
line 212
;212:    s_votemenu_map.arrows.generic.y	 = 128+30;
ADDRGP4 s_votemenu_map+416+16
CNSTI4 158
ASGNI4
line 213
;213:    s_votemenu_map.arrows.width  	     = 64;
ADDRGP4 s_votemenu_map+416+76
CNSTI4 64
ASGNI4
line 214
;214:    s_votemenu_map.arrows.height  	     = 128;
ADDRGP4 s_votemenu_map+416+80
CNSTI4 128
ASGNI4
line 216
;215:
;216:    y = 98;
ADDRLP4 4
CNSTI4 98
ASGNI4
line 217
;217:    setMapMenutext(&s_votemenu_map.maps[0],y,ID_MAPNAME0,mappage.mapname[0]);
ADDRGP4 s_votemenu_map+1000
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 mappage+4
ARGP4
ADDRGP4 setMapMenutext
CALLV
pop
line 218
;218:    for(i=1;i<SIZE_OF_LIST;i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $178
line 219
;219:    		y+=VOTEMAP_MENU_VERTICAL_SPACING;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 220
;220:    		setMapMenutext(&s_votemenu_map.maps[i],y,ID_MAPNAME0+i,mappage.mapname[i]);
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_votemenu_map+1000
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 mappage+4
ADDP4
ARGP4
ADDRGP4 setMapMenutext
CALLV
pop
line 221
;221:	}
LABELV $179
line 218
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $178
line 222
;222:    y+=VOTEMAP_MENU_VERTICAL_SPACING+8;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 223
;223:    s_votemenu_map.info.generic.y	  = y;
ADDRGP4 s_votemenu_map+576+16
ADDRLP4 4
INDIRI4
ASGNI4
line 225
;224:
;225:    s_votemenu_map.up.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_votemenu_map+648
CNSTI4 6
ASGNI4
line 226
;226:    s_votemenu_map.up.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_map+648+44
CNSTU4 260
ASGNU4
line 227
;227:    s_votemenu_map.up.generic.x		= 200-40;
ADDRGP4 s_votemenu_map+648+12
CNSTI4 160
ASGNI4
line 228
;228:    s_votemenu_map.up.generic.y		= 128+30;
ADDRGP4 s_votemenu_map+648+16
CNSTI4 158
ASGNI4
line 229
;229:    s_votemenu_map.up.generic.id	    = ID_UP;
ADDRGP4 s_votemenu_map+648+8
CNSTI4 13
ASGNI4
line 230
;230:    s_votemenu_map.up.generic.callback = UI_VoteMapMenu_UpEvent;
ADDRGP4 s_votemenu_map+648+48
ADDRGP4 UI_VoteMapMenu_UpEvent
ASGNP4
line 231
;231:    s_votemenu_map.up.width  		    = 64;
ADDRGP4 s_votemenu_map+648+76
CNSTI4 64
ASGNI4
line 232
;232:    s_votemenu_map.up.height  		    = 64;
ADDRGP4 s_votemenu_map+648+80
CNSTI4 64
ASGNI4
line 233
;233:    s_votemenu_map.up.focuspic         = ART_ARROWUP;
ADDRGP4 s_votemenu_map+648+60
ADDRGP4 $130
ASGNP4
line 235
;234:
;235:    s_votemenu_map.down.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_votemenu_map+736
CNSTI4 6
ASGNI4
line 236
;236:    s_votemenu_map.down.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_map+736+44
CNSTU4 260
ASGNU4
line 237
;237:    s_votemenu_map.down.generic.x		  = 200-40;
ADDRGP4 s_votemenu_map+736+12
CNSTI4 160
ASGNI4
line 238
;238:    s_votemenu_map.down.generic.y		  = 128+30+64;
ADDRGP4 s_votemenu_map+736+16
CNSTI4 222
ASGNI4
line 239
;239:    s_votemenu_map.down.generic.id	      = ID_DOWN;
ADDRGP4 s_votemenu_map+736+8
CNSTI4 14
ASGNI4
line 240
;240:    s_votemenu_map.down.generic.callback = UI_VoteMapMenu_DownEvent;
ADDRGP4 s_votemenu_map+736+48
ADDRGP4 UI_VoteMapMenu_DownEvent
ASGNP4
line 241
;241:    s_votemenu_map.down.width  		  = 64;
ADDRGP4 s_votemenu_map+736+76
CNSTI4 64
ASGNI4
line 242
;242:    s_votemenu_map.down.height  		  = 64;
ADDRGP4 s_votemenu_map+736+80
CNSTI4 64
ASGNI4
line 243
;243:    s_votemenu_map.down.focuspic         = ART_ARROWDOWN;
ADDRGP4 s_votemenu_map+736+60
ADDRGP4 $131
ASGNP4
line 245
;244:
;245:    s_votemenu_map.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_votemenu_map+824
CNSTI4 6
ASGNI4
line 246
;246:    s_votemenu_map.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_votemenu_map+824+4
ADDRGP4 $127
ASGNP4
line 247
;247:    s_votemenu_map.go.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_map+824+44
CNSTU4 260
ASGNU4
line 248
;248:    s_votemenu_map.go.generic.id			= ID_GO;
ADDRGP4 s_votemenu_map+824+8
CNSTI4 11
ASGNI4
line 249
;249:    s_votemenu_map.go.generic.callback		= VoteMapMenu_Event;
ADDRGP4 s_votemenu_map+824+48
ADDRGP4 VoteMapMenu_Event
ASGNP4
line 250
;250:    s_votemenu_map.go.generic.x			= 320+128-128;
ADDRGP4 s_votemenu_map+824+12
CNSTI4 320
ASGNI4
line 251
;251:    s_votemenu_map.go.generic.y			= 256+128-64;
ADDRGP4 s_votemenu_map+824+16
CNSTI4 320
ASGNI4
line 252
;252:    s_votemenu_map.go.width  				= 128;
ADDRGP4 s_votemenu_map+824+76
CNSTI4 128
ASGNI4
line 253
;253:    s_votemenu_map.go.height  				= 64;
ADDRGP4 s_votemenu_map+824+80
CNSTI4 64
ASGNI4
line 254
;254:    s_votemenu_map.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_votemenu_map+824+60
ADDRGP4 $128
ASGNP4
line 256
;255:
;256:    s_votemenu_map.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_votemenu_map+912
CNSTI4 6
ASGNI4
line 257
;257:    s_votemenu_map.back.generic.name		= ART_BACK0;
ADDRGP4 s_votemenu_map+912+4
ADDRGP4 $125
ASGNP4
line 258
;258:    s_votemenu_map.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_map+912+44
CNSTU4 260
ASGNU4
line 259
;259:    s_votemenu_map.back.generic.id			= ID_BACK;
ADDRGP4 s_votemenu_map+912+8
CNSTI4 10
ASGNI4
line 260
;260:    s_votemenu_map.back.generic.callback	= VoteMapMenu_Event;
ADDRGP4 s_votemenu_map+912+48
ADDRGP4 VoteMapMenu_Event
ASGNP4
line 261
;261:    s_votemenu_map.back.generic.x			= 320-128;
ADDRGP4 s_votemenu_map+912+12
CNSTI4 192
ASGNI4
line 262
;262:    s_votemenu_map.back.generic.y			= 256+128-64;
ADDRGP4 s_votemenu_map+912+16
CNSTI4 320
ASGNI4
line 263
;263:    s_votemenu_map.back.width				= 128;
ADDRGP4 s_votemenu_map+912+76
CNSTI4 128
ASGNI4
line 264
;264:    s_votemenu_map.back.height				= 64;
ADDRGP4 s_votemenu_map+912+80
CNSTI4 64
ASGNI4
line 265
;265:    s_votemenu_map.back.focuspic			= ART_BACK1;
ADDRGP4 s_votemenu_map+912+60
ADDRGP4 $126
ASGNP4
line 266
;266:}
LABELV $136
endproc UI_VoteMapMenuInternal 16 16
export UI_VoteMapMenu
proc UI_VoteMapMenu 8 12
line 276
;267:
;268:t_mappage mappage;
;269:
;270:/*
;271:=================
;272:UI_VoteMapMenu
;273: *Called from outside
;274:=================
;275:*/
;276:void UI_VoteMapMenu( void ) {
line 278
;277:    int i;
;278:    VoteMapMenu_Cache();
ADDRGP4 VoteMapMenu_Cache
CALLV
pop
line 279
;279:    memset( &s_votemenu_map, 0 ,sizeof(votemenu_map_t) );
ADDRGP4 s_votemenu_map
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1724
ARGI4
ADDRGP4 memset
CALLP4
pop
line 281
;280:
;281:    UI_VoteMapMenuInternal();
ADDRGP4 UI_VoteMapMenuInternal
CALLV
pop
line 284
;282:
;283:    //We need to initialize the list or it will be impossible to click on the items
;284:    for(i=0;i<SIZE_OF_LIST;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $259
line 285
;285:        Q_strncpyz(mappage.mapname[i],"----",5);
ADDRLP4 4
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 mappage+4
ADDP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 286
;286:    }
LABELV $260
line 284
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $259
line 287
;287:    trap_Cmd_ExecuteText( EXEC_APPEND,"getmappage 0" );
CNSTI4 2
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 288
;288:    trap_Cvar_Set( "cl_paused", "0" ); //We cannot send server commands while paused!
ADDRGP4 $266
ARGP4
ADDRGP4 $267
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 290
;289:
;290:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.banner );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 291
;291:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.info );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.back );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.go );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;294:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.arrows );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;295:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.down );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 296
;296:    Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.up );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 s_votemenu_map+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 297
;297:    for(i=0;i<SIZE_OF_LIST;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $275
line 298
;298:        Menu_AddItem( &s_votemenu_map.menu, (void*) &s_votemenu_map.maps[i] );
ADDRGP4 s_votemenu_map
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_votemenu_map+1000
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $276
line 297
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $275
line 300
;299:
;300:    UI_PushMenu( &s_votemenu_map.menu );
ADDRGP4 s_votemenu_map
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 301
;301:}
LABELV $258
endproc UI_VoteMapMenu 8 12
bss
align 4
LABELV s_votemenu_map
skip 1724
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
export mappage
align 4
LABELV mappage
skip 324
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
LABELV $267
byte 1 48
byte 1 0
align 1
LABELV $266
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $265
byte 1 103
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $264
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $158
byte 1 80
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $131
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
LABELV $130
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
LABELV $129
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
LABELV $128
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
LABELV $127
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
LABELV $126
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
LABELV $125
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
LABELV $123
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
LABELV $122
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
byte 1 77
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $117
byte 1 103
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $103
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
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 45
byte 1 45
byte 1 45
byte 1 0
