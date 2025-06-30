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
    ncdu
    mpv
    blueman
    brightnessctl
    pavucontrol
    steam-run-free
    yt-dlp
    ffmpeg
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
    yaak
    nasm
    nodejs
    pnpm
    deno
  ];

  stable = with pkgs-stable; [
    kew
  ];
in {
  imports = [
    ./home/neovim/init.nix
    ./home/tmux/init.nix
    ./home/hyprland/init.nix
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

  home.packages = systemPackages ++ utils ++ apps ++ dev ++ stable ;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
