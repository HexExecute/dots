{ stateVersion, username, ... }: {
  imports = [ ./editors ./packages ./shell ./desktop ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}
