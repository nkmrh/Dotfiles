#!/bin/bash

if [! type "brew"]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [! type "git"]; then
  brew install git
fi

if [! type "vim"]; then
  brew install vim
fi

if [! type "tmux"]; then
  brew install tmux
fi

if [! type "reattach-to-user-namespace"]; then
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
