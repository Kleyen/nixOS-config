{...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/nix.nix
    ./modules/nix-ld.nix
    ./modules/hardware.nix
    ./modules/audio.nix
    ./modules/desktop.nix
    ./modules/services.nix
    ./modules/network.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/shell.nix
    ./modules/qylock.nix
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
