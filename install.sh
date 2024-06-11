#!/bin/bash
#This script is executed every time your instance is spawned.
# shellcheck disable=SC2117
function install() {
  home=$1
  bashrc=$2
  cd "${home}" || exit
  git clone https://github.com/welikechips/chips "${home}/chips"
  # setup chips directory
  sudo ln -s "${home}/chips/menu.py" /usr/local/bin/chips
  echo "${bashrc}" | "${home}/chips/scripts/Installs/bashrc.sh"
  cd "${home}" || exit
  git clone https://github.com/welikechips/.tmux.git
  git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
  ln -s -f .tmux/.tmux.conf .
  cp .tmux/.tmux.conf.local .
} 

install "/home/j1v37u2k3y" 2
sudo install "/root" 2
