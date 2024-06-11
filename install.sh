#!/bin/bash
#This script is executed every time your instance is spawned.
# shellcheck disable=SC2117
name=$1
bashrc=$2
function install() {
  home=$1
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
  sudo pip3 install updog
  out=$(curl https://ip.42.pl/r)
  cd "${home}/Desktop/" && echo "${out}" > "${out}.txt"
} 

install "/home/${name}" "${bashrc}"
sudo install "/root" "${bashrc}"
