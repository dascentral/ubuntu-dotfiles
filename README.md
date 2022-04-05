# Ubuntu dotfiles

## Introduction

Ubuntu dotfiles is a series of customizations that help me personalize and maintain an Ubuntu web server.

I maintain a personal [dotfiles](https://github.com/dascentral/dotfiles) repository that speaks to the philosophy of this type of repository and contains links to many other repositories that you may use for inspiration.

### Assumptions

The scripts within this repo rely upon a number of assumptions that are not as well documented as I might like. If you set up your Ubuntu servers in a manner similar to me, these scripts may work very well for you. If not, I admit they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist primarily to faciltiate my systems administration activities and address only a very small sliver of the needs within the systems administration or DevOps world.

## Installation

First, clone the repository.

```bash
git clone https://github.com/dascentral/ubuntu-dotfiles.git ~/.dotfiles
```

Then, run the install script.

```bash
~/.dotfiles/install.sh
```

## Staying up-to-date

I have created a script simply titled `dotfiles` that can be run regularly to ensure the system stays up-to-date. Since this command lives within the `~/.dotfiles/bin` folder, it can be executed from anywhere within the system.

```bash
dotfiles
```
