{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.mangowm.hmModules.mango];

  # Create (never overwrite) the files DMS writes appearance/keybind/rule data into.
  # Owned entirely by DMS at runtime — nothing here declares their content.
  home.activation.mangoDmsFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "$HOME/.config/mango/dms"
    touch "$HOME/.config/mango/dms"/{colors,layout,cursor,outputs,windowrules,binds}.conf
  '';

  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      dms run &
      wl-paste --type text --watch cliphist store &
    '';

    settings = {
      # Pull in DMS-managed appearance/binds/rules —
      # Nix does NOT declare these values, DMS Settings does
      source = [
        "~/.config/mango/dms/colors.conf"
        "~/.config/mango/dms/layout.conf"
        "~/.config/mango/dms/cursor.conf"
        "~/.config/mango/dms/outputs.conf"
        "~/.config/mango/dms/windowrules.conf"
        "~/.config/mango/dms/binds.conf"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,mango"
        "XDG_SESSION_TYPE,wayland"
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "QT_QPA_PLATFORMTHEME,gtk3"
      ];

      layerrule = [
        "noanim:1,layer_name:^dms"
      ];

      windowrule = [
        "isnoborder:1,appid:^org\\.gnome\\."
        "isnoborder:1,appid:^org\\.wezfurlong\\.wezterm$"
        "isnoborder:1,appid:^Alacritty$"
        "isnoborder:1,appid:^com\\.mitchellh\\.ghostty$"
        "isnoborder:1,appid:^kitty$"
        "isfloating:1,appid:^org\\.quickshell$"
      ];

      bind = [
        "SUPER,space,spawn,dms ipc call spotlight toggle"
        "SUPER,v,spawn,dms ipc call clipboard toggle"
        "SUPER,m,spawn,dms ipc call processlist focusOrToggle"
        "SUPER,comma,spawn,dms ipc call settings focusOrToggle"
        "SUPER,n,spawn,dms ipc call notifications toggle"
        "SUPER,y,spawn,dms ipc call dankdash wallpaper"
        "SUPER+ALT,l,spawn,dms ipc call lock lock"

        "NONE,XF86AudioRaiseVolume,spawn,dms ipc call audio increment 3"
        "NONE,XF86AudioLowerVolume,spawn,dms ipc call audio decrement 3"
        "NONE,XF86AudioMute,spawn,dms ipc call audio mute"
        "NONE,XF86MonBrightnessUp,spawn,dms ipc call brightness increment 5"
        "NONE,XF86MonBrightnessDown,spawn,dms ipc call brightness decrement 5"

        "SUPER,Return,spawn,ghostty"
        "SUPER,Q,killclient"
        "SUPER,F,togglefullscreen"
        "SUPER,r,reload_config"
      ];
    };
  };
}
