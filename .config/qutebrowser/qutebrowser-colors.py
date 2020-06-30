import subprocess
import sys, os

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

def clamp(val, minimum=0, maximum=255):
    if val < minimum:
        return minimum
    if val > maximum:
        return maximum
    return val

def adjust(hexstr, scalefactor):
    hexstr = hexstr.strip('#')
    if scalefactor < 0 or len(hexstr) != 6:
        return hexstr

    r, g, b = int(hexstr[:2], 16), int(hexstr[2:4], 16), int(hexstr[4:], 16)
    r = int(clamp(r * scalefactor))
    g = int(clamp(g * scalefactor))
    b = int(clamp(b * scalefactor))

    return "#%02x%02x%02x" % (r, g, b)

xresources = read_xresources('*')

black      =  xresources['*.color0']
red        =  xresources['*.color1']
green      =  xresources['*.color2']
yellow     =  xresources['*.color3']
blue       =  xresources['*.color4']
magenta    =  xresources['*.color5']
cyan       =  xresources['*.color6']
white      =  xresources['*.color7']
black_b    =  xresources['*.color8']
red_b      =  xresources['*.color9']
green_b    =  xresources['*.color10']
yellow_b   =  xresources['*.color11']
blue_b     =  xresources['*.color12']
magenta_b  =  xresources['*.color13']
cyan_b     =  xresources['*.color14']
white_b    =  xresources['*.color15']
bg         =  xresources['*.background']
fg         =  xresources['*.foreground']

# Original
c.colors.completion.category.bg                  =  black
c.colors.completion.category.border.bottom       =  black
c.colors.completion.category.border.top          =  black
c.colors.completion.category.fg                  =  blue_b
c.colors.completion.even.bg                      =  black
c.colors.completion.odd.bg                       =  black
c.colors.completion.fg                           =  white_b
c.colors.completion.item.selected.bg             =  yellow
c.colors.completion.item.selected.border.bottom  =  green
c.colors.completion.item.selected.border.top     =  yellow
c.colors.completion.item.selected.fg             =  blue
c.colors.completion.match.fg                     =  yellow_b
c.colors.completion.scrollbar.bg                 =  black
c.colors.completion.scrollbar.fg                 =  blue_b

# Alt
#c.colors.completion.category.bg                  =  bg
#c.colors.completion.category.border.bottom       =  bg
#c.colors.completion.category.border.top          =  bg
#c.colors.completion.category.fg                  =  blue_b
#c.colors.completion.even.bg                      =  bg
#c.colors.completion.odd.bg                       =  bg
#c.colors.completion.fg                           =  white_b
#c.colors.completion.item.selected.bg             =  yellow
#c.colors.completion.item.selected.border.bottom  =  green
#c.colors.completion.item.selected.border.top     =  yellow
#c.colors.completion.item.selected.fg             =  blue
#c.colors.completion.match.fg                     =  yellow_b
#c.colors.completion.scrollbar.bg                 =  bg
#c.colors.completion.scrollbar.fg                 =  blue_b

c.colors.downloads.bar.bg    = black
c.colors.downloads.error.bg  = red
c.colors.downloads.error.fg  = fg # white
c.colors.downloads.start.bg  = green
c.colors.downloads.start.fg  = white
c.colors.downloads.stop.bg   = bg
c.colors.downloads.stop.fg   = fg # white
c.colors.downloads.system.bg = 'none'
c.colors.downloads.system.fg = 'none'

# Original
#c.colors.downloads.bar.bg     =  black
#c.colors.downloads.error.bg   =  yellow_b
#c.colors.downloads.error.fg   =  red
#c.colors.downloads.stop.bg    =  white_b
#c.colors.downloads.system.bg  =  'none'

c.colors.hints.bg        =  yellow_b
c.colors.hints.fg        =  black
c.colors.hints.match.fg  =  green

c.colors.keyhint.bg         =  black
c.colors.keyhint.fg         =  yellow
c.colors.keyhint.suffix.fg  =  green

c.colors.messages.error.bg       = red
c.colors.messages.error.border   = red
c.colors.messages.error.fg       = fg # white
c.colors.messages.info.bg        = black
c.colors.messages.info.border    = black
c.colors.messages.info.fg        = fg # white
c.colors.messages.warning.bg     = red
c.colors.messages.warning.border = red
c.colors.messages.warning.fg     = fg # white

# Origianl
#c.colors.messages.error.bg        =  yellow_b
#c.colors.messages.error.border    =  yellow_b
#c.colors.messages.error.fg        =  red
#c.colors.messages.info.bg         =  black
#c.colors.messages.info.border     =  black
#c.colors.messages.info.fg         =  magenta
#c.colors.messages.warning.bg      =  black
#c.colors.messages.warning.border  =  black
#c.colors.messages.warning.fg      =  red_b

# Original
c.colors.prompts.bg           =  black
c.colors.prompts.border       =  '1px solid ' + black_b
c.colors.prompts.fg           =  white_b
c.colors.prompts.selected.bg  =  yellow

# Alt
#c.colors.prompts.bg          = bg
#c.colors.prompts.border      = '1px solid gray'
#c.colors.prompts.fg          = white
#c.colors.prompts.selected.bg = bg

c.colors.statusbar.caret.bg             = magenta
c.colors.statusbar.caret.fg             = white
c.colors.statusbar.caret.selection.bg   = '#a12dff'
c.colors.statusbar.caret.selection.fg   = white
c.colors.statusbar.command.bg           = black
c.colors.statusbar.command.fg           = white
c.colors.statusbar.command.private.bg   = white
c.colors.statusbar.command.private.fg   = white
c.colors.statusbar.insert.bg            = green_b
c.colors.statusbar.insert.fg            = white
c.colors.statusbar.normal.bg            = black
c.colors.statusbar.normal.fg            = green_b
c.colors.statusbar.passthrough.bg       = blue
c.colors.statusbar.passthrough.fg       = fg
c.colors.statusbar.private.bg           = '#666666'
c.colors.statusbar.private.fg           = fg
c.colors.statusbar.progress.bg          = magenta
c.colors.statusbar.url.error.fg         = red_b
c.colors.statusbar.url.fg               = fg
c.colors.statusbar.url.hover.fg         = blue
c.colors.statusbar.url.success.http.fg  = adjust(fg, 0.7)
c.colors.statusbar.url.success.https.fg = adjust(fg, 0.7)
c.colors.statusbar.url.warn.fg          = yellow

# Original
#c.colors.statusbar.caret.bg              =  white_b
#c.colors.statusbar.caret.fg              =  magenta
#c.colors.statusbar.caret.selection.bg    =  white_b
#c.colors.statusbar.caret.selection.fg    =  magenta
#c.colors.statusbar.command.bg            =  black
#c.colors.statusbar.command.fg            =  green_b
#c.colors.statusbar.command.private.bg    =  green
#c.colors.statusbar.command.private.fg    =  magenta
#c.colors.statusbar.insert.bg             =  green_b
#c.colors.statusbar.insert.fg             =  red
#c.colors.statusbar.normal.bg             =  black
#c.colors.statusbar.normal.fg             =  green_b
#c.colors.statusbar.passthrough.bg        =  green_b
#c.colors.statusbar.passthrough.fg        =  magenta
#c.colors.statusbar.private.bg            =  yellow
#c.colors.statusbar.private.fg            =  magenta
#c.colors.statusbar.progress.bg           =  magenta
#c.colors.statusbar.url.error.fg          =  red_b
#c.colors.statusbar.url.fg                =  green_b
#c.colors.statusbar.url.hover.fg          =  black_b
#c.colors.statusbar.url.success.http.fg   =  white_b
#c.colors.statusbar.url.success.https.fg  =  white_b
#c.colors.statusbar.url.warn.fg           =  blue_b

c.colors.tabs.bar.bg           = black
c.colors.tabs.even.bg          = black
c.colors.tabs.even.fg          = fg
c.colors.tabs.indicator.error  = red
c.colors.tabs.odd.bg           = black
c.colors.tabs.odd.fg           = fg
c.colors.tabs.selected.even.bg = black # adjust(bg, 1.15)
c.colors.tabs.selected.even.fg = yellow_b
c.colors.tabs.selected.odd.bg  = black # adjust(bg, 1.35)
c.colors.tabs.selected.odd.fg  = yellow_b

# Original
#c.colors.tabs.bar.bg            =  black
#c.colors.tabs.even.bg           =  black
#c.colors.tabs.even.fg           =  white_b
#c.colors.tabs.indicator.error   =  yellow_b
#c.colors.tabs.indicator.system  =  'none'
#c.colors.tabs.odd.bg            =  black
#c.colors.tabs.odd.fg            =  white_b
#c.colors.tabs.selected.even.bg  =  black
#c.colors.tabs.selected.even.fg  =  yellow_b
#c.colors.tabs.selected.odd.bg   =  black
#c.colors.tabs.selected.odd.fg   =  yellow_b
