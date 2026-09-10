# Silence Banner
$env.config.show_banner = false

# Shell integrations
source ~/.config/nushell/starship.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/atuin.nu

# Aliases
alias yeet = paru -Rns
alias ff = fastfetch

alias helix = hx
alias vim = hx
alias nvim = hx
alias neovim = hx

alias nix-list = sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
alias nix-gc = sudo nix-collect-garbage -d

# Nix
def nix-update [--dotfiles] {
    if $dotfiles {
        rm ~/.dotfiles-installed
    }

    sudo nix flake update --flake /etc/nixos
    sudo nixos-rebuild switch --flake $"/etc/nixos#(hostname)"
}
