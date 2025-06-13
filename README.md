# 💤 LazyVim (Golang + Flutter + Dart + WSL)

# Why?

There are my favourite plugins and settings, in future I'll also extend it with snippets - I am working on multiple devices so it's great to sync configs between.


# How to?

## Pre requirements
First of all install neovim

### If you're using WSL
Clipboard wont work unless you'll configure it, the required configs are already in this repo, anyway you'll need to install [Win32Yank]<https://github.com/equalsraf/win32yank/releases>
Just download release and unpack into place where your **$PATH** is configure.

#### Troubleshoting
open windows terminal (without WSL) and type win32yank.exe - if it was not found, google how to setup **$PATH** on windows


## Backup config (skip if you don't care)

```bash
mv ~/.config/nvim{,.bak}

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

## Installation

```bash
git clone https://github.com/marosiak/lazyvim-go-dart ¬/.config/nvim
```



## Updating

### Update my configs

`cd ~/.config/nvim && git pull`

### Update plugins versions

Open nvim, go into Lazy tab and sync


# Keybindings

I didn't modify any, will try to stick to it.

https://www.lazyvim.org/keymaps
