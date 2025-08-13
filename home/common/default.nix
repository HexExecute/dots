{
  config,
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
    ./defaults.nix

    inputs.zen-browser.homeModules.beta
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}
