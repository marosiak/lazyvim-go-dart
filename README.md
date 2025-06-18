# 💤 LazyVim (Golang + Flutter + Dart + WSL)

## Why?

There are my favourite plugins and settings, in future I'll also extend it with snippets
I am working on multiple devices so it's great to sync configs between.

Also, I love the idea of actually OWNING software
Instead of paying each month (I am Jetbrains user since ~10 years)

## Quickstart

`bash <(curl -sL "https://raw.githubusercontent.com/marosiak/lazyvim-go-dart/refs/heads/master/install.sh")`

<!--toc:start-->
- [💤 LazyVim (Golang + Flutter + Dart + WSL)](#💤-lazyvim-golang-flutter-dart-wsl)
  - [Why?](#why)
  - [Quickstart](#quickstart)
  - [How to?](#how-to)
    - [Pre-requirements](#pre-requirements)
    - [If you're using WSL](#if-youre-using-wsl)
  - [Troubleshoting](#troubleshoting)
    - [General](#general)
    - [Windows WSL](#windows-wsl)
      - [Copy and Paste works only inside of nvim](#copy-and-paste-works-only-inside-of-nvim)
        - [Assuming you've already installed win32yank.exe](#assuming-youve-already-installed-win32yankexe)
    - [Nvim points to bins from windows like go.exe or dart.exe](#nvim-points-to-bins-from-windows-like-goexe-or-dartexe)
  - [Installation](#installation)
    - [Backup config (optional)](#backup-config-optional)
    - [Install](#install)
  - [Updating](#updating)
    - [Update my configs](#update-my-configs)
    - [Update plugins versions](#update-plugins-versions)
  - [Languages](#languages)
    - [Golang](#golang)
      - [Keymaps](#keymaps)
      - [Go Commands](#go-commands)
    - [Flutter & Dart](#flutter-dart)
      - [Flutter commands](#flutter-commands)
  - [Find more keymaps & commands](#find-more-keymaps-commands)
<!--toc:end-->

## How to?

It's tested tested with

- Os X with M1 Pro (ARM)
- Windows WSL (Ubuntu)

### Pre-requirements

- First of all install `neovim`
- `git`
- `curl`
- `rust` with `cargo` package manager
- `tree-sitter` (Should be shipped with neovim and available from your `$PATH`)

### If you're using WSL

Clipboard wont work unless you'll configure it.
The required configs are already in this repo, so you'll need to install [Win32Yank]([/guides/content/editing-an-existing-page#modifying-front-matter](https://github.com/equalsraf/win32yank/releases))
Just download release and unpack into place where your windows **$PATH** is configure.

## Troubleshoting

### General

Use `:LazyHealth` and resolve at least problems.
In ideal scenario also warnings for the most optimal results
(PS. I don't recommend updating mason, let's stick with what lazyvim offers as long as it does the job)

### Windows WSL

Often it's that bin points into .exe instead of linux executable

#### Copy and Paste works only inside of nvim

For example you've copied text from your windows chrome, and you can't paste inside of nvim using `p`

##### Assuming you've already installed win32yank.exe

Open windows terminal (without WSL) and type win32yank.exe - if it was not found, google how to setup **$PATH** on windows
PS. Remember to fully restart terminal

### Nvim points to bins from windows like go.exe or dart.exe

WSL adds *windows* $PATH into your *linux* $PATH because thru WSL you can run .exe - often it's problematic
Simplest solution which I've found is to install desired tool on WSL.
Then check `which dart` or `which go` or any other tool
If it points into something like ❌`/mnt/c/...`❌ then you'll need to edit your $PATH
I've searched .profile .zshrc and .bashrc but didn't find $PATH
So easies way is to add something like this to you bash profile:

`PATH=$(REMOVE_PART="/mnt/c/flutter/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')`

## Installation

### Backup config (optional)

Skip if you don't care

```bash
mv ~/.config/nvim{,.bak}

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Install

```bash
git clone git@github.com:marosiak/lazyvim-go-dart.git ~/.config/nvim
```

## Updating

### Update my configs

`cd ~/.config/nvim && git pull`

### Update plugins versions

Open nvim, go into Lazy tab and sync

## Languages

### Golang

#### Keymaps

Press `<leader>cg` in order to see extra features, for now just a few, but there are more LSP oriented just in `<leader>c`

- ![Img](./img/gopher-keybinds.png)

#### Go Commands

Common ones: `:GoBuild` `:GoRun` `:GoStop` `:GoTest` `:GoCoverage`
You can close appearing terminal with `GoTermClose` or just `<leader>w` (basically use window navigations)
<https://github.com/ray-x/go.nvim?tab=readme-ov-file#build-and-test>

### Flutter & Dart

Full description: <https://github.com/nvim-flutter/flutter-tools.nvim>

#### Flutter commands

Common commands: `:FlutterRun` `:FlutterDevices` `:FlutterQuit` (and more)
and my favourite: `:FlutterOutlineOpen`

## Find more keymaps & commands

There are a lot of keymaps from lazyvim <https://www.lazyvim.org/keymaps>
