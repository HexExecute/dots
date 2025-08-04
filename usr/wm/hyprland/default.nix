{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "[float;tile] ghostty";

      monitor = [ ", preferred, 1920x1200, 1.0" ]; # Laptop default.

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

      bind = [ "$mod, T, exec, $terminal" ];
    };
  };
}
