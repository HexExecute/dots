{
  description = "hex.execute's NixOS config.";

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
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      makeNixosSystem = hostName: sysFile:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            sysFile
            { networking.hostName = hostName; }

            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.hex = import ./usr;
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };
    in {
      nixosConfigurations = {
        hex-laptop = makeNixosSystem "hex-laptop" ./sys/laptop;
        hex-desktop = makeNixosSystem "hex-desktop" ./sys/desktop;
      };
    };
}
