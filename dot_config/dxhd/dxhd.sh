#!/usr/bin/zsh

## preselect the direction
# super + {Left,Down,Up,Right}
bspc node -p \~{west,south,north,east}

## swap the present desktop with the supplied one, the name order stays the same
# super + alt + {1-9,0}
bspc desktop --swap \^{1-9,10} && bspc monitor -d I II III IV V VI VII VIII IX X

## insert {terminal emulator,receptacle}
# super + {_,shift +}Return
{sensible-terminal, bspc node --insert-receptacle}

## send the focused node to the {preselected region,receptacle}
# super + {_,shift +}backslash
bspc node focused -n {newest.\!automatic,any.leaf.\!window} --follow

## program launcher
# ctrl + grave
rofi -show run

# super + space
dock toggle

# super + {_,shift +}e
emacsclient -c {_,--eval "(newsticker-show-news)"}

## new code-server window
# super + v
xdg-open http://code

## screenshot
# super + Print
lximage-qt --screenshot

## audio
# XF86Audio{RaiseVolume,LowerVolume}
sound {+,-}
# XF86Audio{_,Mic}Mute
sound {m,M}

## backlight
# XF86MonBrightness{Up,Down}
backlight {+,-}

## quit/restart bspwm and sxhkd
# super + shift + {q,r}
bspc {quit && pkill --signal HUP -x lxqt-panel,wm -r && pkill --signal USR1 -x sxhkd}

## close window (node)
# super + q
bspc node -c || bspc node -k

## switch between tiling/floating (inspired by i3)
# super + shift + space
if [ -z $(bspc query -N -n focused.floating) ]; \
then bspc node focused -t floating; \
else bspc node focused -t tiled; \
fi

## toggle fullscreen layout
# super + f
bspc node focused -t \~fullscreen

# focus the node in the given direction
# super + {control,shift} + {Left,Down,Up,Right}
bspc node -{f,s} {west,south,north,east}

## focus the node for the given path jump
# super + {p,b,comma,period}
bspc node -f @{parent,brother,first,second}

## focus the older or newer node in the focus history
# super + {o,i}
bspc wm -h off; \
bspc node {older,newer} -f; \
bspc wm -h on

## focus or send to the given desktop
# super + {_,shift + }{1-9,0}
bspc {desktop -f,node -d} '^{1-9,10}'

## power shortcuts
# super + shift + {l,h}
powerctl {suspend,hibernate}

## lock screen
# super + l
lock

## turn the display off
# XF86Display
xset dpms force off

## rotate the parent of a leaf node (window/receptacle, I think), there is no such thing as rotating the leaf node itself
# super + {bracketright,bracketleft}
bspc node @parent -R {90,-90}

## flip
# super + {semicolon,apostrophe}
bspc node -F {vertical,horizontal}

## change window gap
# super + {minus,equal}
bspc config window_gap $((`bspc config window_gap` {-,+} 2 ))

## reset window gap and padding
# super + BackSpace
bspc config window_gap 0 && \
bspc config left_padding 0 && \
bspc config bottom_padding 0 && \
bspc config top_padding 0 && \
bspc config right_padding 0

## xclip
# super + c ; {1,2,3,4,5,6,7,8,9,0}
xclip -selection clipboard < $XDG_DATA_HOME/clipboard/{1,2,3,4,5,6,7,8,9,0}.txt

## midi
# super + ~slash ; {_,@}{a,w,s,e,d,f,t,g,y,h,u,j,k,o,l}
midictl {on,off} {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}
# super + ~slash ; BackSpace
midictl panic
