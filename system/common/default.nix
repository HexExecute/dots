{ lib, pkgs, stateVersion, hostName, username, ... }: {
  imports = [ ./hardware.nix ./services ../theme ];

  programs.hyprland.enable = true;

  # Allow unfree packages by default.
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;

    efi.canTouchEfiVariables = true;
  };

  # Quick n' easy internet.
  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # font = "Lat2-Terminus16";
    keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "caps:escape";
  };

  # Enable printing.
  services.printing.enable = true;

  system.stateVersion = stateVersion;

  # The primary user.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "password";
    shell = pkgs.nushell;
  };
}
