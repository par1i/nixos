{ config, pkgs, ... }:

{
 # User configuration please CHANGE the username 
  users.users.parsa = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    packages = with pkgs; [
      firefox      # browser
      nushell      # shell
      starship     # prompt
      fzf          # fuzzy finding
      fd           # find 
      bat
      bottom
      neofetch
      gzip
      neovim
      gnumake
      ripgrep
      tree-sitter 
      zed-editor
      zoxide
      spotify
      lsd
      unzip
      wl-clipboard
      cliphist
      nekoray
      discord
      easyeffects
      lazygit
      gh
      cava
      spacedrive
      obsidian
      motrix

      # dev packages
      gcc
      python312
      lua
      luajit
      typescript-language-server
      bash-language-server
      nodejs_22
    ];
  };


}
