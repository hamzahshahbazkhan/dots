#!/usr/bin/env bash

# Directories to search (you can add or remove)
SEARCH_DIRS=(
    "$HOME/DPR/CODES"
    "$HOME/Projects"
    "$HOME/.config/"
    "$HOME/dots/"
    "$HOME/DPR/RESOURCES"
)

pick_directory() {
    find "${SEARCH_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d \
        | sed "s|^$HOME/||" \
        | fzf 
}

# Pick directory (arg takes priority)
if [[ -n "$1" ]]; then
    selected="$1"
else
    selected="$(pick_directory)"
    [[ -z "$selected" ]] && exit 0
    selected="$HOME/$selected"
fi

session_name=$(basename "$selected" | tr . _)

# Create if session does not exist
if ! tmux has-session -t "$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c "$selected"
fi

# Outside tmux → attach | Inside tmux → switch
if [[ -z "$TMUX" ]]; then
    exec tmux attach -t "$session_name"
else
    tmux switch-client -t "$session_name"
fi

