{
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
    ./home/neovim/init.nix
    ./home/hyprland/init.nix
    ./home/i3/init.nix
    ./home/btop.nix
    ./home/cava.nix
    ./home/fzf.nix
    ./home/git.nix
    ./home/kitty.nix
    ./home/notification.nix
    ./home/packages.nix
    ./home/theme.nix
    ./home/wireplumber.nix
    ./home/zen.nix
    ./home/zsh.nix
    ./home/launcher.nix
    ./home/zellij.nix
  ];

  home.username = username;
  home.homeDirectory = ''/home/${username}'';

  home.file.".config/yt-dlp/config".source = ./dots/yt-dlp.config;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
