if status is-interactive
    # Commands to run in interactive sessions can go here

    alias ls "eza --icons --color=never"
    alias ll "eza -l --icons --color=never"
    alias la "eza -la --icons --color=never"

    alias yeet "paru -Rns"
    alias .. "cd .."
    alias ff fastfetch
    alias helix hx

    alias nixswitch "sudo nix flake update; nixos-rebuild switch"
    alias nixedit "sudoedit /etc/nixos/configuration.nix"
    alias nixlist "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
    alias nixgc "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d"
end

set -gx EDITOR helix
set -g fish_greeting

export EDITOR="hx"

if status is-interactive
    starship init fish | source
end
