{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Core desktop.
    nautilus
    gnome-calculator
    gnome-calendar
    gnome-maps
    gnome-clocks
    gnome-weather
    authenticator
    planify
  ];
}
