{ config, pkgs, ... }:

{
  # Enable Hyprland (Wayland compositor)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable XDG desktop portal for Wayland
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };


  environment.sessionVariables = {
    # enable if cursur becomes invisible
    #WLR_NO_HARDWARE_CURSORS = "1";

    NIXOS_OZONE_WL = "1";
    
   };


}
