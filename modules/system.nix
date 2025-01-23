{ config, pkgs, ... }:

{

  # Bootloader configuration
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs" "exfat" "vfat"];
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  # nix flakes
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Kernel configuration
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  # CHANGE if you have amd cpu
  hardware.cpu.intel.updateMicrocode = true;
  # hardware.cpu.amd.updateMicrocode = true;

  hardware.enableRedistributableFirmware = true;

  # Thermal management
  services.thermald.enable = true;

  # Power management
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      START_CHARGE_THRESH_BAT0 = 20; # Optional for long-term battery health
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
  
  # ssd optimiztion
  services.fstrim.enable = true;

  # Network configuration
  networking.hostName = "nixos"; # Set your hostname
  networking.networkmanager.enable = true;
 
  # set electro and radar dns
  networking.nameservers = [
  "78.157.42.100"
  "78.157.42.101"  
  "10.202.10.10"
  "10.202.10.11"
  ];
  
  # getting bluetooth working
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Time and locale configuration
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

}

