{ pkgs, customPkgs, ... }: {
  home.packages = with pkgs; [
    customPkgs.caelestia-shell
    customPkgs.caelestia-cli

    # caelestia-shell dependencies.
    fish
    jq
    fd
    (pkgs.python3.withPackages
      (python-pkgs: with python-pkgs; [ aubio pyaudio numpy ]))
    cava
    bluez
    ddcutil
    brightnessctl
    curl
    material-symbols
    ddcutil
    app2unit
    lm_sensors
    grim
    swappy
    libqalculate
    inotify-tools
    bluez
    bash
    busybox

    # caelestia-cli dependencies.
    swappy
    libnotify
    slurp
    wl-clipboard
    app2unit
    cliphist
    dart-sass
    grim
    fuzzel
    quickshell
    wl-screenrec
  ];

  home.file.".config/caelestia/shell.json".text = builtins.toJSON {
    general.apps = {
      terminal = [ "ghostty" ];
      audio = [ "pavucontrol" ];
    };
    background.enabled = true;
    bar = {
      dragThreshold = 20;
      persistent = true;
      showOnHover = true;
      status = {
        showAudio = true;
        showBattery = true;
        showBluetooth = true;
        showKbLayout = false;
        showNetwork = true;
      };
      workspaces = {
        activeIndicator = true;
        activeLabel = "󰮯 ";
        activeTrail = false;
        label = "  ";
        occupiedBg = false;
        occupiedLabel = "󰮯 ";
        rounded = true;
        showWindows = true;
        shown = 4;
      };
    };
    border = {
      rounding = 10;
      thickness = 10;
    };
    dashboard = {
      mediaUpdateInterval = 500;
      visualiserBars = 45;
    };
    launcher = {
      actionPrefix = ">";
      dragThreshold = 50;
      vimKeybinds = true;
      enableDangerousActions = false;
      maxShown = 8;
      maxWallpapers = 9;
      useFuzzy = {
        apps = true;
        actions = false;
        schemes = false;
        variants = false;
        wallpapers = false;
      };
    };
    lock.maxNotifs = 4;
    notifs = {
      actionOnClick = false;
      clearThreshold = 0.3;
      defaultExpireTimeout = 5000;
      expandThreshold = 20;
      expire = false;
    };
    osd.hideDelay = 2000;
    paths = {
      mediaGif = "root:/assets/bongocat.gif";
      sessionGif = "root:/assets/bongocat.gif";
      wallpaperDir = "${../../../ast/wallpaper}/";
    };
    services = {
      weatherLocation = "10,10";
      useFahrenheit = true;
      useTwelveHourClock = true;
    };
    session = {
      dragThreshold = 30;
      vimKeybinds = true;
      commands = {
        logout = [ "loginctl" "terminate-user" "" ];
        shutdown = [ "systemctl" "poweroff" ];
        hibernate = [ "systemctl" "hibernate" ];
        reboot = [ "systemctl" "reboot" ];
      };
    };
  };
}
