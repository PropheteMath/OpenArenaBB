export Com_Clamp
code
proc Com_Clamp 0 0
file "../../../code/qcommon/q_shared.c"
line 26
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
;23:// q_shared.c -- stateless support routines that are included in each code dll
;24:#include "q_shared.h"
;25:
;26:float Com_Clamp( float min, float max, float value ) {
line 27
;27:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $24
line 28
;28:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $23
JUMPV
LABELV $24
line 30
;29:	}
;30:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $26
line 31
;31:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $23
JUMPV
LABELV $26
line 33
;32:	}
;33:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $23
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 43
;34:}
;35:
;36:
;37:/*
;38:============
;39:COM_SkipPath
;40:============
;41:*/
;42:char *COM_SkipPath (char *pathname)
;43:{
line 46
;44:	char	*last;
;45:	
;46:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $30
JUMPV
LABELV $29
line 48
;47:	while (*pathname)
;48:	{
line 49
;49:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $32
line 50
;50:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $32
line 51
;51:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 52
;52:	}
LABELV $30
line 47
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $29
line 53
;53:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $28
endproc COM_SkipPath 4 0
export COM_GetExtension
proc COM_GetExtension 16 4
line 61
;54:}
;55:
;56:/*
;57:============
;58:COM_GetExtension
;59:============
;60:*/
;61:const char *COM_GetExtension( const char *name ) {
line 64
;62:	int length, i;
;63:
;64:	length = strlen(name)-1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 65
;65:	i = length;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $36
JUMPV
LABELV $35
line 68
;66:
;67:	while (name[i] != '.')
;68:	{
line 69
;69:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 70
;70:		if (name[i] == '/' || i == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $40
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $38
LABELV $40
line 71
;71:			return ""; // no extension
ADDRGP4 $41
RETP4
ADDRGP4 $34
JUMPV
LABELV $38
line 72
;72:	}
LABELV $36
line 67
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $35
line 74
;73:
;74:	return &name[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
RETP4
LABELV $34
endproc COM_GetExtension 16 4
export COM_StripExtension
proc COM_StripExtension 12 12
line 83
;75:}
;76:
;77:
;78:/*
;79:============
;80:COM_StripExtension
;81:============
;82:*/
;83:void COM_StripExtension( const char *in, char *out, int destsize ) {
line 86
;84:	int             length;
;85:
;86:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 88
;87:
;88:	length = strlen(out)-1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $44
JUMPV
LABELV $43
line 90
;89:	while (length > 0 && out[length] != '.')
;90:	{
line 91
;91:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 92
;92:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $46
line 93
;93:			return;		// no extension
ADDRGP4 $42
JUMPV
LABELV $46
line 94
;94:	}
LABELV $44
line 89
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $48
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $43
LABELV $48
line 95
;95:	if (length)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $49
line 96
;96:		out[length] = 0;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $49
line 97
;97:}
LABELV $42
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 105
;98:
;99:
;100:/*
;101:==================
;102:COM_DefaultExtension
;103:==================
;104:*/
;105:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 113
;106:	char	oldPath[MAX_QPATH];
;107:	char    *src;
;108:
;109://
;110:// if path doesn't have a .EXT, append extension
;111:// (extension should include the .)
;112://
;113:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $53
JUMPV
LABELV $52
line 115
;114:
;115:	while (*src != '/' && src != path) {
line 116
;116:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $55
line 117
;117:			return;                 // it has an extension
ADDRGP4 $51
JUMPV
LABELV $55
line 119
;118:		}
;119:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 120
;120:	}
LABELV $53
line 115
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $57
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $52
LABELV $57
line 122
;121:
;122:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 123
;123:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $58
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 124
;124:}
LABELV $51
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 156
;125:
;126:/*
;127:============================================================================
;128:
;129:					BYTE ORDER FUNCTIONS
;130:
;131:============================================================================
;132:*/
;133:/*
;134:// can't just use function pointers, or dll linkage can
;135:// mess up when qcommon is included in multiple places
;136:static short	(*_BigShort) (short l);
;137:static short	(*_LittleShort) (short l);
;138:static int		(*_BigLong) (int l);
;139:static int		(*_LittleLong) (int l);
;140:static qint64	(*_BigLong64) (qint64 l);
;141:static qint64	(*_LittleLong64) (qint64 l);
;142:static float	(*_BigFloat) (const float *l);
;143:static float	(*_LittleFloat) (const float *l);
;144:
;145:short	BigShort(short l){return _BigShort(l);}
;146:short	LittleShort(short l) {return _LittleShort(l);}
;147:int		BigLong (int l) {return _BigLong(l);}
;148:int		LittleLong (int l) {return _LittleLong(l);}
;149:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;150:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;151:float	BigFloat (const float *l) {return _BigFloat(l);}
;152:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;153:*/
;154:
;155:short   ShortSwap (short l)
;156:{
line 159
;157:	byte    b1,b2;
;158:
;159:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 160
;160:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 162
;161:
;162:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $59
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 166
;163:}
;164:
;165:short	ShortNoSwap (short l)
;166:{
line 167
;167:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $60
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 171
;168:}
;169:
;170:int    LongSwap (int l)
;171:{
line 174
;172:	byte    b1,b2,b3,b4;
;173:
;174:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 175
;175:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 176
;176:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 177
;177:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 179
;178:
;179:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $61
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 183
;180:}
;181:
;182:int	LongNoSwap (int l)
;183:{
line 184
;184:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $62
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 188
;185:}
;186:
;187:qint64 Long64Swap (qint64 ll)
;188:{
line 191
;189:	qint64	result;
;190:
;191:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 192
;192:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 193
;193:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 194
;194:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 195
;195:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 196
;196:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 197
;197:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 198
;198:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 200
;199:
;200:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $63
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 204
;201:}
;202:
;203:qint64 Long64NoSwap (qint64 ll)
;204:{
line 205
;205:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $72
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 8 4
line 213
;206:}
;207:
;208:typedef union {
;209:    float	f;
;210:    unsigned int i;
;211:} _FloatByteUnion;
;212:
;213:float FloatSwap (const float *f) {
line 216
;214:	_FloatByteUnion out;
;215:
;216:	out.f = *f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 217
;217:	out.i = LongSwap(out.i);
ADDRLP4 0
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 4
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 219
;218:
;219:	return out.f;
ADDRLP4 0
INDIRF4
RETF4
LABELV $75
endproc FloatSwap 8 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 223
;220:}
;221:
;222:float FloatNoSwap (const float *f)
;223:{
line 224
;224:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $76
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 277
;225:}
;226:
;227:/*
;228:================
;229:Swap_Init
;230:================
;231:*/
;232:/*
;233:void Swap_Init (void)
;234:{
;235:	byte	swaptest[2] = {1,0};
;236:
;237:// set the byte swapping variables in a portable manner	
;238:	if ( *(short *)swaptest == 1)
;239:	{
;240:		_BigShort = ShortSwap;
;241:		_LittleShort = ShortNoSwap;
;242:		_BigLong = LongSwap;
;243:		_LittleLong = LongNoSwap;
;244:		_BigLong64 = Long64Swap;
;245:		_LittleLong64 = Long64NoSwap;
;246:		_BigFloat = FloatSwap;
;247:		_LittleFloat = FloatNoSwap;
;248:	}
;249:	else
;250:	{
;251:		_BigShort = ShortNoSwap;
;252:		_LittleShort = ShortSwap;
;253:		_BigLong = LongNoSwap;
;254:		_LittleLong = LongSwap;
;255:		_BigLong64 = Long64NoSwap;
;256:		_LittleLong64 = Long64Swap;
;257:		_BigFloat = FloatNoSwap;
;258:		_LittleFloat = FloatSwap;
;259:	}
;260:
;261:}
;262:*/
;263:
;264:/*
;265:============================================================================
;266:
;267:PARSING
;268:
;269:============================================================================
;270:*/
;271:
;272:static	char	com_token[MAX_TOKEN_CHARS];
;273:static	char	com_parsename[MAX_TOKEN_CHARS];
;274:static	int		com_lines;
;275:
;276:void COM_BeginParseSession( const char *name )
;277:{
line 278
;278:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 279
;279:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $78
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 280
;280:}
LABELV $77
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 283
;281:
;282:int COM_GetCurrentParseLine( void )
;283:{
line 284
;284:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $79
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 288
;285:}
;286:
;287:char *COM_Parse( char **data_p )
;288:{
line 289
;289:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $80
endproc COM_Parse 4 8
bss
align 1
LABELV $82
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 293
;290:}
;291:
;292:void COM_ParseError( char *format, ... )
;293:{
line 297
;294:	va_list argptr;
;295:	static char string[4096];
;296:
;297:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 298
;298:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $82
ARGP4
CNSTI4 4096
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
line 299
;299:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 301
;300:
;301:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $84
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $82
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 302
;302:}
LABELV $81
endproc COM_ParseError 4 16
bss
align 1
LABELV $86
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 305
;303:
;304:void COM_ParseWarning( char *format, ... )
;305:{
line 309
;306:	va_list argptr;
;307:	static char string[4096];
;308:
;309:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 310
;310:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $86
ARGP4
CNSTI4 4096
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
line 311
;311:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 313
;312:
;313:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $88
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $86
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 314
;314:}
LABELV $85
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 328
;315:
;316:/*
;317:==============
;318:COM_Parse
;319:
;320:Parse a token out of a string
;321:Will never return NULL, just empty strings
;322:
;323:If "allowLineBreaks" is qtrue then an empty
;324:string will be returned if the next token is
;325:a newline.
;326:==============
;327:*/
;328:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $91
JUMPV
LABELV $90
line 331
;329:	int c;
;330:
;331:	while( (c = *data) <= ' ') {
line 332
;332:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $93
line 333
;333:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $89
JUMPV
LABELV $93
line 335
;334:		}
;335:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $95
line 336
;336:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 337
;337:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 338
;338:		}
LABELV $95
line 339
;339:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 340
;340:	}
LABELV $91
line 331
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $90
line 342
;341:
;342:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $89
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 345
;343:}
;344:
;345:int COM_Compress( char *data_p ) {
line 348
;346:	char *in, *out;
;347:	int c;
;348:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 350
;349:
;350:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 351
;351:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
ADDRGP4 $101
JUMPV
LABELV $100
line 352
;352:		while ((c = *in) != 0) {
line 354
;353:			// skip double slash comments
;354:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $103
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $103
ADDRGP4 $106
JUMPV
LABELV $105
line 355
;355:				while (*in && *in != '\n') {
line 356
;356:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 357
;357:				}
LABELV $106
line 355
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $108
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $105
LABELV $108
line 359
;358:			// skip /* */ comments
;359:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $109
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $109
ADDRGP4 $112
JUMPV
LABELV $111
line 361
;360:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;361:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $112
line 360
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $114
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $111
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $111
LABELV $114
line 362
;362:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $110
line 363
;363:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 365
;364:                        // record when we hit a newline
;365:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $110
JUMPV
LABELV $109
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $119
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $117
LABELV $119
line 366
;366:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 367
;367:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 369
;368:                        // record when we hit whitespace
;369:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $118
JUMPV
LABELV $117
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $122
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $120
LABELV $122
line 370
;370:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 371
;371:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 373
;372:                        // an actual token
;373:			} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 375
;374:                            // if we have a pending newline, emit it (and it counts as whitespace)
;375:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $123
line 376
;376:                                *out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 377
;377:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 378
;378:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 379
;379:                            } if (whitespace) {
LABELV $123
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $125
line 380
;380:                                *out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 381
;381:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 382
;382:                            }
LABELV $125
line 385
;383:                            
;384:                            // copy quoted strings unmolested
;385:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $127
line 386
;386:                                    *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 387
;387:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $130
JUMPV
LABELV $129
line 388
;388:                                    while (1) {
line 389
;389:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 390
;390:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $131
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $131
line 391
;391:                                            *out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 392
;392:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 393
;393:                                        } else {
line 394
;394:                                            break;
LABELV $133
line 396
;395:                                        }
;396:                                    }
LABELV $130
line 388
ADDRGP4 $129
JUMPV
LABELV $131
line 397
;397:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $128
line 398
;398:                                        *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 399
;399:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 400
;400:                                    }
line 401
;401:                            } else {
ADDRGP4 $128
JUMPV
LABELV $127
line 402
;402:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 403
;403:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 404
;404:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 405
;405:                            }
LABELV $128
line 406
;406:			}
LABELV $121
LABELV $118
LABELV $110
LABELV $104
line 407
;407:		}
LABELV $101
line 352
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $100
line 408
;408:            *out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 409
;409:            return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
ADDRGP4 $97
JUMPV
LABELV $98
line 411
;410:	}
;411:        return 0;
CNSTI4 0
RETI4
LABELV $97
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 415
;412:}
;413:
;414:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;415:{
line 416
;416:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 417
;417:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 420
;418:	char *data;
;419:
;420:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 421
;421:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 422
;422:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 425
;423:
;424:	// make sure incoming data is valid
;425:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 426
;426:	{
line 427
;427:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 428
;428:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $136
JUMPV
LABELV $139
line 432
;429:	}
;430:
;431:	while ( 1 )
;432:	{
line 434
;433:		// skip whitespace
;434:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 435
;435:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
line 436
;436:		{
line 437
;437:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 438
;438:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $136
JUMPV
LABELV $142
line 440
;439:		}
;440:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $144
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $144
line 441
;441:		{
line 442
;442:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 443
;443:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $136
JUMPV
LABELV $144
line 446
;444:		}
;445:
;446:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 449
;447:
;448:		// skip double slash comments
;449:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $146
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $146
line 450
;450:		{
line 451
;451:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $149
JUMPV
LABELV $148
line 452
;452:			while (*data && *data != '\n') {
line 453
;453:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 454
;454:			}
LABELV $149
line 452
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $151
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $148
LABELV $151
line 455
;455:		}
ADDRGP4 $147
JUMPV
LABELV $146
line 457
;456:		// skip /* */ comments
;457:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $141
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $141
line 458
;458:		{
line 459
;459:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $155
JUMPV
LABELV $154
line 461
;460:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;461:			{
line 462
;462:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 463
;463:			}
LABELV $155
line 460
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $157
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $154
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $154
LABELV $157
line 464
;464:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $153
line 465
;465:			{
line 466
;466:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 467
;467:			}
line 468
;468:		}
line 470
;469:		else
;470:		{
line 471
;471:			break;
LABELV $153
LABELV $147
line 473
;472:		}
;473:	}
LABELV $140
line 431
ADDRGP4 $139
JUMPV
LABELV $141
line 476
;474:
;475:	// handle quoted strings
;476:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $160
line 477
;477:	{
line 478
;478:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $163
JUMPV
LABELV $162
line 480
;479:		while (1)
;480:		{
line 481
;481:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 482
;482:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $167
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $165
LABELV $167
line 483
;483:			{
line 484
;484:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 485
;485:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 486
;486:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $136
JUMPV
LABELV $165
line 488
;487:			}
;488:			if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $168
line 489
;489:			{
line 490
;490:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 491
;491:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 492
;492:			}
LABELV $168
line 493
;493:		}
LABELV $163
line 479
ADDRGP4 $162
JUMPV
line 494
;494:	}
LABELV $160
LABELV $170
line 498
;495:
;496:	// parse a regular word
;497:	do
;498:	{
line 499
;499:		if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $173
line 500
;500:		{
line 501
;501:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 502
;502:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 503
;503:		}
LABELV $173
line 504
;504:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 505
;505:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 506
;506:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $175
line 507
;507:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
line 508
;508:	} while (c>32);
LABELV $171
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $170
line 510
;509:
;510:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 512
;511:
;512:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 513
;513:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $136
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 577
;514:}
;515:
;516:
;517:#if 0
;518:// no longer used
;519:/*
;520:===============
;521:COM_ParseInfos
;522:===============
;523:*/
;524:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;525:	char	*token;
;526:	int		count;
;527:	char	key[MAX_TOKEN_CHARS];
;528:
;529:	count = 0;
;530:
;531:	while ( 1 ) {
;532:		token = COM_Parse( &buf );
;533:		if ( !token[0] ) {
;534:			break;
;535:		}
;536:		if ( strcmp( token, "{" ) ) {
;537:			Com_Printf( "Missing { in info file\n" );
;538:			break;
;539:		}
;540:
;541:		if ( count == max ) {
;542:			Com_Printf( "Max infos exceeded\n" );
;543:			break;
;544:		}
;545:
;546:		infos[count][0] = 0;
;547:		while ( 1 ) {
;548:			token = COM_ParseExt( &buf, qtrue );
;549:			if ( !token[0] ) {
;550:				Com_Printf( "Unexpected end of info file\n" );
;551:				break;
;552:			}
;553:			if ( !strcmp( token, "}" ) ) {
;554:				break;
;555:			}
;556:			Q_strncpyz( key, token, sizeof( key ) );
;557:
;558:			token = COM_ParseExt( &buf, qfalse );
;559:			if ( !token[0] ) {
;560:				strcpy( token, "<NULL>" );
;561:			}
;562:			Info_SetValueForKey( infos[count], key, token );
;563:		}
;564:		count++;
;565:	}
;566:
;567:	return count;
;568:}
;569:#endif
;570:
;571:
;572:/*
;573:==================
;574:COM_MatchToken
;575:==================
;576:*/
;577:void COM_MatchToken( char **buf_p, char *match ) {
line 580
;578:	char	*token;
;579:
;580:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 581
;581:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $178
line 582
;582:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $180
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 583
;583:	}
LABELV $178
line 584
;584:}
LABELV $177
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 596
;585:
;586:
;587:/*
;588:=================
;589:SkipBracedSection
;590:
;591:The next token should be an open brace.
;592:Skips until a matching close brace is found.
;593:Internal brace depths are properly skipped.
;594:=================
;595:*/
;596:void SkipBracedSection (char **program) {
line 600
;597:	char			*token;
;598:	int				depth;
;599:
;600:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $182
line 601
;601:	do {
line 602
;602:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 603
;603:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $185
line 604
;604:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $187
line 605
;605:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 606
;606:			}
ADDRGP4 $188
JUMPV
LABELV $187
line 607
;607:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $189
line 608
;608:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 609
;609:			}
LABELV $189
LABELV $188
line 610
;610:		}
LABELV $185
line 611
;611:	} while( depth && *program );
LABELV $183
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $182
LABELV $191
line 612
;612:}
LABELV $181
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 619
;613:
;614:/*
;615:=================
;616:SkipRestOfLine
;617:=================
;618:*/
;619:void SkipRestOfLine ( char **data ) {
line 623
;620:	char	*p;
;621:	int		c;
;622:
;623:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 624
;624:	while ( (c = *p++) != 0 ) {
line 625
;625:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $196
line 626
;626:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 627
;627:			break;
ADDRGP4 $195
JUMPV
LABELV $196
line 629
;628:		}
;629:	}
LABELV $194
line 624
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $193
LABELV $195
line 631
;630:
;631:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 632
;632:}
LABELV $192
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 635
;633:
;634:
;635:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 639
;636:	char	*token;
;637:	int		i;
;638:
;639:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 641
;640:
;641:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $200
line 642
;642:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 643
;643:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 644
;644:	}
LABELV $201
line 641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $203
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $200
line 646
;645:
;646:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 647
;647:}
LABELV $198
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 649
;648:
;649:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 652
;650:	int		i;
;651:
;652:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 654
;653:
;654:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 655
;655:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 656
;656:	}
LABELV $207
line 654
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $206
line 658
;657:
;658:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 659
;659:}
LABELV $205
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 661
;660:
;661:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 664
;662:	int		i;
;663:
;664:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 666
;665:
;666:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 667
;667:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 668
;668:	}
LABELV $212
line 666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $211
line 670
;669:
;670:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 671
;671:}
LABELV $210
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 683
;672:
;673:
;674:/*
;675:============================================================================
;676:
;677:					LIBRARY REPLACEMENT FUNCTIONS
;678:
;679:============================================================================
;680:*/
;681:
;682:int Q_isprint( int c )
;683:{
line 684
;684:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $216
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $216
line 685
;685:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $215
JUMPV
LABELV $216
line 686
;686:	return ( 0 );
CNSTI4 0
RETI4
LABELV $215
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 690
;687:}
;688:
;689:int Q_islower( int c )
;690:{
line 691
;691:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $219
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $219
line 692
;692:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $218
JUMPV
LABELV $219
line 693
;693:	return ( 0 );
CNSTI4 0
RETI4
LABELV $218
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 697
;694:}
;695:
;696:int Q_isupper( int c )
;697:{
line 698
;698:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $222
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $222
line 699
;699:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $221
JUMPV
LABELV $222
line 700
;700:	return ( 0 );
CNSTI4 0
RETI4
LABELV $221
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 704
;701:}
;702:
;703:int Q_isalpha( int c )
;704:{
line 705
;705:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $228
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $227
LABELV $228
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $225
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $225
LABELV $227
line 706
;706:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $224
JUMPV
LABELV $225
line 707
;707:	return ( 0 );
CNSTI4 0
RETI4
LABELV $224
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 711
;708:}
;709:
;710:char* Q_strrchr( const char* string, int c )
;711:{
line 712
;712:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 714
;713:	char *s;
;714:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 716
;715:
;716:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $231
JUMPV
LABELV $230
line 719
;717:
;718:	while (*s)
;719:	{
line 720
;720:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $233
line 721
;721:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $233
line 722
;722:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 723
;723:	}
LABELV $231
line 718
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 724
;724:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $235
line 725
;725:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $235
line 727
;726:
;727:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $229
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 737
;728:}
;729:
;730:/*
;731:=============
;732:Q_strncpyz
;733: 
;734:Safe strncpy that ensures a trailing zero
;735:=============
;736:*/
;737:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 738
;738:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $238
line 739
;739:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $240
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 740
;740:  }
LABELV $238
line 741
;741:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 742
;742:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $243
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 743
;743:	}
LABELV $241
line 744
;744:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $244
line 745
;745:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $246
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 746
;746:	}
LABELV $244
line 748
;747:
;748:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 749
;749:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 750
;750:}
LABELV $237
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 752
;751:                 
;752:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 755
;753:	int		c1, c2;
;754:
;755:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $248
line 756
;756:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $250
line 757
;757:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $247
JUMPV
LABELV $250
line 759
;758:           else
;759:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $247
JUMPV
LABELV $248
line 761
;760:        }
;761:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $252
line 762
;762:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $247
JUMPV
LABELV $252
LABELV $254
line 766
;763:
;764:
;765:	
;766:	do {
line 767
;767:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 768
;768:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 770
;769:
;770:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $257
line 771
;771:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $247
JUMPV
LABELV $257
line 774
;772:		}
;773:		
;774:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $259
line 775
;775:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $261
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $261
line 776
;776:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 777
;777:			}
LABELV $261
line 778
;778:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $263
line 779
;779:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 780
;780:			}
LABELV $263
line 781
;781:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $265
line 782
;782:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $268
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $268
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $269
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $247
JUMPV
LABELV $265
line 784
;783:			}
;784:		}
LABELV $259
line 785
;785:	} while (c1);
LABELV $255
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $254
line 787
;786:	
;787:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $247
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 790
;788:}
;789:
;790:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $271
line 793
;791:	int		c1, c2;
;792:	
;793:	do {
line 794
;794:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 795
;795:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 797
;796:
;797:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $274
line 798
;798:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $270
JUMPV
LABELV $274
line 801
;799:		}
;800:		
;801:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $276
line 802
;802:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $279
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $279
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $280
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $270
JUMPV
LABELV $276
line 804
;803:		}
;804:	} while (c1);
LABELV $272
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $271
line 806
;805:	
;806:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $270
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 809
;807:}
;808:
;809:int Q_stricmp (const char *s1, const char *s2) {
line 810
;810:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $283
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $283
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $283
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
RETI4
LABELV $281
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 814
;811:}
;812:
;813:
;814:char *Q_strlwr( char *s1 ) {
line 817
;815:    char	*s;
;816:
;817:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $287
JUMPV
LABELV $286
line 818
;818:	while ( *s ) {
line 819
;819:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 820
;820:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 821
;821:	}
LABELV $287
line 818
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $286
line 822
;822:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $285
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 825
;823:}
;824:
;825:char *Q_strupr( char *s1 ) {
line 828
;826:    char	*s;
;827:
;828:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $291
JUMPV
LABELV $290
line 829
;829:	while ( *s ) {
line 830
;830:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 831
;831:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 832
;832:	}
LABELV $291
line 829
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $290
line 833
;833:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $289
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 838
;834:}
;835:
;836:
;837:// never goes past bounds or leaves without a terminating 0
;838:void Q_strcat( char *dest, int size, const char *src ) {
line 841
;839:	int		l1;
;840:
;841:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 842
;842:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $294
line 843
;843:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $296
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 844
;844:	}
LABELV $294
line 845
;845:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 846
;846:}
LABELV $293
endproc Q_strcat 12 12
export Q_stristr
proc Q_stristr 36 12
line 852
;847:
;848:/*
;849:* Find the first occurrence of find in s.
;850:*/
;851:const char *Q_stristr( const char *s, const char *find)
;852:{
line 856
;853:  char c, sc;
;854:  size_t len;
;855:
;856:  if ((c = *find++) != 0)
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 1
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $298
line 857
;857:  {
line 858
;858:    if (c >= 'a' && c <= 'z')
ADDRLP4 16
ADDRLP4 1
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $300
ADDRLP4 16
INDIRI4
CNSTI4 122
GTI4 $300
line 859
;859:    {
line 860
;860:      c -= ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 861
;861:    }
LABELV $300
line 862
;862:    len = strlen(find);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $302
line 864
;863:    do
;864:    {
LABELV $305
line 866
;865:      do
;866:      {
line 867
;867:        if ((sc = *s++) == 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 28
INDIRI1
ASGNI1
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $308
line 868
;868:          return NULL;
CNSTP4 0
RETP4
ADDRGP4 $297
JUMPV
LABELV $308
line 869
;869:        if (sc >= 'a' && sc <= 'z')
ADDRLP4 32
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
LTI4 $310
ADDRLP4 32
INDIRI4
CNSTI4 122
GTI4 $310
line 870
;870:        {
line 871
;871:          sc -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 872
;872:        }
LABELV $310
line 873
;873:      } while (sc != c);
LABELV $306
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 1
INDIRI1
CVII4 1
NEI4 $305
line 874
;874:    } while (Q_stricmpn(s, find, len) != 0);
LABELV $303
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $302
line 875
;875:    s--;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 876
;876:  }
LABELV $298
line 877
;877:  return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $297
endproc Q_stristr 36 12
export Q_PrintStrlen
proc Q_PrintStrlen 16 0
line 881
;878:}
;879:
;880:
;881:int Q_PrintStrlen( const char *string ) {
line 885
;882:	int			len;
;883:	const char	*p;
;884:
;885:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $313
line 886
;886:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $312
JUMPV
LABELV $313
line 889
;887:	}
;888:
;889:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 890
;890:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $316
JUMPV
LABELV $315
line 891
;891:	while( *p ) {
line 892
;892:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $318
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $318
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $318
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $318
ADDRLP4 12
INDIRI4
CNSTI4 56
GTI4 $318
line 893
;893:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 894
;894:			continue;
ADDRGP4 $316
JUMPV
LABELV $318
line 896
;895:		}
;896:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 897
;897:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 898
;898:	}
LABELV $316
line 891
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $315
line 900
;899:
;900:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $312
endproc Q_PrintStrlen 16 0
export Q_CleanStr
proc Q_CleanStr 32 4
line 904
;901:}
;902:
;903:
;904:char *Q_CleanStr( char *string ) {
line 908
;905:	char*	d;
;906:	char*	s;
;907:	int		c;
;908:        qboolean hadColor = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 910
;909:
;910:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 911
;911:	d = string;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $322
JUMPV
LABELV $321
line 912
;912:	while ((c = *s) != 0 ) {
line 913
;913:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $324
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $324
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $324
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $324
ADDRLP4 20
INDIRI4
CNSTI4 56
GTI4 $324
line 914
;914:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 915
;915:                        hadColor = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 916
;916:		}
ADDRGP4 $325
JUMPV
LABELV $324
line 917
;917:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $326
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $326
line 918
;918:			*d++ = c;
ADDRLP4 28
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 919
;919:		}
LABELV $326
LABELV $325
line 920
;920:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 921
;921:	}
LABELV $322
line 912
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $321
line 922
;922:	*d = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 923
;923:        if(hadColor)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $328
line 924
;924:            return Q_CleanStr( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
RETP4
ADDRGP4 $320
JUMPV
LABELV $328
line 926
;925:        else
;926:            return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $320
endproc Q_CleanStr 32 4
export Q_CountChar
proc Q_CountChar 4 0
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 930
;927:}
;928:
;929:int Q_CountChar(const char *string, char tocount)
;930:{
line 933
;931:	int count;
;932:	
;933:	for(count = 0; *string; string++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $331
line 934
;934:	{
line 935
;935:		if(*string == tocount)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $335
line 936
;936:			count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $335
line 937
;937:	}
LABELV $332
line 933
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $334
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $331
line 939
;938:	
;939:	return count;
ADDRLP4 0
INDIRI4
RETI4
LABELV $330
endproc Q_CountChar 4 0
export Com_sprintf
proc Com_sprintf 32012 16
line 942
;940:}
;941:
;942:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 947
;943:	int		len;
;944:	va_list		argptr;
;945:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;946:
;947:	va_start (argptr,fmt);
ADDRLP4 32004
ADDRFP4 8+4
ASGNP4
line 948
;948:	len = Q_vsnprintf (bigbuffer, sizeof(bigbuffer), fmt,argptr);
ADDRLP4 0
ARGP4
CNSTI4 32000
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32004
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 Q_vsnprintf
CALLI4
ASGNI4
ADDRLP4 32000
ADDRLP4 32008
INDIRI4
ASGNI4
line 949
;949:	va_end (argptr);
ADDRLP4 32004
CNSTP4 0
ASGNP4
line 950
;950:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 32000
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $339
line 951
;951:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $341
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 952
;952:	}
LABELV $339
line 953
;953:	if (len >= size) {
ADDRLP4 32000
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $342
line 954
;954:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $344
ARGP4
ADDRLP4 32000
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 960
;955:#ifdef	_DEBUG
;956:		__asm {
;957:			int 3;
;958:		}
;959:#endif
;960:	}
LABELV $342
line 961
;961:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 962
;962:}
LABELV $337
endproc Com_sprintf 32012 16
bss
align 1
LABELV $346
skip 64000
data
align 4
LABELV $347
byte 4 0
export va
code
proc va 12 16
line 973
;963:
;964:
;965:/*
;966:============
;967:va
;968:
;969:does a varargs printf into a temp buffer, so I don't need to have
;970:varargs versions of all text functions.
;971:============
;972:*/
;973:char	* QDECL va( char *format, ... ) {
line 979
;974:	va_list		argptr;
;975:	static char string[2][32000]; // in case va is called by nested functions
;976:	static int	index = 0;
;977:	char		*buf;
;978:
;979:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $347
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $346
ADDP4
ASGNP4
line 980
;980:	index++;
ADDRLP4 8
ADDRGP4 $347
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 982
;981:
;982:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 983
;983:	Q_vsnprintf (buf, sizeof(*string), format, argptr);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32000
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
line 984
;984:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 986
;985:
;986:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $345
endproc va 12 16
export Com_TruncateLongString
proc Com_TruncateLongString 8 12
line 997
;987:}
;988:
;989:/*
;990:============
;991:Com_TruncateLongString
;992:
;993:Assumes buffer is atleast TRUNCATE_LENGTH big
;994:============
;995:*/
;996:void Com_TruncateLongString( char *buffer, const char *s )
;997:{
line 998
;998:	int length = strlen( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1000
;999:
;1000:	if( length <= TRUNCATE_LENGTH )
ADDRLP4 0
INDIRI4
CNSTI4 64
GTI4 $350
line 1001
;1001:		Q_strncpyz( buffer, s, TRUNCATE_LENGTH );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $351
JUMPV
LABELV $350
line 1003
;1002:	else
;1003:	{
line 1004
;1004:		Q_strncpyz( buffer, s, ( TRUNCATE_LENGTH / 2 ) - 3 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 29
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1005
;1005:		Q_strcat( buffer, TRUNCATE_LENGTH, " ... " );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $352
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1006
;1006:		Q_strcat( buffer, TRUNCATE_LENGTH, s + length - ( TRUNCATE_LENGTH / 2 ) + 3 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 -29
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1007
;1007:	}
LABELV $351
line 1008
;1008:}
LABELV $349
endproc Com_TruncateLongString 8 12
bss
align 1
LABELV $354
skip 16384
data
align 4
LABELV $355
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1027
;1009:
;1010:/*
;1011:=====================================================================
;1012:
;1013:  INFO STRINGS
;1014:
;1015:=====================================================================
;1016:*/
;1017:
;1018:/*
;1019:===============
;1020:Info_ValueForKey
;1021:
;1022:Searches the string for the given
;1023:key and returns the associated value, or an empty string.
;1024:FIXME: overflow check?
;1025:===============
;1026:*/
;1027:char *Info_ValueForKey( const char *s, const char *key ) {
line 1034
;1028:	char	pkey[BIG_INFO_KEY];
;1029:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1030:											// work without stomping on each other
;1031:	static	int	valueindex = 0;
;1032:	char	*o;
;1033:	
;1034:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $358
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $356
LABELV $358
line 1035
;1035:		return "";
ADDRGP4 $41
RETP4
ADDRGP4 $353
JUMPV
LABELV $356
line 1038
;1036:	}
;1037:
;1038:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $359
line 1039
;1039:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $361
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1040
;1040:	}
LABELV $359
line 1042
;1041:
;1042:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $355
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1043
;1043:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $365
line 1044
;1044:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $365
JUMPV
LABELV $364
line 1046
;1045:	while (1)
;1046:	{
line 1047
;1047:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $367
line 1049
;1048:		while (*s != '\\')
;1049:		{
line 1050
;1050:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $370
line 1051
;1051:				return "";
ADDRGP4 $41
RETP4
ADDRGP4 $353
JUMPV
LABELV $370
line 1052
;1052:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1053
;1053:		}
LABELV $368
line 1048
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $367
line 1054
;1054:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1055
;1055:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1057
;1056:
;1057:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $355
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $354
ADDP4
ASGNP4
ADDRGP4 $373
JUMPV
LABELV $372
line 1060
;1058:
;1059:		while (*s != '\\' && *s)
;1060:		{
line 1061
;1061:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1062
;1062:		}
LABELV $373
line 1059
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $375
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $372
LABELV $375
line 1063
;1063:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1065
;1064:
;1065:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $376
line 1066
;1066:			return value[valueindex];
ADDRGP4 $355
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $354
ADDP4
RETP4
ADDRGP4 $353
JUMPV
LABELV $376
line 1068
;1067:
;1068:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 1069
;1069:			break;
ADDRGP4 $366
JUMPV
LABELV $378
line 1070
;1070:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1071
;1071:	}
LABELV $365
line 1045
ADDRGP4 $364
JUMPV
LABELV $366
line 1073
;1072:
;1073:	return "";
ADDRGP4 $41
RETP4
LABELV $353
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1084
;1074:}
;1075:
;1076:
;1077:/*
;1078:===================
;1079:Info_NextPair
;1080:
;1081:Used to itterate through all the key/value pairs in an info string
;1082:===================
;1083:*/
;1084:void Info_NextPair( const char **head, char *key, char *value ) {
line 1088
;1085:	char	*o;
;1086:	const char	*s;
;1087:
;1088:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1090
;1089:
;1090:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $381
line 1091
;1091:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1092
;1092:	}
LABELV $381
line 1093
;1093:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1094
;1094:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1096
;1095:
;1096:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $384
JUMPV
LABELV $383
line 1097
;1097:	while ( *s != '\\' ) {
line 1098
;1098:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $386
line 1099
;1099:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1100
;1100:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1101
;1101:			return;
ADDRGP4 $380
JUMPV
LABELV $386
line 1103
;1102:		}
;1103:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1104
;1104:	}
LABELV $384
line 1097
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $383
line 1105
;1105:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1106
;1106:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1108
;1107:
;1108:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $389
JUMPV
LABELV $388
line 1109
;1109:	while ( *s != '\\' && *s ) {
line 1110
;1110:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1111
;1111:	}
LABELV $389
line 1109
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $391
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $388
LABELV $391
line 1112
;1112:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1114
;1113:
;1114:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1115
;1115:}
LABELV $380
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 12
line 1123
;1116:
;1117:
;1118:/*
;1119:===================
;1120:Info_RemoveKey
;1121:===================
;1122:*/
;1123:void Info_RemoveKey( char *s, const char *key ) {
line 1129
;1124:	char	*start;
;1125:	char	pkey[MAX_INFO_KEY];
;1126:	char	value[MAX_INFO_VALUE];
;1127:	char	*o;
;1128:
;1129:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $393
line 1130
;1130:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $395
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1131
;1131:	}
LABELV $393
line 1133
;1132:
;1133:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $399
line 1134
;1134:		return;
ADDRGP4 $392
JUMPV
LABELV $398
line 1138
;1135:	}
;1136:
;1137:	while (1)
;1138:	{
line 1139
;1139:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1140
;1140:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $401
line 1141
;1141:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $401
line 1142
;1142:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $404
JUMPV
LABELV $403
line 1144
;1143:		while (*s != '\\')
;1144:		{
line 1145
;1145:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $406
line 1146
;1146:				return;
ADDRGP4 $392
JUMPV
LABELV $406
line 1147
;1147:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1148
;1148:		}
LABELV $404
line 1143
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $403
line 1149
;1149:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1150
;1150:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1152
;1151:
;1152:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $409
JUMPV
LABELV $408
line 1154
;1153:		while (*s != '\\' && *s)
;1154:		{
line 1155
;1155:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $411
line 1156
;1156:				return;
ADDRGP4 $392
JUMPV
LABELV $411
line 1157
;1157:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1158
;1158:		}
LABELV $409
line 1153
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $413
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $408
LABELV $413
line 1159
;1159:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1161
;1160:
;1161:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $414
line 1162
;1162:		{
line 1163
;1163:			memmove(start, s, strlen(s) + 1); // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1165
;1164:			
;1165:			return;
ADDRGP4 $392
JUMPV
LABELV $414
line 1168
;1166:		}
;1167:
;1168:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $416
line 1169
;1169:			return;
ADDRGP4 $392
JUMPV
LABELV $416
line 1170
;1170:	}
LABELV $399
line 1137
ADDRGP4 $398
JUMPV
line 1172
;1171:
;1172:}
LABELV $392
endproc Info_RemoveKey 2076 12
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1179
;1173:
;1174:/*
;1175:===================
;1176:Info_RemoveKey_Big
;1177:===================
;1178:*/
;1179:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1185
;1180:	char	*start;
;1181:	char	pkey[BIG_INFO_KEY];
;1182:	char	value[BIG_INFO_VALUE];
;1183:	char	*o;
;1184:
;1185:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $419
line 1186
;1186:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $421
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1187
;1187:	}
LABELV $419
line 1189
;1188:
;1189:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $425
line 1190
;1190:		return;
ADDRGP4 $418
JUMPV
LABELV $424
line 1194
;1191:	}
;1192:
;1193:	while (1)
;1194:	{
line 1195
;1195:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1196
;1196:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $427
line 1197
;1197:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $427
line 1198
;1198:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $430
JUMPV
LABELV $429
line 1200
;1199:		while (*s != '\\')
;1200:		{
line 1201
;1201:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $432
line 1202
;1202:				return;
ADDRGP4 $418
JUMPV
LABELV $432
line 1203
;1203:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1204
;1204:		}
LABELV $430
line 1199
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $429
line 1205
;1205:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1206
;1206:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1208
;1207:
;1208:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $434
line 1210
;1209:		while (*s != '\\' && *s)
;1210:		{
line 1211
;1211:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $437
line 1212
;1212:				return;
ADDRGP4 $418
JUMPV
LABELV $437
line 1213
;1213:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1214
;1214:		}
LABELV $435
line 1209
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $439
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $434
LABELV $439
line 1215
;1215:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1217
;1216:
;1217:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $440
line 1218
;1218:		{
line 1219
;1219:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1220
;1220:			return;
ADDRGP4 $418
JUMPV
LABELV $440
line 1223
;1221:		}
;1222:
;1223:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $442
line 1224
;1224:			return;
ADDRGP4 $418
JUMPV
LABELV $442
line 1225
;1225:	}
LABELV $425
line 1193
ADDRGP4 $424
JUMPV
line 1227
;1226:
;1227:}
LABELV $418
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1240
;1228:
;1229:
;1230:
;1231:
;1232:/*
;1233:==================
;1234:Info_Validate
;1235:
;1236:Some characters are illegal in info strings because they
;1237:can mess up the server's parsing
;1238:==================
;1239:*/
;1240:qboolean Info_Validate( const char *s ) {
line 1241
;1241:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
line 1242
;1242:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $444
JUMPV
LABELV $445
line 1244
;1243:	}
;1244:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
line 1245
;1245:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $444
JUMPV
LABELV $447
line 1247
;1246:	}
;1247:	return qtrue;
CNSTI4 1
RETI4
LABELV $444
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1048 20
line 1257
;1248:}
;1249:
;1250:/*
;1251:==================
;1252:Info_SetValueForKey
;1253:
;1254:Changes or adds a key/value pair
;1255:==================
;1256:*/
;1257:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1259
;1258:	char	newi[MAX_INFO_STRING];
;1259:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $450
ASGNP4
line 1261
;1260:
;1261:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1024
LTI4 $457
line 1262
;1262:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $453
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1263
;1263:	}
line 1265
;1264:
;1265:	for(; *blacklist; ++blacklist)
ADDRGP4 $457
JUMPV
LABELV $454
line 1266
;1266:	{
line 1267
;1267:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $460
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
LABELV $460
line 1268
;1268:		{
line 1269
;1269:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $461
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1270
;1270:			return;
ADDRGP4 $449
JUMPV
LABELV $458
line 1272
;1271:		}
;1272:	}
LABELV $455
line 1265
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $457
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $454
line 1274
;1273:	
;1274:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1275
;1275:	if (!value || !strlen(value))
ADDRLP4 1032
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $464
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $462
LABELV $464
line 1276
;1276:		return;
ADDRGP4 $449
JUMPV
LABELV $462
line 1278
;1277:
;1278:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $465
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1280
;1279:
;1280:	if (strlen(newi) + strlen(s) >= MAX_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $466
line 1281
;1281:	{
line 1282
;1282:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $468
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1283
;1283:		return;
ADDRGP4 $449
JUMPV
LABELV $466
line 1286
;1284:	}
;1285:
;1286:	strcat (newi, s);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1287
;1287:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1288
;1288:}
LABELV $449
endproc Info_SetValueForKey 1048 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8216 20
line 1297
;1289:
;1290:/*
;1291:==================
;1292:Info_SetValueForKey_Big
;1293:
;1294:Changes or adds a key/value pair
;1295:==================
;1296:*/
;1297:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1299
;1298:	char	newi[BIG_INFO_STRING];
;1299:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $450
ASGNP4
line 1301
;1300:
;1301:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8196
INDIRI4
CNSTI4 8192
LTI4 $475
line 1302
;1302:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $453
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1303
;1303:	}
line 1305
;1304:
;1305:	for(; *blacklist; ++blacklist)
ADDRGP4 $475
JUMPV
LABELV $472
line 1306
;1306:	{
line 1307
;1307:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $478
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $476
LABELV $478
line 1308
;1308:		{
line 1309
;1309:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $461
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1310
;1310:			return;
ADDRGP4 $469
JUMPV
LABELV $476
line 1312
;1311:		}
;1312:	}
LABELV $473
line 1305
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $475
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $472
line 1314
;1313:
;1314:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1315
;1315:	if (!value || !strlen(value))
ADDRLP4 8200
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
ADDRLP4 8200
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8204
INDIRI4
CNSTI4 0
NEI4 $479
LABELV $481
line 1316
;1316:		return;
ADDRGP4 $469
JUMPV
LABELV $479
line 1318
;1317:
;1318:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $465
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1320
;1319:
;1320:	if (strlen(newi) + strlen(s) >= BIG_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 8208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $482
line 1321
;1321:	{
line 1322
;1322:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $484
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1323
;1323:		return;
ADDRGP4 $469
JUMPV
LABELV $482
line 1326
;1324:	}
;1325:
;1326:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1327
;1327:}
LABELV $469
endproc Info_SetValueForKey_Big 8216 20
proc Com_CharIsOneOfCharset 8 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 1340
;1328:
;1329:
;1330:
;1331:
;1332://====================================================================
;1333:
;1334:/*
;1335:==================
;1336:Com_CharIsOneOfCharset
;1337:==================
;1338:*/
;1339:static qboolean Com_CharIsOneOfCharset( char c, char *set )
;1340:{
line 1343
;1341:	int i;
;1342:
;1343:	for( i = 0; i < strlen( set ); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $489
JUMPV
LABELV $486
line 1344
;1344:	{
line 1345
;1345:		if( set[ i ] == c )
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRI1
CVII4 1
NEI4 $490
line 1346
;1346:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $485
JUMPV
LABELV $490
line 1347
;1347:	}
LABELV $487
line 1343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $489
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $486
line 1349
;1348:
;1349:	return qfalse;
CNSTI4 0
RETI4
LABELV $485
endproc Com_CharIsOneOfCharset 8 4
export Com_SkipCharset
proc Com_SkipCharset 8 8
line 1358
;1350:}
;1351:
;1352:/*
;1353:==================
;1354:Com_SkipCharset
;1355:==================
;1356:*/
;1357:char *Com_SkipCharset( char *s, char *sep )
;1358:{
line 1359
;1359:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $494
JUMPV
LABELV $493
line 1362
;1360:
;1361:	while( p )
;1362:	{
line 1363
;1363:		if( Com_CharIsOneOfCharset( *p, sep ) )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $495
line 1364
;1364:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1366
;1365:		else
;1366:			break;
LABELV $497
line 1367
;1367:	}
LABELV $494
line 1361
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $493
LABELV $495
line 1369
;1368:
;1369:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $492
endproc Com_SkipCharset 8 8
export Com_SkipTokens
proc Com_SkipTokens 20 8
line 1378
;1370:}
;1371:
;1372:/*
;1373:==================
;1374:Com_SkipTokens
;1375:==================
;1376:*/
;1377:char *Com_SkipTokens( char *s, int numTokens, char *sep )
;1378:{
line 1379
;1379:	int		sepCount = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1380
;1380:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $500
JUMPV
LABELV $499
line 1383
;1381:
;1382:	while( sepCount < numTokens )
;1383:	{
line 1384
;1384:		if( Com_CharIsOneOfCharset( *p++, sep ) )
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $502
line 1385
;1385:		{
line 1386
;1386:			sepCount++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $505
JUMPV
LABELV $504
line 1388
;1387:			while( Com_CharIsOneOfCharset( *p, sep ) )
;1388:				p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $505
line 1387
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $504
line 1389
;1389:		}
ADDRGP4 $503
JUMPV
LABELV $502
line 1390
;1390:		else if( *p == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $507
line 1391
;1391:			break;
ADDRGP4 $501
JUMPV
LABELV $507
LABELV $503
line 1392
;1392:	}
LABELV $500
line 1382
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $499
LABELV $501
line 1394
;1393:
;1394:	if( sepCount == numTokens )
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $509
line 1395
;1395:		return p;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $498
JUMPV
LABELV $509
line 1397
;1396:	else
;1397:		return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $498
endproc Com_SkipTokens 20 8
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
import Info_RemoveKey_big
import Com_RandomBytes
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
LABELV $484
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $468
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $465
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $461
byte 1 94
byte 1 51
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 39
byte 1 37
byte 1 99
byte 1 39
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $453
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $450
byte 1 92
byte 1 59
byte 1 34
byte 1 0
align 1
LABELV $421
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $395
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $361
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $352
byte 1 32
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 0
align 1
LABELV $344
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $341
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $296
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $246
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $243
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $240
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $204
byte 1 41
byte 1 0
align 1
LABELV $199
byte 1 40
byte 1 0
align 1
LABELV $180
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $88
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $84
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $58
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $41
byte 1 0
