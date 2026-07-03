{inputs, ...}: {
  imports = [inputs.mangowm.nixosModules.mango];

  programs.mango = {
    enable = true;
    addLoginEntry = true; # adds "mango" as a selectable session in SDDM, alongside Hyprland
  };

  # Only uncomment if DMS isn't already enabled via your Hyprland setup —
  # it's one system-wide service, not per-compositor
  # programs.dms-shell.enable = true;
}
