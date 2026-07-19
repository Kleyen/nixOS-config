{
  description = "Denver's System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astronvim-template = {
      url = "github:AstroNvim/template";
      flake = false;
    };
    qylock.url = "github:Darkkal44/qylock";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    dms,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          {nixpkgs.hostPlatform = "x86_64-linux";}
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.sharedModules = [
              dms.homeModules.dank-material-shell
            ];
            home-manager.users.denver = {
              imports = [./home.nix];
            };
          }
        ];
      };
    };
  };
}
