{
  inputs,
  stateVersion,
  username,
  ...
}:
{
  imports = [
    ./editors
    ./packages
    ./shell
    ./desktop

    inputs.zen-browser.homeModules.beta
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}
