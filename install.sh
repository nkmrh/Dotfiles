#!/bin/bash

if [type "brew" > /dev/null 2>&1] ; then
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [type "git" > /dev/null 2>&1] ; then
else
  brew install git
fi

if [type "vim" > /dev/null 2>&1] ; then
else
  brew install vim
fi

if [type "tmux" > /dev/null 2>&1] ; then
else
  brew install tmux
fi

if [type "reattach-to-user-namespace" > /dev/null 2>&1] ; then
else
  brew install reattach-to-user-namespace
fi

DOTPATH=~/.dotfiles

git clone git@github.com:nkmrh/dotfiles.git $DOTPATH

cd $DOTPATH

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
done

ln -sf "$DOTPATH"/bin "$HOME"/bin

cd ~/.vim
mkdir bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
