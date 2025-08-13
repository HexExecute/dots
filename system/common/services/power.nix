{
  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Fix mouse and keyboard going to sleep.
  systemd.services.usb-autosuspend-disable = {
    description = "Disable USB autosuspend for all devices.";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /bin/sh -c 'for f in /sys/bus/usb/devices/*/power/control; do echo on > "$f"; done'
      '';
    };
  };
}
