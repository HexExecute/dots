{
  pkgs,
  username,
  config,
  lib,
  modulesPath,
  ...
}:
let
  vfioIds = [
    "1002:73bf"
    "1002:ab2"
  ];
in
{
  imports = [
    ../common/hardware.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [
        # "vfio_pci"
        # "vfio"
        # "vfio_iommu_type1"
      ];
    };
    kernelModules = [
      "thunderbolt"
      "kvm-amd"
      "amdgpu"
    ];
    kernelParams = [
      "amd_pstate=on"
      # "amd_iommu=force_enable"
      # "iommu=pt"

      # "kvm.ignore_msrs=1"
    ];
    # extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
    extraModulePackages = [ ];
  };

  # # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in aperformant way.
  # systemd.tmpfiles.rules = [
  #   "f /dev/shm/looking-glass 0660 ${username} qemu-libvirtd -"
  # ];

  # # Add virt-manager and looking-glass to use later.
  # environment.systemPackages = with pkgs; [
  #   looking-glass-client
  # ];

  # # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #     # extraConfig = ''
  #     #   user="${username}"
  #     # '';

  #     # Don't start any VMs automatically on boot.
  #     onBoot = "ignore";
  #     # Stop all running VMs on shutdown.
  #     onShutdown = "shutdown";

  #     qemu = {
  #       package = pkgs.qemu_kvm;
  #       runAsRoot = true;
  #       swtpm.enable = true;
  #       # ovmf = {
  #       #   enable = true;
  #       #   packages = [
  #       #     (pkgs.OVMF.override {
  #       #       secureBoot = true;
  #       #       tpmSupport = true;
  #       #     }).fd
  #       #   ];
  #       # };
  #       # verbatimConfig = ''
  #       #    namespaces = []
  #       #   user = "+${builtins.toString config.users.users.${username}.uid}"
  #       # '';
  #     };
  #   };
  #   spiceUSBRedirection.enable = true;
  # };

  # programs = {
  #   dconf.enable = true;
  #   virt-manager.enable = true;
  # };

  # users.users.${username}.extraGroups = [
  #   "qemu-libvirtd"
  #   "libvirtd"
  #   "disk"
  # ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c4316d1a-15bd-4e59-b6ca-9559428ca919";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D2E0-E389";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/910dec94-8710-4244-a61b-3dcdecbe3e81";
    }
  ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
