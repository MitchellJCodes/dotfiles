# ----- Prompt -----
eval "$(starship init zsh)"

# ----- Basic options -----
setopt NO_BEEP
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ----- History -----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups hist_ignore_all_dups share_history inc_append_history extended_history

# ----- Zinit -----
source ~/.local/share/zinit/zinit.git/zinit.zsh

# ----- Completions -----
zinit ice wait lucid
zinit light zsh-users/zsh-completions

# Initialize completion system
autoload -Uz compinit
compinit

# ----- Syntax highlighting -----
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C" atload"_zsh_highlight"
zinit light zdharma-continuum/fast-syntax-highlighting

# ----- FZF tab completion -----
zinit ice lucid
zinit light Aloxaf/fzf-tab

# ----- History substring search -----
zinit ice lucid
zinit light zsh-users/zsh-history-substring-search

# ----- Autosuggestions (must be last) -----
zinit ice lucid
zinit light zsh-users/zsh-autosuggestions

# ----- Aliases -----
alias ls="eza --icons --color=never"
alias ll="eza -l --icons --color=never"
alias la="eza -la --icons --color=never"
alias yeet="paru -Rns"
alias ..="cd .."

# ----- Functions -----
Integrated() {
    if supergfxctl -m Integrated; then
        echo "Switch successful — logging out..."
        loginctl terminate-session "$XDG_SESSION_ID"
    else
        echo "supergfxctl failed — not logging out."
    fi
}

# ----- Zinit installer block -----
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing Zinit…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

