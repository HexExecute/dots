{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nh
    nixfmt

    tree
    wget
    ripgrep
    dust
    gnutar
  ];

  programs = {
    nushell = {
      enable = true;
      settings = {
        show_banner = false;
      };
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    git = {
      enable = true;
      # TODO: Make username and email for git modular.
      userName = "HexExecute";
      userEmail = "hex.execute@gmail.com";
    };
    gh.enable = true;

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
