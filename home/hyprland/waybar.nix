{userpath, ...}: {
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar".source = ../../dots/waybar;
}
