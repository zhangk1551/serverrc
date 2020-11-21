#!/bin/bash
set -e
set -x

curl https://raw.githubusercontent.com/zhangk1551/bashrc/master/bashrc > bashrc
curl https://raw.githubusercontent.com/zhangk1551/vimrc/master/vimrc > vimrc
curl https://raw.githubusercontent.com/zhangk1551/tmuxconf/master/tmux.conf > tmux.conf

sed '/\" Plugins/,$d;$d;$d' vimrc > vimrc_no_plugins

if [[ -f "~/.bashrc" ]]; then
  mv ~/.bashrc ~/.bashrc_backup
fi
if [[ -f "~/.vimrc" ]]; then
  mv ~/.vimrc ~/.vimrc_backup
fi
if [[ -f "~/.~/.tmux.conf" ]]; then
  mv ~/.tmux.conf ~/.tmux.conf_backup
fi

ln -b bashrc ~/.bashrc
ln -b vimrc_no_plugins ~/.vimrc
ln -b tmux.conf ~/.tmux.conf
