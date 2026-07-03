{...}: {
  imports = [
    ./home/packages.nix
    ./home/theming.nix
    ./home/programs.nix
    ./home/dms.nix
    ./home/ghostty.nix
    ./home/fish.nix
    ./home/neovim.nix
    ./home/mango.nix
  ];

  home.username = "denver";
  home.homeDirectory = "/home/denver";

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
