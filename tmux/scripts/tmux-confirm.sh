#!/bin/bash

# usage: tmux-confirm.sh <prompt> <command>

prompt="$1"
cmd="$2"

printf "\n  \033[1;31m%s\033[0m (y/n) " "$prompt"
read -n 1 ans

if [[ "$ans" =~ ^[Yy]$ ]]; then
  $cmd
fi
