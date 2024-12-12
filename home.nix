{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./home/neovim/init.nix
    ./home/hyprland/init.nix
    ./home/btop.nix
    ./home/cava.nix
    ./home/fonts.nix
    ./home/fzf.nix
    ./home/git.nix
    ./home/kitty.nix
    ./home/theme.nix
    ./home/wireplumber.nix
    ./home/zsh.nix
    inputs.ags.homeManagerModules.default
  ];

  home.username = username;
  home.homeDirectory = ''/home/${username}'';

  home.packages = with pkgs; [
    dconf
    qt6ct
    qt6.qtwayland
    pywalfox-native
    xdg-desktop-portal-hyprland
    easyeffects
    lxqt.pavucontrol-qt
    mpv
    brightnessctl
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

    inputs.ags.packages.${pkgs.system}.io
  ];

  programs.ags = {
    enable = true;


    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      fzf
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
