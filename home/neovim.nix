{
  inputs,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      lazygit
      fzf
      unzip
      stylua
      imagemagick
      ghostscript
      gcc
      gnumake
    ];
  };

  # This tells Home Manager to symlink the AstroNvim template files into your ~/.config/nvim
  xdg.configFile."nvim" = {
    source = inputs.astronvim-template;
    recursive = true;
  };
}
