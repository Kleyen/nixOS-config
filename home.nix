{...}: {
  imports = [
    ./home/packages.nix
    ./home/theming.nix
    ./home/programs.nix
    ./home/ghostty.nix
    ./home/fish.nix
    ./home/neovim.nix
    ./home/hyprland
  ];

  home.username = "denver";
  home.homeDirectory = "/home/denver";

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
