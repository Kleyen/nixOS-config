{pkgs, ...}: {
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
    config.common.default = "*";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
