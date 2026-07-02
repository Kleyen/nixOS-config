{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      inter
      fira-code
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif     = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "FiraCode Nerd Font" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
}
