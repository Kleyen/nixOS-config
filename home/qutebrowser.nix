{pkgs, ...}: let
  catppuccin-qutebrowser = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "qutebrowser";
    rev = "main";
    hash = "sha256-FmxrgpFlp+cMUdCx5HHIiLMGWML23p+pfxTKT/X0UME=";
  };
in {
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      import catppuccin

      config.load_autoconfig()

      # flavor options: 'mocha', 'macchiato', 'frappe', 'latte'
      # second arg: True = plain menu rows, False = accented
      catppuccin.setup(c, 'mocha', True)
    '';
  };

  xdg.configFile."qutebrowser/catppuccin".source = catppuccin-qutebrowser;
}
