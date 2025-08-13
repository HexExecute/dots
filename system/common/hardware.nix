{ pkgs, lib, ... }:
{
  # Enable storage and USB support.
  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
      ];
      kernelModules = [ ];
    };
    kernelModules = [
      "kvm-amd"
      "timer_stats"
      "msr"
    ];
    extraModulePackages = [ ];
    kernelParams = [
      "usbcore.autosuspend=1"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  hardware = {
    # Enable redistributable firmware by default.
    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
    };
  };

  # Set the host platform to a sane default.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
