{ pkgs, ... }: {
  home.packages = with pkgs; [ cartridges steam prismlauncher ];
}
