data
align 4
LABELV playermodel_artlist
address $79
address $80
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
byte 4 0
code
proc PlayerModel_UpdateGrid 28 0
file "../../../code/q3_ui/ui_playermodel.c"
line 113
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
;23:#include "ui_local.h"
;24:
;25:#define MODEL_BACK0			"menu/art_blueish/back_0"
;26:#define MODEL_BACK1			"menu/art_blueish/back_1"
;27:#define MODEL_SELECT		"menu/art/opponents_select"
;28:#define MODEL_SELECTED		"menu/art/opponents_selected"
;29:#define MODEL_FRAMEL		"menu/art_blueish/frame1_l"
;30:#define MODEL_FRAMER		"menu/art_blueish/frame1_r"
;31:#define MODEL_PORTS			"menu/art_blueish/player_models_ports"
;32:#define MODEL_ARROWS		"menu/art_blueish/gs_arrows_0"
;33:#define MODEL_ARROWSL		"menu/art_blueish/gs_arrows_l"
;34:#define MODEL_ARROWSR		"menu/art_blueish/gs_arrows_r"
;35:
;36:#define LOW_MEMORY			(5 * 1024 * 1024)
;37:
;38:static char* playermodel_artlist[] =
;39:{
;40:	MODEL_BACK0,	
;41:	MODEL_BACK1,	
;42:	MODEL_SELECT,
;43:	MODEL_SELECTED,
;44:	MODEL_FRAMEL,
;45:	MODEL_FRAMER,
;46:	MODEL_PORTS,	
;47:	MODEL_ARROWS,
;48:	MODEL_ARROWSL,
;49:	MODEL_ARROWSR,
;50:	NULL
;51:};
;52:
;53:#define PLAYERGRID_COLS		4
;54:#define PLAYERGRID_ROWS		4
;55:#define MAX_MODELSPERPAGE	(PLAYERGRID_ROWS*PLAYERGRID_COLS)
;56:
;57:#define MAX_PLAYERMODELS	256
;58:
;59:#define ID_PLAYERPIC0		0
;60:#define ID_PLAYERPIC1		1
;61:#define ID_PLAYERPIC2		2
;62:#define ID_PLAYERPIC3		3
;63:#define ID_PLAYERPIC4		4
;64:#define ID_PLAYERPIC5		5
;65:#define ID_PLAYERPIC6		6
;66:#define ID_PLAYERPIC7		7
;67:#define ID_PLAYERPIC8		8
;68:#define ID_PLAYERPIC9		9
;69:#define ID_PLAYERPIC10		10
;70:#define ID_PLAYERPIC11		11
;71:#define ID_PLAYERPIC12		12
;72:#define ID_PLAYERPIC13		13
;73:#define ID_PLAYERPIC14		14
;74:#define ID_PLAYERPIC15		15
;75:#define ID_PREVPAGE			100
;76:#define ID_NEXTPAGE			101
;77:#define ID_BACK				102
;78:
;79:typedef struct
;80:{
;81:	menuframework_s	menu;
;82:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;83:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;84:	menubitmap_s	framel;
;85:	menubitmap_s	framer;
;86:	menubitmap_s	ports;
;87:	menutext_s		banner;
;88:	menubitmap_s	back;
;89:	menubitmap_s	player;
;90:	menubitmap_s	arrows;
;91:	menubitmap_s	left;
;92:	menubitmap_s	right;
;93:	menutext_s		modelname;
;94:	menutext_s		skinname;
;95:	menutext_s		playername;
;96:	playerInfo_t	playerinfo;
;97:	int				nummodels;
;98:	char			modelnames[MAX_PLAYERMODELS][128];
;99:	int				modelpage;
;100:	int				numpages;
;101:	char			modelskin[64];
;102:	int				selectedmodel;
;103:} playermodel_t;
;104:
;105:static playermodel_t s_playermodel;
;106:
;107:/*
;108:=================
;109:PlayerModel_UpdateGrid
;110:=================
;111:*/
;112:static void PlayerModel_UpdateGrid( void )
;113:{
line 117
;114:	int	i;
;115:    int	j;
;116:
;117:	j = s_playermodel.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 118
;118:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++,j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $92
line 119
;119:	{
line 120
;120:		if (j < s_playermodel.nummodels)
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5332
INDIRI4
GEI4 $96
line 121
;121:		{ 
line 123
;122:			// model/skin portrait
;123: 			s_playermodel.pics[i].generic.name         = s_playermodel.modelnames[j];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5336
ADDP4
ASGNP4
line 124
;124:			s_playermodel.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 125
;125:		}
ADDRGP4 $97
JUMPV
LABELV $96
line 127
;126:		else
;127:		{
line 129
;128:			// dead slot
;129: 			s_playermodel.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+4
ADDP4
CNSTP4 0
ASGNP4
line 130
;130:			s_playermodel.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 131
;131:		}
LABELV $97
line 133
;132:
;133: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 134
;134: 		s_playermodel.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+68
ADDP4
CNSTI4 0
ASGNI4
line 135
;135: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 136
;136:	}
LABELV $93
line 118
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $92
line 138
;137:
;138:	if (s_playermodel.selectedmodel/MAX_MODELSPERPAGE == s_playermodel.modelpage)
ADDRGP4 s_playermodel+38176
INDIRI4
CNSTI4 16
DIVI4
ADDRGP4 s_playermodel+38104
INDIRI4
NEI4 $114
line 139
;139:	{
line 141
;140:		// set selected model
;141:		i = s_playermodel.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 s_playermodel+38176
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 143
;142:
;143:		s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 144
;144:		s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 145
;145:	}
LABELV $114
line 147
;146:
;147:	if (s_playermodel.numpages > 1)
ADDRGP4 s_playermodel+38108
INDIRI4
CNSTI4 1
LEI4 $123
line 148
;148:	{
line 149
;149:		if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 0
LEI4 $126
line 150
;150:			s_playermodel.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3832+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRGP4 $127
JUMPV
LABELV $126
line 152
;151:		else
;152:			s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_playermodel+3832+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
LABELV $127
line 154
;153:
;154:		if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+38104
INDIRI4
ADDRGP4 s_playermodel+38108
INDIRI4
CNSTI4 1
SUBI4
GEI4 $133
line 155
;155:			s_playermodel.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_playermodel+3920+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRGP4 $124
JUMPV
LABELV $133
line 157
;156:		else
;157:			s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 s_playermodel+3920+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 158
;158:	}
ADDRGP4 $124
JUMPV
LABELV $123
line 160
;159:	else
;160:	{
line 162
;161:		// hide left/right markers
;162:		s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3832+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 163
;163:		s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_playermodel+3920+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 164
;164:	}
LABELV $124
line 165
;165:}
LABELV $90
endproc PlayerModel_UpdateGrid 28 0
proc PlayerModel_UpdateModel 28 28
line 173
;166:
;167:/*
;168:=================
;169:PlayerModel_UpdateModel
;170:=================
;171:*/
;172:static void PlayerModel_UpdateModel( void )
;173:{
line 177
;174:	vec3_t	viewangles;
;175:	vec3_t	moveangles;
;176:
;177:	memset( &s_playermodel.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playermodel+4224
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 179
;178:	
;179:	viewangles[YAW]   = 180 - 30;
ADDRLP4 0+4
CNSTF4 1125515264
ASGNF4
line 180
;180:	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 181
;181:	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 182
;182:	VectorClear( moveangles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 184
;183:
;184:	UI_PlayerInfo_SetModel( &s_playermodel.playerinfo, s_playermodel.modelskin );
ADDRGP4 s_playermodel+4224
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 185
;185:	UI_PlayerInfo_SetInfo( &s_playermodel.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, moveangles, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playermodel+4224
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 186
;186:}
LABELV $145
endproc PlayerModel_UpdateModel 28 28
proc PlayerModel_SaveChanges 0 8
line 194
;187:
;188:/*
;189:=================
;190:PlayerModel_SaveChanges
;191:=================
;192:*/
;193:static void PlayerModel_SaveChanges( void )
;194:{
line 195
;195:	trap_Cvar_Set( "model", s_playermodel.modelskin );
ADDRGP4 $155
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 196
;196:	trap_Cvar_Set( "headmodel", s_playermodel.modelskin );
ADDRGP4 $157
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 197
;197:	trap_Cvar_Set( "team_model", s_playermodel.modelskin );
ADDRGP4 $159
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 198
;198:	trap_Cvar_Set( "team_headmodel", s_playermodel.modelskin );
ADDRGP4 $161
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 199
;199:}
LABELV $154
endproc PlayerModel_SaveChanges 0 8
proc PlayerModel_MenuEvent 12 0
line 207
;200:
;201:/*
;202:=================
;203:PlayerModel_MenuEvent
;204:=================
;205:*/
;206:static void PlayerModel_MenuEvent( void* ptr, int event )
;207:{
line 208
;208:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $164
line 209
;209:		return;
ADDRGP4 $163
JUMPV
LABELV $164
line 211
;210:
;211:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $169
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $174
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $180
ADDRGP4 $166
JUMPV
line 212
;212:	{
LABELV $169
line 214
;213:		case ID_PREVPAGE:
;214:			if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 0
LEI4 $167
line 215
;215:			{
line 216
;216:				s_playermodel.modelpage--;
ADDRLP4 8
ADDRGP4 s_playermodel+38104
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 217
;217:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 218
;218:			}
line 219
;219:			break;
ADDRGP4 $167
JUMPV
LABELV $174
line 222
;220:
;221:		case ID_NEXTPAGE:
;222:			if (s_playermodel.modelpage < s_playermodel.numpages-1)
ADDRGP4 s_playermodel+38104
INDIRI4
ADDRGP4 s_playermodel+38108
INDIRI4
CNSTI4 1
SUBI4
GEI4 $167
line 223
;223:			{
line 224
;224:				s_playermodel.modelpage++;
ADDRLP4 8
ADDRGP4 s_playermodel+38104
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 225
;225:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 226
;226:			}
line 227
;227:			break;
ADDRGP4 $167
JUMPV
LABELV $180
line 230
;228:
;229:		case ID_BACK:
;230:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 231
;231:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 232
;232:			break;
LABELV $166
LABELV $167
line 234
;233:	}
;234:}
LABELV $163
endproc PlayerModel_MenuEvent 12 0
proc PlayerModel_MenuKey 52 8
line 242
;235:
;236:/*
;237:=================
;238:PlayerModel_MenuKey
;239:=================
;240:*/
;241:static sfxHandle_t PlayerModel_MenuKey( int key )
;242:{
line 246
;243:	menucommon_s*	m;
;244:	int				picnum;
;245:
;246:	switch (key)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 134
EQI4 $184
ADDRLP4 12
CNSTI4 135
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $193
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $207
LABELV $206
ADDRFP4 0
INDIRI4
CNSTI4 27
EQI4 $205
ADDRGP4 $182
JUMPV
LABELV $207
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 163
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $184
ADDRLP4 16
INDIRI4
CNSTI4 165
EQI4 $193
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $182
LABELV $208
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $205
ADDRGP4 $182
JUMPV
line 247
;247:	{
LABELV $184
line 250
;248:		case K_KP_LEFTARROW:
;249:		case K_LEFTARROW:
;250:			m = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 24
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 251
;251:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 252
;252:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $183
ADDRLP4 28
INDIRI4
CNSTI4 15
GTI4 $183
line 253
;253:			{
line 254
;254:				if (picnum > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $187
line 255
;255:				{
line 256
;256:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-1);
ADDRLP4 32
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 257
;257:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
LABELV $187
line 260
;258:					
;259:				}
;260:				else if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 0
LEI4 $189
line 261
;261:				{
line 262
;262:					s_playermodel.modelpage--;
ADDRLP4 32
ADDRGP4 s_playermodel+38104
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 263
;263:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+15);
ADDRLP4 36
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 264
;264:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 265
;265:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
LABELV $189
line 268
;266:				}
;267:				else
;268:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
line 270
;269:			}
;270:			break;
LABELV $193
line 274
;271:
;272:		case K_KP_RIGHTARROW:
;273:		case K_RIGHTARROW:
;274:			m = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 32
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 275
;275:			picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 276
;276:			if (picnum >= 0 && picnum <= 15)
ADDRLP4 36
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $183
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $183
line 277
;277:			{
line 278
;278:				if ((picnum < 15) && (s_playermodel.modelpage*MAX_MODELSPERPAGE + picnum+1 < s_playermodel.nummodels))
ADDRLP4 40
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 15
GEI4 $196
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRGP4 s_playermodel+5332
INDIRI4
GEI4 $196
line 279
;279:				{
line 280
;280:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor+1);
ADDRLP4 44
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 281
;281:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
LABELV $196
line 283
;282:				}					
;283:				else if ((picnum == 15) && (s_playermodel.modelpage < s_playermodel.numpages-1))
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $200
ADDRGP4 s_playermodel+38104
INDIRI4
ADDRGP4 s_playermodel+38108
INDIRI4
CNSTI4 1
SUBI4
GEI4 $200
line 284
;284:				{
line 285
;285:					s_playermodel.modelpage++;
ADDRLP4 44
ADDRGP4 s_playermodel+38104
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 286
;286:					Menu_SetCursor(&s_playermodel.menu,s_playermodel.menu.cursor-15);
ADDRLP4 48
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 15
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 287
;287:					PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 288
;288:					return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
LABELV $200
line 291
;289:				}
;290:				else
;291:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $181
JUMPV
line 293
;292:			}
;293:			break;
LABELV $205
line 297
;294:			
;295:		case K_MOUSE2:
;296:		case K_ESCAPE:
;297:			PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 298
;298:			break;
LABELV $182
LABELV $183
line 301
;299:	}
;300:
;301:	return ( Menu_DefaultKey( &s_playermodel.menu, key ) );
ADDRGP4 s_playermodel
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
LABELV $181
endproc PlayerModel_MenuKey 52 8
proc PlayerModel_PicEvent 48 12
line 310
;302:}
;303:
;304:/*
;305:=================
;306:PlayerModel_PicEvent
;307:=================
;308:*/
;309:static void PlayerModel_PicEvent( void* ptr, int event )
;310:{
line 317
;311:	int				modelnum;
;312:	int				maxlen;
;313:	char*			buffptr;
;314:	char*			pdest;
;315:	int				i;
;316:
;317:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $210
line 318
;318:		return;
ADDRGP4 $209
JUMPV
LABELV $210
line 320
;319:
;320:	for (i=0; i<PLAYERGRID_ROWS*PLAYERGRID_COLS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $212
line 321
;321:	{
line 323
;322:		// reset
;323: 		s_playermodel.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 324
;324: 		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 325
;325:	}
LABELV $213
line 320
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $212
line 328
;326:
;327:	// set selected
;328:	i = ((menucommon_s*)ptr)->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 329
;329:	s_playermodel.pics[i].generic.flags       |= QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 330
;330:	s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 333
;331:
;332:	// get model and strip icon_
;333:	modelnum = s_playermodel.modelpage*MAX_MODELSPERPAGE + i;
ADDRLP4 16
ADDRGP4 s_playermodel+38104
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 334
;334:	buffptr  = s_playermodel.modelnames[modelnum] + strlen("models/players/");
ADDRGP4 $226
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5336
ADDP4
ADDP4
ASGNP4
line 335
;335:	pdest    = strstr(buffptr,"icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 336
;336:	if (pdest)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 337
;337:	{
line 339
;338:		// track the whole model/skin name
;339:		Q_strncpyz(s_playermodel.modelskin,buffptr,pdest-buffptr+1);
ADDRGP4 s_playermodel+38112
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 340
;340:		strcat(s_playermodel.modelskin,pdest + 5);
ADDRGP4 s_playermodel+38112
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 343
;341:
;342:		// seperate the model name
;343:		maxlen = pdest-buffptr;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 344
;344:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $232
line 345
;345:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $232
line 346
;346:		Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
ADDRGP4 s_playermodel+4008+60
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 347
;347:		Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+4008+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 350
;348:
;349:		// seperate the skin name
;350:		maxlen = strlen(pdest+5)+1;
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 351
;351:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $238
line 352
;352:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $238
line 353
;353:		Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
ADDRGP4 s_playermodel+4080+60
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 354
;354:		Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+4080+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 356
;355:
;356:		s_playermodel.selectedmodel = modelnum;
ADDRGP4 s_playermodel+38176
ADDRLP4 16
INDIRI4
ASGNI4
line 358
;357:
;358:		if( trap_MemoryRemaining() > LOW_MEMORY ) {
ADDRLP4 44
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 5242880
LEI4 $245
line 359
;359:			PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 360
;360:		}
LABELV $245
line 361
;361:	}
LABELV $228
line 362
;362:}
LABELV $209
endproc PlayerModel_PicEvent 48 12
proc PlayerModel_DrawPlayer 12 24
line 370
;363:
;364:/*
;365:=================
;366:PlayerModel_DrawPlayer
;367:=================
;368:*/
;369:static void PlayerModel_DrawPlayer( void *self )
;370:{
line 373
;371:	menubitmap_s*	b;
;372:
;373:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 375
;374:
;375:	if( trap_MemoryRemaining() <= LOW_MEMORY ) {
ADDRLP4 4
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5242880
GTI4 $248
line 376
;376:		UI_DrawProportionalString( b->generic.x, b->generic.y + b->height / 2, "LOW MEMORY", UI_LEFT, color_red );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ARGI4
ADDRGP4 $250
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 377
;377:		return;
ADDRGP4 $247
JUMPV
LABELV $248
line 380
;378:	}
;379:
;380:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playermodel.playerinfo, uis.realtime/2 );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playermodel+4224
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 381
;381:}
LABELV $247
endproc PlayerModel_DrawPlayer 12 24
proc PlayerModel_BuildList 4244 20
line 389
;382:
;383:/*
;384:=================
;385:PlayerModel_BuildList
;386:=================
;387:*/
;388:static void PlayerModel_BuildList( void )
;389:{
line 403
;390:	int		numdirs;
;391:	int		numfiles;
;392:	char	dirlist[2048];
;393:	char	filelist[2048];
;394:	char	skinname[MAX_QPATH];
;395:	char*	dirptr;
;396:	char*	fileptr;
;397:	int		i;
;398:	int		j;
;399:	int		dirlen;
;400:	int		filelen;
;401:	qboolean precache;
;402:
;403:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $254
ARGP4
ADDRLP4 4196
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 4196
INDIRF4
CVFI4 4
ASGNI4
line 405
;404:
;405:	s_playermodel.modelpage = 0;
ADDRGP4 s_playermodel+38104
CNSTI4 0
ASGNI4
line 406
;406:	s_playermodel.nummodels = 0;
ADDRGP4 s_playermodel+5332
CNSTI4 0
ASGNI4
line 409
;407:
;408:	// iterate directory of all player models
;409:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $257
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 2148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 4200
INDIRI4
ASGNI4
line 410
;410:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2148
ASGNP4
line 411
;411:	for (i=0; i<numdirs && s_playermodel.nummodels < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $259
line 412
;412:	{
line 413
;413:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4204
INDIRI4
ASGNI4
line 415
;414:		
;415:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $264
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $264
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $264
line 417
;416:
;417:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 4212
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $270
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 4216
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $266
LABELV $270
line 418
;418:			continue;
ADDRGP4 $260
JUMPV
LABELV $266
line 421
;419:			
;420:		// iterate all skin files in directory
;421:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $271
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4224
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 4224
INDIRI4
ASGNI4
line 422
;422:		fileptr  = filelist;
ADDRLP4 64
ADDRLP4 96
ASGNP4
line 423
;423:		for (j=0; j<numfiles && s_playermodel.nummodels < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 424
;424:		{
line 425
;425:			filelen = strlen(fileptr);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 4228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 4228
INDIRI4
ASGNI4
line 427
;426:
;427:			COM_StripExtension(fileptr,skinname, sizeof(skinname));
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 430
;428:
;429:			// look for icon_????
;430:			if (!Q_stricmpn(skinname,"icon_",5))
ADDRLP4 0
ARGP4
ADDRGP4 $227
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4232
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $278
line 431
;431:			{
line 432
;432:				Com_sprintf( s_playermodel.modelnames[s_playermodel.nummodels++],
ADDRLP4 4240
ADDRGP4 s_playermodel+5332
ASGNP4
ADDRLP4 4236
ADDRLP4 4240
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4240
INDIRP4
ADDRLP4 4236
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4236
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5336
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $284
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 437
;433:					sizeof( s_playermodel.modelnames[s_playermodel.nummodels] ),
;434:					"models/players/%s/%s", dirptr, skinname );
;435:				//if (s_playermodel.nummodels >= MAX_PLAYERMODELS)
;436:				//	return;
;437:			}
LABELV $278
line 439
;438:
;439:			if( precache ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $285
line 440
;440:				trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", skinname), qfalse );
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 441
;441:			}
LABELV $285
line 442
;442:		}
LABELV $274
line 423
ADDRLP4 4228
CNSTI4 1
ASGNI4
ADDRLP4 68
ADDRLP4 68
INDIRI4
ADDRLP4 4228
INDIRI4
ADDI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
ADDRLP4 4228
INDIRI4
ADDI4
ADDRLP4 64
INDIRP4
ADDP4
ASGNP4
LABELV $276
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $288
ADDRGP4 s_playermodel+5332
INDIRI4
CNSTI4 256
LTI4 $273
LABELV $288
line 443
;443:	}	
LABELV $260
line 411
ADDRLP4 4204
CNSTI4 1
ASGNI4
ADDRLP4 92
ADDRLP4 92
INDIRI4
ADDRLP4 4204
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 88
INDIRI4
ADDRLP4 4204
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $262
ADDRLP4 92
INDIRI4
ADDRLP4 2144
INDIRI4
GEI4 $289
ADDRGP4 s_playermodel+5332
INDIRI4
CNSTI4 256
LTI4 $259
LABELV $289
line 447
;444:
;445:	//APSFIXME - Degenerate no models case
;446:
;447:	s_playermodel.numpages = s_playermodel.nummodels/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+38108
ADDRGP4 s_playermodel+5332
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 448
;448:	if (s_playermodel.nummodels % MAX_MODELSPERPAGE)
ADDRGP4 s_playermodel+5332
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $292
line 449
;449:		s_playermodel.numpages++;
ADDRLP4 4208
ADDRGP4 s_playermodel+38108
ASGNP4
ADDRLP4 4208
INDIRP4
ADDRLP4 4208
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $292
line 450
;450:}
LABELV $253
endproc PlayerModel_BuildList 4244 20
proc PlayerModel_SetMenuItems 100 12
line 458
;451:
;452:/*
;453:=================
;454:PlayerModel_SetMenuItems
;455:=================
;456:*/
;457:static void PlayerModel_SetMenuItems( void )
;458:{
line 466
;459:	int				i;
;460:	int				maxlen;
;461:	char			modelskin[64];
;462:	char*			buffptr;
;463:	char*			pdest;
;464:
;465:	// name
;466:	trap_Cvar_VariableStringBuffer( "name", s_playermodel.playername.string, 16 );
ADDRGP4 $297
ARGP4
ADDRGP4 s_playermodel+4152+60
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 467
;467:	Q_CleanStr( s_playermodel.playername.string );
ADDRGP4 s_playermodel+4152+60
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 470
;468:
;469:	// model
;470:	trap_Cvar_VariableStringBuffer( "model", s_playermodel.modelskin, 64 );
ADDRGP4 $155
ARGP4
ADDRGP4 s_playermodel+38112
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 473
;471:	
;472:	// use default skin if none is set
;473:	if (!strchr(s_playermodel.modelskin, '/')) {
ADDRGP4 s_playermodel+38112
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 80
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $303
line 474
;474:		Q_strcat(s_playermodel.modelskin, 64, "/default");
ADDRGP4 s_playermodel+38112
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 475
;475:	}
LABELV $303
line 478
;476:	
;477:	// find model in our list
;478:	for (i=0; i<s_playermodel.nummodels; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $308
line 479
;479:	{
line 481
;480:		// strip icon_
;481:		buffptr  = s_playermodel.modelnames[i] + strlen("models/players/");
ADDRGP4 $226
ARGP4
ADDRLP4 84
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5336
ADDP4
ADDP4
ASGNP4
line 482
;482:		pdest    = strstr(buffptr,"icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 88
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 483
;483:		if (pdest)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
line 484
;484:		{
line 485
;485:			Q_strncpyz(modelskin,buffptr,pdest-buffptr+1);
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 486
;486:			strcat(modelskin,pdest + 5);
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 487
;487:		}
line 489
;488:		else
;489:			continue;
LABELV $315
line 491
;490:
;491:		if (!Q_stricmp( s_playermodel.modelskin, modelskin ))
ADDRGP4 s_playermodel+38112
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $316
line 492
;492:		{
line 494
;493:			// found pic, set selection here		
;494:			s_playermodel.selectedmodel = i;
ADDRGP4 s_playermodel+38176
ADDRLP4 4
INDIRI4
ASGNI4
line 495
;495:			s_playermodel.modelpage     = i/MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+38104
ADDRLP4 4
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 498
;496:
;497:			// seperate the model name
;498:			maxlen = pdest-buffptr;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 499
;499:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $321
line 500
;500:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $321
line 501
;501:			Q_strncpyz( s_playermodel.modelname.string, buffptr, maxlen );
ADDRGP4 s_playermodel+4008+60
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 502
;502:			Q_strupr( s_playermodel.modelname.string );
ADDRGP4 s_playermodel+4008+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 505
;503:
;504:			// seperate the skin name
;505:			maxlen = strlen(pdest+5)+1;
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 506
;506:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $327
line 507
;507:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $327
line 508
;508:			Q_strncpyz( s_playermodel.skinname.string, pdest+5, maxlen );
ADDRGP4 s_playermodel+4080+60
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 509
;509:			Q_strupr( s_playermodel.skinname.string );
ADDRGP4 s_playermodel+4080+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 510
;510:			break;
ADDRGP4 $310
JUMPV
LABELV $316
line 512
;511:		}
;512:	}
LABELV $309
line 478
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $311
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5332
INDIRI4
LTI4 $308
LABELV $310
line 513
;513:}
LABELV $296
endproc PlayerModel_SetMenuItems 100 12
bss
align 1
LABELV $334
skip 32
align 1
LABELV $335
skip 32
align 1
LABELV $336
skip 32
code
proc PlayerModel_MenuInit 28 12
line 521
;514:
;515:/*
;516:=================
;517:PlayerModel_MenuInit
;518:=================
;519:*/
;520:static void PlayerModel_MenuInit( void )
;521:{
line 532
;522:	int			i;
;523:	int			j;
;524:	int			k;
;525:	int			x;
;526:	int			y;
;527:	static char	playername[32];
;528:	static char	modelname[32];
;529:	static char	skinname[32];
;530:
;531:	// zero set all our globals
;532:	memset( &s_playermodel, 0 ,sizeof(playermodel_t) );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 0
ARGI4
CNSTI4 38180
ARGI4
ADDRGP4 memset
CALLP4
pop
line 534
;533:
;534:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 536
;535:
;536:	s_playermodel.menu.key        = PlayerModel_MenuKey;
ADDRGP4 s_playermodel+400
ADDRGP4 PlayerModel_MenuKey
ASGNP4
line 537
;537:	s_playermodel.menu.wrapAround = qtrue;
ADDRGP4 s_playermodel+404
CNSTI4 1
ASGNI4
line 538
;538:	s_playermodel.menu.fullscreen = qtrue;
ADDRGP4 s_playermodel+408
CNSTI4 1
ASGNI4
line 540
;539:
;540:	s_playermodel.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playermodel+3496
CNSTI4 10
ASGNI4
line 541
;541:	s_playermodel.banner.generic.x     = 320;
ADDRGP4 s_playermodel+3496+12
CNSTI4 320
ASGNI4
line 542
;542:	s_playermodel.banner.generic.y     = 16;
ADDRGP4 s_playermodel+3496+16
CNSTI4 16
ASGNI4
line 543
;543:	s_playermodel.banner.string        = "PLAYER MODEL";
ADDRGP4 s_playermodel+3496+60
ADDRGP4 $347
ASGNP4
line 544
;544:	s_playermodel.banner.color         = color_white;
ADDRGP4 s_playermodel+3496+68
ADDRGP4 color_white
ASGNP4
line 545
;545:	s_playermodel.banner.style         = UI_CENTER;
ADDRGP4 s_playermodel+3496+64
CNSTI4 1
ASGNI4
line 547
;546:
;547:	s_playermodel.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3232
CNSTI4 6
ASGNI4
line 548
;548:	s_playermodel.framel.generic.name  = MODEL_FRAMEL;
ADDRGP4 s_playermodel+3232+4
ADDRGP4 $83
ASGNP4
line 549
;549:	s_playermodel.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3232+44
CNSTU4 16388
ASGNU4
line 550
;550:	s_playermodel.framel.generic.x     = 0;
ADDRGP4 s_playermodel+3232+12
CNSTI4 0
ASGNI4
line 551
;551:	s_playermodel.framel.generic.y     = 78;
ADDRGP4 s_playermodel+3232+16
CNSTI4 78
ASGNI4
line 552
;552:	s_playermodel.framel.width         = 256;
ADDRGP4 s_playermodel+3232+76
CNSTI4 256
ASGNI4
line 553
;553:	s_playermodel.framel.height        = 329;
ADDRGP4 s_playermodel+3232+80
CNSTI4 329
ASGNI4
line 555
;554:
;555:	s_playermodel.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3320
CNSTI4 6
ASGNI4
line 556
;556:	s_playermodel.framer.generic.name  = MODEL_FRAMER;
ADDRGP4 s_playermodel+3320+4
ADDRGP4 $84
ASGNP4
line 557
;557:	s_playermodel.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3320+44
CNSTU4 16388
ASGNU4
line 558
;558:	s_playermodel.framer.generic.x     = 376;
ADDRGP4 s_playermodel+3320+12
CNSTI4 376
ASGNI4
line 559
;559:	s_playermodel.framer.generic.y     = 76;
ADDRGP4 s_playermodel+3320+16
CNSTI4 76
ASGNI4
line 560
;560:	s_playermodel.framer.width         = 256;
ADDRGP4 s_playermodel+3320+76
CNSTI4 256
ASGNI4
line 561
;561:	s_playermodel.framer.height        = 334;
ADDRGP4 s_playermodel+3320+80
CNSTI4 334
ASGNI4
line 563
;562:
;563:	s_playermodel.ports.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3408
CNSTI4 6
ASGNI4
line 564
;564:	s_playermodel.ports.generic.name  = MODEL_PORTS;
ADDRGP4 s_playermodel+3408+4
ADDRGP4 $85
ASGNP4
line 565
;565:	s_playermodel.ports.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+3408+44
CNSTU4 16388
ASGNU4
line 566
;566:	s_playermodel.ports.generic.x     = 50;
ADDRGP4 s_playermodel+3408+12
CNSTI4 50
ASGNI4
line 567
;567:	s_playermodel.ports.generic.y     = 59;
ADDRGP4 s_playermodel+3408+16
CNSTI4 59
ASGNI4
line 568
;568:	s_playermodel.ports.width         = 274;
ADDRGP4 s_playermodel+3408+76
CNSTI4 274
ASGNI4
line 569
;569:	s_playermodel.ports.height        = 274;
ADDRGP4 s_playermodel+3408+80
CNSTI4 274
ASGNI4
line 571
;570:
;571:	y =	59;
ADDRLP4 8
CNSTI4 59
ASGNI4
line 572
;572:	for (i=0,k=0; i<PLAYERGRID_ROWS; i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $391
line 573
;573:	{
line 574
;574:		x =	50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 575
;575:		for (j=0; j<PLAYERGRID_COLS; j++,k++)
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $395
line 576
;576:		{
line 577
;577:			s_playermodel.pics[k].generic.type	   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416
ADDP4
CNSTI4 6
ASGNI4
line 578
;578:			s_playermodel.pics[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+44
ADDP4
CNSTU4 16388
ASGNU4
line 579
;579:			s_playermodel.pics[k].generic.x		   = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 580
;580:			s_playermodel.pics[k].generic.y		   = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 581
;581:			s_playermodel.pics[k].width  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+76
ADDP4
CNSTI4 64
ASGNI4
line 582
;582:			s_playermodel.pics[k].height  		   = 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+80
ADDP4
CNSTI4 64
ASGNI4
line 583
;583:			s_playermodel.pics[k].focuspic         = MODEL_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+60
ADDP4
ADDRGP4 $82
ASGNP4
line 584
;584:			s_playermodel.pics[k].focuscolor       = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+416+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 586
;585:
;586:			s_playermodel.picbuttons[k].generic.type	 = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824
ADDP4
CNSTI4 6
ASGNI4
line 587
;587:			s_playermodel.picbuttons[k].generic.flags    = QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+44
ADDP4
CNSTU4 33028
ASGNU4
line 588
;588:			s_playermodel.picbuttons[k].generic.id	     = ID_PLAYERPIC0+k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 589
;589:			s_playermodel.picbuttons[k].generic.callback = PlayerModel_PicEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+48
ADDP4
ADDRGP4 PlayerModel_PicEvent
ASGNP4
line 590
;590:			s_playermodel.picbuttons[k].generic.x    	 = x - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 591
;591:			s_playermodel.picbuttons[k].generic.y		 = y - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 592
;592:			s_playermodel.picbuttons[k].generic.left	 = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 593
;593:			s_playermodel.picbuttons[k].generic.top		 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 594
;594:			s_playermodel.picbuttons[k].generic.right	 = x + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 595
;595:			s_playermodel.picbuttons[k].generic.bottom   = y + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 596
;596:			s_playermodel.picbuttons[k].width  		     = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+76
ADDP4
CNSTI4 128
ASGNI4
line 597
;597:			s_playermodel.picbuttons[k].height  		 = 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+80
ADDP4
CNSTI4 128
ASGNI4
line 598
;598:			s_playermodel.picbuttons[k].focuspic  		 = MODEL_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+60
ADDP4
ADDRGP4 $81
ASGNP4
line 599
;599:			s_playermodel.picbuttons[k].focuscolor  	 = colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 601
;600:
;601:			x += 64+6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 602
;602:		}
LABELV $396
line 575
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $395
line 603
;603:		y += 64+6;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 604
;604:	}
LABELV $392
line 572
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $394
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $391
line 606
;605:
;606:	s_playermodel.playername.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4152
CNSTI4 9
ASGNI4
line 607
;607:	s_playermodel.playername.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+4152+44
CNSTU4 16392
ASGNU4
line 608
;608:	s_playermodel.playername.generic.x	   = 320;
ADDRGP4 s_playermodel+4152+12
CNSTI4 320
ASGNI4
line 609
;609:	s_playermodel.playername.generic.y	   = 440;
ADDRGP4 s_playermodel+4152+16
CNSTI4 440
ASGNI4
line 610
;610:	s_playermodel.playername.string	       = playername;
ADDRGP4 s_playermodel+4152+60
ADDRGP4 $334
ASGNP4
line 611
;611:	s_playermodel.playername.style		   = UI_CENTER;
ADDRGP4 s_playermodel+4152+64
CNSTI4 1
ASGNI4
line 612
;612:	s_playermodel.playername.color         = text_color_normal;
ADDRGP4 s_playermodel+4152+68
ADDRGP4 text_color_normal
ASGNP4
line 614
;613:
;614:	s_playermodel.modelname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4008
CNSTI4 9
ASGNI4
line 615
;615:	s_playermodel.modelname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+4008+44
CNSTU4 16392
ASGNU4
line 616
;616:	s_playermodel.modelname.generic.x	  = 497;
ADDRGP4 s_playermodel+4008+12
CNSTI4 497
ASGNI4
line 617
;617:	s_playermodel.modelname.generic.y	  = 54;
ADDRGP4 s_playermodel+4008+16
CNSTI4 54
ASGNI4
line 618
;618:	s_playermodel.modelname.string	      = modelname;
ADDRGP4 s_playermodel+4008+60
ADDRGP4 $335
ASGNP4
line 619
;619:	s_playermodel.modelname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+4008+64
CNSTI4 1
ASGNI4
line 620
;620:	s_playermodel.modelname.color         = text_color_normal;
ADDRGP4 s_playermodel+4008+68
ADDRGP4 text_color_normal
ASGNP4
line 622
;621:
;622:	s_playermodel.skinname.generic.type   = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4080
CNSTI4 9
ASGNI4
line 623
;623:	s_playermodel.skinname.generic.flags  = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playermodel+4080+44
CNSTU4 16392
ASGNU4
line 624
;624:	s_playermodel.skinname.generic.x	  = 497;
ADDRGP4 s_playermodel+4080+12
CNSTI4 497
ASGNI4
line 625
;625:	s_playermodel.skinname.generic.y	  = 394;
ADDRGP4 s_playermodel+4080+16
CNSTI4 394
ASGNI4
line 626
;626:	s_playermodel.skinname.string	      = skinname;
ADDRGP4 s_playermodel+4080+60
ADDRGP4 $336
ASGNP4
line 627
;627:	s_playermodel.skinname.style		  = UI_CENTER;
ADDRGP4 s_playermodel+4080+64
CNSTI4 1
ASGNI4
line 628
;628:	s_playermodel.skinname.color          = text_color_normal;
ADDRGP4 s_playermodel+4080+68
ADDRGP4 text_color_normal
ASGNP4
line 630
;629:
;630:	s_playermodel.player.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3656
CNSTI4 6
ASGNI4
line 631
;631:	s_playermodel.player.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_playermodel+3656+44
CNSTU4 16384
ASGNU4
line 632
;632:	s_playermodel.player.generic.ownerdraw = PlayerModel_DrawPlayer;
ADDRGP4 s_playermodel+3656+56
ADDRGP4 PlayerModel_DrawPlayer
ASGNP4
line 633
;633:	s_playermodel.player.generic.x	       = 400;
ADDRGP4 s_playermodel+3656+12
CNSTI4 400
ASGNI4
line 634
;634:	s_playermodel.player.generic.y	       = -40;
ADDRGP4 s_playermodel+3656+16
CNSTI4 -40
ASGNI4
line 635
;635:	s_playermodel.player.width	           = 32*10;
ADDRGP4 s_playermodel+3656+76
CNSTI4 320
ASGNI4
line 636
;636:	s_playermodel.player.height            = 56*10;
ADDRGP4 s_playermodel+3656+80
CNSTI4 560
ASGNI4
line 638
;637:
;638:	s_playermodel.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3744
CNSTI4 6
ASGNI4
line 639
;639:	s_playermodel.arrows.generic.name		= MODEL_ARROWS;
ADDRGP4 s_playermodel+3744+4
ADDRGP4 $86
ASGNP4
line 640
;640:	s_playermodel.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playermodel+3744+44
CNSTU4 16384
ASGNU4
line 641
;641:	s_playermodel.arrows.generic.x			= 125;
ADDRGP4 s_playermodel+3744+12
CNSTI4 125
ASGNI4
line 642
;642:	s_playermodel.arrows.generic.y			= 340;
ADDRGP4 s_playermodel+3744+16
CNSTI4 340
ASGNI4
line 643
;643:	s_playermodel.arrows.width				= 128;
ADDRGP4 s_playermodel+3744+76
CNSTI4 128
ASGNI4
line 644
;644:	s_playermodel.arrows.height				= 32;
ADDRGP4 s_playermodel+3744+80
CNSTI4 32
ASGNI4
line 646
;645:
;646:	s_playermodel.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playermodel+3832
CNSTI4 6
ASGNI4
line 647
;647:	s_playermodel.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3832+44
CNSTU4 260
ASGNU4
line 648
;648:	s_playermodel.left.generic.callback		= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3832+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 649
;649:	s_playermodel.left.generic.id			= ID_PREVPAGE;
ADDRGP4 s_playermodel+3832+8
CNSTI4 100
ASGNI4
line 650
;650:	s_playermodel.left.generic.x			= 125;
ADDRGP4 s_playermodel+3832+12
CNSTI4 125
ASGNI4
line 651
;651:	s_playermodel.left.generic.y			= 340;
ADDRGP4 s_playermodel+3832+16
CNSTI4 340
ASGNI4
line 652
;652:	s_playermodel.left.width  				= 64;
ADDRGP4 s_playermodel+3832+76
CNSTI4 64
ASGNI4
line 653
;653:	s_playermodel.left.height  				= 32;
ADDRGP4 s_playermodel+3832+80
CNSTI4 32
ASGNI4
line 654
;654:	s_playermodel.left.focuspic				= MODEL_ARROWSL;
ADDRGP4 s_playermodel+3832+60
ADDRGP4 $87
ASGNP4
line 656
;655:
;656:	s_playermodel.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3920
CNSTI4 6
ASGNI4
line 657
;657:	s_playermodel.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3920+44
CNSTU4 260
ASGNU4
line 658
;658:	s_playermodel.right.generic.callback	= PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3920+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 659
;659:	s_playermodel.right.generic.id			= ID_NEXTPAGE;
ADDRGP4 s_playermodel+3920+8
CNSTI4 101
ASGNI4
line 660
;660:	s_playermodel.right.generic.x			= 125+61;
ADDRGP4 s_playermodel+3920+12
CNSTI4 186
ASGNI4
line 661
;661:	s_playermodel.right.generic.y			= 340;
ADDRGP4 s_playermodel+3920+16
CNSTI4 340
ASGNI4
line 662
;662:	s_playermodel.right.width  				= 64;
ADDRGP4 s_playermodel+3920+76
CNSTI4 64
ASGNI4
line 663
;663:	s_playermodel.right.height  		    = 32;
ADDRGP4 s_playermodel+3920+80
CNSTI4 32
ASGNI4
line 664
;664:	s_playermodel.right.focuspic			= MODEL_ARROWSR;
ADDRGP4 s_playermodel+3920+60
ADDRGP4 $88
ASGNP4
line 666
;665:
;666:	s_playermodel.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3568
CNSTI4 6
ASGNI4
line 667
;667:	s_playermodel.back.generic.name     = MODEL_BACK0;
ADDRGP4 s_playermodel+3568+4
ADDRGP4 $79
ASGNP4
line 668
;668:	s_playermodel.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3568+44
CNSTU4 260
ASGNU4
line 669
;669:	s_playermodel.back.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3568+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 670
;670:	s_playermodel.back.generic.id	    = ID_BACK;
ADDRGP4 s_playermodel+3568+8
CNSTI4 102
ASGNI4
line 671
;671:	s_playermodel.back.generic.x		= 0;
ADDRGP4 s_playermodel+3568+12
CNSTI4 0
ASGNI4
line 672
;672:	s_playermodel.back.generic.y		= 480-64;
ADDRGP4 s_playermodel+3568+16
CNSTI4 416
ASGNI4
line 673
;673:	s_playermodel.back.width  		    = 128;
ADDRGP4 s_playermodel+3568+76
CNSTI4 128
ASGNI4
line 674
;674:	s_playermodel.back.height  		    = 64;
ADDRGP4 s_playermodel+3568+80
CNSTI4 64
ASGNI4
line 675
;675:	s_playermodel.back.focuspic         = MODEL_BACK1;
ADDRGP4 s_playermodel+3568+60
ADDRGP4 $80
ASGNP4
line 677
;676:
;677:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.banner );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3496
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 678
;678:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framel );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 679
;679:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.framer );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 680
;680:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.ports );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 681
;681:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.playername );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 682
;682:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.modelname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4008
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 683
;683:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.skinname );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4080
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 685
;684:
;685:	for (i=0; i<MAX_MODELSPERPAGE; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $566
line 686
;686:	{
line 687
;687:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.pics[i] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 s_playermodel+416
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 688
;688:		Menu_AddItem( &s_playermodel.menu,	&s_playermodel.picbuttons[i] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 s_playermodel+1824
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 689
;689:	}
LABELV $567
line 685
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $566
line 691
;690:
;691:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.player );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 692
;692:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.arrows );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 693
;693:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.left );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3832
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 694
;694:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.right );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3920
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 695
;695:	Menu_AddItem( &s_playermodel.menu,	&s_playermodel.back );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3568
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 701
;696:
;697:	// find all available models
;698://	PlayerModel_BuildList();
;699:
;700:	// set initial states
;701:	PlayerModel_SetMenuItems();
ADDRGP4 PlayerModel_SetMenuItems
CALLV
pop
line 704
;702:
;703:	// update user interface
;704:	PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 705
;705:	PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 706
;706:}
LABELV $333
endproc PlayerModel_MenuInit 28 12
export PlayerModel_Cache
proc PlayerModel_Cache 4 4
line 714
;707:
;708:/*
;709:=================
;710:PlayerModel_Cache
;711:=================
;712:*/
;713:void PlayerModel_Cache( void )
;714:{
line 717
;715:	int	i;
;716:
;717:	for( i = 0; playermodel_artlist[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $581
JUMPV
LABELV $578
line 718
;718:		trap_R_RegisterShaderNoMip( playermodel_artlist[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 719
;719:	}
LABELV $579
line 717
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $581
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $578
line 721
;720:
;721:	PlayerModel_BuildList();
ADDRGP4 PlayerModel_BuildList
CALLV
pop
line 722
;722:	for( i = 0; i < s_playermodel.nummodels; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $582
line 723
;723:		trap_R_RegisterShaderNoMip( s_playermodel.modelnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5336
ADDP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 724
;724:	}
LABELV $583
line 722
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $585
ADDRLP4 0
INDIRI4
ADDRGP4 s_playermodel+5332
INDIRI4
LTI4 $582
line 725
;725:}
LABELV $577
endproc PlayerModel_Cache 4 4
export UI_PlayerModelMenu
proc UI_PlayerModelMenu 0 8
line 728
;726:
;727:void UI_PlayerModelMenu(void)
;728:{
line 729
;729:	PlayerModel_MenuInit();
ADDRGP4 PlayerModel_MenuInit
CALLV
pop
line 731
;730:
;731:	UI_PushMenu( &s_playermodel.menu );
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 733
;732:
;733:	Menu_SetCursorToItem( &s_playermodel.menu, &s_playermodel.pics[s_playermodel.selectedmodel % MAX_MODELSPERPAGE] );
ADDRGP4 s_playermodel
ARGP4
CNSTI4 88
ADDRGP4 s_playermodel+38176
INDIRI4
CNSTI4 16
MODI4
MULI4
ADDRGP4 s_playermodel+416
ADDP4
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 734
;734:}
LABELV $588
endproc UI_PlayerModelMenu 0 8
bss
align 4
LABELV s_playermodel
skip 38180
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
LABELV $347
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $307
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $297
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $287
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $284
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $272
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $269
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $268
byte 1 46
byte 1 0
align 1
LABELV $258
byte 1 47
byte 1 0
align 1
LABELV $257
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $250
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 77
byte 1 69
byte 1 77
byte 1 79
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $227
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $226
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $159
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $157
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $155
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $88
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $87
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $86
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $85
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $84
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
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $83
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
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 108
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
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
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
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
