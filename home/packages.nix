{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    ghostty
    firefox
    brave
    obsidian
    bibata-cursors
    fastfetch
    micro
    kew
    zed-editor
    gthumb
    celluloid
    parabolic
    telegram-desktop
    nixd
    alejandra
    cmatrix
    btop
    flatpak
    dnsutils
    nautilus
    gnome-autoar
    file-roller
    sushi
    nodejs
    localsend
    tree
    motrix
    grc
    upscaler

    # neovim
    python3
    gdu
  ];
}
