# =====================================================================
#  STARSHIP PROMPT
# =====================================================================
eval "$(starship init zsh)"

# =====================================================================
#  BASIC OPTIONS
# =====================================================================
fastfetch
setopt NO_BEEP
setopt autocd
setopt interactive_comments

# Completion matching (case-insensitive)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Completion caching (faster tab completion)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# =====================================================================
#  HISTORY
# =====================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history
setopt inc_append_history
setopt extended_history

# =====================================================================
#  ZINIT BOOTSTRAP
# =====================================================================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing Zinit…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source ~/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# =====================================================================
#  ZINIT PLUGINS (Turbo Mode)
# =====================================================================

# --- Completions ---
zinit ice wait lucid
zinit light zsh-users/zsh-completions

# --- Syntax Highlighting ---
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C" atload"_zsh_highlight"
zinit light zdharma-continuum/fast-syntax-highlighting

# --- FZF Tab Completion ---
zinit ice wait lucid
zinit light Aloxaf/fzf-tab

# --- History Substring Search ---
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# --- Autosuggestions (must be last) ---
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

# --- Zinit Annexes ---
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


# =====================================================================
#  COMPLETION SYSTEM
# =====================================================================
autoload -Uz compinit
compinit -u

    
# =====================================================================
#  ALIASES
# =====================================================================
alias ls="eza --icons --color=never"
alias ll="eza -l --icons --color=never"
alias la="eza -la --icons --color=never"
alias yeet="paru -Rns"
alias ..="cd .."
alias ff="fastfetch"

# =====================================================================
#  FUNCTIONS
# =====================================================================
Integrated() {
    if supergfxctl -m Integrated; then
        echo "Switch successful — logging out..."
        loginctl terminate-session "$XDG_SESSION_ID"
    else
        echo "supergfxctl failed — not logging out."
    fi
}

# =====================================================================
#  PATH (Optional — add your custom bin dirs here)
# =====================================================================
