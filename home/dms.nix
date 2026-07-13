{...}: {
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = false;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
