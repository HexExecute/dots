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

      input = {
        kb_layout = "us";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad.natural_scroll = true;
      };

      gestures.workspace_swipe = true;

      bind = [
        # Launchers.
        "$mod, R, global, caelestia:launcher"
        "$mod, T, exec, $terminal"

        # VIM movement keybinds.
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Window controls.
        "$mod, C, killactive"
        "$mod, V, togglefloating"
        "$mod, M, exit"
        "$mod, F, fullscreen"
      ];

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      exec-once = [ "caelestia shell" ];

      workspace = [ "w[tv1], gapsout:0, gapsin:0" "f[1], gapsout:0, gapsin:0" ];
    };
  };
}
