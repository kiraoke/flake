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
    ./home/fonts.nix
    ./home/fzf.nix
    ./home/git.nix
    ./home/kitty.nix
    ./home/notification.nix
    ./home/theme.nix
    ./home/wireplumber.nix
    ./home/zsh.nix
    ./home/launcher.nix
    inputs.ags.homeManagerModules.default
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
      scrcpy
      android-tools
      inter
      cliphist # needed for fuzzel clipboard search
      go # the programming language
      celluloid
      mpvpaper
      galaxy-buds-client
      blueman
      bluetui
      podman-desktop
      wf-recorder
      firefox
      ncdu

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

      # archives
      zip
      xz
      unzip
      p7zip

      # misc
      which
      file
      tree
      nodejs
      deno
      pnpm

      # file managers
      yazi

      btop
      htop

      pywal

      networkmanagerapplet

      inputs.ags.packages.${pkgs.system}.io
    ]
    ++ (with pkgs-stable; [
      kew
    ]);

  programs.ags = {
    enable = true;

    configDir = ./ags;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      fzf
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
