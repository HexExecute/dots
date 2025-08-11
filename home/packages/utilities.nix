{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Desktop utilities.
    parabolic
    denaro
    rnote
    resources
    btop

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
