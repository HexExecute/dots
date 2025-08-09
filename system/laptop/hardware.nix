{ config, lib, modulesPath, ... }: {
  imports = [
    ../common/hardware.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "thunderbolt" "amdgpu" ];
      kernelModules = [ ];
    };
    kernelModules = [ "amdgpu" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ebba5dd8-7183-4456-9d9a-77f5b85371de";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/50E0-9B98";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
