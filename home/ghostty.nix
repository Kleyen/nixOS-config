{lib, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dankcolors";
      background-opacity = 0.82;
      window-padding-x = 12;
      window-padding-y = 10;
      font-family = "FiraCode Nerd Font";
      font-size = 12;
      cursor-style = "block";
      window-width = 135;
      window-height = 35;
    };
  };
  # Trialing DMS's own Ghostty config for now — let it own the file directly.
  xdg.configFile."ghostty/config".enable = lib.mkForce false;
}
