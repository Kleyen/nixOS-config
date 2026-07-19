{...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=12";
        pad = "12x10";
        initial-window-size-chars = "135x35";
      };
      cursor = {
        style = "block";
      };
      colors-dark = {
        alpha = "0.82";
      };
    };
  };
}
