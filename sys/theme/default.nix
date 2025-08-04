{ pkgs, stylix, ... }: {
  imports = [ ./radio.nix ];

  stylix = {
    enable = true;

    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
