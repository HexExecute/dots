{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
    };
    xwayland.enable = true;

    settings = {
      "$mod" = "CTRL";
      "$terminal" = "[float;tile] ghostty";

      monitor = [ ", 1920x1200, 0x0, 1.0" ]; # Laptop default.

      general = {
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = { enabled = true; };
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

      input = {
        kb_layout = "us";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad.natural_scroll = true;
      };

      gestures.workspace_swipe = true;

      bind = [
        "$mod, R, global, caelestia:launcher"
        "$mod, T, exec, $terminal"
        "$mod, C, killactive"
        "$mod, V, togglefloating"
        "$mod, M, exit"
      ];

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      exec-once = [ "caelestia shell" ];
    };
  };
}
