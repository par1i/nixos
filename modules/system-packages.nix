
{ config, pkgs, ... }:

{

# System packages
  environment.systemPackages = with pkgs; [
    wget        # downalod protocol
    git         # VCS
    hyprland    # window manager
    waybar      # status bar
    rofi-wayland # app lancher
    alacritty   # terminal
    swww        # wallpaper engine
    tmux        # session manager
    mpv         # video player
    oculante # image viewer
  ];

}

