{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Core desktop.
    nautilus
    gvfs

    gnome-calculator
    gnome-calendar
    gnome-maps
    gnome-clocks
    gnome-weather
    authenticator

    # Audio utilities.
    pavucontrol
    wiremix
    alsa-utils
    easyeffects

    # Media utilities.
    gst
    video-trimmer
    loupe
    clapper
    termusic
    decibels

    # Communication
    vesktop

    # Desktop utilities.
    parabolic
    denaro
    rnote
    resources
    btop
    video-trimmer
  ];
}
