{
  description = "Denver's System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/cachix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astronvim-template = {
      url = "github:AstroNvim/template";
      flake = false;
    };
    qylock.url = "github:Darkkal44/qylock";
  };

  nixConfig = {
    extra-substituters = ["https://noctalia.cachix.org"];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    noctalia,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.denver = {
              imports = [
                ./home.nix
                noctalia.homeModules.default
              ];
            };
          }
        ];
      };
    };
  };
}
