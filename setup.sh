#!/bin/bash

# This is the setup script for my config. The idea is to be able to run
# this after cloning the repo on a Mac or Ubuntu (WSL) system and be up
# and running very quickly.

# create directories
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/zsh
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes
mkdir -p "$XDG_CONFIG_HOME"/tmux/plugins
mkdir -p "$XDG_CONFIG_HOME"/nvim
mkdir -p "$XDG_CONFIG_HOME"/polybar
mkdir -p "$XDG_CONFIG_HOME"/i3
# clone the alacritty theme if it is not cloned
if [ ! -d "$XDG_CONFIG_HOME"/alacritty/themes ]; then
    echo "Alacritty theme is not cloned. Cloning..."
    git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes
else
    echo "Alacritty theme is already cloned."
fi
# set up git prompt
# curl -L htps://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh >"$XDG_CONFIG_HOME"/bash/git-prompt.sh

# Symbolic links

# ln -s ./.amethyst.yml "$HOME"/.amethyst.yml
ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
ln -sf "$PWD/.zsh_profile" "$HOME"/.zsh_profile
ln -sf "$PWD/.zshrc" "$HOME"/.zshrc
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/.tmux.conf" "$XDG_CONFIG_HOME"/tmux/.tmux.conf
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.p10k.zsh" "$XDG_CONFIG_HOME"/.p10k.zsh
ln -sf "$PWD/scripts" "$XDG_CONFIG_HOME"/scripts
ln -sf "$PWD/powerlevel10k" "$HOME"/powerlevel10k
ln -sf "$PWD/polybar" "$XDG_CONFIG_HOME"/polybar
ln -sf "$PWD/i3" "$XDG_CONFIG_HOME"/i3
# set up blog
# git clone git@github.com:mischavandenburg/hugo-PaperModX-theme.git themes/PaperModX --depth=1
# Give permissions to the scripts
chmod +x "$PWD"/scripts/*
# Packages


# install brew if not installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi
# ubuntu packages apt
sudo apt install gcc g++ unzip fd-find fzf ripgrep git-core curl fonts-powerline ripgrep polybar -y

# ubuntu brew for go and lazygit setup
brew install go lazygit zoxide

# install ohmyzsh if it is not installed
if [ ! -d "$HOME"/.oh-my-zsh ]; then
    echo "oh-my-zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# install zsh-autosuggestions and zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions is not installed. Installing..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi
source .zshrc
# install tpm if not installed
if [ ! -f "$XDG_CONFIG_HOME"/tmux/plugins/tpm ]; then
    echo "tpm is not installed. Installing..."
    git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME"/tmux/plugins/
else
    echo "tpm is already installed."
fi

if ! command -v nvim &> /dev/null; then
    echo "NeoVim is not installed. Installing..."
    # install neovim
    mkdir temp
    git clone https://github.com/neovim/neovim.git temp/
    cd temp/neovim
    make CMAKE_BUILD_TYPE=Release
    sudo make install
    cd ../..
    rm -rf temp
else
    echo "NeoVim is already installed."
fi

mkdir -p $SECOND_BRAIN

# # if powerlevel10k is not installed
# if [ ! -d "$ZSH_CUSTOM"/themes/powerlevel10k ]; then
#     echo "powerlevel10k is not installed. Installing..."
#     git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# else
#     echo "powerlevel10k is already installed."
# fi
# install node js if not existing
if ! command -v node &> /dev/null; then
    curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    sudo apt install nodejs
fi
