export Com_Error
code
proc Com_Error 1032 16
file "../../../code/q3_ui/ui_atoms.c"
line 33
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
;23:/**********************************************************************
;24:	UI_ATOMS.C
;25:
;26:	User interface building blocks and support functions.
;27:**********************************************************************/
;28:#include "ui_local.h"
;29:
;30:uiStatic_t		uis;
;31:qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound
;32:
;33:void QDECL Com_Error( int level, const char *error, ... ) {
line 37
;34:	va_list		argptr;
;35:	char		text[1024];
;36:
;37:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 38
;38:	Q_vsnprintf (text, sizeof(text), error, argptr);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 39
;39:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 41
;40:
;41:	trap_Error( va("%s", text) );
ADDRGP4 $81
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 42
;42:}
LABELV $79
endproc Com_Error 1032 16
export Com_Printf
proc Com_Printf 1032 16
line 44
;43:
;44:void QDECL Com_Printf( const char *msg, ... ) {
line 48
;45:	va_list		argptr;
;46:	char		text[1024];
;47:
;48:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 49
;49:	Q_vsnprintf (text, sizeof(text), msg, argptr);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 50
;50:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 52
;51:
;52:	trap_Print( va("%s", text) );
ADDRGP4 $81
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 53
;53:}
LABELV $82
endproc Com_Printf 1032 16
export UI_ClampCvar
proc UI_ClampCvar 0 0
line 61
;54:
;55:/*
;56:=================
;57:UI_ClampCvar
;58:=================
;59:*/
;60:float UI_ClampCvar( float min, float max, float value )
;61:{
line 62
;62:	if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $85
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $84
JUMPV
LABELV $85
line 63
;63:	if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $87
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $84
JUMPV
LABELV $87
line 64
;64:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $84
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 72
;65:}
;66:
;67:/*
;68:=================
;69:UI_StartDemoLoop
;70:=================
;71:*/
;72:void UI_StartDemoLoop( void ) {
line 73
;73:	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 74
;74:}
LABELV $89
endproc UI_StartDemoLoop 0 8
export UI_PushMenu
proc UI_PushMenu 16 8
line 82
;75:
;76:/*
;77:=================
;78:UI_PushMenu
;79:=================
;80:*/
;81:void UI_PushMenu( menuframework_s *menu )
;82:{
line 87
;83:	int				i;
;84:	menucommon_s*	item;
;85:
;86:	// avoid stacking menus invoked by hotkeys
;87:	for (i=0 ; i<uis.menusp ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 88
;88:	{
line 89
;89:		if (uis.stack[i] == menu)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $97
line 90
;90:		{
line 91
;91:			uis.menusp = i;
ADDRGP4 uis+16
ADDRLP4 0
INDIRI4
ASGNI4
line 92
;92:			break;
ADDRGP4 $94
JUMPV
LABELV $97
line 94
;93:		}
;94:	}
LABELV $93
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
LTI4 $92
LABELV $94
line 96
;95:
;96:	if (i == uis.menusp)
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
NEI4 $101
line 97
;97:	{
line 98
;98:		if (uis.menusp >= MAX_MENUDEPTH)
ADDRGP4 uis+16
INDIRI4
CNSTI4 8
LTI4 $104
line 99
;99:			trap_Error("UI_PushMenu: menu stack overflow");
ADDRGP4 $107
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $104
line 101
;100:
;101:		uis.stack[uis.menusp++] = menu;
ADDRLP4 12
ADDRGP4 uis+16
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 102
;102:	}
LABELV $101
line 104
;103:
;104:	uis.activemenu = menu;
ADDRGP4 uis+20
ADDRFP4 0
INDIRP4
ASGNP4
line 107
;105:
;106:	// default cursor position
;107:	menu->cursor      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 108
;108:	menu->cursor_prev = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 110
;109:
;110:	m_entersound = qtrue;
ADDRGP4 m_entersound
CNSTI4 1
ASGNI4
line 112
;111:
;112:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 115
;113:
;114:	// force first available item to have focus
;115:	for (i=0; i<menu->nitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 116
;116:	{
line 117
;117:		item = (menucommon_s *)menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 118
;118:		if (!(item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE)))
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $115
line 119
;119:		{
line 120
;120:			menu->cursor_prev = -1;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 121
;121:			Menu_SetCursor( menu, i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 122
;122:			break;
ADDRGP4 $113
JUMPV
LABELV $115
line 124
;123:		}
;124:	}
LABELV $112
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $111
LABELV $113
line 126
;125:
;126:	uis.firstdraw = qtrue;
ADDRGP4 uis+11448
CNSTI4 1
ASGNI4
line 127
;127:}
LABELV $91
endproc UI_PushMenu 16 8
export UI_PopMenu
proc UI_PopMenu 4 8
line 135
;128:
;129:/*
;130:=================
;131:UI_PopMenu
;132:=================
;133:*/
;134:void UI_PopMenu (void)
;135:{
line 136
;136:	trap_S_StartLocalSound( menu_out_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_out_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 138
;137:
;138:	uis.menusp--;
ADDRLP4 0
ADDRGP4 uis+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 140
;139:
;140:	if (uis.menusp < 0)
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
GEI4 $120
line 141
;141:		trap_Error ("UI_PopMenu: menu stack underflow");
ADDRGP4 $123
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $120
line 143
;142:
;143:	if (uis.menusp) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
EQI4 $124
line 144
;144:		uis.activemenu = uis.stack[uis.menusp-1];
ADDRGP4 uis+20
ADDRGP4 uis+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24-4
ADDP4
INDIRP4
ASGNP4
line 145
;145:		uis.firstdraw = qtrue;
ADDRGP4 uis+11448
CNSTI4 1
ASGNI4
line 146
;146:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 147
;147:	else {
line 148
;148:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 149
;149:	}
LABELV $125
line 150
;150:}
LABELV $118
endproc UI_PopMenu 4 8
export UI_ForceMenuOff
proc UI_ForceMenuOff 4 8
line 153
;151:
;152:void UI_ForceMenuOff (void)
;153:{
line 154
;154:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 155
;155:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 157
;156:
;157:	trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 158
;158:	trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 159
;159:	trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $135
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 160
;160:	trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 161
;161:}
LABELV $132
endproc UI_ForceMenuOff 4 8
export UI_LerpColor
proc UI_LerpColor 12 0
line 169
;162:
;163:/*
;164:=================
;165:UI_LerpColor
;166:=================
;167:*/
;168:void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;169:{
line 173
;170:	int i;
;171:
;172:	// lerp and clamp each component
;173:	for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $139
line 174
;174:	{
line 175
;175:		c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 176
;176:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $143
line 177
;177:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $144
JUMPV
LABELV $143
line 178
;178:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $145
line 179
;179:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $145
LABELV $144
line 180
;180:	}
LABELV $140
line 173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $139
line 181
;181:}
LABELV $138
endproc UI_LerpColor 12 0
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 342
;182:
;183:/*
;184:=================
;185:UI_DrawProportionalString2
;186:=================
;187:*/
;188:static int	propMap[128][3] = {
;189:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;190:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;191:
;192:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;193:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;194:
;195:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;196:{11, 122, 7},	// !
;197:{154, 181, 14},	// "
;198:{55, 122, 17},	// #
;199:{79, 122, 18},	// $
;200:{101, 122, 23},	// %
;201:{153, 122, 18},	// &
;202:{9, 93, 7},		// '
;203:{207, 122, 8},	// (
;204:{230, 122, 9},	// )
;205:{177, 122, 18},	// *
;206:{30, 152, 18},	// +
;207:{85, 181, 7},	// ,
;208:{34, 93, 11},	// -
;209:{110, 181, 6},	// .
;210:{130, 152, 14},	// /
;211:
;212:{22, 64, 17},	// 0
;213:{41, 64, 12},	// 1
;214:{58, 64, 17},	// 2
;215:{78, 64, 18},	// 3
;216:{98, 64, 19},	// 4
;217:{120, 64, 18},	// 5
;218:{141, 64, 18},	// 6
;219:{204, 64, 16},	// 7
;220:{162, 64, 17},	// 8
;221:{182, 64, 18},	// 9
;222:{59, 181, 7},	// :
;223:{35,181, 7},	// ;
;224:{203, 152, 14},	// <
;225:{56, 93, 14},	// =
;226:{228, 152, 14},	// >
;227:{177, 181, 18},	// ?
;228:
;229:{28, 122, 22},	// @
;230:{5, 4, 18},		// A
;231:{27, 4, 18},	// B
;232:{48, 4, 18},	// C
;233:{69, 4, 17},	// D
;234:{90, 4, 13},	// E
;235:{106, 4, 13},	// F
;236:{121, 4, 18},	// G
;237:{143, 4, 17},	// H
;238:{164, 4, 8},	// I
;239:{175, 4, 16},	// J
;240:{195, 4, 18},	// K
;241:{216, 4, 12},	// L
;242:{230, 4, 23},	// M
;243:{6, 34, 18},	// N
;244:{27, 34, 18},	// O
;245:
;246:{48, 34, 18},	// P
;247:{68, 34, 18},	// Q
;248:{90, 34, 17},	// R
;249:{110, 34, 18},	// S
;250:{130, 34, 14},	// T
;251:{146, 34, 18},	// U
;252:{166, 34, 19},	// V
;253:{185, 34, 29},	// W
;254:{215, 34, 18},	// X
;255:{234, 34, 18},	// Y
;256:{5, 64, 14},	// Z
;257:{60, 152, 7},	// [
;258:{106, 151, 13},	// '\'
;259:{83, 152, 7},	// ]
;260:{128, 122, 17},	// ^
;261:{4, 152, 21},	// _
;262:
;263:{134, 181, 5},	// '
;264:{5, 4, 18},		// A
;265:{27, 4, 18},	// B
;266:{48, 4, 18},	// C
;267:{69, 4, 17},	// D
;268:{90, 4, 13},	// E
;269:{106, 4, 13},	// F
;270:{121, 4, 18},	// G
;271:{143, 4, 17},	// H
;272:{164, 4, 8},	// I
;273:{175, 4, 16},	// J
;274:{195, 4, 18},	// K
;275:{216, 4, 12},	// L
;276:{230, 4, 23},	// M
;277:{6, 34, 18},	// N
;278:{27, 34, 18},	// O
;279:
;280:{48, 34, 18},	// P
;281:{68, 34, 18},	// Q
;282:{90, 34, 17},	// R
;283:{110, 34, 18},	// S
;284:{130, 34, 14},	// T
;285:{146, 34, 18},	// U
;286:{166, 34, 19},	// V
;287:{185, 34, 29},	// W
;288:{215, 34, 18},	// X
;289:{234, 34, 18},	// Y
;290:{5, 64, 14},	// Z
;291:{153, 152, 13},	// {
;292:{11, 181, 5},	// |
;293:{180, 152, 13},	// }
;294:{79, 93, 17},	// ~
;295:{0, 0, -1}		// DEL
;296:};
;297:
;298:static int propMapB[26][3] = {
;299:{11, 12, 33},
;300:{49, 12, 31},
;301:{85, 12, 31},
;302:{120, 12, 30},
;303:{156, 12, 21},
;304:{183, 12, 21},
;305:{207, 12, 32},
;306:
;307:{13, 55, 30},
;308:{49, 55, 13},
;309:{66, 55, 29},
;310:{101, 55, 31},
;311:{135, 55, 21},
;312:{158, 55, 40},
;313:{204, 55, 32},
;314:
;315:{12, 97, 31},
;316:{48, 97, 31},
;317:{82, 97, 30},
;318:{118, 97, 30},
;319:{153, 97, 30},
;320:{185, 97, 25},
;321:{213, 97, 30},
;322:
;323:{11, 139, 32},
;324:{42, 139, 51},
;325:{93, 139, 32},
;326:{126, 139, 31},
;327:{158, 139, 25},
;328:};
;329:
;330:#define PROPB_GAP_WIDTH		4
;331:#define PROPB_SPACE_WIDTH	12
;332:#define PROPB_HEIGHT		36
;333:
;334:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;335:// bk001205 - FIXME: does this belong in ui_shared.c?
;336:/*
;337:=================
;338:UI_DrawBannerString
;339:=================
;340:*/
;341:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;342:{
line 355
;343:	const char* s;
;344:	unsigned char	ch; // bk001204 - unsigned
;345:	float	ax;
;346:	float	ay;
;347:	float	aw;
;348:	float	ah;
;349:	float	frow;
;350:	float	fcol;
;351:	float	fwidth;
;352:	float	fheight;
;353:
;354:	// draw the colored text
;355:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 357
;356:	
;357:	ax = x * uis.xscale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 358
;358:	ay = y * uis.yscale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 360
;359:
;360:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $151
line 362
;361:	while ( *s )
;362:	{
line 363
;363:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 364
;364:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $154
line 365
;365:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* uis.xscale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1098907648
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDF4
ASGNF4
line 366
;366:		}
ADDRGP4 $155
JUMPV
LABELV $154
line 367
;367:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $157
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $157
line 368
;368:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 369
;369:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 370
;370:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 371
;371:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 372
;372:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 373
;373:			aw = (float)propMapB[ch][2] * uis.xscale;
ADDRLP4 12
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 374
;374:			ah = (float)PROPB_HEIGHT * uis.yscale;
ADDRLP4 24
CNSTF4 1108344832
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 375
;375:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, uis.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 376
;376:			ax += (aw + (float)PROPB_GAP_WIDTH * uis.xscale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 377
;377:		}
LABELV $157
LABELV $155
line 378
;378:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 379
;379:	}
LABELV $152
line 361
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $151
line 381
;380:
;381:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 382
;382:}
LABELV $147
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 384
;383:
;384:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 391
;385:	const char *	s;
;386:	int				ch;
;387:	int				width;
;388:	vec4_t			drawcolor;
;389:
;390:	// find the width of the drawn text
;391:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 392
;392:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
line 393
;393:	while ( *s ) {
line 394
;394:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 395
;395:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $170
line 396
;396:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 397
;397:		}
ADDRGP4 $171
JUMPV
LABELV $170
line 398
;398:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $172
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $172
line 399
;399:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 400
;400:		}
LABELV $172
LABELV $171
line 401
;401:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 402
;402:	}
LABELV $168
line 393
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $167
line 403
;403:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 405
;404:
;405:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $177
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $179
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $180
ADDRGP4 $177
JUMPV
LABELV $179
line 407
;406:		case UI_CENTER:
;407:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 408
;408:			break;
ADDRGP4 $177
JUMPV
LABELV $180
line 411
;409:
;410:		case UI_RIGHT:
;411:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 412
;412:			break;
line 416
;413:
;414:		case UI_LEFT:
;415:		default:
;416:			break;
LABELV $177
line 419
;417:	}
;418:
;419:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $182
line 420
;420:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 421
;421:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 422
;422:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 423
;423:	}
LABELV $182
line 425
;424:
;425:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 426
;426:}
LABELV $166
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 429
;427:
;428:
;429:int UI_ProportionalStringWidth( const char* str ) {
line 435
;430:	const char *	s;
;431:	int				ch;
;432:	int				charWidth;
;433:	int				width;
;434:
;435:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 436
;436:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $189
JUMPV
LABELV $188
line 437
;437:	while ( *s ) {
line 438
;438:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 439
;439:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 440
;440:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $192
line 441
;441:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 442
;442:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 443
;443:		}
LABELV $192
line 444
;444:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 445
;445:	}
LABELV $189
line 437
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
line 447
;446:
;447:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 448
;448:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $187
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 452
;449:}
;450:
;451:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;452:{
line 457
;453:	const char* s;
;454:	unsigned char	ch; // bk001204 - unsigned
;455:	float	ax;
;456:	float	ay;
;457:	float	aw = 0; // bk001204 - init
ADDRLP4 8
CNSTF4 0
ASGNF4
line 465
;458:	float	ah;
;459:	float	frow;
;460:	float	fcol;
;461:	float	fwidth;
;462:	float	fheight;
;463:
;464:	// draw the colored text
;465:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 467
;466:	
;467:	ax = x * uis.xscale + uis.bias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 468
;468:	ay = y * uis.yscale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 470
;469:
;470:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $199
JUMPV
LABELV $198
line 472
;471:	while ( *s )
;472:	{
line 473
;473:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 474
;474:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $201
line 475
;475:			aw = (float)PROP_SPACE_WIDTH * uis.xscale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 476
;476:		}
ADDRGP4 $202
JUMPV
LABELV $201
line 477
;477:		else if ( propMap[ch][2] != -1 ) {
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $204
line 478
;478:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 479
;479:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 480
;480:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 481
;481:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 482
;482:			aw = (float)propMap[ch][2] * uis.xscale * sizeScale;
ADDRLP4 8
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 483
;483:			ah = (float)PROP_HEIGHT * uis.yscale * sizeScale;
ADDRLP4 24
CNSTF4 1104674816
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 484
;484:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 485
;485:		}
LABELV $204
LABELV $202
line 487
;486:
;487:		ax += (aw + (float)PROP_GAP_WIDTH * uis.xscale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 488
;488:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 489
;489:	}
LABELV $199
line 471
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $198
line 491
;490:
;491:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 492
;492:}
LABELV $194
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 499
;493:
;494:/*
;495:=================
;496:UI_ProportionalSizeScale
;497:=================
;498:*/
;499:float UI_ProportionalSizeScale( int style ) {
line 500
;500:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $214
line 501
;501:		return PROP_SMALL_SIZE_SCALE;
CNSTF4 1061158912
RETF4
ADDRGP4 $213
JUMPV
LABELV $214
line 504
;502:	}
;503:
;504:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $213
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 513
;505:}
;506:
;507:
;508:/*
;509:=================
;510:UI_DrawProportionalString
;511:=================
;512:*/
;513:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 518
;514:	vec4_t	drawcolor;
;515:	int		width;
;516:	float	sizeScale;
;517:
;518:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 520
;519:
;520:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $218
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $220
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $221
ADDRGP4 $218
JUMPV
LABELV $220
line 522
;521:		case UI_CENTER:
;522:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 523
;523:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 524
;524:			break;
ADDRGP4 $218
JUMPV
LABELV $221
line 527
;525:
;526:		case UI_RIGHT:
;527:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 528
;528:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 529
;529:			break;
line 533
;530:
;531:		case UI_LEFT:
;532:		default:
;533:			break;
LABELV $218
line 536
;534:	}
;535:
;536:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $223
line 537
;537:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 538
;538:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 539
;539:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 540
;540:	}
LABELV $223
line 542
;541:
;542:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $229
line 543
;543:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 544
;544:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 545
;545:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 546
;546:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 547
;547:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 548
;548:		return;
ADDRGP4 $216
JUMPV
LABELV $229
line 551
;549:	}
;550:
;551:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $235
line 552
;552:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 553
;553:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 554
;554:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 555
;555:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 556
;556:		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 558
;557:
;558:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 559
;559:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 560
;560:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 561
;561:		drawcolor[3] = 0.5 + 0.5 * sin( uis.realtime / PULSE_DIVISOR );
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 562
;562:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 563
;563:		return;
ADDRGP4 $216
JUMPV
LABELV $235
line 566
;564:	}
;565:
;566:	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 567
;567:}
LABELV $216
endproc UI_DrawProportionalString 44 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 574
;568:
;569:/*
;570:=================
;571:UI_DrawProportionalString_Wrapped
;572:=================
;573:*/
;574:void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
line 581
;575:	int width;
;576:	char *s1,*s2,*s3;
;577:	char c_bcp;
;578:	char buf[1024];
;579:	float   sizeScale;
;580:
;581:	if (!str || str[0]=='\0')
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
LABELV $250
line 582
;582:		return;
ADDRGP4 $247
JUMPV
LABELV $248
line 584
;583:	
;584:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1052
INDIRF4
ASGNF4
line 586
;585:	
;586:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 587
;587:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 24
ASGNP4
ADDRLP4 4
ADDRLP4 24
ASGNP4
ADDRLP4 12
ADDRLP4 24
ASGNP4
ADDRGP4 $252
JUMPV
LABELV $251
line 589
;588:
;589:	while (1) {
LABELV $254
line 590
;590:		do {
line 591
;591:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 592
;592:		} while (*s3!=' ' && *s3!='\0');
LABELV $255
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $257
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $254
LABELV $257
line 593
;593:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 594
;594:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 595
;595:		width = UI_ProportionalStringWidth(s1) * sizeScale;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 596
;596:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 597
;597:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $258
line 598
;598:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $260
line 599
;599:			{
line 601
;600:				// fuck, don't have a clean cut, we'll overflow
;601:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 602
;602:			}
LABELV $260
line 603
;603:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 604
;604:			UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 605
;605:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 606
;606:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $262
line 607
;607:      {
line 612
;608:        // that was the last word
;609:        // we could start a new loop, but that wouldn't be much use
;610:        // even if the word is too long, we would overflow it (see above)
;611:        // so just print it now if needed
;612:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 613
;613:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $253
line 614
;614:          UI_DrawProportionalString(x, y, s2, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 615
;615:				break; 
ADDRGP4 $253
JUMPV
LABELV $262
line 617
;616:      }
;617:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 618
;618:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 619
;619:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 620
;620:		}
ADDRGP4 $259
JUMPV
LABELV $258
line 622
;621:		else
;622:		{
line 623
;623:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 624
;624:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $266
line 625
;625:			{
line 626
;626:				UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 627
;627:				break;
ADDRGP4 $253
JUMPV
LABELV $266
line 629
;628:			}
;629:		}
LABELV $259
line 630
;630:	}
LABELV $252
line 589
ADDRGP4 $251
JUMPV
LABELV $253
line 631
;631:}
LABELV $247
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 72 36
line 639
;632:
;633:/*
;634:=================
;635:UI_DrawString2
;636:=================
;637:*/
;638:static void UI_DrawString2( int x, int y, const char* str, vec4_t color, int charw, int charh )
;639:{
line 642
;640:	const char* s;
;641:	char	ch;
;642:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 651
;643:	vec4_t	tempcolor;
;644:	float	ax;
;645:	float	ay;
;646:	float	aw;
;647:	float	ah;
;648:	float	frow;
;649:	float	fcol;
;650:
;651:	if (y < -charh)
ADDRFP4 4
INDIRI4
ADDRFP4 20
INDIRI4
NEGI4
GEI4 $269
line 653
;652:		// offscreen
;653:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 656
;654:
;655:	// draw the colored text
;656:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 658
;657:	
;658:	ax = x * uis.xscale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 659
;659:	ay = y * uis.yscale;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 660
;660:	aw = charw * uis.xscale;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 661
;661:	ah = charh * uis.yscale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 663
;662:
;663:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $277
JUMPV
LABELV $276
line 665
;664:	while ( *s )
;665:	{
line 666
;666:		if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $279
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $279
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $279
ADDRLP4 56
INDIRI4
CNSTI4 48
LTI4 $279
ADDRLP4 56
INDIRI4
CNSTI4 56
GTI4 $279
line 667
;667:		{
line 668
;668:			if ( !forceColor )
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $281
line 669
;669:			{
line 670
;670:				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 671
;671:				tempcolor[3] = color[3];
ADDRLP4 24+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 672
;672:				trap_R_SetColor( tempcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 673
;673:			}
LABELV $281
line 674
;674:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 675
;675:			continue;
ADDRGP4 $277
JUMPV
LABELV $279
line 678
;676:		}
;677:
;678:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 679
;679:		if (ch != ' ')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $285
line 680
;680:		{
line 681
;681:			frow = (ch>>4)*0.0625;
ADDRLP4 16
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 682
;682:			fcol = (ch&15)*0.0625;
ADDRLP4 20
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 683
;683:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1031798784
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 684
;684:		}
LABELV $285
line 686
;685:
;686:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 687
;687:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 688
;688:	}
LABELV $277
line 664
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $276
line 690
;689:
;690:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 691
;691:}
LABELV $268
endproc UI_DrawString2 72 36
export UI_DrawString
proc UI_DrawString 84 24
line 699
;692:
;693:/*
;694:=================
;695:UI_DrawString
;696:=================
;697:*/
;698:void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
;699:{
line 708
;700:	int		len;
;701:	int		charw;
;702:	int		charh;
;703:	vec4_t	newcolor;
;704:	vec4_t	lowlight;
;705:	float	*drawcolor;
;706:	vec4_t	dropcolor;
;707:
;708:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $289
line 709
;709:		return;
ADDRGP4 $288
JUMPV
LABELV $289
line 712
;710:	}
;711:
;712:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $291
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $291
line 713
;713:		return;
ADDRGP4 $288
JUMPV
LABELV $291
line 715
;714:
;715:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $294
line 716
;716:	{
line 717
;717:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 718
;718:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 719
;719:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 720
;720:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $296
line 721
;721:	{
line 722
;722:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 723
;723:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 48
ASGNI4
line 724
;724:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 726
;725:	else
;726:	{
line 727
;727:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 728
;728:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 729
;729:	}
LABELV $297
LABELV $295
line 731
;730:
;731:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $298
line 732
;732:	{
line 733
;733:		lowlight[0] = 0.8*color[0]; 
ADDRLP4 8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 734
;734:		lowlight[1] = 0.8*color[1];
ADDRLP4 8+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 735
;735:		lowlight[2] = 0.8*color[2];
ADDRLP4 8+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 736
;736:		lowlight[3] = 0.8*color[3];
ADDRLP4 8+12
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 737
;737:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 738
;738:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 739
;739:	}	
ADDRGP4 $299
JUMPV
LABELV $298
line 741
;740:	else
;741:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $299
line 743
;742:
;743:	switch (style & UI_FORMATMASK)
ADDRLP4 68
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $307
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $308
ADDRGP4 $305
JUMPV
line 744
;744:	{
LABELV $307
line 747
;745:		case UI_CENTER:
;746:			// center justify at x
;747:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 748
;748:			x   = x - len*charw/2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 749
;749:			break;
ADDRGP4 $305
JUMPV
LABELV $308
line 753
;750:
;751:		case UI_RIGHT:
;752:			// right justify at x
;753:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 80
INDIRI4
ASGNI4
line 754
;754:			x   = x - len*charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 755
;755:			break;
line 759
;756:
;757:		default:
;758:			// left justify at x
;759:			break;
LABELV $305
line 762
;760:	}
;761:
;762:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $309
line 763
;763:	{
line 764
;764:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
line 765
;765:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 766
;766:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
ADDRLP4 80
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 767
;767:	}
LABELV $309
line 769
;768:
;769:	UI_DrawString2(x,y,str,drawcolor,charw,charh);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 770
;770:}
LABELV $288
endproc UI_DrawString 84 24
export UI_DrawChar
proc UI_DrawChar 2 20
line 778
;771:
;772:/*
;773:=================
;774:UI_DrawChar
;775:=================
;776:*/
;777:void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
;778:{
line 781
;779:	char	buff[2];
;780:
;781:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 782
;782:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 784
;783:
;784:	UI_DrawString( x, y, buff, style, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 785
;785:}
LABELV $314
endproc UI_DrawChar 2 20
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 787
;786:
;787:qboolean UI_IsFullscreen( void ) {
line 788
;788:	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $317
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $317
line 789
;789:		return uis.activemenu->fullscreen;
ADDRGP4 uis+20
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
RETI4
ADDRGP4 $316
JUMPV
LABELV $317
line 792
;790:	}
;791:
;792:	return qfalse;
CNSTI4 0
RETI4
LABELV $316
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 795
;793:}
;794:
;795:static void NeedCDAction( qboolean result ) {
line 796
;796:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $322
line 797
;797:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 798
;798:	}
LABELV $322
line 799
;799:}
LABELV $321
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 801
;800:
;801:static void NeedCDKeyAction( qboolean result ) {
line 802
;802:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $326
line 803
;803:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 804
;804:	}
LABELV $326
line 805
;805:}
LABELV $325
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 8 12
line 807
;806:
;807:void UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 810
;808:	// this should be the ONLY way the menu system is brought up
;809:	// enusure minumum menu data is cached
;810:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 812
;811:
;812:	switch ( menu ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $329
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $329
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $342
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $342
address $332
address $333
address $338
address $334
address $336
address $340
address $340
code
LABELV $332
line 814
;813:	case UIMENU_NONE:
;814:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 815
;815:		trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 816
;816:		return;
ADDRGP4 $328
JUMPV
LABELV $333
line 818
;817:	case UIMENU_MAIN:
;818:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 819
;819:		trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 820
;820:		return;
ADDRGP4 $328
JUMPV
LABELV $334
line 822
;821:	case UIMENU_NEED_CD:
;822:		UI_ConfirmMenu( "Insert the CD", 0, NeedCDAction );
ADDRGP4 $335
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 823
;823:		trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 824
;824:		return;
ADDRGP4 $328
JUMPV
LABELV $336
line 826
;825:	case UIMENU_BAD_CD_KEY:
;826:		UI_ConfirmMenu( "Bad CD Key", 0, NeedCDKeyAction );
ADDRGP4 $337
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 827
;827:		trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 828
;828:		return;
ADDRGP4 $328
JUMPV
LABELV $338
line 835
;829:	case UIMENU_INGAME:
;830:		/*
;831:		//GRank
;832:		UI_RankingsMenu();
;833:		return;
;834:		*/
;835:		trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $135
ARGP4
ADDRGP4 $339
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 836
;836:		trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 837
;837:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 838
;838:		return;
ADDRGP4 $328
JUMPV
LABELV $340
LABELV $329
line 845
;839:		
;840:	// bk001204
;841:	case UIMENU_TEAM:
;842:	case UIMENU_POSTGAME:
;843:	default:
;844:#ifndef NDEBUG
;845:	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
ADDRGP4 $341
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 847
;846:#endif
;847:	  break;
LABELV $330
line 849
;848:	}
;849:}
LABELV $328
endproc UI_SetActiveMenu 8 12
export UI_KeyEvent
proc UI_KeyEvent 16 8
line 859
;850:
;851:/*
;852:=================
;853:UI_KeyEvent
;854:=================
;855:*/
;856:
;857:
;858:
;859:void UI_KeyEvent( int key, int down ) {
line 862
;860:	sfxHandle_t		s;
;861:
;862:	if (!uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $344
line 863
;863:		return;
ADDRGP4 $343
JUMPV
LABELV $344
line 866
;864:	}
;865:
;866:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $347
line 867
;867:		return;
ADDRGP4 $343
JUMPV
LABELV $347
line 870
;868:	}
;869:
;870:	if (uis.activemenu->key)
ADDRGP4 uis+20
INDIRP4
CNSTI4 400
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $349
line 871
;871:		s = uis.activemenu->key( key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 uis+20
INDIRP4
CNSTI4 400
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 873
;872:	else
;873:		s = Menu_DefaultKey( uis.activemenu, key );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $350
line 875
;874:
;875:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $354
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $354
line 876
;876:		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $354
line 877
;877:}
LABELV $343
endproc UI_KeyEvent 16 8
data
export prevx
align 4
LABELV prevx
byte 4 0
export prevy
align 4
LABELV prevy
byte 4 0
export UI_MouseEvent
code
proc UI_MouseEvent 32 8
line 888
;878:
;879:/*
;880:=================
;881:UI_MouseEvent
;882:=================
;883: */
;884:int prevx = 0;
;885:int prevy = 0;
;886:
;887:void UI_MouseEvent( int x, int y )
;888:{
line 891
;889:		int				i;
;890:	menucommon_s*	m;
;891:	int dx = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 892
;892:	int dy = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 894
;893:	
;894:	dx = x - prevx;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRGP4 prevx
INDIRI4
SUBI4
ASGNI4
line 895
;895:	dy = y - prevy;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRGP4 prevy
INDIRI4
SUBI4
ASGNI4
line 897
;896:	
;897:	prevx = x;
ADDRGP4 prevx
ADDRFP4 0
INDIRI4
ASGNI4
line 898
;898:	prevy = y;
ADDRGP4 prevy
ADDRFP4 4
INDIRI4
ASGNI4
line 902
;899:	
;900:
;901:
;902:	if (!uis.activemenu)
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $357
line 903
;903:		return;
ADDRGP4 $356
JUMPV
LABELV $357
line 906
;904:
;905:	// update mouse screen position
;906:	uis.cursorx += dx;
ADDRLP4 16
ADDRGP4 uis+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 907
;907:	if (uis.cursorx < -uis.bias)
ADDRGP4 uis+8
INDIRI4
CVIF4 4
ADDRGP4 uis+11440
INDIRF4
NEGF4
GEF4 $361
line 908
;908:		uis.cursorx = -uis.bias;
ADDRGP4 uis+8
ADDRGP4 uis+11440
INDIRF4
NEGF4
CVFI4 4
ASGNI4
ADDRGP4 $362
JUMPV
LABELV $361
line 909
;909:	else if (uis.cursorx > SCREEN_WIDTH+uis.bias)
ADDRGP4 uis+8
INDIRI4
CVIF4 4
ADDRGP4 uis+11440
INDIRF4
CNSTF4 1142947840
ADDF4
LEF4 $367
line 910
;910:		uis.cursorx = SCREEN_WIDTH+uis.bias;
ADDRGP4 uis+8
ADDRGP4 uis+11440
INDIRF4
CNSTF4 1142947840
ADDF4
CVFI4 4
ASGNI4
LABELV $367
LABELV $362
line 912
;911:
;912:	uis.cursory += dy;
ADDRLP4 20
ADDRGP4 uis+12
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 913
;913:	if (uis.cursory < 0)
ADDRGP4 uis+12
INDIRI4
CNSTI4 0
GEI4 $374
line 914
;914:		uis.cursory = 0;
ADDRGP4 uis+12
CNSTI4 0
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
line 915
;915:	else if (uis.cursory > SCREEN_HEIGHT)
ADDRGP4 uis+12
INDIRI4
CNSTI4 480
LEI4 $378
line 916
;916:		uis.cursory = SCREEN_HEIGHT;
ADDRGP4 uis+12
CNSTI4 480
ASGNI4
LABELV $378
LABELV $375
line 919
;917:
;918:	// region test the active menu items
;919:	for (i=0; i<uis.activemenu->nitems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $382
line 920
;920:	{
line 921
;921:		m = (menucommon_s*)uis.activemenu->items[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 923
;922:
;923:		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $388
line 924
;924:			continue;
ADDRGP4 $383
JUMPV
LABELV $388
line 926
;925:
;926:		if ((uis.cursorx < m->left) ||
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $398
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
GTI4 $398
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
LTI4 $398
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
LEI4 $390
LABELV $398
line 930
;927:			(uis.cursorx > m->right) ||
;928:			(uis.cursory < m->top) ||
;929:			(uis.cursory > m->bottom))
;930:		{
line 932
;931:			// cursor out of item bounds
;932:			continue;
ADDRGP4 $383
JUMPV
LABELV $390
line 936
;933:		}
;934:
;935:		// set focus to item at cursor
;936:		if (uis.activemenu->cursor != i)
ADDRGP4 uis+20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $399
line 937
;937:		{
line 938
;938:			Menu_SetCursor( uis.activemenu, i );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 939
;939:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 28
ADDRGP4 uis+20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 941
;940:
;941:			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $405
line 942
;942:				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 943
;943:			}
LABELV $405
line 944
;944:		}
LABELV $399
line 946
;945:
;946:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
ADDRLP4 28
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 512
BORU4
ASGNU4
line 947
;947:		return;
ADDRGP4 $356
JUMPV
LABELV $383
line 919
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $385
ADDRLP4 4
INDIRI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $382
line 950
;948:	}  
;949:
;950:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $411
line 952
;951:		// out of any region
;952:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 24
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 953
;953:	}
LABELV $411
line 954
;954:}
LABELV $356
endproc UI_MouseEvent 32 8
bss
align 1
LABELV $417
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 956
;955:
;956:char *UI_Argv( int arg ) {
line 959
;957:	static char	buffer[MAX_STRING_CHARS];
;958:
;959:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $417
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 961
;960:
;961:	return buffer;
ADDRGP4 $417
RETP4
LABELV $416
endproc UI_Argv 0 12
bss
align 1
LABELV $419
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 965
;962:}
;963:
;964:
;965:char *UI_Cvar_VariableString( const char *var_name ) {
line 968
;966:	static char	buffer[MAX_STRING_CHARS];
;967:
;968:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $419
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 970
;969:
;970:	return buffer;
ADDRGP4 $419
RETP4
LABELV $418
endproc UI_Cvar_VariableString 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 979
;971:}
;972:
;973:
;974:/*
;975:=================
;976:UI_Cache
;977:=================
;978:*/
;979:void UI_Cache_f( void ) {
line 980
;980:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 981
;981:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 982
;982:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 983
;983:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 984
;984:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 985
;985:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 986
;986:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 987
;987:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 988
;988:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 989
;989:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 990
;990:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 991
;991:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 992
;992:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 993
;993:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 994
;994:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 995
;995:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 996
;996:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 997
;997:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 998
;998:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 999
;999:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 1000
;1000:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 1001
;1001:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 1002
;1002:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 1003
;1003:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 1004
;1004:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 1005
;1005:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 1008
;1006://	UI_LoadConfig_Cache();
;1007://	UI_SaveConfigMenu_Cache();
;1008:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1009
;1009:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 1010
;1010:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 1012
;1011:
;1012:}
LABELV $420
endproc UI_Cache_f 0 0
export UI_ConsoleCommand
proc UI_ConsoleCommand 92 12
line 1020
;1013:
;1014:
;1015:/*
;1016:=================
;1017:UI_ConsoleCommand
;1018:=================
;1019:*/
;1020:qboolean UI_ConsoleCommand( int realTime ) {
line 1023
;1021:	char	*cmd;
;1022:
;1023:	uis.frametime = realTime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1024
;1024:	uis.realtime = realTime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1026
;1025:
;1026:	cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1029
;1027:
;1028:	// ensure minimum menu data is available
;1029:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1031
;1030:
;1031:	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $424
line 1032
;1032:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 1033
;1033:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $424
line 1036
;1034:	}
;1035:
;1036:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $427
line 1037
;1037:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 1038
;1038:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $427
line 1041
;1039:	}
;1040:
;1041:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $430
line 1042
;1042:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 1043
;1043:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $430
line 1046
;1044:	}
;1045:
;1046:	if ( Q_stricmp (cmd, "ui_cinematics") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $435
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $433
line 1047
;1047:		UI_CinematicsMenu_f();
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 1048
;1048:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $433
line 1051
;1049:	}
;1050:
;1051:	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $436
line 1052
;1052:		UI_TeamOrdersMenu_f();
ADDRGP4 UI_TeamOrdersMenu_f
CALLV
pop
line 1053
;1053:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $436
line 1056
;1054:	}
;1055:
;1056:	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $439
line 1057
;1057:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 1058
;1058:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $439
line 1061
;1059:	}
;1060:
;1061:	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $442
line 1062
;1062:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 1063
;1063:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $442
line 1066
;1064:	}
;1065:
;1066:	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $445
line 1067
;1067:		UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1068
;1068:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $445
line 1071
;1069:	}
;1070:
;1071:        if ( Q_stricmp (cmd, "ui_mappage") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $448
line 1072
;1072:		mappage.pagenumber = atoi(UI_Argv( 1 ));
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 mappage
ADDRLP4 48
INDIRI4
ASGNI4
line 1073
;1073:                Q_strncpyz(mappage.mapname[0],UI_Argv(2),32);
CNSTI4 2
ARGI4
ADDRLP4 52
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1074
;1074:                Q_strncpyz(mappage.mapname[1],UI_Argv(3),32);
CNSTI4 3
ARGI4
ADDRLP4 56
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+32
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1075
;1075:                Q_strncpyz(mappage.mapname[2],UI_Argv(4),32);
CNSTI4 4
ARGI4
ADDRLP4 60
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+64
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1076
;1076:                Q_strncpyz(mappage.mapname[3],UI_Argv(5),32);
CNSTI4 5
ARGI4
ADDRLP4 64
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+96
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1077
;1077:                Q_strncpyz(mappage.mapname[4],UI_Argv(6),32);
CNSTI4 6
ARGI4
ADDRLP4 68
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+128
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1078
;1078:                Q_strncpyz(mappage.mapname[5],UI_Argv(7),32);
CNSTI4 7
ARGI4
ADDRLP4 72
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+160
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1079
;1079:                Q_strncpyz(mappage.mapname[6],UI_Argv(8),32);
CNSTI4 8
ARGI4
ADDRLP4 76
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+192
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1080
;1080:                Q_strncpyz(mappage.mapname[7],UI_Argv(9),32);
CNSTI4 9
ARGI4
ADDRLP4 80
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+224
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1081
;1081:                Q_strncpyz(mappage.mapname[8],UI_Argv(10),32);
CNSTI4 10
ARGI4
ADDRLP4 84
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+256
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1082
;1082:                Q_strncpyz(mappage.mapname[9],UI_Argv(11),32);
CNSTI4 11
ARGI4
ADDRLP4 88
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 mappage+4+288
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1084
;1083:
;1084:                UI_VoteMapMenuInternal();
ADDRGP4 UI_VoteMapMenuInternal
CALLV
pop
line 1085
;1085:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $421
JUMPV
LABELV $448
line 1088
;1086:	}
;1087:
;1088:	return qfalse;
CNSTI4 0
RETI4
LABELV $421
endproc UI_ConsoleCommand 92 12
export UI_Shutdown
proc UI_Shutdown 0 0
line 1096
;1089:}
;1090:
;1091:/*
;1092:=================
;1093:UI_Shutdown
;1094:=================
;1095:*/
;1096:void UI_Shutdown( void ) {
line 1097
;1097:}
LABELV $470
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 0 8
line 1104
;1098:
;1099:/*
;1100:=================
;1101:UI_Init
;1102:=================
;1103:*/
;1104:void UI_Init( void ) {
line 1105
;1105:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 1107
;1106:
;1107:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 1110
;1108:
;1109:	// cache redundant calulations
;1110:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+56
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1113
;1111:
;1112:	// for 640x480 virtualized screen
;1113:	uis.xscale = uis.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uis+11432
CNSTF4 986500301
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1114
;1114:	uis.yscale = uis.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uis+11436
CNSTF4 990414985
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1115
;1115:	if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uis+56+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+56+11308
INDIRI4
MULI4
LEI4 $479
line 1117
;1116:		// wide screen
;1117:		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uis+11440
CNSTF4 1056964608
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 1118
;1118:		uis.xscale = uis.yscale;
ADDRGP4 uis+11432
ADDRGP4 uis+11436
INDIRF4
ASGNF4
line 1119
;1119:	}
ADDRGP4 $480
JUMPV
LABELV $479
line 1120
;1120:	else {
line 1122
;1121:		// no wide screen
;1122:		uis.bias = 0;
ADDRGP4 uis+11440
CNSTF4 0
ASGNF4
line 1123
;1123:	}
LABELV $480
line 1126
;1124:
;1125:	// initialize the menu system
;1126:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1128
;1127:
;1128:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 1129
;1129:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1130
;1130:	trap_Cvar_Set( "cl_postgame", "0" );
ADDRGP4 $137
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1131
;1131:}
LABELV $471
endproc UI_Init 0 8
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 1140
;1132:
;1133:/*
;1134:================
;1135:UI_AdjustFrom640
;1136:
;1137:Adjusted for resolution and screen aspect ratio
;1138:================
;1139:*/
;1140:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 1142
;1141:	// expect valid pointers
;1142:	*x = *x * uis.xscale + uis.bias;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 1143
;1143:	*y *= uis.yscale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 1144
;1144:	*w *= uis.xscale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1145
;1145:	*h *= uis.yscale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 1146
;1146:}
LABELV $495
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 1148
;1147:
;1148:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 1151
;1149:	qhandle_t	hShader;
;1150:
;1151:	hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1152
;1152:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1153
;1153:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1154
;1154:}
LABELV $501
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 1156
;1155:
;1156:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 1162
;1157:	float	s0;
;1158:	float	s1;
;1159:	float	t0;
;1160:	float	t1;
;1161:
;1162:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $503
line 1163
;1163:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 1164
;1164:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1165
;1165:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1166
;1166:	}
ADDRGP4 $504
JUMPV
LABELV $503
line 1167
;1167:	else {
line 1168
;1168:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1169
;1169:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1170
;1170:	}
LABELV $504
line 1172
;1171:
;1172:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $505
line 1173
;1173:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 1174
;1174:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1175
;1175:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1176
;1176:	}
ADDRGP4 $506
JUMPV
LABELV $505
line 1177
;1177:	else {
line 1178
;1178:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1179
;1179:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1180
;1180:	}
LABELV $506
line 1182
;1181:	
;1182:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1183
;1183:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1184
;1184:}
LABELV $502
endproc UI_DrawHandlePic 16 36
export UI_FillRect
proc UI_FillRect 4 36
line 1193
;1185:
;1186:/*
;1187:================
;1188:UI_FillRect
;1189:
;1190:Coordinates are 640*480 virtual values
;1191:=================
;1192:*/
;1193:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 1194
;1194:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1196
;1195:
;1196:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1197
;1197:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1199
;1198:
;1199:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1200
;1200:}
LABELV $507
endproc UI_FillRect 4 36
export UI_DrawRect
proc UI_DrawRect 24 36
line 1209
;1201:
;1202:/*
;1203:================
;1204:UI_DrawRect
;1205:
;1206:Coordinates are 640*480 virtual values
;1207:=================
;1208:*/
;1209:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 1210
;1210:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1212
;1211:
;1212:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1214
;1213:
;1214:	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1215
;1215:	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1216
;1216:	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1217
;1217:	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1219
;1218:
;1219:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1220
;1220:}
LABELV $509
endproc UI_DrawRect 24 36
export UI_SetColor
proc UI_SetColor 0 4
line 1222
;1221:
;1222:void UI_SetColor( const float *rgba ) {
line 1223
;1223:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1224
;1224:}
LABELV $514
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 1226
;1225:
;1226:void UI_UpdateScreen( void ) {
line 1227
;1227:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1228
;1228:}
LABELV $515
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 20 20
line 1236
;1229:
;1230:/*
;1231:=================
;1232:UI_Refresh
;1233:=================
;1234:*/
;1235:void UI_Refresh( int realtime )
;1236:{
line 1237
;1237:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1238
;1238:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1240
;1239:
;1240:	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $519
line 1241
;1241:		return;
ADDRGP4 $516
JUMPV
LABELV $519
line 1244
;1242:	}
;1243:
;1244:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1246
;1245:
;1246:	if ( uis.activemenu )
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
line 1247
;1247:	{
line 1248
;1248:		if (uis.activemenu->fullscreen)
ADDRGP4 uis+20
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
CNSTI4 0
EQI4 $524
line 1249
;1249:		{
line 1251
;1250:			// draw the background
;1251:			if( uis.activemenu->showlogo ) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $527
line 1252
;1252:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackShader );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1253
;1253:			}
ADDRGP4 $528
JUMPV
LABELV $527
line 1254
;1254:			else {
line 1255
;1255:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackNoLogoShader );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11400
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1256
;1256:			}
LABELV $528
line 1257
;1257:		}
LABELV $524
line 1259
;1258:
;1259:		if (uis.activemenu->draw)
ADDRGP4 uis+20
INDIRP4
CNSTI4 396
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $532
line 1260
;1260:			uis.activemenu->draw();
ADDRGP4 uis+20
INDIRP4
CNSTI4 396
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $533
JUMPV
LABELV $532
line 1262
;1261:		else
;1262:			Menu_Draw( uis.activemenu );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $533
line 1264
;1263:
;1264:		if( uis.firstdraw ) {
ADDRGP4 uis+11448
INDIRI4
CNSTI4 0
EQI4 $537
line 1265
;1265:			UI_MouseEvent( 0, 0 );
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 1266
;1266:			uis.firstdraw = qfalse;
ADDRGP4 uis+11448
CNSTI4 0
ASGNI4
line 1267
;1267:		}
LABELV $537
line 1268
;1268:	}
LABELV $521
line 1271
;1269:
;1270:	// draw cursor
;1271:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1272
;1272:	UI_DrawHandlePic( uis.cursorx-16, uis.cursory-16, 32, 32, uis.cursor);
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
CNSTF4 1107296256
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uis+11420
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1275
;1273:
;1274:#ifndef NDEBUG
;1275:	if (uis.debug)
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $544
line 1276
;1276:	{
line 1278
;1277:		// cursor coordinates
;1278:		UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $547
ARGP4
ADDRGP4 uis+8
INDIRI4
ARGI4
ADDRGP4 uis+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1279
;1279:	}
LABELV $544
line 1285
;1280:#endif
;1281:
;1282:	// delay playing the enter sound until after the
;1283:	// menu has been drawn, to avoid delay while
;1284:	// caching images
;1285:	if (m_entersound)
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $550
line 1286
;1286:	{
line 1287
;1287:		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1288
;1288:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 1289
;1289:	}
LABELV $550
line 1290
;1290:}
LABELV $516
endproc UI_Refresh 20 20
export UI_DrawTextBox
proc UI_DrawTextBox 24 20
line 1293
;1291:
;1292:void UI_DrawTextBox (int x, int y, int width, int lines)
;1293:{
line 1294
;1294:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1295
;1295:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1296
;1296:}
LABELV $552
endproc UI_DrawTextBox 24 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 1299
;1297:
;1298:qboolean UI_CursorInRect (int x, int y, int width, int height)
;1299:{
line 1300
;1300:	if (uis.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $562
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $562
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
GTI4 $562
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
LEI4 $554
LABELV $562
line 1304
;1301:		uis.cursory < y ||
;1302:		uis.cursorx > x+width ||
;1303:		uis.cursory > y+height)
;1304:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $553
JUMPV
LABELV $554
line 1306
;1305:
;1306:	return qtrue;
CNSTI4 1
RETI4
LABELV $553
endproc UI_CursorInRect 8 0
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
bss
export uis
align 4
LABELV uis
skip 11452
export m_entersound
align 4
LABELV m_entersound
skip 4
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
LABELV $547
byte 1 40
byte 1 37
byte 1 100
byte 1 44
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $450
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $447
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $444
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $441
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $438
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $435
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $432
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $429
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $426
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $341
byte 1 85
byte 1 73
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $339
byte 1 49
byte 1 0
align 1
LABELV $337
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $335
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 0
align 1
LABELV $324
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 48
byte 1 0
align 1
LABELV $135
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
LABELV $123
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 111
byte 1 112
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $107
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $90
byte 1 100
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $81
byte 1 37
byte 1 115
byte 1 0
