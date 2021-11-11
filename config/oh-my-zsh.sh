#!/usr/bin/env bash

source ${HOME}/utils/shell/.functions

# install Oh My Zsh
# This has not been tested
#if [ ! -e ~/.oh-my-zsh ]; then
#    info "Installing Oh My Zsh"
#    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#    printf "\n"
#fi

# create symbolic link to .zshrc
if [ ! -L ~/.zshrc ]; then
    info "Linking .zshrc to dotfiles"
    rm -rf ${HOME}/.zshrc
    ln -s "${DOTFILES}/shell/.zshrc" "${HOME}/.zshrc"
    printf "\n"
fi

# install plugins
cd $HOME/.oh-my-zsh/custom/plugins
declare -a links=(
    "https://github.com/zsh-users/zsh-autosuggestions"
    "https://github.com/zsh-users/zsh-syntax-highlighting"
)
for url in ${links[@]}; do
    parts=(`echo ${url} | tr '/' ' '`)
    plugin=${parts[${#parts[@]}-1]}
    if [ ! -e ${plugin} ]; then
        info "Installing Zsh plugin - ${plugin}"
        git clone ${url}
        printf "\n"
    fi
done
