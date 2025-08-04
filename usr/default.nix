{ ... }: {
  imports = [ ./editor ./app ./shell ./wm ];

  home = {
    username = "hex";
    homeDirectory = "/home/hex";
    stateVersion = "25.11";
  };
}
