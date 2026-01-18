#!/bin/bash

# usage: tmux-prompt.sh <prompt> <command_prefix> [initial_value_format]

prompt="$1"
cmd_prefix="$2"
initial_format="$3"

current_val=""
if [ -n "$initial_format" ]; then
    current_val=$(tmux display-message -p "$initial_format")
fi

# If there's an initial value, pre-fill it in the read prompt isn't standard in bash 'read'
# So we just show it in the prompt text or use it if we could. 
# But bash 'read -e -i' needs readline which might not be available or behave well in this popup context without proper terminal setup.
# Let's try simple read -p with the current value shown in parens if it exists.

if [ -n "$current_val" ]; then
    printf "\n  \033[1;34m%s\033[0m \033[90m(%s)\033[0m\n\n  > " "$prompt" "$current_val"
    read input
else
    printf "\n  \033[1;34m%s\033[0m\n\n  > " "$prompt"
    read input
fi

if [ -n "$input" ]; then
    $cmd_prefix "$input"
fi
