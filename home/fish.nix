{...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fastfetch
    '';

    shellAbbrs = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      update = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      gits = "cd /etc/nixos && sudo git add .";
    };
  };
}
