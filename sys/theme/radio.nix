{ pkgs, stylix, ... }: {
  stylix = {
    image = ../../ast/wallpaper/radio.png;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
  };
}
