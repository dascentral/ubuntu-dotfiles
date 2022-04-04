# Z shell

## Introduction

The [Z shell](https://en.wikipedia.org/wiki/Z_shell) is a Unix shell that can be used as an interactive  login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

## Installation

### Z shell

```bash
sudo apt update
sudo apt install -y zsh
```

### Oh My Zsh

```bash
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
```

A variety of [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) are available. I personally like the "blinks" theme right now.

## Plugins

### zsh-autosuggestions

This plugin can be installed by issuing the following command:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

```bash
plugins+=(zsh-autosuggestions)
```

Source your `~/.zshrc` file:

```bash
source ~/.zshrc
```

