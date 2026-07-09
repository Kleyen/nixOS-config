{ ... }: {
  programs.noctalia.enable = true;

  wayland.windowManager.hyprland.extraConfig = ''
    -- noctalia autostart
    hl.on("hyprland.start", function()
      hl.exec_cmd("noctalia")
    end)

    -- core & navigation
    hl.bind("SUPER + SPACE",  hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
    hl.bind("SUPER + A",      hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
    hl.bind("SUPER + N",      hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"))
    hl.bind("SUPER + L",      hl.dsp.exec_cmd("noctalia msg session lock"))
    hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
    hl.bind("SUPER + W",      hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))
    hl.bind("SUPER + C",      hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))

    -- volume/brightness — locked (works over lockscreen) + repeats on hold
    hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("noctalia msg volume-up"),      { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("noctalia msg volume-down"),    { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("noctalia msg brightness-up"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("noctalia msg brightness-down"), { locked = true, repeating = true })

    -- media/mute — locked, no repeat needed
    hl.bind("XF86AudioMute",    hl.dsp.exec_cmd("noctalia msg volume-mute"), { locked = true })
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("noctalia msg mic-mute"),    { locked = true })
    hl.bind("XF86AudioPlay",    hl.dsp.exec_cmd("noctalia msg media toggle"),   { locked = true })
    hl.bind("XF86AudioNext",    hl.dsp.exec_cmd("noctalia msg media next"),     { locked = true })
    hl.bind("XF86AudioPrev",    hl.dsp.exec_cmd("noctalia msg media previous"), { locked = true })

    -- layer rules
    hl.layer_rule({ match = { namespace = "bar" },           blur = true })
    hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
    hl.layer_rule({ match = { namespace = "system-menu" },   blur = true })
    hl.layer_rule({ match = { namespace = "osd" },           blur = true })
    -- VERIFY: field name for ignorealpha is a guess by analogy to no_anim's naming —
    -- could be `ignorealpha` (unchanged) or `ignore_alpha` (tokenized like no_anim was).
    -- Try this first; if Hyprland logs an unknown-field warning, swap to the other spelling.
    hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 0.2 })

    -- windowrulev2 — none defined yet, add here as hl.window_rule({...}) when needed
  '';
}
