zstyle :compinstall filename '/home/yafou/.zshrc'

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# Completion
autoload -Uz compinit
compinit

# Prompt
autoload -Uz ~/.config/zsh/prompt && prompt

# Dirs stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Aliases
source ~/.config/zsh/aliases

# Cursor
cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Move to home directory
cd $HOME
