{
  imports = [ ./languages.nix ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
