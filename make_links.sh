#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ln -s $DIR/.vim/colors/ ~/.vim/colors
ln -s $DIR/.vimrc ~/.vimrc
