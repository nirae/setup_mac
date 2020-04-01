#! /bin/bash

# Brew installation
if [ ! -e $HOME/.brew ]
then
    rm -rf $HOME/.brew && \ 
    git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && \
    export PATH=$HOME/.brew/bin:$PATH && \
    brew update && \
    echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc
else
    echo "brew is already installed" 
fi

# Wget
if [ ! -e $HOME/.brew/bin/wget ]
then
    brew install wget
else
    echo "wget is already installed"
fi

# Oh my zsh
if [ ! -e $HOME/.oh-my-zsh ]
then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
    echo "Oh My Zsh is already installed"
fi

# My theme
if [ ! -e $HOME/ZSH_Custom ]
then
    cd && git clone https://github.com/nirae/ZSH_Custom.git
    rm -rf ~/.zshrc && ln -s ~/ZSH_Custom/.zshrc ~/.zshrc
    cp ~/ZSH_Custom/theme_perso.zsh-theme ~/.oh-my-zsh/themes/
    source ~/.zshrc
else
    echo "my theme is already installed"
fi

# Vim
if [ ! -e $HOME/VIM_Custom ]
then
    cd && git clone https://github.com/nirae/VIM_Custom.git
    cp ~/VIM_Custom/vimrc ~/.vimrc
    mkdir -p ~/.vim/colors
    cp ~/VIM_Custom/Tomorrow-Night.vim ~/.vim/colors/
    source ~/.zshrc
else
    echo "my theme is already installed"
fi

# Vagrant
if [ ! -e $HOME/.vagrant.d ]
then
    curl https://raw.githubusercontent.com/nirae/install_vagrant_42/master/script.sh | bash
else
    echo "vagrant is already installed"
fi

# Tmux
if [ ! -e $HOME/.brew/bin/tmux ]
then
    brew install tmux
else
    echo "tmux is already installed"
fi

source ~/.zshrc