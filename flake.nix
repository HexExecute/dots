{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      stylix,
      caelestia-cli,
      caelestia-shell,
      zen-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      username = "hex";
      stateVersion = "25.11";

      # nixpkgs = import nixpkgs {
      #   inherit system;
      #   config.allowUnfree = true;
      #   overlays = [ (import ./overlays system inputs) ];
      # };

      makeNixosSystem =
        hostName: systemFile: homeFile:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            systemFile
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = [ (import ./overlays system inputs) ];
              nixpkgs.config.allowUnfree = true;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                users.${username} = import homeFile;
                extraSpecialArgs = {
                  inherit
                    inputs
                    hostName
                    username
                    stateVersion
                    ;
                };
              };
            }
          ];
          specialArgs = {
            inherit
              inputs
              hostName
              username
              stateVersion
              ;
          };
        };
    in
    {
      nixosConfigurations = {
        "${username}-laptop" = makeNixosSystem "${username}-laptop" ./system/laptop ./home/laptop;
        "${username}-desktop" = makeNixosSystem "${username}-desktop" ./system/desktop ./home/desktop;
        "${username}-vm" = makeNixosSystem "${username}-vm" ./system/vm ./home/vm;
      };
    };
}
