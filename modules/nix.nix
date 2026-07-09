{...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    substituters = ["https://noctalia.cachix.org"];
    trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
