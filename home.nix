{
  inputs,
  pkgs,
  pkgs-stable,
  username,
  ...
}: let
  systemPackages = with pkgs; [
    dconf
    qt6ct
    qt6.qtwayland
    clang
    networkmanagerapplet
    swww
    pywal
    file
    tree
    git-lfs
    gnome-power-manager
    powertop
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
    protonvpn-gui
    syncthing
  ];

  apps = with pkgs; [
    easyeffects
    songrec
    peaclock
    lazygit
    nicotine-plus
    galaxy-buds-client
    celluloid
    anki-bin
    brave
    telegram-desktop
    qbittorrent
    qalculate-gtk
    vesktop
    upscayl
    hyprshot
    ryujinx-greemdev
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
    jetbrains.rust-rover
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
  imports = [
    ./home/neovim/init.nix
    ./home/hyprland/init.nix
    ./home/i3/init.nix
    ./home/btop.nix
    ./home/cava.nix
    ./home/fzf.nix
    ./home/git.nix
    ./home/kitty.nix
    ./home/notification.nix
    ./home/theme.nix
    ./home/wireplumber.nix
    ./home/zsh.nix
    ./home/launcher.nix
    ./home/zellij.nix
  ];

  home.username = username;
  home.homeDirectory = ''/home/${username}'';

  home.packages = systemPackages ++ utils ++ apps ++ dev ++ i3 ++ stable;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
