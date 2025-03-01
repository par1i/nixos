
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl.enable = true;

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false; # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    open = false; # Only available from driver 515.43.04+
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    offload = { 
       enable = true;
       enableOffloadCmd = true;
    };

    # enable sync mode here
    #sync.enable = true;
    
    # CHANGE get your system BusId by running ( lspci ) borrow it by running nix-shell -p pciutils
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}

