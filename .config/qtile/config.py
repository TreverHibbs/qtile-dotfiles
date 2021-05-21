# Copyright (c) 2011 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from time import time
from pathlib import Path

msansod = "mod4"
tmod4erminal = "kitty"
screenshot_dir = "$HOME/Pictures/Screenshots"

# screenshots
def screenshot(save=True, copy=True, selection=True):
    def f(_):
        path = Path.home() / 'Pictures/Screenshots'
        path /= f'screenshot_{str(int(time() * 100))}.png'

        print("WHY")
        maim_args = ['-u', '-b', '3', '-m', '5']
        if selection:
            maim_args = maim_args + ['-s']

        shot = subprocess.run(['maim', *maim_args], stdout=subprocess.PIPE)

        if save:
            with open(path, 'wb') as sc:
                sc.write(shot.stdout)

        if copy:
            subprocess.run(['xclip', '-selection', 'clipboard', '-t',
                            'image/png'], input=shot.stdout)
    return f


def copyq():
    def f(_):
        subprocess.run(['copyq', 'toggle'])

    return f


def shutdown(restart=False):
    def f(_):
        shutdown_args = ['now']

        if restart:
            shutdown_args.insert(0, '-r')

        subprocess.run(['shutdown', *shutdown_args])

    return f


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show run -theme ~/.cache/wal/colors-rofi-dark.rasi"),
        desc="Spawn a command using a prompt widget"),
    Key([mod], "b", lazy.spawn("firefox"), desc="spawn firefox"),
    # hardware
    # Volume
    Key([], "XF86AudioMute", lazy.spawn("amixer sset 'Master' toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset 'Master' 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset 'Master' 5%+")),
    # Media keys
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    # screenshot keys
    Key([], "Print", lazy.function(screenshot(selection=False, copy=False))),
    Key([mod, "shift"], "c", lazy.function(screenshot(copy=False))),
    Key([mod, "control"], "c", lazy.function(screenshot(save=False))),
    # copyq keys
    # Key([mod], "c", lazy.spawn(copyq())),
    # power options
    KeyChord([mod], "p", [
        Key([], "s", lazy.function(shutdown())),
        Key([], "r", lazy.function(shutdown(restart=True))),
        Key([], "l", lazy.shutdown())
    ])
]

colors = []
cache = "/home/treverhibbs/.cache/wal/colors"


def load_colors(cache):
    with open(cache, "r") as file:
        for _ in range(14):
            colors.append(file.readline().strip())
    colors.append("#ffffff")
    lazy.reload()


load_colors(cache)

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
groups = [Group(i) for i in group_names]


for i in groups:
    if i.name[0] == "1":
        i.spawn = "kitty"
    if i.name[0] == "2":
        i.spawn = "firefox"
    if i.name[0] == "3":
        i.spawn = ["discord", "slack", "thunderbird"]
        i.layout = "zoomy"
    if i.name[0] == "4":
        i.spawn = "anki"
    if i.name[0] == "5":
        i.spawn = "spotify"

    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name[0],
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name[0],
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {
    "border_width": 3,
    "margin": 16,
    "border_normal": colors[0],
    "border_focus": colors[4],
}

layouts = [
    # layout.Columns(border_focus_stack='#d75f5f', **layout_theme),
    # layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="SourceCodePro",
    fontsize=12,
    padding=3,
    foreground=colors[7],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    urgent_alert_method='text',
                    urgent_border=colors[11],
                    urgent_text=colors[11],
                    active=colors[7],
                    block_highlight_text_color=colors[10],
                    foreground=colors[14],
                    hide_unused=True,
                    highlight_method='text',
                    this_current_screen_border=colors[10],
                    this_screen_border=colors[10],
                    highlight_color=[colors[14], colors[12]],
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": (colors[11], colors[0]),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Volume(
                    emoji=True,
                ),
                widget.Volume(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p",
                             padding=25,),
                widget.QuickExit(),
            ],
            30,
            margin=[16, 16, 0, 16],  # N E S W
            background=colors[0],
        ),
    ),
    Screen(),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="copyq"),
    ],
    **layout_theme
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# startup subscriptoin


@hook.subscribe.startup_once
def autostart_once():
    home = os.path.expanduser("~/.config/qtile/scripts/autostart_once.sh")
    subprocess.call([home])


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser("~/.config/qtile/scripts/autostart.sh")
    subprocess.call([home])


# new window subscription
@hook.subscribe.client_new
def floating_dialogs(window):
    copyq = window.window.get_name() == "copyq"
    # transient = window.window.get_wm_transient_for()
    if copyq:
        window.floating = True


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
