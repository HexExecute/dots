{
  services = {
    dbus.enable = true;
    udev.enable = true;
    displayManager = {
      enable = true;
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
