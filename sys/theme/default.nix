{ pkgs, ... }: {
  imports = [ ./radio.nix ];

  stylix = {
    enable = true;

    polarity = "dark";

    cursor = {
      name = "Adwaita";
      size = 24;

      package = pkgs.adwaita-icon-theme;
    };
  };
}
