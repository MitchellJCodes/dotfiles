# Silence banner
$env.config.show_banner = false

# Shell integrations
source ~/.config/nushell/starship.nu
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/atuin.nu

# Aliases
alias cd = z
alias cat = bat --plain --paging=never
alias yeet = paru -Rns
alias ff = fastfetch
alias neofetch = fastfetch

alias helix = hx

alias nos = nh os switch ~/.config/nixos/
alias nrs = sudo nixos-rebuild switch
alias nix-list = sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
alias nix-gc = sudo nix-collect-garbage -d
alias nix-edit = yazi ~/.config/nixos/

alias ga = git add .
alias gc = git commit
alias gp = git push
alias gs = git status
alias lg = lazygit

# Nix
def nix-update [--dotfiles] {
    if $dotfiles {
        rm ~/.dotfiles-installed
    }

    sudo nix flake update --flake /etc/nixos
    sudo nixos-rebuild switch --flake $"/etc/nixos#(hostname)"
}

def nus [--dotfiles] {
    if $dotfiles {
        rm ~/.dotfiles-installed
    }

    nix flake update --flake ~/.config/nixos/
    nh os switch ~/.config/nixos/
}

# Alt+S toggle sudo
$env.config.keybindings ++= [
    {
        name: toggle_sudo
        modifier: alt
        keycode: char_s
        mode: [emacs vi_insert vi_normal]
        event: {
            send: executehostcommand
            cmd: "let cmd = (commandline); commandline edit (if $cmd starts-with 'sudo ' { $cmd | str replace -r '^sudo ' '' } else { 'sudo ' ++ $cmd });"
        }
    }
]
