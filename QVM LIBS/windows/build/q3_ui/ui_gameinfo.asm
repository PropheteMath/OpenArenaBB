export UI_Alloc
code
proc UI_Alloc 8 0
file "../../../code/q3_ui/ui_gameinfo.c"
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
;22://
;23://
;24:// gameinfo.c
;25://
;26:
;27:#include "ui_local.h"
;28:
;29:
;30://
;31:// arena and bot info
;32://
;33:
;34:#define POOLSIZE	128 * 1024
;35:
;36:int				ui_numBots;
;37:static char		*ui_botInfos[MAX_BOTS];
;38:
;39:static int		ui_numArenas;
;40:static char		*ui_arenaInfos[MAX_ARENAS];
;41:
;42:static int		ui_numSinglePlayerArenas;
;43:static int		ui_numSpecialSinglePlayerArenas;
;44:
;45:static char		memoryPool[POOLSIZE];
;46:static int		allocPoint, outOfMemory;
;47:
;48:
;49:/*
;50:===============
;51:UI_Alloc
;52:===============
;53:*/
;54:void *UI_Alloc( int size ) {
line 57
;55:	char	*p;
;56:
;57:	if ( allocPoint + size > POOLSIZE ) {
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 131072
LEI4 $80
line 58
;58:		outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 59
;59:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $79
JUMPV
LABELV $80
line 62
;60:	}
;61:
;62:	p = &memoryPool[allocPoint];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 memoryPool
ADDP4
ASGNP4
line 64
;63:
;64:	allocPoint += ( size + 31 ) & ~31;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 31
ADDI4
CNSTI4 -32
BANDI4
ADDI4
ASGNI4
line 66
;65:
;66:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $79
endproc UI_Alloc 8 0
export UI_InitMemory
proc UI_InitMemory 0 0
line 74
;67:}
;68:
;69:/*
;70:===============
;71:UI_InitMemory
;72:===============
;73:*/
;74:void UI_InitMemory( void ) {
line 75
;75:	allocPoint = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 76
;76:	outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 77
;77:}
LABELV $82
endproc UI_InitMemory 0 0
export UI_ParseInfos
proc UI_ParseInfos 2084 12
line 84
;78:
;79:/*
;80:===============
;81:UI_ParseInfos
;82:===============
;83:*/
;84:int UI_ParseInfos( char *buf, int max, char *infos[] ) {
line 90
;85:	char	*token;
;86:	int		count;
;87:	char	key[MAX_TOKEN_CHARS];
;88:	char	info[MAX_INFO_STRING];
;89:
;90:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
line 92
;91:
;92:	while ( 1 ) {
line 93
;93:		token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 94
;94:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $87
line 95
;95:			break;
ADDRGP4 $86
JUMPV
LABELV $87
line 97
;96:		}
;97:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $91
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $89
line 98
;98:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $92
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 99
;99:			break;
ADDRGP4 $86
JUMPV
LABELV $89
line 102
;100:		}
;101:
;102:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $93
line 103
;103:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $95
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 104
;104:			break;
ADDRGP4 $86
JUMPV
LABELV $93
line 107
;105:		}
;106:
;107:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $97
JUMPV
LABELV $96
line 108
;108:		while ( 1 ) {
line 109
;109:			token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 110
;110:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $99
line 111
;111:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $101
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 112
;112:				break;
ADDRGP4 $98
JUMPV
LABELV $99
line 114
;113:			}
;114:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $102
line 115
;115:				break;
ADDRGP4 $98
JUMPV
LABELV $102
line 117
;116:			}
;117:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 119
;118:
;119:			token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 120
;120:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $105
line 121
;121:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 122
;122:			}
LABELV $105
line 123
;123:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 124
;124:		}
LABELV $97
line 108
ADDRGP4 $96
JUMPV
LABELV $98
line 126
;125:		//NOTE: extra space for arena number
;126:		infos[count] = UI_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $108
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $109
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 127
;127:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
line 128
;128:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 129
;129:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 130
;130:		}
LABELV $110
line 131
;131:	}
LABELV $85
line 92
ADDRGP4 $84
JUMPV
LABELV $86
line 132
;132:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $83
endproc UI_ParseInfos 2084 12
proc UI_LoadArenasFromFile 8216 16
line 140
;133:}
;134:
;135:/*
;136:===============
;137:UI_LoadArenasFromFile
;138:===============
;139:*/
;140:static void UI_LoadArenasFromFile( char *filename ) {
line 145
;141:	int				len;
;142:	fileHandle_t	f;
;143:	char			buf[MAX_ARENAS_TEXT];
;144:
;145:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 146
;146:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $113
line 147
;147:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 148
;148:		return;
ADDRGP4 $112
JUMPV
LABELV $113
line 150
;149:	}
;150:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $116
line 151
;151:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $118
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 152
;152:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 153
;153:		return;
ADDRGP4 $112
JUMPV
LABELV $116
line 156
;154:	}
;155:
;156:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 157
;157:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 158
;158:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 160
;159:
;160:	ui_numArenas += UI_ParseInfos( buf, MAX_ARENAS - ui_numArenas, &ui_arenaInfos[ui_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 161
;161:}
LABELV $112
endproc UI_LoadArenasFromFile 8216 16
proc UI_LoadArenas 20952 16
line 168
;162:
;163:/*
;164:===============
;165:UI_LoadArenas
;166:===============
;167:*/
;168:static void UI_LoadArenas( void ) {
line 180
;169:	int			numdirs;
;170:	vmCvar_t	arenasFile;
;171:	char		filename[128];
;172:	char		dirlist[20*1024];
;173:	char*		dirptr;
;174:	int			i, n;
;175:	int			dirlen;
;176:	char		*type;
;177:	char		*tag;
;178:	int		singlePlayerNum, specialNum, otherNum;
;179:
;180:	ui_numArenas = 0;
ADDRGP4 ui_numArenas
CNSTI4 0
ASGNI4
line 182
;181:
;182:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 20648
ARGP4
ADDRGP4 $120
ARGP4
ADDRGP4 $121
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 183
;183:	if( *arenasFile.string ) {
ADDRLP4 20648+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $122
line 184
;184:		UI_LoadArenasFromFile(arenasFile.string);
ADDRLP4 20648+16
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 185
;185:	}
ADDRGP4 $123
JUMPV
LABELV $122
line 186
;186:	else {
line 187
;187:		UI_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $126
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 188
;188:	}
LABELV $123
line 191
;189:
;190:	// get all arenas from .arena files
;191:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, sizeof(dirlist) );
ADDRGP4 $127
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 168
ARGP4
CNSTI4 20480
ARGI4
ADDRLP4 20920
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 20920
INDIRI4
ASGNI4
line 192
;192:	dirptr  = dirlist;
ADDRLP4 8
ADDRLP4 168
ASGNP4
line 193
;193:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 194
;194:		dirlen = strlen(dirptr);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20924
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 20924
INDIRI4
ASGNI4
line 195
;195:		strcpy(filename, "scripts/");
ADDRLP4 12
ARGP4
ADDRGP4 $133
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 196
;196:		strcat(filename, dirptr);
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 197
;197:		UI_LoadArenasFromFile(filename);
ADDRLP4 12
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 198
;198:	}
LABELV $130
line 193
ADDRLP4 20924
CNSTI4 1
ASGNI4
ADDRLP4 140
ADDRLP4 140
INDIRI4
ADDRLP4 20924
INDIRI4
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 144
INDIRI4
ADDRLP4 20924
INDIRI4
ADDI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
LABELV $132
ADDRLP4 140
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $129
line 199
;199:	trap_Print( va( "%i arenas parsed\n", ui_numArenas ) );
ADDRGP4 $134
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
ARGI4
ADDRLP4 20928
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20928
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 200
;200:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all arenas\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $135
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $135
line 203
;201:
;202:	// set initial numbers
;203:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
line 204
;204:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $143
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20932
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 20932
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 205
;205:	}
LABELV $139
line 203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $138
line 208
;206:
;207:	// go through and count single players levels
;208:	ui_numSinglePlayerArenas = 0;
ADDRGP4 ui_numSinglePlayerArenas
CNSTI4 0
ASGNI4
line 209
;209:	ui_numSpecialSinglePlayerArenas = 0;
ADDRGP4 ui_numSpecialSinglePlayerArenas
CNSTI4 0
ASGNI4
line 210
;210:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $144
line 212
;211:		// determine type
;212:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 20932
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20932
INDIRP4
ASGNP4
line 215
;213:
;214:		// if no type specified, it will be treated as "ffa"
;215:		if( !*type ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $149
line 216
;216:			continue;
ADDRGP4 $145
JUMPV
LABELV $149
line 219
;217:		}
;218:
;219:		if( strstr( type, "single" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20936
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20936
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $151
line 221
;220:			// check for special single player arenas (training, final)
;221:			tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 20940
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 20940
INDIRP4
ASGNP4
line 222
;222:			if( *tag ) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $155
line 223
;223:				ui_numSpecialSinglePlayerArenas++;
ADDRLP4 20944
ADDRGP4 ui_numSpecialSinglePlayerArenas
ASGNP4
ADDRLP4 20944
INDIRP4
ADDRLP4 20944
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 224
;224:				continue;
ADDRGP4 $145
JUMPV
LABELV $155
line 227
;225:			}
;226:
;227:			ui_numSinglePlayerArenas++;
ADDRLP4 20944
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 20944
INDIRP4
ADDRLP4 20944
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 228
;228:		}
LABELV $151
line 229
;229:	}
LABELV $145
line 210
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $144
line 231
;230:
;231:	n = ui_numSinglePlayerArenas % ARENAS_PER_TIER;
ADDRLP4 0
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 232
;232:	if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $157
line 233
;233:		ui_numSinglePlayerArenas -= n;
ADDRLP4 20932
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 20932
INDIRP4
ADDRLP4 20932
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 234
;234:		trap_Print( va( "%i arenas ignored to make count divisible by %i\n", n, ARENAS_PER_TIER ) );
ADDRGP4 $159
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 20936
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20936
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 235
;235:	}
LABELV $157
line 238
;236:
;237:	// go through once more and assign number to the levels
;238:	singlePlayerNum = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 239
;239:	specialNum = singlePlayerNum + ui_numSinglePlayerArenas;
ADDRLP4 164
ADDRLP4 160
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 240
;240:	otherNum = specialNum + ui_numSpecialSinglePlayerArenas + n;
ADDRLP4 156
ADDRLP4 164
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 241
;241:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $163
JUMPV
LABELV $160
line 243
;242:		// determine type
;243:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 20932
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20932
INDIRP4
ASGNP4
line 246
;244:
;245:		// if no type specified, it will be treated as "ffa"
;246:		if( *type ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $164
line 247
;247:			if( strstr( type, "single" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20936
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20936
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $166
line 249
;248:				// check for special single player arenas (training, final)
;249:				tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 20940
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 20940
INDIRP4
ASGNP4
line 250
;250:				if( *tag ) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $168
line 251
;251:					Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", specialNum++ ) );
ADDRGP4 $143
ARGP4
ADDRLP4 20944
ADDRLP4 164
INDIRI4
ASGNI4
ADDRLP4 164
ADDRLP4 20944
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20944
INDIRI4
ARGI4
ADDRLP4 20948
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 20948
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 252
;252:					continue;
ADDRGP4 $161
JUMPV
LABELV $168
line 255
;253:				}
;254:
;255:				Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", singlePlayerNum++ ) );
ADDRGP4 $143
ARGP4
ADDRLP4 20944
ADDRLP4 160
INDIRI4
ASGNI4
ADDRLP4 160
ADDRLP4 20944
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20944
INDIRI4
ARGI4
ADDRLP4 20948
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 20948
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 256
;256:				continue;
ADDRGP4 $161
JUMPV
LABELV $166
line 258
;257:			}
;258:		}
LABELV $164
line 260
;259:
;260:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", otherNum++ ) );
ADDRGP4 $143
ARGP4
ADDRLP4 20936
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 156
ADDRLP4 20936
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20936
INDIRI4
ARGI4
ADDRLP4 20940
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 20940
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 261
;261:	}
LABELV $161
line 241
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $163
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $160
line 262
;262:}
LABELV $119
endproc UI_LoadArenas 20952 16
export UI_GetArenaInfoByNumber
proc UI_GetArenaInfoByNumber 24 8
line 269
;263:
;264:/*
;265:===============
;266:UI_GetArenaInfoByNumber
;267:===============
;268:*/
;269:const char *UI_GetArenaInfoByNumber( int num ) {
line 273
;270:	int		n;
;271:	char	*value;
;272:
;273:	if( num < 0 || num >= ui_numArenas ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $173
ADDRLP4 8
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $171
LABELV $173
line 274
;274:		trap_Print( va( S_COLOR_RED "Invalid arena number: %i\n", num ) );
ADDRGP4 $174
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 275
;275:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $170
JUMPV
LABELV $171
line 278
;276:	}
;277:
;278:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 279
;279:		value = Info_ValueForKey( ui_arenaInfos[n], "num" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 280
;280:		if( *value && atoi(value) == num ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $179
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $179
line 281
;281:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $170
JUMPV
LABELV $179
line 283
;282:		}
;283:	}
LABELV $176
line 278
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $175
line 285
;284:
;285:	return NULL;
CNSTP4 0
RETP4
LABELV $170
endproc UI_GetArenaInfoByNumber 24 8
export UI_GetArenaInfoByMap
proc UI_GetArenaInfoByMap 12 8
line 294
;286:}
;287:
;288:
;289:/*
;290:===============
;291:UI_GetArenaInfoByNumber
;292:===============
;293:*/
;294:const char *UI_GetArenaInfoByMap( const char *map ) {
line 297
;295:	int			n;
;296:
;297:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 298
;298:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $188
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $186
line 299
;299:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $181
JUMPV
LABELV $186
line 301
;300:		}
;301:	}
LABELV $183
line 297
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $182
line 303
;302:
;303:	return NULL;
CNSTP4 0
RETP4
LABELV $181
endproc UI_GetArenaInfoByMap 12 8
export UI_GetSpecialArenaInfo
proc UI_GetSpecialArenaInfo 12 8
line 312
;304:}
;305:
;306:
;307:/*
;308:===============
;309:UI_GetSpecialArenaInfo
;310:===============
;311:*/
;312:const char *UI_GetSpecialArenaInfo( const char *tag ) {
line 315
;313:	int			n;
;314:
;315:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $190
line 316
;316:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "special" ), tag ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $194
line 317
;317:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $189
JUMPV
LABELV $194
line 319
;318:		}
;319:	}
LABELV $191
line 315
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $193
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $190
line 321
;320:
;321:	return NULL;
CNSTP4 0
RETP4
LABELV $189
endproc UI_GetSpecialArenaInfo 12 8
proc UI_LoadBotsFromFile 8216 16
line 329
;322:}
;323:
;324:/*
;325:===============
;326:UI_LoadBotsFromFile
;327:===============
;328:*/
;329:static void UI_LoadBotsFromFile( char *filename ) {
line 334
;330:	int				len;
;331:	fileHandle_t	f;
;332:	char			buf[MAX_BOTS_TEXT];
;333:
;334:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 335
;335:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $197
line 336
;336:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 337
;337:		return;
ADDRGP4 $196
JUMPV
LABELV $197
line 339
;338:	}
;339:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $199
line 340
;340:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $118
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 341
;341:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 342
;342:		return;
ADDRGP4 $196
JUMPV
LABELV $199
line 345
;343:	}
;344:
;345:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 346
;346:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 347
;347:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 349
;348:
;349:	ui_numBots += UI_ParseInfos( buf, MAX_BOTS - ui_numBots, &ui_botInfos[ui_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 350
;350:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all bots\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $201
ADDRGP4 $203
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $201
line 351
;351:}
LABELV $196
endproc UI_LoadBotsFromFile 8216 16
proc UI_LoadBots 1452 16
line 358
;352:
;353:/*
;354:===============
;355:UI_LoadBots
;356:===============
;357:*/
;358:static void UI_LoadBots( void ) {
line 367
;359:	vmCvar_t	botsFile;
;360:	int			numdirs;
;361:	char		filename[128];
;362:	char		dirlist[1024];
;363:	char*		dirptr;
;364:	int			i;
;365:	int			dirlen;
;366:
;367:	ui_numBots = 0;
ADDRGP4 ui_numBots
CNSTI4 0
ASGNI4
line 369
;368:
;369:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $205
ARGP4
ADDRGP4 $121
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 370
;370:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $206
line 371
;371:		UI_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 372
;372:	}
ADDRGP4 $207
JUMPV
LABELV $206
line 373
;373:	else {
line 374
;374:		UI_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $210
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 375
;375:	}
LABELV $207
line 378
;376:
;377:	// get all bots from .bot files
;378:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $127
ARGP4
ADDRGP4 $211
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1440
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1440
INDIRI4
ASGNI4
line 379
;379:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 380
;380:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 381
;381:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1444
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1444
INDIRI4
ASGNI4
line 382
;382:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $133
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 383
;383:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 384
;384:		UI_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 385
;385:	}
LABELV $213
line 380
ADDRLP4 1444
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1444
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 1444
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $215
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $212
line 386
;386:	trap_Print( va( "%i bots parsed\n", ui_numBots ) );
ADDRGP4 $216
ARGP4
ADDRGP4 ui_numBots
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 387
;387:}
LABELV $204
endproc UI_LoadBots 1452 16
export UI_GetBotInfoByNumber
proc UI_GetBotInfoByNumber 8 8
line 395
;388:
;389:
;390:/*
;391:===============
;392:UI_GetBotInfoByNumber
;393:===============
;394:*/
;395:char *UI_GetBotInfoByNumber( int num ) {
line 396
;396:	if( num < 0 || num >= ui_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $220
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $218
LABELV $220
line 397
;397:		trap_Print( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $221
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 398
;398:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $217
JUMPV
LABELV $218
line 400
;399:	}
;400:	return ui_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
LABELV $217
endproc UI_GetBotInfoByNumber 8 8
export UI_GetBotInfoByName
proc UI_GetBotInfoByName 16 8
line 409
;401:}
;402:
;403:
;404:/*
;405:===============
;406:UI_GetBotInfoByName
;407:===============
;408:*/
;409:char *UI_GetBotInfoByName( const char *name ) {
line 413
;410:	int		n;
;411:	char	*value;
;412:
;413:	for ( n = 0; n < ui_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 414
;414:		value = Info_ValueForKey( ui_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 415
;415:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $228
line 416
;416:			return ui_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $222
JUMPV
LABELV $228
line 418
;417:		}
;418:	}
LABELV $224
line 413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $223
line 420
;419:
;420:	return NULL;
CNSTP4 0
RETP4
LABELV $222
endproc UI_GetBotInfoByName 16 8
export UI_GetBestScore
proc UI_GetBestScore 1084 16
line 435
;421:}
;422:
;423:
;424://
;425:// single player game info
;426://
;427:
;428:/*
;429:===============
;430:UI_GetBestScore
;431:
;432:Returns the player's best finish on a given level, 0 if the have not played the level
;433:===============
;434:*/
;435:void UI_GetBestScore( int level, int *score, int *skill ) {
line 443
;436:	int		n;
;437:	int		skillScore;
;438:	int		bestScore;
;439:	int		bestScoreSkill;
;440:	char	arenaKey[16];
;441:	char	scores[MAX_INFO_VALUE];
;442:
;443:	if( !score || !skill ) {
ADDRLP4 1056
CNSTU4 0
ASGNU4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRU4
EQU4 $233
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRU4
NEU4 $231
LABELV $233
line 444
;444:		return;
ADDRGP4 $230
JUMPV
LABELV $231
line 447
;445:	}
;446:
;447:	if( level < 0 || level > ui_numArenas ) {
ADDRLP4 1060
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 1060
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LEI4 $234
LABELV $236
line 448
;448:		return;
ADDRGP4 $230
JUMPV
LABELV $234
line 451
;449:	}
;450:
;451:	bestScore = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 452
;452:	bestScoreSkill = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 454
;453:
;454:	for( n = 1; n <= 5; n++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $237
line 455
;455:		trap_Cvar_VariableStringBuffer( va( "g_spScores%i", n ), scores, MAX_INFO_VALUE );
ADDRGP4 $241
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 457
;456:
;457:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $242
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 458
;458:		skillScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1072
INDIRI4
ASGNI4
line 460
;459:
;460:		if( skillScore < 1 || skillScore > 8 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $245
ADDRLP4 0
INDIRI4
CNSTI4 8
LEI4 $243
LABELV $245
line 461
;461:			continue;
ADDRGP4 $238
JUMPV
LABELV $243
line 464
;462:		}
;463:
;464:		if( !bestScore || skillScore <= bestScore ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $246
LABELV $248
line 465
;465:			bestScore = skillScore;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
line 466
;466:			bestScoreSkill = n;
ADDRLP4 1052
ADDRLP4 4
INDIRI4
ASGNI4
line 467
;467:		}
LABELV $246
line 468
;468:	}
LABELV $238
line 454
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $237
line 470
;469:
;470:	*score = bestScore;
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 471
;471:	*skill = bestScoreSkill;
ADDRFP4 8
INDIRP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 472
;472:}
LABELV $230
endproc UI_GetBestScore 1084 16
export UI_SetBestScore
proc UI_SetBestScore 1084 16
line 482
;473:
;474:
;475:/*
;476:===============
;477:UI_SetBestScore
;478:
;479:Set the player's best finish for a level
;480:===============
;481:*/
;482:void UI_SetBestScore( int level, int score ) {
line 489
;483:	int		skill;
;484:	int		oldScore;
;485:	char	arenaKey[16];
;486:	char	scores[MAX_INFO_VALUE];
;487:
;488:	// validate score
;489:	if( score < 1 || score > 8 ) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 1
LTI4 $252
ADDRLP4 1048
INDIRI4
CNSTI4 8
LEI4 $250
LABELV $252
line 490
;490:		return;
ADDRGP4 $249
JUMPV
LABELV $250
line 494
;491:	}
;492:
;493:	// validate skill
;494:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $253
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 495
;495:	if( skill < 1 || skill > 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $254
LABELV $256
line 496
;496:		return;
ADDRGP4 $249
JUMPV
LABELV $254
line 500
;497:	}
;498:
;499:	// get scores
;500:	trap_Cvar_VariableStringBuffer( va( "g_spScores%i", skill ), scores, MAX_INFO_VALUE );
ADDRGP4 $241
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 503
;501:
;502:	// see if this is better
;503:	Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $242
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 504
;504:	oldScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1068
INDIRI4
ASGNI4
line 505
;505:	if( oldScore && oldScore <= score ) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $257
ADDRLP4 1044
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $257
line 506
;506:		return;
ADDRGP4 $249
JUMPV
LABELV $257
line 510
;507:	}
;508:
;509:	// update scores
;510:	Info_SetValueForKey( scores, arenaKey, va( "%i", score ) );
ADDRGP4 $143
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 511
;511:	trap_Cvar_Set( va( "g_spScores%i", skill ), scores );
ADDRGP4 $241
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 512
;512:}
LABELV $249
endproc UI_SetBestScore 1084 16
export UI_LogAwardData
proc UI_LogAwardData 1056 16
line 520
;513:
;514:
;515:/*
;516:===============
;517:UI_LogAwardData
;518:===============
;519:*/
;520:void UI_LogAwardData( int award, int data ) {
line 525
;521:	char	key[16];
;522:	char	awardData[MAX_INFO_VALUE];
;523:	int		oldValue;
;524:
;525:	if( data == 0 ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $260
line 526
;526:		return;
ADDRGP4 $259
JUMPV
LABELV $260
line 529
;527:	}
;528:
;529:	if( award > AWARD_PERFECT ) {
ADDRFP4 0
INDIRI4
CNSTI4 5
LEI4 $262
line 530
;530:		trap_Print( va( S_COLOR_RED "Bad award %i in UI_LogAwardData\n", award ) );
ADDRGP4 $264
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 531
;531:		return;
ADDRGP4 $259
JUMPV
LABELV $262
line 534
;532:	}
;533:
;534:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $265
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 536
;535:
;536:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $266
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 537
;537:	oldValue = atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
line 539
;538:
;539:	Info_SetValueForKey( awardData, key, va( "%i", oldValue + data ) );
ADDRGP4 $143
ARGP4
ADDRLP4 1040
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 540
;540:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $265
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 541
;541:}
LABELV $259
endproc UI_LogAwardData 1056 16
export UI_GetAwardLevel
proc UI_GetAwardLevel 1048 16
line 549
;542:
;543:
;544:/*
;545:===============
;546:UI_GetAwardLevel
;547:===============
;548:*/
;549:int UI_GetAwardLevel( int award ) {
line 553
;550:	char	key[16];
;551:	char	awardData[MAX_INFO_VALUE];
;552:
;553:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $265
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 555
;554:
;555:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $266
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 556
;556:	return atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
RETI4
LABELV $267
endproc UI_GetAwardLevel 1048 16
export UI_TierCompleted
proc UI_TierCompleted 56 12
line 565
;557:}
;558:
;559:
;560:/*
;561:===============
;562:UI_TierCompleted
;563:===============
;564:*/
;565:int UI_TierCompleted( int levelWon ) {
line 573
;566:	int			level;
;567:	int			n;
;568:	int			tier;
;569:	int			score;
;570:	int			skill;
;571:	const char	*info;
;572:
;573:	tier = levelWon / ARENAS_PER_TIER;
ADDRLP4 16
ADDRFP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 574
;574:	level = tier * ARENAS_PER_TIER;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 576
;575:
;576:	if( tier == UI_GetNumSPTiers() ) {
ADDRLP4 24
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $269
line 577
;577:		info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $271
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 578
;578:		if( levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $272
line 579
;579:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $272
line 581
;580:		}
;581:		info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $274
ARGP4
ADDRLP4 40
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 40
INDIRP4
ASGNP4
line 582
;582:		if( !info || levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 44
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $277
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $275
LABELV $277
line 583
;583:			return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $268
JUMPV
LABELV $275
line 585
;584:		}
;585:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $268
JUMPV
LABELV $269
line 588
;586:	}
;587:
;588:	for( n = 0; n < ARENAS_PER_TIER; n++, level++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $278
line 589
;589:		UI_GetBestScore( level, &score, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 590
;590:		if ( score != 1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $282
line 591
;591:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $268
JUMPV
LABELV $282
line 593
;592:		}
;593:	}
LABELV $279
line 588
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $278
line 594
;594:	return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $268
endproc UI_TierCompleted 56 12
export UI_ShowTierVideo
proc UI_ShowTierVideo 1052 16
line 603
;595:}
;596:
;597:
;598:/*
;599:===============
;600:UI_ShowTierVideo
;601:===============
;602:*/
;603:qboolean UI_ShowTierVideo( int tier ) {
line 607
;604:	char	key[16];
;605:	char	videos[MAX_INFO_VALUE];
;606:
;607:	if( tier <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $285
line 608
;608:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $285
line 611
;609:	}
;610:
;611:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 613
;612:
;613:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $288
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 614
;614:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $289
line 615
;615:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $289
line 618
;616:	}
;617:
;618:	Info_SetValueForKey( videos, key, va( "%i", 1 ) );
ADDRGP4 $143
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 619
;619:	trap_Cvar_Set( "g_spVideos", videos );
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 621
;620:
;621:	return qtrue;
CNSTI4 1
RETI4
LABELV $284
endproc UI_ShowTierVideo 1052 16
export UI_CanShowTierVideo
proc UI_CanShowTierVideo 1048 16
line 630
;622:}
;623:
;624:
;625:/*
;626:===============
;627:UI_CanShowTierVideo
;628:===============
;629:*/
;630:qboolean UI_CanShowTierVideo( int tier ) {
line 634
;631:	char	key[16];
;632:	char	videos[MAX_INFO_VALUE];
;633:
;634:	if( !tier ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $292
line 635
;635:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $291
JUMPV
LABELV $292
line 638
;636:	}
;637:
;638:	if( uis.demoversion && tier != 8 ) {
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $294
ADDRFP4 0
INDIRI4
CNSTI4 8
EQI4 $294
line 639
;639:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $291
JUMPV
LABELV $294
line 642
;640:	}
;641:
;642:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $287
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 644
;643:
;644:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $288
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 645
;645:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $297
line 646
;646:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $291
JUMPV
LABELV $297
line 649
;647:	}
;648:
;649:	return qfalse;
CNSTI4 0
RETI4
LABELV $291
endproc UI_CanShowTierVideo 1048 16
export UI_GetCurrentGame
proc UI_GetCurrentGame 32 12
line 660
;650:}
;651:
;652:
;653:/*
;654:===============
;655:UI_GetCurrentGame
;656:
;657:Returns the next level the player has not won
;658:===============
;659:*/
;660:int UI_GetCurrentGame( void ) {
line 666
;661:	int		level;
;662:	int		rank;
;663:	int		skill;
;664:	const char *info;
;665:
;666:	info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $271
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 667
;667:	if( info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
line 668
;668:		level = atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 669
;669:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 670
;670:		if ( !rank || rank > 1 ) {
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $302
LABELV $304
line 671
;671:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $299
JUMPV
LABELV $302
line 673
;672:		}
;673:	}
LABELV $300
line 675
;674:
;675:	for( level = 0; level < ui_numSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 676
;676:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 677
;677:		if ( !rank || rank > 1 ) {
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $311
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $309
LABELV $311
line 678
;678:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $299
JUMPV
LABELV $309
line 680
;679:		}
;680:	}
LABELV $306
line 675
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
LTI4 $305
line 682
;681:
;682:	info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $274
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 683
;683:	if( !info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $312
line 684
;684:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $299
JUMPV
LABELV $312
line 686
;685:	}
;686:	return atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $299
endproc UI_GetCurrentGame 32 12
export UI_NewGame
proc UI_NewGame 0 8
line 697
;687:}
;688:
;689:
;690:/*
;691:===============
;692:UI_NewGame
;693:
;694:Clears the scores and sets the difficutly level
;695:===============
;696:*/
;697:void UI_NewGame( void ) {
line 698
;698:	trap_Cvar_Set( "g_spScores1", "" );
ADDRGP4 $315
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 699
;699:	trap_Cvar_Set( "g_spScores2", "" );
ADDRGP4 $316
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 700
;700:	trap_Cvar_Set( "g_spScores3", "" );
ADDRGP4 $317
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 701
;701:	trap_Cvar_Set( "g_spScores4", "" );
ADDRGP4 $318
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 702
;702:	trap_Cvar_Set( "g_spScores5", "" );
ADDRGP4 $319
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 703
;703:	trap_Cvar_Set( "g_spAwards", "" );
ADDRGP4 $265
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 704
;704:	trap_Cvar_Set( "g_spVideos", "" );
ADDRGP4 $287
ARGP4
ADDRGP4 $121
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 705
;705:}
LABELV $314
endproc UI_NewGame 0 8
export UI_GetNumArenas
proc UI_GetNumArenas 0 0
line 713
;706:
;707:
;708:/*
;709:===============
;710:UI_GetNumArenas
;711:===============
;712:*/
;713:int UI_GetNumArenas( void ) {
line 714
;714:	return ui_numArenas;
ADDRGP4 ui_numArenas
INDIRI4
RETI4
LABELV $320
endproc UI_GetNumArenas 0 0
export UI_GetNumSPArenas
proc UI_GetNumSPArenas 0 0
line 723
;715:}
;716:
;717:
;718:/*
;719:===============
;720:UI_GetNumSPArenas
;721:===============
;722:*/
;723:int UI_GetNumSPArenas( void ) {
line 724
;724:	return ui_numSinglePlayerArenas;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
RETI4
LABELV $321
endproc UI_GetNumSPArenas 0 0
export UI_GetNumSPTiers
proc UI_GetNumSPTiers 0 0
line 733
;725:}
;726:
;727:
;728:/*
;729:===============
;730:UI_GetNumSPTiers
;731:===============
;732:*/
;733:int UI_GetNumSPTiers( void ) {
line 734
;734:	return ui_numSinglePlayerArenas / ARENAS_PER_TIER;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
DIVI4
RETI4
LABELV $322
endproc UI_GetNumSPTiers 0 0
export UI_GetNumBots
proc UI_GetNumBots 0 0
line 743
;735:}
;736:
;737:
;738:/*
;739:===============
;740:UI_GetNumBots
;741:===============
;742:*/
;743:int UI_GetNumBots( void ) {
line 744
;744:	return ui_numBots;
ADDRGP4 ui_numBots
INDIRI4
RETI4
LABELV $323
endproc UI_GetNumBots 0 0
export UI_SPUnlock_f
proc UI_SPUnlock_f 1048 16
line 753
;745:}
;746:
;747:
;748:/*
;749:===============
;750:UI_SPUnlock_f
;751:===============
;752:*/
;753:void UI_SPUnlock_f( void ) {
line 760
;754:	char	arenaKey[16];
;755:	char	scores[MAX_INFO_VALUE];
;756:	int		level;
;757:	int		tier;
;758:
;759:	// get scores for skill 1
;760:	trap_Cvar_VariableStringBuffer( "g_spScores1", scores, MAX_INFO_VALUE );
ADDRGP4 $315
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 763
;761:
;762:	// update scores
;763:	for( level = 0; level < ui_numSinglePlayerArenas + ui_numSpecialSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $328
JUMPV
LABELV $325
line 764
;764:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 765
;765:		Info_SetValueForKey( scores, arenaKey, "1" );
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 $329
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 766
;766:	}
LABELV $326
line 763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $328
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
LTI4 $325
line 767
;767:	trap_Cvar_Set( "g_spScores1", scores );
ADDRGP4 $315
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 770
;768:
;769:	// unlock cinematics
;770:	for( tier = 1; tier <= 8; tier++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $330
line 771
;771:		UI_ShowTierVideo( tier );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ShowTierVideo
CALLI4
pop
line 772
;772:	}
LABELV $331
line 770
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LEI4 $330
line 774
;773:
;774:	trap_Print( "All levels unlocked at skill level 1\n" );
ADDRGP4 $334
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 776
;775:
;776:	UI_SPLevelMenu_ReInit();
ADDRGP4 UI_SPLevelMenu_ReInit
CALLV
pop
line 777
;777:}
LABELV $324
endproc UI_SPUnlock_f 1048 16
export UI_SPUnlockMedals_f
proc UI_SPUnlockMedals_f 1044 16
line 785
;778:
;779:
;780:/*
;781:===============
;782:UI_SPUnlockMedals_f
;783:===============
;784:*/
;785:void UI_SPUnlockMedals_f( void ) {
line 790
;786:	int		n;
;787:	char	key[16];
;788:	char	awardData[MAX_INFO_VALUE];
;789:
;790:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, MAX_INFO_VALUE );
ADDRGP4 $265
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 792
;791:
;792:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $336
line 793
;793:		Com_sprintf( key, sizeof(key), "a%i", n );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $266
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 794
;794:		Info_SetValueForKey( awardData, key, "100" );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $340
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 795
;795:	}
LABELV $337
line 792
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $336
line 797
;796:
;797:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $265
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 799
;798:
;799:	trap_Print( "All levels unlocked at 100\n" );
ADDRGP4 $341
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 800
;800:}
LABELV $335
endproc UI_SPUnlockMedals_f 1044 16
export UI_InitGameinfo
proc UI_InitGameinfo 0 0
line 808
;801:
;802:
;803:/*
;804:===============
;805:UI_InitGameinfo
;806:===============
;807:*/
;808:void UI_InitGameinfo( void ) {
line 810
;809:
;810:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 811
;811:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 812
;812:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 814
;813:
;814:	uis.demoversion = qfalse;
ADDRGP4 uis+11444
CNSTI4 0
ASGNI4
line 815
;815:}
LABELV $342
endproc UI_InitGameinfo 0 0
bss
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV memoryPool
skip 131072
align 4
LABELV ui_numSpecialSinglePlayerArenas
skip 4
align 4
LABELV ui_numSinglePlayerArenas
skip 4
align 4
LABELV ui_arenaInfos
skip 4096
align 4
LABELV ui_numArenas
skip 4
align 4
LABELV ui_botInfos
skip 4096
export ui_numBots
align 4
LABELV ui_numBots
skip 4
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
LABELV $341
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $334
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $329
byte 1 49
byte 1 0
align 1
LABELV $319
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $318
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $317
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $316
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $315
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $288
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $287
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $274
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $271
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $266
byte 1 97
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $265
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 94
byte 1 49
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 95
byte 1 76
byte 1 111
byte 1 103
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $253
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $242
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $241
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $227
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $221
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $216
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $211
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $210
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $205
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $203
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $188
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $174
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $154
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $153
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $142
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $137
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $128
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 0
align 1
LABELV $120
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $118
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $115
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $108
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $107
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $104
byte 1 125
byte 1 0
align 1
LABELV $101
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $92
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $91
byte 1 123
byte 1 0
