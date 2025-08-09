{ pkgs, ... }: {
  home.packages = with pkgs; [ tree wget ripgrep dust ];

  programs = {
    nushell = {
      enable = true;
      settings = { show_banner = false; };
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    git.enable = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;

      settings = {
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };

    direnv = {
      enable = true;
      enableNushellIntegration = true;
    };

    yazi = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
