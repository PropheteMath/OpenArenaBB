/*
 ===========================================================================
 Copyright (C) 1999-2005 Id Software, Inc.

 This file is part of Quake III Arena source code.

 Quake III Arena source code is free software; you can redistribute it
 and/or modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation; either version 2 of the License,
 or (at your option) any later version.

 Quake III Arena source code is distributed in the hope that it will be
 useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Quake III Arena source code; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 ===========================================================================
 */

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/keycodes.h>
#include <screen/screen.h>
#include <input/screen_helpers.h>
#include <gestures/set.h>
#include <gestures/types.h>
#include <gestures/set.h>
#include <gestures/swipe.h>
#include <gestures/pinch.h>
#include <gestures/tap.h>
#include <bps/bps.h>
#include <bps/event.h>
#include <bps/screen.h>
#include <bps/navigator.h>
#include <bps/sensor.h>
#include <bps/orientation.h>
#include <bps/virtualkeyboard.h>
#include <bps/deviceinfo.h>
#include <screen/screen.h>

#include <EGL/egl.h>
#include <EGL/eglext.h>


#include "../qcommon/q_platform.h"
#include "../renderer/tr_local.h"
#include "../client/client2.h"
#include "../sys/sys_local.h"
#include "../q3_ui/ui_local.h"

#define NUM_VERT 720
#define PI 3.14159f

qboolean ingamemenu = qfalse;


static GLfloat* vert;
int setup_vert = 0;

static cvar_t *in_mouse;
static cvar_t *in_dgamouse;
cvar_t *in_subframe;
cvar_t *in_nograb;

static qboolean mouse_avail;
static qboolean mouse_active = qfalse;

static int movX, movY, movBoundX, movBoundY, movRad, movBoundRad, r1square, r2square;
static int jmpBoundX, jmpBoundY, jmpBoundRad;
static int fireBoundX, fireBoundY, fireBoundRad;
static int weaponNextX, weaponNextY, weaponNextRad;

int keyboard_t = 0;

int prevCase = 0;
int prevX = 0;
int tempX = 0;
int prevY = 0;
int tempY = 0;
int oldDist = 0;
int velocity = 0;
int dir = 0;

typedef enum
{
    RSERR_OK,

    RSERR_INVALID_FULLSCREEN, RSERR_INVALID_MODE,

    RSERR_UNKNOWN
} rserr_t;

void (*qglLockArraysEXT)(GLint first, GLsizei count) = NULL;
void (*qglUnlockArraysEXT)(void) = NULL;

struct
{
    EGLint surface_type;
    EGLint red_size;
    EGLint green_size;
    EGLint blue_size;
    EGLint alpha_size;
    EGLint samples;
    EGLint config_id;
} egl_conf_attr = { .surface_type = EGL_WINDOW_BIT, .red_size = EGL_DONT_CARE, .green_size =
EGL_DONT_CARE, .blue_size = EGL_DONT_CARE, .alpha_size = EGL_DONT_CARE, .samples =
EGL_DONT_CARE, .config_id = EGL_DONT_CARE, };

extern void etc1_compress_tex_image(GLenum target, GLint level, GLenum internalformat,
        GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type,
        const GLvoid *pixels);

static int isopaque(GLint width, GLint height, const GLvoid *pixels)
{
    unsigned char const *cpixels = (unsigned char const *) pixels;

    int i;

    for (i = 0; i < width * height; i++) {
        if (cpixels[i * 4 + 3] != 0xff)
            return 0;
    }

    return 1;
}

void GLimp_EndFrame( void )
{
    char buffer[500];
    char* p;
    int len;
    const char *msg = NULL;
    int interval;
    int size[2];
    int pos[2];
    int rc;

    if ( strcmp( r_drawBuffer->string, "GL_FRONT" ) != 0 )
    {
        SwapBuffers();
    }
}



void rgba4444_convert_tex_image(GLenum target, GLint level, GLenum internalformat, GLsizei width,
        GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
    unsigned char const *cpixels = (unsigned char const *) pixels;

    unsigned short *rgba4444data = malloc(2 * width * height);

    int i;

    for (i = 0; i < width * height; i++) {
        unsigned char r, g, b, a;

        r = cpixels[4 * i] >> 4;
        g = cpixels[4 * i + 1] >> 4;
        b = cpixels[4 * i + 2] >> 4;
        a = cpixels[4 * i + 3] >> 4;

        rgba4444data[i] = r << 12 | g << 8 | b << 4 | a;
    }

    glTexImage2D(target, level, format, width, height, border, format, GL_UNSIGNED_SHORT_4_4_4_4,
            rgba4444data);

    free(rgba4444data);
}

void myglTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height,
        GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
    static int opaque = 0;

if (format == GL_RGB && type == GL_UNSIGNED_BYTE) {
    assert(level == 0);
    opaque = 1;

    etc1_compress_tex_image(target, level, format, width, height, border, format, type, pixels);
} else if (format == GL_RGBA && type == GL_UNSIGNED_BYTE) {
    if (level == 0)
    opaque = isopaque(width, height, pixels);

    if (opaque)
    etc1_compress_tex_image(target, level, format, width, height, border, format, type, pixels);
    else
    rgba4444_convert_tex_image(target, level, format, width, height, border, format, type, pixels);
} else
assert(0);
}

static int firstclear = 1;

void myglClear(GLbitfield mask)
{
if (firstclear) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    firstclear = 0;
}
}

/* TODO any other functions that need modifying for stereo? eg glReadPixels? */

static GLenum draw_buffer = GL_BACK;
static struct rect_t
{
GLint x, y;
GLsizei w, h;
} viewport = { 0, 0, -1, -1 }, scissor = { 0, 0, -1, -1 };

static void fix_rect(struct rect_t *r)
{
if (r->w == -1) {
    r->w = glConfig.vidWidth;
}
if (r->h == -1) {
    r->h = glConfig.vidHeight;
}
}

static void fudge_rect(struct rect_t *out, const struct rect_t *in, int xshift, int xoffset)
{
out->x = xoffset + (in->x >> xshift);
out->y = in->y;
out->w = (xoffset + ((in->x + in->w) >> xshift)) - out->x;
out->h = in->h;
}

static void update_viewport_and_scissor(void)
{
int xshift = 0, xoffset = 0;
struct rect_t r;

switch (draw_buffer) {
    case GL_BACK_LEFT:
        xshift = 1;
        break;
    case GL_BACK_RIGHT:
        xshift = 1;
        xoffset = glConfig.vidWidth >> 1;
        break;
}

fix_rect(&viewport);
fudge_rect(&r, &viewport, xshift, xoffset);
glViewport(r.x, r.y, r.w, r.h);

fix_rect(&scissor);
fudge_rect(&r, &scissor, xshift, xoffset);
glScissor(r.x, r.y, r.w, r.h);
}

void myglDrawBuffer(GLenum mode)
{
draw_buffer = mode;
update_viewport_and_scissor();
}

void myglViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
viewport.x = x;
viewport.y = y;
viewport.w = width;
viewport.h = height;
update_viewport_and_scissor();
}

void myglScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
scissor.x = x;
scissor.y = y;
scissor.w = width;
scissor.h = height;
update_viewport_and_scissor();
}

/*
 ===============
 GLimp_Shutdown
 ===============
 */
void GLimp_Shutdown(void)
{
}

/*
 ===============
 GLimp_LogComment
 ===============
 */
void GLimp_LogComment(char *comment)
{
}

/*
 ===============
 GLimp_StartDriverAndSetMode
 ===============
 */

static EGLDisplay g_EGLDisplay;
static EGLConfig g_EGLConfig;
static EGLContext g_EGLContext;
static EGLSurface g_EGLWindowSurface;
static screen_context_t screen_ctx;
static screen_event_t screen_ev;
static screen_window_t screen_win;
static qboolean asKeyboard = qfalse;

static qboolean GLimp_StartDriverAndSetMode(int mode, qboolean fullscreen, NativeWindowType hWnd)
{

bps_initialize();
navigator_request_events(0);

//As the device a full onscreen keayboard
deviceinfo_details_t *details;
if (BPS_SUCCESS == deviceinfo_get_details(&details)) {
    if(deviceinfo_details_get_keyboard(details) ==  DEVICEINFO_KEYBOARD_PRESENT) asKeyboard = qtrue;
    deviceinfo_free_details(&details);
}


int usage = SCREEN_USAGE_DISPLAY | SCREEN_USAGE_OPENGL_ES1;

int transp = SCREEN_TRANSPARENCY_NONE;
EGLint interval = 1;
int size[2] = { -1, -1 };
int pos[2] = { 0, 0 };
int nbuffers = 2;
int format;
EGLint err;

/* TODO cleanup on failure... */

/* EGL Setup */
const EGLint s_configAttribs[] = {
EGL_RED_SIZE, 5,
EGL_GREEN_SIZE, 6,
EGL_BLUE_SIZE, 5,
EGL_ALPHA_SIZE, 0,
EGL_DEPTH_SIZE, 16,
EGL_STENCIL_SIZE, 0,
EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
EGL_SAMPLE_BUFFERS, 0,
EGL_MIN_SWAP_INTERVAL, 0,
EGL_NONE };

EGLint numConfigs;
EGLint majorVersion;
EGLint minorVersion;

g_EGLDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
if (g_EGLDisplay == EGL_NO_DISPLAY) {
    ri.Printf(PRINT_ALL, "eglGetDisplay() failed\n");
    return qfalse;
}

if (!eglInitialize(g_EGLDisplay, &majorVersion, &minorVersion)) {
    ri.Printf(PRINT_ALL, "eglInitialize() failed\n");
    return qfalse;
}
ri.Printf(PRINT_ALL, "EGL Version : major=%d minor=%d \n", majorVersion, minorVersion);

g_EGLConfig = chooseEgl_config(g_EGLDisplay, "rgba8888");

{
    EGLint r, g, b, a, depth, stencil, samples, sample_buffers;
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_RED_SIZE, &r);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_GREEN_SIZE, &g);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_BLUE_SIZE, &b);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_ALPHA_SIZE, &a);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_DEPTH_SIZE, &depth);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_STENCIL_SIZE, &stencil);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_SAMPLES, &samples);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_SAMPLE_BUFFERS, &sample_buffers);
    ri.Printf(PRINT_ALL, "Chose EGL config %d: r=%d,g=%d,b=%d,a=%d, "
            "depth=%d,stencil=%d, samples=%d,sample_buffers=%d\n", (int) g_EGLConfig, r, g, b, a,
            depth, stencil, samples, sample_buffers);
}

g_EGLContext = eglCreateContext(g_EGLDisplay, g_EGLConfig, EGL_NO_CONTEXT, NULL);
err = eglGetError();
if (g_EGLContext == EGL_NO_CONTEXT) {
    Com_Printf("Demo Thread Init: can't create gles2 context!");
    return qfalse;
}

err = screen_create_context(&screen_ctx, 0);
if (err) {
    Com_Printf("screen_create_context");
    return qfalse;
}

err = screen_create_window(&screen_win, screen_ctx);
if (err) {
    Com_Printf("screen_create_window");
    return qfalse;
}

format = choose_format(g_EGLDisplay, g_EGLConfig);
err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_FORMAT, &format);
if (err) {
    Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_FORMAT)");
    return qfalse;
}

err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_USAGE, &usage);
if (err) {
    Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_USAGE)");
    return qfalse;
}

int scrsize[2];
screen_get_window_property_iv(screen_win, SCREEN_PROPERTY_SIZE, &scrsize);
ResWidth = scrsize[0];
ResHeight = scrsize[1];

size[0] = RESOLUTION_WIDTH;
size[1] = RESOLUTION_HEIGHT;

err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_BUFFER_SIZE, size);
if (err) {
    Com_Printf("screen_set_window_property_iv(screen_set_window_property_iv)");
    return qfalse;
}

if (size[0] > 0 && size[1] > 0) {
    err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_SIZE, size);
    if (err) {
        Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_SIZE)");
        return qfalse;
    }
} else {
    err = screen_get_window_property_iv(screen_win, SCREEN_PROPERTY_SIZE, size);
    if (err) {
        Com_Printf("screen_get_window_property_iv(SCREEN_PROPERTY_SIZE)");
        return qfalse;
    }
}

glConfig.vidWidth = size[0];
glConfig.vidHeight = size[1];
glConfig.isFullscreen = true;
glConfig.displayFrequency = 60;
glConfig.deviceSupportsGamma = true;

    InitControls();

if (pos[0] != 0 || pos[1] != 0) {
    err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_POSITION, pos);
    if (err) {
        Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_POSITION)");
        return qfalse;
    }
}

err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_TRANSPARENCY, &transp);
if (err) {
    Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_TRANSPARENCY)");
    return qfalse;
}

err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_SWAP_INTERVAL, &interval);
if (err) {
    Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_SWAP_INTERVAL)");
    return qfalse;
}

err = screen_create_window_buffers(screen_win, nbuffers);
if (err) {
    Com_Printf("screen_create_window_buffers");
    return qfalse;
}

size[0] = RESOLUTION_WIDTH;
size[1] = RESOLUTION_HEIGHT;
err = screen_set_window_property_iv(screen_win, SCREEN_PROPERTY_SIZE, size);
if (err) {
    Com_Printf("screen_set_window_property_iv(SCREEN_PROPERTY_SIZE)");
    return qfalse;
}

err = screen_create_event(&screen_ev);
if (err) {
    Com_Printf("screen_create_event");
    return qfalse;
}
screen_request_events(screen_ctx);

g_EGLWindowSurface = eglCreateWindowSurface(g_EGLDisplay, g_EGLConfig, screen_win, NULL);
if (g_EGLWindowSurface == EGL_NO_SURFACE) {
    Com_Printf("Demo Thread Init: can't create surface!");
    return qfalse;
}

err = eglMakeCurrent(g_EGLDisplay, g_EGLWindowSurface, g_EGLWindowSurface, g_EGLContext);
if (err != EGL_TRUE) {
    Com_Printf("Demo Thread Init: can't make current!");
    return qfalse;
}

{
    EGLint width, height, color, depth, stencil;
    eglQuerySurface(g_EGLDisplay, g_EGLWindowSurface, EGL_WIDTH, &width);
    eglQuerySurface(g_EGLDisplay, g_EGLWindowSurface, EGL_HEIGHT, &height);
    ri.Printf(PRINT_ALL, "Window size: %dx%d\n", width, height);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_BUFFER_SIZE, &color);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_DEPTH_SIZE, &depth);
    eglGetConfigAttrib(g_EGLDisplay, g_EGLConfig, EGL_STENCIL_SIZE, &stencil);
    glConfig.vidWidth = width;
    glConfig.vidHeight = height;
    glConfig.colorBits = color;
    glConfig.depthBits = depth;
    glConfig.stencilBits = stencil;
}

// set swap interval
if (eglSwapInterval(g_EGLDisplay, r_swapInterval->integer) == EGL_FALSE) {
    ri.Printf(PRINT_ALL, "Could not set swap interval\n");
    return qfalse;
}

if (r_stereoEnabled->integer)
    glConfig.stereoEnabled = qtrue;
else
    glConfig.stereoEnabled = qfalse;

return qtrue;
}

EGLConfig chooseEgl_config(EGLDisplay eglDisplay, const char* str)
{
EGLConfig egl_conf = (EGLConfig) 0;
EGLConfig *egl_configs;
EGLint egl_num_configs;
EGLint val;
EGLBoolean rc;
const char *tok;
EGLint i;

if (str != NULL) {
    tok = str;
    while (*tok == ' ' || *tok == ',') {
        tok++;
    }

    while (*tok != '\0') {
        if (strncmp(tok, "rgba8888", strlen("rgba8888")) == 0) {
            egl_conf_attr.red_size = 8;
            egl_conf_attr.green_size = 8;
            egl_conf_attr.blue_size = 8;
            egl_conf_attr.alpha_size = 8;
            tok += strlen("rgba8888");
        } else if (strncmp(tok, "rgba5551", strlen("rgba5551")) == 0) {
            egl_conf_attr.red_size = 5;
            egl_conf_attr.green_size = 5;
            egl_conf_attr.blue_size = 5;
            egl_conf_attr.alpha_size = 1;
            tok += strlen("rgba5551");
        } else if (strncmp(tok, "rgba4444", strlen("rgba4444")) == 0) {
            egl_conf_attr.red_size = 4;
            egl_conf_attr.green_size = 4;
            egl_conf_attr.blue_size = 4;
            egl_conf_attr.alpha_size = 4;
            tok += strlen("rgba4444");
        } else if (strncmp(tok, "rgb565", strlen("rgb565")) == 0) {
            egl_conf_attr.red_size = 5;
            egl_conf_attr.green_size = 6;
            egl_conf_attr.blue_size = 5;
            egl_conf_attr.alpha_size = 0;
            tok += strlen("rgb565");
        } else if (isdigit(*tok)) {
            val = atoi(tok);
            while (isdigit(*(++tok)))
                ;
            if (*tok == 'x') {
                egl_conf_attr.samples = val;
                tok++;
            } else {
                egl_conf_attr.config_id = val;
            }
        } else {
            ri.Printf(PRINT_ALL, "invalid configuration specifier: ");
            while (*tok != ' ' && *tok != ',' && *tok != '\0') {
            fputc(*tok++, stderr);
        }
    fputc('\n', stderr);
}

while (*tok == ' ' || *tok == ',') {
    tok++;
}
}
}

rc = eglGetConfigs(eglDisplay, NULL, 0, &egl_num_configs);
if (rc != EGL_TRUE) {
Com_Printf("eglGetConfigs");
return egl_conf;
}
if (egl_num_configs == 0) {
Com_Printf("eglGetConfigs: could not find a configuration\n");
return egl_conf;
}

egl_configs = malloc(egl_num_configs * sizeof(*egl_configs));
if (egl_configs == NULL) {
Com_Printf("could not allocate memory for %d EGL configs\n", egl_num_configs);
return egl_conf;
}

rc = eglGetConfigs(eglDisplay, egl_configs, egl_num_configs, &egl_num_configs);
if (rc != EGL_TRUE) {
Com_Printf("eglGetConfigs");
free(egl_configs);
return egl_conf;
}

for (i = 0; i < egl_num_configs; i++) {
if (egl_conf_attr.config_id != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_CONFIG_ID, &val);
if (val == egl_conf_attr.config_id) {
    egl_conf = egl_configs[i];
    break;
} else {
    continue;
}
}

eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_SURFACE_TYPE, &val);
if ((val & egl_conf_attr.surface_type) != egl_conf_attr.surface_type) {
continue;
}

eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_RENDERABLE_TYPE, &val);
if (!(val & EGL_OPENGL_ES_BIT)) {
continue;
}

eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_DEPTH_SIZE, &val);
if (val == 0) {
continue;
}

if (egl_conf_attr.red_size != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_RED_SIZE, &val);
if (val != egl_conf_attr.red_size) {
    continue;
}
}
if (egl_conf_attr.green_size != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_GREEN_SIZE, &val);
if (val != egl_conf_attr.green_size) {
    continue;
}
}
if (egl_conf_attr.blue_size != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_BLUE_SIZE, &val);
if (val != egl_conf_attr.blue_size) {
    continue;
}
}
if (egl_conf_attr.alpha_size != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_ALPHA_SIZE, &val);
if (val != egl_conf_attr.alpha_size) {
    continue;
}
}
if (egl_conf_attr.samples != EGL_DONT_CARE) {
eglGetConfigAttrib(eglDisplay, egl_configs[i], EGL_SAMPLES, &val);
if (val != egl_conf_attr.samples) {
    continue;
}
}

egl_conf = egl_configs[i];
break;
}

free(egl_configs);

if (egl_conf == (EGLConfig) 0) {
Com_Printf("eglChooseConfig: could not find a matching configuration\n");
}

return egl_conf;
}

static qboolean GLimp_HaveExtension(const char *ext)
{
return qfalse;
}

/*
 ===============
 GLimp_InitExtensions
 ===============
 */
static void GLimp_InitExtensions(void)
{
if (!r_allowExtensions->integer) {
ri.Printf(PRINT_ALL, "* IGNORING OPENGL EXTENSIONS *\n");
return;
}

ri.Printf(PRINT_ALL, "Initializing OpenGL extensions\n");

glConfig.textureCompression = TC_NONE;

 // GL_EXT_texture_compression_s3tc
if (GLimp_HaveExtension("GL_ARB_texture_compression")
&& GLimp_HaveExtension("GL_EXT_texture_compression_s3tc")) {
if (r_ext_compressed_textures->value) {
glConfig.textureCompression = TC_S3TC_ARB;
ri.Printf(PRINT_ALL, "...using GL_EXT_texture_compression_s3tc\n");
} else {
ri.Printf(PRINT_ALL, "...ignoring GL_EXT_texture_compression_s3tc\n");
}
} else {
ri.Printf(PRINT_ALL, "...GL_EXT_texture_compression_s3tc not found\n");
}

 // GL_S3_s3tc ... legacy extension before GL_EXT_texture_compression_s3tc.
if (glConfig.textureCompression == TC_NONE) {
if (GLimp_HaveExtension("GL_S3_s3tc")) {
if (r_ext_compressed_textures->value) {
    glConfig.textureCompression = TC_S3TC;
    ri.Printf(PRINT_ALL, "...using GL_S3_s3tc\n");
} else {
    ri.Printf(PRINT_ALL, "...ignoring GL_S3_s3tc\n");
}
} else {
ri.Printf(PRINT_ALL, "...GL_S3_s3tc not found\n");
}
}

 // GL_EXT_texture_env_add
glConfig.textureEnvAddAvailable = qtrue;

textureFilterAnisotropic = qfalse;
}

int choose_format(EGLDisplay eglDisplay, EGLConfig egl_conf)
{
EGLint buffer_bit_depth, alpha_bit_depth;

eglGetConfigAttrib(eglDisplay, egl_conf, EGL_BUFFER_SIZE, &buffer_bit_depth);
eglGetConfigAttrib(eglDisplay, egl_conf, EGL_ALPHA_SIZE, &alpha_bit_depth);
switch (buffer_bit_depth) {
case 32: {
return SCREEN_FORMAT_RGBA8888;
}
case 24: {
return SCREEN_FORMAT_RGB888;
}
case 16: {
switch (alpha_bit_depth) {
    case 4: {
        return SCREEN_FORMAT_RGBA4444;
    }
    case 1: {
        return SCREEN_FORMAT_RGBA5551;
    }
    default: {
        return SCREEN_FORMAT_RGB565;
    }
}
}
default: {
return 0;
}
}
}
/*
 ===============
 GLimp_Init

 This routine is responsible for initializing the OS specific portions
 of OpenGL
 ===============
 */
void GLimp_Init(void)
{
qboolean success = qtrue;

Sys_GLimpInit();

 // create the window and set up the context
if (!GLimp_StartDriverAndSetMode(r_mode->integer, r_fullscreen->integer,
(NativeWindowType) ri.Cvar_Get("vc_wnd", "0", CVAR_LATCH)->integer)) {
success = qfalse;
}

if (!success)
ri.Error(ERR_FATAL, "GLimp_Init() - could not load OpenGL subsystem\n");

 // This values force the UI to disable driver selection
glConfig.driverType = GLDRV_ICD;
glConfig.hardwareType = GLHW_GENERIC;
glConfig.deviceSupportsGamma = qfalse;

 // get our config strings
Q_strncpyz(glConfig.vendor_string, (char *) qglGetString(GL_VENDOR),
sizeof(glConfig.vendor_string));
Q_strncpyz(glConfig.renderer_string, (char *) qglGetString(GL_RENDERER),
sizeof(glConfig.renderer_string));
if (*glConfig.renderer_string
&& glConfig.renderer_string[strlen(glConfig.renderer_string) - 1] == '\n')
glConfig.renderer_string[strlen(glConfig.renderer_string) - 1] = 0;
Q_strncpyz(glConfig.version_string, (char *) qglGetString(GL_VERSION),
sizeof(glConfig.version_string));
Q_strncpyz(glConfig.extensions_string, (char *) qglGetString(GL_EXTENSIONS),
sizeof(glConfig.extensions_string));

 // initialize extensions
GLimp_InitExtensions();

ri.Cvar_Get("r_availableModes", "", CVAR_ROM);

 // This depends on SDL_INIT_VIDEO, hence having it here
IN_Init();
}

/*
 ===============
 GLimp_EndFrame

 Responsible for doing a swapbuffers
 ===============
 */

int last = 0;
int mod = 0;


// No SMP - stubs
void GLimp_RenderThreadWrapper(void *arg)
{
}

qboolean GLimp_SpawnRenderThread(void (*function)(void))
{
ri.Printf(PRINT_WARNING, "SMP support was disabled at compile time simply because it's not optimal on CPU running at more than 500Mhz\n");
return qfalse;
}

void *GLimp_RendererSleep(void)
{
return NULL ;
}

void GLimp_FrontEndSleep(void)
{
}

void GLimp_WakeRenderer(void *data)
{
}

static void InitControls(void)
{
    movBoundX = (glConfig.vidWidth * 16) / 100;
    movBoundY = (glConfig.vidHeight * 60) / 100;
    movBoundRad = glConfig.vidWidth * 0.15f;

    fireBoundX = (glConfig.vidWidth * 71) / 100;
    fireBoundY = (glConfig.vidHeight * 49) / 100;
    fireBoundRad = glConfig.vidWidth * 0.14f;

    jmpBoundX = (glConfig.vidWidth * 91) / 100;
    jmpBoundY = (glConfig.vidHeight * 52) / 100;
    jmpBoundRad = glConfig.vidWidth * 0.09f;

    weaponNextX = (glConfig.vidWidth * 82.5) / 100;
    weaponNextY = (glConfig.vidHeight * 65) / 100;
    weaponNextRad = glConfig.vidWidth * 0.050f;

    r1square = movBoundRad * movBoundRad;
    r2square = fireBoundRad * fireBoundRad;
}

static void drawControls()
{
    float ctrlAlpha = 0.20f;

    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(2, GL_FLOAT, 0, vert);

//    // Outer move joggle
    glColor4f(0.8f, 0.8f, 0.8f, ctrlAlpha);
    glPushMatrix();
    glTranslatef(movBoundX, movBoundY, 0);
    glScalef(movBoundRad, movBoundRad, 1);
    glDrawArrays(GL_TRIANGLE_FAN, 0, (NUM_VERT /2)+2);
    glPopMatrix();

    if (movX != -1 && movY != -1) {
        // Inner move joggle
        glPushMatrix();
        glTranslatef(movX + movBoundX, movY + movBoundY, 0);
        glScalef(movBoundRad/3, movBoundRad/3, 1);
        glDrawArrays(GL_TRIANGLE_FAN, 0, (NUM_VERT /2)+2);
        glPopMatrix();
    }

    // Fire button
    glColor4f(0.8f, 0.2f, 0.2f, ctrlAlpha);
    glPushMatrix();
    glTranslatef(fireBoundX, fireBoundY, 0);
    glScalef(fireBoundRad, fireBoundRad, 1);
    glDrawArrays(GL_TRIANGLE_FAN, 0, (NUM_VERT /2)+2 );
    glPopMatrix();

//    // Jump button
    glColor4f(0.8f, 0.8f, 0.1f, ctrlAlpha);
    glPushMatrix();
    glTranslatef(jmpBoundX, jmpBoundY, 0);
    glScalef(jmpBoundRad, jmpBoundRad, 1);
    glDrawArrays(GL_TRIANGLE_FAN, 0, (NUM_VERT /2)+2);
    glPopMatrix();

//    // Weapon next button
    glColor4f(0.2f, 0.6f, 0.2f, ctrlAlpha);
    glPushMatrix();
    glTranslatef(weaponNextX, weaponNextY, 0);
    glScalef(weaponNextRad, weaponNextRad, 1);
    glDrawArrays(GL_TRIANGLE_FAN, 0, (NUM_VERT /2)+2);
    glPopMatrix();
}

qboolean draw = qfalse;



void SwapBuffers( void )
{
    int err, i;
    int t;
    int size[2];
    int pos[2];

    t = Sys_Milliseconds();

    if (!setup_vert)
    {
        vert = (GLfloat*)malloc(2*(NUM_VERT+2) * sizeof(GLfloat));
        vert[0] = 0;
        vert[1] = 0;
        for (i = 0; i < NUM_VERT+1; i+=2)
        {
            vert[i+2] = (GLfloat)(sinf(2 * PI / NUM_VERT * i))* 600 / 768;
            vert[i+3] = (GLfloat)(cosf(2 * PI / NUM_VERT * i));
        }
        setup_vert = 1;
    }

    if (cls.state == CA_ACTIVE)
    {
        if ( !backEnd.projection2D )
            RB_SetGL2D();
          glDisable(GL_TEXTURE_2D);
          glDisableClientState(GL_TEXTURE_COORD_ARRAY);
          glDisableClientState(GL_COLOR_ARRAY);
            if (!ingamemenu && !uis.activemenu)
            {
                drawControls();
                draw = qtrue;
            }
            else
            {
                draw = qfalse;
            }

            glEnable(GL_TEXTURE_2D);
    }
    eglSwapBuffers(g_EGLDisplay, g_EGLWindowSurface);
    err = eglGetError( );
    if (err != EGL_SUCCESS ) {
        Com_Printf( "Error, eglSwapBuffers failed" );
        return;
    }
}



void IN_DeactivateMouse( void )
{
    qboolean DrawControls = qtrue;
    if (!mouse_avail || !g_EGLDisplay)
        return;

    if (mouse_active)
    {
        ri.Cvar_Set("in_dgamouse", "0");
        mouse_active = qfalse;
    }
}

void GLimp_EnableLogging( qboolean enable )
{
}


void GLimp_SetGamma( unsigned char red[256], unsigned char green[256], unsigned char blue[256] )
{
}

qboolean QGL_Init( const char *dllname )
{

    return qtrue;
}

void QGL_Shutdown( void )
{
}

void IN_Init( void )
{
    Com_Printf ("\n------- Input Initialization -------\n");
    // mouse variables
    in_mouse = Cvar_Get ("in_mouse", "1", CVAR_ARCHIVE);
    in_dgamouse = Cvar_Get ("in_dgamouse", "0", CVAR_ARCHIVE);

    // turn on-off sub-frame timing of X events
    in_subframe = Cvar_Get ("in_subframe", "1", CVAR_ARCHIVE);
    // developer feature, allows to break without loosing mouse pointer
    in_nograb = Cvar_Get ("in_nograb", "0", 0);
    if (in_mouse->value)
        mouse_avail = qtrue;
    else
        mouse_avail = qfalse;
    Com_Printf ("------------------------------------\n");
}

int jvmfd = -1;

void IN_ActivateMouse( void )
{
    if (!mouse_avail || !g_EGLDisplay)
        return;

    if (!mouse_active)
    {
        ri.Cvar_Set("in_dgamouse", "0");
        mouse_active = qtrue;
    }
}

void IN_Frame (void)
{
    if ( cls.keyCatchers & KEYCATCH_CONSOLE )
    {
        // temporarily deactivate if not in the game and running on the desktop voodoo always counts as full screen
        if (Cvar_VariableValue ("r_fullscreen") == 0 /*&& strcmp( Cvar_VariableString("r_glDriver"), driverName )*/ )
        {
            IN_DeactivateMouse ();
            return;
        }
    }

    if( ri.Cvar_Set )
        IN_ActivateMouse();
}

void IN_Shutdown(void)
{
    mouse_avail = qfalse;
}


static char* LateKey(int scancode, int *key)
{
    static char buf[4];

    buf[0] = scancode;
    *key = 0;

//  for debug purpose
//    ri.Printf(PRINT_ALL, "LateKey: scancode %d", scancode);

    switch (scancode)
    {
        default:
            if (scancode == 0)
            {
                if (com_developer->value)
                {
                    ri.Printf(PRINT_ALL, "Warning: scancode: 0\n");
                }
                return NULL;
            } else {
                // XK_* tests failed, but XLookupString got a buffer, so let's try it
                *key = *(unsigned char *)buf;
                if (*key >= 'A' && *key <= 'Z')
                    *key = *key - 'A' + 'a';
                // if ctrl is pressed, the keys are not between 'A' and 'Z', for instance ctrl-z == 26 ^Z ^C etc.
                // see https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=19
                else if (*key >= 1 && *key <= 26)
                  *key = *key + 'a' - 1;
            }
            break;
    }

    return buf;
}


static int mouseResetTime = 0;
#define MOUSE_RESET_DELAY 50
#define CAM_THROTTLE_THRESHHOLD 30

qboolean wasmouse = qtrue;
qboolean hasrun = qtrue;
qboolean ingameinit = qtrue;

static cvar_t *postgame;
static cvar_t *keyboard;
int StartTime = 0;
qboolean Wait = qtrue;

static void HandleEvents(void)
{
    int t = 0;
    int rc = 0;
    int freeze = 0;
    int prop;
    int size[2];
    int x = 0, y = 0, tid = 0, key = 0, keyflags = 0;
    mtouch_event_t mtouch_event;
    static int retainMovX = 0, retainMovY = 0;
    static int lookX = 0, lookY = 0;
    static int moveTouchId = -1;
    static int lookTouchId = -1;
    int domain = 0, eventType = 0;
    static qboolean touchIds[3] = { false, false, false };
    qboolean dowarp = qfalse;
    int jmping = 0;



    t = Sys_Milliseconds();

    if (jmping)
    {
        Sys_QueEvent( t, SE_KEY, K_SPACE, qfalse, 0, NULL );
    }

    bps_event_t* event = NULL;

    while (true)
    {
        rc = bps_get_event(&event, 1);
        if (rc != BPS_SUCCESS || event == NULL)
            break;

        // Drop event that may make the keyboard hide before we want.
        if (keyboard_t > 0){
            if (Sys_Milliseconds() - keyboard_t < 500){
                continue;
            } else {
                keyboard_t = 0;
            }
        }
        domain = bps_event_get_domain(event);

        if (domain == screen_get_domain())
        {
            screen_ev = screen_event_get_event(event);
            screen_get_event_property_iv(screen_ev, SCREEN_PROPERTY_TYPE, &eventType);

            switch (eventType)
            {
                case SCREEN_EVENT_CLOSE:
                {
                    Com_Printf("SCREEN CLOSE EVENT!\n");
                }
                break;

                case SCREEN_EVENT_MTOUCH_RELEASE:
                {

                    virtualkeyboard_hide();
                    screen_get_mtouch_event(screen_ev, &mtouch_event, 0);
                    tid = mtouch_event.contact_id;

                    if (touchIds[tid])
                    {
                        if (moveTouchId == tid)
                        {
                            moveTouchId = -1;
                            touchIds[tid] = false;
                            movX = movY = 0;
                            retainMovX = retainMovY = 0;
                        }
                        else if (lookTouchId == tid)
                        {
                            lookTouchId = -1;
                            touchIds[tid] = false;
                            lookX = lookY = 0;
                        }
                    }
                    Sys_QueEvent(t, SE_KEY, K_MOUSE1, qfalse, 0, NULL);
                    Sys_QueEvent( t, SE_KEY, K_SPACE, qfalse, 0, NULL );
                    Sys_QueEvent( t, SE_KEY, 's', qfalse, 0, NULL );
                    Sys_QueEvent( t, SE_KEY, 'w', qfalse, 0, NULL );
                    Sys_QueEvent( t, SE_KEY, 'd', qfalse, 0, NULL );
                    Sys_QueEvent( t, SE_KEY, 'a', qfalse, 0, NULL );
                    Sys_QueEvent( t, SE_KEY, 'n', qfalse, 0, NULL );
                }
                break;

                case SCREEN_EVENT_MTOUCH_MOVE:
                case SCREEN_EVENT_MTOUCH_TOUCH:
                case SCREEN_EVENT_POINTER:
                {

                    virtualkeyboard_hide();
                    screen_get_mtouch_event(screen_ev, &mtouch_event, 0);
                    if (mouse_active && tid < 3)
                    {
                        postgame = Cvar_Get("cl_postgame", "0", 0);
                        if (cls.state == CA_ACTIVE && !uis.activemenu && !ingamemenu && !postgame->value)
                        {
                            wasmouse = qfalse;
                            hasrun = qtrue;
                            x = mtouch_event.x;
                            y = mtouch_event.y;
                            tid = mtouch_event.contact_id;

                            if (eventType == SCREEN_EVENT_MTOUCH_TOUCH)
                            {
                                // check for new input type
                                if (moveTouchId == -1 && (((movBoundX - x) * (movBoundX - x) + (movBoundY - y)*(movBoundY - y)) < r1square ))
                                {
                                    // move
                                    moveTouchId = tid;
                                    touchIds[tid] = true;
                                }
                                else
                                {
                                    // look
                                    lookTouchId = tid;
                                    touchIds[tid] = true;
                                    lookX = x;
                                    lookY = y;

                                    // allow looking while firing/jumping
                                    if (((fireBoundX - x) * (fireBoundX - x) + (fireBoundY - y)*(fireBoundY - y)) < r2square)
                                    {
                                        // fire
                                        Sys_QueEvent(t, SE_KEY, K_MOUSE1, qtrue, 0, NULL);
                                    }
                                    else if (((jmpBoundX - x) * (jmpBoundX - x) + (jmpBoundY - y)*(jmpBoundY - y)) < r2square )
                                    {
                                        // jump
                                        Sys_QueEvent( t, SE_KEY, K_SPACE, qtrue, 0, NULL );
                                    }
                                    else if (((weaponNextX - x) * (weaponNextX - x) + (weaponNextY - y)*(weaponNextY - y)) < r2square )
                                    {
                                        // weapon prev
                                        Sys_QueEvent( t, SE_KEY, 'n', qtrue, 0, NULL );
                                    }
                                }
                            }

                            if (moveTouchId == tid)
                            {
                                // process moving
                                x = (x - movBoundX);
                                y = (y - movBoundY);
                                retainMovX = x;
                                retainMovY = y;
                                movX = x * 640 / 786;
                                movY = y;
                                if (x * x + y * y > r1square)
                                {
                                    movX = movY = -1; // hide
                                }
                            }
                            else if (lookTouchId == tid)
                            {
                                // process looking
                                Sys_QueEvent(t, SE_MOUSE, (x - lookX) * 2, (y - lookY) * 2, 0, NULL);
                                lookX = x;
                                lookY = y;
                            }
                        }
                        else if (cls.state == CA_CINEMATIC)
                        {
                            wasmouse = qtrue;
                            hasrun=qfalse;

                            x = mtouch_event.x;
                            y = mtouch_event.y;

                            if (eventType == SCREEN_EVENT_MTOUCH_TOUCH)
                            {
                                Sys_QueEvent(t, SE_KEY, K_MOUSE1, qtrue, 0, NULL);
                            }
                            else if (eventType == SCREEN_EVENT_MTOUCH_RELEASE)
                            {
                                Sys_QueEvent(t, SE_KEY, K_MOUSE1, qfalse, 0, NULL);
                            }
                        }
                        else if ((cls.state == CA_ACTIVE && uis.activemenu) ||  (cls.state != CA_ACTIVE && cls.state != CA_CINEMATIC) || ingamemenu || postgame->value)
                        {
                            x = (mtouch_event.x * 640) / RESOLUTION_WIDTH;
                            y = (mtouch_event.y * 480 ) / RESOLUTION_HEIGHT;

                             Sys_QueEvent(t, SE_MOUSE, x, y, 0, NULL);

                             if (eventType == SCREEN_EVENT_MTOUCH_TOUCH)
                             {
                                Sys_QueEvent(t, SE_KEY, K_MOUSE1, qtrue, 0, NULL);
                             }
                             else if (eventType == SCREEN_EVENT_MTOUCH_RELEASE)
                             {
                                Sys_QueEvent(t, SE_KEY, K_MOUSE1, qfalse, 0, NULL);
                             }
                        }
                    }
                    if (retainMovX > movBoundRad / 2)
                    {
                        Sys_QueEvent( t, SE_KEY, 'd', qtrue, 0, NULL );
                    }
                    else if (retainMovX < -movBoundRad / 2 )
                    {
                        Sys_QueEvent( t, SE_KEY, 'a', qtrue, 0, NULL );
                    }
                    else
                    {
                        Sys_QueEvent( t, SE_KEY, 'd', qfalse, 0, NULL );
                        Sys_QueEvent( t, SE_KEY, 'a', qfalse, 0, NULL );
                    }
                    if (retainMovY > movBoundRad / 2)
                    {
                        Sys_QueEvent( t, SE_KEY, 's', qtrue, 0, NULL );
                    }
                    else if (retainMovY < -movBoundRad / 2)
                    {
                        Sys_QueEvent( t, SE_KEY, 'w', qtrue, 0, NULL );
                    }
                    else
                    {
                        Sys_QueEvent( t, SE_KEY, 's', qfalse, 0, NULL );
                        Sys_QueEvent( t, SE_KEY, 'w', qfalse, 0, NULL );
                    }
                }
                break;
                case SCREEN_EVENT_KEYBOARD:
                {
                    if (CL_CheckPaused() || uis.activemenu){
                            virtualkeyboard_show();
                    }
                    screen_get_event_property_iv(screen_ev, SCREEN_PROPERTY_KEY_SYM, &key);
                    screen_get_event_property_iv(screen_ev, SCREEN_PROPERTY_KEY_FLAGS, &keyflags);
                    if (keyflags & KEY_DOWN)
                    {
                        if (key >= ' ' && key < '~')
                        {
                            Sys_QueEvent( t, SE_CHAR, key, qfalse, 0, NULL );
                        }
                        else
                        {
                            key = key - 0xf000;
                            switch (key)
                            {
                            case 8: // backspace
                                Sys_QueEvent( t, SE_CHAR, '\b', qfalse, 0, NULL );
                                return;
                            default:
                                break;
                            }
                            Sys_QueEvent( t, SE_KEY, key, qtrue, 0, NULL );
                            Sys_QueEvent( t, SE_KEY, key, qfalse, 0, NULL );
                        }
                    }
                }
                break;
            }
        }
        else if (domain == navigator_get_domain())
        {
            switch (bps_event_get_code(event))
             {
             case NAVIGATOR_SWIPE_DOWN:
                 Sys_QueEvent( Sys_Milliseconds(), SE_KEY, K_ESCAPE, qtrue, 0, NULL );
                 Sys_QueEvent( Sys_Milliseconds(), SE_KEY, K_ESCAPE, qfalse, 0, NULL );
                 break;
             case NAVIGATOR_WINDOW_INACTIVE:
                 if (!ingamemenu && !uis.activemenu && draw){
                     Sys_QueEvent( Sys_Milliseconds(), SE_KEY, K_ESCAPE, qtrue, 0, NULL );
                     Sys_QueEvent( Sys_Milliseconds(), SE_KEY, K_ESCAPE, qfalse, 0, NULL );
                 }
                 break;
             case NAVIGATOR_EXIT:
                 ingamemenu = qfalse;
                 exit(0);
                 break;
             }
        }
        keyboard = Cvar_Get ("callkeyboard", "0", 0);
        if (keyboard->value)
        {
            virtualkeyboard_show();
            Cvar_Set ("callkeyboard", "0");
            keyboard_t = Sys_Milliseconds();
        }
    }
    if (CL_CheckPaused() == qtrue)
    {
        ingamemenu = qtrue;
    }
    else
    {
        ingamemenu = qfalse;
        wasmouse = qfalse;
        ingameinit = qtrue;
    }
}

void Sys_SendKeyEvents (void)
{
    if (!g_EGLDisplay)
        return;

    HandleEvents();
}
