data
export menu_text_color
align 4
LABELV menu_text_color
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export menu_dim_color
align 4
LABELV menu_dim_color
byte 4 0
byte 4 0
byte 4 0
byte 4 1061158912
export color_black
align 4
LABELV color_black
byte 4 0
byte 4 0
byte 4 0
byte 4 1065353216
export color_white
align 4
LABELV color_white
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export color_yellow
align 4
LABELV color_yellow
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
export color_blue
align 4
LABELV color_blue
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
export color_lightOrange
align 4
LABELV color_lightOrange
byte 4 1050253722
byte 4 1055286886
byte 4 1058306785
byte 4 1065353216
export color_orange
align 4
LABELV color_orange
byte 4 1050253722
byte 4 1055286886
byte 4 1058306785
byte 4 1065353216
export color_red
align 4
LABELV color_red
byte 4 1057803469
byte 4 1059481190
byte 4 1060823368
byte 4 1065353216
export color_dim
align 4
LABELV color_dim
byte 4 0
byte 4 0
byte 4 0
byte 4 1048576000
export pulse_color
align 4
LABELV pulse_color
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export text_color_disabled
align 4
LABELV text_color_disabled
byte 4 1051931443
byte 4 1047904911
byte 4 1049918177
byte 4 1065353216
export text_color_normal
align 4
LABELV text_color_normal
byte 4 1050253722
byte 4 1055286886
byte 4 1058306785
byte 4 1065353216
export text_color_highlight
align 4
LABELV text_color_highlight
byte 4 1061326684
byte 4 1063507722
byte 4 1064178811
byte 4 1065353216
export listbar_color
align 4
LABELV listbar_color
byte 4 1040522936
byte 4 1048911544
byte 4 1052938076
byte 4 1050253722
export text_color_status
align 4
LABELV text_color_status
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc Text_Init 4 0
file "../../../code/q3_ui/ui_qmenu.c"
line 123
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
;24:	UI_QMENU.C
;25:
;26:	Quake's menu framework system.
;27:**********************************************************************/
;28:#include "ui_local.h"
;29:
;30:sfxHandle_t menu_in_sound;
;31:sfxHandle_t menu_move_sound;
;32:sfxHandle_t menu_out_sound;
;33:sfxHandle_t menu_buzz_sound;
;34:sfxHandle_t menu_null_sound;
;35:sfxHandle_t weaponChangeSound;
;36:
;37:static qhandle_t	sliderBar;
;38:static qhandle_t	sliderButton_0;
;39:static qhandle_t	sliderButton_1;
;40:
;41:// Original colors
;42:/*
;43:vec4_t menu_text_color	    = {1.0f, 1.0f, 1.0f, 1.0f};
;44:vec4_t menu_dim_color       = {0.0f, 0.0f, 0.0f, 0.75f};
;45:vec4_t color_black	    = {0.00f, 0.00f, 0.00f, 1.00f};
;46:vec4_t color_white	    = {1.00f, 1.00f, 1.00f, 1.00f};
;47:vec4_t color_yellow	    = {1.00f, 1.00f, 0.00f, 1.00f};
;48:vec4_t color_blue	    = {0.00f, 0.00f, 1.00f, 1.00f};
;49:vec4_t color_lightOrange    = {1.00f, 0.68f, 0.00f, 1.00f };
;50:vec4_t color_orange	    = {1.00f, 0.43f, 0.00f, 1.00f};
;51:vec4_t color_red	    = {1.00f, 0.00f, 0.00f, 1.00f};
;52:vec4_t color_dim	    = {0.00f, 0.00f, 0.00f, 0.25f};
;53:
;54:  vec4_t pulse_color          = {1.00f, 1.00f, 1.00f, 1.00f};
;55:vec4_t text_color_disabled  = {0.50f, 0.50f, 0.50f, 1.00f};	// light gray
;56:vec4_t text_color_normal    = {1.00f, 0.43f, 0.00f, 1.00f};	// light orange
;57:vec4_t text_color_highlight = {1.00f, 1.00f, 0.00f, 1.00f};	// bright yellow
;58:vec4_t listbar_color        = {1.00f, 0.43f, 0.00f, 0.30f};	// transluscent orange
;59:vec4_t text_color_status    = {1.00f, 1.00f, 1.00f, 1.00f};	// bright white
;60:
;61:*/
;62:// NEW AND IMPLOVED colors
;63:vec4_t menu_text_color	    = {1.0f, 1.0f, 1.0f, 1.0f};
;64:vec4_t menu_dim_color       = {0.0f, 0.0f, 0.0f, 0.75f};
;65:vec4_t color_black	    = {0.00f, 0.00f, 0.00f, 1.00f};
;66:vec4_t color_white	    = {1.00f, 1.00f, 1.00f, 1.00f};
;67:vec4_t color_yellow	    = {1.00f, 1.00f, 0.00f, 1.00f};
;68:vec4_t color_blue	    = {0.00f, 0.00f, 1.00f, 1.00f};
;69:vec4_t color_lightOrange    = {0.30f, 0.45f, 0.58f, 1.00f };
;70:vec4_t color_orange	    = {0.30f, 0.45f, 0.58f, 1.00f};
;71:vec4_t color_red	    = {0.55f, 0.65f, 0.73f, 1.00f};
;72:vec4_t color_dim	    = {0.00f, 0.00f, 0.00f, 0.25f};
;73:
;74:// current color scheme
;75:vec4_t pulse_color          = {1.00f, 1.00f, 1.00f, 1.00f};
;76:vec4_t text_color_disabled  = {0.35f, 0.24f, 0.29f, 1.00f};	// light gray
;77:vec4_t text_color_normal    = {0.30f, 0.45f, 0.58f, 1.00f};	// light orange
;78:vec4_t text_color_highlight = {0.76f, 0.89f, 0.93f, 1.00f};	// bright yellow
;79:vec4_t listbar_color        = {0.13f, 0.26f, 0.38f, 0.30f};	// transluscent orange
;80:vec4_t text_color_status    = {1.00f, 1.00f, 1.00f, 1.00f};	// bright white
;81:
;82:// action widget
;83:static void	Action_Init( menuaction_s *a );
;84:static void	Action_Draw( menuaction_s *a );
;85:
;86:// radio button widget
;87:static void	RadioButton_Init( menuradiobutton_s *rb );
;88:static void	RadioButton_Draw( menuradiobutton_s *rb );
;89:static sfxHandle_t RadioButton_Key( menuradiobutton_s *rb, int key );
;90:
;91:// slider widget
;92:static void Slider_Init( menuslider_s *s );
;93:static sfxHandle_t Slider_Key( menuslider_s *s, int key );
;94:static void	Slider_Draw( menuslider_s *s );
;95:
;96:// spin control widget
;97:static void	SpinControl_Init( menulist_s *s );
;98:static void	SpinControl_Draw( menulist_s *s );
;99:static sfxHandle_t SpinControl_Key( menulist_s *l, int key );
;100:
;101:// text widget
;102:static void Text_Init( menutext_s *b );
;103:static void Text_Draw( menutext_s *b );
;104:
;105:// scrolllist widget
;106:static void	ScrollList_Init( menulist_s *l );
;107:sfxHandle_t ScrollList_Key( menulist_s *l, int key );
;108:
;109:// proportional text widget
;110:static void PText_Init( menutext_s *b );
;111:static void PText_Draw( menutext_s *b );
;112:
;113:// proportional banner text widget
;114:static void BText_Init( menutext_s *b );
;115:static void BText_Draw( menutext_s *b );
;116:
;117:/*
;118:=================
;119:Text_Init
;120:=================
;121:*/
;122:static void Text_Init( menutext_s *t )
;123:{
line 124
;124:	t->generic.flags |= QMF_INACTIVE;
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
CNSTU4 16384
BORU4
ASGNU4
line 125
;125:}
LABELV $79
endproc Text_Init 4 0
proc Text_Draw 524 20
line 133
;126:
;127:/*
;128:=================
;129:Text_Draw
;130:=================
;131:*/
;132:static void Text_Draw( menutext_s *t )
;133:{
line 139
;134:	int		x;
;135:	int		y;
;136:	char	buff[512];	
;137:	float*	color;
;138:
;139:	x = t->generic.x;
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 140
;140:	y = t->generic.y;
ADDRLP4 516
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 142
;141:
;142:	buff[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 145
;143:
;144:	// possible label
;145:	if (t->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 146
;146:		strcpy(buff,t->generic.name);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $81
line 149
;147:
;148:	// possible value
;149:	if (t->string)
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $83
line 150
;150:		strcat(buff,t->string);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $83
line 152
;151:		
;152:	if (t->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $85
line 153
;153:		color = text_color_disabled;
ADDRLP4 520
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $86
JUMPV
LABELV $85
line 155
;154:	else
;155:		color = t->color;
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $86
line 157
;156:
;157:	UI_DrawString( x, y, buff, t->style, color );
ADDRLP4 512
INDIRI4
ARGI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 158
;158:}
LABELV $80
endproc Text_Draw 524 20
proc BText_Init 4 0
line 166
;159:
;160:/*
;161:=================
;162:BText_Init
;163:=================
;164:*/
;165:static void BText_Init( menutext_s *t )
;166:{
line 167
;167:	t->generic.flags |= QMF_INACTIVE;
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
CNSTU4 16384
BORU4
ASGNU4
line 168
;168:}
LABELV $87
endproc BText_Init 4 0
proc BText_Draw 16 20
line 176
;169:
;170:/*
;171:=================
;172:BText_Draw
;173:=================
;174:*/
;175:static void BText_Draw( menutext_s *t )
;176:{
line 181
;177:	int		x;
;178:	int		y;
;179:	float*	color;
;180:
;181:	x = t->generic.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 182
;182:	y = t->generic.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 184
;183:
;184:	if (t->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $89
line 185
;185:		color = text_color_disabled;
ADDRLP4 8
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $90
JUMPV
LABELV $89
line 187
;186:	else
;187:		color = t->color;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $90
line 189
;188:
;189:	UI_DrawBannerString( x, y, t->string, t->style, color );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 190
;190:}
LABELV $88
endproc BText_Draw 16 20
proc PText_Init 28 4
line 198
;191:
;192:/*
;193:=================
;194:PText_Init
;195:=================
;196:*/
;197:static void PText_Init( menutext_s *t )
;198:{
line 205
;199:	int	x;
;200:	int	y;
;201:	int	w;
;202:	int	h;
;203:	float	sizeScale;
;204:
;205:	sizeScale = UI_ProportionalSizeScale( t->style );
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 207
;206:
;207:	x = t->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 208
;208:	y = t->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 209
;209:	w = UI_ProportionalStringWidth( t->string ) * sizeScale;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 210
;210:	h =	PROP_HEIGHT * sizeScale;
ADDRLP4 16
CNSTF4 1104674816
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 212
;211:
;212:	if( t->generic.flags & QMF_RIGHT_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 16
BANDU4
CNSTU4 0
EQU4 $92
line 213
;213:		x -= w;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 214
;214:	}
ADDRGP4 $93
JUMPV
LABELV $92
line 215
;215:	else if( t->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $94
line 216
;216:		x -= w / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 217
;217:	}
LABELV $94
LABELV $93
line 219
;218:
;219:	t->generic.left   = x - PROP_GAP_WIDTH * sizeScale;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 220
;220:	t->generic.right  = x + w + PROP_GAP_WIDTH * sizeScale;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 221
;221:	t->generic.top    = y;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 222
;222:	t->generic.bottom = y + h;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 223
;223:}
LABELV $91
endproc PText_Init 28 4
proc PText_Draw 24 20
line 231
;224:
;225:/*
;226:=================
;227:PText_Draw
;228:=================
;229:*/
;230:static void PText_Draw( menutext_s *t )
;231:{
line 237
;232:	int		x;
;233:	int		y;
;234:	float *	color;
;235:	int		style;
;236:
;237:	x = t->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 238
;238:	y = t->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 240
;239:
;240:	if (t->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $97
line 241
;241:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $98
JUMPV
LABELV $97
line 243
;242:	else
;243:		color = t->color;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $98
line 245
;244:
;245:	style = t->style;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 246
;246:	if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $99
line 247
;247:		if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
NEU4 $101
line 248
;248:			style |= UI_PULSE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 249
;249:		}
ADDRGP4 $102
JUMPV
LABELV $101
line 250
;250:		else {
line 251
;251:			style |= UI_INVERSE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 252
;252:		}
LABELV $102
line 253
;253:	}
LABELV $99
line 255
;254:
;255:	UI_DrawProportionalString( x, y, t->string, style, color );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 256
;256:}
LABELV $96
endproc PText_Draw 24 20
export Bitmap_Init
proc Bitmap_Init 16 0
line 264
;257:
;258:/*
;259:=================
;260:Bitmap_Init
;261:=================
;262:*/
;263:void Bitmap_Init( menubitmap_s *b )
;264:{
line 270
;265:	int	x;
;266:	int	y;
;267:	int	w;
;268:	int	h;
;269:
;270:	x = b->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 271
;271:	y = b->generic.y;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 272
;272:	w = b->width;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 273
;273:	h =	b->height;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 274
;274:	if( w < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $104
line 275
;275:		w = -w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
NEGI4
ASGNI4
line 276
;276:	}
LABELV $104
line 277
;277:	if( h < 0 ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $106
line 278
;278:		h = -h;
ADDRLP4 8
ADDRLP4 8
INDIRI4
NEGI4
ASGNI4
line 279
;279:	}
LABELV $106
line 281
;280:
;281:	if (b->generic.flags & QMF_RIGHT_JUSTIFY)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 16
BANDU4
CNSTU4 0
EQU4 $108
line 282
;282:	{
line 283
;283:		x = x - w;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 284
;284:	}
ADDRGP4 $109
JUMPV
LABELV $108
line 285
;285:	else if (b->generic.flags & QMF_CENTER_JUSTIFY)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $110
line 286
;286:	{
line 287
;287:		x = x - w/2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 288
;288:	}
LABELV $110
LABELV $109
line 290
;289:
;290:	b->generic.left   = x;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 291
;291:	b->generic.right  = x + w;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 292
;292:	b->generic.top    = y;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 293
;293:	b->generic.bottom = y + h;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 295
;294:
;295:	b->shader      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 296
;296:	b->focusshader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 297
;297:}
LABELV $103
endproc Bitmap_Init 16 0
export Bitmap_Draw
proc Bitmap_Draw 84 20
line 305
;298:
;299:/*
;300:=================
;301:Bitmap_Draw
;302:=================
;303:*/
;304:void Bitmap_Draw( menubitmap_s *b )
;305:{
line 313
;306:	float	x;
;307:	float	y;
;308:	float	w;
;309:	float	h;
;310:	vec4_t	tempcolor;
;311:	float*	color;
;312:
;313:	x = b->generic.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 314
;314:	y = b->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 315
;315:	w = b->width;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 316
;316:	h =	b->height;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 318
;317:
;318:	if (b->generic.flags & QMF_RIGHT_JUSTIFY)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 16
BANDU4
CNSTU4 0
EQU4 $113
line 319
;319:	{
line 320
;320:		x = x - w;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 321
;321:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 322
;322:	else if (b->generic.flags & QMF_CENTER_JUSTIFY)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $115
line 323
;323:	{
line 324
;324:		x = x - w/2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 325
;325:	}
LABELV $115
LABELV $114
line 328
;326:
;327:	// used to refresh shader
;328:	if (b->generic.name && !b->shader)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $117
ADDRLP4 36
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
line 329
;329:	{
line 330
;330:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 331
;331:		if (!b->shader && b->errorpic)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $119
ADDRLP4 48
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $119
line 332
;332:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
LABELV $119
line 333
;333:	}
LABELV $117
line 335
;334:
;335:	if (b->focuspic && !b->focusshader)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $121
line 336
;336:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
LABELV $121
line 338
;337:
;338:	if (b->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $123
line 339
;339:	{
line 340
;340:		if (b->shader)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 341
;341:		{
line 342
;342:			trap_R_SetColor( colorMdGrey );
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 343
;343:			UI_DrawHandlePic( x, y, w, h, b->shader );
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
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 344
;344:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 345
;345:		}
line 346
;346:	}
ADDRGP4 $124
JUMPV
LABELV $123
line 348
;347:	else
;348:	{
line 349
;349:		if (b->shader)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $127
line 350
;350:			UI_DrawHandlePic( x, y, w, h, b->shader );
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
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
LABELV $127
line 353
;351:
;352:		// bk001204 - parentheses
;353:		if (  ( (b->generic.flags & QMF_PULSE) 
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
ASGNU4
ADDRLP4 56
CNSTU4 0
ASGNU4
ADDRLP4 52
INDIRU4
CNSTU4 131072
BANDU4
ADDRLP4 56
INDIRU4
NEU4 $131
ADDRLP4 52
INDIRU4
CNSTU4 256
BANDU4
ADDRLP4 56
INDIRU4
EQU4 $129
LABELV $131
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRP4
CVPU4 4
NEU4 $129
line 356
;354:			|| (b->generic.flags & QMF_PULSEIFFOCUS) )
;355:		      && (Menu_ItemAtCursor( b->generic.parent ) == b))
;356:		{	
line 357
;357:			if (b->focuscolor)			
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
line 358
;358:			{
line 359
;359:				tempcolor[0] = b->focuscolor[0];
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 360
;360:				tempcolor[1] = b->focuscolor[1];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 361
;361:				tempcolor[2] = b->focuscolor[2];
ADDRLP4 20+8
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 362
;362:				color        = tempcolor;	
ADDRLP4 16
ADDRLP4 20
ASGNP4
line 363
;363:			}
ADDRGP4 $133
JUMPV
LABELV $132
line 365
;364:			else
;365:				color = pulse_color;
ADDRLP4 16
ADDRGP4 pulse_color
ASGNP4
LABELV $133
line 366
;366:			color[3] = 0.5+0.5*sin(uis.realtime/PULSE_DIVISOR);
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
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 368
;367:
;368:			trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 369
;369:			UI_DrawHandlePic( x, y, w, h, b->focusshader );
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
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 370
;370:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 371
;371:		}
ADDRGP4 $130
JUMPV
LABELV $129
line 372
;372:		else if ((b->generic.flags & QMF_HIGHLIGHT) || ((b->generic.flags & QMF_HIGHLIGHT_IF_FOCUS) && (Menu_ItemAtCursor( b->generic.parent ) == b)))
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
ASGNU4
ADDRLP4 76
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRU4
CNSTU4 64
BANDU4
ADDRLP4 76
INDIRU4
NEU4 $139
ADDRLP4 72
INDIRU4
CNSTU4 128
BANDU4
ADDRLP4 76
INDIRU4
EQU4 $137
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRP4
CVPU4 4
NEU4 $137
LABELV $139
line 373
;373:		{	
line 374
;374:			if (b->focuscolor)
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 375
;375:			{
line 376
;376:				trap_R_SetColor( b->focuscolor );
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 377
;377:				UI_DrawHandlePic( x, y, w, h, b->focusshader );
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
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 378
;378:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 379
;379:			}
ADDRGP4 $141
JUMPV
LABELV $140
line 381
;380:			else
;381:				UI_DrawHandlePic( x, y, w, h, b->focusshader );
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
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
LABELV $141
line 382
;382:		}
LABELV $137
LABELV $130
line 383
;383:	}
LABELV $124
line 384
;384:}
LABELV $112
endproc Bitmap_Draw 84 20
proc Action_Init 28 4
line 392
;385:
;386:/*
;387:=================
;388:Action_Init
;389:=================
;390:*/
;391:static void Action_Init( menuaction_s *a )
;392:{
line 396
;393:	int	len;
;394:
;395:	// calculate bounds
;396:	if (a->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
line 397
;397:		len = strlen(a->generic.name);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
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
ADDRGP4 $144
JUMPV
LABELV $143
line 399
;398:	else
;399:		len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $144
line 402
;400:
;401:	// left justify text
;402:	a->generic.left   = a->generic.x; 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 403
;403:	a->generic.right  = a->generic.x + len*BIGCHAR_WIDTH;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDI4
ASGNI4
line 404
;404:	a->generic.top    = a->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 405
;405:	a->generic.bottom = a->generic.y + BIGCHAR_HEIGHT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 406
;406:}
LABELV $142
endproc Action_Init 28 4
proc Action_Draw 28 20
line 414
;407:
;408:/*
;409:=================
;410:Action_Draw
;411:=================
;412:*/
;413:static void Action_Draw( menuaction_s *a )
;414:{
line 419
;415:	int		x, y;
;416:	int		style;
;417:	float*	color;
;418:
;419:	style = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 420
;420:	color = menu_text_color;
ADDRLP4 0
ADDRGP4 menu_text_color
ASGNP4
line 421
;421:	if ( a->generic.flags & QMF_GRAYED )
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $146
line 422
;422:	{
line 423
;423:		color = text_color_disabled;
ADDRLP4 0
ADDRGP4 text_color_disabled
ASGNP4
line 424
;424:	}
ADDRGP4 $147
JUMPV
LABELV $146
line 425
;425:	else if (( a->generic.flags & QMF_PULSEIFFOCUS ) && ( a->generic.parent->cursor == a->generic.menuPosition ))
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $148
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $148
line 426
;426:	{
line 427
;427:		color = text_color_highlight;
ADDRLP4 0
ADDRGP4 text_color_highlight
ASGNP4
line 428
;428:		style = UI_PULSE;
ADDRLP4 12
CNSTI4 16384
ASGNI4
line 429
;429:	}
ADDRGP4 $149
JUMPV
LABELV $148
line 430
;430:	else if (( a->generic.flags & QMF_HIGHLIGHT_IF_FOCUS ) && ( a->generic.parent->cursor == a->generic.menuPosition ))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 128
BANDU4
CNSTU4 0
EQU4 $150
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $150
line 431
;431:	{
line 432
;432:		color = text_color_highlight;
ADDRLP4 0
ADDRGP4 text_color_highlight
ASGNP4
line 433
;433:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 434
;434:	else if ( a->generic.flags & QMF_BLINK )
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $152
line 435
;435:	{
line 436
;436:		style = UI_BLINK;
ADDRLP4 12
CNSTI4 4096
ASGNI4
line 437
;437:		color = text_color_highlight;
ADDRLP4 0
ADDRGP4 text_color_highlight
ASGNP4
line 438
;438:	}
LABELV $152
LABELV $151
LABELV $149
LABELV $147
line 440
;439:
;440:	x = a->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 441
;441:	y = a->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 443
;442:
;443:	UI_DrawString( x, y, a->generic.name, UI_LEFT|style, color );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 445
;444:
;445:	if ( a->generic.parent->cursor == a->generic.menuPosition )
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $154
line 446
;446:	{
line 448
;447:		// draw cursor
;448:		UI_DrawChar( x - BIGCHAR_WIDTH, y, 13, UI_LEFT|UI_BLINK, color);
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4096
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 449
;449:	}
LABELV $154
line 450
;450:}
LABELV $145
endproc Action_Draw 28 20
proc RadioButton_Init 28 4
line 458
;451:
;452:/*
;453:=================
;454:RadioButton_Init
;455:=================
;456:*/
;457:static void RadioButton_Init( menuradiobutton_s *rb )
;458:{
line 462
;459:	int	len;
;460:
;461:	// calculate bounds
;462:	if (rb->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
line 463
;463:		len = strlen(rb->generic.name);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
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
ADDRGP4 $158
JUMPV
LABELV $157
line 465
;464:	else
;465:		len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $158
line 467
;466:
;467:	rb->generic.left   = rb->generic.x - (len+1)*SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
SUBI4
ASGNI4
line 468
;468:	rb->generic.right  = rb->generic.x + 6*SMALLCHAR_WIDTH;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ASGNI4
line 469
;469:	rb->generic.top    = rb->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 470
;470:	rb->generic.bottom = rb->generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 471
;471:}
LABELV $156
endproc RadioButton_Init 28 4
proc RadioButton_Key 32 8
line 479
;472:
;473:/*
;474:=================
;475:RadioButton_Key
;476:=================
;477:*/
;478:static sfxHandle_t RadioButton_Key( menuradiobutton_s *rb, int key )
;479:{
line 480
;480:	switch (key)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 134
EQI4 $165
ADDRLP4 4
CNSTI4 135
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $165
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $172
LABELV $171
ADDRFP4 4
INDIRI4
CNSTI4 13
EQI4 $165
ADDRGP4 $160
JUMPV
LABELV $172
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 178
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $162
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $160
LABELV $173
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 185
LTI4 $160
ADDRLP4 16
INDIRI4
CNSTI4 188
GTI4 $160
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $174-740
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $174
address $165
address $165
address $165
address $165
code
line 481
;481:	{
LABELV $162
line 483
;482:		case K_MOUSE1:
;483:			if (!(rb->generic.flags & QMF_HASMOUSEFOCUS))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 512
BANDU4
CNSTU4 0
NEU4 $163
line 484
;484:				break;
ADDRGP4 $161
JUMPV
LABELV $163
LABELV $165
line 493
;485:
;486:		case K_JOY1:
;487:		case K_JOY2:
;488:		case K_JOY3:
;489:		case K_JOY4:
;490:		case K_ENTER:
;491:		case K_LEFTARROW:
;492:		case K_RIGHTARROW:
;493:			rb->curvalue = !rb->curvalue;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $167
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $168
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 494
;494:			if ( rb->generic.callback )
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $169
line 495
;495:				rb->generic.callback( rb, QM_ACTIVATED );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $169
line 497
;496:
;497:			return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $159
JUMPV
LABELV $160
LABELV $161
line 501
;498:	}
;499:
;500:	// key not handled
;501:	return 0;
CNSTI4 0
RETI4
LABELV $159
endproc RadioButton_Key 32 8
proc RadioButton_Draw 44 20
line 510
;502:}
;503:
;504:/*
;505:=================
;506:RadioButton_Draw
;507:=================
;508:*/
;509:static void RadioButton_Draw( menuradiobutton_s *rb )
;510:{
line 517
;511:	int	x;
;512:	int y;
;513:	float *color;
;514:	int	style;
;515:	qboolean focus;
;516:
;517:	x = rb->generic.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 518
;518:	y = rb->generic.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 520
;519:
;520:	focus = (rb->generic.parent->cursor == rb->generic.menuPosition);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $178
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $178
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $179
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 522
;521:
;522:	if ( rb->generic.flags & QMF_GRAYED )
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $180
line 523
;523:	{
line 524
;524:		color = text_color_disabled;
ADDRLP4 8
ADDRGP4 text_color_disabled
ASGNP4
line 525
;525:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 526
;526:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 527
;527:	else if ( focus )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $182
line 528
;528:	{
line 529
;529:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 530
;530:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16400
ASGNI4
line 531
;531:	}
ADDRGP4 $183
JUMPV
LABELV $182
line 533
;532:	else
;533:	{
line 534
;534:		color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 535
;535:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 536
;536:	}
LABELV $183
LABELV $181
line 538
;537:
;538:	if ( focus )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $184
line 539
;539:	{
line 541
;540:		// draw cursor
;541:		UI_FillRect( rb->generic.left, rb->generic.top, rb->generic.right-rb->generic.left+1, rb->generic.bottom-rb->generic.top+1, listbar_color ); 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 542
;542:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 543
;543:	}
LABELV $184
line 545
;544:
;545:	if ( rb->generic.name )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
line 546
;546:		UI_DrawString( x - SMALLCHAR_WIDTH, y, rb->generic.name, UI_RIGHT|UI_SMALLFONT, color );
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $186
line 548
;547:
;548:	if ( !rb->curvalue )
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
NEI4 $188
line 549
;549:	{
line 550
;550:		UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y + 2, 16, 16, uis.rb_off);
ADDRLP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1098907648
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 uis+11428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 551
;551:		UI_DrawString( x + SMALLCHAR_WIDTH + 16, y, "off", style, color );
ADDRLP4 0
INDIRI4
CNSTI4 8
ADDI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $191
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 552
;552:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 554
;553:	else
;554:	{
line 555
;555:		UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y + 2, 16, 16, uis.rb_on );
ADDRLP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1098907648
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 uis+11424
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 556
;556:		UI_DrawString( x + SMALLCHAR_WIDTH + 16, y, "on", style, color );
ADDRLP4 0
INDIRI4
CNSTI4 8
ADDI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $193
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 557
;557:	}
LABELV $189
line 558
;558:}
LABELV $176
endproc RadioButton_Draw 44 20
proc Slider_Init 28 4
line 566
;559:
;560:/*
;561:=================
;562:Slider_Init
;563:=================
;564:*/
;565:static void Slider_Init( menuslider_s *s )
;566:{
line 570
;567:	int len;
;568:
;569:	// calculate bounds
;570:	if (s->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $195
line 571
;571:		len = strlen(s->generic.name);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
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
ADDRGP4 $196
JUMPV
LABELV $195
line 573
;572:	else
;573:		len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $196
line 575
;574:
;575:	s->generic.left   = s->generic.x - (len+1)*SMALLCHAR_WIDTH; 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
SUBI4
ASGNI4
line 576
;576:	s->generic.right  = s->generic.x + (SLIDER_RANGE+2+1)*SMALLCHAR_WIDTH;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 104
ADDI4
ASGNI4
line 577
;577:	s->generic.top    = s->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 578
;578:	s->generic.bottom = s->generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 579
;579:}
LABELV $194
endproc Slider_Init 28 4
proc Slider_Key 56 8
line 587
;580:
;581:/*
;582:=================
;583:Slider_Key
;584:=================
;585:*/
;586:static sfxHandle_t Slider_Key( menuslider_s *s, int key )
;587:{
line 592
;588:	sfxHandle_t	sound;
;589:	int			x;
;590:	int			oldvalue;
;591:
;592:	switch (key)
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 134
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $208
ADDRLP4 12
INDIRI4
CNSTI4 135
EQI4 $211
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $198
LABELV $214
ADDRFP4 4
INDIRI4
CNSTI4 178
EQI4 $200
ADDRGP4 $198
JUMPV
line 593
;593:	{
LABELV $200
line 595
;594:		case K_MOUSE1:
;595:			x           = uis.cursorx - s->generic.x - 2*SMALLCHAR_WIDTH;
ADDRLP4 4
ADDRGP4 uis+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
SUBI4
CNSTI4 16
SUBI4
ASGNI4
line 596
;596:			oldvalue    = s->curvalue;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 597
;597:			s->curvalue = (x/(float)(SLIDER_RANGE*SMALLCHAR_WIDTH)) * (s->maxvalue-s->minvalue) + s->minvalue;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1117782016
DIVF4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
MULF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 599
;598:
;599:			if (s->curvalue < s->minvalue)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
GEF4 $202
line 600
;600:				s->curvalue = s->minvalue;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $203
JUMPV
LABELV $202
line 601
;601:			else if (s->curvalue > s->maxvalue)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
LEF4 $204
line 602
;602:				s->curvalue = s->maxvalue;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
LABELV $204
LABELV $203
line 603
;603:			if (s->curvalue != oldvalue)
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
EQF4 $206
line 604
;604:				sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $206
line 606
;605:			else
;606:				sound = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 607
;607:			break;
ADDRGP4 $199
JUMPV
LABELV $208
line 610
;608:
;609:		case K_LEFTARROW:
;610:			if (s->curvalue > s->minvalue)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
LEF4 $209
line 611
;611:			{
line 612
;612:				s->curvalue--;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 613
;613:				sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 614
;614:			}
ADDRGP4 $199
JUMPV
LABELV $209
line 616
;615:			else
;616:				sound = menu_buzz_sound;
ADDRLP4 0
ADDRGP4 menu_buzz_sound
INDIRI4
ASGNI4
line 617
;617:			break;			
ADDRGP4 $199
JUMPV
LABELV $211
line 620
;618:
;619:		case K_RIGHTARROW:
;620:			if (s->curvalue < s->maxvalue)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
GEF4 $212
line 621
;621:			{
line 622
;622:				s->curvalue++;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 623
;623:				sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 624
;624:			}
ADDRGP4 $199
JUMPV
LABELV $212
line 626
;625:			else
;626:				sound = menu_buzz_sound;
ADDRLP4 0
ADDRGP4 menu_buzz_sound
INDIRI4
ASGNI4
line 627
;627:			break;			
ADDRGP4 $199
JUMPV
LABELV $198
line 631
;628:
;629:		default:
;630:			// key not handled
;631:			sound = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 632
;632:			break;
LABELV $199
line 635
;633:	}
;634:
;635:	if ( sound && s->generic.callback )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $215
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $215
line 636
;636:		s->generic.callback( s, QM_ACTIVATED );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $215
line 638
;637:
;638:	return (sound);
ADDRLP4 0
INDIRI4
RETI4
LABELV $197
endproc Slider_Key 56 8
proc Slider_Draw 44 20
line 647
;639:}
;640:
;641:#if 1
;642:/*
;643:=================
;644:Slider_Draw
;645:=================
;646:*/
;647:static void Slider_Draw( menuslider_s *s ) {
line 655
;648:	int			x;
;649:	int			y;
;650:	int			style;
;651:	float		*color;
;652:	int			button;
;653:	qboolean	focus;
;654:	
;655:	x =	s->generic.x;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 656
;656:	y = s->generic.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 657
;657:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $219
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $220
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 659
;658:
;659:	if( s->generic.flags & QMF_GRAYED ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $221
line 660
;660:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
line 661
;661:		style = UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 662
;662:	}
ADDRGP4 $222
JUMPV
LABELV $221
line 663
;663:	else if( focus ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $223
line 664
;664:		color  = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 665
;665:		style = UI_SMALLFONT | UI_PULSE;
ADDRLP4 8
CNSTI4 16400
ASGNI4
line 666
;666:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 667
;667:	else {
line 668
;668:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 669
;669:		style = UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 670
;670:	}
LABELV $224
LABELV $222
line 673
;671:
;672:	// draw label
;673:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, UI_RIGHT|style, color );
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 676
;674:
;675:	// draw slider
;676:	UI_SetColor( color );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 677
;677:	UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y, 96, 16, sliderBar );
ADDRLP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1119879168
ARGF4
CNSTF4 1098907648
ARGF4
ADDRGP4 sliderBar
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 678
;678:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 681
;679:
;680:	// clamp thumb
;681:	if( s->maxvalue > s->minvalue )	{
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
LEF4 $225
line 682
;682:		s->range = ( s->curvalue - s->minvalue ) / ( float ) ( s->maxvalue - s->minvalue );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 36
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
DIVF4
ASGNF4
line 683
;683:		if( s->range < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
CNSTF4 0
GEF4 $227
line 684
;684:			s->range = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 685
;685:		}
ADDRGP4 $226
JUMPV
LABELV $227
line 686
;686:		else if( s->range > 1) {
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $226
line 687
;687:			s->range = 1;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1065353216
ASGNF4
line 688
;688:		}
line 689
;689:	}
ADDRGP4 $226
JUMPV
LABELV $225
line 690
;690:	else {
line 691
;691:		s->range = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 692
;692:	}
LABELV $226
line 695
;693:
;694:	// draw thumb
;695:	if( style & UI_PULSE) {
ADDRLP4 8
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $231
line 696
;696:		button = sliderButton_1;
ADDRLP4 16
ADDRGP4 sliderButton_1
INDIRI4
ASGNI4
line 697
;697:	}
ADDRGP4 $232
JUMPV
LABELV $231
line 698
;698:	else {
line 699
;699:		button = sliderButton_0;
ADDRLP4 16
ADDRGP4 sliderButton_0
INDIRI4
ASGNI4
line 700
;700:	}
LABELV $232
line 702
;701:
;702:	UI_DrawHandlePic( (int)( x + 2*SMALLCHAR_WIDTH + (SLIDER_RANGE-1)*SMALLCHAR_WIDTH* s->range ) - 2, y - 2, 12, 20, button );
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
CVIF4 4
CNSTF4 1116733440
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1094713344
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 703
;703:}
LABELV $217
endproc Slider_Draw 44 20
proc SpinControl_Init 48 4
line 780
;704:#else
;705:/*
;706:=================
;707:Slider_Draw
;708:=================
;709:*/
;710:static void Slider_Draw( menuslider_s *s )
;711:{
;712:	float *color;
;713:	int	style;
;714:	int	i;
;715:	int x;
;716:	int y;
;717:	qboolean focus;
;718:	
;719:	x =	s->generic.x;
;720:	y = s->generic.y;
;721:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
;722:
;723:	style = UI_SMALLFONT;
;724:	if ( s->generic.flags & QMF_GRAYED )
;725:	{
;726:		color = text_color_disabled;
;727:	}
;728:	else if (focus)
;729:	{
;730:		color  = text_color_highlight;
;731:		style |= UI_PULSE;
;732:	}
;733:	else
;734:	{
;735:		color = text_color_normal;
;736:	}
;737:
;738:	if ( focus )
;739:	{
;740:		// draw cursor
;741:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
;742:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
;743:	}
;744:
;745:	// draw label
;746:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, UI_RIGHT|style, color );
;747:
;748:	// draw slider
;749:	UI_DrawChar( x + SMALLCHAR_WIDTH, y, 128, UI_LEFT|style, color);
;750:	for ( i = 0; i < SLIDER_RANGE; i++ )
;751:		UI_DrawChar( x + (i+2)*SMALLCHAR_WIDTH, y, 129, UI_LEFT|style, color);
;752:	UI_DrawChar( x + (i+2)*SMALLCHAR_WIDTH, y, 130, UI_LEFT|style, color);
;753:
;754:	// clamp thumb
;755:	if (s->maxvalue > s->minvalue)
;756:	{
;757:		s->range = ( s->curvalue - s->minvalue ) / ( float ) ( s->maxvalue - s->minvalue );
;758:		if ( s->range < 0)
;759:			s->range = 0;
;760:		else if ( s->range > 1)
;761:			s->range = 1;
;762:	}
;763:	else
;764:		s->range = 0;
;765:
;766:	// draw thumb
;767:	if (style & UI_PULSE) {
;768:		style &= ~UI_PULSE;
;769:		style |= UI_BLINK;
;770:	}
;771:	UI_DrawChar( (int)( x + 2*SMALLCHAR_WIDTH + (SLIDER_RANGE-1)*SMALLCHAR_WIDTH* s->range ), y, 131, UI_LEFT|style, color);
;772:}
;773:#endif
;774:
;775:/*
;776:=================
;777:SpinControl_Init
;778:=================
;779:*/
;780:static void SpinControl_Init( menulist_s *s ) {
line 785
;781:	int	len;
;782:	int	l;
;783:	const char* str;
;784:
;785:	if (s->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $234
line 786
;786:		len = strlen(s->generic.name) * SMALLCHAR_WIDTH;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $234
line 788
;787:	else
;788:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $235
line 790
;789:
;790:	s->generic.left	= s->generic.x - SMALLCHAR_WIDTH - len;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 792
;791:
;792:	len = s->numitems = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
line 794
;793:	while ( (str = s->itemnames[s->numitems]) != 0 )
;794:	{
line 795
;795:		l = strlen(str);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 796
;796:		if (l > len)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $239
line 797
;797:			len = l;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $239
line 799
;798:
;799:		s->numitems++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 800
;800:	}		
LABELV $237
line 793
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 802
;801:
;802:	s->generic.top	  =	s->generic.y;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 803
;803:	s->generic.right  =	s->generic.x + (len+1)*SMALLCHAR_WIDTH;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
ADDI4
ASGNI4
line 804
;804:	s->generic.bottom =	s->generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 16
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 805
;805:}
LABELV $233
endproc SpinControl_Init 48 4
proc SpinControl_Key 28 8
line 813
;806:
;807:/*
;808:=================
;809:SpinControl_Key
;810:=================
;811:*/
;812:static sfxHandle_t SpinControl_Key( menulist_s *s, int key )
;813:{
line 816
;814:	sfxHandle_t	sound;
;815:
;816:	sound = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 817
;817:	switch (key)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 134
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $247
ADDRLP4 4
INDIRI4
CNSTI4 135
EQI4 $250
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $242
LABELV $253
ADDRFP4 4
INDIRI4
CNSTI4 178
EQI4 $244
ADDRGP4 $242
JUMPV
line 818
;818:	{
LABELV $244
line 820
;819:		case K_MOUSE1:
;820:			s->curvalue++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 821
;821:			if (s->curvalue >= s->numitems)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
LTI4 $245
line 822
;822:				s->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
LABELV $245
line 823
;823:			sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 824
;824:			break;
ADDRGP4 $243
JUMPV
LABELV $247
line 827
;825:		
;826:		case K_LEFTARROW:
;827:			if (s->curvalue > 0)
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
LEI4 $248
line 828
;828:			{
line 829
;829:				s->curvalue--;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 830
;830:				sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 831
;831:			}
ADDRGP4 $243
JUMPV
LABELV $248
line 833
;832:			else
;833:				sound = menu_buzz_sound;
ADDRLP4 0
ADDRGP4 menu_buzz_sound
INDIRI4
ASGNI4
line 834
;834:			break;
ADDRGP4 $243
JUMPV
LABELV $250
line 837
;835:
;836:		case K_RIGHTARROW:
;837:			if (s->curvalue < s->numitems-1)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $251
line 838
;838:			{
line 839
;839:				s->curvalue++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 840
;840:				sound = menu_move_sound;
ADDRLP4 0
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 841
;841:			}
ADDRGP4 $243
JUMPV
LABELV $251
line 843
;842:			else
;843:				sound = menu_buzz_sound;
ADDRLP4 0
ADDRGP4 menu_buzz_sound
INDIRI4
ASGNI4
line 844
;844:			break;
LABELV $242
LABELV $243
line 847
;845:	}
;846:
;847:	if ( sound && s->generic.callback )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $254
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $254
line 848
;848:		s->generic.callback( s, QM_ACTIVATED );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $254
line 850
;849:
;850:	return (sound);
ADDRLP4 0
INDIRI4
RETI4
LABELV $241
endproc SpinControl_Key 28 8
proc SpinControl_Draw 44 20
line 859
;851:}
;852:
;853:/*
;854:=================
;855:SpinControl_Draw
;856:=================
;857:*/
;858:static void SpinControl_Draw( menulist_s *s )
;859:{
line 865
;860:	float *color;
;861:	int	x,y;
;862:	int	style;
;863:	qboolean focus;
;864:
;865:	x = s->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 866
;866:	y =	s->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 868
;867:
;868:	style = UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 869
;869:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $258
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $259
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 871
;870:
;871:	if ( s->generic.flags & QMF_GRAYED )
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $260
line 872
;872:		color = text_color_disabled;
ADDRLP4 0
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $261
JUMPV
LABELV $260
line 873
;873:	else if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $262
line 874
;874:	{
line 875
;875:		color = text_color_highlight;
ADDRLP4 0
ADDRGP4 text_color_highlight
ASGNP4
line 876
;876:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 877
;877:	}
ADDRGP4 $263
JUMPV
LABELV $262
line 878
;878:	else if ( s->generic.flags & QMF_BLINK )
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $264
line 879
;879:	{
line 880
;880:		color = text_color_highlight;
ADDRLP4 0
ADDRGP4 text_color_highlight
ASGNP4
line 881
;881:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 882
;882:	}
ADDRGP4 $265
JUMPV
LABELV $264
line 884
;883:	else
;884:		color = text_color_normal;
ADDRLP4 0
ADDRGP4 text_color_normal
ASGNP4
LABELV $265
LABELV $263
LABELV $261
line 886
;885:
;886:	if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $266
line 887
;887:	{
line 889
;888:		// draw cursor
;889:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 890
;890:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 891
;891:	}
LABELV $266
line 893
;892:
;893:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 4
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 894
;894:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->itemnames[s->curvalue], style|UI_LEFT, color );
ADDRLP4 4
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 895
;895:}
LABELV $256
endproc SpinControl_Draw 44 20
proc ScrollList_Init 36 0
line 903
;896:
;897:/*
;898:=================
;899:ScrollList_Init
;900:=================
;901:*/
;902:static void ScrollList_Init( menulist_s *l )
;903:{
line 906
;904:	int		w;
;905:
;906:	l->oldvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 907
;907:	l->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 908
;908:	l->top      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 910
;909:
;910:	if( !l->columns ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
NEI4 $269
line 911
;911:		l->columns = 1;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 912
;912:		l->seperation = 0;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 913
;913:	}
ADDRGP4 $270
JUMPV
LABELV $269
line 914
;914:	else if( !l->seperation ) {
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
NEI4 $271
line 915
;915:		l->seperation = 3;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 3
ASGNI4
line 916
;916:	}
LABELV $271
LABELV $270
line 918
;917:
;918:	w = ( (l->width + l->seperation) * l->columns - l->seperation) * SMALLCHAR_WIDTH;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
MULI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 920
;919:
;920:	l->generic.left   =	l->generic.x;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 921
;921:	l->generic.top    = l->generic.y;	
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 922
;922:	l->generic.right  =	l->generic.x + w;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 923
;923:	l->generic.bottom =	l->generic.y + l->height * SMALLCHAR_HEIGHT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDI4
ASGNI4
line 925
;924:
;925:	if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $273
line 926
;926:		l->generic.left -= w / 2;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 927
;927:		l->generic.right -= w / 2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 928
;928:	}
LABELV $273
line 929
;929:}
LABELV $268
endproc ScrollList_Init 36 0
export ScrollList_Key
proc ScrollList_Key 136 16
line 937
;930:
;931:/*
;932:=================
;933:ScrollList_Key
;934:=================
;935:*/
;936:sfxHandle_t ScrollList_Key( menulist_s *l, int key )
;937:{
line 949
;938:	int	x;
;939:	int	y;
;940:	int	w;
;941:	int	i;
;942:	int	j;	
;943:	int	c;
;944:	int	cursorx;
;945:	int	cursory;
;946:	int	column;
;947:	int	index;
;948:
;949:	switch (key)
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 132
LTI4 $276
ADDRLP4 40
INDIRI4
CNSTI4 144
GTI4 $359
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $360-528
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $360
address $323
address $332
address $341
address $350
address $276
address $276
address $276
address $276
address $276
address $312
address $301
address $291
address $294
code
LABELV $359
ADDRFP4 4
INDIRI4
CNSTI4 178
EQI4 $278
ADDRGP4 $276
JUMPV
line 950
;950:	{
LABELV $278
line 952
;951:		case K_MOUSE1:
;952:			if (l->generic.flags & QMF_HASMOUSEFOCUS)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 512
BANDU4
CNSTU4 0
EQU4 $277
line 953
;953:			{
line 955
;954:				// check scroll region
;955:				x = l->generic.x;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 956
;956:				y = l->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 957
;957:				w = ( (l->width + l->seperation) * l->columns - l->seperation) * SMALLCHAR_WIDTH;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
ADDRLP4 44
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ADDRLP4 44
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
MULI4
ADDRLP4 48
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 958
;958:				if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $281
line 959
;959:					x -= w / 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 960
;960:				}
LABELV $281
line 961
;961:				if (UI_CursorInRect( x, y, w, l->height*SMALLCHAR_HEIGHT ))
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $283
line 962
;962:				{
line 963
;963:					cursorx = (uis.cursorx - x)/SMALLCHAR_WIDTH;
ADDRLP4 28
ADDRGP4 uis+8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 8
DIVI4
ASGNI4
line 964
;964:					column = cursorx / (l->width + l->seperation);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDI4
DIVI4
ASGNI4
line 965
;965:					cursory = (uis.cursory - y)/SMALLCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 uis+12
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 16
DIVI4
ASGNI4
line 966
;966:					index = column * l->height + cursory;
ADDRLP4 24
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
MULI4
ADDRLP4 32
INDIRI4
ADDI4
ASGNI4
line 967
;967:					if (l->top + index < l->numitems)
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ADDRLP4 60
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
GEI4 $287
line 968
;968:					{
line 969
;969:						l->oldvalue = l->curvalue;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 970
;970:						l->curvalue = l->top + index;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 972
;971:
;972:						if (l->oldvalue != l->curvalue && l->generic.callback)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
EQI4 $289
ADDRLP4 72
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 973
;973:						{
line 974
;974:							l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 975
;975:							return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $289
line 977
;976:						}
;977:					}
LABELV $287
line 978
;978:				}
LABELV $283
line 981
;979:			
;980:				// absorbed, silent sound effect
;981:				return (menu_null_sound);
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
line 983
;982:			}
;983:			break;
LABELV $291
line 986
;984:
;985:		case K_HOME:
;986:			l->oldvalue = l->curvalue;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 987
;987:			l->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 988
;988:			l->top      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 990
;989:
;990:			if (l->oldvalue != l->curvalue && l->generic.callback)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
EQI4 $292
ADDRLP4 48
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
line 991
;991:			{
line 992
;992:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 993
;993:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $292
line 995
;994:			}
;995:			return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $294
line 998
;996:
;997:		case K_END:
;998:			l->oldvalue = l->curvalue;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 999
;999:			l->curvalue = l->numitems-1;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1000
;1000:			if( l->columns > 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LEI4 $295
line 1001
;1001:				c = (l->curvalue / l->height + 1) * l->height;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 1
ADDI4
ADDRLP4 64
INDIRI4
MULI4
ASGNI4
line 1002
;1002:				l->top = c - (l->columns * l->height);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
MULI4
SUBI4
ASGNI4
line 1003
;1003:			}
ADDRGP4 $296
JUMPV
LABELV $295
line 1004
;1004:			else {
line 1005
;1005:				l->top = l->curvalue - (l->height - 1);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1
SUBI4
SUBI4
ASGNI4
line 1006
;1006:			}
LABELV $296
line 1007
;1007:			if (l->top < 0)
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $297
line 1008
;1008:				l->top = 0;			
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
LABELV $297
line 1010
;1009:
;1010:			if (l->oldvalue != l->curvalue && l->generic.callback)
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
EQI4 $299
ADDRLP4 60
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $299
line 1011
;1011:			{
line 1012
;1012:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1013
;1013:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $299
line 1015
;1014:			}
;1015:			return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $301
line 1018
;1016:
;1017:		case K_PGUP:
;1018:			if( l->columns > 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LEI4 $302
line 1019
;1019:				return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $302
line 1022
;1020:			}
;1021:
;1022:			if (l->curvalue > 0)
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
LEI4 $304
line 1023
;1023:			{
line 1024
;1024:				l->oldvalue = l->curvalue;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1025
;1025:				l->curvalue -= l->height-1;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1
SUBI4
SUBI4
ASGNI4
line 1026
;1026:				if (l->curvalue < 0)
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
GEI4 $306
line 1027
;1027:					l->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
LABELV $306
line 1028
;1028:				l->top = l->curvalue;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1029
;1029:				if (l->top < 0)
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $308
line 1030
;1030:					l->top = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
LABELV $308
line 1032
;1031:
;1032:				if (l->generic.callback)
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $310
line 1033
;1033:					l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $310
line 1035
;1034:
;1035:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $304
line 1037
;1036:			}
;1037:			return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $312
line 1040
;1038:
;1039:		case K_PGDN:
;1040:			if( l->columns > 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LEI4 $313
line 1041
;1041:				return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $313
line 1044
;1042:			}
;1043:
;1044:			if (l->curvalue < l->numitems-1)
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $315
line 1045
;1045:			{
line 1046
;1046:				l->oldvalue = l->curvalue;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1047
;1047:				l->curvalue += l->height-1;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 1048
;1048:				if (l->curvalue > l->numitems-1)
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LEI4 $317
line 1049
;1049:					l->curvalue = l->numitems-1;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $317
line 1050
;1050:				l->top = l->curvalue - (l->height-1);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 88
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1
SUBI4
SUBI4
ASGNI4
line 1051
;1051:				if (l->top < 0)
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $319
line 1052
;1052:					l->top = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
LABELV $319
line 1054
;1053:
;1054:				if (l->generic.callback)
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $321
line 1055
;1055:					l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $321
line 1057
;1056:
;1057:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $315
line 1059
;1058:			}
;1059:			return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $323
line 1062
;1060:
;1061:		case K_UPARROW:
;1062:			if( l->curvalue == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
line 1063
;1063:				return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $324
line 1066
;1064:			}
;1065:
;1066:			l->oldvalue = l->curvalue;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1067
;1067:			l->curvalue--;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1069
;1068:
;1069:			if( l->curvalue < l->top ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
GEI4 $326
line 1070
;1070:				if( l->columns == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $328
line 1071
;1071:					l->top--;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1072
;1072:				}
ADDRGP4 $329
JUMPV
LABELV $328
line 1073
;1073:				else {
line 1074
;1074:					l->top -= l->height;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1075
;1075:				}
LABELV $329
line 1076
;1076:			}
LABELV $326
line 1078
;1077:
;1078:			if( l->generic.callback ) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
line 1079
;1079:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1080
;1080:			}
LABELV $330
line 1082
;1081:
;1082:			return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $332
line 1085
;1083:
;1084:		case K_DOWNARROW:
;1085:			if( l->curvalue == l->numitems - 1 ) {
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $333
line 1086
;1086:				return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $333
line 1089
;1087:			}
;1088:
;1089:			l->oldvalue = l->curvalue;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1090
;1090:			l->curvalue++;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1092
;1091:
;1092:			if( l->curvalue >= l->top + l->columns * l->height ) {
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 92
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 92
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 92
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
MULI4
ADDI4
LTI4 $335
line 1093
;1093:				if( l->columns == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $337
line 1094
;1094:					l->top++;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1095
;1095:				}
ADDRGP4 $338
JUMPV
LABELV $337
line 1096
;1096:				else {
line 1097
;1097:					l->top += l->height;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1098
;1098:				}
LABELV $338
line 1099
;1099:			}
LABELV $335
line 1101
;1100:
;1101:			if( l->generic.callback ) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
line 1102
;1102:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1103
;1103:			}
LABELV $339
line 1105
;1104:
;1105:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $341
line 1108
;1106:
;1107:		case K_LEFTARROW:
;1108:			if( l->columns == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $342
line 1109
;1109:				return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $342
line 1112
;1110:			}
;1111:
;1112:			if( l->curvalue < l->height ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
GEI4 $344
line 1113
;1113:				return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $344
line 1116
;1114:			}
;1115:
;1116:			l->oldvalue = l->curvalue;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1117
;1117:			l->curvalue -= l->height;
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 104
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1119
;1118:
;1119:			if( l->curvalue < l->top ) {
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
GEI4 $346
line 1120
;1120:				l->top -= l->height;
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
ADDRLP4 116
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1121
;1121:			}
LABELV $346
line 1123
;1122:
;1123:			if( l->generic.callback ) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $348
line 1124
;1124:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1125
;1125:			}
LABELV $348
line 1127
;1126:
;1127:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $350
line 1130
;1128:
;1129:		case K_RIGHTARROW:
;1130:			if( l->columns == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
NEI4 $351
line 1131
;1131:				return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $351
line 1134
;1132:			}
;1133:
;1134:			c = l->curvalue + l->height;
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 116
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 116
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1136
;1135:
;1136:			if( c >= l->numitems ) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
LTI4 $353
line 1137
;1137:				return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $353
line 1140
;1138:			}
;1139:
;1140:			l->oldvalue = l->curvalue;
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 120
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1141
;1141:			l->curvalue = c;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1143
;1142:
;1143:			if( l->curvalue > l->top + l->columns * l->height - 1 ) {
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 124
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 124
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 124
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
MULI4
ADDI4
CNSTI4 1
SUBI4
LEI4 $355
line 1144
;1144:				l->top += l->height;
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 128
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1145
;1145:			}
LABELV $355
line 1147
;1146:
;1147:			if( l->generic.callback ) {
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
line 1148
;1148:				l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 128
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1149
;1149:			}
LABELV $357
line 1151
;1150:
;1151:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $276
LABELV $277
line 1155
;1152:	}
;1153:
;1154:	// cycle look for ascii key inside list items
;1155:	if ( !Q_isprint( key ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 Q_isprint
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $362
line 1156
;1156:		return (0);
CNSTI4 0
RETI4
ADDRGP4 $275
JUMPV
LABELV $362
line 1159
;1157:
;1158:	// force to lower for case insensitive compare
;1159:	if ( Q_isupper( key ) )
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 Q_isupper
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $364
line 1160
;1160:	{
line 1161
;1161:		key -= 'A' - 'a';
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 -32
SUBI4
ASGNI4
line 1162
;1162:	}
LABELV $364
line 1165
;1163:
;1164:	// iterate list items
;1165:	for (i=1; i<=l->numitems; i++)
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 1166
;1166:	{
line 1167
;1167:		j = (l->curvalue + i) % l->numitems;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ADDRLP4 52
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
MODI4
ASGNI4
line 1168
;1168:		c = l->itemnames[j][0];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ADDP4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 1169
;1169:		if ( Q_isupper( c ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 Q_isupper
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $370
line 1170
;1170:		{
line 1171
;1171:			c -= 'A' - 'a';
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -32
SUBI4
ASGNI4
line 1172
;1172:		}
LABELV $370
line 1174
;1173:
;1174:		if (c == key)
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $372
line 1175
;1175:		{
line 1177
;1176:			// set current item, mimic windows listbox scroll behavior
;1177:			if (j < l->top)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
GEI4 $374
line 1178
;1178:			{
line 1180
;1179:				// behind top most item, set this as new top
;1180:				l->top = j;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1181
;1181:			}
ADDRGP4 $375
JUMPV
LABELV $374
line 1182
;1182:			else if (j > l->top+l->height-1)
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
LEI4 $376
line 1183
;1183:			{
line 1185
;1184:				// past end of list box, do page down
;1185:				l->top = (j+1) - l->height;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 64
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1186
;1186:			}
LABELV $376
LABELV $375
line 1188
;1187:			
;1188:			if (l->curvalue != j)
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $378
line 1189
;1189:			{
line 1190
;1190:				l->oldvalue = l->curvalue;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 1191
;1191:				l->curvalue = j;
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1192
;1192:				if (l->generic.callback)
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $380
line 1193
;1193:					l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
LABELV $380
line 1194
;1194:				return ( menu_move_sound );			
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $378
line 1197
;1195:			}
;1196:
;1197:			return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $372
line 1199
;1198:		}
;1199:	}
LABELV $367
line 1165
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
LEI4 $366
line 1201
;1200:
;1201:	return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
LABELV $275
endproc ScrollList_Key 136 16
export ScrollList_Draw
proc ScrollList_Draw 52 20
line 1210
;1202:}
;1203:
;1204:/*
;1205:=================
;1206:ScrollList_Draw
;1207:=================
;1208:*/
;1209:void ScrollList_Draw( menulist_s *l )
;1210:{
line 1221
;1211:	int			x;
;1212:	int			u;
;1213:	int			y;
;1214:	int			i;
;1215:	int			base;
;1216:	int			column;
;1217:	float*		color;
;1218:	qboolean	hasfocus;
;1219:	int			style;
;1220:
;1221:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $384
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $384
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $385
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 1223
;1222:
;1223:	x =	l->generic.x;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1224
;1224:	for( column = 0; column < l->columns; column++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $386
line 1225
;1225:		y =	l->generic.y;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1226
;1226:		base = l->top + column * l->height;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1227
;1227:		for( i = base; i < base + l->height; i++) {
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $393
JUMPV
LABELV $390
line 1228
;1228:			if (i >= l->numitems)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
LTI4 $394
line 1229
;1229:				break;
ADDRGP4 $392
JUMPV
LABELV $394
line 1231
;1230:
;1231:			if (i == l->curvalue)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
NEI4 $396
line 1232
;1232:			{
line 1233
;1233:				u = x - 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1234
;1234:				if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $398
line 1235
;1235:					u -= (l->width * SMALLCHAR_WIDTH) / 2 + 1;
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 2
DIVI4
CNSTI4 1
ADDI4
SUBI4
ASGNI4
line 1236
;1236:				}
LABELV $398
line 1238
;1237:
;1238:				UI_FillRect(u,y,l->width*SMALLCHAR_WIDTH,SMALLCHAR_HEIGHT+2,listbar_color);
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 3
LSHI4
CVIF4 4
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1239
;1239:				color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 1241
;1240:
;1241:				if (hasfocus)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $400
line 1242
;1242:					style = UI_PULSE|UI_LEFT|UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16400
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $400
line 1244
;1243:				else
;1244:					style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 1245
;1245:			}
ADDRGP4 $397
JUMPV
LABELV $396
line 1247
;1246:			else
;1247:			{
line 1248
;1248:				color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 1249
;1249:				style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 1250
;1250:			}
LABELV $397
line 1251
;1251:			if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $402
line 1252
;1252:				style |= UI_CENTER;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1253
;1253:			}
LABELV $402
line 1255
;1254:
;1255:			UI_DrawString(
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1262
;1256:				x,
;1257:				y,
;1258:				l->itemnames[i],
;1259:				style,
;1260:				color);
;1261:
;1262:			y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1263
;1263:		}
LABELV $391
line 1227
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $393
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
LTI4 $390
LABELV $392
line 1264
;1264:		x += (l->width + l->seperation) * SMALLCHAR_WIDTH;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1265
;1265:	}
LABELV $387
line 1224
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
ADDRLP4 32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
LTI4 $386
line 1266
;1266:}
LABELV $382
endproc ScrollList_Draw 52 20
export Menu_AddItem
proc Menu_AddItem 40 8
line 1274
;1267:
;1268:/*
;1269:=================
;1270:Menu_AddItem
;1271:=================
;1272:*/
;1273:void Menu_AddItem( menuframework_s *menu, void *item )
;1274:{
line 1277
;1275:	menucommon_s	*itemptr;
;1276:
;1277:	if (menu->nitems >= MAX_MENUITEMS)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 96
LTI4 $405
line 1278
;1278:		trap_Error ("Menu_AddItem: excessive items");
ADDRGP4 $407
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $405
line 1280
;1279:
;1280:	menu->items[menu->nitems] = item;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1281
;1281:	((menucommon_s*)menu->items[menu->nitems])->parent        = menu;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1282
;1282:	((menucommon_s*)menu->items[menu->nitems])->menuPosition  = menu->nitems;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1283
;1283:	((menucommon_s*)menu->items[menu->nitems])->flags        &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
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
line 1286
;1284:
;1285:	// perform any item specific initializations
;1286:	itemptr = (menucommon_s*)item;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 1287
;1287:	if (!(itemptr->flags & QMF_NODEFAULTINIT))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 32768
BANDU4
CNSTU4 0
NEU4 $408
line 1288
;1288:	{
line 1289
;1289:		switch (itemptr->type)
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $410
ADDRLP4 28
INDIRI4
CNSTI4 10
GTI4 $410
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $424-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $424
address $417
address $413
address $415
address $414
address $416
address $418
address $419
address $420
address $421
address $422
code
line 1290
;1290:		{
LABELV $413
line 1292
;1291:			case MTYPE_ACTION:
;1292:				Action_Init((menuaction_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Action_Init
CALLV
pop
line 1293
;1293:				break;
ADDRGP4 $411
JUMPV
LABELV $414
line 1296
;1294:
;1295:			case MTYPE_FIELD:
;1296:				MenuField_Init((menufield_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 MenuField_Init
CALLV
pop
line 1297
;1297:				break;
ADDRGP4 $411
JUMPV
LABELV $415
line 1300
;1298:
;1299:			case MTYPE_SPINCONTROL:
;1300:				SpinControl_Init((menulist_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 SpinControl_Init
CALLV
pop
line 1301
;1301:				break;
ADDRGP4 $411
JUMPV
LABELV $416
line 1304
;1302:
;1303:			case MTYPE_RADIOBUTTON:
;1304:				RadioButton_Init((menuradiobutton_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RadioButton_Init
CALLV
pop
line 1305
;1305:				break;
ADDRGP4 $411
JUMPV
LABELV $417
line 1308
;1306:
;1307:			case MTYPE_SLIDER:
;1308:				Slider_Init((menuslider_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Slider_Init
CALLV
pop
line 1309
;1309:				break;
ADDRGP4 $411
JUMPV
LABELV $418
line 1312
;1310:
;1311:			case MTYPE_BITMAP:
;1312:				Bitmap_Init((menubitmap_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 1313
;1313:				break;
ADDRGP4 $411
JUMPV
LABELV $419
line 1316
;1314:
;1315:			case MTYPE_TEXT:
;1316:				Text_Init((menutext_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Text_Init
CALLV
pop
line 1317
;1317:				break;
ADDRGP4 $411
JUMPV
LABELV $420
line 1320
;1318:
;1319:			case MTYPE_SCROLLLIST:
;1320:				ScrollList_Init((menulist_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ScrollList_Init
CALLV
pop
line 1321
;1321:				break;
ADDRGP4 $411
JUMPV
LABELV $421
line 1324
;1322:
;1323:			case MTYPE_PTEXT:
;1324:				PText_Init((menutext_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 PText_Init
CALLV
pop
line 1325
;1325:				break;
ADDRGP4 $411
JUMPV
LABELV $422
line 1328
;1326:
;1327:			case MTYPE_BTEXT:
;1328:				BText_Init((menutext_s*)item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BText_Init
CALLV
pop
line 1329
;1329:				break;
ADDRGP4 $411
JUMPV
LABELV $410
line 1332
;1330:
;1331:			default:
;1332:				trap_Error( va("Menu_Init: unknown type %d", itemptr->type) );
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1333
;1333:		}
LABELV $411
line 1334
;1334:	}
LABELV $408
line 1336
;1335:
;1336:	menu->nitems++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1337
;1337:}
LABELV $404
endproc Menu_AddItem 40 8
export Menu_CursorMoved
proc Menu_CursorMoved 32 8
line 1345
;1338:
;1339:/*
;1340:=================
;1341:Menu_CursorMoved
;1342:=================
;1343:*/
;1344:void Menu_CursorMoved( menuframework_s *m )
;1345:{
line 1348
;1346:	void (*callback)( void *self, int notification );
;1347:	
;1348:	if (m->cursor_prev == m->cursor)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
NEI4 $427
line 1349
;1349:		return;
ADDRGP4 $426
JUMPV
LABELV $427
line 1351
;1350:
;1351:	if (m->cursor_prev >= 0 && m->cursor_prev < m->nitems)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $429
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $429
line 1352
;1352:	{
line 1353
;1353:		callback = ((menucommon_s*)(m->items[m->cursor_prev]))->callback;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 1354
;1354:		if (callback)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $431
line 1355
;1355:			callback(m->items[m->cursor_prev],QM_LOSTFOCUS);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CALLV
pop
LABELV $431
line 1356
;1356:	}
LABELV $429
line 1358
;1357:	
;1358:	if (m->cursor >= 0 && m->cursor < m->nitems)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $433
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $433
line 1359
;1359:	{
line 1360
;1360:		callback = ((menucommon_s*)(m->items[m->cursor]))->callback;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 1361
;1361:		if (callback)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
line 1362
;1362:			callback(m->items[m->cursor],QM_GOTFOCUS);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CALLV
pop
LABELV $435
line 1363
;1363:	}
LABELV $433
line 1364
;1364:}
LABELV $426
endproc Menu_CursorMoved 32 8
export Menu_SetCursor
proc Menu_SetCursor 4 4
line 1372
;1365:
;1366:/*
;1367:=================
;1368:Menu_SetCursor
;1369:=================
;1370:*/
;1371:void Menu_SetCursor( menuframework_s *m, int cursor )
;1372:{
line 1373
;1373:	if (((menucommon_s*)(m->items[cursor]))->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $438
line 1374
;1374:	{
line 1376
;1375:		// cursor can't go there
;1376:		return;
ADDRGP4 $437
JUMPV
LABELV $438
line 1379
;1377:	}
;1378:
;1379:	m->cursor_prev = m->cursor;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1380
;1380:	m->cursor      = cursor;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1382
;1381:
;1382:	Menu_CursorMoved( m );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_CursorMoved
CALLV
pop
line 1383
;1383:}
LABELV $437
endproc Menu_SetCursor 4 4
export Menu_SetCursorToItem
proc Menu_SetCursorToItem 4 8
line 1391
;1384:
;1385:/*
;1386:=================
;1387:Menu_SetCursorToItem
;1388:=================
;1389:*/
;1390:void Menu_SetCursorToItem( menuframework_s *m, void* ptr )
;1391:{
line 1394
;1392:	int	i;
;1393:
;1394:	for (i=0; i<m->nitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $444
JUMPV
LABELV $441
line 1395
;1395:	{
line 1396
;1396:		if (m->items[i] == ptr)
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
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $445
line 1397
;1397:		{
line 1398
;1398:			Menu_SetCursor( m, i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 1399
;1399:			return;
ADDRGP4 $440
JUMPV
LABELV $445
line 1401
;1400:		}
;1401:	}
LABELV $442
line 1394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $444
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $441
line 1402
;1402:}
LABELV $440
endproc Menu_SetCursorToItem 4 8
export Menu_AdjustCursor
proc Menu_AdjustCursor 24 0
line 1411
;1403:
;1404:/*
;1405:** Menu_AdjustCursor
;1406:**
;1407:** This function takes the given menu, the direction, and attempts
;1408:** to adjust the menu's cursor so that it's at the next available
;1409:** slot.
;1410:*/
;1411:void Menu_AdjustCursor( menuframework_s *m, int dir ) {
line 1412
;1412:	menucommon_s	*item = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1413
;1413:	qboolean		wrapped = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $449
line 1416
;1414:
;1415:wrap:
;1416:	while ( m->cursor >= 0 && m->cursor < m->nitems ) {
line 1417
;1417:		item = ( menucommon_s * ) m->items[m->cursor];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1418
;1418:		if (( item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE) ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
EQU4 $451
line 1419
;1419:			m->cursor += dir;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1420
;1420:		}
line 1421
;1421:		else {
line 1422
;1422:			break;
LABELV $453
line 1424
;1423:		}
;1424:	}
LABELV $450
line 1416
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $454
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $449
LABELV $454
LABELV $451
line 1426
;1425:
;1426:	if ( dir == 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $455
line 1427
;1427:		if ( m->cursor >= m->nitems ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $456
line 1428
;1428:			if ( m->wrapAround ) {
ADDRFP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 1429
;1429:				if ( wrapped ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $461
line 1430
;1430:					m->cursor = m->cursor_prev;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1431
;1431:					return;
ADDRGP4 $447
JUMPV
LABELV $461
line 1433
;1432:				}
;1433:				m->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1434
;1434:				wrapped = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1435
;1435:				goto wrap;
ADDRGP4 $450
JUMPV
LABELV $459
line 1437
;1436:			}
;1437:			m->cursor = m->cursor_prev;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1438
;1438:		}
line 1439
;1439:	}
ADDRGP4 $456
JUMPV
LABELV $455
line 1440
;1440:	else {
line 1441
;1441:		if ( m->cursor < 0 ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
GEI4 $463
line 1442
;1442:			if ( m->wrapAround ) {
ADDRFP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $465
line 1443
;1443:				if ( wrapped ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $467
line 1444
;1444:					m->cursor = m->cursor_prev;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1445
;1445:					return;
ADDRGP4 $447
JUMPV
LABELV $467
line 1447
;1446:				}
;1447:				m->cursor = m->nitems - 1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1448
;1448:				wrapped = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1449
;1449:				goto wrap;
ADDRGP4 $450
JUMPV
LABELV $465
line 1451
;1450:			}
;1451:			m->cursor = m->cursor_prev;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1452
;1452:		}
LABELV $463
line 1453
;1453:	}
LABELV $456
line 1454
;1454:}
LABELV $447
endproc Menu_AdjustCursor 24 0
export Menu_Draw
proc Menu_Draw 32 20
line 1462
;1455:
;1456:/*
;1457:=================
;1458:Menu_Draw
;1459:=================
;1460:*/
;1461:void Menu_Draw( menuframework_s *menu )
;1462:{
line 1467
;1463:	int				i;
;1464:	menucommon_s	*itemptr;
;1465:
;1466:	// draw menu
;1467:	for (i=0; i<menu->nitems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $473
JUMPV
LABELV $470
line 1468
;1468:	{
line 1469
;1469:		itemptr = (menucommon_s*)menu->items[i];
ADDRLP4 0
ADDRLP4 4
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
line 1471
;1470:
;1471:		if (itemptr->flags & QMF_HIDDEN)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 4096
BANDU4
CNSTU4 0
EQU4 $474
line 1472
;1472:			continue;
ADDRGP4 $471
JUMPV
LABELV $474
line 1474
;1473:
;1474:		if (itemptr->ownerdraw)
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $476
line 1475
;1475:		{
line 1477
;1476:			// total subclassing, owner draws everything
;1477:			itemptr->ownerdraw( itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRP4
CALLV
pop
line 1478
;1478:		}	
ADDRGP4 $477
JUMPV
LABELV $476
line 1480
;1479:		else 
;1480:		{
line 1481
;1481:			switch (itemptr->type)
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $478
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $478
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $492-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $492
address $483
address $485
address $484
address $482
address $481
address $486
address $487
address $488
address $489
address $490
code
line 1482
;1482:			{	
LABELV $481
line 1484
;1483:				case MTYPE_RADIOBUTTON:
;1484:					RadioButton_Draw( (menuradiobutton_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RadioButton_Draw
CALLV
pop
line 1485
;1485:					break;
ADDRGP4 $479
JUMPV
LABELV $482
line 1488
;1486:
;1487:				case MTYPE_FIELD:
;1488:					MenuField_Draw( (menufield_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MenuField_Draw
CALLV
pop
line 1489
;1489:					break;
ADDRGP4 $479
JUMPV
LABELV $483
line 1492
;1490:		
;1491:				case MTYPE_SLIDER:
;1492:					Slider_Draw( (menuslider_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Slider_Draw
CALLV
pop
line 1493
;1493:					break;
ADDRGP4 $479
JUMPV
LABELV $484
line 1496
;1494: 
;1495:				case MTYPE_SPINCONTROL:
;1496:					SpinControl_Draw( (menulist_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 SpinControl_Draw
CALLV
pop
line 1497
;1497:					break;
ADDRGP4 $479
JUMPV
LABELV $485
line 1500
;1498:		
;1499:				case MTYPE_ACTION:
;1500:					Action_Draw( (menuaction_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Action_Draw
CALLV
pop
line 1501
;1501:					break;
ADDRGP4 $479
JUMPV
LABELV $486
line 1504
;1502:		
;1503:				case MTYPE_BITMAP:
;1504:					Bitmap_Draw( (menubitmap_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 1505
;1505:					break;
ADDRGP4 $479
JUMPV
LABELV $487
line 1508
;1506:
;1507:				case MTYPE_TEXT:
;1508:					Text_Draw( (menutext_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Text_Draw
CALLV
pop
line 1509
;1509:					break;
ADDRGP4 $479
JUMPV
LABELV $488
line 1512
;1510:
;1511:				case MTYPE_SCROLLLIST:
;1512:					ScrollList_Draw( (menulist_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ScrollList_Draw
CALLV
pop
line 1513
;1513:					break;
ADDRGP4 $479
JUMPV
LABELV $489
line 1516
;1514:				
;1515:				case MTYPE_PTEXT:
;1516:					PText_Draw( (menutext_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 PText_Draw
CALLV
pop
line 1517
;1517:					break;
ADDRGP4 $479
JUMPV
LABELV $490
line 1520
;1518:
;1519:				case MTYPE_BTEXT:
;1520:					BText_Draw( (menutext_s*)itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BText_Draw
CALLV
pop
line 1521
;1521:					break;
ADDRGP4 $479
JUMPV
LABELV $478
line 1524
;1522:
;1523:				default:
;1524:					trap_Error( va("Menu_Draw: unknown type %d", itemptr->type) );
ADDRGP4 $491
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 1525
;1525:			}
LABELV $479
line 1526
;1526:		}
LABELV $477
line 1528
;1527:#ifndef NDEBUG
;1528:		if( uis.debug ) {
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $494
line 1534
;1529:			int	x;
;1530:			int	y;
;1531:			int	w;
;1532:			int	h;
;1533:
;1534:			if( !( itemptr->flags & QMF_INACTIVE ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 16384
BANDU4
CNSTU4 0
NEU4 $497
line 1535
;1535:				x = itemptr->left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 1536
;1536:				y = itemptr->top;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1537
;1537:				w = itemptr->right - itemptr->left + 1;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1538
;1538:				h =	itemptr->bottom - itemptr->top + 1;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1540
;1539:
;1540:				if (itemptr->flags & QMF_HASMOUSEFOCUS) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 512
BANDU4
CNSTU4 0
EQU4 $499
line 1541
;1541:					UI_DrawRect(x, y, w, h, colorYellow );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 colorYellow
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1542
;1542:				}
ADDRGP4 $500
JUMPV
LABELV $499
line 1543
;1543:				else {
line 1544
;1544:					UI_DrawRect(x, y, w, h, colorWhite );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1545
;1545:				}
LABELV $500
line 1546
;1546:			}
LABELV $497
line 1547
;1547:		}
LABELV $494
line 1549
;1548:#endif
;1549:	}
LABELV $471
line 1467
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $473
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $470
line 1551
;1550:
;1551:	itemptr = Menu_ItemAtCursor( menu );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1552
;1552:	if ( itemptr && itemptr->statusbar)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $501
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $501
line 1553
;1553:		itemptr->statusbar( ( void * ) itemptr );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRP4
CALLV
pop
LABELV $501
line 1554
;1554:}
LABELV $469
endproc Menu_Draw 32 20
export Menu_ItemAtCursor
proc Menu_ItemAtCursor 12 0
line 1562
;1555:
;1556:/*
;1557:=================
;1558:Menu_ItemAtCursor
;1559:=================
;1560:*/
;1561:void *Menu_ItemAtCursor( menuframework_s *m )
;1562:{
line 1563
;1563:	if ( m->cursor < 0 || m->cursor >= m->nitems )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $506
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $504
LABELV $506
line 1564
;1564:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $503
JUMPV
LABELV $504
line 1566
;1565:
;1566:	return m->items[m->cursor];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
RETP4
LABELV $503
endproc Menu_ItemAtCursor 12 0
export Menu_ActivateItem
proc Menu_ActivateItem 4 8
line 1574
;1567:}
;1568:
;1569:/*
;1570:=================
;1571:Menu_ActivateItem
;1572:=================
;1573:*/
;1574:sfxHandle_t Menu_ActivateItem( menuframework_s *s, menucommon_s* item ) {
line 1575
;1575:	if (item->type == MTYPE_FIELD) {
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
NEI4 $508
line 1576
;1576:		trap_Cvar_Set("callkeyboard","1");
ADDRGP4 $510
ARGP4
ADDRGP4 $511
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1577
;1577:	}
LABELV $508
line 1579
;1578:	
;1579:	if ( item->callback ) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $512
line 1580
;1580:		item->callback( item, QM_ACTIVATED );
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 1581
;1581:		if( !( item->flags & QMF_SILENT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $514
line 1582
;1582:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $507
JUMPV
LABELV $514
line 1584
;1583:		}
;1584:	}
LABELV $512
line 1585
;1585:	return 0;
CNSTI4 0
RETI4
LABELV $507
endproc Menu_ActivateItem 4 8
export Menu_DefaultKey
proc Menu_DefaultKey 100 8
line 1594
;1586:}
;1587:
;1588:/*
;1589:=================
;1590:Menu_DefaultKey
;1591:=================
;1592:*/
;1593:sfxHandle_t Menu_DefaultKey( menuframework_s *m, int key )
;1594:{
line 1595
;1595:	sfxHandle_t		sound = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1600
;1596:	menucommon_s	*item;
;1597:	int				cursor_prev;
;1598:
;1599:	// menu system keys
;1600:	switch ( key )
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 27
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $519
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $517
LABELV $520
ADDRFP4 4
INDIRI4
CNSTI4 179
EQI4 $519
ADDRGP4 $517
JUMPV
line 1601
;1601:	{
LABELV $519
line 1604
;1602:		case K_MOUSE2:
;1603:		case K_ESCAPE:
;1604:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1605
;1605:			return menu_out_sound;
ADDRGP4 menu_out_sound
INDIRI4
RETI4
ADDRGP4 $516
JUMPV
LABELV $517
line 1608
;1606:	}
;1607:
;1608:	if (!m || !m->nitems)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $521
LABELV $523
line 1609
;1609:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $521
line 1612
;1610:
;1611:	// route key stimulus to widget
;1612:	item = Menu_ItemAtCursor( m );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 1613
;1613:	if (item && !(item->flags & (QMF_GRAYED|QMF_INACTIVE)))
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $524
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
ADDRLP4 32
INDIRU4
NEU4 $524
line 1614
;1614:	{
line 1615
;1615:		switch (item->type)
ADDRLP4 36
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
LTI4 $526
ADDRLP4 36
INDIRI4
CNSTI4 8
GTI4 $526
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $534-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $534
address $531
address $526
address $529
address $533
address $530
address $526
address $526
address $532
code
line 1616
;1616:		{
LABELV $529
line 1618
;1617:			case MTYPE_SPINCONTROL:
;1618:				sound = SpinControl_Key( (menulist_s*)item, key );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 SpinControl_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
line 1619
;1619:				break;
ADDRGP4 $527
JUMPV
LABELV $530
line 1622
;1620:
;1621:			case MTYPE_RADIOBUTTON:
;1622:				sound = RadioButton_Key( (menuradiobutton_s*)item, key );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 RadioButton_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 1623
;1623:				break;
ADDRGP4 $527
JUMPV
LABELV $531
line 1626
;1624:
;1625:			case MTYPE_SLIDER:
;1626:				sound = Slider_Key( (menuslider_s*)item, key );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 Slider_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 1627
;1627:				break;
ADDRGP4 $527
JUMPV
LABELV $532
line 1630
;1628:
;1629:			case MTYPE_SCROLLLIST:
;1630:				sound = ScrollList_Key( (menulist_s*)item, key );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 ScrollList_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRI4
ASGNI4
line 1631
;1631:				break;
ADDRGP4 $527
JUMPV
LABELV $533
line 1634
;1632:
;1633:			case MTYPE_FIELD:
;1634:				sound = MenuField_Key( (menufield_s*)item, &key );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 60
ADDRGP4 MenuField_Key
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 1635
;1635:				break;
LABELV $526
LABELV $527
line 1638
;1636:		}
;1637:
;1638:		if (sound) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $536
line 1640
;1639:			// key was handled
;1640:			return sound;		
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $516
JUMPV
LABELV $536
line 1642
;1641:		}
;1642:	}
LABELV $524
line 1645
;1643:
;1644:	// default handling
;1645:	switch ( key )
ADDRLP4 36
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 155
EQI4 $540
ADDRLP4 40
CNSTI4 156
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $542
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
GTI4 $561
LABELV $560
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $555
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $563
LABELV $562
ADDRFP4 4
INDIRI4
CNSTI4 9
EQI4 $547
ADDRGP4 $538
JUMPV
LABELV $563
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 132
EQI4 $544
ADDRLP4 52
INDIRI4
CNSTI4 133
EQI4 $547
ADDRGP4 $538
JUMPV
LABELV $561
ADDRLP4 56
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 178
LTI4 $564
ADDRLP4 56
INDIRI4
CNSTI4 188
GTI4 $565
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $566-712
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $566
address $550
address $538
address $550
address $538
address $538
address $538
address $538
address $555
address $555
address $555
address $555
code
LABELV $564
ADDRFP4 4
INDIRI4
CNSTI4 169
EQI4 $555
ADDRGP4 $538
JUMPV
LABELV $565
ADDRLP4 60
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 217
LTI4 $538
ADDRLP4 60
INDIRI4
CNSTI4 232
GTI4 $538
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $568-868
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $568
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
address $555
code
line 1646
;1646:	{
LABELV $540
line 1649
;1647:#ifndef NDEBUG
;1648:		case K_F11:
;1649:			uis.debug ^= 1;
ADDRLP4 64
ADDRGP4 uis+11388
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1650
;1650:			break;
ADDRGP4 $539
JUMPV
LABELV $542
line 1653
;1651:
;1652:		case K_F12:
;1653:			trap_Cmd_ExecuteText(EXEC_APPEND, "screenshot\n");
CNSTI4 2
ARGI4
ADDRGP4 $543
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1654
;1654:			break;
ADDRGP4 $539
JUMPV
LABELV $544
line 1657
;1655:#endif
;1656:		case K_UPARROW:
;1657:			cursor_prev    = m->cursor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1658
;1658:			m->cursor_prev = m->cursor;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
line 1659
;1659:			m->cursor--;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1660
;1660:			Menu_AdjustCursor( m, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Menu_AdjustCursor
CALLV
pop
line 1661
;1661:			if ( cursor_prev != m->cursor ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $539
line 1662
;1662:				Menu_CursorMoved( m );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_CursorMoved
CALLV
pop
line 1663
;1663:				sound = menu_move_sound;
ADDRLP4 4
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 1664
;1664:			}
line 1665
;1665:			break;
ADDRGP4 $539
JUMPV
LABELV $547
line 1669
;1666:
;1667:		case K_TAB:
;1668:		case K_DOWNARROW:
;1669:			cursor_prev    = m->cursor;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1670
;1670:			m->cursor_prev = m->cursor;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 76
INDIRP4
INDIRI4
ASGNI4
line 1671
;1671:			m->cursor++;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1672
;1672:			Menu_AdjustCursor( m, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_AdjustCursor
CALLV
pop
line 1673
;1673:			if ( cursor_prev != m->cursor ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $539
line 1674
;1674:				Menu_CursorMoved( m );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Menu_CursorMoved
CALLV
pop
line 1675
;1675:				sound = menu_move_sound;
ADDRLP4 4
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 1676
;1676:			}
line 1677
;1677:			break;
ADDRGP4 $539
JUMPV
LABELV $550
line 1681
;1678:
;1679:		case K_MOUSE1:
;1680:		case K_MOUSE3:
;1681:			if (item)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 1682
;1682:				if ((item->flags & QMF_HASMOUSEFOCUS) && !(item->flags & (QMF_GRAYED|QMF_INACTIVE)))
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
ASGNU4
ADDRLP4 88
CNSTU4 0
ASGNU4
ADDRLP4 84
INDIRU4
CNSTU4 512
BANDU4
ADDRLP4 88
INDIRU4
EQU4 $539
ADDRLP4 84
INDIRU4
CNSTU4 24576
BANDU4
ADDRLP4 88
INDIRU4
NEU4 $539
line 1683
;1683:					return (Menu_ActivateItem( m, item ));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 Menu_ActivateItem
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
RETI4
ADDRGP4 $516
JUMPV
line 1684
;1684:			break;
LABELV $555
line 1708
;1685:
;1686:		case K_JOY1:
;1687:		case K_JOY2:
;1688:		case K_JOY3:
;1689:		case K_JOY4:
;1690:		case K_AUX1:
;1691:		case K_AUX2:
;1692:		case K_AUX3:
;1693:		case K_AUX4:
;1694:		case K_AUX5:
;1695:		case K_AUX6:
;1696:		case K_AUX7:
;1697:		case K_AUX8:
;1698:		case K_AUX9:
;1699:		case K_AUX10:
;1700:		case K_AUX11:
;1701:		case K_AUX12:
;1702:		case K_AUX13:
;1703:		case K_AUX14:
;1704:		case K_AUX15:
;1705:		case K_AUX16:
;1706:		case K_KP_ENTER:
;1707:		case K_ENTER:
;1708:			if (item)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 1709
;1709:				if (!(item->flags & (QMF_MOUSEONLY|QMF_GRAYED|QMF_INACTIVE)))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $539
line 1710
;1710:					return (Menu_ActivateItem( m, item ));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 Menu_ActivateItem
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
RETI4
ADDRGP4 $516
JUMPV
line 1711
;1711:			break;
LABELV $538
LABELV $539
line 1714
;1712:	}
;1713:
;1714:	return sound;
ADDRLP4 4
INDIRI4
RETI4
LABELV $516
endproc Menu_DefaultKey 100 8
export Menu_Cache
proc Menu_Cache 68 8
line 1723
;1715:}
;1716:
;1717:/*
;1718:=================
;1719:Menu_Cache
;1720:=================
;1721:*/
;1722:void Menu_Cache( void )
;1723:{
line 1724
;1724:	uis.charset			= trap_R_RegisterShaderNoMip( "gfx/2d/bigchars" );
ADDRGP4 $572
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11404
ADDRLP4 0
INDIRI4
ASGNI4
line 1725
;1725:	uis.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $574
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11408
ADDRLP4 4
INDIRI4
ASGNI4
line 1726
;1726:	uis.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $576
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11412
ADDRLP4 8
INDIRI4
ASGNI4
line 1727
;1727:	uis.charsetPropB	= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $578
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11416
ADDRLP4 12
INDIRI4
ASGNI4
line 1728
;1728:	uis.cursor          = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $580
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11420
ADDRLP4 16
INDIRI4
ASGNI4
line 1729
;1729:	uis.rb_on           = trap_R_RegisterShaderNoMip( "menu/art/switch_on" );
ADDRGP4 $582
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11424
ADDRLP4 20
INDIRI4
ASGNI4
line 1730
;1730:	uis.rb_off          = trap_R_RegisterShaderNoMip( "menu/art/switch_off" );
ADDRGP4 $584
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11428
ADDRLP4 24
INDIRI4
ASGNI4
line 1732
;1731:
;1732:	uis.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $586
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11392
ADDRLP4 28
INDIRI4
ASGNI4
line 1733
;1733:	if ( uis.glconfig.hardwareType == GLHW_RAGEPRO ) {
ADDRGP4 uis+56+11288
INDIRI4
CNSTI4 3
NEI4 $587
line 1735
;1734:		// the blend effect turns to shit with the normal 
;1735:		uis.menuBackShader	= trap_R_RegisterShaderNoMip( "menubackRagePro" );
ADDRGP4 $592
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11396
ADDRLP4 32
INDIRI4
ASGNI4
line 1736
;1736:	} else {
ADDRGP4 $588
JUMPV
LABELV $587
line 1737
;1737:		uis.menuBackShader	= trap_R_RegisterShaderNoMip( "menuback_blueish" );
ADDRGP4 $594
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11396
ADDRLP4 32
INDIRI4
ASGNI4
line 1738
;1738:	}
LABELV $588
line 1739
;1739:	uis.menuBackNoLogoShader = trap_R_RegisterShaderNoMip( "menubacknologo_blueish" );
ADDRGP4 $596
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uis+11400
ADDRLP4 32
INDIRI4
ASGNI4
line 1741
;1740:
;1741:	menu_in_sound	= trap_S_RegisterSound( "sound/misc/menu1.wav", qfalse );
ADDRGP4 $597
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 menu_in_sound
ADDRLP4 36
INDIRI4
ASGNI4
line 1742
;1742:	menu_move_sound	= trap_S_RegisterSound( "sound/misc/menu2.wav", qfalse );
ADDRGP4 $598
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 menu_move_sound
ADDRLP4 40
INDIRI4
ASGNI4
line 1743
;1743:	menu_out_sound	= trap_S_RegisterSound( "sound/misc/menu3.wav", qfalse );
ADDRGP4 $599
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 menu_out_sound
ADDRLP4 44
INDIRI4
ASGNI4
line 1744
;1744:	menu_buzz_sound	= trap_S_RegisterSound( "sound/misc/menu4.wav", qfalse );
ADDRGP4 $600
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 menu_buzz_sound
ADDRLP4 48
INDIRI4
ASGNI4
line 1745
;1745:	weaponChangeSound	= trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $601
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 weaponChangeSound
ADDRLP4 52
INDIRI4
ASGNI4
line 1748
;1746:
;1747:	// need a nonzero sound, make an empty sound for this
;1748:	menu_null_sound = -1;
ADDRGP4 menu_null_sound
CNSTI4 -1
ASGNI4
line 1750
;1749:
;1750:	sliderBar = trap_R_RegisterShaderNoMip( "menu/art/slider2" );
ADDRGP4 $602
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 sliderBar
ADDRLP4 56
INDIRI4
ASGNI4
line 1751
;1751:	sliderButton_0 = trap_R_RegisterShaderNoMip( "menu/art/sliderbutt_0" );
ADDRGP4 $603
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 sliderButton_0
ADDRLP4 60
INDIRI4
ASGNI4
line 1752
;1752:	sliderButton_1 = trap_R_RegisterShaderNoMip( "menu/art/sliderbutt_1" );
ADDRGP4 $604
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 sliderButton_1
ADDRLP4 64
INDIRI4
ASGNI4
line 1753
;1753:}
LABELV $570
endproc Menu_Cache 68 8
bss
align 4
LABELV sliderButton_1
skip 4
align 4
LABELV sliderButton_0
skip 4
align 4
LABELV sliderBar
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
import list_color
import name_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
export weaponChangeSound
align 4
LABELV weaponChangeSound
skip 4
export menu_null_sound
align 4
LABELV menu_null_sound
skip 4
export menu_buzz_sound
align 4
LABELV menu_buzz_sound
skip 4
export menu_out_sound
align 4
LABELV menu_out_sound
skip 4
export menu_move_sound
align 4
LABELV menu_move_sound
skip 4
export menu_in_sound
align 4
LABELV menu_in_sound
skip 4
import Menu_Focus
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
LABELV $604
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $603
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $602
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $601
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $600
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $599
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $598
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $597
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $596
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 110
byte 1 111
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $594
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $592
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $586
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $584
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 95
byte 1 111
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $582
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 95
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $580
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $578
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $576
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $574
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $572
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $543
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $511
byte 1 49
byte 1 0
align 1
LABELV $510
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 107
byte 1 101
byte 1 121
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $491
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $423
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $407
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $193
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $191
byte 1 111
byte 1 102
byte 1 102
byte 1 0
