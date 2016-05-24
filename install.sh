#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# backup any old vim file
rm -rf ~/.gvimrc.old ~/.vimrc.old ~/.vim.old
[ -f ~/.gvimrc ] && mv ~/.gvimrc ~/.gvimrc.old
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old
[ -d ~/.vim ] && mv ~/.vim ~/.vim.old

# copy provided files
cp -a "${DIR}"/.gvimrc "${DIR}"/.vimrc "${DIR}"/.vim ~
