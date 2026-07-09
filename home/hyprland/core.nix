{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";



    extraConfig = ''
      -- plain key=value blocks translate fine, kept as one hl.config() call
      hl.config({
        input = {
          kb_layout = "us",
          follow_mouse = 1,
          numlock_by_default = true, -- required — without this, KP_1..KP_9 send KP_End/KP_Down/etc instead
        },
        general = {
          gaps_in = 4,
          gaps_out = 8,
          border_size = 2,
          layout = "dwindle",
          resize_on_border = true,
          allow_tearing = false,
          -- col.active_border / col.inactive_border intentionally unset —
          -- theming.nix (matugen) owns these if you're templating hyprland colors there.
          -- NOTE: if matugen templates a raw hyprlang snippet and you `source =` it in,
          -- that stops working once this file is Lua — Lua's require() only loads .lua
          -- chunks, there's no more mixing in a raw hyprlang include. That snippet will
          -- need to emit a valid Lua hl.config({...}) call instead.
        },
        decoration = {
          rounding = 8,
          blur = {
            enabled = true,
            size = 6,
            passes = 3,
            vibrancy = 0.17,
          },
        },
        dwindle = {
          preserve_split = true,
        },
        misc = {
            disable_hyprland_logo = true,
            disable_splash_rendering = true,
            focus_on_activate = true,
          },
        })
        
        hl.config({
          debug = {
            vfr = true,
          },
        })
      -- monitor: needs its own function call, not a settings string
      -- VERIFY field names against your LSP stubs (/usr/share/hypr/stubs/) — "output"
      -- is confirmed required, but I can't confirm the wildcard-all-monitors spelling
      hl.monitor({ output = "*", mode = "preferred", position = "auto", scale = "auto" })

      -- animations
      hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
      hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" });
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier",  style = "popin 80%" });
      hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "myBezier" });
      hl.animation({ leaf = "fade",       enabled = true, speed = 7, bezier = "myBezier" });
      hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "myBezier" });

      local mainMod = "SUPER"

      -- apps / window state
      hl.bind(mainMod .. " + RETURN",       hl.dsp.exec_cmd("ghostty"))
      hl.bind(mainMod .. " + Q",            hl.dsp.window.close())
      hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exit()) -- if you run under UWSM, prefer hl.dsp.exec_cmd("uwsm stop") instead — see note below
      hl.bind(mainMod .. " + V",            hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + P",            hl.dsp.window.pseudo())
      hl.bind(mainMod .. " + F",            hl.dsp.window.fullscreen()) -- VERIFY: args unconfirmed, old dispatcher took a 0/1/2 mode
      hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit")) -- dwindle only

      -- focus movement
      hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
      hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
      hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

      -- move window — VERIFY: direction-based window.move is inferred by analogy to
      -- focus({direction=...}), not from a confirmed example
      hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
      hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
      hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
      hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

      -- workspace switching + move-to-workspace, numpad (KP_1..KP_9, KP_0 = 10)
      for i = 1, 10 do
        local key = "KP_" .. (i % 10)
        hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
      end

      -- scroll through workspaces — VERIFY: mouse_down/mouse_up key-name spelling in
      -- Lua's key parser isn't confirmed by anything I found; test this pair specifically
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

      -- mouse move/resize — confirmed directly from the official example config
      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
    '';
  };
}
