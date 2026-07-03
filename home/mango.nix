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
    };
  };
}
