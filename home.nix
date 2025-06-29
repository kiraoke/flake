{
  inputs,
  pkgs,
  pkgs-stable,
  username,
  ...
}: {
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

  home.packages = with pkgs;
    [
      dconf
      qt6ct
      qt6.qtwayland
      pywalfox-native
      easyeffects
      pavucontrol
      brightnessctl
      songrec
      peaclock
      git-lfs
      clang
      lazygit
      nicotine-plus
      inter
      go # the programming language
      mpv
      celluloid
      galaxy-buds-client
      blueman
      bluetui
      podman-desktop
      ncdu
      gpustat
      steam-run-free
      anki-bin

      # cool tool
      fastfetch
      ripgrep
      bat
      brave
      telegram-desktop
      yt-dlp
      ffmpeg
      upscayl
      hyprshot
      qbittorrent
      qalculate-gtk
      vesktop
      yaak
      nasm

      # archives
      zip
      xz
      unzip

      # misc
      file
      tree
      nodejs
      pnpm

      # file managers
      yazi

      btop
      htop

      pywal

      networkmanagerapplet
      swww

    ]
    ++ (with pkgs-stable; [
      kew
      deno
    ]);

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
