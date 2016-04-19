data
align 4
LABELV votemenu_custom_artlist
address $79
address $80
address $81
address $82
byte 4 0
code
proc VoteMenu_custom_Event 12 8
file "../../../code/q3_ui/ui_votemenu_custom.c"
line 74
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
;31:static char* votemenu_custom_artlist[] =
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
;42:#define ID_CUSTOM0        102
;43://next 11 for ID_CUSTOM1-CUSTOM11
;44:
;45:#define CUSTOM_MENU_VERTICAL_SPACING	19
;46:#define CUSTOM_MENU_MAX_ENTRIES 12
;47:
;48:typedef struct
;49:{
;50:    menuframework_s	menu;
;51:    menutext_s		banner;
;52:    menubitmap_s	back;
;53:    menubitmap_s	go;
;54:
;55:    //Buttons:
;56:    menutext_s      bEntry[CUSTOM_MENU_MAX_ENTRIES];
;57:
;58:    //The text:
;59:    char            text[CUSTOM_MENU_MAX_ENTRIES][32];
;60:
;61:    int selection;
;62:} votemenu_t;
;63:
;64:static votemenu_t	s_votemenu_custom;
;65:
;66:void UI_VoteCustomMenuInternal( void );
;67:
;68:/*
;69:=================
;70:VoteMenu_custom_Event
;71:=================
;72:*/
;73:static void VoteMenu_custom_Event( void* ptr, int event )
;74:{
line 75
;75:	switch (((menucommon_s*)ptr)->id)
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
line 76
;76:	{
LABELV $88
line 78
;77:            case ID_BACK:
;78:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $89
line 79
;79:				break;
ADDRGP4 $86
JUMPV
LABELV $89
line 81
;80:
;81:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 82
;82:			break;
ADDRGP4 $86
JUMPV
LABELV $91
line 84
;83:            case ID_GO:
;84:                if( event != QM_ACTIVATED || !s_votemenu_custom.selection) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $95
ADDRGP4 s_votemenu_custom+1912
INDIRI4
CNSTI4 0
NEI4 $92
LABELV $95
line 85
;85:                    return;
ADDRGP4 $84
JUMPV
LABELV $92
line 87
;86:                }
;87:                trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote custom %s",s_votemenu_custom.bEntry[s_votemenu_custom.selection-ID_CUSTOM0].string ) );
ADDRGP4 $96
ARGP4
CNSTI4 72
ADDRGP4 s_votemenu_custom+1912
INDIRI4
MULI4
ADDRGP4 s_votemenu_custom+664-7344+60
ADDP4
INDIRP4
ARGP4
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
line 88
;88:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 89
;89:                UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:                break;
ADDRGP4 $86
JUMPV
LABELV $85
line 92
;91:            default:
;92:                if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 93
;93:                    return;
ADDRGP4 $84
JUMPV
LABELV $101
line 95
;94:                }
;95:                if(s_votemenu_custom.selection != ((menucommon_s*)ptr)->id) {
ADDRGP4 s_votemenu_custom+1912
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $86
line 96
;96:                    s_votemenu_custom.selection = ((menucommon_s*)ptr)->id;
ADDRGP4 s_votemenu_custom+1912
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 97
;97:                    UI_VoteCustomMenuInternal();
ADDRGP4 UI_VoteCustomMenuInternal
CALLV
pop
line 98
;98:                }
line 99
;99:                break;
LABELV $86
line 102
;100:        }
;101:
;102:}
LABELV $84
endproc VoteMenu_custom_Event 12 8
proc setCustomMenutext 8 4
line 104
;103:
;104:static void setCustomMenutext(menutext_s *menu,int y,int id,char *text) {
line 105
;105:    menu->generic.type            = MTYPE_PTEXT;
ADDRFP4 0
INDIRP4
CNSTI4 9
ASGNI4
line 106
;106:    menu->color               = color_red;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_red
ASGNP4
line 107
;107:    menu->generic.flags       = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTU4 264
ASGNU4
line 108
;108:    if(strlen(text)<1)
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $108
line 109
;109:        menu->generic.flags   |= QMF_INACTIVE|QMF_GRAYED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $109
JUMPV
LABELV $108
line 111
;110:    else
;111:    if(s_votemenu_custom.selection == id)
ADDRGP4 s_votemenu_custom+1912
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $110
line 112
;112:         menu->color       = color_orange;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 color_orange
ASGNP4
LABELV $110
LABELV $109
line 113
;113:    menu->generic.x           = 320;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 320
ASGNI4
line 114
;114:    menu->generic.y           = y;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 115
;115:    menu->generic.id          = id;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 116
;116:    menu->generic.callback    = VoteMenu_custom_Event;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 VoteMenu_custom_Event
ASGNP4
line 117
;117:    menu->string              = text;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 118
;118:    menu->style               = UI_CENTER|UI_SMALLFONT;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 17
ASGNI4
line 119
;119:}
LABELV $107
endproc setCustomMenutext 8 4
proc VoteMenu_Custom_Cache 4 4
line 127
;120:
;121:/*
;122:=================
;123:VoteMenu_Custom_Cache
;124:=================
;125:*/
;126:static void VoteMenu_Custom_Cache( void )
;127:{
line 131
;128:	int	i;
;129:
;130:	// touch all our pics
;131:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $114
line 132
;132:	{
line 133
;133:		if (!votemenu_custom_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_custom_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $118
line 134
;134:			break;
ADDRGP4 $116
JUMPV
LABELV $118
line 135
;135:		trap_R_RegisterShaderNoMip(votemenu_custom_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 votemenu_custom_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 136
;136:	}
LABELV $115
line 131
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $116
line 137
;137:}
LABELV $113
endproc VoteMenu_Custom_Cache 4 4
proc UI_VoteMenu_Custom_Draw 0 20
line 144
;138:
;139:/*
;140:=================
;141:UI_VoteMenu_Custom_Draw
;142:=================
;143:*/
;144:static void UI_VoteMenu_Custom_Draw( void ) {
line 145
;145:	UI_DrawBannerString( 320, 16, "CALL VOTE CUSTOM", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $121
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 146
;146:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $122
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 149
;147:
;148:	// standard menu drawing
;149:	Menu_Draw( &s_votemenu_custom.menu );
ADDRGP4 s_votemenu_custom
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 150
;150:}
LABELV $120
endproc UI_VoteMenu_Custom_Draw 0 20
export UI_VoteCustomMenuInternal
proc UI_VoteCustomMenuInternal 1048 16
line 159
;151:
;152:/*
;153:=================
;154:UI_VoteCustomMenuInternal
;155: *Used then forcing a redraw
;156:=================
;157:*/
;158:void UI_VoteCustomMenuInternal( void )
;159:{
line 163
;160:    int y,i;
;161:    char custominfo[MAX_INFO_STRING], *token,*pointer;
;162:
;163:    VoteMenu_Custom_Cache();
ADDRGP4 VoteMenu_Custom_Cache
CALLV
pop
line 165
;164:
;165:    memset( &custominfo, 0, sizeof(custominfo));
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 166
;166:    trap_Cvar_VariableStringBuffer("cg_vote_custom_commands",custominfo,sizeof(custominfo));
ADDRGP4 $124
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 168
;167:
;168:    s_votemenu_custom.menu.wrapAround = qtrue;
ADDRGP4 s_votemenu_custom+404
CNSTI4 1
ASGNI4
line 169
;169:    s_votemenu_custom.menu.fullscreen = qfalse;
ADDRGP4 s_votemenu_custom+408
CNSTI4 0
ASGNI4
line 170
;170:    s_votemenu_custom.menu.draw = UI_VoteMenu_Custom_Draw;
ADDRGP4 s_votemenu_custom+396
ADDRGP4 UI_VoteMenu_Custom_Draw
ASGNP4
line 172
;171:
;172:    s_votemenu_custom.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_votemenu_custom+416
CNSTI4 10
ASGNI4
line 173
;173:    s_votemenu_custom.banner.generic.x	  = 320;
ADDRGP4 s_votemenu_custom+416+12
CNSTI4 320
ASGNI4
line 174
;174:    s_votemenu_custom.banner.generic.y	  = 16;
ADDRGP4 s_votemenu_custom+416+16
CNSTI4 16
ASGNI4
line 175
;175:    s_votemenu_custom.banner.string		  = "CALL VOTE CUSTOM";
ADDRGP4 s_votemenu_custom+416+60
ADDRGP4 $121
ASGNP4
line 176
;176:    s_votemenu_custom.banner.color	      = color_white;
ADDRGP4 s_votemenu_custom+416+68
ADDRGP4 color_white
ASGNP4
line 177
;177:    s_votemenu_custom.banner.style	      = UI_CENTER;
ADDRGP4 s_votemenu_custom+416+64
CNSTI4 1
ASGNI4
line 179
;178:
;179:    pointer = custominfo;
ADDRLP4 12
ADDRLP4 16
ASGNP4
line 181
;180:
;181:    y = 98;
ADDRLP4 4
CNSTI4 98
ASGNI4
line 182
;182:    for(i=0;i<CUSTOM_MENU_MAX_ENTRIES;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $139
line 183
;183:        token = COM_Parse( &pointer );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1040
INDIRP4
ASGNP4
line 184
;184:        Q_strncpyz(s_votemenu_custom.text[i],token,sizeof(s_votemenu_custom.text[0]));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_votemenu_custom+1528
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 185
;185:        setCustomMenutext(&s_votemenu_custom.bEntry[i],y,ID_CUSTOM0+i,s_votemenu_custom.text[i]);
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_votemenu_custom+664
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 102
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_votemenu_custom+1528
ADDP4
ARGP4
ADDRGP4 setCustomMenutext
CALLV
pop
line 186
;186:        y+=CUSTOM_MENU_VERTICAL_SPACING;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 187
;187:    }
LABELV $140
line 182
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $139
line 189
;188:
;189:    s_votemenu_custom.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_custom+488
CNSTI4 6
ASGNI4
line 190
;190:    s_votemenu_custom.back.generic.name     = VOTEMENU_BACK0;
ADDRGP4 s_votemenu_custom+488+4
ADDRGP4 $79
ASGNP4
line 191
;191:    s_votemenu_custom.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_custom+488+44
CNSTU4 260
ASGNU4
line 192
;192:    s_votemenu_custom.back.generic.callback = VoteMenu_custom_Event;
ADDRGP4 s_votemenu_custom+488+48
ADDRGP4 VoteMenu_custom_Event
ASGNP4
line 193
;193:    s_votemenu_custom.back.generic.id	   = ID_BACK;
ADDRGP4 s_votemenu_custom+488+8
CNSTI4 100
ASGNI4
line 194
;194:    s_votemenu_custom.back.generic.x		   = 320-128;
ADDRGP4 s_votemenu_custom+488+12
CNSTI4 192
ASGNI4
line 195
;195:    s_votemenu_custom.back.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_custom+488+16
CNSTI4 320
ASGNI4
line 196
;196:    s_votemenu_custom.back.width  		   = 128;
ADDRGP4 s_votemenu_custom+488+76
CNSTI4 128
ASGNI4
line 197
;197:    s_votemenu_custom.back.height  		   = 64;
ADDRGP4 s_votemenu_custom+488+80
CNSTI4 64
ASGNI4
line 198
;198:    s_votemenu_custom.back.focuspic         = VOTEMENU_BACK1;
ADDRGP4 s_votemenu_custom+488+60
ADDRGP4 $80
ASGNP4
line 200
;199:
;200:    s_votemenu_custom.go.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_votemenu_custom+576
CNSTI4 6
ASGNI4
line 201
;201:    s_votemenu_custom.go.generic.name     = ART_FIGHT0;
ADDRGP4 s_votemenu_custom+576+4
ADDRGP4 $81
ASGNP4
line 202
;202:    s_votemenu_custom.go.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_votemenu_custom+576+44
CNSTU4 260
ASGNU4
line 203
;203:    s_votemenu_custom.go.generic.callback = VoteMenu_custom_Event;
ADDRGP4 s_votemenu_custom+576+48
ADDRGP4 VoteMenu_custom_Event
ASGNP4
line 204
;204:    s_votemenu_custom.go.generic.id	   = ID_GO;
ADDRGP4 s_votemenu_custom+576+8
CNSTI4 101
ASGNI4
line 205
;205:    s_votemenu_custom.go.generic.x		   = 320;
ADDRGP4 s_votemenu_custom+576+12
CNSTI4 320
ASGNI4
line 206
;206:    s_votemenu_custom.go.generic.y		   = 256+128-64;
ADDRGP4 s_votemenu_custom+576+16
CNSTI4 320
ASGNI4
line 207
;207:    s_votemenu_custom.go.width  		   = 128;
ADDRGP4 s_votemenu_custom+576+76
CNSTI4 128
ASGNI4
line 208
;208:    s_votemenu_custom.go.height  		   = 64;
ADDRGP4 s_votemenu_custom+576+80
CNSTI4 64
ASGNI4
line 209
;209:    s_votemenu_custom.go.focuspic         = ART_FIGHT1;
ADDRGP4 s_votemenu_custom+576+60
ADDRGP4 $82
ASGNP4
line 210
;210:}
LABELV $123
endproc UI_VoteCustomMenuInternal 1048 16
export UI_VoteCustomMenu
proc UI_VoteCustomMenu 4 12
line 218
;211:
;212:/*
;213:=================
;214:UI_VoteCustomMenu
;215: *Called from outside
;216:=================
;217:*/
;218:void UI_VoteCustomMenu( void ) {
line 221
;219:        int i;
;220:        // zero set all our globals
;221:	memset( &s_votemenu_custom, 0 ,sizeof(votemenu_t) );
ADDRGP4 s_votemenu_custom
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1916
ARGI4
ADDRGP4 memset
CALLP4
pop
line 223
;222:        
;223:        UI_VoteCustomMenuInternal();
ADDRGP4 UI_VoteCustomMenuInternal
CALLV
pop
line 225
;224:
;225:	Menu_AddItem( &s_votemenu_custom.menu, (void*) &s_votemenu_custom.banner );
ADDRGP4 s_votemenu_custom
ARGP4
ADDRGP4 s_votemenu_custom+416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 226
;226:	Menu_AddItem( &s_votemenu_custom.menu, (void*) &s_votemenu_custom.back );
ADDRGP4 s_votemenu_custom
ARGP4
ADDRGP4 s_votemenu_custom+488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 227
;227:        Menu_AddItem( &s_votemenu_custom.menu, (void*) &s_votemenu_custom.go );
ADDRGP4 s_votemenu_custom
ARGP4
ADDRGP4 s_votemenu_custom+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 228
;228:        for(i=0;i<CUSTOM_MENU_MAX_ENTRIES;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $189
line 229
;229:            Menu_AddItem( &s_votemenu_custom.menu, (void*) &s_votemenu_custom.bEntry[i] );
ADDRGP4 s_votemenu_custom
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_votemenu_custom+664
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $190
line 228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $189
line 231
;230:
;231:	UI_PushMenu( &s_votemenu_custom.menu );
ADDRGP4 s_votemenu_custom
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 232
;232:}
LABELV $185
endproc UI_VoteCustomMenu 4 12
bss
align 4
LABELV s_votemenu_custom
skip 1916
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
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $122
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
LABELV $121
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
byte 1 67
byte 1 85
byte 1 83
byte 1 84
byte 1 79
byte 1 77
byte 1 0
align 1
LABELV $96
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
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 37
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
