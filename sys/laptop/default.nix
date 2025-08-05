{
  imports = [ ../common/default.nix ./hardware.nix ./service ];

  networking.hostName = "hex-laptop";
}
