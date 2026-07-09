{inputs, ...}: {
  imports = [inputs.qylock.nixosModules.default];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.qylock = {
    enable = true;
    theme = "R1999_1"; # browse themes/ in the repo, swap freely
    sddm.enable = true;
    quickshell.enable = false; # DMS handles the in-session lock instead
  };
}
