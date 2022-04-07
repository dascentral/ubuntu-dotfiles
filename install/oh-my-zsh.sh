#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "${HOME}/.oh-my-zsh" ]; then
    info "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    print "\n"
fi

# END installation
###########################################################################################
# BEGIN configuration

# plugins
cd ${HOME}/.oh-my-zsh/custom/plugins
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

# custom install due to custom naming convention
source="https://github.com/jessarcher/zsh-artisan.git"
plugin="artisan"
if [ ! -e ${plugin} ]; then
    info "Installing Zsh plugin - jessarcher/zsh-artisan"
    git clone ${source} ${plugin}
    printf "\n"
fi

# create symbolic link to .zshrc
if [ ! -L ~/.zshrc ]; then
    info "Linking .zshrc to dotfiles"
    NOW=$(date +"%Y%m%d")
    cp ${HOME}/.zshrc ${HOME}/.zshrc.${NOW}
    rm ${HOME}/.zshrc
    ln -s "${DOTFILES}/shell/.zshrc" "${HOME}/.zshrc"
    printf "\n"
fi
