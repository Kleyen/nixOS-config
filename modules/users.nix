{pkgs, ...}: {
  users.users.denver = {
    isNormalUser = true;
    description = "Denver";
    extraGroups = ["networkmanager" "wheel" "audio" "video"];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz AAAAC3NzaC1lZDI1NTE5AAAAIBrAoNx04ZMqYMdpapTKvdXOUdszI2i0H9UE4o/NORWz denverkleingapayan@gmail.com"
    ];
  };

  security.pam.services.sddm.enableGnomeKeyring = true;

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  environment.sessionVariables = {
    AQ_NO_MODIFIERS = "1";
    AQ_NO_ATOMIC = "1";
  };
}
