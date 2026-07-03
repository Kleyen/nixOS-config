{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      font-size = 12;

      window-decoration = false;
      window-padding-x = 12;
      window-padding-y = 12;
      window-width = 135;
      window-height = 35;
      background-opacity = 0.8;
      background-blur-radius = 32;

      cursor-style = "block";
      cursor-style-blink = true;

      scrollback-limit = 3023;

      mouse-hide-while-typing = true;
      copy-on-select = false;
      confirm-close-surface = false;

      app-notifications = "no-clipboard-copy,no-config-reload";

      keybind = [
        "ctrl+shift+n=new_window"
        "ctrl+t=new_tab"
        "ctrl+plus=increase_font_size:1"
        "ctrl+minus=decrease_font_size:1"
        "ctrl+zero=reset_font_size"
        "shift+enter=text:\\n"
      ];

      unfocused-split-opacity = 0.7;
      unfocused-split-fill = "#44464f";

      gtk-titlebar = false;
      gtk-single-instance = true;

      shell-integration = "detect";
      shell-integration-features = "cursor,sudo,title,no-cursor";

      theme = "dankcolors";
    };
  };
}
