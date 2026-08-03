if status is-interactive
    # Commands to run in interactive sessions can go here

    alias ls "eza --icons --color=never"
    alias ll "eza -l --icons --color=never"
    alias la "eza -la --icons --color=never"

    alias yeet "paru -Rns"
    alias .. "cd .."
    alias ff fastfetch
    alias helix hx

    alias nix-list "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
    alias nix-gc "sudo nix-collect-garbage -d"
end

# update nix
function nix-update
    argparse dotfiles -- $argv
    or return

    if set -q _flag_dotfiles
        rm -f ~/.dotfiles-installed
    end

    sudo nix flake update --flake /etc/nixos
    and sudo nixos-rebuild switch --flake /etc/nixos#(hostname)
end

# Default editor
set -gx EDITOR helix
set -g fish_greeting

export EDITOR="hx"

if status is-interactive
    starship init fish | source
end

# Zoxide
zoxide init fish | source
