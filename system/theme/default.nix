{ pkgs, ... }: {
  stylix = {
    enable = true;

    base16Scheme = ../../assets/themes/radio.yaml;
    image = ../../assets/wallpapers/radio.png;
    polarity = "dark";

    cursor = {
      name = "Adwaita";
      size = 24;

      package = pkgs.adwaita-icon-theme;
    };

    opacity = {
      applications = 0.75;
      desktop = 1.0;
      popups = 1.0;
      terminal = 0.75;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
  };
}
