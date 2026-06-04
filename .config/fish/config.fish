if status is-interactive
    # Commands to run in interactive sessions can go here

    alias ls "eza --icons --color=never"
    alias ll "eza -l --icons --color=never"
    alias la "eza -la --icons --color=never"

    alias yeet "paru -Rns"
    alias .. "cd .."
    alias ff fastfetch
end

set -g fish_greeting

if status is-interactive
    starship init fish | source
end

if status is-login
    if test (tty) = /dev/tty1
        exec niri
    end
end
