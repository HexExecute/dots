{ pkgs, ... }:
{
  imports = [
    ./power.nix
    ./audio.nix
    ./gdm.nix
    ./disks.nix
    ./flatpak.nix
  ];

  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [ polkit_gnome ];

  services.gnome.gnome-keyring.enable = true;
}
