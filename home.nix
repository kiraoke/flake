{
  config,
  pkgs,
  pkgs-stable,
  lib,
  nixvim,
  inputs,
  ...
}: {
  imports = [
    ./home/neovim/init.nix
    ./home/hyprland/init.nix
    ./home/btop.nix
    ./home/fonts.nix
    ./home/fzf.nix
    ./home/git.nix
    ./home/kitty.nix
    ./home/theme.nix
    ./home/wireplumber.nix
    ./home/zsh.nix
  ];

  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

  home.packages =
    (with pkgs; [
      dconf
      qt6ct
      qt6.qtwayland
      pywalfox-native
      xdg-desktop-portal-hyprland
      easyeffects
      eza
      lxqt.pavucontrol-qt
      mpv
      brightnessctl
      spotube
      songrec
      peaclock

      # cool tool
      fastfetch
      ripgrep
      bat
      pipes-rs
      brave
      telegram-desktop
      yt-dlp
      ffmpeg
      upscayl
      hyprshot
      protonvpn-gui
      qbittorrent
      fast-cli
      audacious
      vesktop
      qalculate-gtk

      # archives
      zip
      xz
      unzip
      p7zip

      # misc
      which
      file
      tree
      vlc
      nodejs_22
      pnpm

      # file managers
      yazi

      btop
      htop

      pywal

      networkmanagerapplet
    ])
    ++ [pkgs-stable.cava];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
