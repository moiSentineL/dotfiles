# Nibir's Dotfiles
or "**How to NOT use KDE Plasma ever again.**"

This is an iteration of [1amSimp1e](https://github.com/1amSimp1e)'s [Late Night](https://github.com/1amSimp1e/dots/tree/late-night-%F0%9F%8C%83).

![Main](./assets/main.jpg)

<details>
  <summary>More Screenshots</summary>

  #### Firefox
  ![Firefox 1](./assets/ff-blog.jpg)
  ![Firefox 2](./assets/ff-github.jpg)
  
  #### Terminals
  ![Term](./assets/term.jpg)

  #### Pomo
  ![Pomo](./assets/pomo.jpg)

  #### Wallpaper
  ![wall](./assets/wall.jpg)
</details>

## Philosophy
The system optimises for ergonomics and productivity while focusing on a bit of aesthetics.

Here are some of the rules:
- Functionality comes first.
- It is good as long as it serves the purpose.
- Generate friction for unwanted stuff, and make it easy to access the things that matter.
- Transition to minimalism.
## Features
- [Hypr-Ecosystem](https://hyprland.org/) for better integration and config:
	- Includes hypridle, hyprlock, hyprpaper, grimblast, etc.
	- NVIDIA config (follow Arch wiki)
	- Improved windowrules
	- Awesome-like [split-monitor-workspaces](https://github.com/Duckonaut/split-monitor-workspaces)
- [Colemak [ED] + Extend Layers](https://dreymar.colemak.org/); using [evremap](https://github.com/wez/evremap) for remapping keys (Caps Lock -> tapping).
- [hyprshade](https://github.com/loqusion/hyprshade) shaders: grayscale and blue-light.
- Custom [waybar](https://github.com/Alexays/Waybar) modules:
	- Custom Weather based on `$ADDRESS` env. variable
	- Better Media Player controls: Spotify and [cmus](https://github.com/cmus/cmus).
	- [Tomato.C](https://github.com/gabrielzschmitz/Tomato.C)
	- [Timewarrior](https://timewarrior.net/) integration (**needs improvement**)
	- Better Workspaces
- [greenclip](https://github.com/erebe/greenclip): rofi clipboard
- [mpv-settings](https://github.com/moiSentineL/mpv-settings): nice mpv config
### What doesn't work
- Screen-sharing. Mostly probably because I don't update frequently (sorry!)
- Any NVIDIA-Wayland error. Can't do nothing about it.
- Electron Apps on Wayland are trash. I have to run Obsidian without GPU (`obsidian --disable-gpu`)
## Usage
The dotfiles are currently *not* at a production stage. I haven't tested it on anything except my own PC. Though, you can use the source files for any information and tweaks. For example, the waybar modules.

**Use at your own risk! Always make a backup first!** Read the source files before.
## Roadmap
Check Github [Issues](https://github.com/moiSentineL/dotfiles/issues)

---

<sup>stay frosty.</sup>