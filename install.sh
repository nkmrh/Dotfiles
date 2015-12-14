#!/bin/bash

which brew
if [ $? = 1 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which git
if [ $? = 1 ]; then
  brew install git
fi

which vim
if [ $? = 1 ]; then
  brew install vim
fi

which tmux
if [ $? = 1 ]; then
  brew install tmux
fi

which reattach-to-user-namespace
if [ $? = 1 ]; then
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
