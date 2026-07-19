{pkgs, ...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fastfetch
    '';

    shellAbbrs = {
      rb = "sudo nixos-rebuild switch --flake .#nixos";
      update = "nix flake update";
      gits = "git status";
      ll = "ls -la";
      gc = "git commit -m";
    };

    shellAliases = {
      cat = "bat";
    };

    functions = {
      mkcd = {
        description = "Make a directory and cd into it";
        body = "mkdir -p $argv[1] && cd $argv[1]";
      };

      fish_prompt.body = ''
        set -l last_status $status

        set_color -o white
        echo -n "┌["
        set_color -o yellow
        echo -n $USER
        set_color white
        echo -n "@"
        set_color -o cyan
        echo -n (prompt_hostname)
        set_color white
        echo -n ":"
        set_color -o blue
        echo -n (prompt_pwd)
        set_color -o white
        echo -n "]─["
        set_color green
        echo -n (date "+%I:%M:%S %p")
        set_color -o white
        echo -n "]"
        echo

        echo -n "└"
        if test $last_status -eq 0
          set_color red
        else
          set_color -o red
        end
        echo -n ">"
        set_color white
        echo -n "\$ "
        set_color normal
      '';
    };

    plugins = [
      # Fuzzy history/file/directory search bound to Ctrl+R, Ctrl+F, Alt+C
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }

      # Auto-closes brackets, quotes, parens as you type
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }

      # Desktop notification when a long-running command finishes
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }

      # git + fzf integration: interactive add, checkout, log, stash, etc.
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }

      # Removes failed commands from history automatically
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }

      # Colorizes man pages
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
    ];
  };

  home.packages = with pkgs; [
    fastfetch
    fzf # required by fzf-fish and forgit
    bat # nicer previews inside fzf-fish
  ];
}
