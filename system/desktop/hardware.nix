{
  pkgs,
  username,
  config,
  lib,
  modulesPath,
  ...
}:
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
        "vfio_virqfd"
        "vfio_pci"
        "vfio_iommu_type1"
        "vfio"
      ];
    };
    kernelModules = [
      "thunderbolt"
      "kvm-amd"
      "amdgpu"
    ];
    kernelParams = [
      "amd_pstate=active"
      "amd_iommu=on"
      "amd_iommu=pt"
      "kvm.ignore_msrs=1"
    ];
    extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
    extraModulePackages = [ ];
  };

  # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in aperformant way.
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${username} qemu-libvirtd -"
  ];

  # Add virt-manager and looking-glass to use later.
  environment.systemPackages = with pkgs; [
    virt-manager
    looking-glass-client
  ];

  # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        user="${user}"
      '';

      # Don't start any VMs automatically on boot.
      onBoot = "ignore";
      # Stop all running VMs on shutdown.
      onShutdown = "shutdown";

      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = enabled;
        verbatimConfig = ''
           namespaces = []
          user = "+${builtins.toString config.users.users.${username}.uid}"
        '';
      };
    };
  };

  users.users.${username}.extraGroups = [
    "qemu-libvirtd"
    "libvirtd"
    "disk"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/081b3a9b-7b1f-4924-8186-fcb3ad892444";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9137-6C89";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
