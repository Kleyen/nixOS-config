{pkgs, ...}:
# Required for Mason (AstroNvim) to run prebuilt LSP/DAP binaries —
# they're dynamically linked and expect a standard FHS linker path,
# which doesn't exist on NixOS without this.
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    curl
    # add more as other tools need them
  ];
}
