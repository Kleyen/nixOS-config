{...}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];
  networking.networkmanager.dns = "none";

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22 80 443 53317];
    allowedUDPPorts = [53317];
    allowedTCPPortRanges = [
      {
        from = 8000;
        to = 8010;
      }
    ];
  };
}
