{
  imports = [
    ../common
    ./hardware.nix
  ];

  virtualisation.vmVariant = {
    virtualisation.memorySize = 8192;
    virtualisation.graphics = true;
  };
}
