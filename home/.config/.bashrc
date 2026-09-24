# Interactive shell tooling

# Atuin
if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init bash)"
fi

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

# Starship
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Aliases
alias cd='z'

alias ls='eza --icons --color=never'
alias ll='eza -l --icons --color=never'
alias la='eza -la --icons --color=never'

alias yeet='paru -Rns'
alias ..='cd ..'
alias ff='fastfetch'

alias helix='hx'

alias nix-list='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'
alias nix-gc='sudo nix-collect-garbage -d'

# Functions
nix-update() {
    if [[ "$1" == "--dotfiles" ]]; then
        rm -f ~/.dotfiles-installed || return 1
    fi

    sudo nix flake update --flake /etc/nixos &&
        sudo nixos-rebuild switch --flake "/etc/nixos#$(hostname)"
}

# Environment
export EDITOR="hx"
export VISUAL="hx"
