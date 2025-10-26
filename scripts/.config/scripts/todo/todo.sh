#!/bin/bash
# Floating todo scratchpad window

# Create todo directory if it doesn't exist
TODO_DIR="$HOME/.todo"
mkdir -p "$TODO_DIR"

# Create a default todo file if it doesn't exist
TODO_FILE="$TODO_DIR/todo.md"
if [ ! -f "$TODO_FILE" ]; then
    echo "# My Todo Notes" > "$TODO_FILE"
    echo "" >> "$TODO_FILE"
    echo "- Add your tasks here" >> "$TODO_FILE"
fi

# Open ghostty terminal with vim/nano in the todo directory
# The window will be centered and floating due to windowrule
ghostty --title="TodoScratchpad" -e bash -c "cd $TODO_DIR && nvim ."
