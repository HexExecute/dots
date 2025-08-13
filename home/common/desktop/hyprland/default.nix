{ lib, ... }:
{
  imports = [
    ./keybinds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
    };
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "[float;tile] ghostty";
      "$browser" = "zen";

      monitor = lib.mkDefault [ ", preferred, auto, 1.0" ];

      general = {
        allow_tearing = false;
        layout = "dwindle";

        gaps_in = 10;
        gaps_out = 20;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 8;
          passes = 4;
          noise = 1.5625e-2;
          brightness = 1.0;
          vibrancy = 0.2;
          vibrancy_darkness = 0.0;
        };
      };

      animations = {
        enabled = true;
        animation = [ "workspaces, 1, 5, default, slidevert" ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
        smart_resizing = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      exec-once = [ "caelestia shell" ];

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };
  };
}
