{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
    config.common.default = ["hyprland" "gtk"];
    config.common."org.freedesktop.impl.portal.FileChooser" = ["gtk"];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
