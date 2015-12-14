#!/bin/bash

DOTPATH=~/.dotfiles

git clone git@github.com:nkmrh/dotfiles.git ~/.dotfiles

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
done

ln -sf "$DOTPATH"/bin "$HOME"/bin

mkdir -p .vim/bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
