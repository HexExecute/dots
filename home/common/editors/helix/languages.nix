{ pkgs, ... }:
{
  programs.helix.languages = {
    language-server.rust-analyzer.config.check.command = "clippy";

    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];
  };
}
