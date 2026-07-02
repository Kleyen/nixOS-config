{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kleyen";
        email = "Kleyen@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
