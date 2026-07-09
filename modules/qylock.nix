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
    quickshell.enable = false; # Noctalia owns the in-session lock (SUPER+L -> noctalia msg session lock);
    # qylock's quickshell lockscreen would only fire on top of that — keep this off unless you drop Noctalia's lock too.
  };
}
