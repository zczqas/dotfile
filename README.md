This repository contains all of the system configuration and Command-line tools for my System and Developer configuration.

# UUTILS COREUTILS

> All gnu coreutils rewritten in rust

```bash
alias ls="coreutils ls"
```

```bash +exec_replace
cd ~/projects/Decapsulate-com/
echo "> coreutils ls"
coreutils ls
```

# Kitty

> Fast feature rich GPU based terminal emulator

# Ripgrep

> Recursively search for a regex better grep written in rust

![Kitty](screenshot/kitty.png)

# ncmpcpp

> Despite its unique name NCurses Music Player Client (Plus Plus) or ncmpcpp is a great music player.

![ncmpcpp](screenshot/ncmpcpp.png)

# ncspot

> ncurses spotify client written in Rust using librespot, inspired by ncmpc and the likes

# BAT

> `cat` with wings

![bat](screenshot/bat.png)

# EZA

> A modern replacement for `ls`

```bash +exec_replace
cd ~/projects/Decapsulate-com/
echo "> eza -l --icons --time-style=long-iso --group-directories-first"
echo ""
eza --time-style=long-iso --group-directories-first --icons -l --color=always
```

- Alias `ls=eza` and you get a drop-in replacement that supports colours and git status
- fork of exa, which stopped being developed in 2021

# ZOXIDE

> A smarter `cd` command for your terminal

Config:

```bash
zoxide init fish | source
```

Usage:

```bash +exec_replace
echo "> pwd"
echo "/home/tris"
echo ""
echo "> cd lua"
echo "> pwd"
echo ".config/nvim/lua"
```

- Add it to your shell config
- Then start jumping to previously used folders by relative path:
- Zoxide knows where you've been, so instead of typing `cd .config/nvim/lua/` you can just type `cd lua` from anywhere, and it'll usually do what you want!
