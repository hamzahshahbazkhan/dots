

# Set the directory for Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
autoload -U compinit && compinit

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

#for vim keybindings
bindkey -v

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls='ls --color'
alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias ll='ls -la'
alias docs="cd ~/Documents"
alias projects="cd ~/Projects"
alias downloads="cd ~/Downloads"
alias dpr="cd ~/DPR"
alias dtop="cd ~/Desktop"
alias mm="open https://mail.google.com"
alias ts="nvim -c 'Telescope find_files'"
alias yt="open https://youtube.com"
alias gg="open https://google.com"
alias mt="open https://monkeytype.com"
alias wa="open https://web.whatsapp.com"
alias ~="cd ~"
alias dots="cd ~/dots" 

# Shell integration
eval "$(starship init zsh)"

# MyBash Configurations
export PATH="$HOME/linuxtoolbox/mybash/bin:$PATH"
export GDK_BACKEND=x11
export GHOSTTY_DEBUG=disable-gpu
export GSK_RENDERER=cairo 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export PATH="$HOME/.local/share/solana/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/scripts/utility/tmux/:$PATH"
# export PATH="$HOME/.local/share/solana/bin/solana:$PATH"
export EDITOR=nvim
export VISUAL=nvim

alias theme='~/.config/scripts/themes/set-theme.sh'

# ~~~~~~~~~~~~~~~ FZF Integration ~~~~~~~~~~~~~~~~~~~~~~~~
# Source FZF key bindings and completion for Arch Linux
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# Use fd for faster file searching (optional)
if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi


bindkey -s '^F' 'tmux-sessionizer.sh\n'
