{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    config.common.default = "*";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
