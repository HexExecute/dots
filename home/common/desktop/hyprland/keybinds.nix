{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "us";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad.natural_scroll = true;
      };

      gestures.workspace_swipe = true;

      bind = [
        # Launchers.
        "$mod, A, exec, $terminal"
        "$mod, S, global, caelestia:launcher"
        "$mod, W, exec, $browser"

        # VIM movement keybinds.
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Window controls.
        "$mod, D, killactive"
        "$mod, V, togglefloating"
        "$mod, M, exit"
        "$mod, F, fullscreen"

        # Workspaces.
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
