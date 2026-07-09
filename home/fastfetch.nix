{...}: {
  programs.fastfetch = {
    enable = true;

    settings = let
      esc = builtins.fromJSON ''"\u001b"'';
    in {
      display = {
        key = {
          width = 10;
        };
        size = {
          binaryPrefix = "jedec";
        };
        separator = "";
      };

      logo = {
        type = "kitty";
        source = "~/Pictures/logos/nixos-white.png";
        width = 30;
        height = 15;
      };

      modules = [
        "break"
        {
          type = "os";
          key = "os";
          keyColor = "yellow";
          format = "{name}";
        }
        {
          type = "command";
          key = "age";
          keyColor = "cyan";
          text = ''echo "$(( ($(date +%s) - $(stat -c %Y /etc/machine-id)) / 86400 )) days"'';
        }
        {
          type = "kernel";
          key = "ker";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "pkgs";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "sh";
          keyColor = "blue";
          format = "{pretty-name}";
        }
        {
          type = "wm";
          key = "wm";
          keyColor = "red";
          format = "{pretty-name}";
        }
        {
          type = "uptime";
          key = "up";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "cpu";
          keyColor = "red";
          format = "{name} @ {freq-max}";
        }
        {
          type = "memory";
          key = "ram";
          keyColor = "yellow";
          format = "{used} / {total}";
        }
        {
          type = "disk";
          key = "disk";
          keyColor = "cyan";
          folders = ["/"];
          format = "{size-used} / {size-total}";
        }
        "break"
        {
          type = "custom";
          format = "${esc}[33m󰮯 ${esc}[32m󰊠 ${esc}[34m󰊠 ${esc}[31m󰊠 ${esc}[36m󰊠 ${esc}[35m󰊠 ${esc}[37m󰊠 ${esc}[97m󰊠";
        }
      ];
    };
  };
}
