{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: let
  systemPackages = with pkgs; [
    dconf
    qt6Packages.qt6ct
    qt6.qtwayland
    clang
    networkmanagerapplet
    swww
    pywal
    file
    tree
    git-lfs
    wtype
  ];

  utils = with pkgs; [
    yazi
    btop
    htop
    ripgrep
    bat
    zip
    xz
    unzip
    fastfetch
    gpustat
    gdu
    mpv
    blueman
    brightnessctl
    pavucontrol
    steam-run-free
    yt-dlp
    ffmpeg
    mpvpaper
    sourceHighlight
    openssl
    protonvpn-gui
  ];

  apps = with pkgs; [
    easyeffects
    songrec
    peaclock
    lazygit
    nicotine-plus
    galaxy-buds-client
    celluloid
    vlc
    anki-bin
    brave
    telegram-desktop
    qbittorrent
    qalculate-gtk
    vesktop
    upscayl
    hyprshot
  ];

  dev = with pkgs; [
    go
    podman-desktop
    ghostty
    yaak
    nasm
    nodejs
    pnpm
    deno
    rustup
    jq # json processor
    vscode
    octave
  ];

  i3 = with pkgs; [
    # Essential i3 packages
    i3lock
    i3status-rust
    rofi
    dunst
    picom
    feh

    # System utilities
    xss-lock
    scrot

    # bb
    firefox
  ];

  stable = with pkgs-stable; [
    kew
  ];
in {
  home.packages = systemPackages ++ utils ++ apps ++ dev ++ i3 ++ stable;
}
