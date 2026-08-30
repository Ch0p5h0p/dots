#!/bin/python3

import json
import sys
from pathlib import Path

def convertColorsNoctaliaV4(source, theme="dark"):
    # to noctalia v4 colors, for legacy stuff
    with open(source) as f:
        data = json.load(f)

    colors = data[theme]

    terminal = colors["terminal"]

    for name, value in terminal["normal"].items():
        terminal[name] = value

    for name, value in terminal["bright"].items():
        terminal[f"bright_{name}"] = value

    del terminal["normal"]
    del terminal["bright"]

    output = Path("~/.config/noctalia/colors-v4.json").expanduser()

    with open(output, "w") as f:
        json.dump(colors, f, indent=2)
        f.write("\n")


def convertColorsKitty(source, theme="dark"):
    with open(source) as f:
        data = json.load(f)

    colors = data[theme]

    output = Path("~/.config/kitty/noctalia.conf").expanduser()

    with open(output, "w") as f:
        terminal = colors['terminal']
        f.write(f"foreground {terminal['foreground']}\n")
        f.write(f"background {terminal['background']}\n")
        f.write(f"selection_foreground {terminal['selectionFg']}\n")
        f.write(f"selection_background {terminal['selectionBg']}\n")
        f.write(f"cursor {terminal['cursor']}\n")
        f.write(f"cursor_text_color {terminal['cursorText']}\n")
        names = [
                "black", "red", "green", "yellow",
                "blue", "magenta", "cyan", "white"
        ]

        for i, name in enumerate(names):
            f.write(f"color{i} {terminal['normal'][name]}\n")
            f.write(f"color{i+8} {terminal['bright'][name]}\n")


if len(sys.argv) < 2:
    print("Script requires a file")
    sys.exit(1)

match sys.argv[1]:
    case "help":
        print("Noctalia Color Theme Helper\n\tBy Ch0p5h0p\n\nAvailable formats:\n - kitty (kitty) \n - noctalia v4 colors.json (noctaliav4)\n\nUSAGE: theme_converter.py [option | help] [pallete_path]") 
    case "all":
        convertColorsNoctaliaV4(sys.argv[2])
        convertColorsKitty(sys.argv[2])
    case "noctaliaV4":
        convertColorsNoctaliaV4(sys.argv[2])
    case "kitty":
        convertColorsKitty(sys.argv[2])
