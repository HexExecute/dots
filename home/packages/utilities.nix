{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop utilities.
    parabolic
    denaro
    resources
    btop

    # Text utilities.
    foliate
    zathura
    rnote

    # Audio utilities.
    pavucontrol
    wiremix
    alsa-utils
    easyeffects

    # Media utilities.
    obs-studio
    gst
    footage
    loupe
    clapper
    termusic
    decibels
    komikku
    krita

    # Tech utilities.
    impression
    coulomb

    # Compatibility utilities.
    bottles
  ];
}
