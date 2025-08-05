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
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, stylix, caelestia-cli
    , caelestia-shell, ... }@inputs:
    let
      system = "x86_64-linux";

      customPkgs = {
        caelestia-cli = caelestia-cli.packages.${system}.default;
        caelestia-shell = caelestia-shell.packages.${system}.default;
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      makeNixosSystem = hostName: sysFile:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            sysFile
            {
              networking.hostName = hostName;
              virtualisation.vmVariant = {
                virtualisation.memorySize = 4096;
                virtualisation.graphics = true;

                virtualisation.qemu.options = [ "-vga" "qxl" "-display" "sdl" ];

                boot.kernelParams = [ "video=1920x1200" ];
              };
            }

            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                backupFileExtension = "bak";

                users.hex = import ./usr;

                extraSpecialArgs = { inherit inputs customPkgs; };
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
