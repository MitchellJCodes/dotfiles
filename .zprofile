if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "$TTY" = "/dev/tty1" ]; then
    exec niri-session -l
fi

