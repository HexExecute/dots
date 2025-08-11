{
  imports = [
    ./power.nix
    ./audio.nix
    ./gdm.nix
    ./disks.nix
  ];

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
