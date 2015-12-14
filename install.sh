#!/bin/bash

DOTPATH=~/.dotfiles

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
done

ln -sf "$DOTPATH"/bin "$HOME"/bin

cd .vim
mkdir bundle/
cd bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
cd ~
